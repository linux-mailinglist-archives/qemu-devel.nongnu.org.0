Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1503D0D51
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 13:24:14 +0200 (CEST)
Received: from localhost ([::1]:33858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6AKj-0004lI-5w
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 07:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6AJW-0003y5-J3
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:22:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6AJT-0000Ya-Fs
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626866573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hffvfxEYWz3wKOVYgL4rwZWglk3WFTHX9WrkPBQXAs=;
 b=djlI72LZ+c4Q5fIhBJ7PY59w3FBzPLQlGsqhFEAAlh43QH5VV6MnhxBbKNqTi2KGp966qa
 N1/93Z9uF92IktJ1Lnj7sOuAAc/JHFDBbA9flzEh6WA3kvh77i3doHYgaY+p5/2BJLGBo1
 m2g/7P5KENI23jJgsLqMKDJ/QpSILU0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-IcbEAxM-NhqZ0hkaOtPa-g-1; Wed, 21 Jul 2021 07:22:52 -0400
X-MC-Unique: IcbEAxM-NhqZ0hkaOtPa-g-1
Received: by mail-wr1-f70.google.com with SMTP id
 5-20020a0560001565b029013fe432d176so862407wrz.23
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 04:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6hffvfxEYWz3wKOVYgL4rwZWglk3WFTHX9WrkPBQXAs=;
 b=CTLLY6aVLTpbFt6Zji5AB+ck3+QOG/VkzSBZveSur0gX0u8rpMkTJ2+FAy0tXybRqV
 OCG3VW/+0r7gepVE+mf028zE47baJcP5NETDyAoCxAGYnlSi2AdmIZOlzoUMVti9Tu7v
 8QWIAdz4+MiVAWcPB8PkB0/iMgLytRIneIH5Y/ZzYa0LxSBNAjGMlFopGnagYPB5rPES
 PTtliR4mHlv1LU6x20IOg1WyEvBWw2txU/YxP1rulA3/+0RQgz2JTToJfE7e0FV0sPwn
 PEymkyxYA7eDmYBSRTpzARd4A1+Zog61PU+EiLqbOxkmzeJYl3fAs7nSozmE4F5wAiFp
 mz/Q==
X-Gm-Message-State: AOAM531On+xghBK4wkczpBj+dOxsjgQTYm+gJZMe+mIwF13T3elqswd1
 N2+dgrkyFYlk5e1ppRUciVIPon/NjVtsYQpGEn6e3YWEnBl1O9ay2greAU+PTD6zM1uoKz6jJI7
 iBW9HVbtHq/Ah0b4=
X-Received: by 2002:a05:6000:1841:: with SMTP id
 c1mr40715247wri.423.1626866571355; 
 Wed, 21 Jul 2021 04:22:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+EEphdvJ2G3jDliEaJvqKaqdWY6iVrUvB3BJz58gOxzBpGnoRby07g+6XHngv+LJgJHGH/A==
X-Received: by 2002:a05:6000:1841:: with SMTP id
 c1mr40715221wri.423.1626866571125; 
 Wed, 21 Jul 2021 04:22:51 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.17.146])
 by smtp.gmail.com with ESMTPSA id p5sm29127786wrd.25.2021.07.21.04.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 04:22:50 -0700 (PDT)
Subject: Re: [PATCH v3] failover: unregister ROM on unplug
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210721093955.225759-1-lvivier@redhat.com>
 <YPgAjFzE/hq+tSIS@work-vm>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <a30f7985-6091-1e7b-4e40-391b62e437fb@redhat.com>
Date: Wed, 21 Jul 2021 13:22:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPgAjFzE/hq+tSIS@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/2021 13:10, Dr. David Alan Gilbert wrote:
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

Good point.

I'm going to check but I think the vmstates are re-added by the hotplug operations that
are used in failover_replug_primary().

Thanks,
Laurent


