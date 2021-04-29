Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D0836E5E8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:28:06 +0200 (CEST)
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc15h-00007L-GL
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lc14Z-0007qR-Bc
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lc14Q-00037q-LR
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619681202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7bUW7NveL3sCQPWKyJaO22TwzjPWLxovbengny5kABw=;
 b=blsWeHWhh+jML6HGo2z6cWtPMgvDO/TZt9F9BaIKQepbrPRljw9mSgpj9V3FfiKFU6+zUk
 Oy6EJoDlhoZJmirfg8XT9jc8RSf51xAvSDku3/MQZDq7PIoW3rLZnN2xCAn/MO4StPDDje
 pXjeYyGC+bJejyWLJ+oMx6Bq394ywy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-2kbzsibiOneny8jlOOIeEA-1; Thu, 29 Apr 2021 03:26:40 -0400
X-MC-Unique: 2kbzsibiOneny8jlOOIeEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCE3D6D588
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 07:26:39 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-205.pek2.redhat.com
 [10.72.13.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC81C226E9;
 Thu, 29 Apr 2021 07:26:34 +0000 (UTC)
Subject: Re: [PATCH] virtio-net: failover: add missing
 remove_migration_state_change_notifier()
To: "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210427135147.111218-1-lvivier@redhat.com>
 <YIgZetbn+10YDdeu@work-vm> <20210428061348-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2387a23c-667c-d905-0058-51e48f9be2f4@redhat.com>
Date: Thu, 29 Apr 2021 15:26:32 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210428061348-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/4/28 ÏÂÎç6:14, Michael S. Tsirkin Ð´µÀ:
> On Tue, Apr 27, 2021 at 03:02:34PM +0100, Dr. David Alan Gilbert wrote:
>> * Laurent Vivier (lvivier@redhat.com) wrote:
>>> In the failover case configuration, virtio_net_device_realize() uses an
>>> add_migration_state_change_notifier() to add a state notifier, but this
>>> notifier is not removed by the unrealize function when the virtio-net
>>> card is unplugged.
>>>
>>> If the card is unplugged and a migration is started, the notifier is
>>> called and as it is not valid anymore QEMU crashes.
>>>
>>> This patch fixes the problem by adding the
>>> remove_migration_state_change_notifier() in virtio_net_device_unrealize().
>>>
>>> The problem can be reproduced with:
>>>
>>>    $ qemu-system-x86_64 -enable-kvm -m 1g -M q35 \
>>>      -device pcie-root-port,slot=4,id=root1 \
>>>      -device pcie-root-port,slot=5,id=root2 \
>>>      -device virtio-net-pci,id=net1,mac=52:54:00:6f:55:cc,failover=on,bus=root1 \
>>>      -monitor stdio disk.qcow2
>>>    (qemu) device_del net1
>>>    (qemu) migrate "exec:gzip -c > STATEFILE.gz"
>>>
>>>    Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
>>>    0x0000000000000000 in ?? ()
>>>    (gdb) bt
>>>    #0  0x0000000000000000 in  ()
>>>    #1  0x0000555555d726d7 in notifier_list_notify (...)
>>>        at .../util/notify.c:39
>>>    #2  0x0000555555842c1a in migrate_fd_connect (...)
>>>        at .../migration/migration.c:3975
>>>    #3  0x0000555555950f7d in migration_channel_connect (...)
>>>        error@entry=0x0) at .../migration/channel.c:107
>>>    #4  0x0000555555910922 in exec_start_outgoing_migration (...)
>>>        at .../migration/exec.c:42
>>>
>>> Reported-by: Igor Mammedov <imammedo@redhat.com>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Yep, I think that's OK.
>>
>>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>
> net stuff so I expect Jason will merge this ...


Ok, I've queued this.

Thanks


>
>>> ---
>>>   hw/net/virtio-net.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>> index 66b9ff451185..914051feb75b 100644
>>> --- a/hw/net/virtio-net.c
>>> +++ b/hw/net/virtio-net.c
>>> @@ -3373,6 +3373,7 @@ static void virtio_net_device_unrealize(DeviceState *dev)
>>>   
>>>       if (n->failover) {
>>>           device_listener_unregister(&n->primary_listener);
>>> +        remove_migration_state_change_notifier(&n->migration_state);
>>>       }
>>>   
>>>       max_queues = n->multiqueue ? n->max_queues : 1;
>>> -- 
>>> 2.30.2
>>>
>> -- 
>> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>


