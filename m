Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDDB6FCAD5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 18:11:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPuv-0003wK-RI; Tue, 09 May 2023 12:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pwPuc-0003vT-PP
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pwPuZ-0002Zk-K0
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683648598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MhBCrO5SA1zUN7rB6yQF2tzoXQKndmr/ofVMdqkq97E=;
 b=hYtaK4k/E3mSTph2KUz0yi9qNEnHDWIZjmDZBPgtOJVSpOAGWzDOIfRNqwO488U4n2L/bt
 UM1yDrEkS1BBbYqG0fYenc/FtWXCg0SZTREhVmhloFswCPzkFjASKE6Y9tn07NBtH/2cjy
 jGJv/0ssJxAAn2L8OqrJcOzx++n5mMg=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-FJtxB1PRNDut9fB1Rmd7Gw-1; Tue, 09 May 2023 12:09:56 -0400
X-MC-Unique: FJtxB1PRNDut9fB1Rmd7Gw-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-6434e3d1975so3435360b3a.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 09:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683648595; x=1686240595;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MhBCrO5SA1zUN7rB6yQF2tzoXQKndmr/ofVMdqkq97E=;
 b=Oqq5wQy4IlbGq6otzDHGX0n1iXVioFmMUJr5lxbl1N7MDRLSzmFfceBJ8fT23ZbaVY
 bzSEtF646/seTCRO3vfbmU8BmrmFv92E9hqHChRj8mygtgdVhWnK51mnZ/JgSdO8MlXs
 5/ZMqxPC+bvSCte9A0E8RWCbvjjHg6VtRMyptXDXPNwW2I+VFiGGiDhtPDPVFxr0jWbq
 Nwlj9/f/YeiIvZEMzoSI2/ddanippJvYOGDR3wZNpEScB7+RxZtYS+9rWEchsbQSeods
 O2JAXDkK9xLldTYMYJ9onkMoq2gleQ55kskeIAHRm7tB26HTHjNV5hAtHtOK5QqP8Ml0
 enTg==
X-Gm-Message-State: AC+VfDwi55DzvyZ6Z/TJLm7E2gYMk9gXCJpToF5b/QbMde3SeThmRgWG
 v4BwLwBLPOE1U1vhUMg42TBJfIj76jCzzTNaKrC9J1/vK350bJIkaIEzHc8Rs5dMQ+mCVGQQK4X
 EGqFglWrK4oX+DA4=
X-Received: by 2002:a05:6a00:2401:b0:63d:2c2f:e3a2 with SMTP id
 z1-20020a056a00240100b0063d2c2fe3a2mr18621106pfh.18.1683648595321; 
 Tue, 09 May 2023 09:09:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XeWjpeAwDnUJNMiiMoqT40K38yxKwy8ArSYu42pyk44PfD6lffdf4gRbMiq6qDG6A08YRDg==
X-Received: by 2002:a05:6a00:2401:b0:63d:2c2f:e3a2 with SMTP id
 z1-20020a056a00240100b0063d2c2fe3a2mr18621062pfh.18.1683648594796; 
 Tue, 09 May 2023 09:09:54 -0700 (PDT)
Received: from ?IPV6:2001:4958:15a0:30:5835:5bd3:f0c8:e5ef?
 ([2001:4958:15a0:30:5835:5bd3:f0c8:e5ef])
 by smtp.gmail.com with ESMTPSA id
 m3-20020aa78a03000000b0063d3d776910sm1933924pfa.138.2023.05.09.09.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 09:09:54 -0700 (PDT)
Message-ID: <a1604bc0-86b8-4c50-75ae-e8153c5dee23@redhat.com>
Date: Tue, 9 May 2023 18:09:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 peterx@redhat.com, pbonzini@redhat.com, den-plotnikov@yandex-team.ru,
 lersek@redhat.com, kraxel@redhat.com
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
 <c9ee303b-0de4-7c44-c5f7-b723df9825af@redhat.com>
 <fe20f078-53fe-1e60-b30f-c3611aa7e7dd@yandex-team.ru>
 <20230503060231-mutt-send-email-mst@kernel.org>
 <ed74d57a-5f24-bf0a-09c2-b755c69c8c08@yandex-team.ru>
 <20230509115151-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230509115151-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09.05.23 17:54, Michael S. Tsirkin wrote:
