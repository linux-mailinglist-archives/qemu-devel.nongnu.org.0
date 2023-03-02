Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E7C6A7DA7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:29:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfF8-0004eN-Fo; Thu, 02 Mar 2023 04:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXfF5-0004dr-RN
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:28:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXfF3-0004qD-NH
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677749328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tirbnqMsALulo3/YTRyu7MzKt16+3QrlKqefunFEOrk=;
 b=BF/2xXQcoDCu+5k977gX+YuDsnPKEtlnR7593l04XNDKIS9sUcwG5YaPTszTbrcVVMbIfI
 h77bZHwh9j+BFv8FV77vzRG3IazfLg7v2iPqBblRl8sZNhYCm4Fj6arIWNrK+X1MNpr/SB
 8M6z+BSJNJDt1LACp0wHNdEFmp11PsU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-195-bZTdeDjiPuah6NUD_s5gvw-1; Thu, 02 Mar 2023 04:28:47 -0500
X-MC-Unique: bZTdeDjiPuah6NUD_s5gvw-1
Received: by mail-wr1-f70.google.com with SMTP id
 bx25-20020a5d5b19000000b002c7ce4ce3c3so3081864wrb.13
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 01:28:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tirbnqMsALulo3/YTRyu7MzKt16+3QrlKqefunFEOrk=;
 b=ZHyHHij0GljpOGJ2c+1JuNhkl6hdrUsYKU3/sbPhNdXL3e2rNgrfs4moXyoqEDXYt3
 irXXBQV+B3Iv1BCDyYSYWQThfWvYCKzS7qNoTPtw5FdAvvc5O3V5H4X+wwtsVdKeQyEL
 SDg/DXGQW2fEspasvrJQrbJpkvtsZOEbmhe8fIhbbOyKnxg5pTV2PRSSxKVQKLIIBYYh
 BZEuk2D/LPbN6JMthOHT3dBCTHQ1hfmM1/NHfbCVXKub3R/7p78awYV1Al9vR1Ce8Dxk
 Px5bj8n07CSNqm28a6vYnGZvfv9opdA6nmOxIUEriM51fTbEvdNM0QgrfBA/k5l9JZzu
 79oA==
X-Gm-Message-State: AO0yUKV5Oy1tZgLJ9yYjwTDBl62KGhyxCgvGjgb1CfnSdfO2z1EgT/IT
 sdbNcMSys4OEick04l/UUiuXWo4h3Jj0WWp1m3RWn4qMFV26AbwE5vnjBjgibGw8nRCsCe4fd+a
 I4SPxo+mElQTEW8M=
X-Received: by 2002:a05:600c:331c:b0:3ea:bc27:6a64 with SMTP id
 q28-20020a05600c331c00b003eabc276a64mr7699492wmp.10.1677749326145; 
 Thu, 02 Mar 2023 01:28:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+eDOPD8K7O+mU/9Ab2vU3IdeYqdupP8xugNeB0S2kaEFLHnsZuB2pTijV4AigotlGN7hL2dA==
X-Received: by 2002:a05:600c:331c:b0:3ea:bc27:6a64 with SMTP id
 q28-20020a05600c331c00b003eabc276a64mr7699473wmp.10.1677749325799; 
 Thu, 02 Mar 2023 01:28:45 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:4f00:87ba:e9e9:3821:677b?
 (p200300cbc70e4f0087bae9e93821677b.dip0.t-ipconnect.de.
 [2003:cb:c70e:4f00:87ba:e9e9:3821:677b])
 by smtp.gmail.com with ESMTPSA id
 he5-20020a05600c540500b003e2058a7109sm2294182wmb.14.2023.03.02.01.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 01:28:45 -0800 (PST)
Message-ID: <e2576d8d-0cdc-55b4-5aaa-f0e8518b25ce@redhat.com>
Date: Thu, 2 Mar 2023 10:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <cover.1677274611.git.maciej.szmigiero@oracle.com>
 <369d848fdc86994ca646a5aa4e04c4dc049d04f1.1677274611.git.maciej.szmigiero@oracle.com>
 <0953dc26-da87-65c7-9bba-fec4cfb04999@redhat.com>
 <a230f8bc-ef59-d2ad-1316-554f1a293da9@maciej.szmigiero.name>
 <f81827ce-2553-7b50-adba-a32e82f87e1f@redhat.com>
 <a0ebed14-436f-91c9-928d-e53e29d9db81@maciej.szmigiero.name>
 <eb7e7365-b8e1-2547-596a-98ffe826766f@redhat.com>
 <9f581e62-0cb3-7f0f-8feb-ddfda5bba621@maciej.szmigiero.name>
 <678fb11d-4ac8-238f-9ead-d68d59d0a8ba@redhat.com>
 <9280c056-43eb-08e6-cb63-a7e601cb4700@maciej.szmigiero.name>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH][RESEND v3 1/3] hapvdimm: add a virtual DIMM device for
 memory hot-add protocols
