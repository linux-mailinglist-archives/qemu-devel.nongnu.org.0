Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F3244C861
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 20:05:44 +0100 (CET)
Received: from localhost ([::1]:44850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mksul-0007CB-NO
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 14:05:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mksom-0000Lz-UX; Wed, 10 Nov 2021 13:59:32 -0500
Received: from [201.28.113.2] (port=44873 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mksok-0001jj-05; Wed, 10 Nov 2021 13:59:32 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 10 Nov 2021 15:58:46 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 5057C800AC7;
 Wed, 10 Nov 2021 15:58:46 -0300 (-03)
Subject: Re: [PATCH 1/2] target/ppc: Fixed call to deferred exception
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
 <20211020125724.78028-2-lucas.araujo@eldorado.org.br>
 <c4d2f4e8-b001-519d-ab8c-47e80d1a78ec@ilande.co.uk>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Message-ID: <b87bb52d-166f-0c1c-efe6-0747e1f08453@eldorado.org.br>
Date: Wed, 10 Nov 2021 15:58:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c4d2f4e8-b001-519d-ab8c-47e80d1a78ec@ilande.co.uk>
Content-Type: multipart/alternative;
 boundary="------------F04F296E55B0D0D6C2D1F7B8"
Content-Language: en-US
X-OriginalArrivalTime: 10 Nov 2021 18:58:46.0864 (UTC)
 FILETIME=[FD7D4D00:01D7D664]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.678, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 danielhb413@gmail.com, richard.henderson@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------F04F296E55B0D0D6C2D1F7B8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/11/2021 05:19, Mark Cave-Ayland wrote:
>
> On 20/10/2021 13:57, Lucas Mateus Castro (alqotel) wrote:
>
>> From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>
>>
>> mtfsf, mtfsfi and mtfsb1 instructions call helper_float_check_status
>> after updating the value of FPSCR, but helper_float_check_status
>> checks fp_status and fp_status isn't updated based on FPSCR and
>> since the value of fp_status is reset earlier in the instruction,
>> it's always 0.
>>
>> Because of this helper_float_check_status would change the FI bit to 0
>> as this bit checks if the last operation was inexact and
>> float_flag_inexact is always 0.
>>
>> These instructions also don't throw exceptions correctly since
>> helper_float_check_status throw exceptions based on fp_status.
>>
>> This commit created a new helper, helper_fpscr_check_status that checks
>> FPSCR value instead of fp_status and checks for a larger variety of
>> exceptions than do_float_check_status.
>>
>> The hardware used to compare QEMU's behavior to, was a Power9.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/266
>> Signed-off-by: Lucas Mateus Castro (alqotel) 
>> <lucas.castro@eldorado.org.br>
>> ---
>>   target/ppc/fpu_helper.c            | 41 ++++++++++++++++++++++++++++++
>>   target/ppc/helper.h                |  1 +
>>   target/ppc/translate/fp-impl.c.inc |  6 ++---
>>   3 files changed, 45 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
>> index c4896cecc8..f086cb503f 100644
>> --- a/target/ppc/fpu_helper.c
>> +++ b/target/ppc/fpu_helper.c
>> @@ -414,6 +414,47 @@ void helper_store_fpscr(CPUPPCState *env, 
>> uint64_t val, uint32_t nibbles)
>>       ppc_store_fpscr(env, val);
>>   }
>>
>> +void helper_fpscr_check_status(CPUPPCState *env)
>> +{
>> +    CPUState *cs = env_cpu(env);
>> +    target_ulong fpscr = env->fpscr;
>> +    int error = 0;
>> +
>> +    if ((fpscr & FP_VXSOFT) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXSOFT;
>> +    } else if ((fpscr & FP_OX) && (fpscr & FP_OE)) {
>> +        error = POWERPC_EXCP_FP_OX;
>> +    } else if ((fpscr & FP_UX) && (fpscr & FP_UE)) {
>> +        error = POWERPC_EXCP_FP_UX;
>> +    } else if ((fpscr & FP_XX) && (fpscr & FP_XE)) {
>> +        error = POWERPC_EXCP_FP_XX;
>> +    } else if ((fpscr & FP_ZX) && (fpscr & FP_ZE)) {
>> +        error = POWERPC_EXCP_FP_ZX;
>> +    } else if ((fpscr & FP_VXSNAN) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXSNAN;
>> +    } else if ((fpscr & FP_VXISI) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXISI;
>> +    } else if ((fpscr & FP_VXIDI) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXIDI;
>> +    } else if ((fpscr & FP_VXZDZ) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXZDZ;
>> +    } else if ((fpscr & FP_VXIMZ) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXIMZ;
>> +    } else if ((fpscr & FP_VXVC) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXVC;
>> +    }
>> +
>> +    if (error) {
>> +        cs->exception_index = POWERPC_EXCP_PROGRAM;
>> +        env->error_code = error | POWERPC_EXCP_FP;
>> +        /* Deferred floating-point exception after target FPSCR 
>> update */
>> +        if (fp_exceptions_enabled(env)) {
>> +            raise_exception_err_ra(env, cs->exception_index,
>> +                                   env->error_code, GETPC());
>> +        }
>> +    }
>> +}
>> +
>>   static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
>>   {
>>       CPUState *cs = env_cpu(env);
>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>> index 4076aa281e..baa3715e73 100644
>> --- a/target/ppc/helper.h
>> +++ b/target/ppc/helper.h
>> @@ -61,6 +61,7 @@ DEF_HELPER_FLAGS_1(cntlzw32, TCG_CALL_NO_RWG_SE, 
>> i32, i32)
>>   DEF_HELPER_FLAGS_2(brinc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>>
>>   DEF_HELPER_1(float_check_status, void, env)
>> +DEF_HELPER_1(fpscr_check_status, void, env)
>>   DEF_HELPER_1(reset_fpstatus, void, env)
>>   DEF_HELPER_2(compute_fprf_float64, void, env, i64)
>>   DEF_HELPER_3(store_fpscr, void, env, i64, i32)
>> diff --git a/target/ppc/translate/fp-impl.c.inc 
>> b/target/ppc/translate/fp-impl.c.inc
>> index 9f7868ee28..0a9b1ecc60 100644
>> --- a/target/ppc/translate/fp-impl.c.inc
>> +++ b/target/ppc/translate/fp-impl.c.inc
>> @@ -782,7 +782,7 @@ static void gen_mtfsb1(DisasContext *ctx)
>>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>>       }
>>       /* We can raise a deferred exception */
>> -    gen_helper_float_check_status(cpu_env);
>> +    gen_helper_fpscr_check_status(cpu_env);
>>   }
>>
>>   /* mtfsf */
>> @@ -818,7 +818,7 @@ static void gen_mtfsf(DisasContext *ctx)
>>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>>       }
>>       /* We can raise a deferred exception */
>> -    gen_helper_float_check_status(cpu_env);
>> +    gen_helper_fpscr_check_status(cpu_env);
>>       tcg_temp_free_i64(t1);
>>   }
>>
>> @@ -851,7 +851,7 @@ static void gen_mtfsfi(DisasContext *ctx)
>>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>>       }
>>       /* We can raise a deferred exception */
>> -    gen_helper_float_check_status(cpu_env);
>> +    gen_helper_fpscr_check_status(cpu_env);
>>   }
>>
>>   /***                         Floating-point 
>> load                           ***/
>
> FWIW the real issue here is that gen_helper_reset_fpstatus() even 
> exists at all: see
> the comments around enabling hardfloat in the PPC target by Emilio and 
> Richard at
> https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg04974.html 
> and
> https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg00064.html.
>
> I have tried a few informal experiments on my MacOS images by 
> completely removing all
> calls to gen_reset_fpstatus(), and whilst there were a few odd 
> behaviours I was
> surprised to find that the basic OS was usable. The main issue I had 
> was trying to
> come up with suitable test cases for the various instructions when my 
> only available
> hardware is a G4 Mac Mini.
>
> So yes this patch fixes one particular use case, but the real issue is 
> that the PPC
> target floating point flags need a bit of work: however once this is 
> done it should
> be possible for hardfloat to be enabled via a CPU option on suitable 
> hosts which will
> bring a noticeable improvement in floating point performance.
>
In this case I don't think gen_helper_reset_fpstatus() is the problem, 
fp_status is not updated in the instruction but its value is used in 
helper_float_check_status(), so if the values have not been reset since 
the last instruction it'll contain last instruction's information and if 
it has (either by calling gen_helper_reset_fpstatus(), by automatically 
doing it every instruction or by having every instruction reset it in 
the end) it'll have 0. So there are 3 alternatives to solve this that I 
can think of:

     * Update FPSCR directly, then update fp_status based on FPSCR, for 
