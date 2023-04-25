Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498806EE212
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:44:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prI11-0008H8-PM; Tue, 25 Apr 2023 08:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prI0x-0008Gl-9K
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:43:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prI0u-0008Rn-BZ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682426597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AD3VT+IJTfC8X++YxvLj0GDIszCsGqCQLG/xVEd9+B0=;
 b=NGyHjX5f5PBOSkTKzFOyS4gKlBqz0ZNTl++EmTP+Cp3Kn6fKrYTzEwDoXdQyjYXdrHtGeM
 TcT5EQqLWoKeGMgeBV4bnArEmLXERIkoqqQD5wB9c2sxnXF0blHJbE0iVJYIBqjUK7WpqT
 OmA8Nohxc8w8S4EZgNAq9AC3EYgeiEY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-SOlvTbWPPoG2Br2jtDGLsw-1; Tue, 25 Apr 2023 08:43:15 -0400
X-MC-Unique: SOlvTbWPPoG2Br2jtDGLsw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb2easo1827804f8f.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 05:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682426594; x=1685018594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AD3VT+IJTfC8X++YxvLj0GDIszCsGqCQLG/xVEd9+B0=;
 b=lClsGq0b+tTTbGP5lxWtBKp8555wuNsUbhpo6F8ISdz5uDPFahLcjNBZy6FBUnqjr6
 dcgIt8yqsrbcNbM3Kw6ndoMlWwfr4L3bc9I+J/ER2IYYsbBGCeBx8AeHnPfKQ1HBo9us
 rIzFcrzCRIIbyMznrjjHQsLHJ3yL5AeP0ubWfftiPY4gkBVSXwHiLxtB76TfxZJ+zUAn
 l58cBoWrV9oRDcxHcZKPX6+4Clq0OBipAlUXFRbCasha/vHjPN+BOEUL3OrcMRjXKYq2
 vgZmTsUboWddncmqin0+GF0m0uujNtar6UVVcIqfHYAb+lWsO/OKTjr+gBucGSiLn7qh
 P2/w==
X-Gm-Message-State: AAQBX9cBKiOLUqY/n91F0/p+YhqdVaCMDnvKdmWx/lodKNtr2o4BSUiE
 9MQv7lOPYGPBNXcU/D4zc2vG9TpkpGqcwpXBBkFjKtNKvxfwEWSqnPmN9wJLQBGORp+Uhrn/Jn3
 Tj7euXetKXM8Qh9g=
X-Received: by 2002:adf:f1d1:0:b0:2ef:5d73:f6b7 with SMTP id
 z17-20020adff1d1000000b002ef5d73f6b7mr11556231wro.13.1682426594768; 
 Tue, 25 Apr 2023 05:43:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350aW3fGDmvM7IyqJMxY3rc9TPKqvQFjDuntxinpGwvR1htYzSueabJuMGkvjFHngJTgQFGsWTA==
X-Received: by 2002:adf:f1d1:0:b0:2ef:5d73:f6b7 with SMTP id
 z17-20020adff1d1000000b002ef5d73f6b7mr11556219wro.13.1682426594438; 
 Tue, 25 Apr 2023 05:43:14 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm18310786wms.22.2023.04.25.05.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 05:43:13 -0700 (PDT)
Date: Tue, 25 Apr 2023 08:43:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru, lersek@redhat.com, kraxel@redhat.com
Subject: Re: [PATCH 3/3] pci: ROM preallocation for incoming migration
Message-ID: <20230425084121-mutt-send-email-mst@kernel.org>
References: <20230425105603.137823-1-vsementsov@yandex-team.ru>
 <20230425105603.137823-4-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425105603.137823-4-vsementsov@yandex-team.ru>
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

On Tue, Apr 25, 2023 at 01:56:03PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On incoming migration we have the following sequence to load option
> ROM:
> 
> 1. On device realize we do normal load ROM from the file
> 
> 2. Than, on incoming migration we rewrite ROM from the incoming RAM
>    block. If sizes mismatch we fail.
> 
> This is not ideal when we migrate to updated distribution: we have to
> keep old ROM files in new distribution and be careful around romfile
> property to load correct ROM file. Which is loaded actually just to
> allocate the ROM with correct length.
> 
> Note, that romsize property doesn't really help: if we try to specify
> it when default romfile is larger, it fails with something like:
> 
> romfile "efi-virtio.rom" (160768 bytes) is too large for ROM size 65536
> 
> This commit brings new behavior for romfile="",romsize=SIZE combination
> of options. Current behavior is just ignore romsize and not load or
> create any ROM.
> 
> Let's instead preallocate ROM, not loading any file. This way we can
> migrate old vm to new environment not thinking about ROM files on
> destination host:
> 
> 1. specify romfile="",romsize=SIZE on target, with correct SIZE
>    (actually, size of romfile on source aligned up to power of two, or
>     just original romsize option on source)
> 
> 2. On device realize we just preallocate ROM, and not load any file
> 
> 3. On incoming migration ROM is filled from the migration stream
> 
> As a bonus we avoid extra reading from ROM file on target.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

