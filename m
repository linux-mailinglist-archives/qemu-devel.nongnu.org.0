Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8865E62617E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:38:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYux-0004hp-73; Fri, 11 Nov 2022 13:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1otYur-0004eW-Df
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:38:14 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1otYuo-0000FT-K4
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:38:13 -0500
HMM_SOURCE_IP: 172.18.0.188:54558.627353484
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.98.254 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id BCB662800BD;
 Sat, 12 Nov 2022 02:37:55 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([171.223.98.254])
 by app0023 with ESMTP id 089c878a9ac540f5ab5d24260480877f for mst@redhat.com; 
 Sat, 12 Nov 2022 02:38:00 CST
X-Transaction-ID: 089c878a9ac540f5ab5d24260480877f
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 171.223.98.254
X-MEDUSA-Status: 0
Message-ID: <d9d76ade-de3d-4295-bfe2-ac669b59c570@chinatelecom.cn>
Date: Sat, 12 Nov 2022 02:37:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v3 2/2] vhost-net: Fix the virtio features negotiation flaw
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Guoyi Tu <tugy@chinatelecom.cn>
References: <cover.1667136717.git.huangy81@chinatelecom.cn>
 <2560bb4e8cabc550da07162c520aff3669a8f56f.1667136717.git.huangy81@chinatelecom.cn>
 <20221110135637-mutt-send-email-mst@kernel.org>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <20221110135637-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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



在 2022/11/11 3:00, Michael S. Tsirkin 写道:
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
> 
> I'm not sure how is this change even related to what we
> are trying to do (fix a bug). Explain here?
> 
For this series, all we want to do is to making sure acked_features
in the NetVhostUserState is credible and uptodate in the scenario that 
virtio features negotiation and openvswitch service restart happens 
simultaneously.

To make sure that happens, we save the acked_features to 
NetVhostUserState right after guest setting virtio-net features.

Assume that we do not save acked_features to NetVhostUserState just as 
it is, the acked_features in NetVhostUserState has chance to be assigned 
only when chr_closed_bh/vhost_user_stop happen. Note that openvswitch 
service stop will cause chr_closed_bh happens and acked_features in 
vhost_dev will be stored into NetVhostUserState, if the acked_features 
in vhost_dev are out-of-date(may be updated in the next few seconds), so 
does the acked_features in NetVhostUserState after doing the assignment, 
this is the bug.

Let's refine the scenario and derive the bug:
     qemu thread                    		       dpdk
         |                                               |
    vhost_net_init()             		    	|
         |					 	|
  assign acked_features in vhost_dev                     |
    with 0x40000000               	                |
         |                    		       openvswitch.service stop
    chr_closed_bh                                        |
         |                                              	|
  assign acked_features in				|
  NetVhostUserState with 0x40000000 			|
         |						|
    virtio_net_set_features()                     	|
         |                     				|
  assign acked_features in vhost_dev			|
    with 0x7060a782					|
         |                                      openvswitch.service start
         |                                               |
    vhost_user_start                                     |
         |                                               |
  assign acked_features in vhost_dev                     |
    with 0x40000000                                      |
         |                                               |

As the step shows, if we do not keep the acked_features in 
NetVhostUserState up-to-date, the acked_features in vhost_dev may be 
reloaded with the wrong value(eg, 0x40000000) when vhost_user_start happens.
> 
> 
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
> 
> 
> Split this last chunk into a patch of its own?
> 
>> -- 
>> 1.8.3.1
> 

