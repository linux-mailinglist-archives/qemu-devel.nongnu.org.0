Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE072D976B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:34:41 +0100 (CET)
Received: from localhost ([::1]:48176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kom7k-0006SD-NU
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kom6e-0005iT-Sg
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:33:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kom6a-00029l-S1
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607945606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9M743yKDgoyvpaqiVO1azJ1L0ILs6m+pNQHTu8iUmc=;
 b=iQJyNntjEPDPcANrhybUpFTpcCGuofaGxyrRwlMa25y3V0rtOw0xkb3ONurhBrVcl5I4dG
 viTq1H7UJ4JFmE3dfD9hSko+osqPR7tpGPyGokAxDOp+SL4gO2IkLZMg6dUwxhYioWl0TY
 hccxjpqapEXkZllrbcLo20n9SFs9Br8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-df5Hxx0IOWefPxGP9OG5Vw-1; Mon, 14 Dec 2020 06:33:24 -0500
X-MC-Unique: df5Hxx0IOWefPxGP9OG5Vw-1
Received: by mail-wm1-f70.google.com with SMTP id r5so6637388wma.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 03:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+9M743yKDgoyvpaqiVO1azJ1L0ILs6m+pNQHTu8iUmc=;
 b=q6C1Vle6ei74tEVaXapRZQd7aEN/GrOxMu+iGtJyxFSI1xuMHw82NlpI7ssG7wRBD+
 KiWC9u5mBV02kCltC91xoGISiBw6NxXwYlLGHpGSbU7vQJslf3yEKIYABpgTUU6+pNvR
 uiAgM9rk4RTlfhysApBY28FciilM9o+l5kYw+xAjkzUG8yq6Acyv94tpnnYu+e3wLYCS
 1wjYWB2R5z+dq64anH4gI9mxNzxgD1X9m7miVFK79bsE3UJzZ+nYn7KiV44dHB6VC4Z2
 ADYBJn00BwDQnFAIqMew4eHRIUMNxXfXnaVILcumiM2xkPV+uhig+lfjuYn2DGi9oKYp
 8RXw==
X-Gm-Message-State: AOAM531BSMNcLbJvhoIGAugywkAn11JzCGQdc2afBXJ6WQowEBLstuCh
 mrJDLLruicuVEiLEXokW/xi+sasyFjbctWWRWY4QljfFXkPrvBQ6rKBWUF9QldrmdNr39muPZ+f
 kqsVFPsvjmPezE+IRtva03KvPwlFb472l4GqWb0mH2jYGvj1UQX2obNWbEz45fK59GDQ=
X-Received: by 2002:a5d:52c1:: with SMTP id r1mr28631413wrv.255.1607945602936; 
 Mon, 14 Dec 2020 03:33:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfzt9ldlmFESG/P+v2ipHWJEx79vy3yEJJVF6CYPtvMm+rnK7aLEYOKOdGJd5MjeZV1kfOKg==
X-Received: by 2002:a5d:52c1:: with SMTP id r1mr28631385wrv.255.1607945602615; 
 Mon, 14 Dec 2020 03:33:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id s12sm8122254wmh.29.2020.12.14.03.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 03:33:21 -0800 (PST)
Subject: Re: [PATCH v4 5/5] docs: Add CFI Documentation
To: Daniele Buono <dbuono@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
 <20201204230615.2392-6-dbuono@linux.vnet.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f5e21cf1-8a69-d451-d69f-2b975ec24838@redhat.com>
Date: Mon, 14 Dec 2020 12:33:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201204230615.2392-6-dbuono@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/12/20 00:06, Daniele Buono wrote:
> Document how to compile with CFI and how to maintain CFI-safe code
> 
> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> ---
>   docs/devel/control-flow-integrity.rst | 137 ++++++++++++++++++++++++++
>   1 file changed, 137 insertions(+)
>   create mode 100644 docs/devel/control-flow-integrity.rst

You would have to add the file to docs/devel/index.rst as well.  I'll do it.

Paolo

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
> 


