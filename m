Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931F665C05B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 13:58:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCgpO-0007E1-0e; Tue, 03 Jan 2023 07:55:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCgpG-0007CU-0m
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:55:33 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCgpC-000718-Px
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:55:29 -0500
Received: by mail-vs1-xe35.google.com with SMTP id a66so31600325vsa.6
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 04:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dzd2V29HHFETxkuxb539XNf7ACm6TtsjZAhU5ccCnUg=;
 b=Whmu+DQqufE5Vh5atboJvfQqosxcGuUY3GL6qU8ylMnG+JZkEgCDPBFDB8+bX1FAsV
 S0Af/Pe8GnbktJBrUwH1jVdLZ2yZNLzyZZ8zTbKwum8Vi3YzmRyfukdbcoY1Mn8eoHwY
 8SMmc7Pd5/TsjLn4Few3h8CTCpq7xs5NTXWinDf/yXjTV3xH38ei2kHXAZZYsTMa1B1R
 e9hOxYYr2rWgoY4XRMF0jF0LgaIQHvViDr3YVnSmlzYvn0HorTo134NTgXCttGM6n3ul
 cF349dgk/3SbQinSow16DM4qiTeMKRdfumFsUmKkYCJH5EBVGMovjqOVlC9FZwJeno+s
 WfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dzd2V29HHFETxkuxb539XNf7ACm6TtsjZAhU5ccCnUg=;
 b=xcRe3dCfAWLmgWVyJkTh7xaZ07st4ST2ky212JS4Tkts5xZSqJmKDZXFFw8KqqDnBk
 AHU1C1kYkIuuIybCQlkmOvaVe2AiR9Jzj87yNmZo9mpV0uJujOINQDFEaQVgFqRJKoI5
 DA15d3rv/vMpV4mP9xp6Qd/ntFSp7LRbybTbCC/suGUhs1HeA1fI2wJKjERDlORgg/hR
 LDh0FaY54FAuf7rcrS9YtKBYEsT+CuJBS5f6OBkCr4WUbA5nnA6h8onh0DIxz0PbaGN4
 uOOVh+VXsiST/M0GYi4AEFqq5cANVDEVxtPQ9WL/zxBSzjwzL01FJXte4Fpo9bh2blI5
 JqBA==
X-Gm-Message-State: AFqh2kqTYt5/wnVy+lJR/eMzyfBolNAcXxTNLOoI1CybkA7EkL0rypz7
 YULdm/S0NNtB/DEp3KMdyXchaW86riHQj8psDYA=
X-Google-Smtp-Source: AMrXdXvpzGI1HHnf5iSRwwgiEMV5fV0/teBNzrUcEO/3KvPeZfmsAgWl2/WtblriJWfFdD93S0qtxQqJs4KMW2dQcD0=
X-Received: by 2002:a67:f31a:0:b0:3cd:1568:4dd6 with SMTP id
 p26-20020a67f31a000000b003cd15684dd6mr1441347vsf.48.1672750524979; Tue, 03
 Jan 2023 04:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20230103084801.20437-1-thuth@redhat.com>
 <20230103084801.20437-4-thuth@redhat.com>
In-Reply-To: <20230103084801.20437-4-thuth@redhat.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Tue, 3 Jan 2023 13:55:10 +0100
Message-ID: <CAG4p6K6k7Mq7jok6qF39QekUCFASzCGiC2oNhjtPPohM=iKDwA@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/intc: Extract the IRQ counting functions into a
 separate file
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Michael S Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: multipart/alternative; boundary="000000000000d6de8105f15b94ad"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000d6de8105f15b94ad
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 3, 2023 at 9:48 AM Thomas Huth <thuth@redhat.com> wrote:

