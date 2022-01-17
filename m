Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7874909F1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 15:07:40 +0100 (CET)
Received: from localhost ([::1]:36462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Sfb-000663-69
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 09:07:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9RjQ-0007LH-DN; Mon, 17 Jan 2022 08:07:32 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9RjO-0005hx-3L; Mon, 17 Jan 2022 08:07:32 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HBRa8H006815; 
 Mon, 17 Jan 2022 13:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=o+4Qad15NB+euyzqH0gSUdw3xUbDrUvcs0CzxlOVwqI=;
 b=BNiYsWm7qtmOoVrs8QEkqFZ9OuMdLJRaJWL30Ml+6MMIUmJ3kb/zLv7F7g0BbQezVRpM
 3/7I+G5pDTNoN+Zcd9l2WjM56taOOfstJJfOjgUdj9gkvlyBt2nQm5s2O/yHlVOxJQOq
 hqcBNs3NJw5wDh6E6tbfmJh+35tlfHgPHcR0mOG9zzLGySB3n8DzOvPYuS4dCAoIWwdN
 r526LdfY2nS9O0fLqZrq+UYH2UfdfilvkseuA/9B76Evy77Nl4xF4+KamqpCsgTX73PP
 iXkW8L2QroTQRQftgu9uZiw/kLCvBlguidmMQ0OGHZDcdxqjAKLRvJggikH/MRNaj6Y+ SA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn7krsx6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 13:07:19 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20HD350l009140;
 Mon, 17 Jan 2022 13:07:18 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 3dknwampqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 13:07:18 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20HD7Fan29491616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 13:07:15 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 800DF7808A;
 Mon, 17 Jan 2022 13:07:15 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC37178060;
 Mon, 17 Jan 2022 13:07:14 +0000 (GMT)
Received: from localhost (unknown [9.211.141.90])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 17 Jan 2022 13:07:14 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: Fix 7748 support
In-Reply-To: <20220117092555.1616512-1-clg@kaod.org>
References: <20220117092555.1616512-1-clg@kaod.org>
Date: Mon, 17 Jan 2022 10:07:12 -0300
Message-ID: <87r196wlxb.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8tcngkDf9w5D1cQtYns7h8LtzWiUUgyA
X-Proofpoint-GUID: 8tcngkDf9w5D1cQtYns7h8LtzWiUUgyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_05,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 mlxlogscore=974
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201170084
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> The 7448 CPU is an evolution of the PowerPC 7447A and the last of the
> G4 family. Change its family to reflect correctly its features. This
> fixes Linux boot.
>
> Cc: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/cpu-models.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> index 96fec9c2e501..764afe5a2afb 100644
> --- a/target/ppc/cpu-models.c
> +++ b/target/ppc/cpu-models.c
> @@ -636,13 +636,13 @@
>                  "PowerPC 7410 v1.3 (G4)")
>      POWERPC_DEF("7410_v1.4",     CPU_POWERPC_7410_v14,               741=
0,
>                  "PowerPC 7410 v1.4 (G4)")
> -    POWERPC_DEF("7448_v1.0",     CPU_POWERPC_7448_v10,               740=
0,
> +    POWERPC_DEF("7448_v1.0",     CPU_POWERPC_7448_v10,               744=
5,
>                  "PowerPC 7448 v1.0 (G4)")
> -    POWERPC_DEF("7448_v1.1",     CPU_POWERPC_7448_v11,               740=
0,
> +    POWERPC_DEF("7448_v1.1",     CPU_POWERPC_7448_v11,               744=
5,
>                  "PowerPC 7448 v1.1 (G4)")
> -    POWERPC_DEF("7448_v2.0",     CPU_POWERPC_7448_v20,               740=
0,
> +    POWERPC_DEF("7448_v2.0",     CPU_POWERPC_7448_v20,               744=
5,
>                  "PowerPC 7448 v2.0 (G4)")
> -    POWERPC_DEF("7448_v2.1",     CPU_POWERPC_7448_v21,               740=
0,
> +    POWERPC_DEF("7448_v2.1",     CPU_POWERPC_7448_v21,               744=
5,
>                  "PowerPC 7448 v2.1 (G4)")
>      POWERPC_DEF("7450_v1.0",     CPU_POWERPC_7450_v10,               745=
0,
>                  "PowerPC 7450 v1.0 (G4)")

