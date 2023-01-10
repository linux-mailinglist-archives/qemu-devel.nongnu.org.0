Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5B1663ECD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 12:01:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFBiN-0001jV-Ow; Tue, 10 Jan 2023 05:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFBiL-0001iu-Ma
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:18:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFBiJ-0002Oj-HH
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673345918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qBd+bEDUpoLhZ/tcqATcx+w5W8QAZcSBEK8CRtAG2k4=;
 b=RTtBf4wAkcSbQf8NFT3824S7FDKG712Hj888NVSO3Bl2btzzUYup5WHFWZlJ40L+7o3n6E
 5cRj0ZkzWDy5PEU/01TtjHUl+AJPcSS+/VNczcl10+i4GMRGfrRFXU3uibQ+A6Gr+EcboR
 4pctZVbOaWTMzUccG1NCybRFksasp3Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-NkpT73B8PoeqNL-ggUKKaQ-1; Tue, 10 Jan 2023 05:18:36 -0500
X-MC-Unique: NkpT73B8PoeqNL-ggUKKaQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v23-20020a05600c215700b003d9e9974a05so3841042wml.8
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 02:18:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qBd+bEDUpoLhZ/tcqATcx+w5W8QAZcSBEK8CRtAG2k4=;
 b=Y1dJQcYmJn8hKueYZWb67cYwHPL2AXFFTN84ycNVjbb5ESaaqcfeaZpJKevGzUAZn8
 FUh++8HCmqvkd82xBBMfWi5zYULydi3zHS/sGZNmV5mQ+7DCavWhVHlCbGwSafAB8nMO
 DHIr1rIfE0pg3M3yQGASL17X34jQ9XkgR4lkYdFZqKsMy8bFgi6/x0geD48vQknch7Wn
 +k7HX+iOlp7PV0TkOBSSFYr+gMPe2YH5lzGtNLAOD3zOyKPhuxVkqhwW/XcDVZZz5GP5
 t0ou0P66OV5+tYlpJtyydodnSjtwtvAT8ikgyEAMdFlaZPnnbMPvww9Bh1ROEQksO615
 R2aA==
X-Gm-Message-State: AFqh2kqAJ5UjSqZx+7N/8F08V2kRI/+1Uz6uHEE3SThAQ9x/0YcqRlpJ
 5EFvn48YfmQr9sUdDnjaPkKTOqhMB4X+rK7nVoL3XgxWz65Wg+xhvPoCo4vp7MncWdw1O3H1xQK
 mlKHAQC0SlliT7OU=
X-Received: by 2002:a7b:ca4f:0:b0:3d3:56ce:5673 with SMTP id
 m15-20020a7bca4f000000b003d356ce5673mr51317883wml.6.1673345915758; 
 Tue, 10 Jan 2023 02:18:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuDum4okJe96fVNrTjxJspz8+067gYjrl0eOBkxm/YU/DO0U5Bk3vFgbu/B+pI+sY3pLhssYg==
X-Received: by 2002:a7b:ca4f:0:b0:3d3:56ce:5673 with SMTP id
 m15-20020a7bca4f000000b003d356ce5673mr51317862wml.6.1673345915390; 
 Tue, 10 Jan 2023 02:18:35 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:4200:65d9:4d0d:bb61:14c8?
 (p200300cbc708420065d94d0dbb6114c8.dip0.t-ipconnect.de.
 [2003:cb:c708:4200:65d9:4d0d:bb61:14c8])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c3b8e00b003b49bd61b19sm21404155wms.15.2023.01.10.02.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 02:18:34 -0800 (PST)
Message-ID: <460b6ea0-67a6-891f-f8fb-a5f23e9985c4@redhat.com>
Date: Tue, 10 Jan 2023 11:18:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-2-david@redhat.com> <Y7W2LtO5/m1r3VaL@x1n>
 <d60f9272-1e81-00da-8046-2264a9b97e58@redhat.com> <Y7cFplyGc4hIrYZW@x1n>
 <482fadb5-7420-e07b-982d-5b0f3e8c42f8@redhat.com> <Y7xw4RqLQUFWZyfI@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
