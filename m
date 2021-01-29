Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95814308DCA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:53:36 +0100 (CET)
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Zpn-0004WU-Mm
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:53:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l5Zo7-0003uk-Ia
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:51:51 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:37272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l5Zo3-0008Te-KP
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:51:50 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4119A7462E1;
 Fri, 29 Jan 2021 20:51:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 07C0C7462D3; Fri, 29 Jan 2021 20:51:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 05D5B7456B7;
 Fri, 29 Jan 2021 20:51:42 +0100 (CET)
Date: Fri, 29 Jan 2021 20:51:41 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/2] pci: add romsize property
In-Reply-To: <20210129192838.582771-3-pbonzini@redhat.com>
Message-ID: <ee924cca-8b90-df77-b544-c6405f6b761@eik.bme.hu>
References: <20210129192838.582771-1-pbonzini@redhat.com>
 <20210129192838.582771-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: mst@redhat.com, lersek@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021, Paolo Bonzini wrote:
> This property can be useful for distros to set up known-good ROM sizes for
> migration purposes.  The VM will fail to start if the ROM is too large,
> and migration compatibility will not be broken if the ROM is too small.
>
> Note that even though romsize is a uint32_t, it has to be between 1
> (because empty ROM files are not accepted, and romsize must be greater
> than the file) and 2^31 (because values above are not powers of two and
> are rejected).

I've found I have to use this command to disable vgabios-ati.bin:

qemu-system-ppc -M sam460ex -device ati-vga,romfile=""

otherwise the BIOS emulator in the guest firmware crashes and this works 
so I think romfile can be empty and it's a useful feature to have in this 
case for example. I don't know if this patch changes anything about that 
but the commit message saying that romfile cannot be empty may be wrong.

Regards,
BALATON Zoltan

> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> hw/pci/pci.c             | 19 +++++++++++++++++--
> hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
> include/hw/pci/pci.h     |  1 +
> 3 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index bbce10050b..5b3fe3c294 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -68,6 +68,7 @@ static void pcibus_reset(BusState *qbus);
> static Property pci_props[] = {
>     DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
>     DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
> +    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
>     DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
>     DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
>                     QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
> @@ -2107,6 +2108,11 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
>     bool is_default_rom;
>     uint16_t class_id;
>
> +    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
> +        error_setg(errp, "ROM size %d is not a power of two", pci_dev->romsize);
> +        return;
> +    }
> +
>     /* initialize cap_present for pci_is_express() and pci_config_size(),
>      * Note that hybrid PCIs are not set automatically and need to manage
>      * QEMU_PCI_CAP_EXPRESS manually */
> @@ -2372,7 +2378,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>         g_free(path);
>         return;
>     }
> -    size = pow2ceil(size);
> +    if (pdev->romsize != -1) {
> +        if (size > pdev->romsize) {
> +            error_setg(errp, "romfile \"%s\" (%u bytes) is too large for ROM size %u",
> +                       pdev->romfile, (uint32_t)size, pdev->romsize);
> +            g_free(path);
> +            return;
> +        }
> +    } else {
> +        pdev->romsize = pow2ceil(size);
> +    }
>
>     vmsd = qdev_get_vmsd(DEVICE(pdev));
>
> @@ -2382,7 +2397,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>         snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
>     }
>     pdev->has_rom = true;
> -    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, size, &error_fatal);
> +    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
>     ptr = memory_region_get_ram_ptr(&pdev->rom);
>     if (load_image_size(path, ptr, size) < 0) {
>         error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
> index a50a80837e..153812f8cd 100644
> --- a/hw/xen/xen_pt_load_rom.c
> +++ b/hw/xen/xen_pt_load_rom.c
> @@ -53,10 +53,20 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
>     }
>     fseek(fp, 0, SEEK_SET);
>
> +    if (dev->romsize != -1) {
> +        if (st.st_size > dev->romsize) {
> +            error_report("ROM BAR \"%s\" (%ld bytes) is too large for ROM size %d",
> +                         rom_file, (long) st.st_size, dev->romsize);
> +            goto close_rom;
> +        }
> +    } else {
> +        dev->romsize = st.st_size;
> +    }
> +
>     snprintf(name, sizeof(name), "%s.rom", object_get_typename(owner));
> -    memory_region_init_ram(&dev->rom, owner, name, st.st_size, &error_abort);
> +    memory_region_init_ram(&dev->rom, owner, name, dev->romsize, &error_abort);
>     ptr = memory_region_get_ram_ptr(&dev->rom);
> -    memset(ptr, 0xff, st.st_size);
> +    memset(ptr, 0xff, dev->romsize);
>
>     if (!fread(ptr, 1, st.st_size, fp)) {
>         error_report("pci-assign: Cannot read from host %s", rom_file);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 259f9c992d..b028245b62 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -343,6 +343,7 @@ struct PCIDevice {
>
>     /* Location of option rom */
>     char *romfile;
> +    uint32_t romsize;
>     bool has_rom;
>     MemoryRegion rom;
>     uint32_t rom_bar;
>