In-Reply-To: <9280c056-43eb-08e6-cb63-a7e601cb4700@maciej.szmigiero.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 01.03.23 23:08, Maciej S. Szmigiero wrote:
> On 1.03.2023 18:24, David Hildenbrand wrote:
> (...)
>>> With virtio-mem one can simply have per-node virtio-mem devices.
>>>
>>> 2) I'm not sure what's the overhead of having, let's say, 1 TiB backing
>>> memory device mostly marked madvise(MADV_DONTNEED).
>>> Like, how much memory + swap this setup would actually consume - that's
>>> something I would need to measure.
>>
>> There are some WIP items to improve that (QEMU metadata (e.g., bitmaps), KVM metadata (e.g., per-memslot), Linux metadata (e.g., page tables).
>> Memory overcommit handling also has to be tackled.
>>
>> So it would be a "shared" problem with virtio-mem and will be sorted out eventually :)
>>
> 
> Yes, but this might take a bit of time, especially if kernel-side changes
> are involved - that's why I will check how this setup works in practice
> in its current shape.

Yes, let me know if you have any question. I invested a lot of time to 
figure out all of the details and possible workarounds/approaches in the 
past.

>>> Hyper-V actually "cleans up" the guest memory map on reboot - if the
>>> guest was effectively resized up then on reboot the guest boot memory is
>>> resized up to match that last size.
>>> Similarly, if the guest was ballooned out - that amount of memory is
>>> removed from the boot memory on reboot.
>>
>> Yes, it cleans up, but as I said last time I checked there was this concept of startup vs. minimum vs. maximum, at least for dynamic memory:
>>
>> https://www.fastvue.co/tmgreporter/blog/understanding-hyper-v-dynamic-memory-dynamic-ram/
>>
>> Startup RAM would be whatever you specify for "-m xG". If you go below min, you remove memory via deflation once the guest is up.
> 
> 
> That article was from 2014, so I guess it pertained Windows 2012 R2.

I remember seeing the same interface when I played with that a couple of 
years ago, but I don't recall which windows version i was using.

> 
> The memory settings page in more recent Hyper-V versions looks like on
> the screenshot at [1].
> 
> It no longer calls that main memory amount value "Startup RAM", now it's
> just "RAM".
> 
> Despite what one might think the "Enable Dynamic Memory" checkbox does
> *not* control the Dynamic Memory protocol availability or usage - the
> protocol is always available/exported to the guest.
> 
> What the "Enable Dynamic Memory" checkbox controls is some host-side
> heuristics that automatically resize the guest within chosen bounds
> based on some metrics.
> 
> Even if the "Enable Dynamic Memory" checkbox is *not* enabled the guest
> can still be online-resized via Dynamic Memory protocol by simply
> changing the value in the "RAM" field and clicking "Apply".
> 
> At least that's how it works on Windows 2019 with a Linux guest.

Right, I recall that that's a feature that was separately announced as 
explicit VM resizing, not HV dynamic memory. It uses the same underlying 
mechanism, yes, which is why the feature is always exposed to the VMs.

That's most probably when they performed the "Startup RAM" -> "RAM" 
rename, to make both features possibly co-exist and easier to configure.

> 
>>>
>>> So it's not exactly doing a hot-add after the guest boots.
>>
>> I recall BUG reports in Linux, that we got hv-balloon hot-add requests ~1 minute after Linux booted up, because of the above reason of startup memory [in these BUG reports, memory onlining was disabled and the VM would run out of memory because we hotplugged too much memory]. That's why I remember that this approach once was done.
>>
>> Maybe there are multiple implementations noways. At least in QEMU you could chose whatever makes most sense for QEMU.
>>
> 
> Right, it seems that the Hyper-V behavior evolved with time, too.

Yes. One could think of a split approach, that is, we never resize the 
initial RAM size (-m XG) from inside QEMU. Instead, we could have the 
following models:

(1) Basic "Startup RAM" model: always (re)boot Linux with "-m XG". On
     reboot. Once the VM comes up, we either add memory or request to
     inflate the balloon, to reach the previous guest size. Whenever the
     VM reboots, we first defrag all hv-balloon provided memory ("one
     contiguous chunk") to then "add" that memory to the VM. If the
     logical VM size <= requested, this hv-balloon memory size would be
     "0". Essentially resembling the "old" HV dynamic memory approach.

(2) Extended "Startup RAM" mode: Same as (1), but instead of hot-adding
     the RAM after the guest came up, we simply defrag the
     hv-balloon RAM during reboot ("one contiguous chunk") and expose it
     via e820/SRAT ot the guest. Going "below" startup RAM will still
     require inflation once the guest is up.

(3) External "Resize" mode: On reboot, simply shutdown the VM and notify
     libvirt. Libvirt will restart the VM with adjusted "Startup RAM".

It's fairly straight forward to extend (1) to achieve (2). That could be 
a sane default for QEMU. However wants (3) can simply let libvirt handle 
it on top without any special handling.

Internal resize mode is tricky, especially regarding migration. With 
sufficient motivation and problem solving one might be able to turn (1) 
or (2) into such a (4) mode. It would just be an implementation detail.


Note that I never considered the "go below initial RAM" and "resize 
initial RAM" really relevant for virtio-mem. Instead, you chose the 
startup size to be reasonably small (e.g., 4 GiB) and expose memory via 
the virtio-mem devices right at QEMU startup ("requested-size=XG"). The 
same approach could be applied to the hv-balloon model.

One main reason to decide against resizing significantly below 4G was, 
for example, that you'll end up losing valuable DMA/DMA32 memory the 
lower you go -- that no hotplugged memory will provide. So using 
inflation for everything < 4G does not sound too crazy to me, and could 
avoid mode (3) altogether. But again, just my thoughts.

-- 
Thanks,

David / dhildenb


