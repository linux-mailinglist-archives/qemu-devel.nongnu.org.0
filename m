Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF406F5543
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:50:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu97y-0001bk-Ez; Wed, 03 May 2023 05:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pu97w-0001a2-3v
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:50:24 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pu97s-0005jO-PU
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:50:23 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id EFA205FD5C;
 Wed,  3 May 2023 12:50:10 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b43b::1:1a] (unknown
 [2a02:6b8:b081:b43b::1:1a])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 9oKcqY0MmW20-3ZIsRYRK; Wed, 03 May 2023 12:50:09 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683107409; bh=OjumAxNUftwltLl3BCpy5qicovTUweoya2By6YKeRME=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=WopRLUSqzAX1zb29xdKQgkA7j4bSFXHmGmjiOK3sN5EewfxAWuUCt0or748N9EzNC
 OHvuADk51GG9b4PDaRckAX6xYSYIBCZ2DjBMIny4i1gDgZcdmplm+8uHtQsdHO6UYk
 1hIh+XJ9xaJcaHX/6TStrmmWLvLgMYGYKT+9oMQg=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <fe20f078-53fe-1e60-b30f-c3611aa7e7dd@yandex-team.ru>
Date: Wed, 3 May 2023 12:50:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: marcel.apfelbaum@gmail.com, mst@redhat.com, philmd@linaro.org,
 peterx@redhat.com, pbonzini@redhat.com, den-plotnikov@yandex-team.ru,
 lersek@redhat.com, kraxel@redhat.com
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
 <c9ee303b-0de4-7c44-c5f7-b723df9825af@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <c9ee303b-0de4-7c44-c5f7-b723df9825af@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 03.05.23 12:20, David Hildenbrand wrote:
