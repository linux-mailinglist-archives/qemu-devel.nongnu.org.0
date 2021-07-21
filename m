Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C47F3D0CA2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 13:01:21 +0200 (CEST)
Received: from localhost ([::1]:59458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69ya-0007HG-5X
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 07:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m69nZ-0006eB-DB
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:49:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m69nW-000503-Lx
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626864593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lNQwnPFMDYRy1e7nqI1nGDX9qlYNAYwe14Tlw81RK9U=;
 b=agvhx2avPBgcUI0LvR0flHKUT4owug+4kIHw4SERXcXW3XO2T3CiXwgVtno1PMhL+t3jik
 GoDhIN74BB6ed7rvXLK9tc6Gl/q8aunNQ0Xrt7XbIQEpjQ6SCULJPHk3w5EhJNpVB/HeIf
 ibMPBr7BssrIXJYW7GvANqrQsXZenl8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-qq_5ODGlNwyOsvRcccQ66Q-1; Wed, 21 Jul 2021 06:49:52 -0400
X-MC-Unique: qq_5ODGlNwyOsvRcccQ66Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 y6-20020a7bc1860000b0290227b53c7cefso436207wmi.1
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lNQwnPFMDYRy1e7nqI1nGDX9qlYNAYwe14Tlw81RK9U=;
 b=nLWrvVBKz0f/4TIwfm1pBT6ncKD0H+2Lhsgxsm/U9sjDD5n+SC9kCG1ljNCyocYTv8
 xbJ92HSW3g5D35YllhRVnD6O10lq2N1mf6vJVNop1S4dRG/aB+++gDQOoKvDr2tLfKO2
 nZDAJN7zqv0a/6/LjbQ3IOBOWQ8dKL8fSil1e5qRWj2lljXf7wyv0oXbYg3XYM63i46s
 r4TXg/pr/NW6YKMFV8xc0O93XLJqZeQMflYVkbwK85x2lH8qDS3TXOsQI5/IaSu77gI5
 4QwqqR1FM8dfuWs0Y01t3mybxiDyaq72b7O1Yrp6T2537whdoAZqA2Wr3Pcua0Xj3jAi
 XdHQ==
X-Gm-Message-State: AOAM533YbsCE9770DodupvZoEIh9qNbHb6G41tmTm8h7DR2+/ufMM1NL
 sKiJKRyBotiZippp3dYTObPAdQkAVX8KaqSWYjZT0d4xl0bPNeY2nralKVb86TYxWfpubllkd66
 FesaveJIGlDM6Dbo=
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr42856445wrz.242.1626864590939; 
 Wed, 21 Jul 2021 03:49:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7UiWNffL0ahv+0OTxgAS2dHdKTimWetWOtxKUzsfpstkeM7mJuZibpex0pKcFh2W9fr0xoA==
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr42856421wrz.242.1626864590703; 
 Wed, 21 Jul 2021 03:49:50 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.17.146])
 by smtp.gmail.com with ESMTPSA id t6sm26949525wru.75.2021.07.21.03.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 03:49:50 -0700 (PDT)
Subject: Re: [PATCH] failover: unregister ram on unplug
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20210720181644.196315-1-lvivier@redhat.com>
 <20210721105817.0a4afc21@redhat.com>
 <20210721062035-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <047bcd5c-8da5-0827-615b-77f12075160a@redhat.com>
Date: Wed, 21 Jul 2021 12:49:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721062035-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/2021 12:41, Michael S. Tsirkin wrote:
> On Wed, Jul 21, 2021 at 10:58:17AM +0200, Igor Mammedov wrote:
>> On Tue, 20 Jul 2021 20:16:44 +0200
>> Laurent Vivier <lvivier@redhat.com> wrote:
>>
>>> This simple change allows to test failover with a simulated device
>>> like e1000e rather than a vfio device.
>>>
>>> This is interesting to developers that want to test failover on
>>> a system with no vfio device. Moreover it simplifies host networking
>>> configuration as we can use the same bridge for virtio-net and
>>> the other failover networking device.
>>>
>>> Without this change the migration of a system configured with failover
>>> fails with:
>>>
>>>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>>>   error while loading state for instance 0x0 of device 'ram'
>>>   load of migration failed: Invalid argument
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>>
>>> ---
>>>  hw/net/virtio-net.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>> index 16d20cdee52a..8f7735bad4f2 100644
>>> --- a/hw/net/virtio-net.c
>>> +++ b/hw/net/virtio-net.c
>>> @@ -3256,6 +3256,9 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
>>>      if (migration_in_setup(s) && !should_be_hidden) {
>>>          if (failover_unplug_primary(n, dev)) {
>>>              vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
>>> +            if (PCI_DEVICE(dev)->has_rom) {
> 
> 
> Hmm. Any way to hide this behind an interface so
> we don't need to poke at pci device internals?

There is the pci_del_option_rom() but it's not exported.

Do you want I export and use it?

Thanks,
Laurent

> 
>>> +                vmstate_unregister_ram(&PCI_DEVICE(dev)->rom , dev);
>>> +            }
>>>              qapi_event_send_unplug_primary(dev->id);
>>>              qatomic_set(&n->failover_primary_hidden, true);
>>>          } else {
> 


