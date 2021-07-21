Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C143D1293
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:37:28 +0200 (CEST)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EHn-0008Tl-3g
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6EGd-0007mV-9k
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:36:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6EGa-0001xU-34
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626881770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0RnDdqmdA7sV8mhRsLgAoarl6tXsKhNe1aJ+5stu80=;
 b=bJOij/jHtIHAKwpqyuWCAc0FKB3NcQk+Wi//0X2ScwFD4C/FFz0XaajKojGnkt8J/onAUR
 6Ye56KMEbdpIWkNNNTd/AWR2Zsxoq/DVxzLEV24M5DLf5M2DAKBqmtnlFIOxJVi9tQDmcl
 J9DymNk2iE3Qe7h3Be9moRsRiYZNF+0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-36XwApCrMN2gsgQ7SYn4bg-1; Wed, 21 Jul 2021 11:36:06 -0400
X-MC-Unique: 36XwApCrMN2gsgQ7SYn4bg-1
Received: by mail-wr1-f69.google.com with SMTP id
 i10-20020a5d55ca0000b029013b976502b6so1177847wrw.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w0RnDdqmdA7sV8mhRsLgAoarl6tXsKhNe1aJ+5stu80=;
 b=NWduDzQVAG6M/IabNU2xA91/DjLY55+7UrTV3A5yuGauA1E4Fup6+avtXVhp12UBRI
 1kGGAOrSOjzDHDF7+Zcep8pxHq5wU6OAHt8ssVR9GVV4BwwRlIAnx/vTiKCqsfNYnbnL
 XNWUjd5PnMz5QUvhV5uQ/tZObasDnBRglE1R/rAwS2Ep+TSI0MdT+Ylh1qOvt1TThsJC
 4i5E3FzFi25mGeBz7CgWg56JMsecQTNuVtc+yo8YUHawHh2JnXp87VO2awRuhq4izu+k
 c+R1mpxT6Awfz1JqQ7ncf9+XEEuTvobt5kersObukI0+ErpYuuITqKan5yGb4lGtDzUJ
 vyUw==
X-Gm-Message-State: AOAM532SqgLYMe7At+j0XDkggpXRcAgjSA+unNuhDCC8jScPFsnKt4PK
 80MXbzplFQe5GNu0S9XAn7uTMYj/Y6tVfx+T1Zdwpx7AVZyGHuMyBkOoEtikQNOFWCZ27SQ/XNg
 ysnQQ3fAJKEG567U=
X-Received: by 2002:a05:6000:10ca:: with SMTP id
 b10mr43743437wrx.195.1626881765700; 
 Wed, 21 Jul 2021 08:36:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlhGiCjIXFDIMhs+zxMJ9dCM5aWIoKMVeazrm9qXp78d5Lz/M7DFQVz5+7xXtp9QLn7TLX7g==
X-Received: by 2002:a05:6000:10ca:: with SMTP id
 b10mr43743418wrx.195.1626881765506; 
 Wed, 21 Jul 2021 08:36:05 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id t5sm27478340wrw.38.2021.07.21.08.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 08:36:05 -0700 (PDT)
Subject: Re: [PATCH] failover: unregister ram on unplug
To: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20210720181644.196315-1-lvivier@redhat.com>
 <20210721105817.0a4afc21@redhat.com>
 <20210721062035-mutt-send-email-mst@kernel.org>
 <047bcd5c-8da5-0827-615b-77f12075160a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <59e7c7b0-9a37-de33-a839-3f994b5a195d@redhat.com>
Date: Wed, 21 Jul 2021 17:36:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <047bcd5c-8da5-0827-615b-77f12075160a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 12:49 PM, Laurent Vivier wrote:
> On 21/07/2021 12:41, Michael S. Tsirkin wrote:
>> On Wed, Jul 21, 2021 at 10:58:17AM +0200, Igor Mammedov wrote:
>>> On Tue, 20 Jul 2021 20:16:44 +0200
>>> Laurent Vivier <lvivier@redhat.com> wrote:
>>>
>>>> This simple change allows to test failover with a simulated device
>>>> like e1000e rather than a vfio device.
>>>>
>>>> This is interesting to developers that want to test failover on
>>>> a system with no vfio device. Moreover it simplifies host networking
>>>> configuration as we can use the same bridge for virtio-net and
>>>> the other failover networking device.
>>>>
>>>> Without this change the migration of a system configured with failover
>>>> fails with:
>>>>
>>>>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>>>>   error while loading state for instance 0x0 of device 'ram'
>>>>   load of migration failed: Invalid argument
>>>>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>
>>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>>>
>>>> ---
>>>>  hw/net/virtio-net.c | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>>> index 16d20cdee52a..8f7735bad4f2 100644
>>>> --- a/hw/net/virtio-net.c
>>>> +++ b/hw/net/virtio-net.c
>>>> @@ -3256,6 +3256,9 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
>>>>      if (migration_in_setup(s) && !should_be_hidden) {
>>>>          if (failover_unplug_primary(n, dev)) {
>>>>              vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
>>>> +            if (PCI_DEVICE(dev)->has_rom) {
>>
>>
>> Hmm. Any way to hide this behind an interface so
>> we don't need to poke at pci device internals?
> 
> There is the pci_del_option_rom() but it's not exported.
> 
> Do you want I export and use it?

Looks cleaner indeed.


