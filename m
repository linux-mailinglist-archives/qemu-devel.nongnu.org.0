Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0756ED64B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:46:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr34L-0004p6-EN; Mon, 24 Apr 2023 16:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pr34E-0004lw-CY
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:45:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pr34C-0002Ql-IF
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682369144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2QDq9dafzIGZyRfo2H4MrCmulyGgKknwmBbbf5gu6nQ=;
 b=THez+SMf3DXLb3tDDYmFcCC5BgGrMkawwkJ8iVvS+L2epgXs7dx0JTF2oU5frNBn8vshpV
 3iilY6amlvDlSWzsMvQGS4jPRzkLC7vygYeFsSlqUatrKx4IITaBZIy7R/Gv1+Wk7qMiVM
 bZAaroqnIwxsGc9vF5mZzkCmIcqczZ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-X06nMnmNOeWyG66HFatJJw-1; Mon, 24 Apr 2023 16:45:41 -0400
X-MC-Unique: X06nMnmNOeWyG66HFatJJw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f080f53c49so26944375e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 13:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682369140; x=1684961140;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2QDq9dafzIGZyRfo2H4MrCmulyGgKknwmBbbf5gu6nQ=;
 b=MY3p/3NAEQBd1ZUR20C5PCDTssd6e010cp4QwnwQnwHpyCNKgnhRHQ4N5KIqh0EOEY
 oZvDYeVaiTWqch6iiEhLVgdZmgoRFm1igPFeByKJrPBG2nFe8+mrIMAknSzxdiery4sZ
 Z00sWMi6BI1dcYi+XZEJQqBvu1hEtj78HP4ADARLQqLmfQqZo1mfd0u1P50liJcuoYSm
 IU/vdW94wF9ml5mn9owaOdXLaiERj0HVESmLy+v6jFcZ/bntwiDYnETOToNoudJQUT06
 VSMx6L6Hk5Cy7zb5cwnzyliqzShfTfTUh03qsUhSSYhdrCMnP9X3Ib0qpxZQQcYc839z
 mlKw==
X-Gm-Message-State: AAQBX9dt4JnvAbru7k5roIroCqYHBC44UL09DYjIPTEZqepDE1/7BW4h
 hhtQpqbThkwIFOahllizh4XRwPbH9lIeB9NIERBabyeKLTto9l+u6hefvNPRBIxw2x2DAtRtZ5n
 NSpRCfIjnZ6ccWwgB9+OUyms=
X-Received: by 2002:a7b:ce19:0:b0:3f1:819d:d046 with SMTP id
 m25-20020a7bce19000000b003f1819dd046mr9035979wmc.5.1682369140057; 
 Mon, 24 Apr 2023 13:45:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zg2HLGRFQPyjrjnNlGuPjzk4ddKr0X0vdCcaKyIwF0wzr82jpr6FeFT3SImxjl/X00c9x7FQ==
X-Received: by 2002:a7b:ce19:0:b0:3f1:819d:d046 with SMTP id
 m25-20020a7bce19000000b003f1819dd046mr9035967wmc.5.1682369139757; 
 Mon, 24 Apr 2023 13:45:39 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c000900b003f0aa490336sm16345759wmc.26.2023.04.24.13.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:45:39 -0700 (PDT)
Date: Mon, 24 Apr 2023 16:45:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com,
 peterx@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 den-plotnikov@yandex-team.ru
Subject: Re: [PATCH] pci: make ROM memory resizable
Message-ID: <20230424164222-mutt-send-email-mst@kernel.org>
References: <20230424203647.94614-1-vsementsov@yandex-team.ru>
 <20230424164105-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424164105-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Apr 24, 2023 at 04:42:00PM -0400, Michael S. Tsirkin wrote:
> On Mon, Apr 24, 2023 at 11:36:47PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > On migration, on target we load local ROM file. But actual ROM content
> > migrates through migration channel. Original ROM content from local
> > file doesn't matter. But when size mismatch - we have an error like
> > 
> >  Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
> > 
> > Let's just allow resizing of ROM memory. This way migration is not
> > relate on local ROM file on target node which is loaded by default but
> > is not actually needed.
> > 
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Also isn't ROM size reflected in config space etc?
I don't remember code that would update that on migration.


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
> 
> You know this steals 2GB from address space, yes? This is quite a lot
> ...
> 
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


