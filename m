Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1703D6C3509
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 16:06:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pedYZ-0002FT-Nm; Tue, 21 Mar 2023 11:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pedYX-0002Ex-Uy
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 11:05:45 -0400
Received: from out-21.mta1.migadu.com ([2001:41d0:203:375::15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pedYW-0008Kh-9z
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 11:05:45 -0400
Date: Tue, 21 Mar 2023 16:05:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1679411142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JyvQw2WBRS/YLRqGgensv+vuNhTLTecf55q+CfuCMpA=;
 b=Dg7Lu5uJmd2wB6AmU7Llz8L584EHLEVAf793bPL4VUZ5t3eNaLIcBtz00PL34pqbj42uLX
 UxvCu0T9yzj1CQMJtdSAvWyBhx16NjiDqHIQazvT4ld/b5JuaepEZ5A3VcGLHntsn9Nvqm
 tNs3lf6bYG5vH+S5RPFwl8Pli1kodV0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev,
 qemu-arm@nongnu.org
Subject: Re: [kvm-unit-tests PATCH v10 5/7] arm/locking-tests: add
 comprehensive locking test
Message-ID: <20230321150541.bkqkcoyc3hb443tj@orel>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230307112845.452053-6-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307112845.452053-6-alex.bennee@linaro.org>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:203:375::15;
 envelope-from=andrew.jones@linux.dev; helo=out-21.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 07, 2023 at 11:28:43AM +0000, Alex Bennée wrote:
> This test has been written mainly to stress multi-threaded TCG behaviour
> but will demonstrate failure by default on real hardware. The test takes
> the following parameters:
> 
>   - "lock" use GCC's locking semantics
>   - "atomic" use GCC's __atomic primitives
>   - "wfelock" use WaitForEvent sleep
>   - "excl" use load/store exclusive semantics
> 
> Also two more options allow the test to be tweaked
> 
>   - "noshuffle" disables the memory shuffling
>   - "count=%ld" set your own per-CPU increment count
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211118184650.661575-8-alex.bennee@linaro.org>
> 
> ---
> v9
>   - move back to unittests.cfg, drop accel=tcg
>   - s/printf/report_info
> v10
>   - dropped spare extra line in shuffle_memory
> ---
>  arm/Makefile.common |   2 +-
>  arm/locking-test.c  | 321 ++++++++++++++++++++++++++++++++++++++++++++
>  arm/spinlock-test.c |  87 ------------
>  arm/unittests.cfg   |  30 +++++
>  4 files changed, 352 insertions(+), 88 deletions(-)
>  create mode 100644 arm/locking-test.c
>  delete mode 100644 arm/spinlock-test.c
> 
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index 2c4aad38..3089e3bf 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -5,7 +5,6 @@
>  #
>  
>  tests-common  = $(TEST_DIR)/selftest.flat
> -tests-common += $(TEST_DIR)/spinlock-test.flat
>  tests-common += $(TEST_DIR)/pci-test.flat
>  tests-common += $(TEST_DIR)/pmu.flat
>  tests-common += $(TEST_DIR)/gic.flat
> @@ -13,6 +12,7 @@ tests-common += $(TEST_DIR)/psci.flat
>  tests-common += $(TEST_DIR)/sieve.flat
>  tests-common += $(TEST_DIR)/pl031.flat
>  tests-common += $(TEST_DIR)/tlbflush-code.flat
> +tests-common += $(TEST_DIR)/locking-test.flat
>  
>  tests-all = $(tests-common) $(tests)
>  all: directories $(tests-all)
> diff --git a/arm/locking-test.c b/arm/locking-test.c
> new file mode 100644
> index 00000000..a49c2fd1
> --- /dev/null
> +++ b/arm/locking-test.c
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Locking Test
> + *
> + * This test allows us to stress the various atomic primitives of a VM
> + * guest. A number of methods are available that use various patterns
> + * to implement a lock.
> + *
> + * Copyright (C) 2017 Linaro
> + * Author: Alex Bennée <alex.bennee@linaro.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <libcflat.h>
> +#include <asm/smp.h>
> +#include <asm/cpumask.h>
> +#include <asm/barrier.h>
> +#include <asm/mmu.h>
> +
> +#include <prng.h>
> +
> +#define MAX_CPUS 8
> +
> +/* Test definition structure
> + *
> + * A simple structure that describes the test name, expected pass and
> + * increment function.
> + */

nit: This and many comment blocks below are missing their opening wings.

Thanks,
drew

