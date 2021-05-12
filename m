Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B509637D3EC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:44:25 +0200 (CEST)
Received: from localhost ([::1]:35818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgumO-0006mp-P3
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgu6v-0002gO-DP; Wed, 12 May 2021 15:01:33 -0400
Received: from [201.28.113.2] (port=1436 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgu6r-0002Bm-4k; Wed, 12 May 2021 15:01:30 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:57:56 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 015478000C2;
 Wed, 12 May 2021 15:57:55 -0300 (-03)
Subject: Re: [RFC PATCH 08/11] target/ppc: wrapped some TCG only logic with
 ifdefs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-9-bruno.larsen@eldorado.org.br>
 <40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <4aab8498-580c-cdb3-9c87-b47d5e1ff33d@eldorado.org.br>
Date: Wed, 12 May 2021 15:57:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------80313946F0AB708AB2CE1631"
Content-Language: en-US
X-OriginalArrivalTime: 12 May 2021 18:57:56.0343 (UTC)
 FILETIME=[B831E870:01D74760]
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
--------------80313946F0AB708AB2CE1631
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/05/2021 15:33, Richard Henderson wrote:
> On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
>> diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
>> index ba100793a7..ce287222ee 100644
>> --- a/include/exec/helper-proto.h
>> +++ b/include/exec/helper-proto.h
>> @@ -38,7 +38,9 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), 
>> dh_ctype(t2), dh_ctype(t3), \
>>   #define IN_HELPER_PROTO
>>     #include "helper.h"
>> +#ifdef CONFIG_TCG
>>   #include "trace/generated-helpers.h"
>> +#endif
>>   #include "accel/tcg/tcg-runtime.h"
>>   #include "accel/tcg/plugin-helpers.h"
>
> Um.. this file is exclusively TCG already.
> Are you missing some use of helper_foo()?
A lot of files that we are compiling (mainly mmu-*, excp_helper and 
gdbstub IIRC). We could comb through all of them and remove all 
declarations of helpers and wrap the inclusion of helper-proto itself in 
ifdefs, but it felt unnecessarily long. If it is preferable, we can do it.
>
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index d0fa219880..9d72dc49cf 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -1204,11 +1204,13 @@ static void 
>> register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
>>       /* TLB assist registers */
>>       /* XXX : not implemented */
>>       for (i = 0; i < 8; i++) {
>> +#ifdef CONFIG_TCG
>>           void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =
>>               &spr_write_generic32;
>>           if (i == 2 && (mas_mask & (1 << i)) && (env->insns_flags & 
>> PPC_64B)) {
>>               uea_write = &spr_write_generic;
>>           }
>> +#endif
>
> You could move this condition into
>
>>           if (mas_mask & (1 << i)) {
>>               spr_register(env, mas_sprn[i], mas_names[i],
>>                            SPR_NOACCESS, SPR_NOACCESS,
>
> ... the call here, so that it all automatically compiles out:
>
>   spr_register(env, ...,
>                spr_read_generic,
>                (i == 2 && (env->insns_flags & PPC_64B)
>                 ? spr_write_generic : spr_write_generic32),
>                0x00000000);
>
Yeah, sounds like a better plan.
>> @@ -8606,7 +8608,9 @@ static void ppc_cpu_realize(DeviceState *dev, 
>> Error **errp)
>>           }
>>       }
>>   +#ifdef CONFIG_TCG
>>       create_ppc_opcodes(cpu, &local_err);
>> +#endif
>>       if (local_err != NULL) {
>>           error_propagate(errp, local_err);
>>           goto unrealize;
>
> Include the error checking into the ifdef.
Ah, yeah, good idea
>
>
>> @@ -8799,7 +8803,9 @@ static void ppc_cpu_unrealize(DeviceState *dev)
>>         cpu_remove_sync(CPU(cpu));
>>   +#ifdef CONFIG_TCG
>>       destroy_ppc_opcodes(cpu);
>> +#endif
>>   }
>>     static gint ppc_cpu_compare_class_pvr(gconstpointer a, 
>> gconstpointer b)
>> @@ -9297,7 +9303,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, 
>> void *data)
>>       cc->class_by_name = ppc_cpu_class_by_name;
>>       cc->has_work = ppc_cpu_has_work;
>>       cc->dump_state = ppc_cpu_dump_state;
>> +#ifdef CONFIG_TCG
>>       cc->dump_statistics = ppc_cpu_dump_statistics;
>> +#endif
>
> We should just drop this entirely.  It's supposedly a generic thing, 
> but only used by ppc.  But even then only with source modification to 
> enable DO_PPC_STATISTICS.  And even then as we convert to decodetree, 
> said statistics will not be collected.
>
> We should delete everything from cpu_dump_statistics on down.
uhm, sure. We can do it, but I think should be left as future cleanup 
once we get disable-tcg working
>
>
> r~
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------80313946F0AB708AB2CE1631
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/05/2021 15:33, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org">On
      5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
      <br>
      <blockquote type="cite">diff --git a/include/exec/helper-proto.h
        b/include/exec/helper-proto.h
        <br>
        index ba100793a7..ce287222ee 100644
        <br>
        --- a/include/exec/helper-proto.h
        <br>
        +++ b/include/exec/helper-proto.h
        <br>
        @@ -38,7 +38,9 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1),
        dh_ctype(t2), dh_ctype(t3), \
        <br>
          #define IN_HELPER_PROTO
        <br>
            #include "helper.h"
        <br>
        +#ifdef CONFIG_TCG
        <br>
          #include "trace/generated-helpers.h"
        <br>
        +#endif
        <br>
          #include "accel/tcg/tcg-runtime.h"
        <br>
          #include "accel/tcg/plugin-helpers.h"
        <br>
          </blockquote>
      <br>
      Um.. this file is exclusively TCG already.
      <br>
      Are you missing some use of helper_foo()?
      <br>
    </blockquote>
    A lot of files that we are compiling (mainly mmu-*, excp_helper and
    gdbstub IIRC). We could comb through all of them and remove all
    declarations of helpers and wrap the inclusion of helper-proto
    itself in ifdefs, but it felt unnecessarily long. If it is
    preferable, we can do it.<br>
    <blockquote type="cite"
      cite="mid:40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org">
      <br>
      <blockquote type="cite">diff --git a/target/ppc/cpu_init.c
        b/target/ppc/cpu_init.c
        <br>
        index d0fa219880..9d72dc49cf 100644
        <br>
        --- a/target/ppc/cpu_init.c
        <br>
        +++ b/target/ppc/cpu_init.c
        <br>
        @@ -1204,11 +1204,13 @@ static void
        register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
        <br>
              /* TLB assist registers */
        <br>
              /* XXX : not implemented */
        <br>
              for (i = 0; i &lt; 8; i++) {
        <br>
        +#ifdef CONFIG_TCG
        <br>
                  void (*uea_write)(DisasContext *ctx, int sprn, int
        gprn) =
        <br>
                      &amp;spr_write_generic32;
        <br>
                  if (i == 2 &amp;&amp; (mas_mask &amp; (1 &lt;&lt; i))
        &amp;&amp; (env-&gt;insns_flags &amp; PPC_64B)) {
        <br>
                      uea_write = &amp;spr_write_generic;
        <br>
                  }
        <br>
        +#endif
        <br>
      </blockquote>
      <br>
      You could move this condition into
      <br>
      <br>
      <blockquote type="cite">          if (mas_mask &amp; (1 &lt;&lt;
        i)) {
        <br>
                      spr_register(env, mas_sprn[i], mas_names[i],
        <br>
                                   SPR_NOACCESS, SPR_NOACCESS,
        <br>
      </blockquote>
      <br>
      ... the call here, so that it all automatically compiles out:
      <br>
      <br>
        spr_register(env, ...,
      <br>
                     spr_read_generic,
      <br>
                     (i == 2 &amp;&amp; (env-&gt;insns_flags &amp;
      PPC_64B)
      <br>
                      ? spr_write_generic : spr_write_generic32),
      <br>
                     0x00000000);
      <br>
      <br>
    </blockquote>
    Yeah, sounds like a better plan.<br>
    <blockquote type="cite"
      cite="mid:40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org">
      <blockquote type="cite">@@ -8606,7 +8608,9 @@ static void
        ppc_cpu_realize(DeviceState *dev, Error **errp)
        <br>
                  }
        <br>
              }
        <br>
          +#ifdef CONFIG_TCG
        <br>
              create_ppc_opcodes(cpu, &amp;local_err);
        <br>
        +#endif
        <br>
              if (local_err != NULL) {
        <br>
                  error_propagate(errp, local_err);
        <br>
                  goto unrealize;
        <br>
      </blockquote>
      <br>
      Include the error checking into the ifdef.
      <br>
    </blockquote>
    Ah, yeah, good idea<br>
    <blockquote type="cite"
      cite="mid:40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org">
      <br>
      <br>
      <blockquote type="cite">@@ -8799,7 +8803,9 @@ static void
        ppc_cpu_unrealize(DeviceState *dev)
        <br>
                cpu_remove_sync(CPU(cpu));
        <br>
          +#ifdef CONFIG_TCG
        <br>
              destroy_ppc_opcodes(cpu);
        <br>
        +#endif
        <br>
          }
        <br>
            static gint ppc_cpu_compare_class_pvr(gconstpointer a,
        gconstpointer b)
        <br>
        @@ -9297,7 +9303,9 @@ static void ppc_cpu_class_init(ObjectClass
        *oc, void *data)
        <br>
              cc-&gt;class_by_name = ppc_cpu_class_by_name;
        <br>
              cc-&gt;has_work = ppc_cpu_has_work;
        <br>
              cc-&gt;dump_state = ppc_cpu_dump_state;
        <br>
        +#ifdef CONFIG_TCG
        <br>
              cc-&gt;dump_statistics = ppc_cpu_dump_statistics;
        <br>
        +#endif
        <br>
      </blockquote>
      <br>
      We should just drop this entirely.  It's supposedly a generic
      thing, but only used by ppc.  But even then only with source
      modification to enable DO_PPC_STATISTICS.  And even then as we
      convert to decodetree, said statistics will not be collected.
      <br>
      <br>
      We should delete everything from cpu_dump_statistics on down.
      <br>
    </blockquote>
    uhm, sure. We can do it, but I think should be left as future
    cleanup once we get disable-tcg working<br>
    <blockquote type="cite"
      cite="mid:40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org">
      <br>
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

--------------80313946F0AB708AB2CE1631--

