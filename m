Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3521450D91C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 08:01:21 +0200 (CEST)
Received: from localhost ([::1]:44268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nirmh-0001VQ-Pd
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 02:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nirZH-0006Na-Az
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 01:47:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nirZE-0002h9-0g
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 01:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650865641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+3Q/3bhg1rhTp4SqVigRcN7Bk7cRCPQOmTVlBpyS6JY=;
 b=XcwKncmaIjmKQu5qNdNXoCi2VwMLmoYQ13jLMeIiqTLw3oLosfVYryYC1T9Eyu7gdf7d6q
 PM0qF9eQtI3/AodY90YJXdFQcnyQfiOoHdroAdpoIPveMeImLXXzCsK/0AmTV8KaKS9epB
 G2xpqr286/Awg3MZ5sBV2HStie5fh+Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-74ujL5eZM_Odr2UXQWtOFw-1; Mon, 25 Apr 2022 01:47:18 -0400
X-MC-Unique: 74ujL5eZM_Odr2UXQWtOFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6250299E743;
 Mon, 25 Apr 2022 05:47:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E0C114C26A0;
 Mon, 25 Apr 2022 05:47:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5172921E6A1F; Mon, 25 Apr 2022 07:47:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gautam Agrawal <gautamnagrawal@gmail.com>
Subject: Re: [PATCH] Warn user if the vga flag is passed but no vga device
 is created
References: <20220408104519.32931-1-gautamnagrawal@gmail.com>
Date: Mon, 25 Apr 2022 07:47:16 +0200
In-Reply-To: <20220408104519.32931-1-gautamnagrawal@gmail.com> (Gautam
 Agrawal's message of "Fri, 8 Apr 2022 16:15:19 +0530")
Message-ID: <874k2hr9y3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, stefanha@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gautam Agrawal <gautamnagrawal@gmail.com> writes:

> This patch is in regards to this issue:https://gitlab.com/qemu-project/qemu/-/issues/581#.
> A global boolean variable "vga_interface_created"(declared in softmmu/globals.c)
> has been used to track the creation of vga interface. If the vga flag is passed in the command
> line "default_vga"(declared in softmmu/vl.c) variable is set to 0. To warn user, the condition
> checks if vga_interface_created is false and default_vga is equal to 0.
>
> The warning "No vga device is created" is logged if vga flag is passed
> but no vga device is created. This patch has been tested for
> x86_64, i386, sparc, sparc64 and arm boards.

Suggest to include a reproducer here, e.g.

    $ qemu-system-x86_64 -S -display none -M microvm -vga std
    qemu-system-x86_64: warning: No vga device is created

See below for my critique of the warning message.

>
> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
> ---
>  hw/isa/isa-bus.c        | 1 +
>  hw/pci/pci.c            | 1 +
>  hw/sparc/sun4m.c        | 2 ++
>  hw/sparc64/sun4u.c      | 1 +
>  include/sysemu/sysemu.h | 1 +
>  softmmu/globals.c       | 1 +
>  softmmu/vl.c            | 3 +++
>  7 files changed, 10 insertions(+)
>
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 0ad1c5fd65..cd5ad3687d 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -166,6 +166,7 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp)
>  
>  ISADevice *isa_vga_init(ISABus *bus)
>  {
> +    vga_interface_created = true;
>      switch (vga_interface_type) {
>      case VGA_CIRRUS:
>          return isa_create_simple(bus, "isa-cirrus-vga");
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index dae9119bfe..fab9c80f8d 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2038,6 +2038,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>  
>  PCIDevice *pci_vga_init(PCIBus *bus)
>  {
> +    vga_interface_created = true;
>      switch (vga_interface_type) {
>      case VGA_CIRRUS:
>          return pci_create_simple(bus, -1, "cirrus-vga");
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 7f3a7c0027..f45e29acc8 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -921,6 +921,7 @@ static void sun4m_hw_init(MachineState *machine)
>              /* sbus irq 5 */
>              cg3_init(hwdef->tcx_base, slavio_irq[11], 0x00100000,
>                       graphic_width, graphic_height, graphic_depth);
> +            vga_interface_created = true;
>          } else {
>              /* If no display specified, default to TCX */
>              if (graphic_depth != 8 && graphic_depth != 24) {
> @@ -936,6 +937,7 @@ static void sun4m_hw_init(MachineState *machine)
>  
>              tcx_init(hwdef->tcx_base, slavio_irq[11], 0x00100000,
>                       graphic_width, graphic_height, graphic_depth);
> +            vga_interface_created = true;
>          }
>      }
>  
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index cda7df36e3..75334dba71 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -633,6 +633,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
>      switch (vga_interface_type) {
>      case VGA_STD:
>          pci_create_simple(pci_busA, PCI_DEVFN(2, 0), "VGA");
> +        vga_interface_created = true;
>          break;
>      case VGA_NONE:
>          break;
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index b9421e03ff..a558b895e4 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -32,6 +32,7 @@ typedef enum {
>  } VGAInterfaceType;
>  
>  extern int vga_interface_type;
> +extern bool vga_interface_created;
>  
>  extern int graphic_width;
>  extern int graphic_height;
> diff --git a/softmmu/globals.c b/softmmu/globals.c
> index 3ebd718e35..1a5f8d42ad 100644
> --- a/softmmu/globals.c
> +++ b/softmmu/globals.c
> @@ -40,6 +40,7 @@ int nb_nics;
>  NICInfo nd_table[MAX_NICS];
>  int autostart = 1;
>  int vga_interface_type = VGA_NONE;
> +bool vga_interface_created = false;
>  Chardev *parallel_hds[MAX_PARALLEL_PORTS];
>  int win2k_install_hack;
>  int singlestep;
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 6f646531a0..cb79fa1f42 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2734,6 +2734,9 @@ static void qemu_machine_creation_done(void)
>      if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
>          exit(1);
>      }
> +    if (!vga_interface_created && !default_vga) {
> +        warn_report("No vga device is created");

True, but this leaves the user guessing why.

Pointing to the option would help:

    qemu-system-x86_64: warning: -vga std: No vga device is created

To get this, use loc_save() to save the option's location along
@vga_model, then bracket the warn_report() with loc_push_restore() and
loc_pop().

The option to ask the board to create a video device is spelled -vga for
historical reasons.  Some of its arguments aren't VGA devices, e.g. tcx.
-help is phrased accordingly:

    -vga [std|cirrus|vmware|qxl|xenfb|tcx|cg3|virtio|none]
                    select video card type

Warning "No video device has been created" would be better.

However, if we point to the option anyway, we can simply note that it is
being ignored.  Prior art:

    $ qemu-system-x86_64 -drive if=mtd
    qemu-system-x86_64: -drive if=mtd: machine type does not support if=mtd,bus=0,unit=0

and

    $ qemu-system-x86_64 -S -display none -M microvm -net nic
    qemu-system-x86_64: warning: hub port hub0port0 has no peer
    qemu-system-x86_64: warning: netdev hub0port0 has no peer
    qemu-system-x86_64: warning: requested NIC (#net040, model unspecified) was not created (not supported by this machine?)

The former is clearly better.  What about this:

    qemu-system-x86_64: warning: -vga std: machine type does not support video card "std"

> +    }
>  }
>  
>  void qmp_x_exit_preconfig(Error **errp)


