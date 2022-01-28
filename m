Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE54B49FBF0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 15:44:47 +0100 (CET)
Received: from localhost ([::1]:50068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSUY-0004LN-Md
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 09:44:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDSHP-00080f-0s; Fri, 28 Jan 2022 09:31:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25020
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDSHE-0004fq-DL; Fri, 28 Jan 2022 09:31:10 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SED85Y011804; 
 Fri, 28 Jan 2022 14:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=5GBVc2qgAKTTQDZzY/n1p70ZQWcngiMSxtySOYoLxgU=;
 b=gJXRe1JQkAFuaFiOM4Dnk7DkdzmWhRFuRvlpxWLAlD8XufEMf+hZ6tg60ewSZUIE3MNs
 SOoN4fX8+9ez7MkMs8fAUqm2+ozyKVmGAXsu7htcbrucaqJlaoV/BK1Qcw/0UtQ0sVuO
 Fh2bO/91x/CXyToiRkqrVv71sbuPsLhgNdSmBARy1uruJ98ARDXskCPsYa4hQW8cRikj
 vFgrvRIGUPlhvW42EZkd4gaeVqa0Sdsjv4T/UWMlrq7mquWD1xppWDlFGF7bDlzTwjlw
 nQfjXxlV1UCuKRVS7z0SbgKWQOZm9T8WH9vXYdT19/ZYmQNBIC2gk6AL/dqnmpui/+KW fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dvj240ahv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 14:29:59 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20SED03B007980;
 Fri, 28 Jan 2022 14:29:59 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dvj240ahn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 14:29:59 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SER0wb002451;
 Fri, 28 Jan 2022 14:29:58 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3dr9jdg7vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 14:29:58 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20SETus514615090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 14:29:56 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74438BE058;
 Fri, 28 Jan 2022 14:29:56 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C26BCBE079;
 Fri, 28 Jan 2022 14:29:55 +0000 (GMT)
Received: from localhost (unknown [9.211.66.85])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 28 Jan 2022 14:29:55 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: Remove support for the PowerPC 602 CPU
In-Reply-To: <20220128131227.199226-1-clg@kaod.org>
References: <20220128131227.199226-1-clg@kaod.org>
Date: Fri, 28 Jan 2022 11:29:53 -0300
Message-ID: <874k5odjby.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YcnpNYoO1o2eGaayLgW8xCbim9X2uXFG
X-Proofpoint-GUID: YM7JvPTsuvz_zivGyLGknANlIA9SSdPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_04,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280090
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> The 602 was derived from the PowerPC 603, for the gaming market it
> seems. It was hardly used and no firmware supporting the CPU could be
> found. Drop support.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  target/ppc/cpu-models.h      |   1 -
>  target/ppc/cpu.h             |   2 -
>  target/ppc/helper.h          |   1 -
>  target/ppc/cpu-models.c      |   2 -
>  target/ppc/cpu_init.c        | 145 -----------------------------------
>  target/ppc/excp_helper.c     |   1 -
>  target/ppc/int_helper.c      |  21 -----
>  target/ppc/mfrom_table_gen.c |  34 --------
>  target/ppc/translate.c       |  30 --------
>  target/ppc/mfrom_table.c.inc |  78 -------------------
>  10 files changed, 315 deletions(-)
>  delete mode 100644 target/ppc/mfrom_table_gen.c
>  delete mode 100644 target/ppc/mfrom_table.c.inc
>
> diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
> index bf1dc7e5ca3d..612978a3fbd2 100644
> --- a/target/ppc/cpu-models.h
> +++ b/target/ppc/cpu-models.h
> @@ -208,7 +208,6 @@ enum {
>      CPU_POWERPC_601_v0             =3D 0x00010001,
>      CPU_POWERPC_601_v1             =3D 0x00010001,
>      CPU_POWERPC_601_v2             =3D 0x00010002,
> -    CPU_POWERPC_602                =3D 0x00050100,
>      CPU_POWERPC_603                =3D 0x00030100,
>      CPU_POWERPC_603E_v11           =3D 0x00060101,
>      CPU_POWERPC_603E_v12           =3D 0x00060102,
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 66e13075c3df..b9119479958c 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h

In cpu.h you could probably remove the MSR_AP and MSR_SA bit definitions
as well. And the code in ppc_cpu_reset that sets them.

> @@ -2142,8 +2142,6 @@ enum {
>      PPC_MFTB           =3D 0x0000000000000200ULL,
>=20=20
>      /* Fixed-point unit extensions                                      =
     */
> -    /*   PowerPC 602 specific                                           =
     */
> -    PPC_602_SPEC       =3D 0x0000000000000400ULL,
>      /*   isel instruction                                               =
     */
>      PPC_ISEL           =3D 0x0000000000000800ULL,
>      /*   popcntb instruction                                            =
     */

...

> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 9bc327bcba5a..d7765fd3e3d8 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -488,27 +488,6 @@ target_ulong helper_divso(CPUPPCState *env, target_u=
long arg1,
>      }
>  }
>=20=20
> -/***********************************************************************=
******/
> -/* 602 specific instructions */
> -/* mfrom is the most crazy instruction ever seen, imho ! */

How do you have the heart to remove the "most crazy instruction ever
seen"?

> -/* Real implementation uses a ROM table. Do the same */
> -/*
> - * Extremely decomposed:
> - *                      -arg / 256
> - * return 256 * log10(10           + 1.0) + 0.5
> - */
> -#if !defined(CONFIG_USER_ONLY)
> -target_ulong helper_602_mfrom(target_ulong arg)
> -{
> -    if (likely(arg < 602)) {
> -#include "mfrom_table.c.inc"
> -        return mfrom_ROM_table[arg];
> -    } else {
> -        return 0;
> -    }
> -}
> -#endif

