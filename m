Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D515E6EED08
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 06:45:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prX0q-00060T-5S; Wed, 26 Apr 2023 00:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prX0j-0005zU-SO
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 00:44:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prX0h-0006Sw-Hr
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 00:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682484245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w1UlvGzKVyyBtaUDAR+3kQsN/7YKyq3pIHtv+lxfr8s=;
 b=Lm5J1GZPoqLS+umehU7yoVkaAyIeWrAE+wrHEAi/WE7pybAexlHHum+aAVTrncI5VjlQTo
 RL/T6m8eLHYJvAu+TqCp0/gp//1Az9TAQQp0Pgz7sSH+6fqdwJTAQkx10B3M3p3bzluzhz
 nrg7n9trhJaF4aLSJt99OrieYFRUbeM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-3e1y4QP2PxmVRyf3gTplKQ-1; Wed, 26 Apr 2023 00:44:03 -0400
X-MC-Unique: 3e1y4QP2PxmVRyf3gTplKQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2f96ecfb40cso2364483f8f.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 21:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682484243; x=1685076243;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w1UlvGzKVyyBtaUDAR+3kQsN/7YKyq3pIHtv+lxfr8s=;
 b=ZvkvEqr5klMKHo0sxNABwhAY9KMf9w7H0VeydI1qJTAflcaPX07KpzRkaSrIXqS9Al
 T/T4wcvzK/++6RDyLqNjsFY5FcEqSLQG0EquPYp4NFjZLjB5kb+Zw29gA/iXeCZWHdyE
 fOx33jIu+3BLTxvFV1boz8W/W9CXSYVG5oBGp5yHrPPdZxNx173ozH9ARjbsXUmXTOzf
 YAlR+DWMKin8s3lwypnKq+X6k8PV6h8Ny4KzPxWZSVRvaq7HR84VhMFAy62FZ+tBpaVw
 wH7V9h/3Q/gbvaeGSzvgodxTw/RjBq9buUDJem7S2fenwTzKlAM/DJIadwfQtTBCMjxD
 SuyA==
X-Gm-Message-State: AAQBX9e16eIOb9DgfVTCXCnpmDzyMw2oAMJWmL2Aj+8hx8YqRvnAcOAt
 czurm4bXHneaywwUdJTgxLYl0FRUADCgMkVESvpqB5cDsy8N9EnGdAEiREa8ghhrauZqS7VXlE+
 1mDVU3eIcnK8Qcv0=
X-Received: by 2002:adf:f391:0:b0:2f6:ece3:76a with SMTP id
 m17-20020adff391000000b002f6ece3076amr12828148wro.8.1682484242814; 
 Tue, 25 Apr 2023 21:44:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350azu72PWbnXEPoqWxmI+XiNKfO3xiSxNvXjkRj11zuBWDJG+KHoHVLnXzbblLDGdHwAJ1zPpA==
X-Received: by 2002:adf:f391:0:b0:2f6:ece3:76a with SMTP id
 m17-20020adff391000000b002f6ece3076amr12828135wro.8.1682484242507; 
 Tue, 25 Apr 2023 21:44:02 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 w13-20020adff9cd000000b002cea9d931e6sm14612195wrr.78.2023.04.25.21.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 21:44:01 -0700 (PDT)
Date: Wed, 26 Apr 2023 00:43:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru, lersek@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, quintela@redhat.com, armbru@redhat.com
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
Message-ID: <20230426002135-mutt-send-email-mst@kernel.org>
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425161434.173022-4-vsementsov@yandex-team.ru>
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

On Tue, Apr 25, 2023 at 07:14:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On incoming migration we have the following sequence to load option
> ROM:
> 
> 1. On device realize we do normal load ROM from the file
> 
> 2. Than, on incoming migration we rewrite ROM from the incoming RAM
>    block. If sizes mismatch we fail.

let's mention an example error message:
 Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument


> 
> This is not ideal when we migrate to updated distribution: we have to
> keep old ROM files in new distribution and be careful around romfile
> property to load correct ROM file.

> Which is loaded actually just to
> allocate the ROM with correct length.
> Note, that romsize property doesn't really help: if we try to specify
> it when default romfile is larger, it fails with something like:
> 
> romfile "efi-virtio.rom" (160768 bytes) is too large for ROM size 65536

Something I'd like to clarify is that the comment applies to uses where
users/distributions supply their own ROM file.  And lots of
users/distributions seem to have already painted themselves into a
corner by supplying a mix of ROM files of unmatching sizes -
basically they don't understand the detail of live migration,
ROM size interaction with it and with memory layout, etc -
as a very small number of people does.
For example, ubuntu doubled ROM file size by padding their ROMs
with 0xffffffff at some point, breaking migration for all existing machine
types.

just a web search for
 Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument

will turn up a bunch of confused distros and users.


> 
> Let's just ignore ROM file when romsize is specified and we are in
> incoming migration state. In other words, we need only to preallocate
> ROM of specified size, local ROM file is unrelated.




> 
> This way:
> 
> If romsize was specified on source, we just use same commandline as on
> source, and migration will work independently of local ROM files on
> target.
> 
> If romsize was not specified on source (and we have mismatching local
> ROM file on target host), we have to specify romsize on target to match
> source romsize. romfile parameter may be kept same as on source or may
> be dropped, the file is not loaded anyway.
> 
> As a bonus we avoid extra reading from ROM file on target.
> 
> Note: when we don't have romsize parameter on source command line and
> need it for target, it may be calculated as aligned up to power of two
> size of ROM file on source (if we know, which file is it) or,
> alternatively it may be retrieved from source QEMU by QMP qom-get
> command, like
> 
>   { "execute": "qom-get",
>     "arguments": {
>       "path": "/machine/peripheral/CARD_ID/virtio-net-pci.rom[0]",
>       "property": "size" } }
> 
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  hw/pci/pci.c | 77 ++++++++++++++++++++++++++++++----------------------
>  1 file changed, 45 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index a442f8fce1..e2cab622e4 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -36,6 +36,7 @@
>  #include "migration/vmstate.h"
>  #include "net/net.h"
>  #include "sysemu/numa.h"
> +#include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/loader.h"
>  #include "qemu/error-report.h"
> @@ -2293,10 +2294,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>  {
>      int64_t size;
>      g_autofree char *path = NULL;
> -    void *ptr;
>      char name[32];
>      const VMStateDescription *vmsd;
>  
> +    /*
> +     * In case of incoming migration ROM will come with migration stream, no
> +     * reason to load the file.  Neither we want to fail if local ROM file
> +     * mismatches with specified romsize.
> +     */
> +    bool load_file = !runstate_check(RUN_STATE_INMIGRATE);
> +
>      if (!pdev->romfile) {
>          return;
>      }

CC pbonzini,dgilbert,quintela,armbru : guys, is poking at runstate_check like
this the right way to figure out we are not going to use the
device locally before incoming migration will overwrite ROM contents?

> @@ -2329,32 +2336,35 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>          return;
>      }
>  
> -    path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
> -    if (path == NULL) {
> -        path = g_strdup(pdev->romfile);
> -    }
> +    if (load_file || pdev->romsize == -1) {
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
> @@ -2365,15 +2375,18 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
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

it kind of feels weird to ignore 


>      pci_register_bar(pdev, PCI_ROM_SLOT, 0, &pdev->rom);
> -- 
> 2.34.1


