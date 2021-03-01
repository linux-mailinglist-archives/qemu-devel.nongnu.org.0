Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F62E32788A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 08:48:54 +0100 (CET)
Received: from localhost ([::1]:42860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdIT-000145-7c
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 02:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amorenoz@redhat.com>)
 id 1lGdH5-0000Ld-OY
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:47:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <amorenoz@redhat.com>)
 id 1lGdH3-00018r-UY
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:47:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614584840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BBSmKpOV9XEzRSgZzgS2nPmROr7wXwjGxXkXj3czfTY=;
 b=EhFF2SUNUSTjqbVgZxr8RpNaKMRW6bwm8c5q++e+c6RFwqHoFkuFOCWpWvnIPAUHDAhrDg
 3LmL2PrbW5yykSMmj1ookiki6np7ha7desl1gLMasM5nTAEaW/v8UhQgMiUbfTWwKgNv6q
 CSFQ1e083m/jHGMCpqhJbO2Sl7ASLD4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-2KebvqMdOF6nUDdxY7oB9A-1; Mon, 01 Mar 2021 02:47:18 -0500
X-MC-Unique: 2KebvqMdOF6nUDdxY7oB9A-1
Received: by mail-wm1-f72.google.com with SMTP id m17so149324wml.3
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 23:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BBSmKpOV9XEzRSgZzgS2nPmROr7wXwjGxXkXj3czfTY=;
 b=ijzgSO5/W55JVTioc54DlJYLVdp/XLGCq+8DEjAbRxgAkkBh84xiBLLAHxISR9PRyj
 iGb2avxFPh5GfFhJ8bfwGUZiVMhaBDlXFa23uD41/b4fcELOcYdeItmmlqpLzZvTvgNv
 KJtTq+NjwwMATpwUnZYibwixRmtSgsBVxPj9sNHpEpOJJ+9uPCElq7Md0SUsLxReimr8
 m70fl52IRt94wF0L+UyOp1iK288xRZfuRIKrzfKYKSnWMRkgT2VaPmrajtzd44+bkAyy
 hqnQrfJcWG9hbAG48m5Jpy9NerdrzImTHZDqNqcc1lC8ySQp1gvA6R3UScJh5+t3/U2R
 PeCA==
X-Gm-Message-State: AOAM530UpRfg7s4He0qH6xkLWoPWtNCUmuWIAq8LTNq44LhLCvLzIgEL
 EDnRAXoh6fkGdfReNESDw4LRzRcWsu8kjg3K6fG6KaF8NCgJWB/MGhthZGxxqYH+kHPIMK5EXSu
 ShaGEkzY39fnb+qM=
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr14812887wrq.136.1614584837322; 
 Sun, 28 Feb 2021 23:47:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyZAW/1+pkpK4C4gYs8b7v2/pBoN8cF9wIM5g1YZ7pllv8TsHEBktG5ayTbjvMisisjq0H3w==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr14812871wrq.136.1614584837112; 
 Sun, 28 Feb 2021 23:47:17 -0800 (PST)
Received: from amorenoz.users.ipa.redhat.com ([94.73.62.62])
 by smtp.gmail.com with ESMTPSA id w16sm10930869wrk.41.2021.02.28.23.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 23:47:16 -0800 (PST)
Subject: Re: [PATCH v5 1/1] virtio-net: Add check for mac address while peer
 is vdpa
To: Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210225165506.18321-1-lulu@redhat.com>
 <20210225165506.18321-2-lulu@redhat.com>
 <20210225141203-mutt-send-email-mst@kernel.org>
 <20210228153905-mutt-send-email-mst@kernel.org>
 <CACLfguUUqYAEo_vLRpW3uZr6FUY=STwNUuQjUvqDdHqSAiNmuA@mail.gmail.com>
