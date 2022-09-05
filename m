Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B035AD0E1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:58:29 +0200 (CEST)
Received: from localhost ([::1]:35586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9oC-00015R-J9
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oV99D-0007wp-5x
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:16:08 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:34954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oV993-0004iN-TI
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:16:00 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VOR5xt1_1662372941; 
Received: from 30.227.174.138(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VOR5xt1_1662372941) by smtp.aliyun-inc.com;
 Mon, 05 Sep 2022 18:15:42 +0800
Message-ID: <4b733015-fed4-f22a-a693-c83cd74938aa@linux.alibaba.com>
Date: Mon, 5 Sep 2022 18:15:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 10/15] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_reset()
To: Jason Wang <jasowang@redhat.com>
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
 <b6286db2a6ce2389f44cc44da06c9fd2b8eaaec8.1661414345.git.kangjie.xu@linux.alibaba.com>
 <e6ce97bd-a121-04c5-8984-95906f34a15c@redhat.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
In-Reply-To: <e6ce97bd-a121-04c5-8984-95906f34a15c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.56;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-56.freemail.mail.aliyun.com
X-Spam_score_int: -108
X-Spam_score: -10.9
X-Spam_bar: ----------
X-Spam_report: (-10.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.978, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


在 2022/9/5 16:03, Jason Wang 写道:
>
> 在 2022/8/25 16:08, Kangjie Xu 写道:
>> Introduce vhost_virtqueue_reset(), which can reset the specific
>> virtqueue in the device. Then it will unmap vrings and the desc
>> of the virtqueue.
>>
>> Here we do not reuse the vhost_net_stop_one() or vhost_dev_stop(),
>> because they work at queue pair level. We do not use
>> vhost_virtqueue_stop() because it may stop the device in the
>> backend.
>
>
> So I think this is not true at least for vhost-net kernel baceknd.
>
>
But vhost-user(OVS-DPDK) will stop the device.

When DPDK vhost received VHOST_USER_GET_VRING_BASE message, it will call 
vhost_destroy_device_notify() to destroy the device.

It seems like it is a inconsistency error in DPDK. Maybe I should submit 
a patch to DPDK. We can stop the device only when all the virtqueues in 
one device are destroyed.

>>
>> This patch only considers the case of vhost-kernel, when
>> NetClientDriver is NET_CLIENT_DRIVER_TAP.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/net/vhost_net.c      | 22 ++++++++++++++++++++++
>>   include/net/vhost_net.h |  2 ++
>>   2 files changed, 24 insertions(+)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index ccac5b7a64..be51be98b3 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -514,3 +514,25 @@ int vhost_net_set_mtu(struct vhost_net *net, 
>> uint16_t mtu)
>>         return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
>>   }
>> +
>> +void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
>> +                               int vq_index)
>> +{
>> +    VHostNetState *net = get_vhost_net(nc->peer);
>> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
>> +    struct vhost_vring_file file = { .fd = -1 };
>> +    int idx;
>> +
>> +    /* should only be called after backend is connected */
>> +    assert(vhost_ops);
>> +
>> +    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
>> +
>> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
>> +        file.index = idx;
>> +        int r = vhost_net_set_backend(&net->dev, &file);
>> +        assert(r >= 0);
>> +    }
>
>
> Do we need to reset e.g last_avail_idx here?
>
> Thanks
>
I did not reset it because we will re-configure them when we restart 
virtqueue.

Thanks

>
>> +
>> +    vhost_virtqueue_unmap(&net->dev, vdev, net->dev.vqs + idx, idx);
>> +}
>> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
>> index 387e913e4e..85d85a4957 100644
>> --- a/include/net/vhost_net.h
>> +++ b/include/net/vhost_net.h
>> @@ -48,4 +48,6 @@ uint64_t vhost_net_get_acked_features(VHostNetState 
>> *net);
>>     int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>>   +void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState 
>> *nc,
>> +                               int vq_index);
>>   #endif