this you would either have to call a new helper to do this or update 
helper_store_fpscr to do this, and then expand do_float_check_status to 
throw more exceptions (or create a new helper to do this if expanding 
do_float_check_status could cause problems),

     * Just don't use fp_status, update FPSCR directly and do the 
deferred exception using only information from FPSCR (the one I used 
this patch),

     * Update only fp_status directly and call either a modified 
do_float_check_status or a new helper that would update FPSCR and throw 
the correct exception based on fp_status, this one I don't see how it 
would feasible in the current implementation as FPSCR has many bits 
without an equivalent in fp_status.

So with this I can see how to implement the 1st and 2nd option, I chose 
not to use the 1st one as do_float_check_status updates the FPSCR then 
throw the exception, which seemed unnecessary. Also looking back I 
should've removed gen_reset_fpstatus() as in the way it ended 
implemented these instructions don't interact with fp_status anywhere 
else, so I'll remove it in the next version.

And looking at the suggestions the current implementation could be 
changed to take advantage of the optimization suggested in the 
discussion you linked, specially the parts about checking when exception 
bits aren't set (but in this case it would've to be the MSR exception 
bits) and the part about skipping calculating a flag when marked to 1.

Thanks for the links.
>
> ATB,
>
> Mark.
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Estagiario
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------F04F296E55B0D0D6C2D1F7B8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/11/2021 05:19, Mark Cave-Ayland
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c4d2f4e8-b001-519d-ab8c-47e80d1a78ec@ilande.co.uk"><br>
      On 20/10/2021 13:57, Lucas Mateus Castro (alqotel) wrote:
      <br>
      <br>
      <blockquote type="cite">From: "Lucas Mateus Castro (alqotel)"
        <a class="moz-txt-link-rfc2396E" href="mailto:lucas.castro@eldorado.org.br">&lt;lucas.castro@eldorado.org.br&gt;</a>
        <br>
        <br>
        mtfsf, mtfsfi and mtfsb1 instructions call
        helper_float_check_status
        <br>
        after updating the value of FPSCR, but helper_float_check_status
        <br>
        checks fp_status and fp_status isn't updated based on FPSCR and
        <br>
        since the value of fp_status is reset earlier in the
        instruction,
        <br>
        it's always 0.
        <br>
        <br>
        Because of this helper_float_check_status would change the FI
        bit to 0
        <br>
        as this bit checks if the last operation was inexact and
        <br>
        float_flag_inexact is always 0.
        <br>
        <br>
        These instructions also don't throw exceptions correctly since
        <br>
        helper_float_check_status throw exceptions based on fp_status.
        <br>
        <br>
        This commit created a new helper, helper_fpscr_check_status that
        checks
        <br>
        FPSCR value instead of fp_status and checks for a larger variety
        of
        <br>
        exceptions than do_float_check_status.
        <br>
        <br>
        The hardware used to compare QEMU's behavior to, was a Power9.
        <br>
        <br>
        Resolves: <a class="moz-txt-link-freetext" href="https://gitlab.com/qemu-project/qemu/-/issues/266">https://gitlab.com/qemu-project/qemu/-/issues/266</a>
        <br>
        Signed-off-by: Lucas Mateus Castro (alqotel)
        <a class="moz-txt-link-rfc2396E" href="mailto:lucas.castro@eldorado.org.br">&lt;lucas.castro@eldorado.org.br&gt;</a>
        <br>
        ---
        <br>
          target/ppc/fpu_helper.c            | 41
        ++++++++++++++++++++++++++++++
        <br>
          target/ppc/helper.h                |  1 +
        <br>
          target/ppc/translate/fp-impl.c.inc |  6 ++---
        <br>
          3 files changed, 45 insertions(+), 3 deletions(-)
        <br>
        <br>
        diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
        <br>
        index c4896cecc8..f086cb503f 100644
        <br>
        --- a/target/ppc/fpu_helper.c
        <br>
        +++ b/target/ppc/fpu_helper.c
        <br>
        @@ -414,6 +414,47 @@ void helper_store_fpscr(CPUPPCState *env,
        uint64_t val, uint32_t nibbles)
        <br>
              ppc_store_fpscr(env, val);
        <br>
          }
        <br>
        <br>
        +void helper_fpscr_check_status(CPUPPCState *env)
        <br>
        +{
        <br>
        +    CPUState *cs = env_cpu(env);
        <br>
        +    target_ulong fpscr = env-&gt;fpscr;
        <br>
        +    int error = 0;
        <br>
        +
        <br>
        +    if ((fpscr &amp; FP_VXSOFT) &amp;&amp; (fpscr_ve != 0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXSOFT;
        <br>
        +    } else if ((fpscr &amp; FP_OX) &amp;&amp; (fpscr &amp;
        FP_OE)) {
        <br>
        +        error = POWERPC_EXCP_FP_OX;
        <br>
        +    } else if ((fpscr &amp; FP_UX) &amp;&amp; (fpscr &amp;
        FP_UE)) {
        <br>
        +        error = POWERPC_EXCP_FP_UX;
        <br>
        +    } else if ((fpscr &amp; FP_XX) &amp;&amp; (fpscr &amp;
        FP_XE)) {
        <br>
        +        error = POWERPC_EXCP_FP_XX;
        <br>
        +    } else if ((fpscr &amp; FP_ZX) &amp;&amp; (fpscr &amp;
        FP_ZE)) {
        <br>
        +        error = POWERPC_EXCP_FP_ZX;
        <br>
        +    } else if ((fpscr &amp; FP_VXSNAN) &amp;&amp; (fpscr_ve !=
        0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXSNAN;
        <br>
        +    } else if ((fpscr &amp; FP_VXISI) &amp;&amp; (fpscr_ve !=
        0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXISI;
        <br>
        +    } else if ((fpscr &amp; FP_VXIDI) &amp;&amp; (fpscr_ve !=
        0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXIDI;
        <br>
        +    } else if ((fpscr &amp; FP_VXZDZ) &amp;&amp; (fpscr_ve !=
        0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXZDZ;
        <br>
        +    } else if ((fpscr &amp; FP_VXIMZ) &amp;&amp; (fpscr_ve !=
        0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXIMZ;
        <br>
        +    } else if ((fpscr &amp; FP_VXVC) &amp;&amp; (fpscr_ve !=
        0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXVC;
        <br>
        +    }
        <br>
        +
        <br>
        +    if (error) {
        <br>
        +        cs-&gt;exception_index = POWERPC_EXCP_PROGRAM;
        <br>
        +        env-&gt;error_code = error | POWERPC_EXCP_FP;
        <br>
        +        /* Deferred floating-point exception after target FPSCR
        update */
        <br>
        +        if (fp_exceptions_enabled(env)) {
        <br>
        +            raise_exception_err_ra(env, cs-&gt;exception_index,
        <br>
        +                                   env-&gt;error_code,
        GETPC());
        <br>
        +        }
        <br>
        +    }
        <br>
        +}
        <br>
        +
        <br>
          static void do_float_check_status(CPUPPCState *env, uintptr_t
        raddr)
        <br>
          {
        <br>
              CPUState *cs = env_cpu(env);
        <br>
        diff --git a/target/ppc/helper.h b/target/ppc/helper.h
        <br>
        index 4076aa281e..baa3715e73 100644
        <br>
        --- a/target/ppc/helper.h
        <br>
        +++ b/target/ppc/helper.h
        <br>
        @@ -61,6 +61,7 @@ DEF_HELPER_FLAGS_1(cntlzw32,
        TCG_CALL_NO_RWG_SE, i32, i32)
        <br>
          DEF_HELPER_FLAGS_2(brinc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
        <br>
        <br>
          DEF_HELPER_1(float_check_status, void, env)
        <br>
        +DEF_HELPER_1(fpscr_check_status, void, env)
        <br>
          DEF_HELPER_1(reset_fpstatus, void, env)
        <br>
          DEF_HELPER_2(compute_fprf_float64, void, env, i64)
        <br>
          DEF_HELPER_3(store_fpscr, void, env, i64, i32)
        <br>
        diff --git a/target/ppc/translate/fp-impl.c.inc
        b/target/ppc/translate/fp-impl.c.inc
        <br>
        index 9f7868ee28..0a9b1ecc60 100644
        <br>
        --- a/target/ppc/translate/fp-impl.c.inc
        <br>
        +++ b/target/ppc/translate/fp-impl.c.inc
        <br>
        @@ -782,7 +782,7 @@ static void gen_mtfsb1(DisasContext *ctx)
        <br>
                  tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
        <br>
              }
        <br>
              /* We can raise a deferred exception */
        <br>
        -    gen_helper_float_check_status(cpu_env);
        <br>
        +    gen_helper_fpscr_check_status(cpu_env);
        <br>
          }
        <br>
        <br>
          /* mtfsf */
        <br>
        @@ -818,7 +818,7 @@ static void gen_mtfsf(DisasContext *ctx)
        <br>
                  tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
        <br>
              }
        <br>
              /* We can raise a deferred exception */
        <br>
        -    gen_helper_float_check_status(cpu_env);
        <br>
        +    gen_helper_fpscr_check_status(cpu_env);
        <br>
              tcg_temp_free_i64(t1);
        <br>
          }
        <br>
        <br>
        @@ -851,7 +851,7 @@ static void gen_mtfsfi(DisasContext *ctx)
        <br>
                  tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
        <br>
              }
        <br>
              /* We can raise a deferred exception */
        <br>
        -    gen_helper_float_check_status(cpu_env);
        <br>
        +    gen_helper_fpscr_check_status(cpu_env);
        <br>
          }
        <br>
        <br>
          /***                         Floating-point
        load                           ***/
        <br>
      </blockquote>
      <br>
      FWIW the real issue here is that gen_helper_reset_fpstatus() even
      exists at all: see
      <br>
      the comments around enabling hardfloat in the PPC target by Emilio
      and Richard at
      <br>
<a class="moz-txt-link-freetext" href="https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg04974.html">https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg04974.html</a>
      and
      <br>
<a class="moz-txt-link-freetext" href="https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg00064.html">https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg00064.html</a>.
      <br>
      <br>
      I have tried a few informal experiments on my MacOS images by
      completely removing all
      <br>
      calls to gen_reset_fpstatus(), and whilst there were a few odd
      behaviours I was
      <br>
      surprised to find that the basic OS was usable. The main issue I
      had was trying to
      <br>
      come up with suitable test cases for the various instructions when
      my only available
      <br>
      hardware is a G4 Mac Mini.
      <br>
      <br>
      So yes this patch fixes one particular use case, but the real
      issue is that the PPC
      <br>
      target floating point flags need a bit of work: however once this
      is done it should
      <br>
      be possible for hardfloat to be enabled via a CPU option on
      suitable hosts which will
      <br>
      bring a noticeable improvement in floating point performance.
      <br>
      <br>
    </blockquote>
    <p>In this case I don't think gen_helper_reset_fpstatus() is the
      problem, fp_status is not updated in the instruction but its value
      is used in helper_float_check_status(), so if the values have not
      been reset since the last instruction it'll contain last
      instruction's information and if it has (either by calling
      gen_helper_reset_fpstatus(), by automatically doing it every
      instruction or by having every instruction reset it in the end)
      it'll have 0. So there are 3 alternatives to solve this that I can
      think of:</p>
    <p>    * Update FPSCR directly, then update fp_status based on
      FPSCR, for this you would either have to call a new helper to do
      this or update helper_store_fpscr to do this, and then expand
      do_float_check_status to throw more exceptions (or create a new
      helper to do this if expanding do_float_check_status could cause
      problems),<br>
    </p>
    <p>    * Just don't use fp_status, update FPSCR directly and do the
      deferred exception using only information from FPSCR (the one I
      used this patch),</p>
    <p>    * Update only fp_status directly and call either a modified
      do_float_check_status or a new helper that would update FPSCR and
      throw the correct exception based on fp_status, this one I don't
      see how it would feasible in the current implementation as FPSCR
      has many bits without an equivalent in fp_status.</p>
    <p>So with this I can see how to implement the 1st and 2nd option, I
      chose not to use the 1st one as do_float_check_status updates the
      FPSCR then throw the exception, which seemed unnecessary. Also
      looking back I should've removed gen_reset_fpstatus() as in the
      way it ended implemented these instructions don't interact with
      fp_status anywhere else, so I'll remove it in the next version.</p>
    <p>And looking at the suggestions the current implementation could
      be changed to take advantage of the optimization suggested in the
      discussion you linked, specially the parts about checking when
      exception bits aren't set (but in this case it would've to be the
      MSR exception bits) and the part about skipping calculating a flag
      when marked to 1.<br>
    </p>
    Thanks for the links.<br>
    <blockquote type="cite"
      cite="mid:c4d2f4e8-b001-519d-ab8c-47e80d1a78ec@ilande.co.uk">
      <br>
      ATB,
      <br>
      <br>
      Mark.
      <br>
    </blockquote>
    <div class="moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Estagiario<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------F04F296E55B0D0D6C2D1F7B8--

