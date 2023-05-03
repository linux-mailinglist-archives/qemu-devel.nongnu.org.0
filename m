Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18936F558E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:05:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9MY-0004c2-Pd; Wed, 03 May 2023 06:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pu9MW-0004a9-4q
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pu9MT-00076O-UI
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683108324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jx+qkOLF9KklW5g/oYuqLEae8BEO8TXr60yK+eN4+ic=;
 b=MLjb1Ccj1wg8WjAGkyNswjr/v6vjWe5U3e6tuC9J5PUkgQFCLx3CWPrxlo1tg5xgoS5kB6
 bXDkwRsC2Hh1F4iEhYnZegFdTjUIOIHmjxzETniGxucas0aZf7vIQr5gd+sYMDTURlpKZS
 1te/kyN5/eoOx6nt+HBnnYO0SdZqoM0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-2_T-pPZWMZ-y__O578Dc1A-1; Wed, 03 May 2023 06:05:14 -0400
X-MC-Unique: 2_T-pPZWMZ-y__O578Dc1A-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f3157128b4so11280975e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683108313; x=1685700313;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jx+qkOLF9KklW5g/oYuqLEae8BEO8TXr60yK+eN4+ic=;
 b=QJq7foekSU0rd6ogspWtMmTd9TJtFgfcroiUl1j+/dS6zuMzpivJYS+XDL+KYZe54m
 IInAXhvoUUh3mJf2eprlDD2IaToXh/JGE2sqm6H66WZKR1+xEnPmwOcZlWvB2K/4ZEK+
 qxv5zZsKPnbnYNvLrW/QiGxQlpWjYPZ/ZJY+1hB36nsv/uhpFOAHHQa8UIrOgFVkUK+u
 iSQcx9pJ2uWh5iF8HrzP7Nz53jM/nyxehenq/mIu9AzXMv0pVKe3dYg/LvnenorYcEXY
 I1c0Ngg+6QiucitTH19riivvpsN/wI9Rp7vBhBzTFEFmxKchwmW4iUR+9fqrm8/+Sugy
 7faA==
X-Gm-Message-State: AC+VfDwJ3hF6r+RD776GnWH+532hYDYbHHFwhaQcB6EWhXEuBojC/7Ok
 WRtdvPgG27WsN0cF4Gp5i1Rr61OUOH4aaS9YCqh5upav7prKaBqaFdUCgi1S6g8AsCetyujtke8
 asM22oFO9pf+nwoQ=
X-Received: by 2002:a05:600c:1c82:b0:3f3:fe24:609c with SMTP id
 k2-20020a05600c1c8200b003f3fe24609cmr694390wms.11.1683108312783; 
 Wed, 03 May 2023 03:05:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4c+6NPq7pXdUJriLEZD/qAYhfygdSb7vnrFKVytUR9qutq762+uWzzSI/c35XrJhXizM63mA==
X-Received: by 2002:a05:600c:1c82:b0:3f3:fe24:609c with SMTP id
 k2-20020a05600c1c8200b003f3fe24609cmr694366wms.11.1683108312350; 
 Wed, 03 May 2023 03:05:12 -0700 (PDT)
Received: from redhat.com ([31.187.78.112]) by smtp.gmail.com with ESMTPSA id
 f1-20020a1cc901000000b003f25b40fc24sm1427549wmb.6.2023.05.03.03.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 03:05:11 -0700 (PDT)
Date: Wed, 3 May 2023 06:05:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, den-plotnikov@yandex-team.ru,
 lersek@redhat.com, kraxel@redhat.com
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
Message-ID: <20230503060231-mutt-send-email-mst@kernel.org>
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
 <c9ee303b-0de4-7c44-c5f7-b723df9825af@redhat.com>
 <fe20f078-53fe-1e60-b30f-c3611aa7e7dd@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe20f078-53fe-1e60-b30f-c3611aa7e7dd@yandex-team.ru>
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

