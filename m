Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5AE30058A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:36:14 +0100 (CET)
Received: from localhost ([::1]:58758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xXp-0008V4-TB
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l2xSk-0005JP-7J
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:30:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l2xSd-0006rM-KD
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611325848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UAN2yx5xJw7nfuEcLqv0naNpUm0WbPtAes04SjmOmaU=;
 b=i61LciwiR50iHqn97IA3YzG+7dO7hhzB5ZLWHOI80qHvo7Qs3nKk36h8OOd3KvnakWuF1Q
 5l5g9w4vSDYCVRclZj79VazBItbV4D2dkNGQZY3xh3PjdCoGva9Sff+Ho4CLTxWp62V5rX
 AXPKzmauQEFwnuvwT6l/uZs3mHZY3Ac=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-vSzTL0KdN6OKLpZpGi-G2g-1; Fri, 22 Jan 2021 09:30:46 -0500
X-MC-Unique: vSzTL0KdN6OKLpZpGi-G2g-1
Received: by mail-ed1-f70.google.com with SMTP id j12so2986259edq.10
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 06:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UAN2yx5xJw7nfuEcLqv0naNpUm0WbPtAes04SjmOmaU=;
 b=KESwfXeUlLQRCWzyYhFhAUlfEhXb11ygcu8rtl9lFSMoYap+0vhLEpPdwHYPQPBGX2
 UkT8acEbMtWA1IyCbftPLFXGyHhfw+dvb9ak9ESDb1k9HmC1JsKsTVWHEORLMFAztXmf
 4hOSOnah1ljhWZWog+QWI59aZ9JYckCmKGgE52Cm3H9ssTmSSfO6lHTkejG9X38k7lWe
 LNIGFP6uzx0ZekevsPieEE+h1x8UuC0lYNffdh024FrTJo+DphbWEKT7CI2g46h6NSpE
 xI4o2vJ7EJxGvmoIKm8/1Thitl+pGwJ0SxObMVbCD5SPNw4WS3GT8f2FyC4xOARdKIDS
 BS0Q==
X-Gm-Message-State: AOAM531Cd5sbi4tpADAydr59G6+QtKz/mJY/AX74+SGH9PzRgxuvL0HZ
 h0ciD5rY6oJ3hFWEBcH2+cyNlCT+v1M5CctgZDGWhnFcJybSyJzjDhGSBSTgtF2u0PZDAdixdi5
 1wKWjxGGnwmWjnV0=
X-Received: by 2002:aa7:cd4c:: with SMTP id v12mr3434506edw.17.1611325845053; 
 Fri, 22 Jan 2021 06:30:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEDPQxSScNQB+Lfror7gGlx/bvs3SmoreUBy9MS7ZHlpeL03aKlpqXaSfVBIvsI6ApuIjtIw==
X-Received: by 2002:aa7:cd4c:: with SMTP id v12mr3434493edw.17.1611325844883; 
 Fri, 22 Jan 2021 06:30:44 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id x9sm4497571ejd.99.2021.01.22.06.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 06:30:43 -0800 (PST)
Date: Fri, 22 Jan 2021 09:30:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] pci: add romsize property
Message-ID: <20210122092959-mutt-send-email-mst@kernel.org>
References: <20201218182736.1634344-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201218182736.1634344-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 18, 2020 at 01:27:36PM -0500, Paolo Bonzini wrote:
> This property can be useful for distros to set up known-good ROM sizes for
> migration purposes.  The VM will fail to start if the ROM is too large,
> and migration compatibility will not be broken if the ROM is too small.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/pci/pci.c             | 19 +++++++++++++++++--
>  hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
>  include/hw/pci/pci.h     |  1 +
>  3 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index d4349ea577..fd25253c2a 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -67,6 +67,7 @@ static void pcibus_reset(BusState *qbus);
>  static Property pci_props[] = {
>      DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
>      DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
> +    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
>      DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
>      DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
>                      QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),


Would a size32 property be better? E.g. 4k is nicer than 4096 ...

> @@ -2106,6 +2107,11 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
>      bool is_default_rom;
>      uint16_t class_id;
>  
> +    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
> +        error_setg(errp, "ROM size %d is not a power of two", pci_dev->romsize);
> +        return;
> +    }
> +
>      /* initialize cap_present for pci_is_express() and pci_config_size(),
>       * Note that hybrid PCIs are not set automatically and need to manage
>       * QEMU_PCI_CAP_EXPRESS manually */
> @@ -2366,7 +2372,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>          g_free(path);
>          return;
>      }
> -    size = pow2ceil(size);
> +    if (pdev->romsize != -1) {
> +        if (size > pdev->romsize) {
> +            error_setg(errp, "romfile \"%s\" (%d bytes) is too large for ROM size %d",
> +                       pdev->romfile, size, pdev->romsize);
> +            g_free(path);
> +            return;
> +        }
> +    } else {
> +        pdev->romsize = pow2ceil(size);
> +    }
>  
>      vmsd = qdev_get_vmsd(DEVICE(pdev));
>  
> @@ -2376,7 +2391,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>          snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
>      }
>      pdev->has_rom = true;
> -    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, size, &error_fatal);
> +    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
>      ptr = memory_region_get_ram_ptr(&pdev->rom);
>      if (load_image_size(path, ptr, size) < 0) {
>          error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
> index a50a80837e..153812f8cd 100644
> --- a/hw/xen/xen_pt_load_rom.c
> +++ b/hw/xen/xen_pt_load_rom.c
> @@ -53,10 +53,20 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
>      }
>      fseek(fp, 0, SEEK_SET);
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
>      snprintf(name, sizeof(name), "%s.rom", object_get_typename(owner));
> -    memory_region_init_ram(&dev->rom, owner, name, st.st_size, &error_abort);
> +    memory_region_init_ram(&dev->rom, owner, name, dev->romsize, &error_abort);
>      ptr = memory_region_get_ram_ptr(&dev->rom);
> -    memset(ptr, 0xff, st.st_size);
> +    memset(ptr, 0xff, dev->romsize);
>  
>      if (!fread(ptr, 1, st.st_size, fp)) {
>          error_report("pci-assign: Cannot read from host %s", rom_file);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 259f9c992d..b028245b62 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -343,6 +343,7 @@ struct PCIDevice {
>  
>      /* Location of option rom */
>      char *romfile;
> +    uint32_t romsize;
>      bool has_rom;
>      MemoryRegion rom;
>      uint32_t rom_bar;
> -- 
> 2.26.2


