Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF746C35A2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 16:28:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pedt4-0001EC-8J; Tue, 21 Mar 2023 11:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pedt1-0001DQ-NU
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 11:26:55 -0400
Received: from out-29.mta0.migadu.com ([2001:41d0:1004:224b::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pedsz-00033Y-3e
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 11:26:55 -0400
Date: Tue, 21 Mar 2023 16:26:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1679412410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FgYGwRrLAUU0RjVaToMoeANvITEEdSg9WXChDyLn7uI=;
 b=BgwrBKkk7UIj9CZ+Psd3r/T+xBfX8hsAzbGUjZFLWCLCscBOQGuMrWw38k+Fgnnz/y2GKP
 yyhRhcoZ5cL+4z0tBG2wpTYcdQ/vbX/UY+SLBm5/S1Jqn1D1C1VMNkKNe9OSyL+7JztlH3
 bN/+cXfIvX7s8Rjlvwk7IU9umD01zQE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev,
 qemu-arm@nongnu.org
Subject: Re: [kvm-unit-tests PATCH v10 0/7] MTTCG sanity tests for ARM
Message-ID: <20230321152649.zae7edlfub76fyqq@orel>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307112845.452053-1-alex.bennee@linaro.org>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:1004:224b::1d;
 envelope-from=andrew.jones@linux.dev; helo=out-29.mta0.migadu.com
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

On Tue, Mar 07, 2023 at 11:28:38AM +0000, Alex Bennée wrote:
> I last had a go at getting these up-streamed at the end of 2021 so
> its probably worth having another go. From the last iteration a
> number of the groundwork patches did get merged:
> 
>   Subject: [kvm-unit-tests PATCH v9 0/9] MTTCG sanity tests for ARM
>   Date: Thu,  2 Dec 2021 11:53:43 +0000
>   Message-Id: <20211202115352.951548-1-alex.bennee@linaro.org>
> 
> So this leaves a minor gtags patch, adding the isaac RNG library which
> would also be useful for other users, see:
> 
>   Subject: [kvm-unit-tests PATCH v3 11/27] lib: Add random number generator
>   Date: Tue, 22 Nov 2022 18:11:36 +0200
>   Message-Id: <20221122161152.293072-12-mlevitsk@redhat.com>
> 
> Otherwise there are a few minor checkpatch tweaks.
> 
> I would still like to enable KVM unit tests inside QEMU as things like
> the x86 APIC tests are probably a better fit for unit testing TCG
> emulation than booting a whole OS with various APICs enabled.
> 
> Alex Bennée (7):
>   Makefile: add GNU global tags support
>   add .gitpublish metadata
>   lib: add isaac prng library from CCAN
>   arm/tlbflush-code: TLB flush during code execution
>   arm/locking-tests: add comprehensive locking test
>   arm/barrier-litmus-tests: add simple mp and sal litmus tests
>   arm/tcg-test: some basic TCG exercising tests
> 
>  Makefile                  |   5 +-
>  arm/Makefile.arm          |   2 +
>  arm/Makefile.arm64        |   2 +
>  arm/Makefile.common       |   6 +-
>  lib/arm/asm/barrier.h     |  19 ++
>  lib/arm64/asm/barrier.h   |  50 +++++
>  lib/prng.h                |  83 +++++++
>  lib/prng.c                | 163 ++++++++++++++
>  arm/tcg-test-asm.S        | 171 +++++++++++++++
>  arm/tcg-test-asm64.S      | 170 ++++++++++++++
>  arm/barrier-litmus-test.c | 450 ++++++++++++++++++++++++++++++++++++++
>  arm/locking-test.c        | 321 +++++++++++++++++++++++++++
>  arm/spinlock-test.c       |  87 --------
>  arm/tcg-test.c            | 340 ++++++++++++++++++++++++++++
>  arm/tlbflush-code.c       | 209 ++++++++++++++++++
>  arm/unittests.cfg         | 170 ++++++++++++++
>  .gitignore                |   3 +
>  .gitpublish               |  18 ++
>  18 files changed, 2180 insertions(+), 89 deletions(-)
>  create mode 100644 lib/prng.h
>  create mode 100644 lib/prng.c
>  create mode 100644 arm/tcg-test-asm.S
>  create mode 100644 arm/tcg-test-asm64.S
>  create mode 100644 arm/barrier-litmus-test.c
>  create mode 100644 arm/locking-test.c
>  delete mode 100644 arm/spinlock-test.c
>  create mode 100644 arm/tcg-test.c
>  create mode 100644 arm/tlbflush-code.c
>  create mode 100644 .gitpublish
> 
> -- 
> 2.39.2
>

I don't see any problem with the series, but I didn't review it closely.
I think it's unlikely we'll get reviewers, but, as the tests are
nodefault, then that's probably OK. Can you make sure all tests have a
"tcg" type prefix when they are TCG-only, like the last patch does for
its tests? That will help filter them out when building all tests as
standalone tests. Someday mkstandalone could maybe learn how to build
a directory hierarchy using the group names, e.g.

 tests/mttcg/tlb/all_other

but I don't expect to have time for that myself anytime soon, so prefixes
will likely have to do for now (or forever).

Thanks,
drew

