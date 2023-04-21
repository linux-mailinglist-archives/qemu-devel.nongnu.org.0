Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8396EA56F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 09:58:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppleQ-0000HF-ER; Fri, 21 Apr 2023 03:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ppleO-0000H7-LG
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:57:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ppleM-00032B-U6
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682063865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oKJJEgbV3RePHY1BSIyjGfB5vdPAGivh6J8NxQVef1k=;
 b=fSbRURA/kce++u0j57z+gQ9JnkMA4yyvyKcDwdF0/PMknf5p4D5EIS1npJQVPsqVHZ0+Ex
 ivoLy++O5zAgR9qIZoEfCNRuII36z4IVSmuFrlAoNJ5vkDa3uDGEMie7hLJkEXFAjkG7PF
 eemrk6n2V5X58klvcdwyksH2YS44wIs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-wJeVchIbMiicvY3ApfxnpQ-1; Fri, 21 Apr 2023 03:57:43 -0400
X-MC-Unique: wJeVchIbMiicvY3ApfxnpQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f080f534acso9561085e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 00:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682063862; x=1684655862;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oKJJEgbV3RePHY1BSIyjGfB5vdPAGivh6J8NxQVef1k=;
 b=iQ6JeibODLJOUqbv8ddZ6Fc+d1yrE/XsAO6CtuuzRthvTB9UObT2Gck5opR4PvhzG9
 CCx0+ptzQAsUprJvlI/FNly9eMlTOZzEepq+fn+5afemfzuDj5FjbRndkyf9iXd7R+iQ
 yzT30gZke3X7ultfLgNk7hoFLEk1+NBMbgq6/rOdvYpptSC51vv1Wl+Nnc3rnUMhFE0W
 C2T5WYLwdxlIAkbPwdYlj5n+fWJR5El5pHPapWHJMGS0jmS8o6NHby5WFfzpRQurWQOl
 xes8b7xuvisXmXAmQJrCMyC1Umj03DCECZb9DMM1lyMkpPdeg5axBOVmI5mea29U8wB6
 u8kQ==
X-Gm-Message-State: AAQBX9eeslrWGoR/s0Bcuxc/z/+xpmGJkXN1d3tUas5EZsOYmaTBLGFC
 TjGwmQgREuinUrAJ0FXUw4O7mjRoWc+J8UxsY5ATI3gOTdH+jU4CWHuWS5nReuK3CPMTpHWLmC8
 lnPjscOZPkThUhf8=
X-Received: by 2002:a1c:7902:0:b0:3ed:fc8c:f197 with SMTP id
 l2-20020a1c7902000000b003edfc8cf197mr1105140wme.29.1682063862740; 
 Fri, 21 Apr 2023 00:57:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350YVbFalxPlxZUypji5fGWL0LioXL28XpqQsdGy0aNILmAWITOlC3efE1CKRho4/iMiCDVsa4A==
X-Received: by 2002:a1c:7902:0:b0:3ed:fc8c:f197 with SMTP id
 l2-20020a1c7902000000b003edfc8cf197mr1105124wme.29.1682063862438; 
 Fri, 21 Apr 2023 00:57:42 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 v15-20020a05600c444f00b003f09cda253esm7572272wmn.34.2023.04.21.00.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 00:57:41 -0700 (PDT)
Date: Fri, 21 Apr 2023 03:57:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [REPOST PATCH v3 0/5] Support x2APIC mode with TCG accelerator
Message-ID: <20230421035707-mutt-send-email-mst@kernel.org>
References: <20230411142440.8018-1-minhquangbui99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411142440.8018-1-minhquangbui99@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 11, 2023 at 09:24:35PM +0700, Bui Quang Minh wrote:
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


Series:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

any acks from tcg maintainers?

> diff --git a/lib/x86/fwcfg.c b/lib/x86/fwcfg.c
> index 1734afb..f56fe1c 100644
> --- a/lib/x86/fwcfg.c
> +++ b/lib/x86/fwcfg.c
> @@ -27,6 +27,7 @@ static void read_cfg_override(void)
>  
>         if ((str = getenv("TEST_DEVICE")))
>                 no_test_device = !atol(str);
> +       no_test_device = true;
>  
>         if ((str = getenv("MEMLIMIT")))
>                 fw_override[FW_CFG_MAX_RAM] = atol(str) * 1024 * 1024;
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
>   FAIL: apic_disable: *0xfee00030: 50014
>   FAIL: apic_disable: *0xfee00080: f0
>   FAIL: apic_disable: *0xfee00030: 50014
>   FAIL: apic_disable: *0xfee00080: f0 
>   FAIL: apicbase: relocate apic
> 
> These errors are because we don't disable MMIO region when switching to
> x2APIC and don't support relocate MMIO region yet. This is a problem
> because, MMIO region is the same for all CPUs, in order to support these we
> need to figure out how to allocate and manage different MMIO regions for
> each CPUs. This can be an improvement in the future.
> 
>   FAIL: nmi-after-sti
>   FAIL: multiple nmi
> 
> These errors are in the way we handle CPU_INTERRUPT_NMI in core TCG.
> 
>   FAIL: TMCCT should stay at zero
> 
> This error is related to APIC timer which should be addressed in separate
> patch.
> 
> Version 3 changes,
> - Patch 2:
>   + Allow APIC ID > 255 only when x2APIC feature is supported on CPU
>   + Make physical destination mode IPI which has destination id 0xffffffff
>   a broadcast to xAPIC CPUs
>   + Make cluster address 0xf in cluster model of xAPIC logical destination
>   mode a broadcast to all clusters
>   + Create new extended_log_dest to store APIC_LDR information in x2APIC
>   instead of extending log_dest for backward compatibility in vmstate
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
>   i386/tcg: implement x2APIC registers MSR access
>   apic: add support for x2APIC mode
>   apic, i386/tcg: add x2apic transitions
>   intel_iommu: allow Extended Interrupt Mode when using userspace APIC
>   amd_iommu: report x2APIC support to the operating system
> 
>  hw/i386/acpi-build.c                 |  28 +-
>  hw/i386/amd_iommu.c                  |  21 +-
>  hw/i386/amd_iommu.h                  |  16 +-
>  hw/i386/intel_iommu.c                |  11 -
>  hw/i386/x86.c                        |   8 +-
>  hw/intc/apic.c                       | 395 +++++++++++++++++++++------
>  hw/intc/apic_common.c                |  16 +-
>  hw/intc/trace-events                 |   4 +-
>  include/hw/i386/apic.h               |   6 +-
>  include/hw/i386/apic_internal.h      |   7 +-
>  target/i386/cpu-sysemu.c             |  18 +-
>  target/i386/cpu.c                    |   5 +-
>  target/i386/cpu.h                    |   9 +
>  target/i386/tcg/sysemu/misc_helper.c |  31 +++
>  14 files changed, 436 insertions(+), 139 deletions(-)
> 
> -- 
> 2.25.1


