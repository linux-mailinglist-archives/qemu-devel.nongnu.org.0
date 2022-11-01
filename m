Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABF961483E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 12:11:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opp9d-0001Hh-Bj; Tue, 01 Nov 2022 07:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1opp9a-0001GJ-K2; Tue, 01 Nov 2022 07:09:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1opp9Y-0006L0-0K; Tue, 01 Nov 2022 07:09:58 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A1920Vs001948;
 Tue, 1 Nov 2022 11:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=5wk/yeCntSrhE5OCFLAQnC0SEXD4P1yZ3TNGoPswAwo=;
 b=qtV7rmj2981nA45WFkD3dermkJMhkrbiZ2f9G7wG9B4BYi6dK8vWXuSNocO/fK7QpLD+
 OC2P+xn5gLTJ4uxYdqso66oCNH4VZmONDHP/y0zyyqrdDDKJVEBW2JIWUA7+SF5O5Tgy
 1hAwJZUrQXDEDhYYZz7a2GHyrov5TICU816rcoATt3mqs9IlObtGiSyZvibxhJu77Bnd
 hZQeOE60o36G4dOJC0hsHPYTIzt6pZvMOjNVhwKEeuzomMopaB6c8ayv8eXBZa/FHhUc
 +Bsmx7+zF9k3ffurp7JNl/iMUG77OH1+l9B9sCeQOCsfjMVooO8pfjX6pYEYsXXWw+Cj vQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjv4wjx7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 11:09:49 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A1B7wQk030113;
 Tue, 1 Nov 2022 11:09:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3kgut8vd75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 11:09:47 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A1B9jjI2032344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Nov 2022 11:09:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B66DFAE04D;
 Tue,  1 Nov 2022 11:09:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B386AE045;
 Tue,  1 Nov 2022 11:09:45 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  1 Nov 2022 11:09:45 +0000 (GMT)
Date: Tue, 1 Nov 2022 12:09:41 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 1/9] target/s390x: Use a single return for
 helper_divs32/u32