> On Wed, May 03, 2023 at 02:39:15PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> On 03.05.23 13:05, Michael S. Tsirkin wrote:
>>> On Wed, May 03, 2023 at 12:50:09PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> On 03.05.23 12:20, David Hildenbrand wrote:
>>>>> On 25.04.23 18:14, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> On incoming migration we have the following sequence to load option
>>>>>> ROM:
>>>>>>
>>>>>> 1. On device realize we do normal load ROM from the file
>>>>>>
>>>>>> 2. Than, on incoming migration we rewrite ROM from the incoming RAM
>>>>>>       block. If sizes mismatch we fail.
>>>>>>
>>>>>> This is not ideal when we migrate to updated distribution: we have to
>>>>>> keep old ROM files in new distribution and be careful around romfile
>>>>>> property to load correct ROM file. Which is loaded actually just to
>>>>>> allocate the ROM with correct length.
>>>>>>
>>>>>> Note, that romsize property doesn't really help: if we try to specify
>>>>>> it when default romfile is larger, it fails with something like:
>>>>>>
>>>>>> romfile "efi-virtio.rom" (160768 bytes) is too large for ROM size 65536
>>>>>>
>>>>>> Let's just ignore ROM file when romsize is specified and we are in
>>>>>> incoming migration state. In other words, we need only to preallocate
>>>>>> ROM of specified size, local ROM file is unrelated.
>>>>>>
>>>>>> This way:
>>>>>>
>>>>>> If romsize was specified on source, we just use same commandline as on
>>>>>> source, and migration will work independently of local ROM files on
>>>>>> target.
>>>>>>
>>>>>> If romsize was not specified on source (and we have mismatching local
>>>>>> ROM file on target host), we have to specify romsize on target to match
>>>>>> source romsize. romfile parameter may be kept same as on source or may
>>>>>> be dropped, the file is not loaded anyway.
>>>>>>
>>>>>> As a bonus we avoid extra reading from ROM file on target.
>>>>>>
>>>>>> Note: when we don't have romsize parameter on source command line and
>>>>>> need it for target, it may be calculated as aligned up to power of two
>>>>>> size of ROM file on source (if we know, which file is it) or,
>>>>>> alternatively it may be retrieved from source QEMU by QMP qom-get
>>>>>> command, like
>>>>>>
>>>>>>      { "execute": "qom-get",
>>>>>>        "arguments": {
>>>>>>          "path": "/machine/peripheral/CARD_ID/virtio-net-pci.rom[0]",
>>>>>>          "property": "size" } }
>>>>>>
>>>>>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>>>>> ---
>>>>>>     hw/pci/pci.c | 77 ++++++++++++++++++++++++++++++----------------------
>>>>>>     1 file changed, 45 insertions(+), 32 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>>>>> index a442f8fce1..e2cab622e4 100644
>>>>>> --- a/hw/pci/pci.c
>>>>>> +++ b/hw/pci/pci.c
>>>>>> @@ -36,6 +36,7 @@
>>>>>>     #include "migration/vmstate.h"
>>>>>>     #include "net/net.h"
>>>>>>     #include "sysemu/numa.h"
>>>>>> +#include "sysemu/runstate.h"
>>>>>>     #include "sysemu/sysemu.h"
>>>>>>     #include "hw/loader.h"
>>>>>>     #include "qemu/error-report.h"
>>>>>> @@ -2293,10 +2294,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>>>>>     {
>>>>>>         int64_t size;
>>>>>>         g_autofree char *path = NULL;
>>>>>> -    void *ptr;
>>>>>>         char name[32];
>>>>>>         const VMStateDescription *vmsd;
>>>>>> +    /*
>>>>>> +     * In case of incoming migration ROM will come with migration stream, no
>>>>>> +     * reason to load the file.  Neither we want to fail if local ROM file
>>>>>> +     * mismatches with specified romsize.
>>>>>> +     */
>>>>>> +    bool load_file = !runstate_check(RUN_STATE_INMIGRATE);
>>>>>> +
>>>>>>         if (!pdev->romfile) {
>>>>>>             return;
>>>>>>         }
>>>>>> @@ -2329,32 +2336,35 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>>>>>             return;
>>>>>>         }
>>>>>> -    path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
>>>>>> -    if (path == NULL) {
>>>>>> -        path = g_strdup(pdev->romfile);
>>>>>> -    }
>>>>>> +    if (load_file || pdev->romsize == -1) {
>>>>>> +        path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
>>>>>> +        if (path == NULL) {
>>>>>> +            path = g_strdup(pdev->romfile);
>>>>>> +        }
>>>>>> -    size = get_image_size(path);
>>>>>> -    if (size < 0) {
>>>>>> -        error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
>>>>>> -        return;
>>>>>> -    } else if (size == 0) {
>>>>>> -        error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
>>>>>> -        return;
>>>>>> -    } else if (size > 2 * GiB) {
>>>>>> -        error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
>>>>>> -                   pdev->romfile);
>>>>>> -        return;
>>>>>> -    }
>>>>>> -    if (pdev->romsize != -1) {
>>>>>> -        if (size > pdev->romsize) {
>>>>>> -            error_setg(errp, "romfile \"%s\" (%u bytes) "
>>>>>> -                       "is too large for ROM size %u",
>>>>>> -                       pdev->romfile, (uint32_t)size, pdev->romsize);
>>>>>> +        size = get_image_size(path);
>>>>>> +        if (size < 0) {
>>>>>> +            error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
>>>>>> +            return;
>>>>>> +        } else if (size == 0) {
>>>>>> +            error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
>>>>>> +            return;
>>>>>> +        } else if (size > 2 * GiB) {
>>>>>> +            error_setg(errp,
>>>>>> +                       "romfile \"%s\" too large (size cannot exceed 2 GiB)",
>>>>>> +                       pdev->romfile);
>>>>>>                 return;
>>>>>>             }
>>>>>> -    } else {
>>>>>> -        pdev->romsize = pow2ceil(size);
>>>>>> +        if (pdev->romsize != -1) {
>>>>>> +            if (size > pdev->romsize) {
>>>>>> +                error_setg(errp, "romfile \"%s\" (%u bytes) "
>>>>>> +                           "is too large for ROM size %u",
>>>>>> +                           pdev->romfile, (uint32_t)size, pdev->romsize);
>>>>>> +                return;
>>>>>> +            }
>>>>>> +        } else {
>>>>>> +            pdev->romsize = pow2ceil(size);
>>>>>> +        }
>>>>>>         }
>>>>>>         vmsd = qdev_get_vmsd(DEVICE(pdev));
>>>>>> @@ -2365,15 +2375,18 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>>>>>         memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize,
>>>>>>                                &error_fatal);
>>>>>> -    ptr = memory_region_get_ram_ptr(&pdev->rom);
>>>>>> -    if (load_image_size(path, ptr, size) < 0) {
>>>>>> -        error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
>>>>>> -        return;
>>>>>> -    }
>>>>>> +    if (load_file) {
>>>>>> +        void *ptr = memory_region_get_ram_ptr(&pdev->rom);
>>>>>> -    if (is_default_rom) {
>>>>>> -        /* Only the default rom images will be patched (if needed). */
>>>>>> -        pci_patch_ids(pdev, ptr, size);
>>>>>> +        if (load_image_size(path, ptr, size) < 0) {
>>>>>> +            error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
>>>>>> +            return;
>>>>>> +        }
>>>>>> +
>>>>>> +        if (is_default_rom) {
>>>>>> +            /* Only the default rom images will be patched (if needed). */
>>>>>> +            pci_patch_ids(pdev, ptr, size);
>>>>>> +        }
>>>>>>         }
>>>>>>         pci_register_bar(pdev, PCI_ROM_SLOT, 0, &pdev->rom);
>>>>>
>>>>>
>>>>> So, we'll now never load the file on the migration destination. But if "pdev->romsize == -1", we'll use the size of the file to size the region -- but not load it.
>>>>>
>>>>>
>>>>> While that should work (because the ROM content will be migrated), at least I would find this easier to digest if we would have
>>>>>
>>>>> bool use_file = !runstate_check(RUN_STATE_INMIGRATE) ||
>>>>>            pdev->romsize == -1;
>>>>>
>>>>> if (use_file) {
>>>>>        path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
>>>>>        ...
>>>>> }
>>>>> ...
>>>>> memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize ...
>>>>> ...
>>>>> if (use_file) {
>>>>>        ptr = memory_region_get_ram_ptr(&pdev->rom);
>>>>>        if (load_image_size(path, ptr, size) < 0) {
>>>>>            ...
>>>>>        }
>>>>> }
>>>>>
>>>>>
>>>>> If something about the file is weird (such that reading the size would work but loading would fail), it would fail consistently. Sure, we would load once more, but who really cares about that.
>>>>>
>>>>> I wonder, though, if we then also want to handle the "pdev->romfile" checks differently, when we're not going to use the file at all ... would maybe make it more consistent. If we're not using the file, then ignore if no file is given/available ... because we don't need it. The romsize is sufficient in that case on the migration destination.
>>>>>
>>>>
>>>> Maybe, we should just deprecate unspecified romsize? And make it necessary in future?
>>>
>>> That would be quite annoying. The whole problem arises because
>>> downstream decided to override QEMU provided ROM
>>> on the command line. Users that don't do this,
>>> are ok and I do not want to make things harder for them.
>>>
>>
>> OK. Are you agree with Devid's advice to still load file, even on incoming migration, when romsize argument is absent?
> 
> I am not sure why it's ncessary and I don't much like extra file reads
> just for the heck of it. If nothing else this attempt to check file
> is readable is futile - it might not stay readable until the next
> qemu run.

In any case, fine with me

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


