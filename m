Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F617666124
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:00:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFeR5-0004M8-G4; Wed, 11 Jan 2023 11:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFeR3-0004La-CI
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:58:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFeR1-0003dj-Cm
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673456322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XsnJPAAEdRcoynex6XpPJJLGnFJJf1YQoMVkCJncBA=;
 b=L8reNc5qLnxcanMhHxsWgSXWcHlHaVZUtk/fESzrPb3dUCBNSM06wPKtUQ78nxwu6J9vc+
 yNgWhv/6+fr0C7ayRdXw6aa0i671vqcs9+gquUHZCxUtLzFTCUzRGguSp1C4qUwS2FqTqY
 msUyW4XNqIQtGstvipKvLQdgE6/Y1Qg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-eST80uAFPgWkU1OGcVm2ow-1; Wed, 11 Jan 2023 11:58:39 -0500
X-MC-Unique: eST80uAFPgWkU1OGcVm2ow-1
Received: by mail-wr1-f72.google.com with SMTP id
 b6-20020adfc746000000b002bae2b30112so2889021wrh.13
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7XsnJPAAEdRcoynex6XpPJJLGnFJJf1YQoMVkCJncBA=;
 b=hbQuXUzBIrMLFiCR0skPrthvPBTKnFjwCECnpj6Xm4wH3I5DQfXL/wZg/5R/dYXRo+
 UZPXinFTdtWbcewkzD+zOgta6dP0yxbVwPHckTyjU8ihaYPgFmaVcgpVYhqf7AiNPgxE
 IXP/0SilhNGjzbo+r/f/X/ceeLP6OHpFf/VYqhjziSvMj+tuPAos2S9t64+qWwaIyPaI
 AB0pSgHS9cTkx/I78OfXuXQMsP3vKUnQwFOBbYDyzLh6wo+88N4dnA0OwD5ZSmlN/WmV
 ui4tnf1QeqcMO9MJqQorn+2bcO1bAPxegl4pP2d2A0rv6nUJFEpb2suhmV3siJCt4YBy
 9ZiQ==
X-Gm-Message-State: AFqh2kqm4ExAigJeFeQg7/qUytTK7z16BZC/NVNNnn+YVpLjHWW2bYB5
 JVgsjhhr2at3M/gbBP9x/EcnUW80AXKjXHky+47pfBZ6OvKN+pSaFJFRBnafyj14yA2yMhVdFDc
 Vut8ASHgO/K3Z+J0=
X-Received: by 2002:a05:6000:18cb:b0:242:63e5:2451 with SMTP id
 w11-20020a05600018cb00b0024263e52451mr46621603wrq.71.1673456317668; 
 Wed, 11 Jan 2023 08:58:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXshWln2vHj2YIQPTC9sIxPXd8ORBskfr04J0xyIyTkmCHLhzTIAYmyjZ68V/arylZ1YGcH45w==
X-Received: by 2002:a05:6000:18cb:b0:242:63e5:2451 with SMTP id
 w11-20020a05600018cb00b0024263e52451mr46621589wrq.71.1673456317332; 
 Wed, 11 Jan 2023 08:58:37 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:5b00:5b3c:db46:8eb5:ee24?
 (p200300cbc7045b005b3cdb468eb5ee24.dip0.t-ipconnect.de.
 [2003:cb:c704:5b00:5b3c:db46:8eb5:ee24])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a056000054200b0022584c82c80sm14354171wrf.19.2023.01.11.08.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 08:58:36 -0800 (PST)
