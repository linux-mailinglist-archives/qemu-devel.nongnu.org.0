Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1014B6F547F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:20:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8ez-0003Vq-4o; Wed, 03 May 2023 05:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pu8ex-0003VX-F6
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:20:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pu8ev-0004x5-IG
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IiIxTcSLjMAHlI450hRQqRxN4teJkkdRZzri0A56FvE=;
 b=i3rjhBPbLHe4cUA/qGYEjmz/+cK0NSuGui+eO2T0+1FqCqcpb1lNli5BsqLQlLqzPbHdf0
 yaUz7XAxns5HRA4LA1GUKDMs+xXGrkWpkBsjF/UK5HimozlPP96NagJNhpgUNpBOflrAkQ
 U6Gr6qpiRAvBmm1yVBHiodfby67Etuc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-Aih7thwcM72i5szXgiamVw-1; Wed, 03 May 2023 05:20:22 -0400
X-MC-Unique: Aih7thwcM72i5szXgiamVw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f1749c63c9so14961995e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105621; x=1685697621;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IiIxTcSLjMAHlI450hRQqRxN4teJkkdRZzri0A56FvE=;
 b=TCBhTowmfPt1YfkI5X2ShusGTvd/GLtWIipsWD5YED0+I9AfQxMsNc175emvFoXpHQ
 uLKPyNOS89oQaubpsj/X5e1HieZF2O5dI92SEKiJqnRNjAdJLzUewsMClB6Fcpp9QH6K
 UpSQ20qWezpPOr2EfoVdl2psNb2jFK+8mHh1jozHlMrrJ43EokZgd6TDT41srrG8wEBw
 zwEyxgGFt3qrzR9QOxbhdWtddXjx9JSGPsvdEzLdODVr9TlayQazmzmS0IlWJ3dcc+Do
 TUJgeWpSvvKECLECtMnS/Nuu7ZkrKh2DzcQvvB1IMPpKJZDpLirgeJU3p79DGOr3iEuE
 im7Q==
X-Gm-Message-State: AC+VfDwEP8s01Yr3muRTvD6TbBik55G/x9HcwciNoMWmDQf9YTnuUwgO
 oLwhwdjXwCX+GCKdKcSaCq6Y9hvsgSTq6QVE8qezucnrlxFW6agIfgbMh46CetW+np41cIVv4Ny
 UXaJ6HgFximl5+P8=
X-Received: by 2002:a7b:c408:0:b0:3eb:42fc:fb30 with SMTP id
 k8-20020a7bc408000000b003eb42fcfb30mr14051873wmi.32.1683105621155; 
 Wed, 03 May 2023 02:20:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5dmF0JA6vTUI0Nq8UNEBau2fGiE2EU9iSzOgVp9+46mQjQAmf0+zED8jeL12t4WkQ3QHobXg==
X-Received: by 2002:a7b:c408:0:b0:3eb:42fc:fb30 with SMTP id
 k8-20020a7bc408000000b003eb42fcfb30mr14051850wmi.32.1683105620713; 
 Wed, 03 May 2023 02:20:20 -0700 (PDT)
Received: from ?IPV6:2003:cb:c711:6a00:9109:6424:1804:a441?
 (p200300cbc7116a00910964241804a441.dip0.t-ipconnect.de.
 [2003:cb:c711:6a00:9109:6424:1804:a441])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a7bca50000000b003f1957ace1fsm1284305wml.13.2023.05.03.02.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:20:20 -0700 (PDT)
Message-ID: <c9ee303b-0de4-7c44-c5f7-b723df9825af@redhat.com>
Date: Wed, 3 May 2023 11:20:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: marcel.apfelbaum@gmail.com, mst@redhat.com, philmd@linaro.org,
 peterx@redhat.com, pbonzini@redhat.com, den-plotnikov@yandex-team.ru,
 lersek@redhat.com, kraxel@redhat.com
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
In-Reply-To: <20230425161434.173022-4-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 25.04.23 18:14, Vladimir Sementsov-Ogievskiy wrote:
> On incoming migration we have the following sequence to load option
> ROM:
> 
> 1. On device realize we do normal load ROM from the file
> 
> 2. Than, on incoming migration we rewrite ROM from the incoming RAM
>     block. If sizes mismatch we fail.
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
>    { "execute": "qom-get",
>      "arguments": {
>        "path": "/machine/peripheral/CARD_ID/virtio-net-pci.rom[0]",
>        "property": "size" } }
> 
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   hw/pci/pci.c | 77 ++++++++++++++++++++++++++++++----------------------
>   1 file changed, 45 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index a442f8fce1..e2cab622e4 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -36,6 +36,7 @@
>   #include "migration/vmstate.h"
>   #include "net/net.h"
>   #include "sysemu/numa.h"
> +#include "sysemu/runstate.h"
>   #include "sysemu/sysemu.h"
>   #include "hw/loader.h"
>   #include "qemu/error-report.h"
> @@ -2293,10 +2294,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>   {
>       int64_t size;
>       g_autofree char *path = NULL;
> -    void *ptr;
>       char name[32];
>       const VMStateDescription *vmsd;
>   
> +    /*
> +     * In case of incoming migration ROM will come with migration stream, no
> +     * reason to load the file.  Neither we want to fail if local ROM file
> +     * mismatches with specified romsize.
> +     */
> +    bool load_file = !runstate_check(RUN_STATE_INMIGRATE);
> +
>       if (!pdev->romfile) {
>           return;
>       }
> @@ -2329,32 +2336,35 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>           return;
>       }
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
>               return;
>           }
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
>       }
>   
>       vmsd = qdev_get_vmsd(DEVICE(pdev));
> @@ -2365,15 +2375,18 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>       memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize,
>                              &error_fatal);
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
>       }
>   
>       pci_register_bar(pdev, PCI_ROM_SLOT, 0, &pdev->rom);


So, we'll now never load the file on the migration destination. But if 
"pdev->romsize == -1", we'll use the size of the file to size the region 
-- but not load it.


While that should work (because the ROM content will be migrated), at 
least I would find this easier to digest if we would have

bool use_file = !runstate_check(RUN_STATE_INMIGRATE) ||
		pdev->romsize == -1;

if (use_file) {
	path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
	...
}
...
memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize ...
...
if (use_file) {
	ptr = memory_region_get_ram_ptr(&pdev->rom);
	if (load_image_size(path, ptr, size) < 0) {
		...
	}
}


If something about the file is weird (such that reading the size would 
work but loading would fail), it would fail consistently. Sure, we would 
load once more, but who really cares about that.

I wonder, though, if we then also want to handle the "pdev->romfile" 
checks differently, when we're not going to use the file at all ... 
would maybe make it more consistent. If we're not using the file, then 
ignore if no file is given/available ... because we don't need it. The 
romsize is sufficient in that case on the migration destination.

-- 
Thanks,

David / dhildenb


