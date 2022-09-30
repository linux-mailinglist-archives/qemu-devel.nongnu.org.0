Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838AF5F153B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:51:31 +0200 (CEST)
Received: from localhost ([::1]:38822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNus-0004ge-Jk
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNZo-0003Bz-Um
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:29:45 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:46963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNZm-0005nX-PG
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:29:44 -0400
Received: by mail-qt1-x833.google.com with SMTP id b23so3441191qtr.13
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=jnyq1uBdGFagOT1+rmtCLYVubDSqWD7vfuElw1wfRvg=;
 b=bHJ83Y/qc7gje1Y8cKaLi4y6qRthOvU9kI1JAD/p47ktsaLbGuMj5OdxukAoJdGUYc
 Id2yyyqd/Ey9mqDSAMil1JsiBIm8bw1JsSsKJSTmNxpvsmPnSV3ChVqi20hX7xXuMSWL
 h+tAOQWbpreK5E/O9c8m29/0PIGeDgThjz8YJUgh8llI76CQgSm/ZMAoTJYBkAM5T+je
 sMOCsDvuYEKkcVK3Shy1aU97mtqRjJpndvQ0xbK153bYzfqKzJ6LlpU0Kxr0ZIqmNI0G
 9V50+sFy1S6/D7QMJvJwoNoMa28arXEShdeZyUzZOTVTb0KmEX9XZskE05y68iv79XUO
 9blQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=jnyq1uBdGFagOT1+rmtCLYVubDSqWD7vfuElw1wfRvg=;
 b=UfFy70CGBCsGdxM0aFJQhW7qYb63S2KUf41QAJ7E4YxmelLMELmA/SDiHEhhLaafsp
 RtEeCsnvXX4B6NjRHG8XlPb7PKtQVUc4QQe7xfXmb0rrlc3B/xrF5NjIQRfs/mYHqJsm
 bwXSLGlhMx9inrKtaFzB0v3ySgttoU0iI0Gml4y9lIxR2LSt09y8IkLBqjlKHRngXvk7
 Kfx4Q1e0Y/vZELu5SZK/Pkrobo6gi4IUClOFKaW6TWlhIEM6Idn/MqOWuV/OAkswA3bh
 7Xym/q57yxqS9gwxuwOrYoeuCmggjAMue8tC6Vn1oki6YyVNYhmpiDhwWx4wHFZ7diEq
 isaA==
X-Gm-Message-State: ACrzQf18IG/f7T+chGKnfCKwptwhz/4ao10yw+s4weWD4Kd6u0VjsDkn
 r/rNmi7X+7In6KI4iC8sgmZiJyLBnvb8kg==
X-Google-Smtp-Source: AMsMyM4MdXu2In0Le8HqICHlkxql/WkRHSEBJinr1LMmijbgHxuvHosjVpN/LMFB+ULzqUtqPtQxiQ==
X-Received: by 2002:a05:622a:4ca:b0:35d:5888:3ef3 with SMTP id
 q10-20020a05622a04ca00b0035d58883ef3mr8669359qtx.337.1664573378919; 
 Fri, 30 Sep 2022 14:29:38 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80a1:5a60:d0d7:468b:5667:114b?
 ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 i7-20020ac85c07000000b0035d420c4ba7sm2911592qti.54.2022.09.30.14.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 14:29:38 -0700 (PDT)
Message-ID: <18b8e77e-287c-61ce-4c8a-869a70649d91@linaro.org>
Date: Fri, 30 Sep 2022 14:29:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 00/18] tcg: CPUTLBEntryFull and TARGET_TB_PCREL
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Good grief: typo in the cc list, twice.
You'd think I'd know where I work by now...


r~

