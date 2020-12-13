Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D12D8B10
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 04:06:43 +0100 (CET)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koHic-0006uG-BU
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 22:06:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1koHhB-0006BM-Op
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 22:05:13 -0500
Received: from relay68.bu.edu ([128.197.228.73]:56647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1koHh8-00027s-VO
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 22:05:12 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 0BD348If027902
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Dec 2020 22:04:13 -0500
Date: Sat, 12 Dec 2020 22:04:08 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 5/5] docs: Add CFI Documentation
Message-ID: <20201213030408.dqt3xt6iloq5qvj7@mozz.bu.edu>
References: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
 <20201204230615.2392-6-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204230615.2392-6-dbuono@linux.vnet.ibm.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.342, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201204 1806, Daniele Buono wrote:
> Document how to compile with CFI and how to maintain CFI-safe code
> 
> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

Thanks

> ---
>  docs/devel/control-flow-integrity.rst | 137 ++++++++++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 docs/devel/control-flow-integrity.rst
> 
> diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
> new file mode 100644
> index 0000000000..ec54d16a42
> --- /dev/null
> +++ b/docs/devel/control-flow-integrity.rst
> @@ -0,0 +1,137 @@
> +============================
> +Control-Flow Integrity (CFI)
> +============================
> +
> +This document describes the current control-flow integrity (CFI) mechanism in
> +QEMU. How it can be enabled, its benefits and deficiencies, and how it affects
> +new and existing code in QEMU
> +
> +Basics
> +------
> +
> +CFI is a hardening technique that focusing on guaranteeing that indirect
> +function calls have not been altered by an attacker.
> +The type used in QEMU is a forward-edge control-flow integrity that ensures
> +function calls performed through function pointers, always call a "compatible"
> +function. A compatible function is a function with the same signature of the
> +function pointer declared in the source code.
> +
> +This type of CFI is entirely compiler-based and relies on the compiler knowing
> +the signature of every function and every function pointer used in the code.
> +As of now, the only compiler that provides support for CFI is Clang.
> +
> +CFI is best used on production binaries, to protect against unknown attack
> +vectors.
> +
> +In case of a CFI violation (i.e. call to a non-compatible function) QEMU will
> +terminate abruptly, to stop the possible attack.
> +
> +Building with CFI
> +-----------------
> +
> +NOTE: CFI requires the use of link-time optimization. Therefore, when CFI is
> +selected, LTO will be automatically enabled.
> +
> +To build with CFI, the minimum requirement is Clang 6+. If you
> +are planning to also enable fuzzing, then Clang 11+ is needed (more on this
> +later).
> +
> +Given the use of LTO, a version of AR that supports LLVM IR is required.
> +The easies way of doing this is by selecting the AR provided by LLVM::
> +
> + AR=llvm-ar-9 CC=clang-9 CXX=lang++-9 /path/to/configure --enable-cfi
> +
> +CFI is enabled on every binary produced.
> +
> +If desired, an additional flag to increase the verbosity of the output in case
> +of a CFI violation is offered (``--enable-debug-cfi``).
> +
> +Using QEMU built with CFI
> +-------------------------
> +
> +A binary with CFI will work exactly like a standard binary. In case of a CFI
> +violation, the binary will terminate with an illegal instruction signal.
> +
> +Incompatible code with CFI
> +--------------------------
> +
> +As mentioned above, CFI is entirely compiler-based and therefore relies on
> +compile-time knowledge of the code. This means that, while generally supported
> +for most code, some specific use pattern can break CFI compatibility, and
> +create false-positives. The two main patterns that can cause issues are:
> +
> +* Just-in-time compiled code: since such code is created at runtime, the jump
> +  to the buffer containing JIT code will fail.
> +
> +* Libraries loaded dynamically, e.g. with dlopen/dlsym, since the library was
> +  not known at compile time.
> +
> +Current areas of QEMU that are not entirely compatible with CFI are:
> +
> +1. TCG, since the idea of TCG is to pre-compile groups of instructions at
> +   runtime to speed-up interpretation, quite similarly to a JIT compiler
> +
> +2. TCI, where the interpreter has to interpret the generic *call* operation
> +
> +3. Plugins, since a plugin is implemented as an external library
> +
> +4. Modules, since they are implemented as an external library
> +
> +5. Directly calling signal handlers from the QEMU source code, since the
> +   signal handler may have been provided by an external library or even plugged
> +   at runtime.
> +
> +Disabling CFI for a specific function
> +-------------------------------------
> +
> +If you are working on function that is performing a call using an
> +incompatible way, as described before, you can selectively disable CFI checks
> +for such function by using the decorator ``QEMU_DISABLE_CFI`` at function
> +definition, and add an explanation on why the function is not compatible
> +with CFI. An example of the use of ``QEMU_DISABLE_CFI`` is provided here::
> +
> +	/*
> +	 * Disable CFI checks.
> +	 * TCG creates binary blobs at runtime, with the transformed code.
> +	 * A TB is a blob of binary code, created at runtime and called with an
> +	 * indirect function call. Since such function did not exist at compile time,
> +	 * the CFI runtime has no way to verify its signature and would fail.
> +	 * TCG is not considered a security-sensitive part of QEMU so this does not
> +	 * affect the impact of CFI in environment with high security requirements
> +	 */
> +	QEMU_DISABLE_CFI
> +	static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
> +
> +NOTE: CFI needs to be disabled at the **caller** function, (i.e. a compatible
> +cfi function that calls a non-compatible one), since the check is performed
> +when the function call is performed.
> +
> +CFI and fuzzing
> +---------------
> +
> +There is generally no advantage of using CFI and fuzzing together, because
> +they target different environments (production for CFI, debug for fuzzing).
> +
> +CFI could be used in conjunction with fuzzing to identify a broader set of
> +bugs that may not end immediately in a segmentation fault or triggering
> +an assertion. However, other sanitizers such as address and ub sanitizers
> +can identify such bugs in a more precise way than CFI.
> +
> +There is, however, an interesting use case in using CFI in conjunction with
> +fuzzing, that is to make sure that CFI is not triggering any false positive
> +in remote-but-possible parts of the code.
> +
> +CFI can be enabled with fuzzing, but with some caveats:
> +1. Fuzzing relies on the linker performing function wrapping at link-time.
> +The standard BFD linker does not support function wrapping when LTO is
> +also enabled. The workaround is to use LLVM's lld linker.
> +2. Fuzzing also relies on a custom linker script, which is only supported by
> +lld with version 11+.
> +
> +In other words, to compile with fuzzing and CFI, clang 11+ is required, and
> +lld needs to be used as a linker::
> +
> + AR=llvm-ar-11 CC=clang-11 CXX=lang++-11 /path/to/configure --enable-cfi \
> +                           -enable-fuzzing --extra-ldflags="-fuse-ld=lld"
> +
> +and then, compile the fuzzers as usual.
> -- 
> 2.17.1
> 
> 

