Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5916A700A2F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:20:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTcP-0004yx-62; Fri, 12 May 2023 10:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pxTcN-0004yU-6D
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:19:35 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pxTcL-0007fA-8C
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:19:34 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-52160f75920so6845268a12.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683901171; x=1686493171;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j69QwG+SHmI6eSeAVcOdBRKm2N64c5vfUPxIoSN2zNk=;
 b=ae7wrMrPVEss7s/zki9fhvQqZzYP3Z0tFyp1XyJJ3b5C7BiSZGtD9kNHOQuxp74exi
 Ewz33IvGLdA/IrBu03f/PIguW16d8JEN8VgfZmnFuE5351KXMiOyJ4c/GkrQ8XGPTKyr
 QxzOZg6HvUAA7jbZlE9GWCFA0RxkGiT/03qzTBbllnW+TABcUIHZtl5KTazJHzFNnSvo
 M0dgCwDSz1iW7Skkczhqy8Vvpp9bOOwb22bC9PF6UuxQgLiVTeTaqAOAHim9S5pQP/0J
 fp/J+pHVNpq9McoM5m1nb5h9szoEypQZAQox71mxDfHno54F5Ye4P/AVViliFdwAqCMe
 rOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683901171; x=1686493171;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j69QwG+SHmI6eSeAVcOdBRKm2N64c5vfUPxIoSN2zNk=;
 b=mHMWoOIjk2Swo77g95TPsu9Emvy0B8VS3viOzLHFlLKyGWokzNJ8JURAINsInkycf2
 3HVn3GjdWqVzJF92Zc+IhFzZBIlp1dJQ0btf3fQWqUorHBKB+sSGnd8SGiHxkPd6Akn5
 /29C4zHwIu2BZaONl0467RBKMb8dUuVoliDDazdXAn4so3amL4+PK+jtKN/lBQBbjUqj
 ay6a57pbKbLIu5gDQgKs850yR1FP7CZEqIxYNgAa5+4gwc/cF57PWKAZlRVZmaQouncr
 4zED+bK6Iy6I6xo6cuUuPU9G1tAEeTi816V3q6P1ubYb5RuyZWDCZl11DN/1/SR1eXQO
 1+lA==
X-Gm-Message-State: AC+VfDxWvI9ekRNf6Mcu0FTmONFRVc/gMhL4xBLpW+bKaEI8+IHrWRU+
 L3MpTxuYO37SnV7HAab/1ZV/yAvJGddaCg==
X-Google-Smtp-Source: ACHHUZ5z9Av43nRHBoDN8gsuKQvG4B2opB36+4fj+RYtKIVURAJHU9I8p98wtHDSY22aWA3mC4l7Ag==
X-Received: by 2002:a17:90b:2307:b0:24e:165d:8f65 with SMTP id
 mt7-20020a17090b230700b0024e165d8f65mr24170827pjb.5.1683901169956; 
 Fri, 12 May 2023 07:19:29 -0700 (PDT)
