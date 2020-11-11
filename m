Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DBD2AF0A4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:30:00 +0100 (CET)
Received: from localhost ([::1]:49406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpGB-0007fY-C8
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kcpEm-000746-7a
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:28:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kcpEi-0004RR-A0
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:28:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605097706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lq/jO6BjYWfzxE9NUJuORHkVwTBAIZubA9qP5Rsy8f8=;
 b=M+2AH4fb3CZKtFsMo2tJ1oee8k3Hj+A7MKayMGj7hSFvI9lugVShT+HzwRuKqHYs9w8rqe
 xecdwgVoFkCu/mwpT7FMF2qa98lASjXPoFzLmK1IEKEK5JbEOIT1Y5EPb4sND0QwJzb5IL
 JGWm+gRKwi5oWjEgfB+PER9Reb7drMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-GaxVI7t1MSeGtsHltrwc-g-1; Wed, 11 Nov 2020 07:28:25 -0500
X-MC-Unique: GaxVI7t1MSeGtsHltrwc-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40B1A64160;
 Wed, 11 Nov 2020 12:28:24 +0000 (UTC)
Received: from localhost (unknown [10.40.208.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E27810023A5;
 Wed, 11 Nov 2020 12:28:12 +0000 (UTC)
Date: Wed, 11 Nov 2020 13:28:11 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 03/12] x86: add support for second ioapic
Message-ID: <20201111132811.528570bc@redhat.com>
In-Reply-To: <20201105133923.23821-4-kraxel@redhat.com>
References: <20201105133923.23821-1-kraxel@redhat.com>
 <20201105133923.23821-4-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Nov 2020 14:39:14 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Add ioapic_init_secondary to initialize it, wire up
> in gsi handling and acpi apic table creation.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/i386/ioapic.h          |  1 +
>  include/hw/i386/ioapic_internal.h |  2 +-
>  include/hw/i386/x86.h             |  3 +++
>  hw/i386/acpi-common.c             | 10 ++++++++++
>  hw/i386/x86.c                     | 20 ++++++++++++++++++++
>  5 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/i386/ioapic.h b/include/hw/i386/ioapic.h
> index 59fcb158a734..1323b4b8ff6e 100644
> --- a/include/hw/i386/ioapic.h
> +++ b/include/hw/i386/ioapic.h
> @@ -22,6 +22,7 @@
>  
>  #define IOAPIC_NUM_PINS 24
>  #define IO_APIC_DEFAULT_ADDRESS 0xfec00000
> +#define IO_APIC_SECONDARY_ADDRESS (IO_APIC_DEFAULT_ADDRESS + 0x10000)
>  
>  #define TYPE_KVM_IOAPIC "kvm-ioapic"
>  #define TYPE_IOAPIC "ioapic"
> diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
> index 0ac9e2400d6b..4cebd2e32c9f 100644
> --- a/include/hw/i386/ioapic_internal.h
> +++ b/include/hw/i386/ioapic_internal.h
> @@ -27,7 +27,7 @@
>  #include "qemu/notify.h"
>  #include "qom/object.h"
>  
> -#define MAX_IOAPICS                     1
> +#define MAX_IOAPICS                     2
>  
>  #define IOAPIC_LVT_DEST_SHIFT           56
>  #define IOAPIC_LVT_DEST_IDX_SHIFT       48
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index 739fac50871b..3f9b052cfc34 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -50,6 +50,7 @@ struct X86MachineState {
>      ISADevice *rtc;
>      FWCfgState *fw_cfg;
>      qemu_irq *gsi;
> +    DeviceState *ioapic2;
>      GMappedFile *initrd_mapped_file;
>      HotplugHandler *acpi_dev;
>  
> @@ -120,10 +121,12 @@ bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
>  typedef struct GSIState {
>      qemu_irq i8259_irq[ISA_NUM_IRQS];
>      qemu_irq ioapic_irq[IOAPIC_NUM_PINS];
> +    qemu_irq ioapic2_irq[IOAPIC_NUM_PINS];
>  } GSIState;
>  
>  qemu_irq x86_allocate_cpu_irq(void);
>  void gsi_handler(void *opaque, int n, int level);
>  void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name);
> +DeviceState *ioapic_init_secondary(GSIState *gsi_state);
>  
>  #endif
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 8a769654060e..91970837bb68 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -103,6 +103,16 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>      io_apic->address = cpu_to_le32(IO_APIC_DEFAULT_ADDRESS);
>      io_apic->interrupt = cpu_to_le32(0);
>  
> +    if (x86ms->ioapic2) {
> +        AcpiMadtIoApic *io_apic2;
> +        io_apic2 = acpi_data_push(table_data, sizeof *io_apic);
> +        io_apic2->type = ACPI_APIC_IO;
> +        io_apic2->length = sizeof(*io_apic);
> +        io_apic2->io_apic_id = ACPI_BUILD_IOAPIC_ID + 1;
> +        io_apic2->address = cpu_to_le32(IO_APIC_SECONDARY_ADDRESS);
> +        io_apic2->interrupt = cpu_to_le32(24);
                                             ^^
it's no obvious where this magic number comes from.

PS:
maybe add for it a more descriptive macro 

> +    }
> +
>      if (x86ms->apic_xrupt_override) {
>          intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
>          intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index b67e7b789f89..628118e8b410 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -598,6 +598,9 @@ void gsi_handler(void *opaque, int n, int level)
>      case ISA_NUM_IRQS ... IOAPIC_NUM_PINS - 1:
>          qemu_set_irq(s->ioapic_irq[n], level);
>          break;
> +    case IOAPIC_NUM_PINS ... IOAPIC_NUM_PINS * 2 - 1:
> +        qemu_set_irq(s->ioapic2_irq[n - IOAPIC_NUM_PINS], level);
> +        break;
>      }
>  }
>  
> @@ -624,6 +627,23 @@ void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name)
>      }
>  }
>  
> +DeviceState *ioapic_init_secondary(GSIState *gsi_state)
> +{
> +    DeviceState *dev;
> +    SysBusDevice *d;
> +    unsigned int i;
> +
> +    dev = qdev_new(TYPE_IOAPIC);
> +    d = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(d, &error_fatal);
> +    sysbus_mmio_map(d, 0, IO_APIC_SECONDARY_ADDRESS);
> +
> +    for (i = 0; i < IOAPIC_NUM_PINS; i++) {
> +        gsi_state->ioapic2_irq[i] = qdev_get_gpio_in(dev, i);
> +    }
> +    return dev;
> +}
> +
>  struct setup_data {
>      uint64_t next;
>      uint32_t type;


