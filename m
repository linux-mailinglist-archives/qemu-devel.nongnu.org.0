Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884F46F4066
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:50:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmdp-0002NQ-Bk; Tue, 02 May 2023 05:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ptmdn-0002ND-B9
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ptmdl-0006Fd-Es
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683020984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oQ9SfutrwM7EWlrfn6Fu5b4nnXjrf7Cg3l39RnsHw/k=;
 b=DpkyWIftB8CRZcqJxB1W5KeVtU5RP8cf4M3WaHGwofve8YqIYCfXJ79DPWEkboaY3O1msp
 0XQArhrusMKk9N8Y9FEiogOKnj/I6NUq1dky7oyl2/eoR9ajFYU95jpWZfJ6y5XwilrvBC
 e1d+Nay07HjCJrIglJlDilDpZrj9HYQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-PbP4hAH5Md6ZzTFzdYqMiA-1; Tue, 02 May 2023 05:49:43 -0400
X-MC-Unique: PbP4hAH5Md6ZzTFzdYqMiA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f171d38db3so21828905e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 02:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683020982; x=1685612982;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQ9SfutrwM7EWlrfn6Fu5b4nnXjrf7Cg3l39RnsHw/k=;
 b=HFCbxPPATy3jDRw43RpPFvTCJxunEqe/kwH8yNZi88JdTn/TrGT2aT8PnPuLaQblsm
 NHvw8jFkQ/x3orGWpbbMXbAr6eSH6tW8zCqEXTsPkrKHiYpntegaxJnO8TnWDCj6MjHr
 BdLhaJd9HnUk/YFGaQtCfjo6B9cZWuPB/vnEtX0eVdmexWMoCs0TPDUEAj5Jb8OoGnUR
 VjfNGe2AA7n5xRWKmfbh1Qd/wK0YuacUnqX7RgR8tnbYvxmvd3am0xfiuSSg+0xqGfoo
 1oPHX8xz/ivzrmHlaYXmCgR5npS1GO20vuoy5Sw8+Pp7Iz4BAYxLXTsCM+G6JVd8dyrt
 kfdw==
X-Gm-Message-State: AC+VfDzIUMKFRx4ze9QDIPhZcznpxvK95qJbmNVHKXdBGR+gqAovfZrE
 2SybQ/b7HfnBOVU3zsliebnC6kxQ0z/2RT2lvjIzmHmGXoIQ5NHaz0py1FNwdYFcFJCEkusxdFs
 6k0hTm8+2jt517x4=
X-Received: by 2002:a05:600c:2104:b0:3f2:48dc:5e02 with SMTP id
 u4-20020a05600c210400b003f248dc5e02mr11745789wml.27.1683020982175; 
 Tue, 02 May 2023 02:49:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6FH0ekcViFpvw5op9vgi3s2wPuZDr2iLRXyCOVSZatMJXYbsKIs2S3/f99kKa/zx6seycJuA==
X-Received: by 2002:a05:600c:2104:b0:3f2:48dc:5e02 with SMTP id
 u4-20020a05600c210400b003f248dc5e02mr11745767wml.27.1683020981799; 
 Tue, 02 May 2023 02:49:41 -0700 (PDT)
Received: from redhat.com ([2.52.8.43]) by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c378300b003ef5f77901dsm34781171wmr.45.2023.05.02.02.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 02:49:41 -0700 (PDT)
Date: Tue, 2 May 2023 05:48:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru, lersek@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, quintela@redhat.com, armbru@redhat.com
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
Message-ID: <20230502054519-mutt-send-email-mst@kernel.org>
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
 <20230426002135-mutt-send-email-mst@kernel.org>
 <bf295d76-9c33-4eca-4b88-2d1a299c8b94@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf295d76-9c33-4eca-4b88-2d1a299c8b94@yandex-team.ru>
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