Message-ID: <6c017410-cdb6-6a7c-ab02-a8412e37ecba@redhat.com>
Date: Wed, 11 Jan 2023 17:58:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20221222110215.130392-2-david@redhat.com> <Y7W2LtO5/m1r3VaL@x1n>
 <d60f9272-1e81-00da-8046-2264a9b97e58@redhat.com>
 <Y7cFplyGc4hIrYZW@x1n>
 <482fadb5-7420-e07b-982d-5b0f3e8c42f8@redhat.com> <Y7xw4RqLQUFWZyfI@x1n>
 <460b6ea0-67a6-891f-f8fb-a5f23e9985c4@redhat.com>
 <c6a66296-94a7-e1ef-e0c1-098071f961d2@redhat.com> <Y73Er/n86CgQTMYu@x1n>
 <fbde8341-660b-0ed1-4f74-0afe565d5be5@redhat.com> <Y77lb+tUxWGKuQbo@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
In-Reply-To: <Y77lb+tUxWGKuQbo@x1n>
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

On 11.01.23 17:35, Peter Xu wrote:
> On Wed, Jan 11, 2023 at 02:48:09PM +0100, David Hildenbrand wrote:
>> On 10.01.23 21:03, Peter Xu wrote:
>>> On Tue, Jan 10, 2023 at 12:52:32PM +0100, David Hildenbrand wrote:
>>>> The following seems to work,
>>>
>>> That looks much better at least from the diffstat pov (comparing to the
>>> existing patch 1+5 and the framework changes), thanks.
>>>
>>>> but makes analyze-migration.py angry:
>>>>
>>>> $ ./scripts/analyze-migration.py -f STATEFILE
>>>> Traceback (most recent call last):
>>>>     File "/home/dhildenb/git/qemu/./scripts/analyze-migration.py", line 605, in <module>
>>>>       dump.read(dump_memory = args.memory)
>>>>     File "/home/dhildenb/git/qemu/./scripts/analyze-migration.py", line 539, in read
>>>>       classdesc = self.section_classes[section_key]
>>>>                   ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^
>>>> KeyError: ('0000:00:03.0/virtio-mem-early', 0)
>>>>
>>>>
>>>> We need the vmdesc to create info for the device.
>>>
>>> Migration may ignore the save entry if save_state() not provided in the
>>> "devices" section:
>>>
>>>           if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
>>>               continue;
>>>           }
>>>
>>> Could you try providing a shim save_state() for the new virtio-mem save
>>> entry?
>>>
>>> /*
>>>    * Shim function to make sure the save entry will be dumped into "devices"
>>>    * section, to make analyze-migration.py happy.
>>>    */
>>> static void virtio_mem_save_state_early(QEMUFile *file, void *opaque)
>>> {
>>> }
>>>
>>> Then:
>>>
>>> static const SaveVMHandlers vmstate_virtio_mem_device_early_ops = {
>>>       .save_setup = virtio_mem_save_setup_early,
>>>       .save_state = virtio_mem_save_state_early,
>>>       .load_state = virtio_mem_load_state_early,
>>> };
>>>
>>> I'm not 100% sure it'll work yet, but maybe worth trying.
>>
>> It doesn't. virtio_mem_load_state_early() will get called twice (once with
>> state saved during save_setup() and once with effectively nothing during
>> save_state(), which breaks the whole migration).
> 
> Oh hold on.. so load_state() to pair save_setup()? Maybe you should pair it
> with load_setup(), which I just noticed..  Then the load_state() needs to
> be another shim like save_state().

Let me see if that improves the situation. E.g., ram.c writes state in 
save_setup() but doesn't load any state in load_setup() -- it's all done 
in load_state().

... no, still not working. It will read garbage during load_setup() now.

qemu-system-x86_64: Property 'memaddr' changed from 0x100000002037261 to 
0x140000000
qemu-system-x86_64: Failed to load virtio-mem-device-early:tmp
qemu-system-x86_64: Load state of device 0000:00:03.0/virtio-mem-early 
failed
qemu-system-x86_64: load of migration failed: Invalid argument


I don't think that load_setup() is supposed to consume anything useful 
from the migration stream. I suspects it should actually not even 
consume a QEMU file right now, because they way it's used is just for 
initializing stuff.

