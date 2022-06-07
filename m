Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AFC53F350
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 03:23:41 +0200 (CEST)
Received: from localhost ([::1]:35132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyNwa-0006Tp-Lw
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 21:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyNur-0005TB-0Z
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 21:21:53 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyNuo-0004n9-OO
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 21:21:52 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so16236118pjm.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 18:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=HwRxUByQ75sQgNI6rQ/D58n/EOJjtifIEZUi5dm1S1M=;
 b=ryI+r3xE813lq+47gyFA2BbH6f12wvdeUziJuvmrEfB1B39kgdPQUddM/zpLG74eH1
 f9kJgMYgTqZD6XqanQ/0g5XijAKWbXx4gDOnS2mLXybNgFeucWudDVWcGBURGIApXQFi
 8wYKs+m7V8QUNicJPvK8QV9WsAadZXnKiG4sIx4pfu99zws8hmVWvQ8++eWK4B/C5zWm
 3NyStMIZfSbDbGgdS16LAYd5zRGig4se0E5W8LF9q+iXK0oOu6I1IC6tDYhsKjPAY4FT
 bGjbsh/8Crm77OuCdfiuWjBG1U7/cKZ1yrFZ9LGlplfT7P2iGOKxkevp9kbpIf3bfJzk
 AfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=HwRxUByQ75sQgNI6rQ/D58n/EOJjtifIEZUi5dm1S1M=;
 b=kEaLCXH+mFXeF4tB+v0+AbEbD/JaLVNXSqeOqh6epsqGf6BY9jMDK8F8zZwhMCNPpu
 YJww3vpRVgNbV8jFwOn7xMnVmvEQEzBICqsEmPkjLa05uekb9HxAaEgSEckvoNXT8qAt
 hJIb1myOE1tvmeW3bZSbg8foVuBjfT8P2SKLUlNjwkOZkSbiW1lwnlOekQAQMq3WB8va
 tT4HUYQQT1eLp0DQVeVTdNJKKiS9u7CasnbHOYsuNnpNe61gn/url6EdTyC7dKuDGLjj
 GAFPE593WabyHxzIMj6sRn0Lo9EGKALvLFl6OB6IUPDWu9HH2Nwi0sj3Ln5OEqsJXfe5
 tCBQ==
X-Gm-Message-State: AOAM533vm6IBGnEeufF6bLiv2OylOX+LPV/1iZ/b0Nals3hc7jTwZ8xz
 0J6z3BLJbQTngP5eIU/u8SOtjHyUHptDSg==
X-Google-Smtp-Source: ABdhPJw2IEWeaTlqALckk03546IxbKY9ahVRsok6tF8m9FVjFrya/qx9PsjXACraEcR7Pqo4eG/7fg==
X-Received: by 2002:a17:902:e80d:b0:167:5e77:e695 with SMTP id
 u13-20020a170902e80d00b001675e77e695mr15600777plg.144.1654564909236; 
 Mon, 06 Jun 2022 18:21:49 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:d3db:cca:e5c9:6531?
 ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 x191-20020a6386c8000000b003fd9b8b865dsm3743043pgd.0.2022.06.06.18.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 18:21:48 -0700 (PDT)
Message-ID: <9af61141-f45d-71b2-98de-7b7d20ca4b61@linaro.org>
Date: Mon, 6 Jun 2022 18:21:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/43] target/loongarch: Initial system support
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, yangxiaojuan@loongson.cn
References: <20220606231450.448443-1-richard.henderson@linaro.org>
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 6/6/22 16:14, Richard Henderson wrote:
> Thanks for the patience, guys.
> 
> 
> r~
> 
> 
> The following changes since commit 57c9363c452af64fe058aa946cc923eae7f7ad33:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-06-06 07:57:14 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-la-20220606
> 
> for you to fetch changes up to 34bb43b074906a7cd642ccf03e2b7bea63b53d95:
> 
>    target/loongarch: 'make check-tcg' support (2022-06-06 18:14:13 +0000)
> 
> ----------------------------------------------------------------
> Initial LoongArch support.

Applied.


r~


