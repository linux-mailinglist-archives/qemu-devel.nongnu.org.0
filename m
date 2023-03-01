Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE536A7207
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 18:26:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXQBy-0008Iw-F4; Wed, 01 Mar 2023 12:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXQBw-0008IR-QB
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:24:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXQBu-0004LY-Tk
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677691473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QiaK3eyOHRsn+cYJrCBY6HcRSJIkHzR3MXsEQBh2Gsw=;
 b=Q/vJwS16kY4+RdGBHkiXuAIFl5d2XSEZa2MfCyuNFnl1EK/6Rwy75eGvz3Yv1Mt0nuLNKn
 bvC3zszd5+YdUQBm438FyJByPnXENA2ONeE9fIbyyFnGM2sxy/hhA7VDc7jSHA6iJ69WDh
 iJ/k5erkcq271pdqvPN5sE6nLPg5A7w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-HaIeSFjTOoCN0pqwAwBmOw-1; Wed, 01 Mar 2023 12:24:32 -0500
X-MC-Unique: HaIeSFjTOoCN0pqwAwBmOw-1
Received: by mail-wr1-f70.google.com with SMTP id
 15-20020a056000156f00b002ca79db6d42so2496124wrz.18
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 09:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QiaK3eyOHRsn+cYJrCBY6HcRSJIkHzR3MXsEQBh2Gsw=;
 b=p+jo3Q7kYRder/oMkkf/8Eq7SJpczdln/hWAnQRcU3bQy6dlvSHCsmfMFblpkXOiXh
 P70V/HVWmL19G6/fHXU9aaQsXABCljqub6at+6hewf3jPc9FjI4Z03WNumnMb8sHeFcP
 VFvVuJHj/XL5LUlMq/cKEQWO+nXjeX3r4bH8Vr9HhbcpMkg/icLYBfFreRezKe3tI8HV
 VdR3kn+KsCtF/Ad063tFEXnNZTK2z5htK2tXXsNx8IPVbcz5nhgXS9fgnZU7jG/B6EBG
 RTv+N5Qsz/z0qpAm/7Jb/GkDxGTbyxOO1Wu5FV3xaaxboSStPV/u8L4I2YTf4LNarzqi
 UxIQ==
X-Gm-Message-State: AO0yUKUprwnt1MN66Wh4zBoQyllnBLZqKUGoNcKHjg+HQCTZ3dYIIRXf
 LBfDj0BsU2wWzEh2oW7v/jI/Gacc9YB7EmARu7P/tLSTNsdWNMcMp/mrNtRhbPbCU7CwcQ5mkVh
 bPX+K2a86tVZMJmI=
X-Received: by 2002:adf:de8e:0:b0:2cc:4dac:fe3e with SMTP id
 w14-20020adfde8e000000b002cc4dacfe3emr4982154wrl.62.1677691470747; 
 Wed, 01 Mar 2023 09:24:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8lI3N1h0t6r8oLAX63/1MgUFJghprV6jDJNEarebECuaDoWbAef+mjBxru6tnFuTHkMM6nLg==
X-Received: by 2002:adf:de8e:0:b0:2cc:4dac:fe3e with SMTP id
 w14-20020adfde8e000000b002cc4dacfe3emr4982130wrl.62.1677691470319; 
 Wed, 01 Mar 2023 09:24:30 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:2e00:bb88:51b5:dbe8:1ba7?
 (p200300cbc7032e00bb8851b5dbe81ba7.dip0.t-ipconnect.de.
 [2003:cb:c703:2e00:bb88:51b5:dbe8:1ba7])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d4c47000000b002c5534db60bsm13082300wrt.71.2023.03.01.09.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 09:24:29 -0800 (PST)
Message-ID: <678fb11d-4ac8-238f-9ead-d68d59d0a8ba@redhat.com>
Date: Wed, 1 Mar 2023 18:24:28 +0100
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH][RESEND v3 1/3] hapvdimm: add a virtual DIMM device for
 memory hot-add protocols
In-Reply-To: <9f581e62-0cb3-7f0f-8feb-ddfda5bba621@maciej.szmigiero.name>
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

