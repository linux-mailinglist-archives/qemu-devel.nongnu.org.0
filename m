Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC90836FB47
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:12:40 +0200 (CEST)
Received: from localhost ([::1]:43426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSwh-0001oL-O7
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcSmm-0002X3-3N; Fri, 30 Apr 2021 09:02:24 -0400
Received: from [201.28.113.2] (port=10439 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcSmj-0006Rn-8Q; Fri, 30 Apr 2021 09:02:23 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 10:02:16 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 9AB838013C2;
 Fri, 30 Apr 2021 10:02:16 -0300 (-03)
Subject: Re: [PATCH v2 3/7] target/ppc: Isolated SPR read/write callbacks
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-4-bruno.larsen@eldorado.org.br> <YIuFrMWyU/g80qfo@yekko>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <b863a05d-cb2b-c511-42dd-7f1d028b9968@eldorado.org.br>
Date: Fri, 30 Apr 2021 10:02:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YIuFrMWyU/g80qfo@yekko>
Content-Type: multipart/alternative;
 boundary="------------702A848764AEF7FAB42BDE24"
Content-Language: en-US
X-OriginalArrivalTime: 30 Apr 2021 13:02:16.0918 (UTC)
 FILETIME=[0BF30F60:01D73DC1]
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------702A848764AEF7FAB42BDE24
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 30/04/2021 01:21, David Gibson wrote:
> On Thu, Apr 29, 2021 at 01:21:26PM -0300, Bruno Larsen (billionai) wrote:
>> Moved all SPR read/write callback, and some related functions, to a
>> new file specific for it. These callbacks are TCG only, so separating
>> them is required to support the flag disable-tcg.
>>
>> Making the spr_noaccess function not static, and moving the define to
>> internal.h is required, as spr_tcg.c.inc has to be included after
>> SPR_NOACCESS has been used.
>>
>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>> ---
>>   target/ppc/internal.h           |    3 +
>>   target/ppc/spr_tcg.c.inc        | 1033 +++++++++++++++++++++++++++++++
>>   target/ppc/translate.c          |   49 +-
>>   target/ppc/translate_init.c.inc |  981 -----------------------------
>>   4 files changed, 1039 insertions(+), 1027 deletions(-)
>>   create mode 100644 target/ppc/spr_tcg.c.inc
>>
>> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
>> index 184ba6d6b3..1de15acfbd 100644
>> --- a/target/ppc/internal.h
>> +++ b/target/ppc/internal.h
>> @@ -228,4 +228,7 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
>>   void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
>>   gchar *ppc_gdb_arch_name(CPUState *cs);
>>   
>> +void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
>> +#define SPR_NOACCESS (&spr_noaccess)
>> +
>>   #endif /* PPC_INTERNAL_H */
>> diff --git a/target/ppc/spr_tcg.c.inc b/target/ppc/spr_tcg.c.inc
>> new file mode 100644
>> index 0000000000..48274dd52b
>> --- /dev/null
>> +++ b/target/ppc/spr_tcg.c.inc
> I'm confused.  You create the new file as a .inc.c, but I don't see
> anything #including the new file.
<snip>
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index b319d409c6..a6e677fa6d 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -36,6 +36,7 @@
>>   #include "exec/translator.h"
>>   #include "exec/log.h"
>>   #include "qemu/atomic128.h"
>> +#include "internal.h"
>>   
>>   
>>   #define CPU_SINGLE_STEP 0x1
>> @@ -4175,43 +4176,6 @@ static void gen_tdi(DisasContext *ctx)
>>   
>>   /***                          Processor control                            ***/
>>   
>> -static void gen_read_xer(DisasContext *ctx, TCGv dst)
>> -{
>> -    TCGv t0 = tcg_temp_new();
>> -    TCGv t1 = tcg_temp_new();
>> -    TCGv t2 = tcg_temp_new();
>> -    tcg_gen_mov_tl(dst, cpu_xer);
>> -    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
>> -    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
>> -    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
>> -    tcg_gen_or_tl(t0, t0, t1);
>> -    tcg_gen_or_tl(dst, dst, t2);
>> -    tcg_gen_or_tl(dst, dst, t0);
>> -    if (is_isa300(ctx)) {
>> -        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
>> -        tcg_gen_or_tl(dst, dst, t0);
>> -        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
>> -        tcg_gen_or_tl(dst, dst, t0);
>> -    }
>> -    tcg_temp_free(t0);
>> -    tcg_temp_free(t1);
>> -    tcg_temp_free(t2);
>> -}
>> -
>> -static void gen_write_xer(TCGv src)
>> -{
>> -    /* Write all flags, while reading back check for isa300 */
>> -    tcg_gen_andi_tl(cpu_xer, src,
>> -                    ~((1u << XER_SO) |
>> -                      (1u << XER_OV) | (1u << XER_OV32) |
>> -                      (1u << XER_CA) | (1u << XER_CA32)));
>> -    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
>> -    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
>> -    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
>> -    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
>> -    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
>> -}
>> -
>>   /* mcrxr */
>>   static void gen_mcrxr(DisasContext *ctx)
>>   {
>> @@ -4299,15 +4263,6 @@ static void gen_mfmsr(DisasContext *ctx)
>>       tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], cpu_msr);
>>   }
>>   
>> -static void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
>> -{
>> -#if 0
>> -    sprn = ((sprn >> 5) & 0x1F) | ((sprn & 0x1F) << 5);
>> -    printf("ERROR: try to access SPR %d !\n", sprn);
>> -#endif
>> -}
>> -#define SPR_NOACCESS (&spr_noaccess)
>> -
>>   /* mfspr */
>>   static inline void gen_op_mfspr(DisasContext *ctx)
>>   {
>> @@ -7639,6 +7594,7 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E, 0x1F, 0x03FFF800, \
>>   };
>>   
>>   #include "helper_regs.h"
>> +#include "spr_tcg.c.inc"
>>   #include "translate_init.c.inc"

