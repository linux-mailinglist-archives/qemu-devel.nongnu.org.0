Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF13304EBB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 02:29:26 +0100 (CET)
Received: from localhost ([::1]:60472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ze8-0000AO-Ss
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 20:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1l4ZcE-0008B0-Gc; Tue, 26 Jan 2021 20:27:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1l4ZcC-0006o3-MU; Tue, 26 Jan 2021 20:27:26 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10R13RKn174841; Tue, 26 Jan 2021 20:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : reply-to :
 cc : subject : date : message-id : in-reply-to : references : mime-version
 : content-transfer-encoding : content-type; s=pp1;
 bh=NUag/5GCYcH6fH9mW14nvMothi0qqur2vMkHYiVT78w=;
 b=C4leK1b8jqiugnLcKZSdf3JCZkubdfUDQRzYLGFvj/msB3ir7AJCKGg8YvbJvkAQPtUo
 f+3eMIHvTDGc9QUNiWyjF7+OWRwSJgNWr/cRk/GV6CVmfya57sPCWkXaUTKkscvmXEeE
 njrZHtLISIycHA241QOx7JqrAvkNK7muLVf7uYHHxdeSUEvgMfjEtm1CjVJX2GyNm6KN
 agNq25Lz8+z2G42J5hGneAo+wFUZy/6XYjtwzod+iabbG8LBq5o6QenpKkbRtmHA2ZPB
 gDdokm3VVYnuQW5a51kE4CL/8LBDXAg9DqMRuzdXQ5I8058AE1a1iL0Wa9rfTGasSYoj ew== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36awjk9407-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 20:27:16 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10R1BcKi028237;
 Wed, 27 Jan 2021 01:27:15 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 36a8uh7b6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 01:27:15 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10R1RFhL30015942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 01:27:15 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73454112062;
 Wed, 27 Jan 2021 01:27:15 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0CAF112061;
 Wed, 27 Jan 2021 01:27:12 +0000 (GMT)
Received: from localhost (unknown [9.160.83.115])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 27 Jan 2021 01:27:12 +0000 (GMT)
From: Murilo Opsfelder =?ISO-8859-1?Q?Ara=FAjo?= <muriloo@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org
Subject: Re: [PATCH 3/7] ppc/pnv: Use skiboot addresses to load kernel and
 ramfs
Date: Tue, 26 Jan 2021 22:27:09 -0300
Message-ID: <4677115.31r3eYUQgx@kermit.br.ibm.com>
Organization: IBM
In-Reply-To: <20210126171059.307867-4-clg@kaod.org>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-4-clg@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_11:2021-01-26,
 2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 clxscore=1011 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270002
Received-SPF: pass client-ip=148.163.158.5; envelope-from=muriloo@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: muriloo@linux.ibm.com
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bonjour, C=E9dric.

On Tuesday, January 26, 2021 2:10:55 PM -03 C=E9dric Le Goater wrote:
> The current settings are useful to load large kernels (with debug) but
> it moves the initrd image in a memory region not protected by
> skiboot. If skiboot is compiled with DEBUG=3D1, memory poisoning will
> corrupt the initrd.
>=20
> Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>=20
>  If we want to increase the kernel size limit as commit b45b56baeecd
>  ("ppc/pnv: increase kernel size limit to 256MiB") intented to do, I
>  think we should add a machine option.

Is this a problem on bare-metal as well?

I'm wondering if we should address this the other way around by increasing
KERNEL_LOAD_SIZE and INITRAMFS_LOAD_SIZE in skiboot to accomodate large ker=
nel
and initramfs images.

I think Linux debuginfo images won't get smaller with time and, assuming th=
is
also happens on bare-metal (I haven't verified), updating skiboot looks more
appropriate.

Bear in mind that I'm not an skiboot expert, I'm just considering the
possibilities.

>=20
>  hw/ppc/pnv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 14fc9758a973..e500c2e2437e 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -65,9 +65,9 @@
>  #define FW_MAX_SIZE             (16 * MiB)
>=20
>  #define KERNEL_LOAD_ADDR        0x20000000
> -#define KERNEL_MAX_SIZE         (256 * MiB)
> -#define INITRD_LOAD_ADDR        0x60000000
> -#define INITRD_MAX_SIZE         (256 * MiB)
> +#define KERNEL_MAX_SIZE         (128 * MiB)
> +#define INITRD_LOAD_ADDR        0x28000000
> +#define INITRD_MAX_SIZE         (128 * MiB)
>=20
>  static const char *pnv_chip_core_typename(const PnvChip *o)
>  {

Cheers!

=2D-=20
Murilo


