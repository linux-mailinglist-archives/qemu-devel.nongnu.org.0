Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF52373987
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:35:40 +0200 (CEST)
Received: from localhost ([::1]:40174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFoZ-0007Xi-OD
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1leFjR-0004sr-G7; Wed, 05 May 2021 07:30:21 -0400
Received: from [201.28.113.2] (port=48173 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1leFjO-0004lA-H3; Wed, 05 May 2021 07:30:21 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 5 May 2021 08:30:14 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id EEC118013C2;
 Wed,  5 May 2021 08:30:13 -0300 (-03)
Subject: Re: [PATCH v4 0/5] target/ppc: Untangle CPU init from translation
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210504140157.76066-1-bruno.larsen@eldorado.org.br>
 <87im3y1bgr.fsf@linux.ibm.com>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <65dd8031-2feb-4ece-58ed-dbe7a9af324d@eldorado.org.br>
Date: Wed, 5 May 2021 08:30:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87im3y1bgr.fsf@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------0FEE34B890A93C2503F3C24F"
Content-Language: en-US
X-OriginalArrivalTime: 05 May 2021 11:30:14.0378 (UTC)
 FILETIME=[045314A0:01D741A2]
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
Cc: richard.henderson@linaro.org, lucas.araujo@eldorado.org.br,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------0FEE34B890A93C2503F3C24F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 04/05/2021 17:38, Fabiano Rosas wrote:
> "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:
>
>> Based-on: ppc-for-6.1 tree
>>
>> This patch series aims to remove the logic of initializing CPU from
>> the file related to TCG translation. To achieve this, we have to make
>> it so registering SPRs isn't directly tied to TCG, and move code only
>> related to translation out of translate_init.c.inc and into translate.c.
>> This is in preparation to compile this target without TCG.
>>
>> Changes for v4:
>>   * reordered patches, to make partially applying simpler
>>   * removed patches that were already applied
>>   * undone creation of spt_tcg.c.inc, now waiting for further cleanup
>>   * moved SPR_NOACCESS motion to last patch, and to spr_tcg.h
>>
>> Changes for v3:
>>   * fixed the parameters of _spr_register
>>   * remove some redundant #include statements
>>   * removed some functions that were mentioned in v2 as unnecessary
>>   * added copyright header to relevant files
>>   * removed first patch, that was already applied
>>   * removed a changed that would add a regression
>>
>>   Changes for v2:
>>   * split and reordered patches, to make it easier to review
>>   * improved commit messages
>>   * Undid creation of spr_common, as it was unnecessary
>>   * kept more functions as static
>>   * ensured that the project builds after every commit
>>
>> Bruno Larsen (billionai) (5):
>>    target/ppc: Fold gen_*_xer into their callers
>>    target/ppc: renamed SPR registration functions
>>    target/ppc: move SPR R/W callbacks to translate.c
>>    target/ppc: turned SPR R/W callbacks not static
>>    target/ppc: isolated cpu init from translation logic
>>
>>   .../ppc/{translate_init.c.inc => cpu_init.c}  | 1848 ++++-------------
>>   target/ppc/meson.build                        |    1 +
>>   target/ppc/spr_tcg.h                          |  136 ++
>>   target/ppc/translate.c                        | 1072 +++++++++-
>>   4 files changed, 1598 insertions(+), 1459 deletions(-)
>>   rename target/ppc/{translate_init.c.inc => cpu_init.c} (89%)
>>   create mode 100644 target/ppc/spr_tcg.h
> We're still missing some changes:
>
> - some files (hw/ppc/pnv.c, hw/ppc/spapr.c) use oea_read to check if an
> SPR exists. This needs to be changed to something that is present in
> both configs (I believe Bruno is working on this).
>
> - The commit 6113563982 ("target/ppc: Clean up _spr_register et al")
> from the ppc-for-6.1 branch missed some TCG-specific code in
> gen_spr_BookE206:

These patches are all in preparation for disabling TCG. I wouldn't 
expect the project to support that flag yet, so the errors make sense 
and are being worked on.

I guess I did things in a weird order, so let me explain my thought 
process for the work so far: In my first RFC (when I still thought it 
was an easy-ish fix) I tried to define what needed to be done so the 
project would build. Then I went back to the drawing board, and decided 
to implement good solutions, and only expect the --disable-tcg to work 
at the very end of these, otherwise the bodged solutions could be 
forgotten and committed into the final tree by accident. Now that I know 
the code motion was done in a satisfactory manner, I'll move on to these 
issues and what else shows up.

>
> $ ../configure --target-list=ppc64-softmmu --disable-tcg
> $ make
> (...)
> [193/264] Compiling C object libqemu-ppc64-softmmu.fa.p/target_ppc_cpu_init.c.o
> FAILED: libqemu-ppc64-softmmu.fa.p/target_ppc_cpu_init.c.o
> (...)
> ../target/ppc/cpu_init.c: In function ‘register_BookE206_sprs’:
> ../target/ppc/cpu_init.c:1207:16: error: variable ‘uea_write’ set but not used [-Werror=unused-but-set-variable]
>           void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =
>                  ^~~~~~~~~
> cc1: all warnings being treated as errors
>
> We need something like:
>
> --- a/target/ppc/translate_init.c.inc   2021-05-04 16:24:53.549556292 -0400
> +++ b/target/ppc/translate_init.c.inc   2021-05-04 16:26:41.005280971 -0400
> @@ -2025,11 +2025,13 @@
>       /* TLB assist registers */
>       /* XXX : not implemented */
>       for (i = 0; i < 8; i++) {
> +#ifdef CONFIG_TCG
>           void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =
>               &spr_write_generic32;
>           if (i == 2 && (mas_mask & (1 << i)) && (env->insns_flags & PPC_64B)) {
>               uea_write = &spr_write_generic;
>           }
> +#endif
>           if (mas_mask & (1 << i)) {
>               spr_register(env, mas_sprn[i], mas_names[i],
>                            SPR_NOACCESS, SPR_NOACCESS,
> ---

Also ran into this problem, I intend to fix it as well. If you find 
anything else, let me know :)

-- 

Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------0FEE34B890A93C2503F3C24F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04/05/2021 17:38, Fabiano Rosas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87im3y1bgr.fsf@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">"Bruno Larsen (billionai)" <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Based-on: ppc-for-6.1 tree

This patch series aims to remove the logic of initializing CPU from
the file related to TCG translation. To achieve this, we have to make
it so registering SPRs isn't directly tied to TCG, and move code only
related to translation out of translate_init.c.inc and into translate.c.
This is in preparation to compile this target without TCG.

Changes for v4:
 * reordered patches, to make partially applying simpler
 * removed patches that were already applied
 * undone creation of spt_tcg.c.inc, now waiting for further cleanup
 * moved SPR_NOACCESS motion to last patch, and to spr_tcg.h

Changes for v3:
 * fixed the parameters of _spr_register
 * remove some redundant #include statements
 * removed some functions that were mentioned in v2 as unnecessary
 * added copyright header to relevant files
 * removed first patch, that was already applied
 * removed a changed that would add a regression

 Changes for v2:
 * split and reordered patches, to make it easier to review
 * improved commit messages 
 * Undid creation of spr_common, as it was unnecessary
 * kept more functions as static
 * ensured that the project builds after every commit

Bruno Larsen (billionai) (5):
  target/ppc: Fold gen_*_xer into their callers
  target/ppc: renamed SPR registration functions
  target/ppc: move SPR R/W callbacks to translate.c
  target/ppc: turned SPR R/W callbacks not static
  target/ppc: isolated cpu init from translation logic

 .../ppc/{translate_init.c.inc =&gt; cpu_init.c}  | 1848 ++++-------------
 target/ppc/meson.build                        |    1 +
 target/ppc/spr_tcg.h                          |  136 ++
 target/ppc/translate.c                        | 1072 +++++++++-
 4 files changed, 1598 insertions(+), 1459 deletions(-)
 rename target/ppc/{translate_init.c.inc =&gt; cpu_init.c} (89%)
 create mode 100644 target/ppc/spr_tcg.h
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We're still missing some changes:

- some files (hw/ppc/pnv.c, hw/ppc/spapr.c) use oea_read to check if an
SPR exists. This needs to be changed to something that is present in
both configs (I believe Bruno is working on this).

- The commit 6113563982 ("target/ppc: Clean up _spr_register et al")
from the ppc-for-6.1 branch missed some TCG-specific code in
gen_spr_BookE206:</pre>
    </blockquote>
    <p>These patches are all in preparation for disabling TCG. I
      wouldn't expect the project to support that flag yet, so the
      errors make sense and are being worked on.</p>
    <p>I guess I did things in a weird order, so let me explain my
      thought process for the work so far: In my first RFC (when I still
      thought it was an easy-ish fix) I tried to define what needed to
      be done so the project would build. Then I went back to the
      drawing board, and decided to implement good solutions, and only
      expect the --disable-tcg to work at the very end of these,
      otherwise the bodged solutions could be forgotten and committed
      into the final tree by accident. Now that I know the code motion
      was done in a satisfactory manner, I'll move on to these issues
      and what else shows up.<br>
    </p>
    <blockquote type="cite" cite="mid:87im3y1bgr.fsf@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">

$ ../configure --target-list=ppc64-softmmu --disable-tcg
$ make
(...)
[193/264] Compiling C object libqemu-ppc64-softmmu.fa.p/target_ppc_cpu_init.c.o
FAILED: libqemu-ppc64-softmmu.fa.p/target_ppc_cpu_init.c.o 
(...)
../target/ppc/cpu_init.c: In function ‘register_BookE206_sprs’:
../target/ppc/cpu_init.c:1207:16: error: variable ‘uea_write’ set but not used [-Werror=unused-but-set-variable]
         void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =
                ^~~~~~~~~
cc1: all warnings being treated as errors

We need something like:

--- a/target/ppc/translate_init.c.inc   2021-05-04 16:24:53.549556292 -0400
+++ b/target/ppc/translate_init.c.inc   2021-05-04 16:26:41.005280971 -0400
@@ -2025,11 +2025,13 @@
     /* TLB assist registers */
     /* XXX : not implemented */
     for (i = 0; i &lt; 8; i++) {
+#ifdef CONFIG_TCG
         void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =
             &amp;spr_write_generic32;
         if (i == 2 &amp;&amp; (mas_mask &amp; (1 &lt;&lt; i)) &amp;&amp; (env-&gt;insns_flags &amp; PPC_64B)) {
             uea_write = &amp;spr_write_generic;
         }
+#endif
         if (mas_mask &amp; (1 &lt;&lt; i)) {
             spr_register(env, mas_sprn[i], mas_names[i],
                          SPR_NOACCESS, SPR_NOACCESS,
---</pre>
    </blockquote>
    <p>Also ran into this problem, I intend to fix it as well. If you
      find anything else, let me know :)<br>
    </p>
    <p>-- </p>
    <div class="moz-signature">Bruno Piazera Larsen<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------0FEE34B890A93C2503F3C24F--

