Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7922E22F416
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 17:48:15 +0200 (CEST)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k05MM-0002sN-Ik
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 11:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1k05LZ-0002Ob-Ue
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 11:47:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27095
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1k05LW-00064c-GB
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 11:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595864840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4RDX39NUEU7bpwep5hs0kcjK1CmdqKe/p3D7N6dcXsk=;
 b=J6whbW3xzIDekSLce3L7UYwu3aXuZXIYMtEg73PbQpIzNjgLlz87/Mimdf/+9Fbg/XK7TN
 WI9JaWBtsugH1BHYv7QDSfMZmKZDBuXRTaja8i90ajaktXPHPx3MxXMPLqUD50czjhofON
 xnakwr9G8PsVuWJ7RynjNJQgcyyy8mA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-ju1RycXaNemh3ViqhUftOw-1; Mon, 27 Jul 2020 11:47:18 -0400
X-MC-Unique: ju1RycXaNemh3ViqhUftOw-1
Received: by mail-wm1-f71.google.com with SMTP id y204so7993224wmd.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 08:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4RDX39NUEU7bpwep5hs0kcjK1CmdqKe/p3D7N6dcXsk=;
 b=A9Sc+CgsUqe540Cb/z23qqhfDbTcBysbEE9w7+YMbGWGHps1TMq6gqSaX5M13EvJV+
 ZSn1a2Nd1TbiuvmCGdl+AGI4OPG34clWYQXdy0OLMyTtqIdQgGl2QDAtUgX1/U2hNzSX
 fB8POs3BbfnLYswF8C96d7oOOk4ERoQ1FMTCazMvVo/QFN/PWAkPaM0dDV/EYy98RGk/
 B4I+jNC2bxBZaheBfPd1xO8OKDr5UfCgzDA1ou4E/YEILS7HS88Wd5UkNUEHWSo5wlko
 Yx15Icp4Ke/KDcRcIMpxvVSwQAyeWJFagxSC7Ru/mh/Wi9vaExqW50PNuBRYXiR6WsfN
 /gqQ==
X-Gm-Message-State: AOAM531rjXsYIlKDreWfwDcs7a+yDn/iRcI5NsynrWdnL1pN1O7re3VE
 lGmkRYLnqGmd31oTsGRxOo7J1pCrTRGv0RxNeSBSAnCHnjH3jngr4WWXqC13hQoMlOLhz34RuqA
 h2jNhs25uIpIeTR8=
X-Received: by 2002:adf:b34a:: with SMTP id k10mr20616553wrd.402.1595864837460; 
 Mon, 27 Jul 2020 08:47:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS5Q+u5k+UfVFmSTRhRlApffIQu4oAvvGoTwTV9ELEhnusBcPgkyHWJry1gVwOwk+e3P1Pqg==
X-Received: by 2002:adf:b34a:: with SMTP id k10mr20616521wrd.402.1595864837107; 
 Mon, 27 Jul 2020 08:47:17 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id p8sm14009778wrq.9.2020.07.27.08.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 08:47:16 -0700 (PDT)
Date: Mon, 27 Jul 2020 11:47:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hogan Wang <hogan.wang@huawei.com>
Subject: Re: [PATCH v4 2/2] hw/pci-host: save/restore pci host config
 register for old ones
Message-ID: <20200727102012-mutt-send-email-mst@kernel.org>
References: <20200727084621.3279-1-hogan.wang@huawei.com>
 <20200727084621.3279-2-hogan.wang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200727084621.3279-2-hogan.wang@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 00:16:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Mon, Jul 27, 2020 at 04:46:21PM +0800, Hogan Wang wrote:
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

Great report, I copied it to the previous patch too.

> Before this patch, we can get KVM "emulation failure" error on vm2.

we can get -> we get

> This patch can fix it.

-> this patch fixes it

> 
> Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
> ---
>  hw/pci-host/i440fx.c | 31 +++++++++++++++++++++++++++++++
>  hw/pci-host/q35.c    | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index 8ed2417f0c..b78c8bc5f9 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -64,6 +64,14 @@ typedef struct I440FXState {
>   */
>  #define I440FX_COREBOOT_RAM_SIZE 0x57
>  
> +/* Older I440FX machines (5.0 and older) not support i440FX-pcihost state

not support -> do not support

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
> @@ -98,8 +106,30 @@ static void i440fx_write_config(PCIDevice *dev,
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
> +    if (!s->mig_enabled) {
> +        dev = PCI_DEVICE(d);
> +        s->config_reg = pci_get_long(&dev->config[I440FX_PCI_HOST_CONFIG_REG]);

So I guess at this point we want to reset the register to 0,
so it's not guest visible.


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
> +    if (!s->mig_enabled) {
> +        pci_set_long(&dev->config[I440FX_PCI_HOST_CONFIG_REG],
> +                     s->config_reg);
> +    }
>      return 0;
>  }


And I guess we want a post_save hook to clear this?

> @@ -107,6 +137,7 @@ static const VMStateDescription vmstate_i440fx = {
>      .name = "I440FX",
>      .version_id = 3,
>      .minimum_version_id = 3,
> +    .pre_save = i440fx_pre_save,
>      .post_load = i440fx_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(parent_obj, PCII440FXState),
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index b67cb9c29f..bed66be181 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -43,6 +43,15 @@
>  
>  #define Q35_PCI_HOST_HOLE64_SIZE_DEFAULT (1ULL << 35)
>  
> +/* Older Q35 machines (5.0 and older) not support q35-pcihost state

not support -> do not support.

> + * migration, use some reserved INTEL MCH configuration registers to
> + * save/restore q35-pcihost config register. Refer to [Intel 3 Series
> + * Chipset Family Datasheet Table 5-1. DRAM Controller Register Address
> + * Map (D0:F0)]
> + */
> +#define Q35_PCI_HOST_CONFIG_REG 0x70
> +
> +

extra empty line

>  static void q35_host_realize(DeviceState *dev, Error **errp)
>  {
>      PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> @@ -513,7 +522,27 @@ static void mch_update(MCHPCIState *mch)
>  static int mch_post_load(void *opaque, int version_id)
>  {
>      MCHPCIState *mch = opaque;
> +    PCIDevice *dev;
> +    PCIHostState *s = OBJECT_CHECK(PCIHostState,
> +                                   object_resolve_path("/machine/q35", NULL),
> +                                   TYPE_PCI_HOST_BRIDGE);
>      mch_update(mch);
> +    if (!s->mig_enabled) {
> +        dev = PCI_DEVICE(mch);
> +        s->config_reg = pci_get_long(&dev->config[Q35_PCI_HOST_CONFIG_REG]);
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
> +    if (!s->mig_enabled) {
> +        pci_set_long(&dev->config[Q35_PCI_HOST_CONFIG_REG], s->config_reg);
> +    }
>      return 0;
>  }
>  
> @@ -521,6 +550,7 @@ static const VMStateDescription vmstate_mch = {
>      .name = "mch",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .pre_save = mch_pre_save,
>      .post_load = mch_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(parent_obj, MCHPCIState),


Same comments.

> -- 
> 2.27.0
> 


