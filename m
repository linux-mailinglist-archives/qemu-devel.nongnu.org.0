Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FCE6EDCF4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:44:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDKu-0004Hi-Q2; Tue, 25 Apr 2023 03:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDKs-0004HZ-OM
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDKq-0006Li-QI
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XRhFD3tPXsaZo5DTzhLeATNC+ykLjfp9xEMaDpuTwbU=;
 b=F1ygJ0SwugNV11PtRI+bV2xM2H7HUrtd9556FU0t188jKUlnV9tgzAgTSsICfg9HnX6nU/
 KHRi9EHEzIQ9NTVsuq8ymdhealHtoZEpn+4BFfn69sYkYYllNtSv1ezNaQCkpgYKQJ6exQ
 2LsOH99JhpGYZyei4k1aKB70Qe17OpA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-ORrccqhcPqiDXGhsYveCxg-1; Tue, 25 Apr 2023 03:43:34 -0400
X-MC-Unique: ORrccqhcPqiDXGhsYveCxg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f16f50aeb5so20237095e9.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408613; x=1685000613;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRhFD3tPXsaZo5DTzhLeATNC+ykLjfp9xEMaDpuTwbU=;
 b=g/j67Pm8Prg4F9ht1y9FurZ3K/ARuozIkZ8/FbdnzXdfK18ukDZl9yeiwxA1JtFY3j
 eSnuRrfXobNxzjNJ7tMmY3QBU6l8tAAiy4hpn8n6XDRpRhkAhEJS679BB/6/h+AmL9gy
 hk5N1Wt78lhpnzyiwag0M2vNZR2u7iNdrAHkPLEKsHM5kSjdL1zzjBOrmQnnUASEqAwr
 TDogIzvgkevVkS9Ba3EDHnbJH2DBC3VikRasxFXwDU917FirY3+Qyvfamv6MccKIWlAZ
 uPej4MW3O2LlC29PyHKYOXDxq8GPYy6k38x9napE4Mne2A46ia5c4rWqL2mtBfZms4bY
 OG/A==
X-Gm-Message-State: AAQBX9ca6kJuHG7J2tmBc3QJ7A+sn3bmOuM+r2wPLa1dbZuF3TT/m20m
 mKKMaFcoSkqDrPD8JJCzaeMp8lSYvM+aCr5qQdf0pYtjiROQFMV+hZ7YeJFO8028p93xt0PTVKF
 oliebU0cNJM9opBdixkXY6Vk=
X-Received: by 2002:a05:600c:2295:b0:3f1:92aa:4eb8 with SMTP id
 21-20020a05600c229500b003f192aa4eb8mr8571744wmf.16.1682408612817; 
 Tue, 25 Apr 2023 00:43:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350YkC4saB8dYyxZPcgtnPiFAqX+zPY8oZP8tYt5Pmx5QWn0vR+Y2cfFkja63G5uVLku5UyzGAA==
X-Received: by 2002:a05:600c:2295:b0:3f1:92aa:4eb8 with SMTP id
 21-20020a05600c229500b003f192aa4eb8mr8571719wmf.16.1682408612403; 
 Tue, 25 Apr 2023 00:43:32 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 k25-20020a05600c081900b003f17122587bsm17503002wmp.36.2023.04.25.00.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:43:31 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:43:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com,
 peterx@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 den-plotnikov@yandex-team.ru, Gerd Hoffmann <kraxel@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH] pci: make ROM memory resizable
Message-ID: <20230425033455-mutt-send-email-mst@kernel.org>
References: <20230424203647.94614-1-vsementsov@yandex-team.ru>
 <20230425031348-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425031348-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

On Tue, Apr 25, 2023 at 03:26:54AM -0400, Michael S. Tsirkin wrote:
> On Mon, Apr 24, 2023 at 11:36:47PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > On migration, on target we load local ROM file. But actual ROM content
> > migrates through migration channel. Original ROM content from local
> > file doesn't matter. But when size mismatch - we have an error like
> > 
> >  Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
> 
> 
> Oh, this is this old bug then:
> https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1713490
> 
> People seem to be "fixing" this by downgrading ROMs.
> 
> Actually, I think the fix is different: we need to build
> versions of ROMs for old machine types that can fit
> in the old BAR size.
> 
> Gerd, Laszlo what's your take on all this?

Actually, ignore this - we do keep old ROMs around specifically to avoid
ROM size changes and have been for ever. E.g.:

commit c45e5b5b30ac1f5505725a7b36e68cedfce4f01f
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Tue Feb 26 17:46:11 2013 +0100

    Switch to efi-enabled nic roms by default
    
    All PCI nics are switched to EFI-enabled roms by default.  They are
    composed from three images (legacy, efi ia32 & efi x86), so classic
    pxe booting will continue to work.
    
    Exception: eepro100 is not switched, it uses a single rom for all
    emulated eepro100 variants, then goes patch the rom header on the
    fly with the correct PCI IDs.  I doubt that will work as-is with
    the efi roms.
    
    Keep old roms for 1.4+older machine types via compat properties,
    needed because the efi-enabled roms are larger so the pci rom bar
    size would change.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>


So it's downstream messing up with things, overriding the
rom file then changing its size.


On fedora I find both pxe virtio and efi virtio so it gets it right.


