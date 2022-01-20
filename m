Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6A0494D09
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:31:43 +0100 (CET)
Received: from localhost ([::1]:36000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAVfJ-0002ki-3r
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:31:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nAUqv-000703-56
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:39:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nAUqr-00086Y-2Y
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642675172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QBePi8v6pUtBcSGPtIfvp6IjPCtA2O4jRBvY5BBITV8=;
 b=Cx+XW7s2k+G9iFviwceIi7fxdLATBAJLKJimaDgmIfytR+YCXJQD2M4E5+xpRuFpWZDOPL
 GdeeKMkesDQis6HA/+pW301HwSnj3QfhPGVwZMIofzFTQXtL/k5ZFlkbL5HkMOD4hywAOH
 DmDFysb1ssObPir8y2ykHVQphWr5OmE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-QoNKrw7iPqm6WresoCgLaQ-1; Thu, 20 Jan 2022 05:39:31 -0500
X-MC-Unique: QoNKrw7iPqm6WresoCgLaQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n25-20020a05600c3b9900b00348b83fbd0dso3820786wms.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 02:39:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QBePi8v6pUtBcSGPtIfvp6IjPCtA2O4jRBvY5BBITV8=;
 b=QpPfdtDBQcXh7aptx/52fRnWOaS3KkO+wz/Ve5fqwp8lW40BsmzCE7oS88mcwK4sjo
 6/Z04BOA58Y7hjWCPRRfQAP8BbtiUJ7mToOZa7eIyBx4rkPO12EfDPgWRLZKjkuftAfC
 I7t3rSisc5V5aHnXxHVqH+A+05HNN+6VtPouCQac/A7l2MrkO9w0A5CXXHtXnW/luunP
 Yorf9bC63twlX0L0aksyFK10tUf5H9s5eqJMOr1pcW9wLcjiQyJsW7fFDrxkEjYbP/Sl
 /bd+N+G4YgN/7Sk5cLn35WfLz9cQ9+M3CGIAGavunYcc3ZTnEtmPWETKEplxPR9zwLXH
 gB2g==
X-Gm-Message-State: AOAM532W6BwMdYJEJmzWBhkl25YcxQ1uzvUqhq1mMZNIvN2xrmJ3GSst
 STqsqXTFHKwzr+Tmm67ElkoVcnYNC+r977pvM4lr+1NRrs/OSZy+BidrDpvcf6WR9fAORbDI8+/
 wy4L3tm4IeLJCPTE=
X-Received: by 2002:a5d:6742:: with SMTP id l2mr4397090wrw.241.1642675169699; 
 Thu, 20 Jan 2022 02:39:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUWh01fexKOnojZfMp96eyEHCDDreMWkSG3VpIB59ynb3WpUQwVNd0anhzV8tEHeF9e31UNg==
X-Received: by 2002:a5d:6742:: with SMTP id l2mr4397064wrw.241.1642675169415; 
 Thu, 20 Jan 2022 02:39:29 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id g5sm2957651wri.110.2022.01.20.02.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 02:39:28 -0800 (PST)
Date: Thu, 20 Jan 2022 10:39:26 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] Remove unnecessary minimum_version_id_old fields
Message-ID: <Yek73jGksGrGBdAZ@work-vm>
References: <20220118104434.4117879-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220118104434.4117879-1-peter.maydell@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> The migration code will not look at a VMStateDescription's
> minimum_version_id_old field unless that VMSD has set the
> load_state_old field to something non-NULL.  (The purpose of
> minimum_version_id_old is to specify what migration version is needed
> for the code in the function pointed to by load_state_old to be able
> to handle it on incoming migration.)

