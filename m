Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB703973A4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 14:55:14 +0200 (CEST)
Received: from localhost ([::1]:50060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo3vM-0007sR-NK
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 08:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lo3sl-0006gk-04
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 08:52:31 -0400
Received: from [201.28.113.2] (port=38105 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>) id 1lo3si-0003Xk-GN
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 08:52:30 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 1 Jun 2021 09:51:47 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 4B97180148B;
 Tue,  1 Jun 2021 09:51:47 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] docs/devel: Explain in more detail the TB chaining
 mechanisms
Date: Tue,  1 Jun 2021 09:51:43 -0300
Message-Id: <20210601125143.191165-1-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Jun 2021 12:51:47.0807 (UTC)
 FILETIME=[E23056F0:01D756E4]
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
v3:
 - Dropped "most common" from the sentence introducing the chaining mechanisms
 - Changed wording about using the TB address returned by exit_tb

v2:
 - s/outer execution loop/main loop
 - Mention re-evaluation of cpu_exec_interrupt()
 - Changed wording on lookup_and_goto_ptr()
 - Added more details to step 2 of goto+tb + exit_tb
 - Added details about when goto_tb + exit_tb cannot be used

 docs/devel/tcg.rst | 103 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 91 insertions(+), 12 deletions(-)

diff --git a/docs/devel/tcg.rst b/docs/devel/tcg.rst
index 4ebde44b9d..a65fb7b1c4 100644
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
@@ -31,17 +32,95 @@ Direct block chaining
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
+In order to accelerate the cases where the TB for the new
+simulated PC is already available, QEMU has mechanisms that allow
+multiple TBs to be chained directly, without having to go back to the
+main loop as described above. These mechanisms are:
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
+This address corresponds to the TB that will be patched; it may be
+different than the one that was directly executed from the main loop
+if the latter had already been chained to other TBs.
 
 Self-modifying code and translated code invalidation
 ----------------------------------------------------
-- 
2.25.1


