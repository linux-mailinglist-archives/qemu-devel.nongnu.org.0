Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C886E423A78
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 11:21:55 +0200 (CEST)
Received: from localhost ([::1]:42860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY37a-0001nD-KA
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 05:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mY36H-00010h-La
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mY36E-0007H5-T2
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633512030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69+4YI6GBNvIYXNfLnwYz58BkMR4j8WtHUGNv2Rrj78=;
 b=JvnZQ7kLEJlPtnC9KTiKPugU42AkSf9fJ0m6VLIcUVtpfndz5+m9et2nry91IPxIT6EUP0
 IEaOWMfers2IMLVpgGa7tLQWptV6oepXQkcXEa9jO28nz3NugL9nMN2WjTyWTikmBIef4v
 fynq9WVpbnrm9RyB6bR+MA5zb9yHMCI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-_02YHa_ePqK3FbOqy639lQ-1; Wed, 06 Oct 2021 05:20:27 -0400
X-MC-Unique: _02YHa_ePqK3FbOqy639lQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso1505359wrg.1
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 02:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=69+4YI6GBNvIYXNfLnwYz58BkMR4j8WtHUGNv2Rrj78=;
 b=Ib/pDFOjE+6tga6/y+ZX1iZn7wPsf1nQiPXXwgnpkJp5Qxer7NDpUmcCNlMzYgQHHF
 NBKVvW38+BSwwTekpDzPD2Lgpa3PEP6r0s4g6h2qgj/m8ZtZyG5A3oUhXPFFmPWUvgp1
 8+ci57x2JqdkOyC8Co9uU+krw/OUW7w88T5clIMWLNd91CvaHAYJvkZ3Q6j8/dCmLn/c
 NX349hlzlwuGYdH0aGFRaXQgtmFnTY2heKfCEPtT6dxmNAzxIciphpzrHhPlnwDChBmB
 OTnOkLggTSxhe1je+xP/sQLWI4/xCKiZS8XjYzZ+PRYVhd5xTHTfdBhQGNYYshw0k+0K
 Bmpw==
X-Gm-Message-State: AOAM532N2mfChr2cB9kHIYlqydEj5vdBBP5A63Txn7mJOwKzIZz7XlZ9
 YNnmnF2VgFJDIK9Bp3EGcbXSRfkzSzpB0pIEjVSH9qugIChR2UuHsHuXAcgREMNZIRlTPER87+g
 +wNGttvW91xo9Z50=
X-Received: by 2002:adf:a3da:: with SMTP id m26mr7423789wrb.336.1633512026688; 
 Wed, 06 Oct 2021 02:20:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDHx74AkDcLUB4Uygr4FFOxmwsKcL1HENgivvAwXoxaoaRPkSrzzxDjMW5MP5Ruesl9FssWA==
X-Received: by 2002:adf:a3da:: with SMTP id m26mr7423755wrb.336.1633512026417; 
 Wed, 06 Oct 2021 02:20:26 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.3.114])
 by smtp.gmail.com with ESMTPSA id l6sm1546152wrm.17.2021.10.06.02.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 02:20:25 -0700 (PDT)
Message-ID: <09d60929-4669-e3ac-2292-bff5c83ebe24@redhat.com>
Date: Wed, 6 Oct 2021 11:20:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 09/11] qdev: Avoid QemuOpts in QMP device_add
To: quintela@redhat.com, Kevin Wolf <kwolf@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-10-kwolf@redhat.com>
 <89bbeed4-dec6-007a-175e-38a12e5bbfa1@greensocs.com>
 <YVGtXMq+JGKIIUrQ@redhat.com> <YVxjLf9vJlBqeKKh@redhat.com>
 <ea36ef56-4892-5b29-e660-964e6018e154@greensocs.com>
 <YVyMf7HCXGBXZQxI@redhat.com> <87v92ak1hb.fsf@secure.mitica>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87v92ak1hb.fsf@secure.mitica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 mst@redhat.com, libvir-list@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com,
 jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/10/2021 10:21, Juan Quintela wrote:
> Kevin Wolf <kwolf@redhat.com> wrote:
>> Am 05.10.2021 um 17:52 hat Damien Hedde geschrieben:
> 
> Hi
> 
>>>> Usage
>>>> -----
>>>>
>>>> The primary device can be hotplugged or be part of the startup
>>>> configuration
>>>>
>>>>    -device virtio-net-pci,netdev=hostnet1,id=net1,
>>>>            mac=52:54:00:6f:55:cc,bus=root2,failover=on
>>>>
>>>> With the parameter failover=on the VIRTIO_NET_F_STANDBY feature
>>>> will be enabled.
>>>>
>>>> -device vfio-pci,host=5e:00.2,id=hostdev0,bus=root1,
>>>>          failover_pair_id=net1
>>>>
>>>> failover_pair_id references the id of the virtio-net standby device.
>>>> This is only for pairing the devices within QEMU. The guest kernel
>>>> module net_failover will match devices with identical MAC addresses.
>>>>
>>>> Hotplug
>>>> -------
>>>>
>>>> Both primary and standby device can be hotplugged via the QEMU
>>>> monitor.  Note that if the virtio-net device is plugged first a
>>>> warning will be issued that it couldn't find the primary device.
>>>
>>> So maybe this whole primary device lookup can happen during the -device CLI
>>> option creation loop. And we can indeed have un-created devices still in the
>>> list ?
>>
>> Yes, that's the only case for which I could imagine for an inconsistency
>> between the qdev tree and QemuOpts, but failover_add_primary() is only
>> called after feature negotiation with the guest driver, so we can be
>> sure that the -device loop has completed long ago.
>>
>> And even if it hadn't completed yet, the paragraph also says that even
>> hotplugging the device later is supported, so creating devices in the
>> wrong order should still succeed.
>>
>> I hope that some of the people I added to CC have some more hints.
> 
> Failover is ... interesting.
> 
> You have two devices: primary and seconday.
> seconday is virtio-net, primary can be vfio and some other emulated
> devices.
> 
> In the command line, devices can appear on any order, primary then
> secondary, secondary then primary, or only one of them.
> You can add (any of them) later in the toplevel.
> 
> And now, what all this mess is about.  We only enable the primary if the
> guest knows about failover.  Otherwise we use only the virtio device
> (*).  The important bit here is that we need to wait until the guest is
> booted, and the virtio-net driver is loaded, and then it tells us if it
> understands failover (or not).  At that point we decide if we want to
> "really" create the primary.
> 
> I know that it abuses device_add() as much as it can be, but I can't see
> any better way to handle it.  We need to be able to "create" a device
> without showing it to the guest.  And later, when we create a different
> device, and depending of driver support on the guest, we "finish" the
> creation of the primary device.
> 
> Any good idea?

I don't know if it can help the discussion, but I'm reformatting the failover code to move 
all the PCI stuff to pci files.

And there is a lot of inconsistencies regarding the device_add and --device option so I've 
been in the end to add a list of of hidden devices rather than relying on the command line.

See PATCH 8 of series "[RFC PATCH v2 0/8] virtio-net failover cleanup and new features"

https://patchew.org/QEMU/20210820142002.152994-1-lvivier@redhat.com/

Thanks,
Laurent


