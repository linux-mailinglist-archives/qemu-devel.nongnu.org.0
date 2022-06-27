Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD855BB61
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 19:52:24 +0200 (CEST)
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5suM-0007zG-To
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 13:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o5ssC-0006S4-98; Mon, 27 Jun 2022 13:50:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24526
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o5ss7-0007Ps-TL; Mon, 27 Jun 2022 13:50:07 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RGrDFe017903;
 Mon, 27 Jun 2022 17:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=d/m5UATUHVtyAa0xHbxDOgI1f0OxqwxdusO8a4nJ3DQ=;
 b=JX45T4vfdPdOX6/LZ0rrHEpOrvLJXYhCGfQ7BA8pzLiZhF31J/Z1Q7cOVJVZ7fOQHqLW
 TCfslxoF319yoOugzwNAdnTGn2ed+HK6tSLPY5W7ydlHFnBN+bIsIwlzbp9qla97YWWj
 VBEDEgkpYem4ro1j1xeJTZs+0BtyKlmX0i7LuhKgSZT/pMKJvrdDXeCnI3T83/cC9xWL
 SHfsTldjjC5DuQiUTZr9EKppASklMX3YCSFs1QpBtzMaNa+TWI1/8A883wZJXeGCERJz
 ey6B8P2+Yt50opLwJ69QkWoN9hr80BwIt+SSTnWi0MfvYnQH+pedsSGy3+S/KoTDaa9g IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gygfe1qs5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 17:49:47 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25RHj6BJ005117;
 Mon, 27 Jun 2022 17:49:46 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gygfe1qrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 17:49:46 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RHZ26w031761;
 Mon, 27 Jun 2022 17:49:45 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3gwt095w2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 17:49:45 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25RHniUd28705208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jun 2022 17:49:45 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4C42112063;
 Mon, 27 Jun 2022 17:49:44 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 291FA112064;
 Mon, 27 Jun 2022 17:49:44 +0000 (GMT)
Received: from localhost (unknown [9.160.85.246])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 27 Jun 2022 17:49:43 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, laurent@vivier.eu, Matheus Ferst
 <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH 3/6] target/ppc: remove mfdcrux and mtdcrux
In-Reply-To: <20220627141104.669152-4-matheus.ferst@eldorado.org.br>
References: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
 <20220627141104.669152-4-matheus.ferst@eldorado.org.br>
Date: Mon, 27 Jun 2022 14:49:42 -0300
Message-ID: <874k06ate1.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Xpyk65_5cK_INYufqZQKck7ivPSpp1Fg
X-Proofpoint-GUID: 7G5LSaNadfaZByMCJnMAUsh50aDt7uvs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=822 mlxscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206270071
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> The only PowerPC implementations with these insns were the 460 and 460F,
> which had their definitions removed in [1].
>
> [1] 7ff26aa6c657 ("target/ppc: Remove unused PPC 460 and 460F definitions")
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/cpu.h       |  6 ++----
>  target/ppc/translate.c | 18 ------------------
>  2 files changed, 2 insertions(+), 22 deletions(-)
>
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 6d78078f37..80664446e6 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2203,8 +2203,6 @@ enum {
>      PPC_DCR            = 0x1000000000000000ULL,
>      /* DCR extended accesse                                                  */
>      PPC_DCRX           = 0x2000000000000000ULL,
> -    /* user-mode DCR access, implemented in PowerPC 460                      */
> -    PPC_DCRUX          = 0x4000000000000000ULL,
>      /* popcntw and popcntd instructions                                      */
>      PPC_POPCNTWD       = 0x8000000000000000ULL,
>  
> @@ -2228,8 +2226,8 @@ enum {
>                          | PPC_405_MAC | PPC_440_SPEC | PPC_BOOKE \
>                          | PPC_MFAPIDI | PPC_TLBIVA | PPC_TLBIVAX \
>                          | PPC_4xx_COMMON | PPC_40x_ICBT | PPC_RFMCI \
> -                        | PPC_RFDI | PPC_DCR | PPC_DCRX | PPC_DCRUX \
> -                        | PPC_POPCNTWD | PPC_CILDST)
> +                        | PPC_RFDI | PPC_DCR | PPC_DCRX | PPC_POPCNTWD \
> +                        | PPC_CILDST)
>  
>      /* extended type values */
>  
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index d7e5670c20..30dd524959 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -5907,22 +5907,6 @@ static void gen_mtdcrx(DisasContext *ctx)
>  #endif /* defined(CONFIG_USER_ONLY) */
>  }
>  
> -/* mfdcrux (PPC 460) : user-mode access to DCR */
> -static void gen_mfdcrux(DisasContext *ctx)
> -{
> -    gen_helper_load_dcr(cpu_gpr[rD(ctx->opcode)], cpu_env,
> -                        cpu_gpr[rA(ctx->opcode)]);
> -    /* Note: Rc update flag set leads to undefined state of Rc0 */
> -}
> -
> -/* mtdcrux (PPC 460) : user-mode access to DCR */
> -static void gen_mtdcrux(DisasContext *ctx)
> -{
> -    gen_helper_store_dcr(cpu_env, cpu_gpr[rA(ctx->opcode)],
> -                         cpu_gpr[rS(ctx->opcode)]);
> -    /* Note: Rc update flag set leads to undefined state of Rc0 */
> -}
> -
>  /* dccci */
>  static void gen_dccci(DisasContext *ctx)
>  {
> @@ -6958,8 +6942,6 @@ GEN_HANDLER(mfdcr, 0x1F, 0x03, 0x0A, 0x00000001, PPC_DCR),
>  GEN_HANDLER(mtdcr, 0x1F, 0x03, 0x0E, 0x00000001, PPC_DCR),
>  GEN_HANDLER(mfdcrx, 0x1F, 0x03, 0x08, 0x00000000, PPC_DCRX),
>  GEN_HANDLER(mtdcrx, 0x1F, 0x03, 0x0C, 0x00000000, PPC_DCRX),
> -GEN_HANDLER(mfdcrux, 0x1F, 0x03, 0x09, 0x00000000, PPC_DCRUX),
> -GEN_HANDLER(mtdcrux, 0x1F, 0x03, 0x0D, 0x00000000, PPC_DCRUX),
>  GEN_HANDLER(dccci, 0x1F, 0x06, 0x0E, 0x03E00001, PPC_4xx_COMMON),
>  GEN_HANDLER(dcread, 0x1F, 0x06, 0x0F, 0x00000001, PPC_4xx_COMMON),
>  GEN_HANDLER2(icbt_40x, "icbt", 0x1F, 0x06, 0x08, 0x03E00001, PPC_40x_ICBT),

