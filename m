Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A8837D413
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 22:05:16 +0200 (CEST)
Received: from localhost ([::1]:52608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgv6Z-000423-9j
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 16:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lguKc-0005Ca-25; Wed, 12 May 2021 15:15:42 -0400
Received: from [201.28.113.2] (port=6624 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lguKW-0002hY-Rp; Wed, 12 May 2021 15:15:41 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 16:15:33 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id B96898000C2;
 Wed, 12 May 2021 16:15:32 -0300 (-03)
Subject: Re: [PATCH 07/11] target/ppc: added KVM fallback to fpscr manipulation
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-8-bruno.larsen@eldorado.org.br>
 <a9ac8b35-faae-167d-ff78-4b7ddd8f75c9@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <715dfc12-9873-93fd-afd1-e093ae9fae31@eldorado.org.br>
Date: Wed, 12 May 2021 16:15:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a9ac8b35-faae-167d-ff78-4b7ddd8f75c9@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------FBA01238F5C51294C5FF6023"
Content-Language: en-US
X-OriginalArrivalTime: 12 May 2021 19:15:33.0117 (UTC)
 FILETIME=[2E14D2D0:01D74763]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------FBA01238F5C51294C5FF6023
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/05/2021 15:20, Richard Henderson wrote:
> On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index 104a308abb..a8a720eb48 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -2947,3 +2947,17 @@ bool kvm_arch_cpu_check_are_resettable(void)
>>   {
>>       return true;
>>   }
>> +
>> +void kvmppc_store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask)
>> +{
>> +    CPUState *cs = env_cpu(env);
>> +    struct kvm_one_reg reg;
>> +    int ret;
>> +    reg.id = KVM_REG_PPC_FPSCR;
>> +    reg.addr = (uintptr_t) &env->fpscr;
>> +    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
>> +    if (ret < 0)
>> +    {
>> +        fprintf(stderr, "Unable to set FPSCR to KVM: %s", 
>> strerror(errno));
>> +    }
>> +}
>
> This is all unnecessary.  All you need to do is store to env->fpscr 
> and the value will be synced back with kvm_put_fp.
I figured this was too complicated again, but didn't have a better idea
>
> I'll note that some of the trouble you may be having with extracting 
> helper_store_fpscr to a ppc_store_fpscr function is due to an existing 
> bug in the tcg code:
>
> Storing to fpscr should *never* raise an exception -- see MTFSF, 
> MTFSB0, MTFSB1.  Thus the mucking about with cs->exception_index and 
> env->error_code is incorrect.
>
> In addition, the masking is being done weirdly and could use a 
> complete overhaul.
>
> This could all be rewritten as
>
> -- %< -- cpu.h
>
>  /* Invalid operation exception summary */
> - #define fpscr_ix ((env->fpscr) & ((1 << FPSCR_VXSNAN) ...
> + #define FPSCR_IX  ((1 << FPSCR_VXSNAN) | ...)
>
> -- %< -- cpu.c
>
> // move fpscr_set_rounding_mode here
>
> void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
> {
>     /* Recompute exception summary state. */
>     val &= ~(FP_VX | FP_FEX);
>     if (val & FPSCR_IX) {
>         val |= FP_VX;
>     }
>     if ((val >> FPSCR_XX) & (val >> FPSCR_XE) & 0x1f) {
>         val |= FP_FEX;
>     }
>     env->fpscr = val;
>     if (tcg_enabled()) {
>         fpscr_set_rounding_mode(env);
>     }
> }
>
> -- %< -- fpu_helper.c
>
> void helper_store_fpscr(CPUPPCState *env, target_ulong val,
>                         uint32_t nibbles)
> {
>     target_ulong mask = 0;
>
>     /* TODO: Push this expansion back to translation time. */
>     for (int i = 0; i < sizeof(target_ulong) * 2; ++i) {
>         if (nibbles & (1 << i)) {
>             mask |= (target_ulong)0xf << (4 * i);
>         }
>     }
>
>     val = (val & mask) | (env->fpscr & ~mask);
>     ppc_store_fpscr(env, val);
> }
>
> void helper_fpscr_clrbit(CPUPPCState *env, uint32_t bit)
> {
>     uint32_t mask = 1u << bit;
>     if (env->fpscr & mask) {
>         ppc_store_fpscr(env, env->fpscr & ~mask);
>     }
> }
>
> void helper_fpscr_setbit(CPUPPCState *env, uint32_t bit)
> {
>     uint32_t mask = 1u << bit;
>     if (!(env->fpscr & mask)) {
>         ppc_store_fpscr(env, env->fpscr | mask);
>     }
> }
>
> There are a couple of other uses of fpscr_set_rounding_mode, where the 
> softfloat value is changed temporarily (do_fri, VSX_ROUND). These 
> should simply save the previous softfloat value (using 
> get_float_rounding_mode) around the operation instead of re-computing 
> from fpscr.
>
> Which leaves us with exactly one use of fpscr_set_rounding_mode, which 
> can then be moved to cpu.c next to ppc_store_fpscr.
>
ok, yeah, I can definitely try this.
>
> r~
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------FBA01238F5C51294C5FF6023
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/05/2021 15:20, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a9ac8b35-faae-167d-ff78-4b7ddd8f75c9@linaro.org">On
      5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
      <br>
      <blockquote type="cite">diff --git a/target/ppc/kvm.c
        b/target/ppc/kvm.c
        <br>
        index 104a308abb..a8a720eb48 100644
        <br>
        --- a/target/ppc/kvm.c
        <br>
        +++ b/target/ppc/kvm.c
        <br>
        @@ -2947,3 +2947,17 @@ bool
        kvm_arch_cpu_check_are_resettable(void)
        <br>
          {
        <br>
              return true;
        <br>
          }
        <br>
        +
        <br>
        +void kvmppc_store_fpscr(CPUPPCState *env, uint64_t arg,
        uint32_t mask)
        <br>
        +{
        <br>
        +    CPUState *cs = env_cpu(env);
        <br>
        +    struct kvm_one_reg reg;
        <br>
        +    int ret;
        <br>
        +    reg.id = KVM_REG_PPC_FPSCR;
        <br>
        +    reg.addr = (uintptr_t) &amp;env-&gt;fpscr;
        <br>
        +    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &amp;reg);
        <br>
        +    if (ret &lt; 0)
        <br>
        +    {
        <br>
        +        fprintf(stderr, "Unable to set FPSCR to KVM: %s",
        strerror(errno));
        <br>
        +    }
        <br>
        +}
        <br>
      </blockquote>
      <br>
      This is all unnecessary.  All you need to do is store to
      env-&gt;fpscr and the value will be synced back with kvm_put_fp.
      <br>
    </blockquote>
    I figured this was too complicated again, but didn't have a better
    idea<br>
    <blockquote type="cite"
      cite="mid:a9ac8b35-faae-167d-ff78-4b7ddd8f75c9@linaro.org">
      <br>
      I'll note that some of the trouble you may be having with
      extracting helper_store_fpscr to a ppc_store_fpscr function is due
      to an existing bug in the tcg code:
      <br>
      <br>
      Storing to fpscr should *never* raise an exception -- see MTFSF,
      MTFSB0, MTFSB1.  Thus the mucking about with
      cs-&gt;exception_index and env-&gt;error_code is incorrect.
      <br>
      <br>
      In addition, the masking is being done weirdly and could use a
      complete overhaul.
      <br>
      <br>
      This could all be rewritten as
      <br>
      <br>
      -- %&lt; -- cpu.h
      <br>
      <br>
       /* Invalid operation exception summary */
      <br>
      - #define fpscr_ix ((env-&gt;fpscr) &amp; ((1 &lt;&lt;
      FPSCR_VXSNAN) ...
      <br>
      + #define FPSCR_IX  ((1 &lt;&lt; FPSCR_VXSNAN) | ...)
      <br>
      <br>
      -- %&lt; -- cpu.c
      <br>
      <br>
      // move fpscr_set_rounding_mode here
      <br>
      <br>
      void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
      <br>
      {
      <br>
          /* Recompute exception summary state. */
      <br>
          val &amp;= ~(FP_VX | FP_FEX);
      <br>
          if (val &amp; FPSCR_IX) {
      <br>
              val |= FP_VX;
      <br>
          }
      <br>
          if ((val &gt;&gt; FPSCR_XX) &amp; (val &gt;&gt; FPSCR_XE)
      &amp; 0x1f) {
      <br>
              val |= FP_FEX;
      <br>
          }
      <br>
          env-&gt;fpscr = val;
      <br>
          if (tcg_enabled()) {
      <br>
              fpscr_set_rounding_mode(env);
      <br>
          }
      <br>
      }
      <br>
      <br>
      -- %&lt; -- fpu_helper.c
      <br>
      <br>
      void helper_store_fpscr(CPUPPCState *env, target_ulong val,
      <br>
                              uint32_t nibbles)
      <br>
      {
      <br>
          target_ulong mask = 0;
      <br>
      <br>
          /* TODO: Push this expansion back to translation time. */
      <br>
          for (int i = 0; i &lt; sizeof(target_ulong) * 2; ++i) {
      <br>
              if (nibbles &amp; (1 &lt;&lt; i)) {
      <br>
                  mask |= (target_ulong)0xf &lt;&lt; (4 * i);
      <br>
              }
      <br>
          }
      <br>
      <br>
          val = (val &amp; mask) | (env-&gt;fpscr &amp; ~mask);
      <br>
          ppc_store_fpscr(env, val);
      <br>
      }
      <br>
      <br>
      void helper_fpscr_clrbit(CPUPPCState *env, uint32_t bit)
      <br>
      {
      <br>
          uint32_t mask = 1u &lt;&lt; bit;
      <br>
          if (env-&gt;fpscr &amp; mask) {
      <br>
              ppc_store_fpscr(env, env-&gt;fpscr &amp; ~mask);
      <br>
          }
      <br>
      }
      <br>
      <br>
      void helper_fpscr_setbit(CPUPPCState *env, uint32_t bit)
      <br>
      {
      <br>
          uint32_t mask = 1u &lt;&lt; bit;
      <br>
          if (!(env-&gt;fpscr &amp; mask)) {
      <br>
              ppc_store_fpscr(env, env-&gt;fpscr | mask);
      <br>
          }
      <br>
      }
      <br>
      <br>
      There are a couple of other uses of fpscr_set_rounding_mode, where
      the softfloat value is changed temporarily (do_fri, VSX_ROUND). 
      These should simply save the previous softfloat value (using
      get_float_rounding_mode) around the operation instead of
      re-computing from fpscr.
      <br>
      <br>
      Which leaves us with exactly one use of fpscr_set_rounding_mode,
      which can then be moved to cpu.c next to ppc_store_fpscr.
      <br>
      <br>
    </blockquote>
    ok, yeah, I can definitely try this. <br>
    <blockquote type="cite"
      cite="mid:a9ac8b35-faae-167d-ff78-4b7ddd8f75c9@linaro.org">
      <br>
      r~
      <br>
    </blockquote>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------FBA01238F5C51294C5FF6023--