Message-ID: <20221101110941.tjt7klnbtm7dz2k6@heavy>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021073006.2398819-2-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K7_4InA7tMZQxLkCucfHMuyOKjqe6hT0
X-Proofpoint-ORIG-GUID: K7_4InA7tMZQxLkCucfHMuyOKjqe6hT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_05,2022-11-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=868 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010080
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 21, 2022 at 05:29:58PM +1000, Richard Henderson wrote:
> Pack the quotient and remainder into a single uint64_t.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/helper.h         |  2 +-
>  target/s390x/tcg/int_helper.c | 26 +++++++++++++-------------
>  target/s390x/tcg/translate.c  | 10 ++++++----
>  3 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/target/s390x/helper.h b/target/s390x/helper.h
> index bf33d86f74..97a9668eef 100644
> --- a/target/s390x/helper.h
> +++ b/target/s390x/helper.h
> @@ -10,7 +10,7 @@ DEF_HELPER_FLAGS_4(clc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
>  DEF_HELPER_3(mvcl, i32, env, i32, i32)
>  DEF_HELPER_3(clcl, i32, env, i32, i32)
>  DEF_HELPER_FLAGS_4(clm, TCG_CALL_NO_WG, i32, env, i32, i32, i64)
> -DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, s64, env, s64, s64)
> +DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, i64, env, s64, s64)
>  DEF_HELPER_FLAGS_3(divu32, TCG_CALL_NO_WG, i64, env, i64, i64)
>  DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, s64, env, s64, s64)
>  DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
> diff --git a/target/s390x/tcg/int_helper.c b/target/s390x/tcg/int_helper.c
> index 954542388a..130b8bd4d2 100644
> --- a/target/s390x/tcg/int_helper.c
> +++ b/target/s390x/tcg/int_helper.c
> @@ -34,45 +34,45 @@
>  #endif
>  
>  /* 64/32 -> 32 signed division */
> -int64_t HELPER(divs32)(CPUS390XState *env, int64_t a, int64_t b64)
> +uint64_t HELPER(divs32)(CPUS390XState *env, int64_t a, int64_t b64)
>  {
> -    int32_t ret, b = b64;
> -    int64_t q;
> +    int32_t b = b64;
> +    int64_t q, r;
>  
>      if (b == 0) {
>          tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
>      }
>  
> -    ret = q = a / b;
> -    env->retxl = a % b;
> +    q = a / b;
> +    r = a % b;
>  
>      /* Catch non-representable quotient.  */
> -    if (ret != q) {
> +    if (q != (int32_t)q) {
>          tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
>      }
>  
> -    return ret;
> +    return deposit64(r, 32, 32, q);
>  }
>  
>  /* 64/32 -> 32 unsigned division */
>  uint64_t HELPER(divu32)(CPUS390XState *env, uint64_t a, uint64_t b64)
>  {
> -    uint32_t ret, b = b64;
> -    uint64_t q;
> +    uint32_t b = b64;
> +    uint64_t q, r;
>  
>      if (b == 0) {
>          tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
>      }
>  
> -    ret = q = a / b;
> -    env->retxl = a % b;
> +    q = a / b;
> +    r = a % b;
>  
>      /* Catch non-representable quotient.  */
> -    if (ret != q) {
> +    if (q != (uint32_t)q) {
>          tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
>      }
>  
> -    return ret;
> +    return deposit64(r, 32, 32, q);
>  }
>  
>  /* 64/64 -> 64 signed division */
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 1d2dddab1c..525317c9df 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -2395,15 +2395,17 @@ static DisasJumpType op_diag(DisasContext *s, DisasOps *o)
>  
>  static DisasJumpType op_divs32(DisasContext *s, DisasOps *o)
>  {
> -    gen_helper_divs32(o->out2, cpu_env, o->in1, o->in2);
> -    return_low128(o->out);
> +    gen_helper_divs32(o->out, cpu_env, o->in1, o->in2);
> +    tcg_gen_ext32u_i64(o->out2, o->out);
> +    tcg_gen_shri_i64(o->out, o->out, 32);
>      return DISAS_NEXT;
>  }
>  
>  static DisasJumpType op_divu32(DisasContext *s, DisasOps *o)
>  {
> -    gen_helper_divu32(o->out2, cpu_env, o->in1, o->in2);
> -    return_low128(o->out);
> +    gen_helper_divu32(o->out, cpu_env, o->in1, o->in2);
> +    tcg_gen_ext32u_i64(o->out2, o->out);
> +    tcg_gen_shri_i64(o->out, o->out, 32);
>      return DISAS_NEXT;
>  }
>  
> -- 
> 2.34.1

Hi,

The wasmtime testsuite was failing and bisect pointed to this commit.
Apparently this needs a fixup:


--- a/target/s390x/tcg/int_helper.c
+++ b/target/s390x/tcg/int_helper.c
@@ -51,7 +51,7 @@ uint64_t HELPER(divs32)(CPUS390XState *env, int64_t a, int64_t b64)
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    return deposit64(r, 32, 32, q);
+    return deposit64(q, 32, 32, r);
 }
 
 /* 64/32 -> 32 unsigned division */
@@ -72,7 +72,7 @@ uint64_t HELPER(divu32)(CPUS390XState *env, uint64_t a, uint64_t b64)
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    return deposit64(r, 32, 32, q);
+    return deposit64(q, 32, 32, r);
 }
 
 /* 64/64 -> 64 signed division */


Currently we return out = r | (q << 32) here.
op_divu32 makes out2 = r, out = q from this.
Finally, r1_P32 stores r1 = q, r1+1 = r.
But DLR wants the opposite:

    The remainder is placed in bit
    positions 32-63 of general register R1, and the quo-
    tient is placed in bit positions 32-63 of general regis-
    ter R1 + 1.

Ditto DR.

Best regards,
Ilya

