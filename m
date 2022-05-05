Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6922151C6CE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:13:14 +0200 (CEST)
Received: from localhost ([::1]:48794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfyT-0000Ja-Cn
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfhz-0006xc-Iq
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:56:11 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:40835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfhx-0002AZ-EZ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:56:10 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so4943291fac.7
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=PpEDjeSelim1qR8PnWbVh6gnRih55vphp6dhsUbvAn4=;
 b=K7LE8QinOq3SJM+dj3HMFlxQzt+DbjE43G04+ks2L1G3+iie2WbSlHgRAb7sBeb6l0
 WX/YbLMyUm8VLXhO+PpzQPIhkjYlURWWDBwybMbSr9hdjHL4Aa2zRd8aeXKqXrysB4sc
 Tl//HlOKlvhd6atKwPcbVEWp23R3Kl0g5OxQVAE/7+pnlX1GRQ0YyHCKLrczVJUNnmH5
 HIHf/5VODnW0vt/Ut13c8tPrKtmJ+fzE9kiKBjtfOv3/VsHVi1JFx5cnKArGiIbZ3S3J
 YA5g4I4v18HGMXg+h/VfMsWXI+awHVYPEZ2npzub86zeI0zSCyDEvHWRVVEHdosDexES
 F1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PpEDjeSelim1qR8PnWbVh6gnRih55vphp6dhsUbvAn4=;
 b=aN5J+kImv6w2pqCAMlLj8hCg+DWknCH6MEL0ubbGpsc3yk7UwtK812VyidnHJPABPU
 V0/MUhz/Xq76bbK6TuePRF0YFCC6stt9fl9Sr/AggcFV3QFUWg9XWaySsFRkTsFeqRti
 Tpw3BF91B6P5F1/d89Dj0BqUPHblFJ+oZvw63oCrPgI3S9cJ0GySLE37unSlSTFNH8UB
 huw8xMlMmsqD+k8ynv/MhlmPNWiW2yFMOjF3kjykYrd5mrlPByUr5Vf0cJHji0cbf786
 ygMmrd9hSDGsII9NeKreBQ/Ix7VRmc2Msbl31XVRcLHjB7l16e4MDRudVuaCg5yocizj
 tNuQ==
X-Gm-Message-State: AOAM533/TUADssF8qFfEi99Smp2GWN2DHo69mfO0pbQa6ALAmUtisqnt
 ONN/RY8XJcKAox6xwBKqIxifjg==
X-Google-Smtp-Source: ABdhPJzeGJ//GQw/7c4ffbaVYy+w+Ejs6tSpYQVJNvnrwEadZm2wxlI/CxX2ELCIXG3bkR8mUPdXFg==
X-Received: by 2002:a05:6870:1487:b0:d0:e4c4:9b7f with SMTP id
 k7-20020a056870148700b000d0e4c49b7fmr2815180oab.72.1651773368055; 
 Thu, 05 May 2022 10:56:08 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056870a2c800b000e686d1387asm704625oak.20.2022.05.05.10.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:56:07 -0700 (PDT)
Message-ID: <a04c04b1-9e98-1bd8-5721-cfe7180ce7b0@linaro.org>
Date: Thu, 5 May 2022 12:56:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/23] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
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

On 5/5/22 04:11, Peter Maydell wrote:
> Two small bugfixes, plus most of RTH's refactoring of cpregs
> handling.
> 
> -- PMM
> 
> The following changes since commit 1fba9dc71a170b3a05b9d3272dd8ecfe7f26e215:
> 
>    Merge tag 'pull-request-2022-05-04' of https://gitlab.com/thuth/qemu into staging (2022-05-04 08:07:02 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220505
> 
> for you to fetch changes up to 99a50d1a67c602126fc2b3a4812d3000eba9bf34:
> 
>    target/arm: read access to performance counters from EL0 (2022-05-05 09:36:22 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * Enable read access to performance counters from EL0
>   * Enable SCTLR_EL1.BT0 for aarch64-linux-user
>   * Refactoring of cpreg handling

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~




> 
> ----------------------------------------------------------------
> Alex Zuepke (1):
>        target/arm: read access to performance counters from EL0
> 
> Richard Henderson (22):
>        target/arm: Enable SCTLR_EL1.BT0 for aarch64-linux-user
>        target/arm: Split out cpregs.h
>        target/arm: Reorg CPAccessResult and access_check_cp_reg
>        target/arm: Replace sentinels with ARRAY_SIZE in cpregs.h
>        target/arm: Make some more cpreg data static const
>        target/arm: Reorg ARMCPRegInfo type field bits
>        target/arm: Avoid bare abort() or assert(0)
>        target/arm: Change cpreg access permissions to enum
>        target/arm: Name CPState type
>        target/arm: Name CPSecureState type
>        target/arm: Drop always-true test in define_arm_vh_e2h_redirects_aliases
>        target/arm: Store cpregs key in the hash table directly
>        target/arm: Merge allocation of the cpreg and its name
>        target/arm: Hoist computation of key in add_cpreg_to_hashtable
>        target/arm: Consolidate cpreg updates in add_cpreg_to_hashtable
>        target/arm: Use bool for is64 and ns in add_cpreg_to_hashtable
>        target/arm: Hoist isbanked computation in add_cpreg_to_hashtable
>        target/arm: Perform override check early in add_cpreg_to_hashtable
>        target/arm: Reformat comments in add_cpreg_to_hashtable
>        target/arm: Remove HOST_BIG_ENDIAN ifdef in add_cpreg_to_hashtable
>        target/arm: Add isar predicates for FEAT_Debugv8p2
>        target/arm: Add isar_feature_{aa64,any}_ras
> 
>   target/arm/cpregs.h               | 453 ++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h                  | 393 +++------------------------------
>   hw/arm/pxa2xx.c                   |   2 +-
>   hw/arm/pxa2xx_pic.c               |   2 +-
>   hw/intc/arm_gicv3_cpuif.c         |   6 +-
>   hw/intc/arm_gicv3_kvm.c           |   3 +-
>   target/arm/cpu.c                  |  25 +--
>   target/arm/cpu64.c                |   2 +-
>   target/arm/cpu_tcg.c              |   5 +-
>   target/arm/gdbstub.c              |   5 +-
>   target/arm/helper.c               | 358 +++++++++++++-----------------
>   target/arm/hvf/hvf.c              |   2 +-
>   target/arm/kvm-stub.c             |   4 +-
>   target/arm/kvm.c                  |   4 +-
>   target/arm/machine.c              |   4 +-
>   target/arm/op_helper.c            |  57 ++---
>   target/arm/translate-a64.c        |  14 +-
>   target/arm/translate-neon.c       |   2 +-
>   target/arm/translate.c            |  13 +-
>   tests/tcg/aarch64/bti-3.c         |  42 ++++
>   tests/tcg/aarch64/Makefile.target |   6 +-
>   21 files changed, 738 insertions(+), 664 deletions(-)
>   create mode 100644 target/arm/cpregs.h
>   create mode 100644 tests/tcg/aarch64/bti-3.c
> 


