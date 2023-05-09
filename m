Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA74C6FCA8E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:55:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPfz-0004sd-Gx; Tue, 09 May 2023 11:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwPfx-0004rm-Kk
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwPfv-0007oc-Os
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683647690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PIKv7ZUlwAUGXG4A8jC9IjEKIznb9fr5kQ9NN0YMqW4=;
 b=UAxtqSFUVUR6XWb00ZkIrx8jIWJ4vNioMNDltXU2PQr5DTHDpJgDuhzqhHqriDDpQMrRGI
 iBUD1is4BNv0yFIFIEbcaX+8RYdSgx9c+7ISV4kuZ1eiCJ5qG8B4+mLMsYSHh4QCRlQkEg
 /g9ydDLBBlcETq7ZLlGWj5E3RXxQ8uE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-nXLbQvnpOySOwWORbs_FtA-1; Tue, 09 May 2023 11:54:48 -0400
X-MC-Unique: nXLbQvnpOySOwWORbs_FtA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50bc6c6b9dbso7384687a12.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683647688; x=1686239688;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PIKv7ZUlwAUGXG4A8jC9IjEKIznb9fr5kQ9NN0YMqW4=;
 b=gXRgpNwCPGpGP9U9qBwV3s4TsMeIH/Z2YIcs8a1vtQpgKBigNaCHfnJ+j2fLc5ekks
 i/ibKLycYi9126l6mlesLH2bq0pqNnq2dCImNFIN1uTp4z+j8lqnfXjuiBhJk0vGAFLp
 lajup3kDQljABORY8C64YTgqsOZxj5Pqj2OuFNT58z+8kPUqWUj0YDJYMzUp0O2hNX9W
 bSQwbo8XUhD+83y1/4gHvMWF4CMVbshFnuxS5RYLeENynAaNguePexbcy9dEKKxKvQt1
 rWlLuVk19y31fpbah6veizeiFYff9fv+kK3BVdnK0KBijoEUuP92CN0erIskLEZJ5cSZ
 MMDQ==
X-Gm-Message-State: AC+VfDyApXLQjnTsNA+qVzfmiZ9QwOgwgcKoRXIbT4JHYwF55cRw3s09
 xHzNe9a5c6Vw32PKAMGHNEPjy402ixGFjXLRSdTqlUjpiJVI4M/ODUpzwB4il8TnCGYyxXqpHLz
 baiSarrO2euQTK4k=
X-Received: by 2002:a17:907:7e91:b0:94e:c40b:71e3 with SMTP id
 qb17-20020a1709077e9100b0094ec40b71e3mr13978751ejc.5.1683647687789; 
 Tue, 09 May 2023 08:54:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4fRCf5kL2w/LII/qT0uZLrqqvCMm4XpJMvIyVSKlVViXqWvVonyAYG7AL1EFwlDY9Th0Eoxw==
X-Received: by 2002:a17:907:7e91:b0:94e:c40b:71e3 with SMTP id
 qb17-20020a1709077e9100b0094ec40b71e3mr13978722ejc.5.1683647687456; 
 Tue, 09 May 2023 08:54:47 -0700 (PDT)
Received: from redhat.com ([82.180.150.238]) by smtp.gmail.com with ESMTPSA id
 hb38-20020a170907162600b009661cf921b4sm1432170ejc.202.2023.05.09.08.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 08:54:46 -0700 (PDT)
Date: Tue, 9 May 2023 11:54:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, den-plotnikov@yandex-team.ru,
 lersek@redhat.com, kraxel@redhat.com
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
Message-ID: <20230509115151-mutt-send-email-mst@kernel.org>
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
 <c9ee303b-0de4-7c44-c5f7-b723df9825af@redhat.com>
 <fe20f078-53fe-1e60-b30f-c3611aa7e7dd@yandex-team.ru>
 <20230503060231-mutt-send-email-mst@kernel.org>
 <ed74d57a-5f24-bf0a-09c2-b755c69c8c08@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed74d57a-5f24-bf0a-09c2-b755c69c8c08@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 03, 2023 at 02:39:15PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 03.05.23 13:05, Michael S. Tsirkin wrote:
