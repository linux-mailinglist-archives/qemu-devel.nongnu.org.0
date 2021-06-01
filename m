Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25973972D6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:54:08 +0200 (CEST)
Received: from localhost ([::1]:37730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2yF-0002kQ-Qp
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lo2st-0004P2-OZ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:48:35 -0400
Received: from [201.28.113.2] (port=59583 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>) id 1lo2so-0005T8-MX
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:48:35 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 1 Jun 2021 08:48:26 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 798BD80148B;
 Tue,  1 Jun 2021 08:48:26 -0300 (-03)
Subject: Re: [PATCH v2] docs/devel: Explain in more detail the TB chaining
 mechanisms
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210531211411.173895-1-luis.pires@eldorado.org.br>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <aa6cfbda-9f95-17c0-a4a8-fef39a90f4fa@eldorado.org.br>
Date: Tue, 1 Jun 2021 08:48:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210531211411.173895-1-luis.pires@eldorado.org.br>
Content-Type: multipart/alternative;
 boundary="------------378E02F79734C2E8335FF12D"
Content-Language: en-US
X-OriginalArrivalTime: 01 Jun 2021 11:48:26.0814 (UTC)
 FILETIME=[089ED5E0:01D756DC]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.613, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------378E02F79734C2E8335FF12D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I don't know enough about the technical information to say if the docs 
are correct, but there were 2 paragraphs where I think wording could be 
improved to make the explanation more clear.

On 31/05/2021 18:14, Luis Pires wrote:
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> ---
> v2:
>   - s/outer execution loop/main loop
>   - Mention re-evaluation of cpu_exec_interrupt()
>   - Changed wording on lookup_and_goto_ptr()
>   - Added more details to step 2 of goto+tb + exit_tb
>   - Added details about when goto_tb + exit_tb cannot be used
>
>   docs/devel/tcg.rst | 105 +++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 93 insertions(+), 12 deletions(-)
>
> diff --git a/docs/devel/tcg.rst b/docs/devel/tcg.rst
> index 4ebde44b9d..9cc56df22a 100644
> --- a/docs/devel/tcg.rst
> +++ b/docs/devel/tcg.rst
> @@ -11,13 +11,14 @@ performances.
>   QEMU's dynamic translation backend is called TCG, for "Tiny Code
>   Generator". For more information, please take a look at ``tcg/README``.
>   
> -Some notable features of QEMU's dynamic translator are:
> +The following sections outline some notable features and implementation
> +details of QEMU's dynamic translator.
>   
>   CPU state optimisations
>   -----------------------
>   
> -The target CPUs have many internal states which change the way it
> -evaluates instructions. In order to achieve a good speed, the
> +The target CPUs have many internal states which change the way they
> +evaluate instructions. In order to achieve a good speed, the
>   translation phase considers that some state information of the virtual
>   CPU cannot change in it. The state is recorded in the Translation
>   Block (TB). If the state changes (e.g. privilege level), a new TB will
> @@ -31,17 +32,97 @@ Direct block chaining
>   ---------------------
>   
>   After each translated basic block is executed, QEMU uses the simulated
> -Program Counter (PC) and other cpu state information (such as the CS
> +Program Counter (PC) and other CPU state information (such as the CS
>   segment base value) to find the next basic block.
>   
> -In order to accelerate the most common cases where the new simulated PC
> -is known, QEMU can patch a basic block so that it jumps directly to the
> -next one.
> -
> -The most portable code uses an indirect jump. An indirect jump makes
> -it easier to make the jump target modification atomic. On some host
> -architectures (such as x86 or PowerPC), the ``JUMP`` opcode is
> -directly patched so that the block chaining has no overhead.
> +In its simplest, less optimized form, this is done by exiting from the
> +current TB, going through the TB epilogue, and then back to the
> +main loop. That’s where QEMU looks for the next TB to execute,
> +translating it from the guest architecture if it isn’t already available
> +in memory. Then QEMU proceeds to execute this next TB, starting at the
> +prologue and then moving on to the translated instructions.
> +
> +Exiting from the TB this way will cause the ``cpu_exec_interrupt()``
> +callback to be re-evaluated before executing additional instructions.
> +It is mandatory to exit this way after any CPU state changes that may
> +unmask interrupts.
> +
> +In order to accelerate the most common cases where the TB for the new
> +simulated PC is already available, QEMU has mechanisms that allow
> +multiple TBs to be chained directly, without having to go back to the
> +main loop as described above. These mechanisms are:

I feel like there is either a comma missing or the paragraph can be 
reordered a bit here. The way it is written means that there are many 
cases where the TB is already available and you'll be explaining how the 
handle the most common of such cases, but by changing the first line to

-In order to accelerate the most common cases where the TB for the new

+In order to accelerate the most common cases, where the TB for the new

You get many cases, the most common of which is the TB being already in 
memory. This sounds to me like the more reasonable, but incorrect, read 
of the paragraph. If I am mistaken and there are indeed many cases where 
the TB is already in memory, I think maybe it can be reordered to make 
this read less likely to happen, by saying something like:

QEMU has mechanisms that allow multiple TBs to be chained directly 
(without having to go back to the main loop described above) that can 
accelerate the most common cases of the TB for the new simulated PC 
already being available.

> +
> +``lookup_and_goto_ptr``
> +^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Calling ``tcg_gen_lookup_and_goto_ptr()`` will emit a call to
> +``helper_lookup_tb_ptr``. This helper will look for an existing TB that
> +matches the current CPU state. If the destination TB is available its
> +code address is returned, otherwise the address of the JIT epilogue is
> +returned. The call to the helper is always followed by the tcg ``goto_ptr``
> +opcode, which branches to the returned address. In this way, we either
> +branch to the next TB or return to the main loop.
> +
> +``goto_tb + exit_tb``
> +^^^^^^^^^^^^^^^^^^^^^
> +
> +The translation code usually implements branching by performing the
> +following steps:
> +
> +1. Call ``tcg_gen_goto_tb()`` passing a jump slot index (either 0 or 1)
> +   as a parameter.
> +
> +2. Emit TCG instructions to update the CPU state with any information
> +   that has been assumed constant and is required by the main loop to
> +   correctly locate and execute the next TB. For most guests, this is
> +   just the PC of the branch destination, but others may store additional
> +   data. The information updated in this step must be inferable from both
> +   ``cpu_get_tb_cpu_state()`` and ``cpu_restore_state()``.
> +
> +3. Call ``tcg_gen_exit_tb()`` passing the address of the current TB and
> +   the jump slot index again.
> +
> +Step 1, ``tcg_gen_goto_tb()``, will emit a ``goto_tb`` TCG
> +instruction that later on gets translated to a jump to an address
> +associated with the specified jump slot. Initially, this is the address
> +of step 2's instructions, which update the CPU state information. Step 3,
> +``tcg_gen_exit_tb()``, exits from the current TB returning a tagged
> +pointer composed of the last executed TB’s address and the jump slot
> +index.
> +
> +The first time this whole sequence is executed, step 1 simply jumps
> +to step 2. Then the CPU state information gets updated and we exit from
> +the current TB. As a result, the behavior is very similar to the less
> +optimized form described earlier in this section.
> +
> +Next, the main loop looks for the next TB to execute using the
> +current CPU state information (creating the TB if it wasn’t already
> +available) and, before starting to execute the new TB’s instructions,
> +patches the previously executed TB by associating one of its jump
> +slots (the one specified in the call to ``tcg_gen_exit_tb()``) with the
> +address of the new TB.
> +
> +The next time this previous TB is executed and we get to that same
> +``goto_tb`` step, it will already be patched (assuming the destination TB
> +is still in memory) and will jump directly to the first instruction of
> +the destination TB, without going back to the main loop.
> +
> +For the ``goto_tb + exit_tb`` mechanism to be used, the following
> +conditions need to be satisfied:
> +
> +* The change in CPU state must be constant, e.g., a direct branch and
> +  not an indirect branch.
> +
> +* The direct branch cannot cross a page boundary. Memory mappings
> +  may change, causing the code at the destination address to change.
> +
> +Note that, on step 3 (``tcg_gen_exit_tb()``), in addition to the
> +jump slot index, the address of the TB just executed is also returned.
> +This is important because that's the TB that will have to be patched
> +by the main loop, and not necessarily the one that was directly
> +executed from it. This is due to the fact that the original TB might
> +have already been chained to additional TBs, which ended up being
> +executed without the main loop's knowledge.

This last paragraph is a bit tough to read, but I don't know a better 
way to write it, so it may just be that this 3rd step is a bit confusing 
at first. Maybe something like:

-This is important because that's the TB that will have to be patched
-by the main loop, and not necessarily the one that was directly
-executed from it. This is due to the fact that the original TB might
-have already been chained to additional TBs, which ended up being
-executed without the main loop's knowledge.
+This address corresponds to the TB that will be patched; it may be
+different than the one that was just executed if the latter has already
+been chained to other TBs.

Could be a bit more clear?

>   
>   Self-modifying code and translated code invalidation
>   ----------------------------------------------------
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------378E02F79734C2E8335FF12D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>I don't know enough about the technical information to say if the
      docs are correct, but there were 2 paragraphs where I think
      wording could be improved to make the explanation more clear.<br>
    </p>
    <div class="moz-cite-prefix">On 31/05/2021 18:14, Luis Pires wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210531211411.173895-1-luis.pires@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Luis Pires <a class="moz-txt-link-rfc2396E" href="mailto:luis.pires@eldorado.org.br">&lt;luis.pires@eldorado.org.br&gt;</a>
---
v2:
 - s/outer execution loop/main loop
 - Mention re-evaluation of cpu_exec_interrupt()
 - Changed wording on lookup_and_goto_ptr()
 - Added more details to step 2 of goto+tb + exit_tb
 - Added details about when goto_tb + exit_tb cannot be used

 docs/devel/tcg.rst | 105 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 93 insertions(+), 12 deletions(-)

diff --git a/docs/devel/tcg.rst b/docs/devel/tcg.rst
index 4ebde44b9d..9cc56df22a 100644
--- a/docs/devel/tcg.rst
+++ b/docs/devel/tcg.rst
@@ -11,13 +11,14 @@ performances.
 QEMU's dynamic translation backend is called TCG, for "Tiny Code
 Generator". For more information, please take a look at ``tcg/README``.
 
-Some notable features of QEMU's dynamic translator are:
+The following sections outline some notable features and implementation
+details of QEMU's dynamic translator.
 
 CPU state optimisations
 -----------------------
 
-The target CPUs have many internal states which change the way it
-evaluates instructions. In order to achieve a good speed, the
+The target CPUs have many internal states which change the way they
+evaluate instructions. In order to achieve a good speed, the
 translation phase considers that some state information of the virtual
 CPU cannot change in it. The state is recorded in the Translation
 Block (TB). If the state changes (e.g. privilege level), a new TB will
@@ -31,17 +32,97 @@ Direct block chaining
 ---------------------
 
 After each translated basic block is executed, QEMU uses the simulated
-Program Counter (PC) and other cpu state information (such as the CS
+Program Counter (PC) and other CPU state information (such as the CS
 segment base value) to find the next basic block.
 
-In order to accelerate the most common cases where the new simulated PC
-is known, QEMU can patch a basic block so that it jumps directly to the
-next one.
-
-The most portable code uses an indirect jump. An indirect jump makes
-it easier to make the jump target modification atomic. On some host
-architectures (such as x86 or PowerPC), the ``JUMP`` opcode is
-directly patched so that the block chaining has no overhead.
+In its simplest, less optimized form, this is done by exiting from the
+current TB, going through the TB epilogue, and then back to the
+main loop. That’s where QEMU looks for the next TB to execute,
+translating it from the guest architecture if it isn’t already available
+in memory. Then QEMU proceeds to execute this next TB, starting at the
+prologue and then moving on to the translated instructions.
+
+Exiting from the TB this way will cause the ``cpu_exec_interrupt()``
+callback to be re-evaluated before executing additional instructions.
+It is mandatory to exit this way after any CPU state changes that may
+unmask interrupts.
+
+In order to accelerate the most common cases where the TB for the new
+simulated PC is already available, QEMU has mechanisms that allow
+multiple TBs to be chained directly, without having to go back to the
+main loop as described above. These mechanisms are:</pre>
    </blockquote>
    <p>I feel like there is either a comma missing or the paragraph can
      be reordered a bit here. The way it is written means that there
      are many cases where the TB is already available and you'll be
      explaining how the handle the most common of such cases, but by
      changing the first line to</p>
    <pre class="moz-quote-pre" wrap="">-In order to accelerate the most common cases where the TB for the new</pre>
    <p>+In order to accelerate the most common cases, where the TB for
      the new</p>
    <p>You get many cases, the most common of which is the TB being
      already in memory. This sounds to me like the more reasonable, but
      incorrect, read of the paragraph. If I am mistaken and there are
      indeed many cases where the TB is already in memory, I think maybe
      it can be reordered to make this read less likely to happen, by
      saying something like:</p>
    <p>QEMU has mechanisms that allow multiple TBs to be chained
      directly (without having to go back to the main loop described
      above) that can accelerate the most common cases of the TB for the
      new simulated PC already being available.</p>
    <blockquote type="cite"
      cite="mid:20210531211411.173895-1-luis.pires@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">
+
+``lookup_and_goto_ptr``
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Calling ``tcg_gen_lookup_and_goto_ptr()`` will emit a call to
+``helper_lookup_tb_ptr``. This helper will look for an existing TB that
+matches the current CPU state. If the destination TB is available its
+code address is returned, otherwise the address of the JIT epilogue is
+returned. The call to the helper is always followed by the tcg ``goto_ptr``
+opcode, which branches to the returned address. In this way, we either
+branch to the next TB or return to the main loop.
+
+``goto_tb + exit_tb``
+^^^^^^^^^^^^^^^^^^^^^
+
+The translation code usually implements branching by performing the
+following steps:
+
+1. Call ``tcg_gen_goto_tb()`` passing a jump slot index (either 0 or 1)
+   as a parameter.
+
+2. Emit TCG instructions to update the CPU state with any information
+   that has been assumed constant and is required by the main loop to
+   correctly locate and execute the next TB. For most guests, this is
+   just the PC of the branch destination, but others may store additional
+   data. The information updated in this step must be inferable from both
+   ``cpu_get_tb_cpu_state()`` and ``cpu_restore_state()``.
+
+3. Call ``tcg_gen_exit_tb()`` passing the address of the current TB and
+   the jump slot index again.
+
+Step 1, ``tcg_gen_goto_tb()``, will emit a ``goto_tb`` TCG
+instruction that later on gets translated to a jump to an address
+associated with the specified jump slot. Initially, this is the address
+of step 2's instructions, which update the CPU state information. Step 3,
+``tcg_gen_exit_tb()``, exits from the current TB returning a tagged
+pointer composed of the last executed TB’s address and the jump slot
+index.
+
+The first time this whole sequence is executed, step 1 simply jumps
+to step 2. Then the CPU state information gets updated and we exit from
+the current TB. As a result, the behavior is very similar to the less
+optimized form described earlier in this section.
+
+Next, the main loop looks for the next TB to execute using the
+current CPU state information (creating the TB if it wasn’t already
+available) and, before starting to execute the new TB’s instructions,
+patches the previously executed TB by associating one of its jump
+slots (the one specified in the call to ``tcg_gen_exit_tb()``) with the
+address of the new TB.
+
+The next time this previous TB is executed and we get to that same
+``goto_tb`` step, it will already be patched (assuming the destination TB
+is still in memory) and will jump directly to the first instruction of
+the destination TB, without going back to the main loop.
+
+For the ``goto_tb + exit_tb`` mechanism to be used, the following
+conditions need to be satisfied:
+
+* The change in CPU state must be constant, e.g., a direct branch and
+  not an indirect branch.
+
+* The direct branch cannot cross a page boundary. Memory mappings
+  may change, causing the code at the destination address to change.
+
+Note that, on step 3 (``tcg_gen_exit_tb()``), in addition to the
+jump slot index, the address of the TB just executed is also returned.
+This is important because that's the TB that will have to be patched
+by the main loop, and not necessarily the one that was directly
+executed from it. This is due to the fact that the original TB might
+have already been chained to additional TBs, which ended up being
+executed without the main loop's knowledge.</pre>
    </blockquote>
    <p>This last paragraph is a bit tough to read, but I don't know a
      better way to write it, so it may just be that this 3rd step is a
      bit confusing at first. Maybe something like:</p>
    <pre class="moz-quote-pre" wrap="">-This is important because that's the TB that will have to be patched
-by the main loop, and not necessarily the one that was directly
-executed from it. This is due to the fact that the original TB might
-have already been chained to additional TBs, which ended up being
-executed without the main loop's knowledge.
+This address corresponds to the TB that will be patched; it may be
+different than the one that was just executed if the latter has already
+been chained to other TBs.

Could be a bit more clear? 
</pre>
    <blockquote type="cite"
      cite="mid:20210531211411.173895-1-luis.pires@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">
 
 Self-modifying code and translated code invalidation
 ----------------------------------------------------
</pre>
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

--------------378E02F79734C2E8335FF12D--

