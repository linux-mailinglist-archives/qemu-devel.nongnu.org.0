Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B175305A7A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 12:59:32 +0100 (CET)
Received: from localhost ([::1]:46358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4jTu-0001lx-KH
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 06:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1l4jST-0001Gn-Ig; Wed, 27 Jan 2021 06:58:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50288
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1l4jSR-00071K-Ot; Wed, 27 Jan 2021 06:58:01 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10RBWmuv186483; Wed, 27 Jan 2021 06:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : reply-to :
 cc : subject : date : message-id : in-reply-to : references : mime-version
 : content-transfer-encoding : content-type; s=pp1;
 bh=YQhmaU8nvfctC+bCqfBdyJMiuJ86jtb6C3kVgFC7KH0=;
 b=Rt7iCi40KMipt+P8nfMDRFV/Komx7wo71qu/+StWXFnRIc2xMK+Od0YOi/UISRc4WOwg
 PycdCCNThmhxGVJhS0XYgdwFRw/hZyo4NxrEzK+Jt6Ej0BEjjf0W7fut9E3R2OweU1zi
 x+fY0S5hmB1CJC1JP+WPJO/XtqOdrsCHt7V22eLOZ5LtpGhpYOLNtnL/vCMLb4FT/RfL
 GY85U7mDTPfnc6GSKzlF8yGMIqfGOWVSQ5/kXOj54kGb6YosO47bOG6e3l22P5tnvQwX
 Dw10PfwJkpOpYfVc1NCiopA6xK1jpkf3ISCWQTmercIqk83pl86bvxKN0etTt3R44nl1 mw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36b5aw456h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 06:57:46 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10RBuhCD022667;
 Wed, 27 Jan 2021 11:57:45 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 36a4mbxy73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 11:57:45 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10RBviHB42008922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 11:57:44 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA17AAC05B;
 Wed, 27 Jan 2021 11:57:44 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD9E5AC059;
 Wed, 27 Jan 2021 11:57:43 +0000 (GMT)
Received: from localhost (unknown [9.160.123.40])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 27 Jan 2021 11:57:43 +0000 (GMT)
From: Murilo Opsfelder =?ISO-8859-1?Q?Ara=FAjo?= <muriloo@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org
Subject: Re: [PATCH 3/7] ppc/pnv: Use skiboot addresses to load kernel and
 ramfs
Date: Wed, 27 Jan 2021 08:57:41 -0300
Message-ID: <11686843.O9o76ZdvQC@kermit.br.ibm.com>
Organization: IBM
In-Reply-To: <20210126171059.307867-4-clg@kaod.org>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-4-clg@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_04:2021-01-27,
 2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270059
Received-SPF: pass client-ip=148.163.158.5; envelope-from=muriloo@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

On Tuesday, January 26, 2021 2:10:55 PM -03 C=E9dric Le Goater wrote:
> The current settings are useful to load large kernels (with debug) but
> it moves the initrd image in a memory region not protected by
> skiboot. If skiboot is compiled with DEBUG=3D1, memory poisoning will
> corrupt the initrd.
>
> Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

> ---
>
>  If we want to increase the kernel size limit as commit b45b56baeecd
>  ("ppc/pnv: increase kernel size limit to 256MiB") intented to do, I
>  think we should add a machine option.
>
>  hw/ppc/pnv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 14fc9758a973..e500c2e2437e 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -65,9 +65,9 @@
>  #define FW_MAX_SIZE             (16 * MiB)
>
>  #define KERNEL_LOAD_ADDR        0x20000000
> -#define KERNEL_MAX_SIZE         (256 * MiB)
> -#define INITRD_LOAD_ADDR        0x60000000
> -#define INITRD_MAX_SIZE         (256 * MiB)
> +#define KERNEL_MAX_SIZE         (128 * MiB)
> +#define INITRD_LOAD_ADDR        0x28000000
> +#define INITRD_MAX_SIZE         (128 * MiB)
>
>  static const char *pnv_chip_core_typename(const PnvChip *o)
>  {


=2D-
Murilo


