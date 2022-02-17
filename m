Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418BC4B9BB0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:06:17 +0100 (CET)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcju-000609-HL
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:06:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nKcOZ-0007u6-8A; Thu, 17 Feb 2022 03:44:13 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34518
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nKcOX-00041k-5T; Thu, 17 Feb 2022 03:44:10 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H8BIFa019186; 
 Thu, 17 Feb 2022 08:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=b5frWTfKCJOfRkRbyqk/QehsjlZ/oaQEq+FnVWxlSAk=;
 b=LTKDQdQ/Ag9lpIL8vloaGCZqHySbvvIppF59srrtEpOCv4U4Q/h0PWhtHyqIFdgfIeOS
 HitBjnRNzdPW29bp5hWDkWoPMGKDs9RQbV3nSftylZGNMRUtxgXIdqE4X0Q/B30LeG05
 rNy1NPNSH64koC/Ube7sLFC8UIgG7+6QW4HGb6KuT5Q+m0Ocqht3KDlBn3eE+EY5Ej68
 35rho/L9VR3jpn8nOxTbZuhaq9Wep8/+DuJQkTV3dsklhE2lBELMrWAfrGkf2EI2hhXb
 NJI9xBpPj2Yqz99YZVPj3Bs4WZN/4OesKMXDGybRHRWwjjw4PaAqvsRXf1VbQDBricm6 eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e9bpqg8u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 08:44:07 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21H8YY81023562;
 Thu, 17 Feb 2022 08:44:06 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e9bpqg8tq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 08:44:06 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21H8b8Bj022363;
 Thu, 17 Feb 2022 08:44:04 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3e64ha5rbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 08:44:04 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21H8i1D128377390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 08:44:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E7074C040;
 Thu, 17 Feb 2022 08:44:01 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BC6A4C046;
 Thu, 17 Feb 2022 08:44:00 +0000 (GMT)
Received: from [9.171.32.140] (unknown [9.171.32.140])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Feb 2022 08:44:00 +0000 (GMT)
Message-ID: <45137b73-2c97-7b22-b497-45f6c4f30205@linux.ibm.com>
Date: Thu, 17 Feb 2022 09:44:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 1/3] s390x/tcg: Implement
 Miscellaneous-Instruction-Extensions Facility 3 for the s390x
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220216203415.138819-1-dmiller423@gmail.com>
 <20220216203415.138819-2-dmiller423@gmail.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20220216203415.138819-2-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jmD_7nj1jIvfwywQwXpitgvDqn8rN9xK