> 
> ----------------------------------------------------------------
> Song Gao (18):
>        target/loongarch: Add README
>        target/loongarch: Add core definition
>        target/loongarch: Add main translation routines
>        target/loongarch: Add fixed point arithmetic instruction translation
>        target/loongarch: Add fixed point shift instruction translation
>        target/loongarch: Add fixed point bit instruction translation
>        target/loongarch: Add fixed point load/store instruction translation
>        target/loongarch: Add fixed point atomic instruction translation
>        target/loongarch: Add fixed point extra instruction translation
>        target/loongarch: Add floating point arithmetic instruction translation
>        target/loongarch: Add floating point comparison instruction translation
>        target/loongarch: Add floating point conversion instruction translation
>        target/loongarch: Add floating point move instruction translation
>        target/loongarch: Add floating point load/store instruction translation
>        target/loongarch: Add branch instruction translation
>        target/loongarch: Add disassembler
>        target/loongarch: Add target build suport
>        target/loongarch: 'make check-tcg' support
> 
> Xiaojuan Yang (25):
>        target/loongarch: Add system emulation introduction
>        target/loongarch: Add CSRs definition
>        target/loongarch: Add basic vmstate description of CPU.
>        target/loongarch: Implement qmp_query_cpu_definitions()
>        target/loongarch: Add MMU support for LoongArch CPU.
>        target/loongarch: Add LoongArch interrupt and exception handle
>        target/loongarch: Add constant timer support
>        target/loongarch: Add LoongArch CSR instruction
>        target/loongarch: Add LoongArch IOCSR instruction
>        target/loongarch: Add TLB instruction support
>        target/loongarch: Add other core instructions support
>        target/loongarch: Add timer related instructions support.
>        hw/loongarch: Add support loongson3 virt machine type.
>        hw/loongarch: Add LoongArch ipi interrupt support(IPI)
>        hw/intc: Add LoongArch ls7a interrupt controller support(PCH-PIC)
>        hw/intc: Add LoongArch ls7a msi interrupt controller support(PCH-MSI)
>        hw/intc: Add LoongArch extioi interrupt controller(EIOINTC)
>        hw/loongarch: Add irq hierarchy for the system
>        Enable common virtio pci support for LoongArch
>        hw/loongarch: Add some devices support for 3A5000.
>        hw/loongarch: Add LoongArch ls7a rtc device support
>        hw/loongarch: Add LoongArch load elf function.
>        hw/loongarch: Add LoongArch virt power manager support.
>        target/loongarch: Add gdb support.
>        tests/tcg/loongarch64: Add hello/memory test in loongarch64 system
> 
>   docs/system/loongarch/loongson3.rst                |  41 +
>   configure                                          |   1 +
>   configs/devices/loongarch64-softmmu/default.mak    |   3 +
>   configs/targets/loongarch64-softmmu.mak            |   4 +
>   meson.build                                        |   1 +
>   qapi/machine-target.json                           |   6 +-
>   qapi/machine.json                                  |   2 +-
>   include/disas/dis-asm.h                            |   2 +
>   include/exec/poison.h                              |   2 +
>   include/hw/intc/loongarch_extioi.h                 |  62 ++
>   include/hw/intc/loongarch_ipi.h                    |  52 ++
>   include/hw/intc/loongarch_pch_msi.h                |  20 +
>   include/hw/intc/loongarch_pch_pic.h                |  69 ++
>   include/hw/loongarch/virt.h                        |  33 +
>   include/hw/pci-host/ls7a.h                         |  44 ++
>   include/sysemu/arch_init.h                         |   1 +
>   target/loongarch/cpu-csr.h                         | 208 +++++
>   target/loongarch/cpu-param.h                       |  18 +
>   target/loongarch/cpu.h                             | 391 ++++++++++
>   target/loongarch/helper.h                          | 130 ++++
>   target/loongarch/internals.h                       |  56 ++
>   target/loongarch/translate.h                       |  45 ++
>   tests/tcg/loongarch64/system/regdef.h              |  86 ++
>   target/loongarch/insns.decode                      | 486 ++++++++++++
>   hw/intc/loongarch_extioi.c                         | 312 ++++++++
>   hw/intc/loongarch_ipi.c                            | 242 ++++++
>   hw/intc/loongarch_pch_msi.c                        |  73 ++
>   hw/intc/loongarch_pch_pic.c                        | 431 +++++++++++
>   hw/loongarch/loongson3.c                           | 382 +++++++++
>   hw/rtc/ls7a_rtc.c                                  | 528 +++++++++++++
>   softmmu/qdev-monitor.c                             |   3 +-
>   target/loongarch/constant_timer.c                  |  64 ++
>   target/loongarch/cpu.c                             | 704 +++++++++++++++++
>   target/loongarch/csr_helper.c                      |  87 +++
>   target/loongarch/disas.c                           | 757 ++++++++++++++++++
>   target/loongarch/fpu_helper.c                      | 862 +++++++++++++++++++++
>   target/loongarch/gdbstub.c                         |  81 ++
>   target/loongarch/iocsr_helper.c                    |  67 ++
>   target/loongarch/machine.c                         | 102 +++
>   target/loongarch/op_helper.c                       | 133 ++++
>   target/loongarch/tlb_helper.c                      | 763 ++++++++++++++++++
>   target/loongarch/translate.c                       | 281 +++++++
>   target/loongarch/insn_trans/trans_arith.c.inc      | 304 ++++++++
>   target/loongarch/insn_trans/trans_atomic.c.inc     | 113 +++
>   target/loongarch/insn_trans/trans_bit.c.inc        | 212 +++++
>   target/loongarch/insn_trans/trans_branch.c.inc     |  83 ++
>   target/loongarch/insn_trans/trans_extra.c.inc      | 101 +++
>   target/loongarch/insn_trans/trans_farith.c.inc     | 105 +++
>   target/loongarch/insn_trans/trans_fcmp.c.inc       |  56 ++
>   target/loongarch/insn_trans/trans_fcnv.c.inc       |  33 +
>   target/loongarch/insn_trans/trans_fmemory.c.inc    | 153 ++++
>   target/loongarch/insn_trans/trans_fmov.c.inc       | 157 ++++
>   target/loongarch/insn_trans/trans_memory.c.inc     | 229 ++++++
>   target/loongarch/insn_trans/trans_privileged.c.inc | 466 +++++++++++
>   target/loongarch/insn_trans/trans_shift.c.inc      | 106 +++
>   MAINTAINERS                                        |  24 +
>   gdb-xml/loongarch-base64.xml                       |  44 ++
>   gdb-xml/loongarch-fpu64.xml                        |  57 ++
>   hw/Kconfig                                         |   1 +
>   hw/intc/Kconfig                                    |  15 +
>   hw/intc/meson.build                                |   4 +
>   hw/intc/trace-events                               |  22 +
>   hw/loongarch/Kconfig                               |  16 +
>   hw/loongarch/meson.build                           |   4 +
>   hw/meson.build                                     |   1 +
>   hw/rtc/Kconfig                                     |   3 +
>   hw/rtc/meson.build                                 |   1 +
>   target/Kconfig                                     |   1 +
>   target/loongarch/Kconfig                           |   2 +
>   target/loongarch/README                            |  64 ++
>   target/loongarch/meson.build                       |  30 +
>   target/meson.build                                 |   1 +
>   tests/tcg/loongarch64/Makefile.softmmu-target      |  33 +
>   tests/tcg/loongarch64/system/boot.S                |  56 ++
>   tests/tcg/loongarch64/system/kernel.ld             |  30 +
>   75 files changed, 10158 insertions(+), 4 deletions(-)
>   create mode 100644 docs/system/loongarch/loongson3.rst
>   create mode 100644 configs/devices/loongarch64-softmmu/default.mak
>   create mode 100644 configs/targets/loongarch64-softmmu.mak
>   create mode 100644 include/hw/intc/loongarch_extioi.h
>   create mode 100644 include/hw/intc/loongarch_ipi.h
>   create mode 100644 include/hw/intc/loongarch_pch_msi.h
>   create mode 100644 include/hw/intc/loongarch_pch_pic.h
>   create mode 100644 include/hw/loongarch/virt.h
>   create mode 100644 include/hw/pci-host/ls7a.h
>   create mode 100644 target/loongarch/cpu-csr.h
>   create mode 100644 target/loongarch/cpu-param.h
>   create mode 100644 target/loongarch/cpu.h
>   create mode 100644 target/loongarch/helper.h
>   create mode 100644 target/loongarch/internals.h
>   create mode 100644 target/loongarch/translate.h
>   create mode 100644 tests/tcg/loongarch64/system/regdef.h
>   create mode 100644 target/loongarch/insns.decode
>   create mode 100644 hw/intc/loongarch_extioi.c
>   create mode 100644 hw/intc/loongarch_ipi.c
>   create mode 100644 hw/intc/loongarch_pch_msi.c
>   create mode 100644 hw/intc/loongarch_pch_pic.c
>   create mode 100644 hw/loongarch/loongson3.c
>   create mode 100644 hw/rtc/ls7a_rtc.c
>   create mode 100644 target/loongarch/constant_timer.c
>   create mode 100644 target/loongarch/cpu.c
>   create mode 100644 target/loongarch/csr_helper.c
>   create mode 100644 target/loongarch/disas.c
>   create mode 100644 target/loongarch/fpu_helper.c
>   create mode 100644 target/loongarch/gdbstub.c
>   create mode 100644 target/loongarch/iocsr_helper.c
>   create mode 100644 target/loongarch/machine.c
>   create mode 100644 target/loongarch/op_helper.c
>   create mode 100644 target/loongarch/tlb_helper.c
>   create mode 100644 target/loongarch/translate.c
>   create mode 100644 target/loongarch/insn_trans/trans_arith.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_atomic.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_bit.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_branch.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_extra.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_farith.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_fcmp.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_fcnv.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_fmemory.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_fmov.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_memory.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_privileged.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_shift.c.inc
>   create mode 100644 gdb-xml/loongarch-base64.xml
>   create mode 100644 gdb-xml/loongarch-fpu64.xml
>   create mode 100644 hw/loongarch/Kconfig
>   create mode 100644 hw/loongarch/meson.build
>   create mode 100644 target/loongarch/Kconfig
>   create mode 100644 target/loongarch/README
>   create mode 100644 target/loongarch/meson.build
>   create mode 100644 tests/tcg/loongarch64/Makefile.softmmu-target
>   create mode 100644 tests/tcg/loongarch64/system/boot.S
>   create mode 100644 tests/tcg/loongarch64/system/kernel.ld


