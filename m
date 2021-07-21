Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2E23D0FCB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:43:01 +0200 (CEST)
Received: from localhost ([::1]:56078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6CV2-0006lh-L5
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1m6CTS-0005dJ-CZ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:41:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1m6CTQ-0007Pm-3m
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626874877;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=jUH9wcLcC430S0NcCl5YIGPRPtXxnTKqUGziyoa5Cl0=;
 b=UVrUp3c0twSpHLILg+StdurkOIVx3Aao3sdPHniNnALGHa/HgUUDCMQ3HskuDZjrEUq+++
 00yDxUGH3zCQlZ4UgB9QsJAsVqrxLEBslHOE/0eqS8bI8YPRPdTnc2faNBQGhpylYgRMnV
 J6vN48zoNgy3lZTljbtVAXdAYiZlSus=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-KcryR0wbNUukEVppuMhBWg-1; Wed, 21 Jul 2021 09:41:16 -0400
X-MC-Unique: KcryR0wbNUukEVppuMhBWg-1
Received: by mail-wr1-f71.google.com with SMTP id
 32-20020adf82a30000b029013b21c75294so1025276wrc.14
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 06:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=jUH9wcLcC430S0NcCl5YIGPRPtXxnTKqUGziyoa5Cl0=;
 b=iJJFpUbuuBE4KhBzbue/Te874vR/m6JyIjmbzMJbH+sBCEEVoeY0o/lO44uT5yG6ik
 gelY04FRi42GMZK54qqXLA73wJvGhxGkQeqgmvSWLKZW97ul/F2MTVPXOcbl+PDvVrKQ
 sQ7oBDbNFFlm6jkrghjOVzNZbzLOfjZhrQY9b2oJwX7+6ZysjIgxw3sjq5vb6gKL/U5a
 ZoqsFEhP34rUUYXAl9wd+BNSHIZLGPHpHKi5IzdfKuTXoS+eZ2qhq58eZerZlBLxHt02
 +wCqdP+2aE1TXdh5Cwytmzhpl97vATYdVf9X/tdkLXQM+ZU8RrQkgp4/g1pa6bat4TE8
 HCYw==
X-Gm-Message-State: AOAM5331Y2IH3VogTrGQgE7np5/1/+iaghDy5CQtOmWB55bQ9euEhpCe
 APIPtjMw3FOBN5RH8w9m0XSPTAqKrO5FTnC6Qd8TLiIMt1qyylEBf8QMK3RxcGDeQriGGJYBsZs
 FSLT2o/5bz0fHpfg=
X-Received: by 2002:adf:fac7:: with SMTP id a7mr42287208wrs.384.1626874875402; 
 Wed, 21 Jul 2021 06:41:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEfbXN27oIFHD7AIo+VdkzswjjhPtwmflfTTWhT5pkyCk6vTygh+jRJKOCPDsTvkTVPApkvw==
X-Received: by 2002:adf:fac7:: with SMTP id a7mr42287165wrs.384.1626874874897; 
 Wed, 21 Jul 2021 06:41:14 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id z11sm26763678wru.65.2021.07.21.06.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 06:41:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3] failover: unregister ROM on unplug
In-Reply-To: <YPgAjFzE/hq+tSIS@work-vm> (David Alan Gilbert's message of "Wed, 
 21 Jul 2021 12:10:04 +0100")
References: <20210721093955.225759-1-lvivier@redhat.com>
 <YPgAjFzE/hq+tSIS@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 21 Jul 2021 15:41:13 +0200
Message-ID: <87tukneqdi.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Laurent Vivier (lvivier@redhat.com) wrote:
>> The intend of failover is to allow to migrate a VM with a VFIO
>> networking card without disrupting the network operation by switching
>> to a virtio-net device during the migration.
>> 
>> This simple change allows to test failover with a simulated device
>> like e1000e rather than a vfio device, even if it's useless in real
>> life it can help to debug failover.
>> 
>> This is interesting to developers that want to test failover on
>> a system with no vfio device. Moreover it simplifies host networking
>> configuration as we can use the same bridge for virtio-net and
>> the other failover networking device.
>> 
>> Without this change the migration of a system configured with failover
>> fails with:
>> 
>>   ...
>>   -device virtio-net-pci,id=virtionet0,failover=on,...  \
>>   -device e1000,failover_pair_id=virtionet0,... \
>>   ...
>> 
>>   (qemu) migrate ...
>> 
>>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>>   error while loading state for instance 0x0 of device 'ram'
>>   load of migration failed: Invalid argument
>> 
>> This happens because QEMU correctly unregisters the interface vmstate but
>> not the ROM one. This patch fixes that.
>> 
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>> 
>> Notes:
>>     v3:
>>       remove useless space before comma
>>     
>>     v2:
>>       reset has_rom to false
>>       update commit log message
>> 
>>  hw/net/virtio-net.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 16d20cdee52a..c0c2ec1ebb98 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -3256,6 +3256,10 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
>>      if (migration_in_setup(s) && !should_be_hidden) {
>>          if (failover_unplug_primary(n, dev)) {
>>              vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
>> +            if (PCI_DEVICE(dev)->has_rom) {
>> +                PCI_DEVICE(dev)->has_rom = false;
>> +                vmstate_unregister_ram(&PCI_DEVICE(dev)->rom, dev);
>> +            }
>
> Not actually originated by your fix, but....
>
> Why doesn't failover_replug_primary re-add the vmstates?

Because we can't migrate until the "unplug" has happened.
Yes, it is a mess.

I think this is the saner patch that I can think of for that
functionality.

What I wonder is why we register rom as ram, but I guess that the rom
can be updated from userspace, or who knows.

Later, Juan.

> (I did wonder if passing rom-file="" to the e1000 would help in your
> testing case, but it still creates the RAM image).
>
> Dave
>
>>              qapi_event_send_unplug_primary(dev->id);
>>              qatomic_set(&n->failover_primary_hidden, true);
>>          } else {
>> -- 
>> 2.31.1
>> 