> > On Wed, May 03, 2023 at 12:50:09PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > On 03.05.23 12:20, David Hildenbrand wrote:
> > > > On 25.04.23 18:14, Vladimir Sementsov-Ogievskiy wrote:
> > > > > On incoming migration we have the following sequence to load option
> > > > > ROM:
> > > > > 
> > > > > 1. On device realize we do normal load ROM from the file
> > > > > 
> > > > > 2. Than, on incoming migration we rewrite ROM from the incoming RAM
> > > > >      block. If sizes mismatch we fail.
> > > > > 
> > > > > This is not ideal when we migrate to updated distribution: we have to
> > > > > keep old ROM files in new distribution and be careful around romfile
> > > > > property to load correct ROM file. Which is loaded actually just to
> > > > > allocate the ROM with correct length.
> > > > > 
> > > > > Note, that romsize property doesn't really help: if we try to specify
> > > > > it when default romfile is larger, it fails with something like:
> > > > > 
> > > > > romfile "efi-virtio.rom" (160768 bytes) is too large for ROM size 65536
> > > > > 
> > > > > Let's just ignore ROM file when romsize is specified and we are in
> > > > > incoming migration state. In other words, we need only to preallocate
> > > > > ROM of specified size, local ROM file is unrelated.
> > > > > 
> > > > > This way:
> > > > > 
> > > > > If romsize was specified on source, we just use same commandline as on
> > > > > source, and migration will work independently of local ROM files on
> > > > > target.
> > > > > 
> > > > > If romsize was not specified on source (and we have mismatching local
> > > > > ROM file on target host), we have to specify romsize on target to match
> > > > > source romsize. romfile parameter may be kept same as on source or may
> > > > > be dropped, the file is not loaded anyway.
> > > > > 
> > > > > As a bonus we avoid extra reading from ROM file on target.
> > > > > 
> > > > > Note: when we don't have romsize parameter on source command line and
> > > > > need it for target, it may be calculated as aligned up to power of two
> > > > > size of ROM file on source (if we know, which file is it) or,
> > > > > alternatively it may be retrieved from source QEMU by QMP qom-get
> > > > > command, like
> > > > > 
> > > > >     { "execute": "qom-get",
> > > > >       "arguments": {
> > > > >         "path": "/machine/peripheral/CARD_ID/virtio-net-pci.rom[0]",
> > > > >         "property": "size" } }
> > > > > 
> > > > > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > > > > ---
> > > > >    hw/pci/pci.c | 77 ++++++++++++++++++++++++++++++----------------------
> > > > >    1 file changed, 45 insertions(+), 32 deletions(-)
> > > > > 
> > > > > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > > > > index a442f8fce1..e2cab622e4 100644
> > > > > --- a/hw/pci/pci.c
> > > > > +++ b/hw/pci/pci.c
> > > > > @@ -36,6 +36,7 @@
> > > > >    #include "migration/vmstate.h"
> > > > >    #include "net/net.h"
> > > > >    #include "sysemu/numa.h"
> > > > > +#include "sysemu/runstate.h"
> > > > >    #include "sysemu/sysemu.h"
> > > > >    #include "hw/loader.h"
> > > > >    #include "qemu/error-report.h"
> > > > > @@ -2293,10 +2294,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
> > > > >    {
> > > > >        int64_t size;
> > > > >        g_autofree char *path = NULL;
> > > > > -    void *ptr;
> > > > >        char name[32];
> > > > >        const VMStateDescription *vmsd;
> > > > > +    /*
> > > > > +     * In case of incoming migration ROM will come with migration stream, no
> > > > > +     * reason to load the file.  Neither we want to fail if local ROM file
> > > > > +     * mismatches with specified romsize.
> > > > > +     */
> > > > > +    bool load_file = !runstate_check(RUN_STATE_INMIGRATE);
> > > > > +
> > > > >        if (!pdev->romfile) {
> > > > >            return;
> > > > >        }
> > > > > @@ -2329,32 +2336,35 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
> > > > >            return;
> > > > >        }
> > > > > -    path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
> > > > > -    if (path == NULL) {
> > > > > -        path = g_strdup(pdev->romfile);
> > > > > -    }
> > > > > +    if (load_file || pdev->romsize == -1) {
> > > > > +        path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
> > > > > +        if (path == NULL) {
> > > > > +            path = g_strdup(pdev->romfile);
> > > > > +        }
> > > > > -    size = get_image_size(path);
> > > > > -    if (size < 0) {
> > > > > -        error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
> > > > > -        return;
> > > > > -    } else if (size == 0) {
> > > > > -        error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
> > > > > -        return;
> > > > > -    } else if (size > 2 * GiB) {
> > > > > -        error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
> > > > > -                   pdev->romfile);
> > > > > -        return;
> > > > > -    }
> > > > > -    if (pdev->romsize != -1) {
> > > > > -        if (size > pdev->romsize) {
> > > > > -            error_setg(errp, "romfile \"%s\" (%u bytes) "
> > > > > -                       "is too large for ROM size %u",
> > > > > -                       pdev->romfile, (uint32_t)size, pdev->romsize);
> > > > > +        size = get_image_size(path);
> > > > > +        if (size < 0) {
> > > > > +            error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
> > > > > +            return;
> > > > > +        } else if (size == 0) {
> > > > > +            error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
> > > > > +            return;
> > > > > +        } else if (size > 2 * GiB) {
> > > > > +            error_setg(errp,
> > > > > +                       "romfile \"%s\" too large (size cannot exceed 2 GiB)",
> > > > > +                       pdev->romfile);
> > > > >                return;
> > > > >            }
> > > > > -    } else {
> > > > > -        pdev->romsize = pow2ceil(size);
> > > > > +        if (pdev->romsize != -1) {
> > > > > +            if (size > pdev->romsize) {
> > > > > +                error_setg(errp, "romfile \"%s\" (%u bytes) "
> > > > > +                           "is too large for ROM size %u",
> > > > > +                           pdev->romfile, (uint32_t)size, pdev->romsize);
> > > > > +                return;
> > > > > +            }
> > > > > +        } else {
> > > > > +            pdev->romsize = pow2ceil(size);
> > > > > +        }
> > > > >        }
> > > > >        vmsd = qdev_get_vmsd(DEVICE(pdev));
> > > > > @@ -2365,15 +2375,18 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
> > > > >        memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize,
> > > > >                               &error_fatal);
> > > > > -    ptr = memory_region_get_ram_ptr(&pdev->rom);
> > > > > -    if (load_image_size(path, ptr, size) < 0) {
> > > > > -        error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> > > > > -        return;
> > > > > -    }
> > > > > +    if (load_file) {
> > > > > +        void *ptr = memory_region_get_ram_ptr(&pdev->rom);
> > > > > -    if (is_default_rom) {
> > > > > -        /* Only the default rom images will be patched (if needed). */
> > > > > -        pci_patch_ids(pdev, ptr, size);
> > > > > +        if (load_image_size(path, ptr, size) < 0) {
> > > > > +            error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> > > > > +            return;
> > > > > +        }
> > > > > +
> > > > > +        if (is_default_rom) {
> > > > > +            /* Only the default rom images will be patched (if needed). */
> > > > > +            pci_patch_ids(pdev, ptr, size);
> > > > > +        }
> > > > >        }
> > > > >        pci_register_bar(pdev, PCI_ROM_SLOT, 0, &pdev->rom);
> > > > 
> > > > 
> > > > So, we'll now never load the file on the migration destination. But if "pdev->romsize == -1", we'll use the size of the file to size the region -- but not load it.
> > > > 
> > > > 
> > > > While that should work (because the ROM content will be migrated), at least I would find this easier to digest if we would have
> > > > 
> > > > bool use_file = !runstate_check(RUN_STATE_INMIGRATE) ||
> > > >           pdev->romsize == -1;
> > > > 
> > > > if (use_file) {
> > > >       path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
> > > >       ...
> > > > }
> > > > ...
> > > > memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize ...
> > > > ...
> > > > if (use_file) {
> > > >       ptr = memory_region_get_ram_ptr(&pdev->rom);
> > > >       if (load_image_size(path, ptr, size) < 0) {
> > > >           ...
> > > >       }
> > > > }
> > > > 
> > > > 
> > > > If something about the file is weird (such that reading the size would work but loading would fail), it would fail consistently. Sure, we would load once more, but who really cares about that.
> > > > 
> > > > I wonder, though, if we then also want to handle the "pdev->romfile" checks differently, when we're not going to use the file at all ... would maybe make it more consistent. If we're not using the file, then ignore if no file is given/available ... because we don't need it. The romsize is sufficient in that case on the migration destination.
> > > > 
> > > 
> > > Maybe, we should just deprecate unspecified romsize? And make it necessary in future?
> > 
> > That would be quite annoying. The whole problem arises because
> > downstream decided to override QEMU provided ROM
> > on the command line. Users that don't do this,
> > are ok and I do not want to make things harder for them.
> > 
> 
> OK. Are you agree with Devid's advice to still load file, even on incoming migration, when romsize argument is absent?

I am not sure why it's ncessary and I don't much like extra file reads
just for the heck of it. If nothing else this attempt to check file
is readable is futile - it might not stay readable until the next
qemu run.

> -- 
> Best regards,
> Vladimir