> On 25.04.23 18:14, Vladimir Sementsov-Ogievskiy wrote:
>> On incoming migration we have the following sequence to load option
>> ROM:
>>
>> 1. On device realize we do normal load ROM from the file
>>
>> 2. Than, on incoming migration we rewrite ROM from the incoming RAM
>>     block. If sizes mismatch we fail.
>>
>> This is not ideal when we migrate to updated distribution: we have to
>> keep old ROM files in new distribution and be careful around romfile
>> property to load correct ROM file. Which is loaded actually just to
>> allocate the ROM with correct length.
>>
>> Note, that romsize property doesn't really help: if we try to specify
>> it when default romfile is larger, it fails with something like:
>>
>> romfile "efi-virtio.rom" (160768 bytes) is too large for ROM size 65536
>>
>> Let's just ignore ROM file when romsize is specified and we are in
>> incoming migration state. In other words, we need only to preallocate
>> ROM of specified size, local ROM file is unrelated.
>>
>> This way:
>>
>> If romsize was specified on source, we just use same commandline as on
>> source, and migration will work independently of local ROM files on
>> target.
>>
>> If romsize was not specified on source (and we have mismatching local
>> ROM file on target host), we have to specify romsize on target to match
>> source romsize. romfile parameter may be kept same as on source or may
>> be dropped, the file is not loaded anyway.
>>
>> As a bonus we avoid extra reading from ROM file on target.
>>
>> Note: when we don't have romsize parameter on source command line and
>> need it for target, it may be calculated as aligned up to power of two
>> size of ROM file on source (if we know, which file is it) or,
>> alternatively it may be retrieved from source QEMU by QMP qom-get
>> command, like
>>
>>    { "execute": "qom-get",
>>      "arguments": {
>>        "path": "/machine/peripheral/CARD_ID/virtio-net-pci.rom[0]",
>>        "property": "size" } }
>>
>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   hw/pci/pci.c | 77 ++++++++++++++++++++++++++++++----------------------
>>   1 file changed, 45 insertions(+), 32 deletions(-)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index a442f8fce1..e2cab622e4 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -36,6 +36,7 @@
>>   #include "migration/vmstate.h"
>>   #include "net/net.h"
>>   #include "sysemu/numa.h"
>> +#include "sysemu/runstate.h"
>>   #include "sysemu/sysemu.h"
>>   #include "hw/loader.h"
>>   #include "qemu/error-report.h"
>> @@ -2293,10 +2294,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>   {
>>       int64_t size;
>>       g_autofree char *path = NULL;
>> -    void *ptr;
>>       char name[32];
>>       const VMStateDescription *vmsd;
>> +    /*
>> +     * In case of incoming migration ROM will come with migration stream, no
>> +     * reason to load the file.  Neither we want to fail if local ROM file
>> +     * mismatches with specified romsize.
>> +     */
>> +    bool load_file = !runstate_check(RUN_STATE_INMIGRATE);
>> +
>>       if (!pdev->romfile) {
>>           return;
>>       }
>> @@ -2329,32 +2336,35 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>           return;
>>       }
>> -    path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
>> -    if (path == NULL) {
>> -        path = g_strdup(pdev->romfile);
>> -    }
>> +    if (load_file || pdev->romsize == -1) {
>> +        path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
>> +        if (path == NULL) {
>> +            path = g_strdup(pdev->romfile);
>> +        }
>> -    size = get_image_size(path);
>> -    if (size < 0) {
>> -        error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
>> -        return;
>> -    } else if (size == 0) {
>> -        error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
>> -        return;
>> -    } else if (size > 2 * GiB) {
>> -        error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
>> -                   pdev->romfile);
>> -        return;
>> -    }
>> -    if (pdev->romsize != -1) {
>> -        if (size > pdev->romsize) {
>> -            error_setg(errp, "romfile \"%s\" (%u bytes) "
>> -                       "is too large for ROM size %u",
>> -                       pdev->romfile, (uint32_t)size, pdev->romsize);
>> +        size = get_image_size(path);
>> +        if (size < 0) {
>> +            error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
>> +            return;
>> +        } else if (size == 0) {
>> +            error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
>> +            return;
>> +        } else if (size > 2 * GiB) {
>> +            error_setg(errp,
>> +                       "romfile \"%s\" too large (size cannot exceed 2 GiB)",
>> +                       pdev->romfile);
>>               return;
>>           }
>> -    } else {
>> -        pdev->romsize = pow2ceil(size);
>> +        if (pdev->romsize != -1) {
>> +            if (size > pdev->romsize) {
>> +                error_setg(errp, "romfile \"%s\" (%u bytes) "
>> +                           "is too large for ROM size %u",
>> +                           pdev->romfile, (uint32_t)size, pdev->romsize);
>> +                return;
>> +            }
>> +        } else {
>> +            pdev->romsize = pow2ceil(size);
>> +        }
>>       }
>>       vmsd = qdev_get_vmsd(DEVICE(pdev));
>> @@ -2365,15 +2375,18 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>       memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize,
>>                              &error_fatal);
>> -    ptr = memory_region_get_ram_ptr(&pdev->rom);
>> -    if (load_image_size(path, ptr, size) < 0) {
>> -        error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
>> -        return;
>> -    }
>> +    if (load_file) {
>> +        void *ptr = memory_region_get_ram_ptr(&pdev->rom);
>> -    if (is_default_rom) {
>> -        /* Only the default rom images will be patched (if needed). */
>> -        pci_patch_ids(pdev, ptr, size);
>> +        if (load_image_size(path, ptr, size) < 0) {
>> +            error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
>> +            return;
>> +        }
>> +
>> +        if (is_default_rom) {
>> +            /* Only the default rom images will be patched (if needed). */
>> +            pci_patch_ids(pdev, ptr, size);
>> +        }
>>       }
>>       pci_register_bar(pdev, PCI_ROM_SLOT, 0, &pdev->rom);
> 
> 
> So, we'll now never load the file on the migration destination. But if "pdev->romsize == -1", we'll use the size of the file to size the region -- but not load it.
> 
> 
> While that should work (because the ROM content will be migrated), at least I would find this easier to digest if we would have
> 
> bool use_file = !runstate_check(RUN_STATE_INMIGRATE) ||
>          pdev->romsize == -1;
> 
> if (use_file) {
>      path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
>      ...
> }
> ...
> memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize ...
> ...
> if (use_file) {
>      ptr = memory_region_get_ram_ptr(&pdev->rom);
>      if (load_image_size(path, ptr, size) < 0) {
>          ...
>      }
> }
> 
> 
> If something about the file is weird (such that reading the size would work but loading would fail), it would fail consistently. Sure, we would load once more, but who really cares about that.
> 
> I wonder, though, if we then also want to handle the "pdev->romfile" checks differently, when we're not going to use the file at all ... would maybe make it more consistent. If we're not using the file, then ignore if no file is given/available ... because we don't need it. The romsize is sufficient in that case on the migration destination.
> 

Maybe, we should just deprecate unspecified romsize? And make it necessary in future?

-- 
Best regards,
Vladimir