> 
> 
> > Let's just allow resizing of ROM memory. This way migration is not
> > relate on local ROM file on target node which is loaded by default but
> > is not actually needed.
> > 
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > ---
> >  hw/pci/pci.c          |  7 +++++--
> >  include/exec/memory.h | 26 ++++++++++++++++++++++++++
> >  softmmu/memory.c      | 39 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 70 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > index def5000e7b..72ee8f6aea 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -59,6 +59,8 @@
> >  # define PCI_DPRINTF(format, ...)       do { } while (0)
> >  #endif
> >  
> > +#define MAX_ROM_SIZE (2 * GiB)
> > +
> >  bool pci_available = true;
> >  
> >  static char *pcibus_get_dev_path(DeviceState *dev);
> > @@ -2341,7 +2343,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
> >          error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
> >          g_free(path);
> >          return;
> > -    } else if (size > 2 * GiB) {
> > +    } else if (size > MAX_ROM_SIZE) {
> >          error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
> >                     pdev->romfile);
> >          g_free(path);
> > @@ -2366,7 +2368,8 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
> >          snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
> >      }
> >      pdev->has_rom = true;
> > -    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
> > +    memory_region_init_rom_resizable(&pdev->rom, OBJECT(pdev), name,
> > +                                     pdev->romsize, MAX_ROM_SIZE, &error_fatal);
> >      ptr = memory_region_get_ram_ptr(&pdev->rom);
> >      if (load_image_size(path, ptr, size) < 0) {
> >          error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 15ade918ba..ed1e5d9126 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -1453,6 +1453,19 @@ void memory_region_init_rom_nomigrate(MemoryRegion *mr,
> >                                        uint64_t size,
> >                                        Error **errp);
> >  
> > +/*
> > + * memory_region_init_rom_nomigrate_resizable: same as
> > + * memory_region_init_rom_nomigrate(), but initialize resizable memory region.
> > + *
> > + * @max_size maximum allowed size.
> > + */
> > +void memory_region_init_rom_nomigrate_resizable(MemoryRegion *mr,
> > +                                                struct Object *owner,
> > +                                                const char *name,
> > +                                                uint64_t size,
> > +                                                uint64_t max_size,
> > +                                                Error **errp);
> > +
> >  /**
> >   * memory_region_init_rom_device_nomigrate:  Initialize a ROM memory region.
> >   *                                 Writes are handled via callbacks.
> > @@ -1562,6 +1575,19 @@ void memory_region_init_rom(MemoryRegion *mr,
> >                              uint64_t size,
> >                              Error **errp);
> >  
> > +/*
> > + * memory_region_init_rom_resizable: same as memory_region_init_rom(),
> > + * but initialize resizable memory region.
> > + *
> > + * @max_size maximum allowed size.
> > + */
> > +void memory_region_init_rom_resizable(MemoryRegion *mr,
> > +                                      struct Object *owner,
> > +                                      const char *name,
> > +                                      uint64_t size,
> > +                                      uint64_t max_size,
> > +                                      Error **errp);
> > +
> >  /**
> >   * memory_region_init_rom_device:  Initialize a ROM memory region.
> >   *                                 Writes are handled via callbacks.
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index b1a6cae6f5..744d03bc02 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -1701,6 +1701,18 @@ void memory_region_init_rom_nomigrate(MemoryRegion *mr,
> >      mr->readonly = true;
> >  }
> >  
> > +void memory_region_init_rom_nomigrate_resizable(MemoryRegion *mr,
> > +                                                struct Object *owner,
> > +                                                const char *name,
> > +                                                uint64_t size,
> > +                                                uint64_t max_size,
> > +                                                Error **errp)
> > +{
> > +    memory_region_init_resizeable_ram(mr, owner, name, size, max_size, NULL,
> > +                                      errp);
> > +    mr->readonly = true;
> > +}
> > +
> >  void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
> >                                               Object *owner,
> >                                               const MemoryRegionOps *ops,
> > @@ -3580,6 +3592,33 @@ void memory_region_init_rom(MemoryRegion *mr,
> >      vmstate_register_ram(mr, owner_dev);
> >  }
> >  
> > +void memory_region_init_rom_resizable(MemoryRegion *mr,
> > +                                      struct Object *owner,
> > +                                      const char *name,
> > +                                      uint64_t size,
> > +                                      uint64_t max_size,
> > +                                      Error **errp)
> > +{
> > +    DeviceState *owner_dev;
> > +    Error *err = NULL;
> > +
> > +    memory_region_init_rom_nomigrate_resizable(mr, owner, name, size, max_size,
> > +                                               &err);
> > +    if (err) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> > +    /*
> > +     * This will assert if owner is neither NULL nor a DeviceState.
> > +     * We only want the owner here for the purposes of defining a
> > +     * unique name for migration. TODO: Ideally we should implement
> > +     * a naming scheme for Objects which are not DeviceStates, in
> > +     * which case we can relax this restriction.
> > +     */
> > +    owner_dev = DEVICE(owner);
> > +    vmstate_register_ram(mr, owner_dev);
> > +}
> > +
> >  void memory_region_init_rom_device(MemoryRegion *mr,
> >                                     Object *owner,
> >                                     const MemoryRegionOps *ops,
> > -- 
> > 2.34.1