> These IRQ counting functions will soon be required in binaries that
> do not include the APIC code, too, so let's extract them into a
> separate file that can be linked independently of the APIC code.
>
> While we're at it, change the apic_* prefix into kvm_* since the
> functions are used from the i8259 PIC (i.e. not the APIC), too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/hw/i386/apic.h          |  2 --
>  include/hw/i386/apic_internal.h |  1 -
>  include/hw/intc/kvm_irqcount.h  | 10 +++++++
>  hw/i386/kvm/i8259.c             |  4 +--
>  hw/i386/kvm/ioapic.c            |  4 +--
>  hw/intc/apic.c                  |  3 +-
>  hw/intc/apic_common.c           | 30 ++------------------
>  hw/intc/kvm_irqcount.c          | 49 +++++++++++++++++++++++++++++++++
>  hw/rtc/mc146818rtc.c            |  6 ++--
>  hw/intc/meson.build             |  6 ++++
>  hw/intc/trace-events            |  9 +++---
>  11 files changed, 81 insertions(+), 43 deletions(-)
>  create mode 100644 include/hw/intc/kvm_irqcount.h
>  create mode 100644 hw/intc/kvm_irqcount.c
>
> diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
> index da1d2fe155..bdc15a7a73 100644
> --- a/include/hw/i386/apic.h
> +++ b/include/hw/i386/apic.h
> @@ -9,8 +9,6 @@ int apic_accept_pic_intr(DeviceState *s);
>  void apic_deliver_pic_intr(DeviceState *s, int level);
>  void apic_deliver_nmi(DeviceState *d);
>  int apic_get_interrupt(DeviceState *s);
> -void apic_reset_irq_delivered(void);
> -int apic_get_irq_delivered(void);
>  void cpu_set_apic_base(DeviceState *s, uint64_t val);
>  uint64_t cpu_get_apic_base(DeviceState *s);
>  void cpu_set_apic_tpr(DeviceState *s, uint8_t val);
> diff --git a/include/hw/i386/apic_internal.h
> b/include/hw/i386/apic_internal.h
> index c175e7e718..e61ad04769 100644
> --- a/include/hw/i386/apic_internal.h
> +++ b/include/hw/i386/apic_internal.h
> @@ -199,7 +199,6 @@ typedef struct VAPICState {
>
>  extern bool apic_report_tpr_access;
>
> -void apic_report_irq_delivered(int delivered);
>  bool apic_next_timer(APICCommonState *s, int64_t current_time);
>  void apic_enable_tpr_access_reporting(DeviceState *d, bool enable);
>  void apic_enable_vapic(DeviceState *d, hwaddr paddr);
> diff --git a/include/hw/intc/kvm_irqcount.h
> b/include/hw/intc/kvm_irqcount.h
> new file mode 100644
> index 0000000000..0ed5999e49
> --- /dev/null
> +++ b/include/hw/intc/kvm_irqcount.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: LGPL-2.1-or-later */
> +
> +#ifndef KVM_IRQCOUNT_H
> +#define KVM_IRQCOUNT_H
> +
> +void kvm_report_irq_delivered(int delivered);
> +void kvm_reset_irq_delivered(void);
> +int kvm_get_irq_delivered(void);
> +
> +#endif
> diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
> index d61bae4dc3..3ca0e1ff03 100644
> --- a/hw/i386/kvm/i8259.c
> +++ b/hw/i386/kvm/i8259.c
> @@ -14,7 +14,7 @@
>  #include "hw/isa/i8259_internal.h"
>  #include "hw/intc/i8259.h"
>  #include "qemu/module.h"
> -#include "hw/i386/apic_internal.h"
> +#include "hw/intc/kvm_irqcount.h"
>  #include "hw/irq.h"
>  #include "sysemu/kvm.h"
>  #include "qom/object.h"
> @@ -117,7 +117,7 @@ static void kvm_pic_set_irq(void *opaque, int irq, int
> level)
>
>      pic_stat_update_irq(irq, level);
>      delivered = kvm_set_irq(kvm_state, irq, level);
> -    apic_report_irq_delivered(delivered);
> +    kvm_report_irq_delivered(delivered);
>  }
>
>  static void kvm_pic_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
> index ee7c8ef68b..272e26b4a2 100644
> --- a/hw/i386/kvm/ioapic.c
> +++ b/hw/i386/kvm/ioapic.c
> @@ -15,7 +15,7 @@
>  #include "hw/i386/x86.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/i386/ioapic_internal.h"
> -#include "hw/i386/apic_internal.h"
> +#include "hw/intc/kvm_irqcount.h"
>  #include "sysemu/kvm.h"
>
>  /* PC Utility function */
> @@ -116,7 +116,7 @@ static void kvm_ioapic_set_irq(void *opaque, int irq,
> int level)
>
>      ioapic_stat_update_irq(common, irq, level);
>      delivered = kvm_set_irq(kvm_state, s->kvm_gsi_base + irq, level);
> -    apic_report_irq_delivered(delivered);
> +    kvm_report_irq_delivered(delivered);
>  }
>
>  static void kvm_ioapic_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> index 3df11c34d6..2d3e55f4e2 100644
> --- a/hw/intc/apic.c
> +++ b/hw/intc/apic.c
> @@ -22,6 +22,7 @@
>  #include "hw/i386/apic.h"
>  #include "hw/i386/ioapic.h"
>  #include "hw/intc/i8259.h"
> +#include "hw/intc/kvm_irqcount.h"
>  #include "hw/pci/msi.h"
>  #include "qemu/host-utils.h"
>  #include "sysemu/kvm.h"
> @@ -399,7 +400,7 @@ void apic_poll_irq(DeviceState *dev)
>
>  static void apic_set_irq(APICCommonState *s, int vector_num, int
> trigger_mode)
>  {
> -    apic_report_irq_delivered(!apic_get_bit(s->irr, vector_num));
> +    kvm_report_irq_delivered(!apic_get_bit(s->irr, vector_num));
>
>      apic_set_bit(s->irr, vector_num);
>      if (trigger_mode)
> diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
> index 2a20982066..4a34f03047 100644
> --- a/hw/intc/apic_common.c
> +++ b/hw/intc/apic_common.c
> @@ -25,6 +25,7 @@
>  #include "qapi/visitor.h"
>  #include "hw/i386/apic.h"
>  #include "hw/i386/apic_internal.h"
> +#include "hw/intc/kvm_irqcount.h"
>  #include "trace.h"
>  #include "hw/boards.h"
>  #include "sysemu/hax.h"
> @@ -33,7 +34,6 @@
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>
> -static int apic_irq_delivered;
>  bool apic_report_tpr_access;
>
>  void cpu_set_apic_base(DeviceState *dev, uint64_t val)
> @@ -122,32 +122,6 @@ void apic_handle_tpr_access_report(DeviceState *dev,
> target_ulong ip,
>      vapic_report_tpr_access(s->vapic, CPU(s->cpu), ip, access);
>  }
>
> -void apic_report_irq_delivered(int delivered)
> -{
> -    apic_irq_delivered += delivered;
> -
> -    trace_apic_report_irq_delivered(apic_irq_delivered);
> -}
> -
> -void apic_reset_irq_delivered(void)
> -{
> -    /* Copy this into a local variable to encourage gcc to emit a plain
> -     * register for a sys/sdt.h marker.  For details on this workaround,
> see:
> -     * https://sourceware.org/bugzilla/show_bug.cgi?id=13296
> -     */
> -    volatile int a_i_d = apic_irq_delivered;
> -    trace_apic_reset_irq_delivered(a_i_d);
> -
> -    apic_irq_delivered = 0;
> -}
> -
> -int apic_get_irq_delivered(void)
> -{
> -    trace_apic_get_irq_delivered(apic_irq_delivered);
> -
> -    return apic_irq_delivered;
> -}
> -
>  void apic_deliver_nmi(DeviceState *dev)
>  {
>      APICCommonState *s = APIC_COMMON(dev);
> @@ -272,7 +246,7 @@ static void apic_reset_common(DeviceState *dev)
>      s->apicbase = APIC_DEFAULT_ADDRESS | bsp | MSR_IA32_APICBASE_ENABLE;
>      s->id = s->initial_apic_id;
>
> -    apic_reset_irq_delivered();
> +    kvm_reset_irq_delivered();
>
>      s->vapic_paddr = 0;
>      info->vapic_base_update(s);
> diff --git a/hw/intc/kvm_irqcount.c b/hw/intc/kvm_irqcount.c
> new file mode 100644
> index 0000000000..2ef8a83a7a
> --- /dev/null
> +++ b/hw/intc/kvm_irqcount.c
> @@ -0,0 +1,49 @@
> +/*
> + * KVM PIC functions for counting the delivered IRQs.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <
> http://www.gnu.org/licenses/>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/intc/kvm_irqcount.h"
> +#include "trace.h"
> +
> +static int kvm_irq_delivered;
> +
> +void kvm_report_irq_delivered(int delivered)
> +{
> +    kvm_irq_delivered += delivered;
> +
> +    trace_kvm_report_irq_delivered(kvm_irq_delivered);
> +}
> +
> +void kvm_reset_irq_delivered(void)
> +{
> +    /*
> +     * Copy this into a local variable to encourage gcc to emit a plain
> +     * register for a sys/sdt.h marker.  For details on this workaround,
> see:
> +     * https://sourceware.org/bugzilla/show_bug.cgi?id=13296
> +     */
> +    volatile int k_i_d = kvm_irq_delivered;
> +    trace_kvm_reset_irq_delivered(k_i_d);
> +
> +    kvm_irq_delivered = 0;
> +}
> +
> +int kvm_get_irq_delivered(void)
> +{
> +    trace_kvm_get_irq_delivered(kvm_irq_delivered);
> +
> +    return kvm_irq_delivered;
> +}
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index 1ebb412479..947d68c257 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -27,6 +27,7 @@
>  #include "qemu/module.h"
>  #include "qemu/bcd.h"
>  #include "hw/acpi/acpi_aml_interface.h"
> +#include "hw/intc/kvm_irqcount.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
> @@ -46,7 +47,6 @@
>
>  #ifdef TARGET_I386
>  #include "qapi/qapi-commands-misc-target.h"
> -#include "hw/i386/apic.h"
>  #endif
>
>  //#define DEBUG_CMOS
> @@ -124,9 +124,9 @@ void qmp_rtc_reset_reinjection(Error **errp)
>
>  static bool rtc_policy_slew_deliver_irq(RTCState *s)
>  {
> -    apic_reset_irq_delivered();
> +    kvm_reset_irq_delivered();
>      qemu_irq_raise(s->irq);
> -    return apic_get_irq_delivered();
> +    return kvm_get_irq_delivered();
>  }
>
>  static void rtc_coalesced_timer(void *opaque)
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index bcbf22ff51..cd9f1ee888 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -25,6 +25,12 @@ softmmu_ss.add(when: 'CONFIG_XILINX', if_true:
> files('xilinx_intc.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true:
> files('xlnx-zynqmp-ipi.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true:
> files('xlnx-pmu-iomod-intc.c'))
>
> +if config_all_devices.has_key('CONFIG_APIC') or \
> +   config_all_devices.has_key('CONFIG_I8259') or \
> +   config_all_devices.has_key('CONFIG_MC146818RTC')
> +    softmmu_ss.add(files('kvm_irqcount.c'))
> +endif
>

I'd slightly prefer to track these dependencies via KConfig since its
declarative nature seems to lend itself better for tooling. Anyway:

Reviewed-by: Bernhard Beschow <shentey@gmail.com>

+
>  specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true:
> files('allwinner-a10-pic.c'))
>  specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c',
> 'apic_common.c'))
>  specific_ss.add(when: 'CONFIG_ARM_GIC', if_true:
> files('arm_gicv3_cpuif_common.c'))
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 6fbc2045e6..50cadfb996 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -10,10 +10,6 @@ pic_ioport_read(bool master, uint64_t addr, int val)
> "master %d addr 0x%"PRIx64"
>  # apic_common.c
>  cpu_set_apic_base(uint64_t val) "0x%016"PRIx64
>  cpu_get_apic_base(uint64_t val) "0x%016"PRIx64
> -# coalescing
> -apic_report_irq_delivered(int apic_irq_delivered) "coalescing %d"
> -apic_reset_irq_delivered(int apic_irq_delivered) "old coalescing %d"
> -apic_get_irq_delivered(int apic_irq_delivered) "returning coalescing %d"
>
>  # apic.c
>  apic_local_deliver(int vector, uint32_t lvt) "vector %d delivery mode %d"
> @@ -30,6 +26,11 @@ ioapic_mem_read(uint8_t addr, uint8_t regsel, uint8_t
> size, uint32_t val) "ioapi
>  ioapic_mem_write(uint8_t addr, uint8_t regsel, uint8_t size, uint32_t
> val) "ioapic mem write addr 0x%"PRIx8" regsel: 0x%"PRIx8" size 0x%"PRIx8"
> val 0x%"PRIx32
>  ioapic_set_irq(int vector, int level) "vector: %d level: %d"
>
> +# kvm_irqcount.c
> +kvm_report_irq_delivered(int irq_delivered) "coalescing %d"
> +kvm_reset_irq_delivered(int irq_delivered) "old coalescing %d"
> +kvm_get_irq_delivered(int irq_delivered) "returning coalescing %d"
> +
>  # slavio_intctl.c
>  slavio_intctl_mem_readl(uint32_t cpu, uint64_t addr, uint32_t ret) "read
> cpu %d reg 0x%"PRIx64" = 0x%x"
>  slavio_intctl_mem_writel(uint32_t cpu, uint64_t addr, uint32_t val)
> "write cpu %d reg 0x%"PRIx64" = 0x%x"
> --
> 2.31.1
>
>