On 9/30/22 14:26, Richard Henderson wrote:
> Changes for v6:
>    * CPUTLBEntryFull is now completely reviewed.
> 
>    * Incorporated the CPUClass caching patches,
>      as I will add a new use of the cached value.
> 
>    * Move CPUJumpCache out of include/hw/core.h.  While looking at
>      Alex's review of the patch, I realized that adding the virtual
>      pc value unconditionally would consume 64kB per cpu on targets
>      that do not require it.  Further, making it dynamically allocated
>      (a consequence of core.h not having the structure definition to
>      add to CPUState), means that we save 64kB per cpu when running
>      with hardware virtualization (kvm, xen, etc).
> 
>    * Add CPUClass.get_pc, so that we can always use or filter on the
>      virtual address when logging.
> 
> Patches needing review:
> 
>    13-accel-tcg-Do-not-align-tb-page_addr-0.patch
>    14-accel-tcg-Inline-tb_flush_jmp_cache.patch (new)
>    16-hw-core-Add-CPUClass.get_pc.patch (new)
>    17-accel-tcg-Introduce-tb_pc-and-log_pc.patch (mostly new)
>    18-accel-tcg-Introduce-TARGET_TB_PCREL.patch
> 
> 
> r~
> 
> 
> Alex Bennée (3):
>    cpu: cache CPUClass in CPUState for hot code paths
>    hw/core/cpu-sysemu: used cached class in cpu_asidx_from_attrs
>    cputlb: used cached CPUClass in our hot-paths
> 
> Richard Henderson (15):
>    accel/tcg: Rename CPUIOTLBEntry to CPUTLBEntryFull
>    accel/tcg: Drop addr member from SavedIOTLB
>    accel/tcg: Suppress auto-invalidate in probe_access_internal
>    accel/tcg: Introduce probe_access_full
>    accel/tcg: Introduce tlb_set_page_full
>    include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
>    accel/tcg: Remove PageDesc code_bitmap
>    accel/tcg: Use bool for page_find_alloc
>    accel/tcg: Use DisasContextBase in plugin_gen_tb_start
>    accel/tcg: Do not align tb->page_addr[0]
>    accel/tcg: Inline tb_flush_jmp_cache
>    include/hw/core: Create struct CPUJumpCache
>    hw/core: Add CPUClass.get_pc
>    accel/tcg: Introduce tb_pc and log_pc
>    accel/tcg: Introduce TARGET_TB_PCREL
> 
>   accel/tcg/internal.h                    |  10 +
>   accel/tcg/tb-hash.h                     |   1 +
>   accel/tcg/tb-jmp-cache.h                |  29 +++
>   include/exec/cpu-common.h               |   1 +
>   include/exec/cpu-defs.h                 |  48 ++++-
>   include/exec/exec-all.h                 |  75 ++++++-
>   include/exec/plugin-gen.h               |   7 +-
>   include/hw/core/cpu.h                   |  28 ++-
>   include/qemu/typedefs.h                 |   1 +
>   include/tcg/tcg.h                       |   2 +-
>   accel/tcg/cpu-exec.c                    | 122 +++++++----
>   accel/tcg/cputlb.c                      | 259 ++++++++++++++----------
>   accel/tcg/plugin-gen.c                  |  22 +-
>   accel/tcg/translate-all.c               | 200 ++++++++----------
>   accel/tcg/translator.c                  |   2 +-
>   cpu.c                                   |   9 +-
>   hw/core/cpu-common.c                    |   3 +-
>   hw/core/cpu-sysemu.c                    |   5 +-
>   plugins/core.c                          |   2 +-
>   target/alpha/cpu.c                      |   9 +
>   target/arm/cpu.c                        |  17 +-
>   target/arm/mte_helper.c                 |  14 +-
>   target/arm/sve_helper.c                 |   4 +-
>   target/arm/translate-a64.c              |   2 +-
>   target/avr/cpu.c                        |  10 +-
>   target/cris/cpu.c                       |   8 +
>   target/hexagon/cpu.c                    |  10 +-
>   target/hppa/cpu.c                       |  12 +-
>   target/i386/cpu.c                       |   9 +
>   target/i386/tcg/tcg-cpu.c               |   2 +-
>   target/loongarch/cpu.c                  |  11 +-
>   target/m68k/cpu.c                       |   8 +
>   target/microblaze/cpu.c                 |  10 +-
>   target/mips/cpu.c                       |   8 +
>   target/mips/tcg/exception.c             |   2 +-
>   target/mips/tcg/sysemu/special_helper.c |   2 +-
>   target/nios2/cpu.c                      |   9 +
>   target/openrisc/cpu.c                   |  10 +-
>   target/ppc/cpu_init.c                   |   8 +
>   target/riscv/cpu.c                      |  17 +-
>   target/rx/cpu.c                         |  10 +-
>   target/s390x/cpu.c                      |   8 +
>   target/s390x/tcg/mem_helper.c           |   4 -
>   target/sh4/cpu.c                        |  12 +-
>   target/sparc/cpu.c                      |  10 +-
>   target/tricore/cpu.c                    |  11 +-
>   target/xtensa/cpu.c                     |   8 +
>   tcg/tcg.c                               |   8 +-
>   trace/control-target.c                  |   2 +-
>   49 files changed, 723 insertions(+), 358 deletions(-)
>   create mode 100644 accel/tcg/tb-jmp-cache.h
> 


