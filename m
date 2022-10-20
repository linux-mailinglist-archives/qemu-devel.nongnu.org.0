Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4DF60628F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:12:51 +0200 (CEST)
Received: from localhost ([::1]:43088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWHW-00075k-29
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:12:22 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWEk-0002tz-Q0
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olUV7-0005ob-9G; Thu, 20 Oct 2022 08:18:33 -0400
Received: from [200.168.210.66] (port=13464 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olUV4-0008Nh-5a; Thu, 20 Oct 2022 08:18:17 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 20 Oct 2022 09:18:08 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 346C08000CB;
 Thu, 20 Oct 2022 09:18:08 -0300 (-03)
Message-ID: <026ce1e4-588b-5b8b-6431-8871ef6197f2@eldorado.org.br>
Date: Thu, 20 Oct 2022 09:18:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 5/6] target/ppc: move msgclrp/msgsndp to decodetree
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 farosas@linux.ibm.com
References: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
 <20221006200654.725390-6-matheus.ferst@eldorado.org.br>
 <00665dae-fd51-0962-4068-0760a1c70467@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <00665dae-fd51-0962-4068-0760a1c70467@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Oct 2022 12:18:08.0520 (UTC)
 FILETIME=[039F1880:01D8E47E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 19/10/2022 17:59, Daniel Henrique Barboza wrote:
> Matheus,
> 
> This patch fails ppc-softmmu emulation:
> 
> 
> FAILED: libqemu-ppc-softmmu.fa.p/target_ppc_translate.c.o
> cc -m64 -mcx16 -Ilibqemu-ppc-softmmu.fa.p -I. -I.. -Itarget/ppc 
> -I../target/ppc -I../dtc/libfdt -Iqapi -Itrace -Iui -Iui/shader 
> -I/usr/include/pixman-1 -I/usr/include/glib-2.0 
> -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4 
> -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g 
> -isystem /home/danielhb/qemu/linux-headers -isystem linux-headers 
> -iquote . -iquote /home/danielhb/qemu -iquote 
> /home/danielhb/qemu/include -iquote /home/danielhb/qemu/tcg/i386 
> -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE 
> -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes 
> -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes 
> -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration 
> -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k 
> -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs 
> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 
> -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi 
> -fstack-protector-strong -fPIE -isystem../linux-headers 
> -isystemlinux-headers -DNEED_CPU_H 
> '-DCONFIG_TARGET="ppc-softmmu-config-target.h"' 
> '-DCONFIG_DEVICES="ppc-softmmu-config-devices.h"' -MD -MQ 
> libqemu-ppc-softmmu.fa.p/target_ppc_translate.c.o -MF 
> libqemu-ppc-softmmu.fa.p/target_ppc_translate.c.o.d -o 
> libqemu-ppc-softmmu.fa.p/target_ppc_translate.c.o -c 
> ../target/ppc/translate.c
> In file included from ../target/ppc/translate.c:21:
> In function ‘trans_MSGCLRP’,
>      inlined from ‘decode_insn32’ at 
> libqemu-ppc-softmmu.fa.p/decode-insn32.c.inc:3250:21,
>      inlined from ‘ppc_tr_translate_insn’ at 
> ../target/ppc/translate.c:7552:15:
> /home/danielhb/qemu/include/qemu/osdep.h:184:35: error: call to 
> ‘qemu_build_not_reached_always’ declared with attribute error: code path 
> is reachable
>    184 | #define qemu_build_not_reached()  qemu_build_not_reached_always()
>        |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../target/ppc/translate/processor-ctrl-impl.c.inc:79:5: note: in 
> expansion of macro ‘qemu_build_not_reached’
>     79 |     qemu_build_not_reached();
>        |     ^~~~~~~~~~~~~~~~~~~~~~
> 
> The error is down there:
> 

Hmm, that's strange. I always build ppc-softmmu on my tests and I'm not 
seeing this error. I'm using gcc 9.4 though, maybe it's time to update 
my compiler...

> 
> 
> 
> On 10/6/22 17:06, Matheus Ferst wrote:
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   target/ppc/insn32.decode                      |  2 ++
>>   target/ppc/translate.c                        | 26 -------------------
>>   .../ppc/translate/processor-ctrl-impl.c.inc   | 24 +++++++++++++++++
>>   3 files changed, 26 insertions(+), 26 deletions(-)
>>
>> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
>> index bba49ded1b..5ba4a6807d 100644
>> --- a/target/ppc/insn32.decode
>> +++ b/target/ppc/insn32.decode
>> @@ -913,3 +913,5 @@ TLBIEL          011111 ..... - .. . . ..... 
>> 0100010010 -            @X_tlbie
>>
>>   MSGCLR          011111 ----- ----- ..... 0011101110 -   @X_rb
>>   MSGSND          011111 ----- ----- ..... 0011001110 -   @X_rb
>> +MSGCLRP         011111 ----- ----- ..... 0010101110 -   @X_rb
>> +MSGSNDP         011111 ----- ----- ..... 0010001110 -   @X_rb
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 889cca6325..087ab8e69d 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -6241,28 +6241,6 @@ static void gen_icbt_440(DisasContext *ctx)
>>
>>   /* Embedded.Processor Control */
>>
>> -#if defined(TARGET_PPC64)
>> -static void gen_msgclrp(DisasContext *ctx)
>> -{
>> -#if defined(CONFIG_USER_ONLY)
>> -    GEN_PRIV(ctx);
>> -#else
>> -    CHK_SV(ctx);
>> -    gen_helper_book3s_msgclrp(cpu_env, cpu_gpr[rB(ctx->opcode)]);
>> -#endif /* defined(CONFIG_USER_ONLY) */
>> -}
>> -
>> -static void gen_msgsndp(DisasContext *ctx)
>> -{
>> -#if defined(CONFIG_USER_ONLY)
>> -    GEN_PRIV(ctx);
>> -#else
>> -    CHK_SV(ctx);
>> -    gen_helper_book3s_msgsndp(cpu_env, cpu_gpr[rB(ctx->opcode)]);
>> -#endif /* defined(CONFIG_USER_ONLY) */
>> -}
>> -#endif
>> -
>>   static void gen_msgsync(DisasContext *ctx)
>>   {
>>   #if defined(CONFIG_USER_ONLY)
>> @@ -6896,10 +6874,6 @@ GEN_HANDLER(vmladduhm, 0x04, 0x11, 0xFF, 
>> 0x00000000, PPC_ALTIVEC),
>>   GEN_HANDLER_E(maddhd_maddhdu, 0x04, 0x18, 0xFF, 0x00000000, PPC_NONE,
>>                 PPC2_ISA300),
>>   GEN_HANDLER_E(maddld, 0x04, 0x19, 0xFF, 0x00000000, PPC_NONE, 
>> PPC2_ISA300),
>> -GEN_HANDLER2_E(msgsndp, "msgsndp", 0x1F, 0x0E, 0x04, 0x03ff0001,
>> -               PPC_NONE, PPC2_ISA207S),
>> -GEN_HANDLER2_E(msgclrp, "msgclrp", 0x1F, 0x0E, 0x05, 0x03ff0001,
>> -               PPC_NONE, PPC2_ISA207S),
>>   #endif
>>
>>   #undef GEN_INT_ARITH_ADD
>> diff --git a/target/ppc/translate/processor-ctrl-impl.c.inc 
>> b/target/ppc/translate/processor-ctrl-impl.c.inc
>> index 0192b45c8f..3703001f31 100644
>> --- a/target/ppc/translate/processor-ctrl-impl.c.inc
>> +++ b/target/ppc/translate/processor-ctrl-impl.c.inc
>> @@ -68,3 +68,27 @@ static bool trans_MSGSND(DisasContext *ctx, 
>> arg_X_rb *a)
>>   #endif
>>       return true;
>>   }
>> +
>> +static bool trans_MSGCLRP(DisasContext *ctx, arg_X_rb *a)
>> +{
>> +    REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
>> +    REQUIRE_SV(ctx);
>> +#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
>> +    gen_helper_book3s_msgclrp(cpu_env, cpu_gpr[a->rb]);
>> +#else
>> +    qemu_build_not_reached();
> 
> 
> ^ here. And also
> 
> 
> 
>> +#endif
>> +    return true;
>> +}
>> +
>> +static bool trans_MSGSNDP(DisasContext *ctx, arg_X_rb *a)
>> +{
>> +    REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
>> +    REQUIRE_SV(ctx);
>> +#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
>> +    gen_helper_book3s_msgsndp(cpu_env, cpu_gpr[a->rb]);
>> +#else
>> +    qemu_build_not_reached();
> 
> 
> ^ here. It seems like you're filtering for TARGET_PPC64 but you're not
> guarding for it, and the qemu_build_not_reached() is being hit.
> 
> 
> I fixed by squashing this in:
> 
> diff --git a/target/ppc/translate/processor-ctrl-impl.c.inc 
> b/target/ppc/translate/processor-ctrl-impl.c.inc
> index f253226a75..ff231db1af 100644
> --- a/target/ppc/translate/processor-ctrl-impl.c.inc
> +++ b/target/ppc/translate/processor-ctrl-impl.c.inc
> @@ -73,6 +73,7 @@ static bool trans_MSGCLRP(DisasContext *ctx, arg_X_rb *a)
>   {
>       REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
>       REQUIRE_SV(ctx);
> +    REQUIRE_64BIT(ctx);
>   #if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
>       gen_helper_book3s_msgclrp(cpu_env, cpu_gpr[a->rb]);
>   #else
> @@ -85,6 +86,7 @@ static bool trans_MSGSNDP(DisasContext *ctx, arg_X_rb *a)
>   {
>       REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
>       REQUIRE_SV(ctx);
> +    REQUIRE_64BIT(ctx);
>   #if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
>       gen_helper_book3s_msgsndp(cpu_env, cpu_gpr[a->rb]);
>   #else
> 
> 
> If you think this fix is acceptable you can consider this patch acked as 
> well.
> 

It shouldn't matter since we only want to make the compiler happy, but 
we should check instruction flags before privilege, so we throw 
POWERPC_EXCP_INVAL_INVAL instead of POWERPC_EXCP_PRIV_OPC if the CPU 
doesn't have the instruction:

 > @@ -73,6 +73,7 @@ static bool trans_MSGCLRP(DisasContext *ctx, 
arg_X_rb *a)
 >   {
 > +     REQUIRE_64BIT(ctx);
 >       REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
 >       REQUIRE_SV(ctx);
 >   #if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
 >       gen_helper_book3s_msgclrp(cpu_env, cpu_gpr[a->rb]);
 >   #else
 > @@ -85,6 +86,7 @@ static bool trans_MSGSNDP(DisasContext *ctx, 
arg_X_rb *a)
 >   {
 > +     REQUIRE_64BIT(ctx);
 >       REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
 >       REQUIRE_SV(ctx);
 >   #if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
 >       gen_helper_book3s_msgsndp(cpu_env, cpu_gpr[a->rb]);
 >   #else

Since all CPUs with ISA207S are 64-bit, it shouldn't make any difference 
in this context, but someone might use this code as an example, so it's 
better to have these checks in the correct order. Do you want me to 
resend with this change?

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


