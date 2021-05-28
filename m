Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74617394292
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 14:35:21 +0200 (CEST)
Received: from localhost ([::1]:49148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmbhw-0000uz-1d
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 08:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lmbeT-0006zb-TG
 for qemu-devel@nongnu.org; Fri, 28 May 2021 08:31:48 -0400
Received: from [201.28.113.2] (port=3532 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>) id 1lmbeQ-0004AV-9g
 for qemu-devel@nongnu.org; Fri, 28 May 2021 08:31:45 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 28 May 2021 09:31:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id ED5CB8013E3;
 Fri, 28 May 2021 09:31:34 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/devel: Explain in more detail the TB chaining mechanisms
Date: Fri, 28 May 2021 09:30:29 -0300
Message-Id: <20210528123029.143847-1-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 May 2021 12:31:35.0120 (UTC)
 FILETIME=[65B7FD00:01D753BD]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, Luis Pires <luis.pires@eldorado.org.br>,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---

Being new to QEMU, I went through the code to try to understand how
lookup_and_goto_ptr, goto_tb and exit_tb work, and when each should be used.
Thought I'd share what I learned by documenting it, as it might be
useful to other people starting to work on TCG, and will also allow
others to comment on any parts I misunderstood.

 docs/devel/tcg.rst | 96 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 11 deletions(-)

diff --git a/docs/devel/tcg.rst b/docs/devel/tcg.rst
index 4ebde44b9d..d3354b8dcb 100644
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
@@ -31,18 +32,91 @@ Direct block chaining
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
+In its simplest, less optimized form, this is done by exiting from the
+current TB, going through the TB epilogue, and then back to the outer
+execution loop. That’s where QEMU looks for the next TB to execute,
+translating it from the guest architecture if it isn’t already available
+in memory. Then QEMU proceeds to execute this next TB, starting at the
+prologue and then moving on to the translated instructions.
+
+In order to accelerate the most common cases where the TB for the new
+simulated PC is already available, QEMU has mechanisms that allow
+multiple TBs to be chained directly, without having to go back to the
+outer execution loop as described above. These mechanisms are:
+
+``lookup_and_goto_ptr``
+^^^^^^^^^^^^^^^^^^^^^^^
+
+On platforms that support the ``lookup_and_goto_ptr`` mechanism, calling
+``tcg_gen_lookup_and_goto_ptr()`` will emit TCG instructions that call
+a helper function to look for the destination TB, based on
+the CPU state information. If the destination TB is available, a
+``goto_ptr`` TCG instruction is emitted to jump directly to its first
+instruction, skipping the epilogue - execution loop - prologue path.
+If the destination TB is not available, the ``goto_ptr`` instruction
+jumps to the epilogue, effectively exiting from the current TB and
+going back to the execution loop.
+
+On platforms that do not support this mechanism, the
+``tcg_gen_lookup_and_goto_ptr()`` function will just use
+``tcg_gen_exit_tb()`` to exit from the current TB.
+
+``goto_tb + exit_tb``
+^^^^^^^^^^^^^^^^^^^^^
+
+On platforms that support this mechanism, the translation code usually
+implements branching by performing the following steps:
+
+1. Call ``tcg_gen_goto_tb()`` passing a jump slot index (either 0 or 1)
+   as a parameter
+
+2. Emit TCG instructions to update the CPU state information with the
+   address of the next instruction to execute
+
+3. Call ``tcg_gen_exit_tb()`` passing the address of the current TB and
+   the jump slot index again
+
+Step 1, ``tcg_gen_goto_tb()``, will emit a ``goto_tb`` TCG
+instruction that later on gets translated to a jump to an address
+associated with the specified jump slot. Initially, this is the address
+of step 2's instructions, which update the CPU state information. Step 3,
+``tcg_gen_exit_tb()``, exits from the current TB returning a tagged
+pointer composed of the last executed TB’s address and the jump slot
+index.
+
+The first time this whole sequence is translated to target instructions
+and executed, step 1 doesn’t do anything really useful, as it just jumps
+to step 2. Then the CPU state information gets updated and we exit from
+the current TB. As a result, the behavior is very similar to the less
+optimized form described earlier in this section.
+
+Next, the execution loop looks for the next TB to execute using the
+current CPU state information (creating the TB if it wasn’t already
+available) and, before starting to execute the new TB’s instructions,
+tries to patch the previously executed TB by associating one of its jump
+slots (the one specified in the call to ``tcg_gen_exit_tb()``) with the
+address of the new TB.
+
+The next time this previous TB is executed and we get to that same
+``goto_tb`` step, it will already be patched (assuming the destination TB
+is still in memory) and will jump directly to the first instruction of
+the destination TB, without going back to the outer execution loop.
+The most portable code patches TBs using indirect jumps. An indirect
+jump makes it easier to make the jump target modification atomic. On some
+host architectures (such as x86 and PowerPC), the ``JUMP`` opcode is
 directly patched so that the block chaining has no overhead.
 
+Note that, on step 3 (``tcg_gen_exit_tb()``), in addition to the
+jump slot index, the address of the TB just executed is also returned.
+This is important because that's the TB that will have to be patched
+by the execution loop, and not necessarily the one that was directly
+executed from it. This is due to the fact that the original TB might
+have already been chained to additional TBs, which ended up being
+executed without the execution loop's knowledge.
+
 Self-modifying code and translated code invalidation
 ----------------------------------------------------
 
-- 
2.25.1


