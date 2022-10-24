Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4D260BE32
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:08:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6Vk-00087C-0b; Mon, 24 Oct 2022 19:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6Vf-00086o-KZ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:05:32 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6VX-000540-FU
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:05:30 -0400
Received: by mail-pf1-x430.google.com with SMTP id y13so5689723pfp.7
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kOZLxm5AUoiJfr1Kk+SPYSNiB6PkyBK08ypDQFJI/BA=;
 b=b2tz8zLcFAzoKPqiQDmO1je4Gt39W/eaEzd9IXq7rW86bQU0VM/CScKo6wB/YapnRy
 YnMqzuLvkJkYAdDr9dHz/nv9YasxF0+EwN7hCCCVfEWunLFNYld7lRkr+FUfHM+Uz12k
 eGOj+01ZUuLDXQRJNp9BwYN/ThjHGHUl7/oVpWF/VvmNEU5SDNLfmE460nzPPwFgVcXN
 34KsIxqrmik2JM+XRFvnVwz7mnCWGOpa5v0MbzXhIxni1YzjjPWgcRt73xv8pmwoXAIL
 RooJs2e1meDYump4aquUo6NWWJVqvqqgfcuKk+h1acsJcgzYQoTTVQhouiaPGYHb2obg
 8Ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kOZLxm5AUoiJfr1Kk+SPYSNiB6PkyBK08ypDQFJI/BA=;
 b=KwLyralm+Gwhrd3WRN8QzW7R58YAmuIsp+R0bW32ayBBA/I0hC1KkrSdwJKQhEsqvR
 m4sV3BRRH/kG7rQleE5QdeeDYSEH1MQ5NLgAUvXUjXsEFNc2i3uxks+pf7tEt6DbL3VT
 0vJAs6gLfkKJc/P/c0O3pOzOabBOieIOckjqde4FaLMLmIGbUEgYc6golN9Cv+Zusong
 VW8xFDazzHXC+sSn5j2+nEb13ZPVI5s4CVIVmPiM3wcT48lwpNOet+ME6He+7Qs9u6LI
 sLTU5fnmgDeAR7i6TfZ4xN5D5SSgTetlUgWGSsQT0/ohzB46rJ3UbCeLvzFHige2rTjm
 uuzQ==
X-Gm-Message-State: ACrzQf2nQtdapGrRYmRRSyRNxnvvuXZCQkyW64/Xbw5KtYMdzkLjN9ZI
 dOZvZ8640hBH/ZtzOb3lNztF9qCTVZz4ig==
X-Google-Smtp-Source: AMsMyM4VxOPIVcES82/k5n1W4Dtus0fyChVHF7cGU4JFZRdllkaRAHbFL/sKwU2jrtP4FTWZKFEYrw==
X-Received: by 2002:a63:4949:0:b0:442:b733:2fae with SMTP id
 y9-20020a634949000000b00442b7332faemr29325625pgk.424.1666652721893; 
 Mon, 24 Oct 2022 16:05:21 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 iw17-20020a170903045100b001822121c45asm234150plb.28.2022.10.24.16.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 16:05:20 -0700 (PDT)
Message-ID: <3e4c11d9-c4d2-f0ea-0728-8285e02bbfed@linaro.org>
Date: Tue, 25 Oct 2022 09:05:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 00/24] accel/tcg: Rewrite user-only vma tracking
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping.

