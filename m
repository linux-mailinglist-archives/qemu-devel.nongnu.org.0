Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E584B423CD0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:26:53 +0200 (CEST)
Received: from localhost ([::1]:51296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY54V-000547-Vp
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mY4o7-0004YP-Fo
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mY4o5-0004UR-8i
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633518592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DuPRQoTyFtzK+BpyMMasefA7AgGeDRuVWF3Sn1FjOrI=;
 b=AvixaF3GKdZaA9X3jra2gh0pbME5pYiJTaWK4B82e3W5IG5Zs8JL8sV+IElhfLTQ+He0vh
 4HWmvfKDggkGhMbEzzGdcYFmeg6f9B7HQ1DnTNzyoAZdNI5IUS//iWpmGjni/DEFzMVWhu
 EwTF7bRIYdLNnnvKA1uuN/dLBwlzCvU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-cEceGOp_O0afJVswbFx_ew-1; Wed, 06 Oct 2021 07:09:49 -0400
X-MC-Unique: cEceGOp_O0afJVswbFx_ew-1
Received: by mail-wr1-f71.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso1728153wrb.4
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 04:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DuPRQoTyFtzK+BpyMMasefA7AgGeDRuVWF3Sn1FjOrI=;
 b=g1P8FsNn+0RexMuwUbaf67nlouW25KydqhVwHokiR1BH+ZDIXiOa95QmLzp5sYPp15
 NuYmr71ve2l4clnsRQHGQDE1XgfGgXmIbbG8oMt97ErkSlnArfr0WyPcEPQ7ktn50UnD
 UzkZ1nkMDJgLh1iKrK2YW9/Qd4ngzAwsx70Sh/Fpq0m5riHo6ydqaonm5PPaQFTc0GFn
 pqBL0NUEkTFQMCRiJ2gsguGc2kvg+MlaGU8WjUxH6Yl8TJRXsxbOUlIBPTVPdxePG3YQ
 7TAfbp2ALkQ77/R6XQXuqxXhscdjeCbyeJhfE6R0F55zjrZr02FVZAdUdFJAZC2nFTu5
 lXqw==
X-Gm-Message-State: AOAM531w2s3/F5ErPOPHgLeonBH3ZK0wxq7FgLv93f2OdotlIZUPLBM5
 v/H6J7EKxEKPI8gqaNwYNYKlE14vafAjLw0xksQGMKI1/2/FRwjwU3IWe01yH2pPR+suLY4z89s
 6dDmv6BZq+0WjhuI=
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr9366162wmc.117.1633518588386; 
 Wed, 06 Oct 2021 04:09:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy98lV6jeULrjmty+ayWTC/LYI0YmW5yk73n7ihZr61eucTwNxWZONGOa2m8ioFyRAhBe6ZTQ==
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr9366133wmc.117.1633518588069; 
 Wed, 06 Oct 2021 04:09:48 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.3.114])
 by smtp.gmail.com with ESMTPSA id e15sm4173066wrr.38.2021.10.06.04.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 04:09:47 -0700 (PDT)
Message-ID: <30ccf623-44a7-bcb4-77c9-f1d2e5e16c6c@redhat.com>
Date: Wed, 6 Oct 2021 13:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 09/11] qdev: Avoid QemuOpts in QMP device_add
To: Kevin Wolf <kwolf@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-10-kwolf@redhat.com>
 <89bbeed4-dec6-007a-175e-38a12e5bbfa1@greensocs.com>
 <YVGtXMq+JGKIIUrQ@redhat.com> <YVxjLf9vJlBqeKKh@redhat.com>
 <ea36ef56-4892-5b29-e660-964e6018e154@greensocs.com>
 <YVyMf7HCXGBXZQxI@redhat.com> <87v92ak1hb.fsf@secure.mitica>
 <09d60929-4669-e3ac-2292-bff5c83ebe24@redhat.com>
 <YV2AOX6NSGwy1pDO@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <YV2AOX6NSGwy1pDO@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 quintela@redhat.com, libvir-list@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, its@irrelevant.dk,
 pbonzini@redhat.com, jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/10/2021 12:53, Kevin Wolf wrote:
