Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BEA2544D6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 14:15:44 +0200 (CEST)
Received: from localhost ([::1]:58626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBGoh-0001wG-Ar
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 08:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kBGnh-0001Vi-7X
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 08:14:41 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44427
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kBGnc-0002eC-Bh
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 08:14:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598530475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+1OL25OArQujGvxo6NHAnDTHx2gtwb7OLmIAPD5cbIo=;
 b=IUJFNrGUw6R+RabhXw8hBPALAKN/35ycPuHCfa2zolB6cQvu7V/VhDFCWb8xyw9O+OqlX0
 9N5Lcn1xpaIle3D4rRtme683cdRzuc7kJn5XiB2XJfHQsQe0uYkbHogkV43j/Pu95x57ui
 j1uUc0tTlHFy/KGfcvoiaXwhh+aTVaQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-6aM8KL26OXiE_pxFF1-L8g-1; Thu, 27 Aug 2020 08:14:33 -0400
X-MC-Unique: 6aM8KL26OXiE_pxFF1-L8g-1
Received: by mail-wr1-f70.google.com with SMTP id o10so1468591wrs.21
 for <qemu-devel@nongnu.org>; Thu, 27 Aug 2020 05:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+1OL25OArQujGvxo6NHAnDTHx2gtwb7OLmIAPD5cbIo=;
 b=X3YbiivS9uPGQzDocNwYESOVobzhF8CKOfpdTE1PyAIuZxZJXXf+1DoeO9x1nE/Xeh
 SCyQjbYYxMg+r8OtWs710EwZ7jdwtHjCyXaLK6+rLeqhRnSCmCaSxhiSRBfQERs6Kh25
 0WJzYCof/m1lIn7xlVhjy65yCL9/aFVk0ytQbPlwf3mGzDpmSNUEEschMT204vTpWNpD
 7v11TvzBCV1CQlLSK9/sOiB+r0fzOWcgVZwiXaiJ3HqGL+qboy+2i9DIrMjOhZVQ/CF3
 GMIz3KWwGd1wRl4lGwi94pmuXr7+exMeYCvGO3sp182iMQiPMWsVXLwBXkaDSkII2W8W
 FhzA==
X-Gm-Message-State: AOAM532AME/zXko7Rpx5hmT37jjYUQraXt1rZm1VbnIZFbmhxM7TlZ/J
 aCSCZmmUI8y/ENLiiklg76TlfTRZF2YKbJk2xNO17qQLFjYp2+yTzV2AKL2MINI3CPs4Z1ezwGe
 6TATZeqCaA1lltyQ=
X-Received: by 2002:a5d:574e:: with SMTP id q14mr9394668wrw.281.1598530472249; 
 Thu, 27 Aug 2020 05:14:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyov7Hex+KBdzDk+IW50EUICx2hVV5tMMP7NYHHFFQbwIVLikWaRsMvk4NVFjKVZh+vZArjrQ==
X-Received: by 2002:a5d:574e:: with SMTP id q14mr9394640wrw.281.1598530471906; 
 Thu, 27 Aug 2020 05:14:31 -0700 (PDT)
Received: from redhat.com (bzq-109-67-46-169.red.bezeqint.net. [109.67.46.169])
 by smtp.gmail.com with ESMTPSA id e2sm5906924wrt.66.2020.08.27.05.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 05:14:31 -0700 (PDT)
Date: Thu, 27 Aug 2020 08:14:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hogan Wang <hogan.wang@huawei.com>
Subject: Re: [PATCH] hw/pci-host: save/restore pci host config register for
 old ones
Message-ID: <20200827081352-mutt-send-email-mst@kernel.org>
References: <20200810085806.1221-1-hogan.wang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200810085806.1221-1-hogan.wang@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.004
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 00:53:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: weidong.huang@huawei.com, wangxinxin.wang@huawei.com, jusual@redhat.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 10, 2020 at 04:58:06PM +0800, Hogan Wang wrote:
> The i440fx and q35 machines integrate i440FX or MCH PCI device by default.
> Refer to i440FX and ICH9-LPC spcifications, there are some reserved
> configuration registers can used to save/restore PCIHostState.config_reg.
> It's nasty but friendly to old ones.
> 
> Reproducer steps:
> step 1. Make modifications to seabios and qemu for increase reproduction
> efficiency, write 0xf0 to 0x402 port notify qemu to stop vcpu after
> 0x0cf8 port wrote i440 configure register. qemu stop vcpu when catch
> 0x402 port wrote 0xf0.
> 
> seabios:/src/hw/pci.c
> @@ -52,6 +52,11 @@ void pci_config_writeb(u16 bdf, u32 addr, u8 val)
>          writeb(mmconfig_addr(bdf, addr), val);
>      } else {
>          outl(ioconfig_cmd(bdf, addr), PORT_PCI_CMD);
> +       if (bdf == 0 && addr == 0x72 && val == 0xa) {
> +            dprintf(1, "stop vcpu\n");
> +            outb(0xf0, 0x402); // notify qemu to stop vcpu
> +            dprintf(1, "resume vcpu\n");
> +        }
>          outb(val, PORT_PCI_DATA + (addr & 3));
>      }
>  }
> 
> qemu:hw/char/debugcon.c
> @@ -60,6 +61,9 @@ static void debugcon_ioport_write(void *opaque, hwaddr addr, uint64_t val,
>      printf(" [debugcon: write addr=0x%04" HWADDR_PRIx " val=0x%02" PRIx64 "]\n", addr, val);
>  #endif
> 
> +    if (ch == 0xf0) {
> +        vm_stop(RUN_STATE_PAUSED);
> +    }
>      /* XXX this blocks entire thread. Rewrite to use
>       * qemu_chr_fe_write and background I/O callbacks */
>      qemu_chr_fe_write_all(&s->chr, &ch, 1);
> 
> step 2. start vm1 by the following command line, and then vm stopped.
> $ qemu-system-x86_64 -machine pc-i440fx-5.0,accel=kvm\
>  -netdev tap,ifname=tap-test,id=hostnet0,vhost=on,downscript=no,script=no\
>  -device virtio-net-pci,netdev=hostnet0,id=net0,bus=pci.0,addr=0x13,bootindex=3\
>  -device cirrus-vga,id=video0,vgamem_mb=16,bus=pci.0,addr=0x2\
>  -chardev file,id=seabios,path=/var/log/test.seabios,append=on\
>  -device isa-debugcon,iobase=0x402,chardev=seabios\
>  -monitor stdio
> 
> step 3. start vm2 to accept vm1 state.
> $ qemu-system-x86_64 -machine pc-i440fx-5.0,accel=kvm\
>  -netdev tap,ifname=tap-test1,id=hostnet0,vhost=on,downscript=no,script=no\
>  -device virtio-net-pci,netdev=hostnet0,id=net0,bus=pci.0,addr=0x13,bootindex=3\
>  -device cirrus-vga,id=video0,vgamem_mb=16,bus=pci.0,addr=0x2\
>  -chardev file,id=seabios,path=/var/log/test.seabios,append=on\
>  -device isa-debugcon,iobase=0x402,chardev=seabios\
>  -monitor stdio \
>  -incoming tcp:127.0.0.1:8000
> 
> step 4. execute the following qmp command in vm1 to migrate.
> (qemu) migrate tcp:127.0.0.1:8000
> 
> step 5. execute the following qmp command in vm2 to resume vcpu.
> (qemu) cont
> 
> Before this patch, we get KVM "emulation failure" error on vm2.
> This patch fixes it.
> 
> Signed-off-by: Hogan Wang <hogan.wang@huawei.com>


dgilbrt so what is your take on this?
Also, how about a capability that will make hacks like this
one redundant in the future?

> ---
>  hw/pci-host/i440fx.c      | 46 +++++++++++++++++++++++++++++++++++++++
>  hw/pci-host/q35.c         | 44 +++++++++++++++++++++++++++++++++++++
>  hw/pci/pci_host.c         |  4 ++--
>  include/hw/pci/pci_host.h |  2 +-
>  4 files changed, 93 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index 8ed2417f0c..707e7e9dfb 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -64,6 +64,14 @@ typedef struct I440FXState {
>   */
>  #define I440FX_COREBOOT_RAM_SIZE 0x57
>  
> +/* Older I440FX machines (5.0 and older) do not support i440FX-pcihost state
> + * migration, use some reserved INTEL 82441 configuration registers to
> + * save/restore i440FX-pcihost config register. Refer to [INTEL 440FX PCISET
> + * 82441FX PCI AND MEMORY CONTROLLER (PMC) AND 82442FX DATA BUS ACCELERATOR
> + * (DBX) Table 1. PMC Configuration Space]
> + */
> +#define I440FX_PCI_HOST_CONFIG_REG 0x94
> +
>  static void i440fx_update_memory_mappings(PCII440FXState *d)
>  {
>      int i;
> @@ -98,15 +106,53 @@ static void i440fx_write_config(PCIDevice *dev,
>  static int i440fx_post_load(void *opaque, int version_id)
>  {
>      PCII440FXState *d = opaque;
> +    PCIDevice *dev;
> +    PCIHostState *s = OBJECT_CHECK(PCIHostState,
> +                                   object_resolve_path("/machine/i440fx", NULL),
> +                                   TYPE_PCI_HOST_BRIDGE);
>  
>      i440fx_update_memory_mappings(d);
> +
> +    if (!s->config_reg_mig_enabled) {
> +        dev = PCI_DEVICE(d);
> +        s->config_reg = pci_get_long(&dev->config[I440FX_PCI_HOST_CONFIG_REG]);
> +        pci_set_long(&dev->config[I440FX_PCI_HOST_CONFIG_REG], 0);
> +    }
> +    return 0;
> +}
> +
> +static int i440fx_pre_save(void *opaque)
> +{
> +    PCIDevice *dev = opaque;
> +    PCIHostState *s = OBJECT_CHECK(PCIHostState,
> +                                   object_resolve_path("/machine/i440fx", NULL),
> +                                   TYPE_PCI_HOST_BRIDGE);
> +    if (!s->config_reg_mig_enabled) {
> +        pci_set_long(&dev->config[I440FX_PCI_HOST_CONFIG_REG],
> +                     s->config_reg);
> +    }
> +    return 0;
> +}
> +
> +static int i440fx_post_save(void *opaque)
> +{
> +    PCIDevice *dev = opaque;
> +    PCIHostState *s = OBJECT_CHECK(PCIHostState,
> +                                   object_resolve_path("/machine/i440fx", NULL),
> +                                   TYPE_PCI_HOST_BRIDGE);
> +    if (!s->config_reg_mig_enabled) {
> +        pci_set_long(&dev->config[I440FX_PCI_HOST_CONFIG_REG], 0);
> +    }
>      return 0;
>  }
>  
> +
>  static const VMStateDescription vmstate_i440fx = {
>      .name = "I440FX",
>      .version_id = 3,
>      .minimum_version_id = 3,
> +    .pre_save = i440fx_pre_save,
> +    .post_save = i440fx_post_save,
>      .post_load = i440fx_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(parent_obj, PCII440FXState),
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index b67cb9c29f..40c975948c 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -43,6 +43,14 @@
>  
>  #define Q35_PCI_HOST_HOLE64_SIZE_DEFAULT (1ULL << 35)
>  
> +/* Older Q35 machines (5.0 and older) do not support q35-pcihost state
> + * migration, use some reserved INTEL MCH configuration registers to
> + * save/restore q35-pcihost config register. Refer to [Intel 3 Series
> + * Chipset Family Datasheet Table 5-1. DRAM Controller Register Address
> + * Map (D0:F0)]
> + */
> +#define Q35_PCI_HOST_CONFIG_REG 0x70
> +
>  static void q35_host_realize(DeviceState *dev, Error **errp)
>  {
>      PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> @@ -513,14 +521,50 @@ static void mch_update(MCHPCIState *mch)
>  static int mch_post_load(void *opaque, int version_id)
>  {
>      MCHPCIState *mch = opaque;
> +    PCIDevice *dev;
> +    PCIHostState *s = OBJECT_CHECK(PCIHostState,
> +                                   object_resolve_path("/machine/q35", NULL),
> +                                   TYPE_PCI_HOST_BRIDGE);
>      mch_update(mch);
> +    if (!s->config_reg_mig_enabled) {
> +        dev = PCI_DEVICE(mch);
> +        s->config_reg = pci_get_long(&dev->config[Q35_PCI_HOST_CONFIG_REG]);
> +        pci_set_long(&dev->config[Q35_PCI_HOST_CONFIG_REG], 0);
> +    }
> +    return 0;
> +}
> +
> +static int mch_pre_save(void *opaque)
> +{
> +    PCIDevice *dev = opaque;
> +    PCIHostState *s = OBJECT_CHECK(PCIHostState,
> +                                   object_resolve_path("/machine/q35", NULL),
> +                                   TYPE_PCI_HOST_BRIDGE);
> +    if (!s->config_reg_mig_enabled) {
> +        pci_set_long(&dev->config[Q35_PCI_HOST_CONFIG_REG], s->config_reg);
> +    }
>      return 0;
>  }
>  
> +static int mch_post_save(void *opaque)
> +{
> +    PCIDevice *dev = opaque;
> +    PCIHostState *s = OBJECT_CHECK(PCIHostState,
> +                                   object_resolve_path("/machine/q35", NULL),
> +                                   TYPE_PCI_HOST_BRIDGE);
> +    if (!s->config_reg_mig_enabled) {
> +        pci_set_long(&dev->config[Q35_PCI_HOST_CONFIG_REG], 0);
> +    }
> +    return 0;
> +}
> +
> +
>  static const VMStateDescription vmstate_mch = {
>      .name = "mch",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .pre_save = mch_pre_save,
> +    .post_save = mch_post_save,
>      .post_load = mch_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(parent_obj, MCHPCIState),
> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> index 8ca5fadcbd..c24daea84e 100644
> --- a/hw/pci/pci_host.c
> +++ b/hw/pci/pci_host.c
> @@ -205,7 +205,7 @@ const MemoryRegionOps pci_host_data_be_ops = {
>  static bool pci_host_needed(void *opaque)
>  {
>      PCIHostState *s = opaque;
> -    return s->mig_enabled;
> +    return s->config_reg_mig_enabled;
>  }
>  
>  const VMStateDescription vmstate_pcihost = {
> @@ -221,7 +221,7 @@ const VMStateDescription vmstate_pcihost = {
>  
>  static Property pci_host_properties_common[] = {
>      DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PCIHostState,
> -                     mig_enabled, true),
> +                     config_reg_mig_enabled, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
> index 6210a7e14d..23d6249979 100644
> --- a/include/hw/pci/pci_host.h
> +++ b/include/hw/pci/pci_host.h
> @@ -45,7 +45,7 @@ struct PCIHostState {
>      MemoryRegion data_mem;
>      MemoryRegion mmcfg;
>      uint32_t config_reg;
> -    bool mig_enabled;
> +    bool config_reg_mig_enabled;
>      PCIBus *bus;
>  
>      QLIST_ENTRY(PCIHostState) next;
> -- 
> 2.27.0
> 