> 
> The idea would seem reasonable, but: (there's always some "but")
> 1) Once we implement NUMA support we'd probably need multiple
> TYPE_MEMORY_DEVICEs anyway, since it seems one memdev can sit on only
> one NUMA node,
> 

Not necessarily. You could extend the hv-balloon device to have one 
memslot for each NUMA node. Of course, once again, you have to plan 
ahead how to distribute memory across NUMA nodes (same with virtio-mem).

Having that said, last time I checked, HV dynamic memory was 
force-disabled when enabling vNUMA under HV. Simply because balloon 
inflation is not NUMA aware.

> With virtio-mem one can simply have per-node virtio-mem devices.
> 
> 2) I'm not sure what's the overhead of having, let's say, 1 TiB backing
> memory device mostly marked madvise(MADV_DONTNEED).
> Like, how much memory + swap this setup would actually consume - that's
> something I would need to measure.

There are some WIP items to improve that (QEMU metadata (e.g., bitmaps), 
KVM metadata (e.g., per-memslot), Linux metadata (e.g., page tables).
Memory overcommit handling also has to be tackled.

So it would be a "shared" problem with virtio-mem and will be sorted out 
eventually :)

> 
> 3) In a public cloud environment malicious guests are a possibility.
> Currently (without things like resizable memslots) the best idea I tried
> was to place the whole QEMU process into a memory-limited cgroup
> (limited to the guest target size).

Yes. Protection of unplugged memory is on my TODO list for virtio-mem as 
well, to avoid having to rely on cgroups.

> 
> There are still some issues with it: one needs to reserve swap space up
> to the guest maximum size so the QEMU process doesn't get OOM-killed if
> guest touches that memory and the cgroup memory controller for some
> reason seems to start swapping even before reaching its limit (that's
> still under investigation why).

Yes, putting a memory cap on Linux was always tricky.

> 
>> Reboot? Logically unplug all memory and as the guest boots up, re-add the memory after the guest booted up.
>>
>> The only thing we can't do is the following: when going below 4G, we cannot resize boot memory.
>>
>>
>> But I recall that that's *exactly* how the HV version I played with ~2 years ago worked: always start up with some initial memory ("startup memory"). After the VM is up for some seconds, we either add more memory (requested > startup) or request the VM to inflate memory (requested < startup).
> 
> Hyper-V actually "cleans up" the guest memory map on reboot - if the
> guest was effectively resized up then on reboot the guest boot memory is
> resized up to match that last size.
> Similarly, if the guest was ballooned out - that amount of memory is
> removed from the boot memory on reboot.

Yes, it cleans up, but as I said last time I checked there was this 
concept of startup vs. minimum vs. maximum, at least for dynamic memory:

https://www.fastvue.co/tmgreporter/blog/understanding-hyper-v-dynamic-memory-dynamic-ram/

Startup RAM would be whatever you specify for "-m xG". If you go below 
min, you remove memory via deflation once the guest is up.

> 
> So it's not exactly doing a hot-add after the guest boots.

I recall BUG reports in Linux, that we got hv-balloon hot-add requests 
~1 minute after Linux booted up, because of the above reason of startup 
memory [in these BUG reports, memory onlining was disabled and the VM 
would run out of memory because we hotplugged too much memory]. That's 
why I remember that this approach once was done.

Maybe there are multiple implementations noways. At least in QEMU you 
could chose whatever makes most sense for QEMU.


> This approach (of resizing the boot memory) also avoids problems if the
> guest loses hot-add / ballooning capability after a reboot - for example,
> rebooting into a Linux guest from Windows with hv-balloon.

TBH, I wouldn't be too concerned about that scenario ("hotplugged memory 
to a guest, guest reboots into a weird OS, weird OS isn't able to use 
hotplugged memory). For virtio-mem, the important part was that you 
always "know" how much memory the VM is aware about. If you always start 
with "Startup memory" and hotadd later (only if you detected guest 
support after a bootup), you can handle that scenario.

> 
> But unfortunately such resizing the guest boot memory seems not trivial
> to implement in QEMU.

Yes, avoiding changing memory layout to keep memory migration feasible 
was another thing I considered when designing virtio-mem.


Anyhow, I'm just throwing out ideas here on how to eventually handle it 
differently.

-- 
Thanks,

David / dhildenb