In-Reply-To: <Y7xw4RqLQUFWZyfI@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 09.01.23 20:54, Peter Xu wrote:
> On Mon, Jan 09, 2023 at 03:34:48PM +0100, David Hildenbrand wrote:
>> On 05.01.23 18:15, Peter Xu wrote:
>>> On Thu, Jan 05, 2023 at 09:35:54AM +0100, David Hildenbrand wrote:
>>>> On 04.01.23 18:23, Peter Xu wrote:
>>>>> On Thu, Dec 22, 2022 at 12:02:10PM +0100, David Hildenbrand wrote:
>>>>>> Migrating device state before we start iterating is currently impossible.
>>>>>> Introduce and use qemu_savevm_state_start_precopy(), and use
>>>>>> a new special migration priority -- MIG_PRI_POST_SETUP -- to decide whether
>>>>>> state will be saved in qemu_savevm_state_start_precopy() or in
>>>>>> qemu_savevm_state_complete_precopy_*().
>>>>>
>>>>> Can something like this be done in qemu_savevm_state_setup()?
>>>>
>>>> Hi Peter,
>>>
>>> Hi, David,
>>>
>>>>
>>>> Do you mean
>>>>
>>>> (a) Moving qemu_savevm_state_start_precopy() effectively into
>>>>       qemu_savevm_state_setup()
>>>>
>>>> (b) Using se->ops->save_setup()
>>>
>>> I meant (b).
>>>
>>>>
>>>> I first tried going via (b), but decided to go the current way of using a
>>>> proper vmstate with properties (instead of e.g., filling the stream
>>>> manually), which also made vmdesc handling possible (and significantly
>>>> cleaner).
>>>>
>>>> Regarding (a), I decided to not move logic of
>>>> qemu_savevm_state_start_precopy() into qemu_savevm_state_setup(), because it
>>>> looked cleaner to save device state with the BQL held and for background
>>>> snapshots, the VM has been stopped. To decouple device state saving from the
>>>> setup path, just like we do it right now for all vmstates.
>>>
>>> Is BQL required or optional?  IIUC it's at least still not taken in the
>>> migration thread path, only in savevm path.
>>>
>>>>
>>>> Having that said, for virtio-mem, it would still work because that state is
>>>> immutable once migration starts, but it felt cleaner to separate the setup()
>>>> phase from actual device state saving.
>>>
>>> I get the point.  My major concerns are:
>>>
>>>     (1) The new migration priority is changing the semantic of original,
>>>         making it over-complicated
>>>
>>>     (2) The new precopy-start routine added one more step to the migration
>>>         framework, while it's somehow overlapping (if not to say, mostly the
>>>         same as..) save_setup().
>>>
>>> For (1): the old priority was only deciding the order of save entries in
>>> the global list, nothing more than that.  Even if we want to have a
>>> precopy-start phase, I'd suggest we use something else and keep the
>>> migration priority simple.  Otherwise we really need serious documentation
>>> for MigrationPriority and if so I'd rather don't bother and not reuse the
>>> priority field.
>>>
>>> For (2), if you see there're a bunch of save_setup() that already does
>>> things like transferring static data besides the device states.  Besides
>>> the notorious ram_save_setup() there's also dirty_bitmap_save_setup() which
>>> also sends a bitmap during save_setup() and some others.  It looks clean to
>>> me to do it in the same way as we used to.
>>>
>>> Reusing vmstate_save() and vmsd structures are useful too which I totally
>>> agree.  So.. can we just call vmstate_save_state() in the save_setup() of
>>> the other new vmsd of virtio-mem?
>>
>>
>> I went halfway that way, by moving stuff into qemu_savevm_state_setup()
>> and avoiding using a new migration priority. Seems to work:
> 
> The whole point of my suggestion is not moving things into
> qemu_savevm_state_setup(), but avoid introducing more complexity to the
> migration framework if unnecessary, so keep the generic framework as simple
> as possible.

IMHO, the current approach is actually quite simple and clean. But ...
> 
>>
>> I think we could go one step further and perform it from a save_setup() callback,
>> however, I'm not convinced that this gets particularly cleaner (vmdesc handling
>> eventually).
> 
> What I wanted to suggest is exactly trying to avoid vmsd handling.  To be
> more explicit, I mean: besides vmstate_virtio_mem_device_early, virtio-mem
> can register with another new SaveVMHandlers with both save_setup and
> load_setup registered, then e.g. in its save_setup(), one simply calls:

... I can see if it can be made working that way and how the result looks. I know
that we use vmstate_save_state() from virtio code, but I don't remember using
it in save_setup() from QEMU_VM_SECTION_START and not QEMU_VM_SECTION_FULL.


There is this interesting bit in register_savevm_live(), which sets "se->is_ram = 1".
qemu_save_device_state() will not include the state. As it's used by XEN, I don't
particularly care.


> 
>    vmstate_save_state(f, &vmstate_virtio_mem_device_early, virtio_mem_dev,
>                       NULL);
> 
> I'm not sure whether the JSONWriter* is required in this case, maybe not
> yet to at least make it work.

It was required when handling vmstates the current way to make
analyze-migration.py not bail out (which is a good thing because one can
actually inspect the migration content):

$ ./scripts/analyze-migration.py -f STATEFILE
{
     "ram (2)": {
         "section sizes": {
             "0000:00:03.0/mem0": "0x0000000f00000000",
             "pc.ram": "0x0000000100000000",
             "/rom@etc/acpi/tables": "0x0000000000020000",
             "pc.bios": "0x0000000000040000",
             "0000:00:02.0/e1000.rom": "0x0000000000040000",
             "pc.rom": "0x0000000000020000",
             "/rom@etc/table-loader": "0x0000000000001000",
             "/rom@etc/acpi/rsdp": "0x0000000000001000"
         }
     },
     "0000:00:03.0/virtio-mem-device-early (51)": {
         "tmp": "00 00 00 01 40 00 00 00 00 00 00 0f 00 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00",
         "size": "0x0000000000000000",
         "bitmap": "00 00 00 00 00 00 00 00 00 00
	...
     },
     "timer (0)": {
...

> 
> We'll need to impl the load part, but then IIUC we don't need to touch the
> migration framework at all, and we keep all similar things (like other
> devices I mentioned) to be inside save_setup().
> 
> Would that work?

Let me play with it.

-- 
Thanks,

David / dhildenb


