Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413CE6DD3A9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 09:10:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm88F-0002wD-Aa; Tue, 11 Apr 2023 03:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pm88C-0002ve-LD
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:09:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pm88B-0000Nn-3N
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681196970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kcg1wA74fzBkkk/zArviRuyTYOnzYdN7u4PY8XiqYt8=;
 b=b1jmMDaN1IdiND33nB+aRFCFh642CenlSiCZ9g/RtCAryBaHPsjiA0W7k9wleWeT52AO6l
 Aq2IROWa8D5zDRW4gS2xbfq1R0yeomuVkGiftYzdHR8b/w+0q+cGtVDTrllMId90o3sw+O
 NlK8crRUJKDYwXJ9pGGOxzpKDSfE7xE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-wg6O2vZ_NSe7w2aWfNUXuQ-1; Tue, 11 Apr 2023 03:09:29 -0400
X-MC-Unique: wg6O2vZ_NSe7w2aWfNUXuQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h8-20020a05600c314800b003ef649aa8c7so1014484wmo.6
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 00:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681196968;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kcg1wA74fzBkkk/zArviRuyTYOnzYdN7u4PY8XiqYt8=;
 b=APzS+h+WVxdhdXdtVcXhySsf/oet9gzc8EOHeBptDuqr1WfJuTQbnaNcfQ07Ojktft
 lf1U8dsyMVFy8CD4lXgtUbLhOGT46JPAIIbVkqFzDuuuPSy87B5da6OfLYraQUKnXsof
 KlKEszKCgub0Y1qBcF5hHSXimUyBwOXi1ukv3bCzZz79q9VvMK1V7dOTTQMFUKuBSv5Q
 bb6RempNc0xEl67vp5Rnn1AkWZIcZPnS6A2GMWsUyhKaWT2/yp4sShoZWI/O2/3QelAq
 7rknZkwPS+sSGyCoejN0P9u2lg34IY2df6IAXtLhbpEXrfGD4ff+Y+jxABLzUhgcUhYI
 dVYA==
X-Gm-Message-State: AAQBX9eqavr3ILfjRimfgycQf3f0rlidvrctMhb5/MiJVUMBNH6u+sMy
 kGo4lFYplSynGLWOXEMynG9Il+FIxe9NqX0tPt+2RMjvmLo5B9ETvkjU7zfwDlg5jBHpAYfw9RZ
 JBBpGv2IJUdfO9pA=
X-Received: by 2002:a5d:65cd:0:b0:2f0:2cf9:fed0 with SMTP id
 e13-20020a5d65cd000000b002f02cf9fed0mr3797342wrw.49.1681196968200; 
 Tue, 11 Apr 2023 00:09:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZUA8vXglhWzDRAA0GZR2p2fNy9s2UfyyYEvdB4WV1ErzCloYAF9l045w5I7dRzc7HGMc+Fgw==
X-Received: by 2002:a5d:65cd:0:b0:2f0:2cf9:fed0 with SMTP id
 e13-20020a5d65cd000000b002f02cf9fed0mr3797326wrw.49.1681196967892; 
 Tue, 11 Apr 2023 00:09:27 -0700 (PDT)
Received: from redhat.com ([2.52.10.80]) by smtp.gmail.com with ESMTPSA id
 r12-20020adfdc8c000000b002d1e49cff35sm13814399wrj.40.2023.04.11.00.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 00:09:27 -0700 (PDT)
Date: Tue, 11 Apr 2023 03:09:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 0/5] Support x2APIC mode with TCG accelerator
Message-ID: <20230411030857-mutt-send-email-mst@kernel.org>
References: <20230409144022.8111-1-minhquangbui99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230409144022.8111-1-minhquangbui99@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Sun, Apr 09, 2023 at 09:40:22PM +0700, Bui Quang Minh wrote:
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


Threading's broken with this posting.

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