On Wed, Apr 26, 2023 at 11:00:46PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 26.04.23 07:43, Michael S. Tsirkin wrote:
> > On Tue, Apr 25, 2023 at 07:14:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > On incoming migration we have the following sequence to load option
> > > ROM:
> > > 
> > > 1. On device realize we do normal load ROM from the file
> > > 
> > > 2. Than, on incoming migration we rewrite ROM from the incoming RAM
> > >     block. If sizes mismatch we fail.
> > 
> > let's mention an example error message:
> >   Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
> > 
> > 
> > > 
> > > This is not ideal when we migrate to updated distribution: we have to
> > > keep old ROM files in new distribution and be careful around romfile
> > > property to load correct ROM file.
> > 
> > > Which is loaded actually just to
> > > allocate the ROM with correct length.
> > > Note, that romsize property doesn't really help: if we try to specify
> > > it when default romfile is larger, it fails with something like:
> > > 
> > > romfile "efi-virtio.rom" (160768 bytes) is too large for ROM size 65536
> > 
> > Something I'd like to clarify is that the comment applies to uses where
> > users/distributions supply their own ROM file.  And lots of
> > users/distributions seem to have already painted themselves into a
> > corner by supplying a mix of ROM files of unmatching sizes -
> > basically they don't understand the detail of live migration,
> > ROM size interaction with it and with memory layout, etc -
> > as a very small number of people does.
> > For example, ubuntu doubled ROM file size by padding their ROMs
> > with 0xffffffff at some point, breaking migration for all existing machine
> > types.
> > 
> > just a web search for
> >   Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
> > 
> > will turn up a bunch of confused distros and users.
> > 
> > 
> > > 
> > > Let's just ignore ROM file when romsize is specified and we are in
> > > incoming migration state. In other words, we need only to preallocate
> > > ROM of specified size, local ROM file is unrelated.
> > 
> > 
> > 
> > 
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
> > >    { "execute": "qom-get",
> > >      "arguments": {
> > >        "path": "/machine/peripheral/CARD_ID/virtio-net-pci.rom[0]",
> > >        "property": "size" } }
> > > 
> > > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > > ---
> > >   hw/pci/pci.c | 77 ++++++++++++++++++++++++++++++----------------------
> > >   1 file changed, 45 insertions(+), 32 deletions(-)
> > > 
> > > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > > index a442f8fce1..e2cab622e4 100644
> > > --- a/hw/pci/pci.c
> > > +++ b/hw/pci/pci.c
> > > @@ -36,6 +36,7 @@
> > >   #include "migration/vmstate.h"
> > >   #include "net/net.h"
> > >   #include "sysemu/numa.h"
> > > +#include "sysemu/runstate.h"
> > >   #include "sysemu/sysemu.h"
> > >   #include "hw/loader.h"
> > >   #include "qemu/error-report.h"
> > > @@ -2293,10 +2294,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
> > >   {
> > >       int64_t size;
> > >       g_autofree char *path = NULL;
> > > -    void *ptr;
> > >       char name[32];
> > >       const VMStateDescription *vmsd;
> > > +    /*
> > > +     * In case of incoming migration ROM will come with migration stream, no
> > > +     * reason to load the file.  Neither we want to fail if local ROM file
> > > +     * mismatches with specified romsize.
> > > +     */
> > > +    bool load_file = !runstate_check(RUN_STATE_INMIGRATE);
> > > +
> > >       if (!pdev->romfile) {
> > >           return;
> > >       }
> > 
> > CC pbonzini,dgilbert,quintela,armbru : guys, is poking at runstate_check like
> > this the right way to figure out we are not going to use the
> > device locally before incoming migration will overwrite ROM contents?
> 
> RUN_STATE_INMIGRATE is set in the only one place in qemu_init() when we parse cmdline option -incoming. VM is not running for sure. And starting the VM comes with changing the state. So it's OK.
> 
> The possible problem, if we add netcard on target which we didn't have on source. I now checked, this works.. But that doesn't seem correct to add device that was not present on source - how would it work - it's not guaranteed anyway.

You can add it on source too while migration is in progress, no?

> > 
> > > @@ -2329,32 +2336,35 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
> > >           return;
> > >       }
> > > -    path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
> > > -    if (path == NULL) {
> > > -        path = g_strdup(pdev->romfile);
> > > -    }
> > > +    if (load_file || pdev->romsize == -1) {
> > > +        path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
> > > +        if (path == NULL) {
> > > +            path = g_strdup(pdev->romfile);
> > > +        }
> > > -    size = get_image_size(path);
> > > -    if (size < 0) {
> > > -        error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
> > > -        return;
> > > -    } else if (size == 0) {
> > > -        error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
> > > -        return;
> > > -    } else if (size > 2 * GiB) {
> > > -        error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
> > > -                   pdev->romfile);
> > > -        return;
> > > -    }
> > > -    if (pdev->romsize != -1) {
> > > -        if (size > pdev->romsize) {
> > > -            error_setg(errp, "romfile \"%s\" (%u bytes) "
> > > -                       "is too large for ROM size %u",
> > > -                       pdev->romfile, (uint32_t)size, pdev->romsize);
> > > +        size = get_image_size(path);
> > > +        if (size < 0) {
> > > +            error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
> > > +            return;
> > > +        } else if (size == 0) {
> > > +            error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
> > > +            return;
> > > +        } else if (size > 2 * GiB) {
> > > +            error_setg(errp,
> > > +                       "romfile \"%s\" too large (size cannot exceed 2 GiB)",
> > > +                       pdev->romfile);
> > >               return;
> > >           }
> > > -    } else {
> > > -        pdev->romsize = pow2ceil(size);
> > > +        if (pdev->romsize != -1) {
> > > +            if (size > pdev->romsize) {
> > > +                error_setg(errp, "romfile \"%s\" (%u bytes) "
> > > +                           "is too large for ROM size %u",
> > > +                           pdev->romfile, (uint32_t)size, pdev->romsize);
> > > +                return;
> > > +            }
> > > +        } else {
> > > +            pdev->romsize = pow2ceil(size);
> > > +        }
> > >       }
> > >       vmsd = qdev_get_vmsd(DEVICE(pdev));
> > > @@ -2365,15 +2375,18 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
> > >       memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize,
> > >                              &error_fatal);
> > > -    ptr = memory_region_get_ram_ptr(&pdev->rom);
> > > -    if (load_image_size(path, ptr, size) < 0) {
> > > -        error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> > > -        return;
> > > -    }
> > > +    if (load_file) {
> > > +        void *ptr = memory_region_get_ram_ptr(&pdev->rom);
> > > -    if (is_default_rom) {
> > > -        /* Only the default rom images will be patched (if needed). */
> > > -        pci_patch_ids(pdev, ptr, size);
> > > +        if (load_image_size(path, ptr, size) < 0) {
> > > +            error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> > > +            return;
> > > +        }
> > > +
> > > +        if (is_default_rom) {
> > > +            /* Only the default rom images will be patched (if needed). */
> > > +            pci_patch_ids(pdev, ptr, size);
> > > +        }
> > >       }
> > 
> > it kind of feels weird to ignore
> 
> What do you mean we should not ignore?
> 
> 
> 
> -- 
> Best regards,
> Vladimir