From: Adrian Moreno <amorenoz@redhat.com>
Message-ID: <e98ddf35-6030-0016-6ca7-f61f77da5078@redhat.com>
Date: Mon, 1 Mar 2021 08:47:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CACLfguUUqYAEo_vLRpW3uZr6FUY=STwNUuQjUvqDdHqSAiNmuA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=amorenoz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=amorenoz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Sean Mooney <smooney@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/1/21 2:36 AM, Cindy Lu wrote:
> On Mon, Mar 1, 2021 at 4:40 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Thu, Feb 25, 2021 at 02:14:39PM -0500, Michael S. Tsirkin wrote:
>>> On Fri, Feb 26, 2021 at 12:55:06AM +0800, Cindy Lu wrote:
>>>> While peer is vdpa, sometime qemu get an all zero mac address from the hardware,
>>>> This is not a legal value. Add the check for this.if we get an zero mac address.
>>>> qemu will use the default mac address or the mac address from qemu cmdline
>>>>
>>>> Signed-off-by: Cindy Lu <lulu@redhat.com>
>>>
>>> I guess I will have to rewrite the comments and commit log :(
>>>
>>> It is all saying what does the patch do. We want it to rather
>>> give motivation.
>>>
>>> Sean could you please comment on whether this patch fixes your
>>> config?
>>
>> ping. if I'm to try and merge this work around it's critical
>> that someone with access to hardware confirm it actually works.
>>
> Hi Michael, I have tested this patch in qemu+vdpa+mlx environment.
> it's working fine.

I have also verified it. For the record, I'll expand:

Libvirt definition contains:

    <interface type='vdpa'>
      <mac address='52:54:00:8e:a4:12'/>
      <source dev='/dev/vhost-vdpa-0'/>
      <model type='virtio'/>
      <alias name='net1'/>
      <address type='pci' domain='0x0000' bus='0x06' slot='0x00' function='0x0'/>
    </interface>
	
Qemu command line contains:

-add-fd set=3,fd=42,opaque=/dev/vhost-vdpa-0 \
-netdev vhost-vdpa,vhostdev=/dev/fdset/3,id=hostnet1 \
-device
virtio-net-pci,netdev=hostnet1,id=net1,mac=52:54:00:8e:a4:12,bus=pci.4,addr=0x0 \

The vdpa device is created by mlx_vdpa (Connect-X6 DX) on switchdev mode.

The original problem was:
The mac address in struct virtio_net_config in the vdpa device is zero because
it has not been configured. This does not have implications in the traffic
steering since the card will rely on the eswitch flow configuration to perform
smac/dmac filtering (in my case, this is done through ovs + tcflower hw offload).

Since we anyhow have to rely on the mac address having been configured
externally on the eswitch, we can also trust that whoever applied such flow
configuration also gave us the correct mac address in the cmd line. Therefore,
exposing such address to the guest seems like a sane way to tell it what mac
address to use.

Until the vdpa framework / iproute2 tool support configuring the
virtio_net_config struct and such mechanism is used externally to align the
virtio device's mac with the one configured in the eswitch, this patch allows
the guest to have connectivity.


>>
>>>> ---
>>>>  hw/net/virtio-net.c | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>>> index 9179013ac4..8f36ca5066 100644
>>>> --- a/hw/net/virtio-net.c
>>>> +++ b/hw/net/virtio-net.c
>>>> @@ -126,6 +126,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>>>>      VirtIONet *n = VIRTIO_NET(vdev);
>>>>      struct virtio_net_config netcfg;
>>>>      NetClientState *nc = qemu_get_queue(n->nic);
>>>> +    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
>>>>
>>>>      int ret = 0;
>>>>      memset(&netcfg, 0 , sizeof(struct virtio_net_config));
>>>> @@ -151,6 +152,15 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>>>>          ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
>>>>                                     n->config_size);
>>>>          if (ret != -1) {
>>>> +            /*
>>>> +             * Here is a work around, the 0 mac address is not a legal value.
>>>> +             * if we got this from hardware, qemu will use the mac address
>>>> +             * saved in VirtIONet->mac.
>>>> +             */
>>>> +            if (memcmp(&netcfg.mac, &zero, sizeof(zero)) == 0) {
>>>> +                info_report("Get an all zero mac address from hardware");

s/Get/Got/?

>>>> +                memcpy(netcfg.mac, n->mac, ETH_ALEN);
>>>> +            }
>>>>              memcpy(config, &netcfg, n->config_size);
>>>>          }
>>>>      }
>>>> --
>>>> 2.21.3
>>
> 

FWIW:
Tested-by: Adrián Moreno <amorenoz@redhat.com>

-- 
Adrián Moreno


