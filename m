Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F5C6C3502
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 16:03:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pedVN-0008Qd-Be; Tue, 21 Mar 2023 11:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pedVL-0008Pk-8V
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 11:02:27 -0400
Received: from out-34.mta1.migadu.com ([95.215.58.34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pedVI-0006gI-HB
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 11:02:26 -0400
Date: Tue, 21 Mar 2023 16:02:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1679410941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tzSEVJ2SDKpJ+vRTvYPOoMqo7Umkk1ArseN9prU8KHc=;
 b=gO6RhQT/pkZpgZcwRBDzSLuAmpwO79ySxzswnnvc58peGEaSDjvnZvz/Py555DzUE8dUs7
 UBuWyl2ai5Cb5YXUiwg6bHm2J+2fntJIlfNxrSob7sO1rmpZhyRxBcvcM01vfBo+B42i/w
 LwBYJeA0tzFamoY7wrzXjrfP7dw4g3o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev,
 qemu-arm@nongnu.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [kvm-unit-tests PATCH v10 4/7] arm/tlbflush-code: TLB flush
 during code execution
Message-ID: <20230321150220.mfrvgxg3ebju5e6k@orel>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230307112845.452053-5-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307112845.452053-5-alex.bennee@linaro.org>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=95.215.58.34; envelope-from=andrew.jones@linux.dev;
 helo=out-34.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Mar 07, 2023 at 11:28:42AM +0000, Alex Benn�e wrote:
> This adds a fairly brain dead torture test for TLB flushes intended
> for stressing the MTTCG QEMU build. It takes the usual -smp option for
> multiple CPUs.
> 
> By default it CPU0 will do a TLBIALL flush after each cycle. You can
> pass options via -append to control additional aspects of the test:
> 
>   - "page" flush each page in turn (one per function)
>   - "self" do the flush after each computation cycle
>   - "verbose" report progress on each computation cycle
> 
> Signed-off-by: Alex Benn�e <alex.bennee@linaro.org>
> CC: Mark Rutland <mark.rutland@arm.com>
> Message-Id: <20211118184650.661575-7-alex.bennee@linaro.org>
> 
> ---
> v9
>   - move tests back into unittests.cfg (with nodefault mttcg)
>   - replace printf with report_info
>   - drop accel = tcg
> ---
>  arm/Makefile.common |   1 +
>  arm/tlbflush-code.c | 209 ++++++++++++++++++++++++++++++++++++++++++++
>  arm/unittests.cfg   |  25 ++++++
>  3 files changed, 235 insertions(+)
>  create mode 100644 arm/tlbflush-code.c
> 
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index 16f8c6df..2c4aad38 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -12,6 +12,7 @@ tests-common += $(TEST_DIR)/gic.flat
>  tests-common += $(TEST_DIR)/psci.flat
>  tests-common += $(TEST_DIR)/sieve.flat
>  tests-common += $(TEST_DIR)/pl031.flat
> +tests-common += $(TEST_DIR)/tlbflush-code.flat
>  
>  tests-all = $(tests-common) $(tests)
>  all: directories $(tests-all)
> diff --git a/arm/tlbflush-code.c b/arm/tlbflush-code.c
> new file mode 100644
> index 00000000..bf9eb111
> --- /dev/null
> +++ b/arm/tlbflush-code.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * TLB Flush Race Tests
> + *
> + * These tests are designed to test for incorrect TLB flush semantics
> + * under emulation. The initial CPU will set all the others working a
> + * compuation task and will then trigger TLB flushes across the

computation

> + * system. It doesn't actually need to re-map anything but the flushes
> + * themselves will trigger QEMU's TCG self-modifying code detection
> + * which will invalidate any generated  code causing re-translation.
> + * Eventually the code buffer will fill and a general tb_lush() will
> + * be triggered.
> + *
> + * Copyright (C) 2016-2021, Linaro, Alex Benn�e <alex.bennee@linaro.org>
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.
> + */
> +
> +#include <libcflat.h>
> +#include <asm/smp.h>
> +#include <asm/cpumask.h>
> +#include <asm/barrier.h>
> +#include <asm/mmu.h>
> +
> +#define SEQ_LENGTH 10
> +#define SEQ_HASH 0x7cd707fe
> +
> +static cpumask_t smp_test_complete;
> +static int flush_count = 1000000;
> +static bool flush_self;
> +static bool flush_page;
> +static bool flush_verbose;
> +
> +/*
> + * Work functions
> + *
> + * These work functions need to be:
> + *
> + *  - page aligned, so we can flush one function at a time
> + *  - have branches, so QEMU TCG generates multiple basic blocks
> + *  - call across pages, so we exercise the TCG basic block slow path
> + */
> +
> +/* Adler32 */
> +__attribute__((aligned(PAGE_SIZE))) static
> +uint32_t hash_array(const void *buf, size_t buflen)
> +{
> +	const uint8_t *data = (uint8_t *) buf;
> +	uint32_t s1 = 1;
> +	uint32_t s2 = 0;
> +
> +	for (size_t n = 0; n < buflen; n++) {
> +		s1 = (s1 + data[n]) % 65521;
> +		s2 = (s2 + s1) % 65521;
> +	}
> +	return (s2 << 16) | s1;
> +}
> +
> +__attribute__((aligned(PAGE_SIZE))) static
> +void create_fib_sequence(int length, unsigned int *array)
> +{
> +	int i;
> +
> +	/* first two values */
> +	array[0] = 0;
> +	array[1] = 1;
> +	for (i = 2; i < length; i++)
> +		array[i] = array[i-2] + array[i-1];
> +}
> +
> +__attribute__((aligned(PAGE_SIZE))) static
> +unsigned long long factorial(unsigned int n)
> +{
> +	unsigned int i;
> +	unsigned long long fac = 1;
> +
> +	for (i = 1; i <= n; i++)
> +		fac = fac * i;
> +	return fac;
> +}
> +
> +__attribute__((aligned(PAGE_SIZE))) static
> +void factorial_array(unsigned int n, unsigned int *input,
> +		     unsigned long long *output)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < n; i++)
> +		output[i] = factorial(input[i]);
> +}
> +
> +__attribute__((aligned(PAGE_SIZE))) static
> +unsigned int do_computation(void)
> +{
> +	unsigned int fib_array[SEQ_LENGTH];
> +	unsigned long long facfib_array[SEQ_LENGTH];
> +	uint32_t fib_hash, facfib_hash;
> +
> +	create_fib_sequence(SEQ_LENGTH, &fib_array[0]);
> +	fib_hash = hash_array(&fib_array[0], sizeof(fib_array));
> +	factorial_array(SEQ_LENGTH, &fib_array[0], &facfib_array[0]);
> +	facfib_hash = hash_array(&facfib_array[0], sizeof(facfib_array));
> +
> +	return (fib_hash ^ facfib_hash);
> +}
> +
> +/* This provides a table of the work functions so we can flush each
> + * page individually
> + */
> +static void *pages[] = {&hash_array, &create_fib_sequence, &factorial,
> +			&factorial_array, &do_computation};
> +
> +static void do_flush(int i)
> +{
> +	if (flush_page)
> +		flush_tlb_page((unsigned long)pages[i % ARRAY_SIZE(pages)]);
> +	else
> +		flush_tlb_all();
> +}
> +
> +
> +static void just_compute(void)
> +{
> +	int i, errors = 0;
> +	int cpu = smp_processor_id();
> +
> +	uint32_t result;
> +
> +	report_info("CPU%d online", cpu);
> +
> +	for (i = 0 ; i < flush_count; i++) {
> +		result = do_computation();
> +
> +		if (result != SEQ_HASH) {
> +			errors++;
> +			report_info("CPU%d: seq%d 0x%"PRIx32"!=0x%x",
> +				    cpu, i, result, SEQ_HASH);
> +		}
> +
> +		if (flush_verbose && (i % 1000) == 0)
> +			report_info("CPU%d: seq%d", cpu, i);
> +
> +		if (flush_self)
> +			do_flush(i);
> +	}
> +
> +	report(errors == 0, "CPU%d: Done - Errors: %d", cpu, errors);
> +
> +	cpumask_set_cpu(cpu, &smp_test_complete);
> +	if (cpu != 0)
> +		halt();
> +}
> +
> +static void just_flush(void)
> +{
> +	int cpu = smp_processor_id();
> +	int i = 0;
> +
> +	/*
> +	 * Set our CPU as done, keep flushing until everyone else
> +	 * finished
> +	 */
> +	cpumask_set_cpu(cpu, &smp_test_complete);
> +
> +	while (!cpumask_full(&smp_test_complete))
> +		do_flush(i++);
> +
> +	report_info("CPU%d: Done - Triggered %d flushes", cpu, i);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	int cpu, i;
> +	char prefix[100];
> +
> +	for (i = 0; i < argc; i++) {
> +		char *arg = argv[i];
> +
> +		if (strcmp(arg, "page") == 0)
> +			flush_page = true;
> +
> +		if (strcmp(arg, "self") == 0)
> +			flush_self = true;
> +
> +		if (strcmp(arg, "verbose") == 0)
> +			flush_verbose = true;
> +	}
> +
> +	snprintf(prefix, sizeof(prefix), "tlbflush_%s_%s",
> +		 flush_page ? "page" : "all",
> +		 flush_self ? "self" : "other");
> +	report_prefix_push(prefix);
> +
> +	for_each_present_cpu(cpu) {
> +		if (cpu == 0)
> +			continue;
> +		smp_boot_secondary(cpu, just_compute);
> +	}
> +
> +	if (flush_self)
> +		just_compute();
> +	else
> +		just_flush();
> +
> +	while (!cpumask_full(&smp_test_complete))
> +		cpu_relax();
> +
> +	return report_summary();
> +}
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index 5e67b558..ee21aef4 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -275,3 +275,28 @@ file = debug.flat
>  arch = arm64
>  extra_params = -append 'ss-migration'
>  groups = debug migration
> +
> +# TLB Torture Tests
> +[tlbflush-code::all_other]

It's better to use '-', '_', '.', or ',' than '::' because otherwise the
standalone test will have a filename like tests/tlbflush-code::all_other
which will be awkward for shells.

BTW, have you tried running these tests as standalone? Since they're
'nodefault' it'd be good if they work that way.

> +file = tlbflush-code.flat
> +smp = $(($MAX_SMP>4?4:$MAX_SMP))
> +groups = nodefault mttcg
> +
> +[tlbflush-code::page_other]
> +file = tlbflush-code.flat
> +smp = $(($MAX_SMP>4?4:$MAX_SMP))
> +extra_params = -append 'page'
> +groups = nodefault mttcg
> +
> +[tlbflush-code::all_self]
> +file = tlbflush-code.flat
> +smp = $(($MAX_SMP>4?4:$MAX_SMP))
> +extra_params = -append 'self'
> +groups = nodefault mttcg
> +
> +[tlbflush-code::page_self]
> +file = tlbflush-code.flat
> +smp = $(($MAX_SMP>4?4:$MAX_SMP))
> +extra_params = -append 'page self'
> +groups = nodefault mttcg
> +
> -- 
> 2.39.2
>

Thanks,
drew

