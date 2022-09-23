Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83E65E728D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 05:48:38 +0200 (CEST)
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obZg5-0002N0-T9
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 23:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenh@yusur.tech>)
 id 1obZdD-0000R1-Tn; Thu, 22 Sep 2022 23:45:39 -0400
Received: from out28-3.mail.aliyun.com ([115.124.28.3]:52976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenh@yusur.tech>)
 id 1obZd9-0006IE-DF; Thu, 22 Sep 2022 23:45:39 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0743887|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0167263-0.00048338-0.98279; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047188; MF=chenh@yusur.tech; NM=1; PH=DS; RN=11; RT=11; SR=0;
 TI=SMTPD_---.PMFJVf6_1663903832; 
Received: from 192.168.10.130(mailfrom:chenh@yusur.tech
 fp:SMTPD_---.PMFJVf6_1663903832) by smtp.aliyun-inc.com;
 Fri, 23 Sep 2022 11:30:33 +0800
Message-ID: <0579203c-a6f3-b731-3e09-49e8a226dc78@yusur.tech>
Date: Fri, 23 Sep 2022 11:30:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa device's mac
 address automatically
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: raphael.norwitz@nutanix.com, jasowang@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, qemu-block@nongnu.org, houyl@yusur.tech, zy@yusur.tech,
 lulu@redhat.com, qemu-devel@nongnu.org
References: <20220921060026.392164-1-chenh@yusur.tech>
 <87mtas60x8.fsf@linaro.org> <20220921152402-mutt-send-email-mst@kernel.org>
 <87a66r67uc.fsf@linaro.org> <20220922061828-mutt-send-email-mst@kernel.org>
From: =?UTF-8?B?6ZmI5rWp?= <chenh@yusur.tech>
In-Reply-To: <20220922061828-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.28.3; envelope-from=chenh@yusur.tech;
 helo=out28-3.mail.aliyun.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.893,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/9/22 18:19, Michael S. Tsirkin wrote:
> On Thu, Sep 22, 2022 at 11:02:56AM +0100, Alex Bennée wrote:
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>
>>> On Wed, Sep 21, 2022 at 07:23:12PM +0100, Alex Bennée wrote:
>>>> chenh <chenh@yusur.tech> writes:
>>>>
>>>>> From: Hao Chen <chenh@yusur.tech>
>>>>>
>>>>> When use dpdk-vdpa tests vdpa device. You need to specify the mac address to
>>>>> start the virtual machine through libvirt or qemu, but now, the libvirt or
>>>>> qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_net_get_config
>>>>> to get the mac address of the vdpa hardware without manual configuration.
>>>>>
>>>>> v1->v2:
>>>>> Only copy ETH_ALEN data of netcfg for some vdpa device such as
>>>>> NVIDIA BLUEFIELD DPU(BF2)'s netcfg->status is not right.
>>>>> We only need the mac address and don't care about the status field.
>>>>>
>>>>> Signed-off-by: Hao Chen <chenh@yusur.tech>
>>>>> ---
>>>>>   hw/block/vhost-user-blk.c |  1 -
>>>>>   hw/net/virtio-net.c       |  7 +++++++
>>>>>   hw/virtio/vhost-user.c    | 19 -------------------
>>>>>   3 files changed, 7 insertions(+), 20 deletions(-)
>>>>>
>>>>> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
>>>>> index 9117222456..5dca4eab09 100644
>>>>> --- a/hw/block/vhost-user-blk.c
>>>>> +++ b/hw/block/vhost-user-blk.c
>>>>> @@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
>>>>>   
>>>>>       vhost_dev_set_config_notifier(&s->dev, &blk_ops);
>>>>>   
>>>>> -    s->vhost_user.supports_config = true;
>>>> <snip>
>>>>
>>>> NACK from me. The supports_config flag is there for a reason.
>>>
>>> Alex please, do not send NACKs. If you feel compelled to stress
>>> your point, provide extra justification instead. Thanks!
>> OK I was objecting to ripping out the common vhost-user code which was
>> implemented as a fix for behaviour found while attempting to upstream:
>>
>>    Subject: [PATCH  v4 for 7.2 00/22] virtio-gpio and various virtio cleanups
>>    Date: Tue,  2 Aug 2022 10:49:48 +0100
>>    Message-Id: <20220802095010.3330793-1-alex.bennee@linaro.org>
>>
>> I vhost-user-blk wants to suppress its use of vhost-user config messages
>> I guess that should be a control option but it sounds like a buggy
>> back-end.
> Thanks for the review!

QEMU needs to obtain the mac address of the underlying vdpa hardware 
through the 'vhost_user_get_config' function, but this part of the check 
of virtio_blk makes 'vhost_user_get_config' unusable in virtio-net, 
because 'vhost_user_get_config' depends on the 
VHOST_USER_PROTOCOL_F_CONFIG feature, which is the key point of the 
problem.

Currently I only need to use 'vhost_user_get_config' function, it seems 
not necessary to implement dev->config_ops && 
dev->config_ops->vhost_dev_config_notifier in virtio-net.

Can this part of the checks be moved elsewhere? I don't know how to skip 
this part of the virtio blk related checks to achieve my functionality, 
so I removed those checks. 🙁

>
>>>>>   
>>>>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>>>>> index bd24741be8..8b01078249 100644
>>>>> --- a/hw/virtio/vhost-user.c
>>>>> +++ b/hw/virtio/vhost-user.c
>>>>> @@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>>>>>       }
>>>>>   
>>>>>       if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
>>>>> -        bool supports_f_config = vus->supports_config ||
>>>>> -            (dev->config_ops && dev->config_ops->vhost_dev_config_notifier);
>>>>>           uint64_t protocol_features;
>>>>>   
>>>>>           dev->backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
>>>>> @@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>>>>>            */
>>>>>           protocol_features &= VHOST_USER_PROTOCOL_FEATURE_MASK;
>>>>>   
>>>>> -        if (supports_f_config) {
>>>>> -            if (!virtio_has_feature(protocol_features,
>>>>> -                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
>>>>> -                error_setg(errp, "vhost-user device expecting "
>>>>> -                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
>>>>> -                           "not support it.");
>>>>> -                return -EPROTO;
>>>>> -            }
>>>>> -        } else {
>>>>> -            if (virtio_has_feature(protocol_features,
>>>>> -                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
>>>>> -                warn_reportf_err(*errp, "vhost-user backend supports "
>>>>> -                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
>>>>> -                protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
>>>>> -            }
>>>>> -        }
>>>>> -
>>>>>           /* final set of protocol features */
>>>>>           dev->protocol_features = protocol_features;
>>>>>           err = vhost_user_set_protocol_features(dev, dev->protocol_features);
>>>>
>>>> -- 
>>>> Alex Bennée
>>
>> -- 
>> Alex Bennée