qemu_loadvm_state_main() does the actual loading part, parsing sections 
etc. qemu_loadvm_state_setup() doesn't do any of that.

AFAIKS, at least qemu_loadvm_state_setup() would have to parse sections 
and the save_setup() users would have to be converted into using 
load_setup() as well. Not sure if more is missing.

Even with that, I doubt that it would make analyze-migration.py work, 
because what we store is something different than what we record in the 
vmdesc.

> 
>>
>> vmdesc handling is also wrong, because analyze-migration.py gets confused
>> because it receives data stored during save_setup() but vmdesc created
>> during save_state() was told that there would be "nothing" to interpret ...
>>
>> $ ./scripts/analyze-migration.py -f STATEFILE
>> {
>>      "ram (2)": {
>>          "section sizes": {
>>              "0000:00:03.0/mem0": "0x0000000f00000000",
>>              "pc.ram": "0x0000000100000000",
>>              "/rom@etc/acpi/tables": "0x0000000000020000",
>>              "pc.bios": "0x0000000000040000",
>>              "0000:00:02.0/e1000.rom": "0x0000000000040000",
>>              "pc.rom": "0x0000000000020000",
>>              "/rom@etc/table-loader": "0x0000000000001000",
>>              "/rom@etc/acpi/rsdp": "0x0000000000001000"
>>          }
>>      },
>>      "0000:00:03.0/virtio-mem-early (51)": {
>>          "data": ""
>>      }
>> }
> 
> Yeah this is expected, because the whole data stream within the setup phase
> is a black box and not described by anything.  "ram" can display correctly
> only because it's hard coded in the python script, I think.  The trick
> above can only make the script not break but not teaching the script to
> also check for the early vmsd.

Note that the issue here is that the scripts stops the output after the 
virtio-mem device. So I'm not complaining about the "data": "", but 
about the vmstate according to the vmdesc not having any other devices :)

> 
> But that's one step forward and IMHO it's fine for special devices. For
> example, even with your initial patch, I think the static analyzer (aka,
> qemu -dump-vmstate) will also ignore your new vmsd anyway because it's not
> directly bound to the DeviceState* but registered separately.  So no ideal
> solution so far, afaict, without more work done on this aspect.
> 
>>
>>
>> Not sure if the whole thing becomes nicer when manually looking up the
>> vmdesc ... because filling it will also requires manually storing the
>> se->idstr and the se->instance_id, whereby both are migration-internal and
>> not available inside save_setup().
>>
>>
>> Hm, I really prefer something like the simplified version that let's
>> migration core deal with vmstate to be migrated during save_setup() phase.
>> We could avoid the vmstate->immutable flag and simply use a separate
>> function for registering the vmstate, like:
>>
>> vmstate_register_immutable()
>> vmstate_register_early()
>> ...
> 
> I agree, this looks useful.  It's just that the devices that need this will
> be rare, and unfortunately some of them already implemented the stream in
> other ways so maybe non-trivial to convert them.

Right, I agree about the "rare" part and that conversion might be hard, 
because they are not using a vmstate descriptor.

The only way to avoid that is moving away from using a vmstate 
descriptor and storing everything manually in virtio-mem code. Not 
particularly happy about that, but it would be the only feasible option 
without touching migration code that I can see.

> 
> Not against it if you want to keep exploring, but if so please avoid using
> the priority field, also I'd hope the early vmsd will be saved within
> qemu_savevm_state_setup() so maybe it can be another alternative to
> save_setup().
> 
> Maybe it's still easier we keep going with the save_setup() and the shim
> functions above, if it works for you.

I'll happy to go the path you suggested if we can make it work. I'd be 
happy to have something "reasonable" for the virtio-mem device in the 
analyze-migration.py output. But I could live with just nothing useful 
for the device itself -- as long as at least the other devices still 
show up.

Thanks Peter!

-- 
Thanks,

David / dhildenb