X-Proofpoint-ORIG-GUID: quEmGGDx7sAd_cteyPuBG9WlsIpv-Fzh
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_03,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=993 clxscore=1015 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170037
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com, pasic@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 16.02.22 um 21:34 schrieb David Miller:
> resolves: https://gitlab.com/qemu-project/qemu/-/issues/737
> implements:
> AND WITH COMPLEMENT   (NCRK, NCGRK)
> NAND                  (NNRK, NNGRK)
> NOT EXCLUSIVE OR      (NXRK, NXGRK)
> NOR                   (NORK, NOGRK)
> OR WITH COMPLEMENT    (OCRK, OCGRK)
> SELECT                (SELR, SELGR)
> SELECT HIGH           (SELFHR)
> MOVE RIGHT TO LEFT    (MVCRL)
> POPULATION COUNT      (POPCNT)
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> ---
>   target/s390x/gen-features.c    |  1 +
>   target/s390x/helper.h          |  1 +
>   target/s390x/tcg/insn-data.def | 30 +++++++++++++++++--
>   target/s390x/tcg/mem_helper.c  | 20 +++++++++++++
>   target/s390x/tcg/translate.c   | 53 ++++++++++++++++++++++++++++++++--
>   5 files changed, 100 insertions(+), 5 deletions(-)
> 
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 7cb1a6ec10..a3f30f69d9 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -740,6 +740,7 @@ static uint16_t qemu_LATEST[] = {
>   
>   /* add all new definitions before this point */
>   static uint16_t qemu_MAX[] = {
> +    S390_FEAT_MISC_INSTRUCTION_EXT3,
>       /* generates a dependency warning, leave it out for now */
>       S390_FEAT_MSA_EXT_5,
>   };
> diff --git a/target/s390x/helper.h b/target/s390x/helper.h
> index 271b081e8c..69f69cf718 100644
> --- a/target/s390x/helper.h
> +++ b/target/s390x/helper.h
> @@ -4,6 +4,7 @@ DEF_HELPER_FLAGS_4(nc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
>   DEF_HELPER_FLAGS_4(oc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
>   DEF_HELPER_FLAGS_4(xc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
>   DEF_HELPER_FLAGS_4(mvc, TCG_CALL_NO_WG, void, env, i32, i64, i64)
> +DEF_HELPER_FLAGS_4(mvcrl, TCG_CALL_NO_WG, void, env, i64, i64, i64)
>   DEF_HELPER_FLAGS_4(mvcin, TCG_CALL_NO_WG, void, env, i32, i64, i64)
>   DEF_HELPER_FLAGS_4(clc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
>   DEF_HELPER_3(mvcl, i32, env, i32, i32)
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
> index 1c3e115712..efb1d5bc19 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.def
> @@ -105,6 +105,9 @@
>       D(0xa507, NILL,    RI_a,  Z,   r1_o, i2_16u, r1, 0, andi, 0, 0x1000)
>       D(0x9400, NI,      SI,    Z,   la1, i2_8u, new, 0, ni, nz64, MO_UB)
>       D(0xeb54, NIY,     SIY,   LD,  la1, i2_8u, new, 0, ni, nz64, MO_UB)
> +/* AND WITH COMPLEMENT */
> +    C(0xb9f5, NCRK,    RRF_a, MIE3, r2, r3, new, r1_32, andc, nz32)
> +    C(0xb9e5, NCGRK,   RRF_a, MIE3, r2, r3, r1, 0, andc, nz64)
>   
>   /* BRANCH AND LINK */
>       C(0x0500, BALR,    RR_a,  Z,   0, r2_nz, r1, 0, bal, 0)
> @@ -640,6 +643,8 @@
>       C(0xeb8e, MVCLU,   RSY_a, E2,  0, a2, 0, 0, mvclu, 0)
>   /* MOVE NUMERICS */
>       C(0xd100, MVN,     SS_a,  Z,   la1, a2, 0, 0, mvn, 0)
> +/* MOVE RIGHT TO LEFT */
> +    C(0xe50a, MVCRL,   SSE,  MIE3, la1, a2, 0, 0, mvcrl, 0)
>   /* MOVE PAGE */
>       C(0xb254, MVPG,    RRE,   Z,   0, 0, 0, 0, mvpg, 0)
>   /* MOVE STRING */
> @@ -707,6 +712,16 @@
>       F(0xed0f, MSEB,    RXF,   Z,   e1, m2_32u, new, e1, mseb, 0, IF_BFP)
>       F(0xed1f, MSDB,    RXF,   Z,   f1, m2_64, new, f1, msdb, 0, IF_BFP)
>   
> +/* NAND */
> +    C(0xb974, NNRK,    RRF_a, MIE3, r2, r3, new, r1_32, nand, nz32)
> +    C(0xb964, NNGRK,   RRF_a, MIE3, r2, r3, r1, 0, nand, nz64)
> +/* NOR */
> +    C(0xb976, NORK,    RRF_a, MIE3, r2, r3, new, r1_32, nor, nz32)
> +    C(0xb966, NOGRK,   RRF_a, MIE3, r2, r3, r1, 0, nor, nz64)
> +/* NOT EXCLUSIVE OR */
> +    C(0xb977, NXRK,    RRF_a, MIE3, r2, r3, new, r1_32, nxor, nz32)
> +    C(0xb967, NXGRK,   RRF_a, MIE3, r2, r3, r1, 0, nxor, nz64)
> +
>   /* OR */
>       C(0x1600, OR,      RR_a,  Z,   r1, r2, new, r1_32, or, nz32)
>       C(0xb9f6, ORK,     RRF_a, DO,  r2, r3, new, r1_32, or, nz32)
> @@ -725,6 +740,9 @@
>       D(0xa50b, OILL,    RI_a,  Z,   r1_o, i2_16u, r1, 0, ori, 0, 0x1000)
>       D(0x9600, OI,      SI,    Z,   la1, i2_8u, new, 0, oi, nz64, MO_UB)
>       D(0xeb56, OIY,     SIY,   LD,  la1, i2_8u, new, 0, oi, nz64, MO_UB)
> +/* OR WITH COMPLEMENT */
> +    C(0xb975, OCRK,    RRF_a, MIE3, r2, r3, new, r1_32, orc, nz32)
> +    C(0xb965, OCGRK,   RRF_a, MIE3, r2, r3, r1, 0, orc, nz64)
>   
>   /* PACK */
>       /* Really format SS_b, but we pack both lengths into one argument
> @@ -735,6 +753,9 @@
>   /* PACK UNICODE */
>       C(0xe100, PKU,     SS_f,  E2,  la1, a2, 0, 0, pku, 0)
>   
> +/* POPULATION COUNT */
> +    C(0xb9e1, POPCNT,  RRF_c, PC,  0, r2_o, r1, 0, popcnt, nz64)
> +
>   /* PREFETCH */
>       /* Implemented as nops of course.  */
>       C(0xe336, PFD,     RXY_b, GIE, 0, 0, 0, 0, 0, 0)
> @@ -743,9 +764,6 @@
>       /* Implemented as nop of course.  */
>       C(0xb2e8, PPA,     RRF_c, PPA, 0, 0, 0, 0, 0, 0)
>   
> -/* POPULATION COUNT */
> -    C(0xb9e1, POPCNT,  RRE,   PC,  0, r2_o, r1, 0, popcnt, nz64)
> -
>   /* ROTATE LEFT SINGLE LOGICAL */
>       C(0xeb1d, RLL,     RSY_a, Z,   r3_o, sh, new, r1_32, rll32, 0)
>       C(0xeb1c, RLLG,    RSY_a, Z,   r3_o, sh, r1, 0, rll64, 0)
> @@ -765,6 +783,12 @@
>   /* SEARCH STRING UNICODE */
>       C(0xb9be, SRSTU,   RRE,   ETF3, 0, 0, 0, 0, srstu, 0)
>   
> +/* SELECT */
> +    C(0xb9f0, SELR,    RRF_a, MIE3, r2, r3, new, r1_32, loc, 0)
> +    C(0xb9e3, SELGR,   RRF_a, MIE3, r2, r3, r1, 0, loc, 0)
> +/* SELECT HIGH */
> +    C(0xb9c0, SELFHR,  RRF_a, MIE3, r2, r3, new, r1_32h, loc, 0)

See Davids comment regarding r2 and r3 in version 4.


