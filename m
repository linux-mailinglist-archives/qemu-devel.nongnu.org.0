Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8887B4C35E7
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:30:59 +0100 (CET)
Received: from localhost ([::1]:40502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJpK-0002n6-1E
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:30:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nNJbH-00052D-Sx; Thu, 24 Feb 2022 14:16:28 -0500
Received: from [187.72.171.209] (port=31082 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nNJbF-0000yM-4I; Thu, 24 Feb 2022 14:16:27 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 24 Feb 2022 16:16:18 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id EDE2E8001D4;
 Thu, 24 Feb 2022 16:16:17 -0300 (-03)
Message-ID: <b8280b17-4124-92ce-c647-95de039f31d3@eldorado.org.br>
Date: Thu, 24 Feb 2022 16:16:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 38/47] target/ppc: Refactor VSX_SCALAR_CMP_DP
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-39-matheus.ferst@eldorado.org.br>
 <c4e1ed69-62a7-dfa8-302e-c74845803098@linaro.org>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <c4e1ed69-62a7-dfa8-302e-c74845803098@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Feb 2022 19:16:18.0412 (UTC)
 FILETIME=[000C4AC0:01D829B3]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/2022 21:20, Richard Henderson wrote:> On 2/22/22 04:36, 
matheus.ferst@eldorado.org.br wrote:
>> From: Víctor Colombo <victor.colombo@eldorado.org.br>
>>
>> Refactor VSX_SCALAR_CMP_DP, changing its name to VSX_SCALAR_CMP and
>> prepare the helper to be used for quadword comparisons.
>>
>> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   target/ppc/fpu_helper.c | 31 ++++++++++++++-----------------
>>   1 file changed, 14 insertions(+), 17 deletions(-)
>>
>> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
>> index 9b034d1fe4..5ebbcfe3b7 100644
>> --- a/target/ppc/fpu_helper.c
>> +++ b/target/ppc/fpu_helper.c
>> @@ -2265,28 +2265,30 @@ VSX_MADDQ(XSNMSUBQP, NMSUB_FLGS, 0)
>>   VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
>>
>>   /*
>> - * VSX_SCALAR_CMP_DP - VSX scalar floating point compare double 
>> precision
>> + * VSX_SCALAR_CMP - VSX scalar floating point compare
>>    *   op    - instruction mnemonic
>> + *   tp    - type
>>    *   cmp   - comparison operation
>>    *   exp   - expected result of comparison
>> + *   fld   - vsr_t field
>>    *   svxvc - set VXVC bit
>>    */
>> -#define VSX_SCALAR_CMP_DP(op, cmp, exp, 
>> svxvc)                                \
>> +#define VSX_SCALAR_CMP(op, tp, cmp, fld, exp, 
>> svxvc)                          \
>>   void helper_##op(CPUPPCState *env, ppc_vsr_t 
>> *xt,                             \
>>                    ppc_vsr_t *xa, ppc_vsr_t 
>> *xb)                                \
>>   
>> {                                                                             
>> \
>> -    ppc_vsr_t t = 
>> *xt;                                                        \
>> +    ppc_vsr_t t = { 
>> };                                                        \
>>       bool vxsnan_flag = false, vxvc_flag = false, vex_flag = 
>> false;            \
>>                                                                                 
>> \
>> -    if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) 
>> ||             \
>> -        float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) 
>> {             \
>> +    if (tp##_is_signaling_nan(xa->fld, &env->fp_status) 
>> ||                    \
>> +        tp##_is_signaling_nan(xb->fld, &env->fp_status)) 
>> {                    \
>>           vxsnan_flag = 
>> true;                                                   \
>>           if (fpscr_ve == 0 && svxvc) 
>> {                                         \
>>               vxvc_flag = 
>> true;                                                 \
>>           
>> }                                                                     \
>>       } else if (svxvc) 
>> {                                                       \
>> -        vxvc_flag = float64_is_quiet_nan(xa->VsrD(0), 
>> &env->fp_status) ||     \
>> -            float64_is_quiet_nan(xb->VsrD(0), 
>> &env->fp_status);               \
>> +        vxvc_flag = tp##_is_quiet_nan(xa->fld, &env->fp_status) 
>> ||            \
>> +            tp##_is_quiet_nan(xb->fld, 
>> &env->fp_status);                      \
>>       }
> 
> Note that this can be simplified further, using the full FloatRelation 
> result and
> float_flag_invalid_snan.
> 
> Note that do_scalar_cmp gets half-way there, only checking for NaNs once 
> we have
> float_relation_unordered as a comparision result.  But it could go 
> further and check
> float_flag_invalid_snan and drop all of the other checks vs snan and qnan.
> 
> 
> r~

Hello Richard! Thanks for your review

Could you please elaborate more on how do you think using
float*_compare and its FloatRelation result would work here?
I noticed do_scalar_cmp modifies CR and sets FPCC flag, which
is not what VSX_SCALAR_CMP do. Using that function would require a
rework.

An option I though would be to bring into VSX_SCALAR_CMP the
important necessary parts, something like this:

#define VSX_SCALAR_CMP(op, tp, cmp, fld, svxvc, expr) 
       ...
     r = tp##_compare(xa->fld, xb->fld, &env->fp_status); 
        \
     if (expr) { 
        \
         memset(&t.fld, 0xFF, sizeof(t.fld)); 
        \
     } else if (r == float_relation_unordered) { 
        \
         if (env->fp_status.float_exception_flags & 
float_flag_invalid_snan) { \
             float_invalid_op_vxsnan(env, GETPC()); 
        \
             if (fpscr_ve == 0 && svxvc) { 
        \
                 float_invalid_op_vxvc(env, 0, GETPC()); 
        \
             } 
        \
         } else if (svxvc) { 
        \
             if (tp##_is_quiet_nan(xa->fld, &env->fp_status) || 
        \
                 tp##_is_quiet_nan(xb->fld, &env->fp_status)) { 
        \
                     float_invalid_op_vxvc(env, 0, GETPC()); 
        \
                 } 
        \
         } 
        \
     } 
        \
...
VSX_SCALAR_CMP(XSCMPEQDP, float64, eq, VsrD(0), 0, r == 
float_relation_equal)
VSX_SCALAR_CMP(XSCMPGEDP, float64, le, VsrD(0), 1, \
     r == float_relation_equal || r == float_relation_greater)
VSX_SCALAR_CMP(XSCMPGTDP, float64, lt, VsrD(0), 1, r == 
float_relation_greater)

But this still looks convoluted. Another option I came with would be:

     ppc_vsr_t t = { }; 
        \
 
        \
     helper_reset_fpstatus(env); 
        \
 
        \
     if (tp##_##cmp##_quiet(xb->fld, xa->fld, &env->fp_status)) { 
        \
         memset(&t.fld, 0xFF, sizeof(t.fld)); 
        \
     } 
        \
 
        \
     if (env->fp_status.float_exception_flags & float_flag_invalid_snan) 
{     \
         float_invalid_op_vxsnan(env, GETPC()); 
        \
         if (fpscr_ve == 0 && svxvc) { 
        \
             float_invalid_op_vxvc(env, 0, GETPC()); 
        \
         } 
        \
     } else if (svxvc) { 
        \
         if (tp##_is_quiet_nan(xa->fld, &env->fp_status) || 
        \
             tp##_is_quiet_nan(xb->fld, &env->fp_status)) { 
        \
                 float_invalid_op_vxvc(env, 0, GETPC()); 
        \
             } 
        \
     } 
        \

Is this close to what you were thinking?

Thank you very much!

-- Víctor