You probably just missed it here. Buried a bit in all the code motion, 
unfortunately...

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <about:blank?compose>

--------------702A848764AEF7FAB42BDE24
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <div class="moz-cite-prefix">On 30/04/2021 01:21, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YIuFrMWyU%2Fg80qfo@yekko">
      <pre class="moz-quote-pre" wrap="">On Thu, Apr 29, 2021 at 01:21:26PM -0300, Bruno Larsen (billionai) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Moved all SPR read/write callback, and some related functions, to a
new file specific for it. These callbacks are TCG only, so separating
them is required to support the flag disable-tcg.

Making the spr_noaccess function not static, and moving the define to
internal.h is required, as spr_tcg.c.inc has to be included after
SPR_NOACCESS has been used.

Signed-off-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
---
 target/ppc/internal.h           |    3 +
 target/ppc/spr_tcg.c.inc        | 1033 +++++++++++++++++++++++++++++++
 target/ppc/translate.c          |   49 +-
 target/ppc/translate_init.c.inc |  981 -----------------------------
 4 files changed, 1039 insertions(+), 1027 deletions(-)
 create mode 100644 target/ppc/spr_tcg.c.inc

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 184ba6d6b3..1de15acfbd 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -228,4 +228,7 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
 void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
 gchar *ppc_gdb_arch_name(CPUState *cs);
 
+void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
+#define SPR_NOACCESS (&amp;spr_noaccess)
+
 #endif /* PPC_INTERNAL_H */
diff --git a/target/ppc/spr_tcg.c.inc b/target/ppc/spr_tcg.c.inc
new file mode 100644
index 0000000000..48274dd52b
--- /dev/null
+++ b/target/ppc/spr_tcg.c.inc
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm confused.  You create the new file as a .inc.c, but I don't see
anything #including the new file.</pre>
    </blockquote>
    &lt;snip&gt;
    <blockquote type="cite" cite="mid:YIuFrMWyU%2Fg80qfo@yekko">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b319d409c6..a6e677fa6d 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -36,6 +36,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/atomic128.h"
+#include "internal.h"
 
 
 #define CPU_SINGLE_STEP 0x1
@@ -4175,43 +4176,6 @@ static void gen_tdi(DisasContext *ctx)
 
 /***                          Processor control                            ***/
 
-static void gen_read_xer(DisasContext *ctx, TCGv dst)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    TCGv t2 = tcg_temp_new();
-    tcg_gen_mov_tl(dst, cpu_xer);
-    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
-    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
-    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
-    tcg_gen_or_tl(t0, t0, t1);
-    tcg_gen_or_tl(dst, dst, t2);
-    tcg_gen_or_tl(dst, dst, t0);
-    if (is_isa300(ctx)) {
-        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
-        tcg_gen_or_tl(dst, dst, t0);
-        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
-        tcg_gen_or_tl(dst, dst, t0);
-    }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-}
-
-static void gen_write_xer(TCGv src)
-{
-    /* Write all flags, while reading back check for isa300 */
-    tcg_gen_andi_tl(cpu_xer, src,
-                    ~((1u &lt;&lt; XER_SO) |
-                      (1u &lt;&lt; XER_OV) | (1u &lt;&lt; XER_OV32) |
-                      (1u &lt;&lt; XER_CA) | (1u &lt;&lt; XER_CA32)));
-    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
-    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
-    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
-    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
-    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
-}
-
 /* mcrxr */
 static void gen_mcrxr(DisasContext *ctx)
 {
@@ -4299,15 +4263,6 @@ static void gen_mfmsr(DisasContext *ctx)
     tcg_gen_mov_tl(cpu_gpr[rD(ctx-&gt;opcode)], cpu_msr);
 }
 
-static void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
-{
-#if 0
-    sprn = ((sprn &gt;&gt; 5) &amp; 0x1F) | ((sprn &amp; 0x1F) &lt;&lt; 5);
-    printf("ERROR: try to access SPR %d !\n", sprn);
-#endif
-}
-#define SPR_NOACCESS (&amp;spr_noaccess)
-
 /* mfspr */
 static inline void gen_op_mfspr(DisasContext *ctx)
 {
@@ -7639,6 +7594,7 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E, 0x1F, 0x03FFF800, \
 };
 
 #include "helper_regs.h"
+#include "spr_tcg.c.inc"
 #include "translate_init.c.inc"
</pre>
      </blockquote>
    </blockquote>
    <p>You probably just missed it here. Buried a bit in all the code
      motion, unfortunately...</p>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen</div>
    <div class="moz-signature">
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
    </div>
    <div class="moz-signature">
      Departamento Computação Embarcada <br>
    </div>
    <div class="moz-signature">
      Analista de Software Trainee</div>
    <div class="moz-signature">
      <a href="about:blank?compose">Aviso Legal - Disclaimer</a></div>
  </body>
</html>

--------------702A848764AEF7FAB42BDE24--