Received: from [192.168.0.115] ([113.173.119.15])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a17090a408500b0024c1ac09394sm17270046pjg.19.2023.05.12.07.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 07:19:29 -0700 (PDT)
Message-ID: <8697995e-dde9-43ed-f482-7213e9b3f2a9@gmail.com>
Date: Fri, 12 May 2023 21:19:23 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [REPOST PATCH v3 0/5] Support x2APIC mode with TCG accelerator
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230411142440.8018-1-minhquangbui99@gmail.com>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <20230411142440.8018-1-minhquangbui99@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.845,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/23 21:24, Bui Quang Minh wrote:
> [Reposting due to broken threading in previous post]
> 
> Hi everyone,
> 
> This series implements x2APIC mode in userspace local APIC and the
> RDMSR/WRMSR helper to access x2APIC registers in x2APIC mode. Intel iommu
> and AMD iommu are adjusted to support x2APIC interrupt remapping. With this
> series, we can now boot Linux kernel into x2APIC mode with TCG accelerator
> using either Intel or AMD iommu.
> 
> Testing the emulated userspace APIC with kvm-unit-tests, disable test
> device with this patch
> 
> diff --git a/lib/x86/fwcfg.c b/lib/x86/fwcfg.c
> index 1734afb..f56fe1c 100644
> --- a/lib/x86/fwcfg.c
> +++ b/lib/x86/fwcfg.c
> @@ -27,6 +27,7 @@ static void read_cfg_override(void)
>   
>          if ((str = getenv("TEST_DEVICE")))
>                  no_test_device = !atol(str);
> +       no_test_device = true;
>   
>          if ((str = getenv("MEMLIMIT")))
>                  fw_override[FW_CFG_MAX_RAM] = atol(str) * 1024 * 1024;
> 
> ~ env QEMU=/home/minh/Desktop/oss/qemu/build/qemu-system-x86_64 ACCEL=tcg \
> ./run_tests.sh -v -g apic
> 
> TESTNAME=apic-split TIMEOUT=90s ACCEL=tcg ./x86/run x86/apic.flat -smp 2
> -cpu qemu64,+x2apic,+tsc-deadline -machine kernel_irqchip=split FAIL
> apic-split (54 tests, 8 unexpected failures, 1 skipped)
> TESTNAME=ioapic-split TIMEOUT=90s ACCEL=tcg ./x86/run x86/ioapic.flat -smp
> 1 -cpu qemu64 -machine kernel_irqchip=split PASS ioapic-split (19 tests)
> TESTNAME=x2apic TIMEOUT=30 ACCEL=tcg ./x86/run x86/apic.flat -smp 2 -cpu
> qemu64,+x2apic,+tsc-deadline FAIL x2apic (54 tests, 8 unexpected failures,
> 1 skipped) TESTNAME=xapic TIMEOUT=60 ACCEL=tcg ./x86/run x86/apic.flat -smp
> 2 -cpu qemu64,-x2apic,+tsc-deadline -machine pit=off FAIL xapic (43 tests,
> 6 unexpected failures, 2 skipped)
> 
>    FAIL: apic_disable: *0xfee00030: 50014
>    FAIL: apic_disable: *0xfee00080: f0
>    FAIL: apic_disable: *0xfee00030: 50014
>    FAIL: apic_disable: *0xfee00080: f0
>    FAIL: apicbase: relocate apic
> 
> These errors are because we don't disable MMIO region when switching to
> x2APIC and don't support relocate MMIO region yet. This is a problem
> because, MMIO region is the same for all CPUs, in order to support these we
> need to figure out how to allocate and manage different MMIO regions for
> each CPUs. This can be an improvement in the future.
> 
>    FAIL: nmi-after-sti
>    FAIL: multiple nmi
> 
> These errors are in the way we handle CPU_INTERRUPT_NMI in core TCG.
> 
>    FAIL: TMCCT should stay at zero
> 
> This error is related to APIC timer which should be addressed in separate
> patch.
> 
> Version 3 changes,
> - Patch 2:
>    + Allow APIC ID > 255 only when x2APIC feature is supported on CPU
>    + Make physical destination mode IPI which has destination id 0xffffffff
>    a broadcast to xAPIC CPUs
>    + Make cluster address 0xf in cluster model of xAPIC logical destination
>    mode a broadcast to all clusters
>    + Create new extended_log_dest to store APIC_LDR information in x2APIC
>    instead of extending log_dest for backward compatibility in vmstate
> 
> Version 2 changes,
> - Add support for APIC ID larger than 255
> - Adjust AMD iommu for x2APIC suuport
> - Reorganize and split patch 1,2 into patch 1,2,3 in version 2
> 
> Thanks,
> Quang Minh.
> 
> Bui Quang Minh (5):
>    i386/tcg: implement x2APIC registers MSR access
>    apic: add support for x2APIC mode
>    apic, i386/tcg: add x2apic transitions
>    intel_iommu: allow Extended Interrupt Mode when using userspace APIC
>    amd_iommu: report x2APIC support to the operating system
> 
>   hw/i386/acpi-build.c                 |  28 +-
>   hw/i386/amd_iommu.c                  |  21 +-
>   hw/i386/amd_iommu.h                  |  16 +-
>   hw/i386/intel_iommu.c                |  11 -
>   hw/i386/x86.c                        |   8 +-
>   hw/intc/apic.c                       | 395 +++++++++++++++++++++------
>   hw/intc/apic_common.c                |  16 +-
>   hw/intc/trace-events                 |   4 +-
>   include/hw/i386/apic.h               |   6 +-
>   include/hw/i386/apic_internal.h      |   7 +-
>   target/i386/cpu-sysemu.c             |  18 +-
>   target/i386/cpu.c                    |   5 +-
>   target/i386/cpu.h                    |   9 +
>   target/i386/tcg/sysemu/misc_helper.c |  31 +++
>   14 files changed, 436 insertions(+), 139 deletions(-)

Hello everyone, I just want to politely ping here. Could you spend some 
time to review the series?

Thank you very much,
Quang Minh.

