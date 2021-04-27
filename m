Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D15C36C7AC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 16:22:33 +0200 (CEST)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbObg-0003XU-61
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 10:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbOWQ-0000if-Sf
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:17:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbOWC-0004rY-Um
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619533009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0aq3bsmcBWnkj20/+qGdMG4QC36zKYc2rQKxmrFW8lI=;
 b=MYHIzUaMFwSmzTtFGHOa/V6Q5526/MUj7DZIntq16OZInc4ZxT8iKFmpEeAluHXToruLNQ
 TP7SD3bTsm7l+xWLkZAxIXr5AdJpJv147LnProVkSehiqHMF22r8s1+/YuqVT+svKoA0kr
 rsuy7HVvOjL2ch7kF/d9SaZZgj5v/fw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-ub1hmtPkMQiC5AOujgH98w-1; Tue, 27 Apr 2021 10:16:46 -0400
X-MC-Unique: ub1hmtPkMQiC5AOujgH98w-1
Received: by mail-wr1-f70.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso17303001wrf.11
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 07:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0aq3bsmcBWnkj20/+qGdMG4QC36zKYc2rQKxmrFW8lI=;
 b=GcdGbCTbU8QbPitubny3xpi4Zb0tAtJzBhvmrwP3A7/ZDIWRnnDAoCy6nOMWvwTLfo
 bnWKuLdjSipyO8Iv23TCrmcwbgVuqZIb80HSGO95hDWXWOaBHNP/WRWafMLd+bLOs2pt
 9ILJCveJPDNSk7IKriTHnGqf+LN/qSXeaieXt0Y7ULzplmci8nmNhzXUUbN/O8tPux0k
 B6F08PyY4hLixdsMm394TiAX5XHoOnBwzU9pmpyFEUEBBWFS0PiFCR0uLiiSdZ1yYelC
 dG/q41UXRjINMsraDp8o25O2kAsJA9Wx8cmCijLd383Nq9x/Y4ii1OisSh4qTFB9DjgT
 hh+w==
X-Gm-Message-State: AOAM5324rcKEOUBB3yKfKlEqD8xieFbn8HyR+gPJMB1Gu0Lxmocy2JZi
 bqwZ6gq9tvwVX4/iti16Za59OIyVBxNZABR2v/VTxtEsheKa1YRU1BaX7T7zFxGAUuuUgF0rr7J
 hP8ucVDO12rxpI8s=
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr29942112wrb.56.1619533005681; 
 Tue, 27 Apr 2021 07:16:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdp0n8RSmtbd3cpA0tzAbFzVOw7EmzrJhNy36ppAtxGF/PdLNBUMcLc7MLSf/Onxq4sMInow==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr29942084wrb.56.1619533005505; 
 Tue, 27 Apr 2021 07:16:45 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c8sm2541974wmr.48.2021.04.27.07.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 07:16:45 -0700 (PDT)
Subject: Re: [PATCH] virtio-net: failover: add missing
 remove_migration_state_change_notifier()
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20210427135147.111218-1-lvivier@redhat.com>
 <YIgZetbn+10YDdeu@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a83d914e-6f89-7190-82b6-c1a693ead968@redhat.com>
Date: Tue, 27 Apr 2021 16:16:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIgZetbn+10YDdeu@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 4:02 PM, Dr. David Alan Gilbert wrote:
> * Laurent Vivier (lvivier@redhat.com) wrote:
>> In the failover case configuration, virtio_net_device_realize() uses an
>> add_migration_state_change_notifier() to add a state notifier, but this
>> notifier is not removed by the unrealize function when the virtio-net
>> card is unplugged.
>>
>> If the card is unplugged and a migration is started, the notifier is
>> called and as it is not valid anymore QEMU crashes.
>>
>> This patch fixes the problem by adding the
>> remove_migration_state_change_notifier() in virtio_net_device_unrealize().
>>
>> The problem can be reproduced with:
>>
>>   $ qemu-system-x86_64 -enable-kvm -m 1g -M q35 \
>>     -device pcie-root-port,slot=4,id=root1 \
>>     -device pcie-root-port,slot=5,id=root2 \
>>     -device virtio-net-pci,id=net1,mac=52:54:00:6f:55:cc,failover=on,bus=root1 \
>>     -monitor stdio disk.qcow2
>>   (qemu) device_del net1
>>   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
>>
>>   Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
>>   0x0000000000000000 in ?? ()
>>   (gdb) bt
>>   #0  0x0000000000000000 in  ()
>>   #1  0x0000555555d726d7 in notifier_list_notify (...)
>>       at .../util/notify.c:39
>>   #2  0x0000555555842c1a in migrate_fd_connect (...)
>>       at .../migration/migration.c:3975
>>   #3  0x0000555555950f7d in migration_channel_connect (...)
>>       error@entry=0x0) at .../migration/channel.c:107
>>   #4  0x0000555555910922 in exec_start_outgoing_migration (...)
>>       at .../migration/exec.c:42
>>
>> Reported-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> Yep, I think that's OK.

IIUC HMP device_del ends calling device_finalize(), and per Igor's
explanation of qdev transition states:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg661853.html
I'd expect this to be done in instance_init/instance_finalize,
but since 'failover' is a virtio_net_properties, the callbacks
has to be registered in the realize() function, thus unregistered
in unrealize().

Mentioning it is in realize/unrealize due to 'failover' being a property:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
>> ---
>>  hw/net/virtio-net.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 66b9ff451185..914051feb75b 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -3373,6 +3373,7 @@ static void virtio_net_device_unrealize(DeviceState *dev)
>>  
>>      if (n->failover) {
>>          device_listener_unregister(&n->primary_listener);
>> +        remove_migration_state_change_notifier(&n->migration_state);
>>      }
>>  
>>      max_queues = n->multiqueue ? n->max_queues : 1;
>> -- 
>> 2.30.2
>>


