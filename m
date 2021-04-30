Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CBF36FFC6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:40:47 +0200 (CEST)
Received: from localhost ([::1]:47970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcX8A-0000dR-9s
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcWhL-00029p-IB; Fri, 30 Apr 2021 13:13:04 -0400
Received: from [201.28.113.2] (port=57617 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcWhI-0005s3-6L; Fri, 30 Apr 2021 13:13:02 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 14:12:54 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 7B5F18013C2;
 Fri, 30 Apr 2021 14:12:54 -0300 (-03)
Subject: Re: [PATCH v2 7/7] target/ppc: isolated cpu init from translation
 logic
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-8-bruno.larsen@eldorado.org.br>
 <874kfo3hvh.fsf@linux.ibm.com>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <dd389368-8778-57e3-5aed-bf56cde1df94@eldorado.org.br>
Date: Fri, 30 Apr 2021 14:12:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <874kfo3hvh.fsf@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------16B9D97FD0AFAA4BDB82A4E2"
Content-Language: en-US
X-OriginalArrivalTime: 30 Apr 2021 17:12:54.0766 (UTC)
 FILETIME=[0F3490E0:01D73DE4]
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
Cc: lucas.araujo@eldorado.org.br, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------16B9D97FD0AFAA4BDB82A4E2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 29/04/2021 18:23, Fabiano Rosas wrote:
> "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:
>
>> finished isolation of CPU initialization logic from
>> translation logic. CPU initialization now only has common code
>> which may or may not call accelerator-specific code, as the
>> build options require, and is compiled separately.
>>
>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>> ---
>>   target/ppc/{translate_init.c.inc => cpu_init.c} | 12 +++++++++++-
>>   target/ppc/meson.build                          |  1 +
>>   target/ppc/translate.c                          |  4 +++-
>>   3 files changed, 15 insertions(+), 2 deletions(-)
>>   rename target/ppc/{translate_init.c.inc => cpu_init.c} (99%)
>>
>> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/cpu_init.c
>> similarity index 99%
>> rename from target/ppc/translate_init.c.inc
>> rename to target/ppc/cpu_init.c
>> index b329e953cb..f0f8fc481e 100644
>> --- a/target/ppc/translate_init.c.inc
>> +++ b/target/ppc/cpu_init.c
>> @@ -18,6 +18,7 @@
>>    * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>>    */
>>   
>> +#include "qemu/osdep.h"
>>   #include "disas/dis-asm.h"
>>   #include "exec/gdbstub.h"
>>   #include "kvm_ppc.h"
>> @@ -42,6 +43,10 @@
>>   #include "fpu/softfloat.h"
>>   #include "qapi/qapi-commands-machine-target.h"
>>   
>> +#include "helper_regs.h"
>> +#include "internal.h"
>> +#include "spr_tcg.h"
> These two includes look like they belong in patch 3 and 4 respectively.
>
> And we probably want an #ifdef CONFIG_TCG around them.

Just to make sure, you mean spr_tcg.h and internal.h, right?

Internal.h needs to be included regardless, since it holds some 
functions always required for init_proc, like ppc_gdb_init. These bits 
will be removed on the patch series that specifically disable them if we 
can.

spr_tcg.h only has function prototypes, so I don't think it's a problem 
to include it in case of !TCG. Some .h were removed in the other RFC 
because they needed files that weren't in the include path. If we should 
remove it anyway, I can add that :)

>> +
>>   /* #define PPC_DEBUG_SPR */
>>   /* #define USE_APPLE_GDB */
>>   
>> @@ -49,7 +54,12 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
>>   {
>>       /* Altivec always uses round-to-nearest */
>>       set_float_rounding_mode(float_round_nearest_even, &env->vec_status);
>> -    helper_mtvscr(env, val);
>> +    /*
>> +     * This comment is here just so the project will build.
>> +     * The current solution is in another patch and will be
>> +     * added when we figure out an internal fork of qemu
>> +     */
>> +    /* helper_mtvscr(env, val); */
>>   }
>>   
>>   #ifdef CONFIG_TCG
>> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
>> index bbfef90e08..ad53629298 100644
>> --- a/target/ppc/meson.build
>> +++ b/target/ppc/meson.build
>> @@ -2,6 +2,7 @@ ppc_ss = ss.source_set()
>>   ppc_ss.add(files(
>>     'cpu-models.c',
>>     'cpu.c',
>> +  'cpu_init.c',
>>     'dfp_helper.c',
>>     'excp_helper.c',
>>     'fpu_helper.c',
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index a6e677fa6d..afb8a2aa27 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -38,6 +38,9 @@
>>   #include "qemu/atomic128.h"
>>   #include "internal.h"
>>   
>> +#include "qemu/qemu-print.h"
>> +#include "qapi/error.h"
>> +#include "internal.h"
> This one is already included.
oops, removed.
>
>>   
>>   #define CPU_SINGLE_STEP 0x1
>>   #define CPU_BRANCH_STEP 0x2
>> @@ -7595,7 +7598,6 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E, 0x1F, 0x03FFF800, \
>>   
>>   #include "helper_regs.h"
>>   #include "spr_tcg.c.inc"
>> -#include "translate_init.c.inc"
>>   
>>   /*****************************************************************************/
>>   /* Misc PowerPC helpers */
-- 
Bruno Piazera Larsen Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station> 
Departamento Computação Embarcada Analista de Software Trainee Aviso 
Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------16B9D97FD0AFAA4BDB82A4E2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 29/04/2021 18:23, Fabiano Rosas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:874kfo3hvh.fsf@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">"Bruno Larsen (billionai)" <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">finished isolation of CPU initialization logic from
translation logic. CPU initialization now only has common code
which may or may not call accelerator-specific code, as the
build options require, and is compiled separately.

Signed-off-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
---
 target/ppc/{translate_init.c.inc =&gt; cpu_init.c} | 12 +++++++++++-
 target/ppc/meson.build                          |  1 +
 target/ppc/translate.c                          |  4 +++-
 3 files changed, 15 insertions(+), 2 deletions(-)
 rename target/ppc/{translate_init.c.inc =&gt; cpu_init.c} (99%)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/cpu_init.c
similarity index 99%
rename from target/ppc/translate_init.c.inc
rename to target/ppc/cpu_init.c
index b329e953cb..f0f8fc481e 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/cpu_init.c
@@ -18,6 +18,7 @@
  * License along with this library; if not, see <a class="moz-txt-link-rfc2396E" href="http://www.gnu.org/licenses/">&lt;http://www.gnu.org/licenses/&gt;</a>.
  */
 
+#include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 #include "exec/gdbstub.h"
 #include "kvm_ppc.h"
@@ -42,6 +43,10 @@
 #include "fpu/softfloat.h"
 #include "qapi/qapi-commands-machine-target.h"
 
+#include "helper_regs.h"
+#include "internal.h"
+#include "spr_tcg.h"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
These two includes look like they belong in patch 3 and 4 respectively.

And we probably want an #ifdef CONFIG_TCG around them.</pre>
    </blockquote>
    <p>Just to make sure, you mean spr_tcg.h and internal.h, right?</p>
    <p>Internal.h needs to be included regardless, since it holds some
      functions always required for init_proc, like ppc_gdb_init. These
      bits will be removed on the patch series that specifically disable
      them if we can.</p>
    <p> spr_tcg.h only has function prototypes, so I don't think it's a
      problem to include it in case of !TCG. Some .h were removed in the
      other RFC because they needed files that weren't in the include
      path. If we should remove it anyway, I can add that :)
    </p>
    <blockquote type="cite" cite="mid:874kfo3hvh.fsf@linux.ibm.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
 /* #define PPC_DEBUG_SPR */
 /* #define USE_APPLE_GDB */
 
@@ -49,7 +54,12 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
 {
     /* Altivec always uses round-to-nearest */
     set_float_rounding_mode(float_round_nearest_even, &amp;env-&gt;vec_status);
-    helper_mtvscr(env, val);
+    /*
+     * This comment is here just so the project will build.
+     * The current solution is in another patch and will be
+     * added when we figure out an internal fork of qemu
+     */
+    /* helper_mtvscr(env, val); */
 }
 
 #ifdef CONFIG_TCG
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index bbfef90e08..ad53629298 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -2,6 +2,7 @@ ppc_ss = ss.source_set()
 ppc_ss.add(files(
   'cpu-models.c',
   'cpu.c',
+  'cpu_init.c',
   'dfp_helper.c',
   'excp_helper.c',
   'fpu_helper.c',
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index a6e677fa6d..afb8a2aa27 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -38,6 +38,9 @@
 #include "qemu/atomic128.h"
 #include "internal.h"
 
+#include "qemu/qemu-print.h"
+#include "qapi/error.h"
+#include "internal.h"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This one is already included.</pre>
    </blockquote>
    oops, removed.<br>
    <blockquote type="cite" cite="mid:874kfo3hvh.fsf@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 
 #define CPU_SINGLE_STEP 0x1
 #define CPU_BRANCH_STEP 0x2
@@ -7595,7 +7598,6 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E, 0x1F, 0x03FFF800, \
 
 #include "helper_regs.h"
 #include "spr_tcg.c.inc"
-#include "translate_init.c.inc"
 
 /*****************************************************************************/
 /* Misc PowerPC helpers */
</pre>
      </blockquote>
    </blockquote>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a>
      Departamento Computação Embarcada
      Analista de Software Trainee
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------16B9D97FD0AFAA4BDB82A4E2--

