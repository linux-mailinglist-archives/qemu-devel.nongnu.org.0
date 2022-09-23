Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA195E727C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 05:36:30 +0200 (CEST)
Received: from localhost ([::1]:56952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obZUL-0003HS-1k
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 23:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenh@yusur.tech>)
 id 1obZQd-0007nj-KV; Thu, 22 Sep 2022 23:32:39 -0400
Received: from out28-51.mail.aliyun.com ([115.124.28.51]:48128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenh@yusur.tech>)
 id 1obZQY-0001VM-FL; Thu, 22 Sep 2022 23:32:39 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436703|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0200397-0.000481798-0.979478;
 FP=18208589922881321024|4|2|3|0|-1|-1|-1; HT=ay29a033018047202;
 MF=chenh@yusur.tech; NM=1; PH=DS; RN=10; RT=10; SR=0;
 TI=SMTPD_---.PMEZbA4_1663903497; 
Received: from 192.168.10.130(mailfrom:chenh@yusur.tech
 fp:SMTPD_---.PMEZbA4_1663903497) by smtp.aliyun-inc.com;
 Fri, 23 Sep 2022 11:24:58 +0800
Message-ID: <fbf87d19-f7ab-dfdb-9f93-4087262cad57@yusur.tech>
Date: Fri, 23 Sep 2022 11:21:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa device's mac
 address automatically
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "hreitz@redhat.com"
 <hreitz@redhat.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "houyl@yusur.tech" <houyl@yusur.tech>, "zy@yusur.tech" <zy@yusur.tech>,
 "lulu@redhat.com" <lulu@redhat.com>
References: <20220921060026.392164-1-chenh@yusur.tech>
 <BL3PR02MB79380882D0B877C2D5A754FFEA4F9@BL3PR02MB7938.namprd02.prod.outlook.com>
 <CACGkMEttGsDrFo_U7AKHEof0HwVfHaRTeQSRE+QTiRPPtnU3hQ@mail.gmail.com>
 <20220922055531-mutt-send-email-mst@kernel.org>
From: =?UTF-8?B?6ZmI5rWp?= <chenh@yusur.tech>
In-Reply-To: <20220922055531-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.28.51; envelope-from=chenh@yusur.tech;
 helo=out28-51.mail.aliyun.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.893,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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


On 2022/9/22 17:56, Michael S. Tsirkin wrote:
> On Thu, Sep 22, 2022 at 09:34:41AM +0800, Jason Wang wrote:
>> On Thu, Sep 22, 2022 at 1:58 AM Raphael Norwitz
>> <raphael.norwitz@nutanix.com> wrote:
>>> If I read your response on the other thread correctly, this change is intended
>>>
>>> to prioritize the MAC address exposed by DPDK over the one provided by the
>>>
>>> QEMU command line? Sounds reasonable in principle, but I would get confirmation
>>>
>>> from vDPA/vhost-net maintainers.
>> I think the best way is to (and it seems easier)
>>
>> 1) have the management layer to make sure the mac came from cli
>> matches the underlayer vDPA
>> 2) having a sanity check and fail the device initialization if they don't match
>>
>> Thanks
> I think I agree, we should not overwrite user supplied arguments.
> I think the case where we might want to get the mac from VDPA
> and use it is when it's been assigned randomly as opposed to coming from cli.
Yes, when the cli passes in a random mac address that is inconsistent 
with the vdpa device, qemu still starts the virtual machine as usual, 
but in this case, the qemu and vdpa environments do not work correctly. 
So I want to get mac address directly from vdpa device instead of cli.

Having a sanity check and fail the device initialization if they don't 
match is a good idea, but it seems more convenient to directly overwrite 
the cli mac address.
>
>
>>>
>>>
>>> That said the way you’re hacking the vhost-user code breaks a valuable check for
>>>
>>> bad vhost-user-blk backends. I would suggest finding another implementation which
>>>
>>> does not regress functionality for other device types.
>>>
>>>
>>>
>>>
>>>
>>>> From: Hao Chen <chenh@yusur.tech>
>>>> When use dpdk-vdpa tests vdpa device. You need to specify the mac address to
>>>> start the virtual machine through libvirt or qemu, but now, the libvirt or
>>>> qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_net_get_config
>>>> to get the mac address of the vdpa hardware without manual configuration.
>>>> v1->v2:
>>>> Only copy ETH_ALEN data of netcfg for some vdpa device such as
>>>> NVIDIA BLUEFIELD DPU(BF2)'s netcfg->status is not right.
>>>> We only need the mac address and don't care about the status field.
>>>> Signed-off-by: Hao Chen <chenh@yusur.tech>
>>>> ---
>>>> hw/block/vhost-user-blk.c |  1 -
>>>> hw/net/virtio-net.c       |  7 +++++++
>>>> hw/virtio/vhost-user.c    | 19 -------------------
>>>> 3 files changed, 7 insertions(+), 20 deletions(-)
>>>> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
>>>> index 9117222456..5dca4eab09 100644
>>>> --- a/hw/block/vhost-user-blk.c
>>>> +++ b/hw/block/vhost-user-blk.c
>>>> @@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
>>>>      vhost_dev_set_config_notifier(&s->dev, &blk_ops);
>>>> -    s->vhost_user.supports_config = true;
>>>>      ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0,
>>>>                           errp);
>>>>      if (ret < 0) {
>>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>>> index dd0d056fde..90405083b1 100644
>>>> --- a/hw/net/virtio-net.c
>>>> +++ b/hw/net/virtio-net.c
>>>> @@ -166,6 +166,13 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>>>>              }
>>>>              memcpy(config, &netcfg, n->config_size);
>>>>          }
>>>> +    } else if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
>>>> +        ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
>>>> +                                   n->config_size);
>>>> +        if (ret != -1) {
>>>> +               /* Automatically obtain the mac address of the vdpa device
>>>> +                * when using the dpdk vdpa */
>>>> +                memcpy(config, &netcfg, ETH_ALEN);
>>>>      }
>>>> }
>>>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>>>> index bd24741be8..8b01078249 100644
>>>> --- a/hw/virtio/vhost-user.c
>>>> +++ b/hw/virtio/vhost-user.c
>>>> @@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>>>>      }
>>>>      if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
>>>> -        bool supports_f_config = vus->supports_config ||
>>>> -            (dev->config_ops && dev->config_ops->vhost_dev_config_notifier);
>>>>          uint64_t protocol_features;
>>>>          dev->backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
>>>> @@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>>>>           */
>>>>          protocol_features &= VHOST_USER_PROTOCOL_FEATURE_MASK;
>>>> -        if (supports_f_config) {
>>>> -            if (!virtio_has_feature(protocol_features,
>>>> -                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
>>>> -                error_setg(errp, "vhost-user device expecting "
>>>> -                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
>>>> -                           "not support it.");
>>>> -                return -EPROTO;
>>>> -            }
>>>> -        } else {
>>>> -            if (virtio_has_feature(protocol_features,
>>>> -                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
>>>> -                warn_reportf_err(*errp, "vhost-user backend supports "
>>>> -                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
>>>> -                protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
>>>> -            }
>>>> -        }
>>>> -
>>>>          /* final set of protocol features */
>>>>          dev->protocol_features = protocol_features;
>>>>          err = vhost_user_set_protocol_features(dev, dev->protocol_features);
>>>> --
>>>> 2.27.0
>>>
>