On Wed, May 03, 2023 at 12:50:09PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 03.05.23 12:20, David Hildenbrand wrote:
> > On 25.04.23 18:14, Vladimir Sementsov-Ogievskiy wrote:
> > > On incoming migration we have the following sequence to load option
> > > ROM:
> > > 
> > > 1. On device realize we do normal load ROM from the file
> > > 
> > > 2. Than, on incoming migration we rewrite ROM from the incoming RAM
> > >     block. If sizes mismatch we fail.
> > > 
> > > This is not ideal when we migrate to updated distribution: we have to
> > > keep old ROM files in new distribution and be careful around romfile
> > > property to load correct ROM file. Which is loaded actually just to
> > > allocate the ROM with correct length.
> > > 
> > > Note, that romsize property doesn't really help: if we try to specify
> > > it when default romfile is larger, it fails with something like:
> > > 
> > > romfile "efi-virtio.rom" (160768 bytes) is too large for ROM size 65536
> > > 
> > > Let's just ignore ROM file when romsize is specified and we are in
> > > incoming migration state. In other words, we need only to preallocate
> > > ROM of specified size, local ROM file is unrelated.
> > > 
> > > This way:
> > > 
> > > If romsize was specified on source, we just use same commandline as on
> > > source, and migration will work independently of local ROM files on
> > > target.
> > > 
> > > If romsize was not specified on source (and we have mismatching local
> > > ROM file on target host), we have to specify romsize on target to match
> > > source romsize. romfile parameter may be kept same as on source or may
> > > be dropped, the file is not loaded anyway.
> > > 
> > > As a bonus we avoid extra reading from ROM file on target.
> > > 
> > > Note: when we don't have romsize parameter on source command line and
> > > need it for target, it may be calculated as aligned up to power of two
> > > size of ROM file on source (if we know, which file is it) or,
> > > alternatively it may be retrieved from source QEMU by QMP qom-get
> > > command, like
> > > 
> > >    { "execute": "qom-get",
> > >      "arguments": {
> > >        "path": "/machine/peripheral/CARD_ID/virtio-net-pci.rom[0]",
> > >        "property": "size" } }
> > > 
> > > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > > ---
> > >   hw/pci/pci.c | 77 ++++++++++++++++++++++++++++++----------------------
> > >   1 file changed, 45 insertions(+), 32 deletions(-)
> > > 
> > > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > > index a442f8fce1..e2cab622e4 100644
> > > --- a/hw/pci/pci.c
> > > +++ b/hw/pci/pci.c
> > > @@ -36,6 +36,7 @@
> > >   #include "migration/vmstate.h"
> > >   #include "net/net.h"
> > >   #include "sysemu/numa.h"
> > > +#include "sysemu/runstate.h"
> > >   #include "sysemu/sysemu.h"
> > >   #include "hw/loader.h"
> > >   #include "qemu/error-report.h"
> > > @@ -2293,10 +2294,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
> > >   {
> > >       int64_t size;
> > >       g_autofree char *path = NULL;
> > > -    void *ptr;
> > >       char name[32];
> > >       const VMStateDescription *vmsd;
> > > +    /*
> > > +     * In case of incoming migration ROM will come with migration stream, no
> > > +     * reason to load the file.  Neither we want to fail if local ROM file
> > > +     * mismatches with specified romsize.
> > > +     */
> > > +    bool load_file = !runstate_check(RUN_STATE_INMIGRATE);
> > > +
> > >       if (!pdev->romfile) {
> > >           return;
> > >       }
> > > @@ -2329,32 +2336,35 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
> > >           return;
> > >       }
> > > -    path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
> > > -    if (path == NULL) {
> > > -        path = g_strdup(pdev->romfile);
> > > -    }
> > > +    if (load_file || pdev->romsize == -1) {
> > > +        path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
> > > +        if (path == NULL) {
> > > +            path = g_strdup(pdev->romfile);
> > > +        }
> > > -    size = get_image_size(path);
> > > -    if (size < 0) {
> > > -        error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
> > > -        return;
> > > -    } else if (size == 0) {
> > > -        error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
> > > -        return;
> > > -    } else if (size > 2 * GiB) {
> > > -        error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
> > > -                   pdev->romfile);
> > > -        return;
> > > -    }
> > > -    if (pdev->romsize != -1) {
> > > -        if (size > pdev->romsize) {
> > > -            error_setg(errp, "romfile \"%s\" (%u bytes) "
> > > -                       "is too large for ROM size %u",
> > > -                       pdev->romfile, (uint32_t)size, pdev->romsize);
> > > +        size = get_image_size(path);
> > > +        if (size < 0) {
> > > +            error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
> > > +            return;
> > > +        } else if (size == 0) {
> > > +            error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
> > > +            return;
> > > +        } else if (size > 2 * GiB) {
> > > +            error_setg(errp,
> > > +                       "romfile \"%s\" too large (size cannot exceed 2 GiB)",
> > > +                       pdev->romfile);
> > >               return;
> > >           }
> > > -    } else {
> > > -        pdev->romsize = pow2ceil(size);
> > > +        if (pdev->romsize != -1) {
> > > +            if (size > pdev->romsize) {
> > > +                error_setg(errp, "romfile \"%s\" (%u bytes) "
> > > +                           "is too large for ROM size %u",
> > > +                           pdev->romfile, (uint32_t)size, pdev->romsize);
> > > +                return;
> > > +            }
> > > +        } else {
> > > +            pdev->romsize = pow2ceil(size);
> > > +        }
> > >       }
> > >       vmsd = qdev_get_vmsd(DEVICE(pdev));
> > > @@ -2365,15 +2375,18 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
> > >       memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize,
> > >                              &error_fatal);
> > > -    ptr = memory_region_get_ram_ptr(&pdev->rom);
> > > -    if (load_image_size(path, ptr, size) < 0) {
> > > -        error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> > > -        return;
> > > -    }
> > > +    if (load_file) {
> > > +        void *ptr = memory_region_get_ram_ptr(&pdev->rom);
> > > -    if (is_default_rom) {
> > > -        /* Only the default rom images will be patched (if needed). */
> > > -        pci_patch_ids(pdev, ptr, size);
> > > +        if (load_image_size(path, ptr, size) < 0) {
> > > +            error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> > > +            return;
> > > +        }
> > > +
> > > +        if (is_default_rom) {
> > > +            /* Only the default rom images will be patched (if needed). */
> > > +            pci_patch_ids(pdev, ptr, size);
> > > +        }
> > >       }
> > >       pci_register_bar(pdev, PCI_ROM_SLOT, 0, &pdev->rom);
> > 
> > 
> > So, we'll now never load the file on the migration destination. But if "pdev->romsize == -1", we'll use the size of the file to size the region -- but not load it.
> > 
> > 
> > While that should work (because the ROM content will be migrated), at least I would find this easier to digest if we would have
> > 
> > bool use_file = !runstate_check(RUN_STATE_INMIGRATE) ||
> >          pdev->romsize == -1;
> > 
> > if (use_file) {
> >      path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
> >      ...
> > }
> > ...
> > memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize ...
> > ...
> > if (use_file) {
> >      ptr = memory_region_get_ram_ptr(&pdev->rom);
> >      if (load_image_size(path, ptr, size) < 0) {
> >          ...
> >      }
> > }
> > 
> > 
> > If something about the file is weird (such that reading the size would work but loading would fail), it would fail consistently. Sure, we would load once more, but who really cares about that.
> > 
> > I wonder, though, if we then also want to handle the "pdev->romfile" checks differently, when we're not going to use the file at all ... would maybe make it more consistent. If we're not using the file, then ignore if no file is given/available ... because we don't need it. The romsize is sufficient in that case on the migration destination.
> > 
> 
> Maybe, we should just deprecate unspecified romsize? And make it necessary in future?

That would be quite annoying. The whole problem arises because
downstream decided to override QEMU provided ROM
on the command line. Users that don't do this,
are ok and I do not want to make things harder for them.

-- 
MST


