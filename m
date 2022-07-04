Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE0A56599C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:18:07 +0200 (CEST)
Received: from localhost ([::1]:53874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Npu-00077n-Bx
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Nop-0006Ed-Ak
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:16:59 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Nol-00015L-H5
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:16:58 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d5so8771845plo.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=1WP2sCHAfqzaeG900qfP9fG1PmV66Ggo5jtbTms6WjA=;
 b=WfSbSMCk6WMUKJvhY2xk5Xo22QsZcEwMVbyHODKb3x08Hvhgm84YEANJzR5exb0GvM
 mnE9CAS9w2hqZySnZJqePtIr0domXHJI6LakMjurEOY1pLovzkD82l9O+bizkFhdMNJC
 5QYzYUFJCIxL5NnDSFNkl4rWiNV5G5mZ0Duq45A7N70+Laj0xPQGc4ShOhiTA+SssVWP
 0SeMhXDmsxuJKTZPjFOCi0Dg+lxf/V+g+IQAEKawH9tFvhwud1mnlCh7w7Z25zfjjpyc
 F+/ZdoAc6QIxN3IHnvXsFusmpmaCusqg+zCgq7olxQmBLTWdT0Yo7qzm9uyCBt9NSgds
 71Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=1WP2sCHAfqzaeG900qfP9fG1PmV66Ggo5jtbTms6WjA=;
 b=2tm2T1xqi+kdmd+oXH+pbq8VdRtLkUG/mOkinVrZEhsm0+ypL0oWKtSQXqHONwjhxr
 g2RHHHGJA1doV5PyElP4bDUXmlSllm/XUKh5XkNLisJKxvuY4xOcaASy0n2VaW8RQ1kk
 lYbDFj7YRgB+ncxIxy6yWqhyUu9DdBjX4kgPJzjR8XzZ9rkMIkAj29E9XGoKTmW1atyL
 itnyod5WfjfG5TQtUqF9eMvVcY8c/1lpscuUyrH8GV7OGn37im6cM2nWiKehIKY3xkk1
 6JJoz6W8U+s/4dSZQ3M+NFirpXT1dAzNdNhES9pC3KZAmKJ6doF9pKYNc+2c/q31ak0W
 K70A==
X-Gm-Message-State: AJIora+19Prz9/+1DsZTDK/EnI901blIW9x1MQ93e6naHWteq7Cin78o
 Xg2kG3wlgyw+i+Vn5MSJ0Zdj9VFGwVYLIVmN
X-Google-Smtp-Source: AGRyM1u5MNr5l05YHjwBt9M1mzW+3MspH8O/Sr4eeeoING8JI/SbgqDOdk12OczFulCnm45NfsKXtg==
X-Received: by 2002:a17:902:ea48:b0:16b:da1a:77d5 with SMTP id
 r8-20020a170902ea4800b0016bda1a77d5mr10739356plg.132.1656947813371; 
 Mon, 04 Jul 2022 08:16:53 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 kx1-20020a17090b228100b001ef84cd54b2sm3144660pjb.19.2022.07.04.08.16.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 08:16:52 -0700 (PDT)
Message-ID: <23bcb252-3a46-eab5-8a76-1f55d5c07685@linaro.org>
Date: Mon, 4 Jul 2022 20:46:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/23] loongarch64 patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220704093357.983255-1-richard.henderson@linaro.org>
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 7/4/22 15:03, Richard Henderson wrote:
> The following changes since commit e8e86b484eac70cd86e15fa10a2f0038a536cbba:
> 
>    Merge tag 'pull-riscv-to-apply-20220703-1' of github.com:alistair23/qemu into staging (2022-07-03 06:29:02 +0530)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-la-20220704
> 
> for you to fetch changes up to eb1e9ff8bba91674b4321f2b075c55aa8d9948cc:
> 
>    target/loongarch: Add lock when writing timer clear reg (2022-07-04 11:08:58 +0530)
> 
> ----------------------------------------------------------------
> LoongArch patch queue:
>    Support linux-user.
>    Fixes for CSR BADV.
>    Fix ASRT{LE,GT} exception.
>    Fixes for LS7A RTC.
>    Fix for interrupt vector spacing.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Mao Bibo (1):
>        hw/intc/loongarch_pch_msi: Fix msi vector convertion
> 
> Song Gao (13):
>        linux-user: Add LoongArch generic header files
>        linux-user: Add LoongArch signal support
>        linux-user: Add LoongArch elf support
>        linux-user: Add LoongArch syscall support
>        linux-user: Add LoongArch cpu_loop support
>        scripts: add loongarch64 binfmt config
>        target/loongarch: remove badaddr from CPULoongArch
>        target/loongarch: Fix missing update CSR_BADV
>        target/loongarch: Fix helper_asrtle_d/asrtgt_d raise wrong exception
>        target/loongarch: remove unused include hw/loader.h
>        target/loongarch: Adjust functions and structure to support user-mode
>        default-configs: Add loongarch linux-user support
>        target/loongarch: Update README
> 
> Xiaojuan Yang (9):
>        hw/rtc/ls7a_rtc: Fix uninitialied bugs and toymatch writing function
>        hw/rtc/ls7a_rtc: Fix timer call back function
>        hw/rtc/ls7a_rtc: Remove unimplemented device in realized function
>        hw/rtc/ls7a_rtc: Add reset function
>        hw/rtc/ls7a_rtc: Fix rtc enable and disable function
>        hw/rtc/ls7a_rtc: Use tm struct pointer as arguments in toy_time_to_val()
>        hw/rtc/ls7a_rtc: Fix 'calculate' spelling errors
>        target/loongarch: Fix the meaning of ECFG reg's VS field
>        target/loongarch: Add lock when writing timer clear reg
> 
>   configs/targets/loongarch64-linux-user.mak         |   3 +
>   include/hw/intc/loongarch_pch_msi.h                |   2 +
>   linux-user/loongarch64/sockbits.h                  |  11 +
>   linux-user/loongarch64/syscall_nr.h                | 312 +++++++++++++++++++
>   linux-user/loongarch64/target_cpu.h                |  34 +++
>   linux-user/loongarch64/target_elf.h                |  12 +
>   linux-user/loongarch64/target_errno_defs.h         |  12 +
>   linux-user/loongarch64/target_fcntl.h              |  11 +
>   linux-user/loongarch64/target_prctl.h              |   1 +
>   linux-user/loongarch64/target_resource.h           |  11 +
>   linux-user/loongarch64/target_signal.h             |  13 +
>   linux-user/loongarch64/target_structs.h            |  11 +
>   linux-user/loongarch64/target_syscall.h            |  48 +++
>   linux-user/loongarch64/termbits.h                  |  11 +
>   linux-user/syscall_defs.h                          |   6 +-
>   target/loongarch/cpu.h                             |   8 +-
>   target/loongarch/helper.h                          |   2 +
>   target/loongarch/internals.h                       |   2 +
>   hw/intc/loongarch_pch_msi.c                        |  22 +-
>   hw/loongarch/loongson3.c                           |   1 +
>   hw/rtc/ls7a_rtc.c                                  | 131 ++++----
>   linux-user/elfload.c                               |  91 ++++++
>   linux-user/loongarch64/cpu_loop.c                  |  96 ++++++
>   linux-user/loongarch64/signal.c                    | 335 +++++++++++++++++++++
>   target/loongarch/cpu.c                             |  38 ++-
>   target/loongarch/csr_helper.c                      |   2 +
>   target/loongarch/gdbstub.c                         |   2 +-
>   target/loongarch/op_helper.c                       |  10 +-
>   target/loongarch/insn_trans/trans_privileged.c.inc |  36 +++
>   scripts/gensyscalls.sh                             |   2 +
>   scripts/qemu-binfmt-conf.sh                        |   6 +-
>   target/loongarch/README                            |  39 ++-
>   32 files changed, 1226 insertions(+), 95 deletions(-)
>   create mode 100644 configs/targets/loongarch64-linux-user.mak
>   create mode 100644 linux-user/loongarch64/sockbits.h
>   create mode 100644 linux-user/loongarch64/syscall_nr.h
>   create mode 100644 linux-user/loongarch64/target_cpu.h
>   create mode 100644 linux-user/loongarch64/target_elf.h
>   create mode 100644 linux-user/loongarch64/target_errno_defs.h
>   create mode 100644 linux-user/loongarch64/target_fcntl.h
>   create mode 100644 linux-user/loongarch64/target_prctl.h
>   create mode 100644 linux-user/loongarch64/target_resource.h
>   create mode 100644 linux-user/loongarch64/target_signal.h
>   create mode 100644 linux-user/loongarch64/target_structs.h
>   create mode 100644 linux-user/loongarch64/target_syscall.h
>   create mode 100644 linux-user/loongarch64/termbits.h
>   create mode 100644 linux-user/loongarch64/cpu_loop.c
>   create mode 100644 linux-user/loongarch64/signal.c