--000000000000d6de8105f15b94ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 3, 2023 at 9:48 AM Thomas=
 Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">These IRQ cou=
nting functions will soon be required in binaries that<br>
do not include the APIC code, too, so let&#39;s extract them into a<br>
separate file that can be linked independently of the APIC code.<br>
<br>
While we&#39;re at it, change the apic_* prefix into kvm_* since the<br>
functions are used from the i8259 PIC (i.e. not the APIC), too.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/hw/i386/apic.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --=
<br>
=C2=A0include/hw/i386/apic_internal.h |=C2=A0 1 -<br>
=C2=A0include/hw/intc/kvm_irqcount.h=C2=A0 | 10 +++++++<br>
=C2=A0hw/i386/kvm/i8259.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 4 +--<br>
=C2=A0hw/i386/kvm/ioapic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 4 +--<br>
=C2=A0hw/intc/apic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 3 +-<br>
=C2=A0hw/intc/apic_common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 30 ++=
------------------<br>
=C2=A0hw/intc/kvm_irqcount.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 49 +++++++=
++++++++++++++++++++++++++<br>
=C2=A0hw/rtc/mc146818rtc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 6 ++--<br>
=C2=A0hw/intc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 6 ++++<br>
=C2=A0hw/intc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 9 +++---<br>
=C2=A011 files changed, 81 insertions(+), 43 deletions(-)<br>
=C2=A0create mode 100644 include/hw/intc/kvm_irqcount.h<br>
=C2=A0create mode 100644 hw/intc/kvm_irqcount.c<br>
<br>
diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h<br>
index da1d2fe155..bdc15a7a73 100644<br>
--- a/include/hw/i386/apic.h<br>
+++ b/include/hw/i386/apic.h<br>
@@ -9,8 +9,6 @@ int apic_accept_pic_intr(DeviceState *s);<br>
=C2=A0void apic_deliver_pic_intr(DeviceState *s, int level);<br>
=C2=A0void apic_deliver_nmi(DeviceState *d);<br>
=C2=A0int apic_get_interrupt(DeviceState *s);<br>
-void apic_reset_irq_delivered(void);<br>
-int apic_get_irq_delivered(void);<br>
=C2=A0void cpu_set_apic_base(DeviceState *s, uint64_t val);<br>
=C2=A0uint64_t cpu_get_apic_base(DeviceState *s);<br>
=C2=A0void cpu_set_apic_tpr(DeviceState *s, uint8_t val);<br>
diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_interna=
l.h<br>
index c175e7e718..e61ad04769 100644<br>
--- a/include/hw/i386/apic_internal.h<br>
+++ b/include/hw/i386/apic_internal.h<br>
@@ -199,7 +199,6 @@ typedef struct VAPICState {<br>
<br>
=C2=A0extern bool apic_report_tpr_access;<br>
<br>
-void apic_report_irq_delivered(int delivered);<br>
=C2=A0bool apic_next_timer(APICCommonState *s, int64_t current_time);<br>
=C2=A0void apic_enable_tpr_access_reporting(DeviceState *d, bool enable);<b=
r>
=C2=A0void apic_enable_vapic(DeviceState *d, hwaddr paddr);<br>
diff --git a/include/hw/intc/kvm_irqcount.h b/include/hw/intc/kvm_irqcount.=
h<br>
new file mode 100644<br>
index 0000000000..0ed5999e49<br>
--- /dev/null<br>
+++ b/include/hw/intc/kvm_irqcount.h<br>
@@ -0,0 +1,10 @@<br>
+/* SPDX-License-Identifier: LGPL-2.1-or-later */<br>
+<br>
+#ifndef KVM_IRQCOUNT_H<br>
+#define KVM_IRQCOUNT_H<br>
+<br>
+void kvm_report_irq_delivered(int delivered);<br>
+void kvm_reset_irq_delivered(void);<br>
+int kvm_get_irq_delivered(void);<br>
+<br>
+#endif<br>
diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c<br>
index d61bae4dc3..3ca0e1ff03 100644<br>
--- a/hw/i386/kvm/i8259.c<br>
+++ b/hw/i386/kvm/i8259.c<br>
@@ -14,7 +14,7 @@<br>
=C2=A0#include &quot;hw/isa/i8259_internal.h&quot;<br>
=C2=A0#include &quot;hw/intc/i8259.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
-#include &quot;hw/i386/apic_internal.h&quot;<br>
+#include &quot;hw/intc/kvm_irqcount.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;sysemu/kvm.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
@@ -117,7 +117,7 @@ static void kvm_pic_set_irq(void *opaque, int irq, int =
level)<br>
<br>
=C2=A0 =C2=A0 =C2=A0pic_stat_update_irq(irq, level);<br>
=C2=A0 =C2=A0 =C2=A0delivered =3D kvm_set_irq(kvm_state, irq, level);<br>
-=C2=A0 =C2=A0 apic_report_irq_delivered(delivered);<br>
+=C2=A0 =C2=A0 kvm_report_irq_delivered(delivered);<br>
=C2=A0}<br>
<br>
=C2=A0static void kvm_pic_realize(DeviceState *dev, Error **errp)<br>
diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c<br>
index ee7c8ef68b..272e26b4a2 100644<br>
--- a/hw/i386/kvm/ioapic.c<br>
+++ b/hw/i386/kvm/ioapic.c<br>
@@ -15,7 +15,7 @@<br>
=C2=A0#include &quot;hw/i386/x86.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;hw/i386/ioapic_internal.h&quot;<br>
-#include &quot;hw/i386/apic_internal.h&quot;<br>
+#include &quot;hw/intc/kvm_irqcount.h&quot;<br>
=C2=A0#include &quot;sysemu/kvm.h&quot;<br>
<br>
=C2=A0/* PC Utility function */<br>
@@ -116,7 +116,7 @@ static void kvm_ioapic_set_irq(void *opaque, int irq, i=
nt level)<br>
<br>
=C2=A0 =C2=A0 =C2=A0ioapic_stat_update_irq(common, irq, level);<br>
=C2=A0 =C2=A0 =C2=A0delivered =3D kvm_set_irq(kvm_state, s-&gt;kvm_gsi_base=
 + irq, level);<br>
