Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6E7628D8E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:39:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiky-0005Kq-1p; Mon, 14 Nov 2022 18:20:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ouif5-0001df-FV
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:43 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.226] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oubUw-0000ou-AR
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:35:50 -0500
HMM_SOURCE_IP: 172.18.0.48:55964.16140356
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.236 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 0C09B28009D;
 Mon, 14 Nov 2022 23:35:28 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([182.138.181.236])
 by app0024 with ESMTP id 505465bd3b1041ac81a476e6f5b29a95 for mst@redhat.com; 
 Mon, 14 Nov 2022 23:35:34 CST
X-Transaction-ID: 505465bd3b1041ac81a476e6f5b29a95
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 182.138.181.236
X-MEDUSA-Status: 0
Message-ID: <fc4c24eb-239b-8e6e-a534-64effe845ca5@chinatelecom.cn>
Date: Mon, 14 Nov 2022 23:35:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v3 2/2] vhost-net: Fix the virtio features negotiation flaw
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Guoyi Tu <tugy@chinatelecom.cn>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <cover.1667136717.git.huangy81@chinatelecom.cn>
 <2560bb4e8cabc550da07162c520aff3669a8f56f.1667136717.git.huangy81@chinatelecom.cn>
 <20221110141415-mutt-send-email-mst@kernel.org>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <20221110141415-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2022/11/11 3:17, Michael S. Tsirkin 写道:
> On Sun, Oct 30, 2022 at 09:52:39PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Save the acked_features once it be configured by guest
>> virtio driver so it can't miss any features.
>>
>> Note that this patch also change the features saving logic
>> in chr_closed_bh, which originally backup features no matter
>> whether the features are 0 or not, but now do it only if
>> features aren't 0.
>>
>> As to reset acked_features to 0 if needed, Qemu always
>> keeping the backup acked_features up-to-date, and save the
>> acked_features after virtio_net_set_features in advance,
>> including reset acked_features to 0, so the behavior is
>> also covered.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
>> ---
>>   hw/net/vhost_net.c      | 9 +++++++++
>>   hw/net/virtio-net.c     | 5 +++++
>>   include/net/vhost_net.h | 2 ++
>>   net/vhost-user.c        | 6 +-----
>>   4 files changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index d28f8b9..2bffc27 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -141,6 +141,15 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net)
>>       return net->dev.acked_features;
>>   }
>>   
>> +void vhost_net_save_acked_features(NetClientState *nc)
>> +{
>> +    if (nc->info->type != NET_CLIENT_DRIVER_VHOST_USER) {
>> +        return;
>> +    }
>> +
>> +    vhost_user_save_acked_features(nc, false);
>> +}
>> +
>>   static int vhost_net_get_fd(NetClientState *backend)
>>   {
>>       switch (backend->info->type) {
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index e9f696b..5f8f788 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -924,6 +924,11 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>>               continue;
>>           }
>>           vhost_net_ack_features(get_vhost_net(nc->peer), features);
>> +        /*
>> +         * keep acked_features in NetVhostUserState up-to-date so it
>> +         * can't miss any features configured by guest virtio driver.
>> +         */
>> +        vhost_net_save_acked_features(nc->peer);
>>       }
>>   
>>       if (virtio_has_feature(features, VIRTIO_NET_F_CTRL_VLAN)) {
> 
> So when do you want to ack features but *not* save them?
When openvswitch restart and reconnect and Qemu start the vhost_dev， 
acked_features in vhost_dev Qemu need to be initialized and the 
initialized value be fetched from acked_features int NetVhostUserState.
At this time, acked_features  may not be up-to-date but we want it.
> 
> Is the effect of this patch, fundamentally, that guest features
> from virtio are always copied to vhost-user?
> Do we even need an extra copy in vhost user then?
> 
I'm trying to explain this from my view, please point out the mistake 
if i failed. :)

When socket used by vhost-user device disconnectted from openvswitch,
Qemu will stop the vhost-user and clean up the whole struct of 
vhost_dev(include vm's memory region and acked_features), once socket is 
reconnected from openvswitch, Qemu will collect vm's memory region 
dynamically but as to acked_features, IMHO, Qemu can not fetch it from 
guest features of virtio-net, because acked_features are kind of 
different from guest features(bit 30 is different at least)，so Qemu 
need an extra copy.

> 
> all this came in with:
> 
> commit a463215b087c41d7ca94e51aa347cde523831873
> Author: Marc-André Lureau <marcandre.lureau@redhat.com>
> Date:   Mon Jun 6 18:45:05 2016 +0200
> 
>      vhost-net: save & restore vhost-user acked features
> 
> Marc-André do you remember why we have a copy of features in vhost-user
> and not just reuse the features from virtio?
> 
> 
>> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
>> index 387e913..3a5579b 100644
>> --- a/include/net/vhost_net.h
>> +++ b/include/net/vhost_net.h
>> @@ -46,6 +46,8 @@ int vhost_set_vring_enable(NetClientState * nc, int enable);
>>   
>>   uint64_t vhost_net_get_acked_features(VHostNetState *net);
>>   
>> +void vhost_net_save_acked_features(NetClientState *nc);
>> +
>>   int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>>   
>>   #endif
>> diff --git a/net/vhost-user.c b/net/vhost-user.c
>> index 74f349c..c512cc9 100644
>> --- a/net/vhost-user.c
>> +++ b/net/vhost-user.c
>> @@ -258,11 +258,7 @@ static void chr_closed_bh(void *opaque)
>>       s = DO_UPCAST(NetVhostUserState, nc, ncs[0]);
>>   
>>       for (i = queues -1; i >= 0; i--) {
>> -        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
>> -
>> -        if (s->vhost_net) {
>> -            s->acked_features = vhost_net_get_acked_features(s->vhost_net);
>> -        }
>> +        vhost_user_save_acked_features(ncs[i], false);
>>       }
>>   
>>       qmp_set_link(name, false, &err);
>> -- 
>> 1.8.3.1
> 