On 10/6/22 13:10, Richard Henderson wrote:
> The primary motivator here are the numerous bug reports (e.g. #290)
> about not being able to handle very large memory allocations.
> I presume all or most of these are due to guest use of the clang
> address sanitizer, which allocates a massive shadow vma.
> 
> This patch set copies the linux kernel code for interval trees,
> which is what the kernel itself uses for managing vmas.  I then
> purge all (real) use of PageDesc from user-only.  This is easy
> for user-only because everything tricky happens under mmap_lock();
> 
> I have thought only briefly about using interval trees for system
> mode too, but the locking situation there is more difficult.  So
> for now that code gets moved around but not substantially changed.
> 
> The test case from #290 is added to test/tcg/multiarch/.
> Before this patch set, on my moderately beefy laptop, it takes 39s
> and has an RSS of 28GB before the qemu process is killed.  After
> the patch set, the test case successfully allocates 16TB and
> completes in 0.013s.
> 
> 
> r~
> 
> 
> Richard Henderson (24):
>    util: Add interval-tree.c
>    accel/tcg: Make page_alloc_target_data allocation constant
>    accel/tcg: Remove disabled debug in translate-all.c
>    accel/tcg: Split out PageDesc to internal.h
>    accel/tcg: Split out tb-maint.c
>    accel/tcg: Move assert_no_pages_locked to internal.h
>    accel/tcg: Drop cpu_get_tb_cpu_state from TARGET_HAS_PRECISE_SMC
>    accel/tcg: Remove duplicate store to tb->page_addr[]
>    accel/tcg: Introduce tb_{set_}page_addr{0,1}
>    accel/tcg: Rename tb_invalidate_phys_page
>    accel/tcg: Rename tb_invalidate_phys_page_range and drop end parameter
>    accel/tcg: Unify declarations of tb_invalidate_phys_range
>    accel/tcg: Use tb_invalidate_phys_page in page_set_flags
>    accel/tcg: Call tb_invalidate_phys_page for PAGE_RESET
>    accel/tcg: Use interval tree for TBs in user-only mode
>    accel/tcg: Use page_reset_target_data in page_set_flags
>    accel/tcg: Use tb_invalidate_phys_range in page_set_flags
>    accel/tcg: Move TARGET_PAGE_DATA_SIZE impl to user-exec.c
>    accel/tcg: Simplify page_get/alloc_target_data
>    accel/tcg: Use interval tree for TARGET_PAGE_DATA_SIZE
>    accel/tcg: Move page_{get,set}_flags to user-exec.c
>    accel/tcg: Use interval tree for user-only page tracking
>    accel/tcg: Move PageDesc tree into tb-maint.c for system
>    accel/tcg: Move remainder of page locking to tb-maint.c
> 
>   accel/tcg/internal.h            |   40 +
>   include/exec/cpu-all.h          |   22 +-
>   include/exec/exec-all.h         |   75 +-
>   include/exec/ram_addr.h         |    2 -
>   include/exec/translate-all.h    |    8 +-
>   include/qemu/interval-tree.h    |   99 ++
>   target/arm/cpu.h                |    8 +
>   target/arm/internals.h          |    4 -
>   accel/tcg/cpu-exec.c            |    9 +-
>   accel/tcg/tb-maint.c            | 1222 ++++++++++++++++++++++
>   accel/tcg/translate-all.c       | 1683 +------------------------------
>   accel/tcg/translator.c          |    9 +-
>   accel/tcg/user-exec.c           |  662 ++++++++++++
>   bsd-user/mmap.c                 |    2 -
>   cpu.c                           |    4 +-
>   linux-user/mmap.c               |    4 -
>   target/arm/mte_helper.c         |    5 -
>   tests/tcg/multiarch/test-vma.c  |   22 +
>   tests/unit/test-interval-tree.c |  209 ++++
>   util/interval-tree.c            |  881 ++++++++++++++++
>   accel/tcg/meson.build           |    1 +
>   tests/unit/meson.build          |    1 +
>   util/meson.build                |    1 +
>   23 files changed, 3235 insertions(+), 1738 deletions(-)
>   create mode 100644 include/qemu/interval-tree.h
>   create mode 100644 accel/tcg/tb-maint.c
>   create mode 100644 tests/tcg/multiarch/test-vma.c
>   create mode 100644 tests/unit/test-interval-tree.c
>   create mode 100644 util/interval-tree.c
> 