> Am 06.10.2021 um 11:20 hat Laurent Vivier geschrieben:
>> On 06/10/2021 10:21, Juan Quintela wrote:
>>> Kevin Wolf <kwolf@redhat.com> wrote:
>>>> Am 05.10.2021 um 17:52 hat Damien Hedde geschrieben:
>>>
>>> Hi
>>>
>>>>>> Usage
>>>>>> -----
>>>>>>
>>>>>> The primary device can be hotplugged or be part of the startup
>>>>>> configuration
>>>>>>
>>>>>>     -device virtio-net-pci,netdev=hostnet1,id=net1,
>>>>>>             mac=52:54:00:6f:55:cc,bus=root2,failover=on
>>>>>>
>>>>>> With the parameter failover=on the VIRTIO_NET_F_STANDBY feature
>>>>>> will be enabled.
>>>>>>
>>>>>> -device vfio-pci,host=5e:00.2,id=hostdev0,bus=root1,
>>>>>>           failover_pair_id=net1
>>>>>>
>>>>>> failover_pair_id references the id of the virtio-net standby device.
>>>>>> This is only for pairing the devices within QEMU. The guest kernel
>>>>>> module net_failover will match devices with identical MAC addresses.
>>>>>>
>>>>>> Hotplug
>>>>>> -------
>>>>>>
>>>>>> Both primary and standby device can be hotplugged via the QEMU
>>>>>> monitor.  Note that if the virtio-net device is plugged first a
>>>>>> warning will be issued that it couldn't find the primary device.
>>>>>
>>>>> So maybe this whole primary device lookup can happen during the -device CLI
>>>>> option creation loop. And we can indeed have un-created devices still in the
>>>>> list ?
>>>>
>>>> Yes, that's the only case for which I could imagine for an inconsistency
>>>> between the qdev tree and QemuOpts, but failover_add_primary() is only
>>>> called after feature negotiation with the guest driver, so we can be
>>>> sure that the -device loop has completed long ago.
>>>>
>>>> And even if it hadn't completed yet, the paragraph also says that even
>>>> hotplugging the device later is supported, so creating devices in the
>>>> wrong order should still succeed.
>>>>
>>>> I hope that some of the people I added to CC have some more hints.
>>>
>>> Failover is ... interesting.
>>>
>>> You have two devices: primary and seconday.
>>> seconday is virtio-net, primary can be vfio and some other emulated
>>> devices.
>>>
>>> In the command line, devices can appear on any order, primary then
>>> secondary, secondary then primary, or only one of them.
>>> You can add (any of them) later in the toplevel.
>>>
>>> And now, what all this mess is about.  We only enable the primary if the
>>> guest knows about failover.  Otherwise we use only the virtio device
>>> (*).  The important bit here is that we need to wait until the guest is
>>> booted, and the virtio-net driver is loaded, and then it tells us if it
>>> understands failover (or not).  At that point we decide if we want to
>>> "really" create the primary.
>>>
>>> I know that it abuses device_add() as much as it can be, but I can't see
>>> any better way to handle it.  We need to be able to "create" a device
>>> without showing it to the guest.  And later, when we create a different
>>> device, and depending of driver support on the guest, we "finish" the
>>> creation of the primary device.
>>>
>>> Any good idea?
> 
> Hm, the naive idea would be creating the device without attaching it to
> any bus. But I suppose qdev doesn't let you do that.
> 
> Anyway, the part that I missed yesterday is that qdev_device_add()
> already skips creating the device if qdev_should_hide_device(), which
> explains how the inconsistency is created.
> 
> (As an aside, it then returns NULL without setting an error to
> indicate success, which is an awkward interface, and sure enough,
> qmp_device_add() gets it wrong and deletes the QemuOpts again. So
> hotplugging the virtio-net standby device doesn't even seem to work?)
> 
> Could we just save the configuration in the .hide_device callback (i.e.
> failover_hide_primary_device() in virtio-net) to a new field in
> VirtIONet and then use that when actually creating the device instead of
> accessing the command line state in the QemuOptsList?
> 
> It seems that we can currently add two primary devices that are then
> both hidden. failover_add_primary() adds only one of them, leaving the
> other one hidden. Is this a bug and we should reject such a
> configuration or do we need to support keeping configurations for
> multiple primary devices in a single standby device?
> 
> This would still be ugly because the configuration is only really
> validated when the primary device is actually added instead of
> immediately on -device/device_add, but at least it would keep the
> ugliness more local and wouldn't block the move away from QemuOpts (the
> config would just be stored as a QDict after my patches).
> 
>> I don't know if it can help the discussion, but I'm reformatting the
>> failover code to move all the PCI stuff to pci files.
>>
>> And there is a lot of inconsistencies regarding the device_add and --device
>> option so I've been in the end to add a list of of hidden devices rather
>> than relying on the command line.
>>
>> See PATCH 8 of series "[RFC PATCH v2 0/8] virtio-net failover cleanup and new features"
>>
>> https://patchew.org/QEMU/20210820142002.152994-1-lvivier@redhat.com/
> 
> While it's certainly an improvement over the current state, we really
> should move away from QemuOpts and I think using global state for this

I totally agree with that.

> is wrong anyway. So it feels like it's not the change we need here, but
> more a step sideways.

Yes, I wanted to fix the problem without modifying to much the existing code.

> But thanks for mentioning this series here, we might get some merge
> conflicts there. I'll try to remember to CC you for v2 of this series.

Thank you. I'll try to find a better solution based on your series.

Laurent


