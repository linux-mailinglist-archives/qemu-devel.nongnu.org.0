Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352AB2CF754
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 00:12:50 +0100 (CET)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klKFt-00064B-9a
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 18:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1klKAP-0002aJ-SE
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 18:07:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:23090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1klKAN-0004Wk-3q
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 18:07:09 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4N6EBw007923
 for <qemu-devel@nongnu.org>; Fri, 4 Dec 2020 18:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pn3RvV+Fir36UeqqAqhL8MtO8lFI+sLT95eQEssV+kU=;
 b=qWl19wSu8UsXTnd1CsuNJVKHlfDWMVCnwV/4JxaA5/mlwYhZ80fxj3ZgpoYa6R7E5Xgg
 V7x213LUhX+exvGL+vUS9syE8Wcha7EhfVDmh4F9RDru61cEAKF/Dwqc0Fx6LbZ2nj8o
 CQDmxSQzSqN0UUiaUpSFuylDwjZmBj9Q4Ay45r/+xLnmaxE9VyYkqODoBMGQMnYL4Gen
 EwxOm9wadyBFCpSkyRL0agGHFbEi+mgJgmY82m4U5q5CGilbaRY2rsTazy6uTkju57cL
 2fTwSZeLETp1wVXdeLeOvQx+5Bdfq6rO5ABaHQzLX7voCm8ETOWnGoT1j9etnMCmTzdN gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357735grar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 18:07:04 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B4N6Y3L008386
 for <qemu-devel@nongnu.org>; Fri, 4 Dec 2020 18:06:56 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357735gr7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 18:06:55 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4MhC4n025328;
 Fri, 4 Dec 2020 23:06:47 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 356cbf3evy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 23:06:47 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4N6kdS6619842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 23:06:46 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38D7E6A057;
 Fri,  4 Dec 2020 23:06:46 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A28CE6A05A;
 Fri,  4 Dec 2020 23:06:45 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.160.122.174])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 23:06:45 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] docs: Add CFI Documentation
Date: Fri,  4 Dec 2020 18:06:15 -0500
Message-Id: <20201204230615.2392-6-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
References: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_13:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=1
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040132
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document how to compile with CFI and how to maintain CFI-safe code

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
---
 docs/devel/control-flow-integrity.rst | 137 ++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 docs/devel/control-flow-integrity.rst

diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
new file mode 100644
index 0000000000..ec54d16a42
--- /dev/null
+++ b/docs/devel/control-flow-integrity.rst
@@ -0,0 +1,137 @@
+============================
+Control-Flow Integrity (CFI)
+============================
+
+This document describes the current control-flow integrity (CFI) mechanism in
+QEMU. How it can be enabled, its benefits and deficiencies, and how it affects
+new and existing code in QEMU
+
+Basics
+------
+
+CFI is a hardening technique that focusing on guaranteeing that indirect
+function calls have not been altered by an attacker.
+The type used in QEMU is a forward-edge control-flow integrity that ensures
+function calls performed through function pointers, always call a "compatible"
+function. A compatible function is a function with the same signature of the
+function pointer declared in the source code.
+
+This type of CFI is entirely compiler-based and relies on the compiler knowing
+the signature of every function and every function pointer used in the code.
+As of now, the only compiler that provides support for CFI is Clang.
+
+CFI is best used on production binaries, to protect against unknown attack
+vectors.
+
+In case of a CFI violation (i.e. call to a non-compatible function) QEMU will
+terminate abruptly, to stop the possible attack.
+
+Building with CFI
+-----------------
+
+NOTE: CFI requires the use of link-time optimization. Therefore, when CFI is
+selected, LTO will be automatically enabled.
+
+To build with CFI, the minimum requirement is Clang 6+. If you
+are planning to also enable fuzzing, then Clang 11+ is needed (more on this
+later).
+
+Given the use of LTO, a version of AR that supports LLVM IR is required.
+The easies way of doing this is by selecting the AR provided by LLVM::
+
+ AR=llvm-ar-9 CC=clang-9 CXX=lang++-9 /path/to/configure --enable-cfi
+
+CFI is enabled on every binary produced.
+
+If desired, an additional flag to increase the verbosity of the output in case
+of a CFI violation is offered (``--enable-debug-cfi``).
+
+Using QEMU built with CFI
+-------------------------
+
+A binary with CFI will work exactly like a standard binary. In case of a CFI
+violation, the binary will terminate with an illegal instruction signal.
+
+Incompatible code with CFI
+--------------------------
+
+As mentioned above, CFI is entirely compiler-based and therefore relies on
+compile-time knowledge of the code. This means that, while generally supported
+for most code, some specific use pattern can break CFI compatibility, and
+create false-positives. The two main patterns that can cause issues are:
+
+* Just-in-time compiled code: since such code is created at runtime, the jump
+  to the buffer containing JIT code will fail.
+
+* Libraries loaded dynamically, e.g. with dlopen/dlsym, since the library was
+  not known at compile time.
+
+Current areas of QEMU that are not entirely compatible with CFI are:
+
+1. TCG, since the idea of TCG is to pre-compile groups of instructions at
+   runtime to speed-up interpretation, quite similarly to a JIT compiler
+
+2. TCI, where the interpreter has to interpret the generic *call* operation
+
+3. Plugins, since a plugin is implemented as an external library
+
+4. Modules, since they are implemented as an external library
+
+5. Directly calling signal handlers from the QEMU source code, since the
+   signal handler may have been provided by an external library or even plugged
+   at runtime.
+
+Disabling CFI for a specific function
+-------------------------------------
+
+If you are working on function that is performing a call using an
+incompatible way, as described before, you can selectively disable CFI checks
+for such function by using the decorator ``QEMU_DISABLE_CFI`` at function
+definition, and add an explanation on why the function is not compatible
+with CFI. An example of the use of ``QEMU_DISABLE_CFI`` is provided here::
+
+	/*
+	 * Disable CFI checks.
+	 * TCG creates binary blobs at runtime, with the transformed code.
+	 * A TB is a blob of binary code, created at runtime and called with an
+	 * indirect function call. Since such function did not exist at compile time,
+	 * the CFI runtime has no way to verify its signature and would fail.
+	 * TCG is not considered a security-sensitive part of QEMU so this does not
+	 * affect the impact of CFI in environment with high security requirements
+	 */
+	QEMU_DISABLE_CFI
+	static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
+
+NOTE: CFI needs to be disabled at the **caller** function, (i.e. a compatible
+cfi function that calls a non-compatible one), since the check is performed
+when the function call is performed.
+
+CFI and fuzzing
+---------------
+
+There is generally no advantage of using CFI and fuzzing together, because
+they target different environments (production for CFI, debug for fuzzing).
+
+CFI could be used in conjunction with fuzzing to identify a broader set of
+bugs that may not end immediately in a segmentation fault or triggering
+an assertion. However, other sanitizers such as address and ub sanitizers
+can identify such bugs in a more precise way than CFI.
+
+There is, however, an interesting use case in using CFI in conjunction with
+fuzzing, that is to make sure that CFI is not triggering any false positive
+in remote-but-possible parts of the code.
+
+CFI can be enabled with fuzzing, but with some caveats:
+1. Fuzzing relies on the linker performing function wrapping at link-time.
+The standard BFD linker does not support function wrapping when LTO is
+also enabled. The workaround is to use LLVM's lld linker.
+2. Fuzzing also relies on a custom linker script, which is only supported by
+lld with version 11+.
+
+In other words, to compile with fuzzing and CFI, clang 11+ is required, and
+lld needs to be used as a linker::
+
+ AR=llvm-ar-11 CC=clang-11 CXX=lang++-11 /path/to/configure --enable-cfi \
+                           -enable-fuzzing --extra-ldflags="-fuse-ld=lld"
+
+and then, compile the fuzzers as usual.
-- 
2.17.1


