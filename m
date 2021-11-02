Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4700442930
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:16:51 +0100 (CET)
Received: from localhost ([::1]:40562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhoyQ-0004uP-Cb
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mhowf-00046v-0c
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:15:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mhowc-0002Ho-Lf
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635840897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TfGuOwpTYfBet62yhjb4wXzWZZmjjk0iDXBdt17DO6k=;
 b=TdX6fphy8zTflhIXjuelTlj13Ka2u2CqkraJoiteTJ+gaLDAv2Vf0Z4sUIEPMwPDI6gJNW
 2VfAhhuNdoPW12WF060J/xRpcHSNH0E2ORA3DdoQZvGXQqllOIg6fZven6F3HoErKxbDMz
 3va6VxMh4EWnNOg9XM12BKsWAHaZHCk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-Yg7AiAnvN7GnnkVxr7K5bg-1; Tue, 02 Nov 2021 04:14:55 -0400
X-MC-Unique: Yg7AiAnvN7GnnkVxr7K5bg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v18-20020a7bcb52000000b00322fea1d5b7so542901wmj.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TfGuOwpTYfBet62yhjb4wXzWZZmjjk0iDXBdt17DO6k=;
 b=n49tVLreeIFrXjfybtzWq1WdQNR01mVTgxUraNmyyIqbgwj72xIdqie2Q+Hj9fMowq
 fDOGJqwd9DBD9Gt3zIxnkEulF3VFjVraIn2PxuI5qfvNgR0qGqAqj5JdHgojqJQkv5BO
 vzDJA4ARld8Y6oqD0hGwoRmbr38pfEkjbxq+OgD0121CZdcuk2BszAMwlOTUyd+WO3Mx
 5DzL6ICMl2lu03UwcZPH4nMxVEzdYzn3El4OULgP/wlyWxamhICLv7Euj2KMdD0o6UWs
 qhPKZMRh4O6K31w6a3xKuPWZASF84XFN/fGyJaKBvx43ASMecP5c9Fo5nU2TYYkQVGi5
 Ddvw==
X-Gm-Message-State: AOAM532B3eMptO5I05MDXhKdQO3nOGiwdbF7DoaCuvXDP1zktf8jLEwi
 VTJFksyok6Q2vZG86k75bK66nYl3ux5sG0nXbN7AkJFpFiXHC5o3EOPYq1Eq7z5I4+Ogq62NsdN
 R37TsPL6VbPqLsw0=
X-Received: by 2002:a05:600c:1d1e:: with SMTP id
 l30mr2160491wms.65.1635840893655; 
 Tue, 02 Nov 2021 01:14:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp7k5KOboNLadqymXLxznrwrA3Ld2MMqgbmaPpz17eZ4iNzebQL0q5AsZyFUIhCxy2dbCoKA==
X-Received: by 2002:a05:600c:1d1e:: with SMTP id
 l30mr2160457wms.65.1635840893306; 
 Tue, 02 Nov 2021 01:14:53 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.14.190])
 by smtp.gmail.com with ESMTPSA id x8sm16147895wrw.6.2021.11.02.01.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 01:14:52 -0700 (PDT)
Message-ID: <913b4d85-9c05-0bb8-2dd5-02744a44b388@redhat.com>
Date: Tue, 2 Nov 2021 09:14:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] failover: specify an alternate MAC address
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211027095945.86710-1-lvivier@redhat.com>
 <20211101053105-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211101053105-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/11/2021 10:39, Michael S. Tsirkin wrote:
> On Wed, Oct 27, 2021 at 11:59:45AM +0200, Laurent Vivier wrote:
>> If the guest driver doesn't support the STANDBY feature, by default
>> we keep the virtio-net device and don't hotplug the VFIO device,
>> but in some cases, user can prefer to use the VFIO device rather
>> than the virtio-net one. We can't unplug the virtio-net device
>> (because on migration it is expected on the destination side) but
>> we can keep both interfaces if the MAC addresses are different
>> (to have the same MAC address can cause kernel crash with old
>> kernel). The VFIO device will be unplugged before the migration
>> like in the normal failover migration but without a failover device.
>>
>> This patch adds a new property to the virtio-net device:
>> "failover-legacy-mac"
>>
>> If an alternate MAC address is provided with "failover-legacy-mac" and
>> the STANDBY feature is not supported, both interfaces are plugged
>> but the standby interface (virtio-net) MAC address is set to the
>> value provided by the "failover-legacy-mac" parameter.
>>
>> If the STANDBY feature is supported by guest and QEMU, the virtio-net
>> failover acts as usual.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> Wait a second. What if config is read before features are set?
> Are we going to provide a legacy or a new mac?
We provide the new MAC and at this point the primary device is not plugged.

When features are set:
- if STANDBY is set, the primary device is plugged, and secondary (virtio-net) uses the 
new MAC
- if STANDBY is not set:
     - if legacy MAC is provided:
         the primary device is plugged and legacy MAC is used
     - else
         the primary device is not plugged and new MAC is used.

> I guess current guests do not do this, but the spec does allow this,
> and then the mac will apparently change for the guests.

What I read in virtio 1.0 specs, "3.1.1 Driver requirements: Device initialization", is 
the virtio configuration space (step 7) is is accessed after the features are negotiated. 
I don't think the part in step 4 can involve the MAC address, and moreover the config is 
not read before, but during the negotiation (I guess we can see that as the config access 
is part of the negotiation).

3.1.1 Driver Requirements: Device Initialization

The driver MUST follow this sequence to initialize a device:
1. Reset the device.
2. Set the ACKNOWLEDGE status bit: the guest OS has notice the device.
3. Set the DRIVER status bit: the guest OS knows how to drive the device.
4. Read device feature bits, and write the subset of feature bits understood by the OS and 
driver to the device. During this step the driver MAY read (but MUST NOT write) the 
device-specific configuration fields to check that it can support the device before 
accepting it.
5. Set the FEATURES_OK status bit. The driver MUST NOT accept new feature bits after this 
step.
6. Re-read device status to ensure the FEATURES_OK bit is still set: otherwise, the device 
does not support our subset of features and the device is unusable.
7. Perform device-specific setup, including discovery of virtqueues for the device, 
optional per-bus setup, reading and possibly writing the device’s virtio configuration 
space, and population of virtqueues.
8. Set the DRIVER_OK status bit. At this point the device is “live”.

> 
> It might be cleaner to just add a PRIMARY_MAC feature -
> would need guest work though ...

We can't add a new feature: the goal of this patch is to be able to use the primary device 
(VFIO) with kernel that doesn't support STANDBY feature. If we can add a feature, to add 
the STANDBY feature would be a better choice.

If changing the MAC address is not acceptable we can return to a mix of v1 and v2 of my patch:

"virtio: failover: allow to keep the VFIO device rather than the virtio-net one"

https://patchew.org/QEMU/20210729191910.317114-1-lvivier@redhat.com/

that disables the virtio-net driver on the module probe.

Thanks,
Laurent