-=C2=A0 =C2=A0 apic_report_irq_delivered(delivered);<br>
+=C2=A0 =C2=A0 kvm_report_irq_delivered(delivered);<br>
=C2=A0}<br>
<br>
=C2=A0static void kvm_ioapic_realize(DeviceState *dev, Error **errp)<br>
diff --git a/hw/intc/apic.c b/hw/intc/apic.c<br>
index 3df11c34d6..2d3e55f4e2 100644<br>
--- a/hw/intc/apic.c<br>
+++ b/hw/intc/apic.c<br>
@@ -22,6 +22,7 @@<br>
=C2=A0#include &quot;hw/i386/apic.h&quot;<br>
=C2=A0#include &quot;hw/i386/ioapic.h&quot;<br>
=C2=A0#include &quot;hw/intc/i8259.h&quot;<br>
+#include &quot;hw/intc/kvm_irqcount.h&quot;<br>
=C2=A0#include &quot;hw/pci/msi.h&quot;<br>
=C2=A0#include &quot;qemu/host-utils.h&quot;<br>
=C2=A0#include &quot;sysemu/kvm.h&quot;<br>
@@ -399,7 +400,7 @@ void apic_poll_irq(DeviceState *dev)<br>
<br>
=C2=A0static void apic_set_irq(APICCommonState *s, int vector_num, int trig=
ger_mode)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 apic_report_irq_delivered(!apic_get_bit(s-&gt;irr, vector_nu=
m));<br>
+=C2=A0 =C2=A0 kvm_report_irq_delivered(!apic_get_bit(s-&gt;irr, vector_num=
));<br>
<br>
=C2=A0 =C2=A0 =C2=A0apic_set_bit(s-&gt;irr, vector_num);<br>
=C2=A0 =C2=A0 =C2=A0if (trigger_mode)<br>
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c<br>
index 2a20982066..4a34f03047 100644<br>
--- a/hw/intc/apic_common.c<br>
+++ b/hw/intc/apic_common.c<br>
@@ -25,6 +25,7 @@<br>
=C2=A0#include &quot;qapi/visitor.h&quot;<br>
=C2=A0#include &quot;hw/i386/apic.h&quot;<br>
=C2=A0#include &quot;hw/i386/apic_internal.h&quot;<br>
+#include &quot;hw/intc/kvm_irqcount.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;sysemu/hax.h&quot;<br>
@@ -33,7 +34,6 @@<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
<br>
-static int apic_irq_delivered;<br>
=C2=A0bool apic_report_tpr_access;<br>
<br>
=C2=A0void cpu_set_apic_base(DeviceState *dev, uint64_t val)<br>
@@ -122,32 +122,6 @@ void apic_handle_tpr_access_report(DeviceState *dev, t=
arget_ulong ip,<br>
=C2=A0 =C2=A0 =C2=A0vapic_report_tpr_access(s-&gt;vapic, CPU(s-&gt;cpu), ip=
, access);<br>
=C2=A0}<br>
<br>
-void apic_report_irq_delivered(int delivered)<br>
-{<br>
-=C2=A0 =C2=A0 apic_irq_delivered +=3D delivered;<br>
-<br>
-=C2=A0 =C2=A0 trace_apic_report_irq_delivered(apic_irq_delivered);<br>
-}<br>
-<br>
-void apic_reset_irq_delivered(void)<br>
-{<br>
-=C2=A0 =C2=A0 /* Copy this into a local variable to encourage gcc to emit =
a plain<br>
-=C2=A0 =C2=A0 =C2=A0* register for a sys/sdt.h marker.=C2=A0 For details o=
n this workaround, see:<br>
-=C2=A0 =C2=A0 =C2=A0* <a href=3D"https://sourceware.org/bugzilla/show_bug.=
cgi?id=3D13296" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org=
/bugzilla/show_bug.cgi?id=3D13296</a><br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 volatile int a_i_d =3D apic_irq_delivered;<br>
-=C2=A0 =C2=A0 trace_apic_reset_irq_delivered(a_i_d);<br>
-<br>
-=C2=A0 =C2=A0 apic_irq_delivered =3D 0;<br>
-}<br>
-<br>
-int apic_get_irq_delivered(void)<br>
-{<br>
-=C2=A0 =C2=A0 trace_apic_get_irq_delivered(apic_irq_delivered);<br>
-<br>
-=C2=A0 =C2=A0 return apic_irq_delivered;<br>
-}<br>
-<br>
=C2=A0void apic_deliver_nmi(DeviceState *dev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0APICCommonState *s =3D APIC_COMMON(dev);<br>
@@ -272,7 +246,7 @@ static void apic_reset_common(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;apicbase =3D APIC_DEFAULT_ADDRESS | bsp | MSR_IA3=
2_APICBASE_ENABLE;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;id =3D s-&gt;initial_apic_id;<br>
<br>
-=C2=A0 =C2=A0 apic_reset_irq_delivered();<br>
+=C2=A0 =C2=A0 kvm_reset_irq_delivered();<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;vapic_paddr =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0info-&gt;vapic_base_update(s);<br>
diff --git a/hw/intc/kvm_irqcount.c b/hw/intc/kvm_irqcount.c<br>
new file mode 100644<br>
index 0000000000..2ef8a83a7a<br>
--- /dev/null<br>
+++ b/hw/intc/kvm_irqcount.c<br>
@@ -0,0 +1,49 @@<br>
+/*<br>
+ * KVM PIC functions for counting the delivered IRQs.<br>
+ *<br>
+ * This library is free software; you can redistribute it and/or<br>
+ * modify it under the terms of the GNU Lesser General Public<br>
+ * License as published by the Free Software Foundation; either<br>
+ * version 2.1 of the License, or (at your option) any later version.<br>
+ *<br>
+ * This library is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU<=
br>
+ * Lesser General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU Lesser General Public<br>
+ * License along with this library; if not, see &lt;<a href=3D"http://www.=
gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/=
licenses/</a>&gt;<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/intc/kvm_irqcount.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+static int kvm_irq_delivered;<br>
+<br>
+void kvm_report_irq_delivered(int delivered)<br>
+{<br>
+=C2=A0 =C2=A0 kvm_irq_delivered +=3D delivered;<br>
+<br>
+=C2=A0 =C2=A0 trace_kvm_report_irq_delivered(kvm_irq_delivered);<br>
+}<br>
+<br>
+void kvm_reset_irq_delivered(void)<br>
+{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Copy this into a local variable to encourage gcc to =
emit a plain<br>
+=C2=A0 =C2=A0 =C2=A0* register for a sys/sdt.h marker.=C2=A0 For details o=
n this workaround, see:<br>
+=C2=A0 =C2=A0 =C2=A0* <a href=3D"https://sourceware.org/bugzilla/show_bug.=
cgi?id=3D13296" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org=
/bugzilla/show_bug.cgi?id=3D13296</a><br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 volatile int k_i_d =3D kvm_irq_delivered;<br>
+=C2=A0 =C2=A0 trace_kvm_reset_irq_delivered(k_i_d);<br>
+<br>
+=C2=A0 =C2=A0 kvm_irq_delivered =3D 0;<br>
+}<br>
+<br>
+int kvm_get_irq_delivered(void)<br>
+{<br>
+=C2=A0 =C2=A0 trace_kvm_get_irq_delivered(kvm_irq_delivered);<br>
+<br>
+=C2=A0 =C2=A0 return kvm_irq_delivered;<br>
+}<br>
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c<br>
index 1ebb412479..947d68c257 100644<br>
--- a/hw/rtc/mc146818rtc.c<br>
+++ b/hw/rtc/mc146818rtc.c<br>
@@ -27,6 +27,7 @@<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;qemu/bcd.h&quot;<br>
=C2=A0#include &quot;hw/acpi/acpi_aml_interface.h&quot;<br>
+#include &quot;hw/intc/kvm_irqcount.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties-system.h&quot;<br>
@@ -46,7 +47,6 @@<br>
<br>
=C2=A0#ifdef TARGET_I386<br>
=C2=A0#include &quot;qapi/qapi-commands-misc-target.h&quot;<br>
-#include &quot;hw/i386/apic.h&quot;<br>
=C2=A0#endif<br>
<br>
=C2=A0//#define DEBUG_CMOS<br>
@@ -124,9 +124,9 @@ void qmp_rtc_reset_reinjection(Error **errp)<br>
<br>
=C2=A0static bool rtc_policy_slew_deliver_irq(RTCState *s)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 apic_reset_irq_delivered();<br>
+=C2=A0 =C2=A0 kvm_reset_irq_delivered();<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq_raise(s-&gt;irq);<br>
-=C2=A0 =C2=A0 return apic_get_irq_delivered();<br>
+=C2=A0 =C2=A0 return kvm_get_irq_delivered();<br>
=C2=A0}<br>
<br>
=C2=A0static void rtc_coalesced_timer(void *opaque)<br>
diff --git a/hw/intc/meson.build b/hw/intc/meson.build<br>
index bcbf22ff51..cd9f1ee888 100644<br>
--- a/hw/intc/meson.build<br>
+++ b/hw/intc/meson.build<br>
@@ -25,6 +25,12 @@ softmmu_ss.add(when: &#39;CONFIG_XILINX&#39;, if_true: f=
iles(&#39;xilinx_intc.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_XLNX_ZYNQMP&#39;, if_true: files(&#3=
9;xlnx-zynqmp-ipi.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_XLNX_ZYNQMP_PMU&#39;, if_true: files=
(&#39;xlnx-pmu-iomod-intc.c&#39;))<br>
<br>
+if config_all_devices.has_key(&#39;CONFIG_APIC&#39;) or \<br>
+=C2=A0 =C2=A0config_all_devices.has_key(&#39;CONFIG_I8259&#39;) or \<br>
+=C2=A0 =C2=A0config_all_devices.has_key(&#39;CONFIG_MC146818RTC&#39;)<br>
+=C2=A0 =C2=A0 softmmu_ss.add(files(&#39;kvm_irqcount.c&#39;))<br>
+endif<br></blockquote><div><br></div><div>I&#39;d slightly prefer to track=
 these dependencies via KConfig since its declarative nature seems to lend =
itself better for tooling. Anyway: <br></div><div><br></div><div>Reviewed-b=
y: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com">shentey@gmail.=
com</a>&gt;</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
+<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_ALLWINNER_A10_PIC&#39;, if_true: fi=
les(&#39;allwinner-a10-pic.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_APIC&#39;, if_true: files(&#39;apic=
.c&#39;, &#39;apic_common.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_ARM_GIC&#39;, if_true: files(&#39;a=
rm_gicv3_cpuif_common.c&#39;))<br>
diff --git a/hw/intc/trace-events b/hw/intc/trace-events<br>
index 6fbc2045e6..50cadfb996 100644<br>
--- a/hw/intc/trace-events<br>
+++ b/hw/intc/trace-events<br>
@@ -10,10 +10,6 @@ pic_ioport_read(bool master, uint64_t addr, int val) &qu=
ot;master %d addr 0x%&quot;PRIx64&quot;<br>
=C2=A0# apic_common.c<br>
=C2=A0cpu_set_apic_base(uint64_t val) &quot;0x%016&quot;PRIx64<br>
=C2=A0cpu_get_apic_base(uint64_t val) &quot;0x%016&quot;PRIx64<br>
-# coalescing<br>
-apic_report_irq_delivered(int apic_irq_delivered) &quot;coalescing %d&quot=
;<br>
-apic_reset_irq_delivered(int apic_irq_delivered) &quot;old coalescing %d&q=
uot;<br>
-apic_get_irq_delivered(int apic_irq_delivered) &quot;returning coalescing =
%d&quot;<br>
<br>
=C2=A0# apic.c<br>
=C2=A0apic_local_deliver(int vector, uint32_t lvt) &quot;vector %d delivery=
 mode %d&quot;<br>
@@ -30,6 +26,11 @@ ioapic_mem_read(uint8_t addr, uint8_t regsel, uint8_t si=
ze, uint32_t val) &quot;ioapi<br>
=C2=A0ioapic_mem_write(uint8_t addr, uint8_t regsel, uint8_t size, uint32_t=
 val) &quot;ioapic mem write addr 0x%&quot;PRIx8&quot; regsel: 0x%&quot;PRI=
x8&quot; size 0x%&quot;PRIx8&quot; val 0x%&quot;PRIx32<br>
=C2=A0ioapic_set_irq(int vector, int level) &quot;vector: %d level: %d&quot=
;<br>
<br>
+# kvm_irqcount.c<br>
+kvm_report_irq_delivered(int irq_delivered) &quot;coalescing %d&quot;<br>
+kvm_reset_irq_delivered(int irq_delivered) &quot;old coalescing %d&quot;<b=
r>
+kvm_get_irq_delivered(int irq_delivered) &quot;returning coalescing %d&quo=
t;<br>
+<br>
=C2=A0# slavio_intctl.c<br>
=C2=A0slavio_intctl_mem_readl(uint32_t cpu, uint64_t addr, uint32_t ret) &q=
uot;read cpu %d reg 0x%&quot;PRIx64&quot; =3D 0x%x&quot;<br>
=C2=A0slavio_intctl_mem_writel(uint32_t cpu, uint64_t addr, uint32_t val) &=
quot;write cpu %d reg 0x%&quot;PRIx64&quot; =3D 0x%x&quot;<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000d6de8105f15b94ad--