why is this a bad idea:
- on source presumably user overrides romfile
- we have a general rule that source and destination flags must match

I propose instead to ignore romfile if qemu is incoming migration
and romsize has been specified.

> ---
>  hw/pci/pci.c | 76 +++++++++++++++++++++++++++++-----------------------
>  1 file changed, 43 insertions(+), 33 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index a442f8fce1..039e762b66 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2293,17 +2293,21 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>  {
>      int64_t size;
>      g_autofree char *path = NULL;
> -    void *ptr;
>      char name[32];
>      const VMStateDescription *vmsd;
> +    bool load_file;
>  
>      if (!pdev->romfile) {
>          return;
>      }
> -    if (strlen(pdev->romfile) == 0) {
> +
> +    load_file = strlen(pdev->romfile) > 0;
> +    if (!load_file && pdev->romsize == -1) {
>          return;
>      }
>  
> +    assert(load_file || !is_default_rom);
> +
>      if (!pdev->rom_bar) {
>          /*
>           * Load rom via fw_cfg instead of creating a rom bar,
> @@ -2329,32 +2333,35 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>          return;
>      }
>  
> -    path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
> -    if (path == NULL) {
> -        path = g_strdup(pdev->romfile);
> -    }
> +    if (load_file) {
> +        path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
> +        if (path == NULL) {
> +            path = g_strdup(pdev->romfile);
> +        }
>  
> -    size = get_image_size(path);
> -    if (size < 0) {
> -        error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
> -        return;
> -    } else if (size == 0) {
> -        error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
> -        return;
> -    } else if (size > 2 * GiB) {
> -        error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
> -                   pdev->romfile);
> -        return;
> -    }
> -    if (pdev->romsize != -1) {
> -        if (size > pdev->romsize) {
> -            error_setg(errp, "romfile \"%s\" (%u bytes) "
> -                       "is too large for ROM size %u",
> -                       pdev->romfile, (uint32_t)size, pdev->romsize);
> +        size = get_image_size(path);
> +        if (size < 0) {
> +            error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
> +            return;
> +        } else if (size == 0) {
> +            error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
> +            return;
> +        } else if (size > 2 * GiB) {
> +            error_setg(errp,
> +                       "romfile \"%s\" too large (size cannot exceed 2 GiB)",
> +                       pdev->romfile);
>              return;
>          }
> -    } else {
> -        pdev->romsize = pow2ceil(size);
> +        if (pdev->romsize != -1) {
> +            if (size > pdev->romsize) {
> +                error_setg(errp, "romfile \"%s\" (%u bytes) "
> +                           "is too large for ROM size %u",
> +                           pdev->romfile, (uint32_t)size, pdev->romsize);
> +                return;
> +            }
> +        } else {
> +            pdev->romsize = pow2ceil(size);
> +        }
>      }
>  
>      vmsd = qdev_get_vmsd(DEVICE(pdev));
> @@ -2365,15 +2372,18 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>      memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize,
>                             &error_fatal);
>  
> -    ptr = memory_region_get_ram_ptr(&pdev->rom);
> -    if (load_image_size(path, ptr, size) < 0) {
> -        error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> -        return;
> -    }
> +    if (load_file) {
> +        void *ptr = memory_region_get_ram_ptr(&pdev->rom);
>  
> -    if (is_default_rom) {
> -        /* Only the default rom images will be patched (if needed). */
> -        pci_patch_ids(pdev, ptr, size);
> +        if (load_image_size(path, ptr, size) < 0) {
> +            error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> +            return;
> +        }
> +
> +        if (is_default_rom) {
> +            /* Only the default rom images will be patched (if needed). */
> +            pci_patch_ids(pdev, ptr, size);
> +        }
>      }
>  
>      pci_register_bar(pdev, PCI_ROM_SLOT, 0, &pdev->rom);
> -- 
> 2.34.1