Agreed;
        if (vmsd->load_state_old &&
            version_id >= vmsd->minimum_version_id_old) {

> We have exactly one VMSD which still has a load_state_old,
> in the PPC CPU; every other VMSD which sets minimum_version_id_old
> is doing so unnecessarily. Delete all the unnecessary ones.

Yeh

> Commit created with:
>   sed -i '/\.minimum_version_id_old/d' $(git grep -l '\.minimum_version_id_old')
> with the one legitimate use then hand-edited back in.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/acpi/cpu.c                 | 2 --
>  hw/acpi/ich9.c                | 3 ---
>  hw/acpi/memory_hotplug.c      | 2 --
>  hw/acpi/piix4.c               | 2 --
>  hw/acpi/tco.c                 | 1 -
>  hw/audio/pcspk.c              | 1 -
>  hw/display/macfb.c            | 1 -
>  hw/dma/xlnx-zdma.c            | 1 -
>  hw/dma/xlnx_csu_dma.c         | 1 -
>  hw/gpio/imx_gpio.c            | 1 -
>  hw/misc/bcm2835_mbox.c        | 1 -
>  hw/net/can/can_kvaser_pci.c   | 1 -
>  hw/net/can/can_mioe3680_pci.c | 1 -
>  hw/net/can/can_pcm3680_pci.c  | 1 -
>  hw/net/can/can_sja1000.c      | 2 --
>  hw/net/can/ctucan_core.c      | 2 --
>  hw/net/can/ctucan_pci.c       | 1 -
>  hw/ppc/ppc.c                  | 1 -
>  hw/scsi/megasas.c             | 1 -
>  hw/scsi/mptsas.c              | 1 -
>  hw/virtio/virtio-mmio.c       | 1 -
>  hw/virtio/virtio-pci.c        | 1 -
>  hw/virtio/virtio.c            | 1 -
>  target/openrisc/machine.c     | 1 -
>  target/ppc/machine.c          | 1 -
>  target/sparc/machine.c        | 4 ----
>  26 files changed, 36 deletions(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index b20903ea303..3646dbfe68a 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -297,7 +297,6 @@ static const VMStateDescription vmstate_cpuhp_sts = {
>      .name = "CPU hotplug device state",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields      = (VMStateField[]) {
>          VMSTATE_BOOL(is_inserting, AcpiCpuStatus),
>          VMSTATE_BOOL(is_removing, AcpiCpuStatus),
> @@ -311,7 +310,6 @@ const VMStateDescription vmstate_cpu_hotplug = {
>      .name = "CPU hotplug state",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields      = (VMStateField[]) {
>          VMSTATE_UINT32(selector, CPUHotplugState),
>          VMSTATE_UINT8(command, CPUHotplugState),
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index ebe08ed831f..bd9bbade705 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -163,7 +163,6 @@ static const VMStateDescription vmstate_memhp_state = {
>      .name = "ich9_pm/memhp",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .needed = vmstate_test_use_memhp,
>      .fields      = (VMStateField[]) {
>          VMSTATE_MEMORY_HOTPLUG(acpi_memory_hotplug, ICH9LPCPMRegs),
> @@ -181,7 +180,6 @@ static const VMStateDescription vmstate_tco_io_state = {
>      .name = "ich9_pm/tco",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .needed = vmstate_test_use_tco,
>      .fields      = (VMStateField[]) {
>          VMSTATE_STRUCT(tco_regs, ICH9LPCPMRegs, 1, vmstate_tco_io_sts,
> @@ -208,7 +206,6 @@ static const VMStateDescription vmstate_cpuhp_state = {
>      .name = "ich9_pm/cpuhp",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .needed = vmstate_test_use_cpuhp,
>      .pre_load = vmstate_cpuhp_pre_load,
>      .fields      = (VMStateField[]) {
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index d0fffcf7870..a581a2183b2 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -318,7 +318,6 @@ static const VMStateDescription vmstate_memhp_sts = {
>      .name = "memory hotplug device state",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields      = (VMStateField[]) {
>          VMSTATE_BOOL(is_enabled, MemStatus),
>          VMSTATE_BOOL(is_inserting, MemStatus),
> @@ -332,7 +331,6 @@ const VMStateDescription vmstate_memory_hotplug = {
>      .name = "memory hotplug state",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields      = (VMStateField[]) {
>          VMSTATE_UINT32(selector, MemHotplugState),
>          VMSTATE_STRUCT_VARRAY_POINTER_UINT32(devs, MemHotplugState, dev_count,
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index f0b5fac44a1..cc37fa34168 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -230,7 +230,6 @@ static const VMStateDescription vmstate_memhp_state = {
>      .name = "piix4_pm/memhp",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .needed = vmstate_test_use_memhp,
>      .fields      = (VMStateField[]) {
>          VMSTATE_MEMORY_HOTPLUG(acpi_memory_hotplug, PIIX4PMState),
> @@ -255,7 +254,6 @@ static const VMStateDescription vmstate_cpuhp_state = {
>      .name = "piix4_pm/cpuhp",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .needed = vmstate_test_use_cpuhp,
>      .pre_load = vmstate_cpuhp_pre_load,
>      .fields      = (VMStateField[]) {
> diff --git a/hw/acpi/tco.c b/hw/acpi/tco.c
> index cf1e68a5393..4783721e4e7 100644
> --- a/hw/acpi/tco.c
> +++ b/hw/acpi/tco.c
> @@ -239,7 +239,6 @@ const VMStateDescription vmstate_tco_io_sts = {
>      .name = "tco io device status",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields      = (VMStateField[]) {
>          VMSTATE_UINT16(tco.rld, TCOIORegs),
>          VMSTATE_UINT8(tco.din, TCOIORegs),
> diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
> index b056c05387c..dfc7ebca4e1 100644
> --- a/hw/audio/pcspk.c
> +++ b/hw/audio/pcspk.c
> @@ -209,7 +209,6 @@ static const VMStateDescription vmstate_spk = {
>      .name = "pcspk",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .needed = migrate_needed,
>      .fields      = (VMStateField[]) {
>          VMSTATE_UINT8(data_on, PCSpkState),
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 4bd7c3ad6a5..2eeb80cc3f0 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -616,7 +616,6 @@ static const VMStateDescription vmstate_macfb = {
>      .name = "macfb",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .post_load = macfb_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT8_ARRAY(color_palette, MacfbState, 256 * 3),
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index a5a92b4ff8c..4eb7f66e9f8 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -806,7 +806,6 @@ static const VMStateDescription vmstate_zdma = {
>      .name = TYPE_XLNX_ZDMA,
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32_ARRAY(regs, XlnxZDMA, ZDMA_R_MAX),
>          VMSTATE_UINT32(state, XlnxZDMA),
> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> index 896bb3574dd..5b62a2f74f7 100644
> --- a/hw/dma/xlnx_csu_dma.c
> +++ b/hw/dma/xlnx_csu_dma.c
> @@ -663,7 +663,6 @@ static const VMStateDescription vmstate_xlnx_csu_dma = {
>      .name = TYPE_XLNX_CSU_DMA,
>      .version_id = 0,
>      .minimum_version_id = 0,
> -    .minimum_version_id_old = 0,
>      .fields = (VMStateField[]) {
>          VMSTATE_PTIMER(src_timer, XlnxCSUDMA),
>          VMSTATE_UINT16(width, XlnxCSUDMA),
> diff --git a/hw/gpio/imx_gpio.c b/hw/gpio/imx_gpio.c
> index 7a591804a99..c7f98b7bb15 100644
> --- a/hw/gpio/imx_gpio.c
> +++ b/hw/gpio/imx_gpio.c
> @@ -277,7 +277,6 @@ static const VMStateDescription vmstate_imx_gpio = {
>      .name = TYPE_IMX_GPIO,
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(dr, IMXGPIOState),
>          VMSTATE_UINT32(gdir, IMXGPIOState),
> diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
> index 9f73cbd5e41..04e53c98282 100644
> --- a/hw/misc/bcm2835_mbox.c
> +++ b/hw/misc/bcm2835_mbox.c
> @@ -271,7 +271,6 @@ static const VMStateDescription vmstate_bcm2835_mbox = {
>      .name = TYPE_BCM2835_MBOX,
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields      = (VMStateField[]) {
>          VMSTATE_BOOL_ARRAY(available, BCM2835MboxState, MBOX_CHAN_COUNT),
>          VMSTATE_STRUCT_ARRAY(mbox, BCM2835MboxState, 2, 1,
> diff --git a/hw/net/can/can_kvaser_pci.c b/hw/net/can/can_kvaser_pci.c
> index 168b3a620d9..94b3a534f84 100644
> --- a/hw/net/can/can_kvaser_pci.c
> +++ b/hw/net/can/can_kvaser_pci.c
> @@ -266,7 +266,6 @@ static const VMStateDescription vmstate_kvaser_pci = {
>      .name = "kvaser_pci",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(dev, KvaserPCIState),
>          /* Load this before sja_state.  */
> diff --git a/hw/net/can/can_mioe3680_pci.c b/hw/net/can/can_mioe3680_pci.c
> index 7a79e2605ae..29dc696f7c8 100644
> --- a/hw/net/can/can_mioe3680_pci.c
> +++ b/hw/net/can/can_mioe3680_pci.c
> @@ -203,7 +203,6 @@ static const VMStateDescription vmstate_mioe3680_pci = {
>      .name = "mioe3680_pci",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(dev, Mioe3680PCIState),
>          VMSTATE_STRUCT(sja_state[0], Mioe3680PCIState, 0, vmstate_can_sja,
> diff --git a/hw/net/can/can_pcm3680_pci.c b/hw/net/can/can_pcm3680_pci.c
> index 8ef4e74af02..e8e57f4f33e 100644
> --- a/hw/net/can/can_pcm3680_pci.c
> +++ b/hw/net/can/can_pcm3680_pci.c
> @@ -204,7 +204,6 @@ static const VMStateDescription vmstate_pcm3680i_pci = {
>      .name = "pcm3680i_pci",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(dev, Pcm3680iPCIState),
>          VMSTATE_STRUCT(sja_state[0], Pcm3680iPCIState, 0,
> diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
> index 34eea684ced..3ba803e947d 100644
> --- a/hw/net/can/can_sja1000.c
> +++ b/hw/net/can/can_sja1000.c
> @@ -928,7 +928,6 @@ const VMStateDescription vmstate_qemu_can_filter = {
>      .name = "qemu_can_filter",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(can_id, qemu_can_filter),
>          VMSTATE_UINT32(can_mask, qemu_can_filter),
> @@ -952,7 +951,6 @@ const VMStateDescription vmstate_can_sja = {
>      .name = "can_sja",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .post_load = can_sja_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT8(mode, CanSJA1000State),
> diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
> index d171c372e00..f2c3b6a7061 100644
> --- a/hw/net/can/ctucan_core.c
> +++ b/hw/net/can/ctucan_core.c
> @@ -617,7 +617,6 @@ const VMStateDescription vmstate_qemu_ctucan_tx_buffer = {
>      .name = "qemu_ctucan_tx_buffer",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT8_ARRAY(data, CtuCanCoreMsgBuffer, CTUCAN_CORE_MSG_MAX_LEN),
>          VMSTATE_END_OF_LIST()
> @@ -636,7 +635,6 @@ const VMStateDescription vmstate_ctucan = {
>      .name = "ctucan",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .post_load = ctucan_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(mode_settings.u32, CtuCanCoreState),
> diff --git a/hw/net/can/ctucan_pci.c b/hw/net/can/ctucan_pci.c
> index f1c86cd06a7..50f4ea6cd63 100644
> --- a/hw/net/can/ctucan_pci.c
> +++ b/hw/net/can/ctucan_pci.c
> @@ -215,7 +215,6 @@ static const VMStateDescription vmstate_ctucan_pci = {
>      .name = "ctucan_pci",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(dev, CtuCanPCIState),
>          VMSTATE_STRUCT(ctucan_state[0], CtuCanPCIState, 0, vmstate_ctucan,
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index bb5bee9a338..462c87dba8b 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -1049,7 +1049,6 @@ const VMStateDescription vmstate_ppc_timebase = {
>      .name = "timebase",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .pre_save = timebase_pre_save,
>      .fields      = (VMStateField []) {
>          VMSTATE_UINT64(guest_timebase, PPCTimebase),
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index dc9bbdb740e..1a72e52396a 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -2293,7 +2293,6 @@ static const VMStateDescription vmstate_megasas_gen2 = {
>      .name = "megasas-gen2",
>      .version_id = 0,
>      .minimum_version_id = 0,
> -    .minimum_version_id_old = 0,
>      .fields      = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(parent_obj, MegasasState),
>          VMSTATE_MSIX(parent_obj, MegasasState),
> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> index 5181b0c0b0d..706cf0df3a1 100644
> --- a/hw/scsi/mptsas.c
> +++ b/hw/scsi/mptsas.c
> @@ -1363,7 +1363,6 @@ static const VMStateDescription vmstate_mptsas = {
>      .name = "mptsas",
>      .version_id = 0,
>      .minimum_version_id = 0,
> -    .minimum_version_id_old = 0,
>      .post_load = mptsas_post_load,
>      .fields      = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(dev, MPTSASState),
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 72da12fea59..688eccda94d 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -592,7 +592,6 @@ static const VMStateDescription vmstate_virtio_mmio = {
>      .name = "virtio_mmio",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_END_OF_LIST()
>      },
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 750aa47ec14..f9cf9592fdf 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -131,7 +131,6 @@ static const VMStateDescription vmstate_virtio_pci = {
>      .name = "virtio_pci",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_END_OF_LIST()
>      },
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index aae72fb8b73..9e8f51dfb03 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2808,7 +2808,6 @@ static const VMStateDescription vmstate_virtio = {
>      .name = "virtio",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_END_OF_LIST()
>      },
> diff --git a/target/openrisc/machine.c b/target/openrisc/machine.c
> index 6239725c4f5..b7d73886401 100644
> --- a/target/openrisc/machine.c
> +++ b/target/openrisc/machine.c
> @@ -25,7 +25,6 @@ static const VMStateDescription vmstate_tlb_entry = {
>      .name = "tlb_entry",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINTTL(mr, OpenRISCTLBEntry),
>          VMSTATE_UINTTL(tr, OpenRISCTLBEntry),
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 756d8de5d8d..a46aa96e9d8 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -532,7 +532,6 @@ static const VMStateDescription vmstate_tm = {
>      .name = "cpu/tm",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .needed = tm_needed,
>      .fields      = (VMStateField []) {
>          VMSTATE_UINTTL_ARRAY(env.tm_gpr, PowerPCCPU, 32),
> diff --git a/target/sparc/machine.c b/target/sparc/machine.c
> index 917375c3a17..44b9e7d75d6 100644
> --- a/target/sparc/machine.c
> +++ b/target/sparc/machine.c
> @@ -10,7 +10,6 @@ static const VMStateDescription vmstate_cpu_timer = {
>      .name = "cpu_timer",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(frequency, CPUTimer),
>          VMSTATE_UINT32(disabled, CPUTimer),
> @@ -30,7 +29,6 @@ static const VMStateDescription vmstate_trap_state = {
>      .name = "trap_state",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT64(tpc, trap_state),
>          VMSTATE_UINT64(tnpc, trap_state),
> @@ -44,7 +42,6 @@ static const VMStateDescription vmstate_tlb_entry = {
>      .name = "tlb_entry",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT64(tag, SparcTLBEntry),
>          VMSTATE_UINT64(tte, SparcTLBEntry),
> @@ -113,7 +110,6 @@ const VMStateDescription vmstate_sparc_cpu = {
>      .name = "cpu",
>      .version_id = SPARC_VMSTATE_VER,
>      .minimum_version_id = SPARC_VMSTATE_VER,
> -    .minimum_version_id_old = SPARC_VMSTATE_VER,
>      .pre_save = cpu_pre_save,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gregs, SPARCCPU, 8),
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


