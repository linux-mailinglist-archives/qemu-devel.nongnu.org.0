Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343DB55BC66
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 00:57:12 +0200 (CEST)
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5xfL-0004r6-1y
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 18:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5xeI-0003wX-SL
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:56:06 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5xeC-0001Ru-5L
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:56:06 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so10811529pjj.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=kC0MqhZ5G8a1TY4zqdcNtqwaFDAN7u7zp3h+JHMRtw4=;
 b=Bk4HbHK/UPdfw8RhMN5Ggtsb5bWouBqSODwTFsEQXOrukGPUT2xoIo4IchlUrxt1+r
 tr0R5r7iq5mqKDjq2zJTi6qa1S/ZTTNxEi4yvvVrWv6Q1xzq4+c7eeW1xXpzU2jpyz8g
 xFlIyY1SIXtUgEzmeGaVDxpKkESiUaM+5FwTESrC0lQwaJxg6toxRG1QgUBpjwht2ldW
 e+T6hz2Jn7tpC8YDPXELccLYBzf+0aV88+QERKRIeGVr+ftD1VJvi7g6y/zT57vB0z6U
 HcJq4mNskbgTepJx5LNUpmIjqvNf7MzWRwICGC1PUEYY/StY74Tudb8/7kUfYHO3hSuQ
 1o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kC0MqhZ5G8a1TY4zqdcNtqwaFDAN7u7zp3h+JHMRtw4=;
 b=alkZntn8KymtDmzBOfS+VpbhMl+kZv92tf/75AIhDJF8/Uy7MDRO43z3WRXmjrd0cw
 fJmm8pK4I4LKve66heNn9XxMvqesygebo6KRxLEX+WhzzRDIdYRAbzct52AApE2OQfc/
 T0G92z03oY6f1M3IAo7d4F7stwVVlTiXK+mSs1BeFMIT7AzK56ozzkmFuhfYa1GYf8XY
 iWwZIHDMaxhIAIbRskh6W1D+QBPu71yeVYuVBHAoh8BboRwV6ttwG+viFesXZ+587rGq
 cEeB+uoxuY9LUgkEYlU9QLOCe3pNlqKQath0ed5OakuMv/X3j99wrzYp1Vkw60v6lzEv
 JefA==
X-Gm-Message-State: AJIora/5wOnt2sWmWWU6DylqsMj/wCg9Z2fDYl8SrLxwzt5hGHpbYhMf
 1DeCrVU1bZBFmCWpDc4uY/cmQCB18MudZw==
X-Google-Smtp-Source: AGRyM1uGVjqFw03ZusJDFmYjeMtJSlbzWw2vdg3HLBMhfG+3Cf68EstWRRRT/kiJrZBQ8fmct49cAQ==
X-Received: by 2002:a17:903:283:b0:16a:6db9:3f02 with SMTP id
 j3-20020a170903028300b0016a6db93f02mr1745867plr.173.1656370558037; 
 Mon, 27 Jun 2022 15:55:58 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm2676242plb.57.2022.06.27.15.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 15:55:57 -0700 (PDT)
Message-ID: <b0cf3b3d-053e-8577-97b0-5469d37f2ecd@linaro.org>
Date: Tue, 28 Jun 2022 04:25:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/25] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/27/22 15:52, Peter Maydell wrote:
> target-arm queue, mostly SME preliminaries.
> 
> In the unlikely event we don't land the rest of SME before freeze
> for 7.1 we can revert the docs/property changes included here.
> 
> -- PMM
> 
> The following changes since commit 097ccbbbaf2681df1e65542e5b7d2b2d0c66e2bc:
> 
>    Merge tag 'qemu-sparc-20220626' of https://github.com/mcayland/qemu into staging (2022-06-27 05:21:05 +0530)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220627
> 
> for you to fetch changes up to 59e1b8a22ea9f947d038ccac784de1020f266e14:
> 
>    target/arm: Check V7VE as well as LPAE in arm_pamax (2022-06-27 11:18:17 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * sphinx: change default language to 'en'
>   * Diagnose attempts to emulate EL3 in hvf as well as kvm
>   * More SME groundwork patches
>   * virt: Fix calculation of physical address space size
>     for v7VE CPUs (eg cortex-a15)

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alexander Graf (2):
>        accel: Introduce current_accel_name()
>        target/arm: Catch invalid kvm state also for hvf
> 
> Martin Liška (1):
>        sphinx: change default language to 'en'
> 
> Richard Henderson (22):
>        target/arm: Implement TPIDR2_EL0
>        target/arm: Add SMEEXC_EL to TB flags
>        target/arm: Add syn_smetrap
>        target/arm: Add ARM_CP_SME
>        target/arm: Add SVCR
>        target/arm: Add SMCR_ELx
>        target/arm: Add SMIDR_EL1, SMPRI_EL1, SMPRIMAP_EL2
>        target/arm: Add PSTATE.{SM,ZA} to TB flags
>        target/arm: Add the SME ZA storage to CPUARMState
>        target/arm: Implement SMSTART, SMSTOP
>        target/arm: Move error for sve%d property to arm_cpu_sve_finalize
>        target/arm: Create ARMVQMap
>        target/arm: Generalize cpu_arm_{get,set}_vq
>        target/arm: Generalize cpu_arm_{get, set}_default_vec_len
>        target/arm: Move arm_cpu_*_finalize to internals.h
>        target/arm: Unexport aarch64_add_*_properties
>        target/arm: Add cpu properties for SME
>        target/arm: Introduce sve_vqm1_for_el_sm
>        target/arm: Add SVL to TB flags
>        target/arm: Move pred_{full, gvec}_reg_{offset, size} to translate-a64.h
>        target/arm: Extend arm_pamax to more than aarch64
>        target/arm: Check V7VE as well as LPAE in arm_pamax
> 
>   docs/conf.py                     |   2 +-
>   docs/system/arm/cpu-features.rst |  56 ++++++++++
>   include/qemu/accel.h             |   1 +
>   target/arm/cpregs.h              |   5 +
>   target/arm/cpu.h                 | 103 ++++++++++++++-----
>   target/arm/helper-sme.h          |  21 ++++
>   target/arm/helper.h              |   1 +
>   target/arm/internals.h           |   4 +
>   target/arm/syndrome.h            |  14 +++
>   target/arm/translate-a64.h       |  38 +++++++
>   target/arm/translate.h           |   6 ++
>   accel/accel-common.c             |   8 ++
>   hw/arm/virt.c                    |  10 +-
>   softmmu/vl.c                     |   3 +-
>   target/arm/cpu.c                 |  32 ++++--
>   target/arm/cpu64.c               | 205 ++++++++++++++++++++++++++++---------
>   target/arm/helper.c              | 213 +++++++++++++++++++++++++++++++++++++--
>   target/arm/kvm64.c               |   2 +-
>   target/arm/machine.c             |  34 +++++++
>   target/arm/ptw.c                 |  26 +++--
>   target/arm/sme_helper.c          |  61 +++++++++++
>   target/arm/translate-a64.c       |  46 +++++++++
>   target/arm/translate-sve.c       |  36 -------
>   target/arm/meson.build           |   1 +
>   24 files changed, 782 insertions(+), 146 deletions(-)
>   create mode 100644 target/arm/helper-sme.h
>   create mode 100644 target/arm/sme_helper.c
> 


