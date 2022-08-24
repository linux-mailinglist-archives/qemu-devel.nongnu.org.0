Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435FA59F189
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 04:55:08 +0200 (CEST)
Received: from localhost ([::1]:47050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQgXr-0001uY-DF
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 22:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQgWP-0000WV-Nl
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:53:37 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:52259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQgWK-0007NV-V7
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:53:35 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VN5GRck_1661309601; 
Received: from 30.227.72.120(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VN5GRck_1661309601) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 10:53:22 +0800
Message-ID: <29c2e3a5-b137-d16d-a8d3-af74a49fa1f7@linux.alibaba.com>
Date: Wed, 24 Aug 2022 10:53:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 12/24] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_restart()
To: Jason Wang <jasowang@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <be4731ad4548af158396dc5005b656ceb147d3ad.1660611460.git.kangjie.xu@linux.alibaba.com>
 <23bcc037-8b71-a4f4-9b11-7062b024d4ff@redhat.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
In-Reply-To: <23bcc037-8b71-a4f4-9b11-7062b024d4ff@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.45;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-45.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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


在 2022/8/24 10:44, Jason Wang 写道:
>
> 在 2022/8/16 09:06, Kangjie Xu 写道:
>> Introduce vhost_net_virtqueue_restart(), which can restart the
>> virtqueue when the vhost net started running before. If it fails
>> to restart the virtqueue, the device will be stopped.
>>
>> This patch only considers the case for vhost-kernel, when
>> NetClientDriver is NET_CLIENT_DRIVER_TAP.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
>
> I would explain why current vhost_net_start_one()/vhost_net_stop_one() 
> can't work. Is it because it works at queue pair level? If yes can we 
> restructure the code and try to reuse ?
>
> Thanks
>
Because vhost_net_start_one()/vhost_net_stop_one() works at device level.

The queue pair level start/stop are vhost_virtqueue_start() and 
vhost_virtqueue_stop().

What we can reuse is the vhost_virtqueue_start(). vhost_virtqueue_stop() 
cannot be reused because it will destroy device.

I think we do not need to restructure because we've already had an 
abstraction vhost_virtqueue_start().

Thanks.

>
>> ---
>>   hw/net/vhost_net.c      | 48 +++++++++++++++++++++++++++++++++++++++++
>>   include/net/vhost_net.h |  2 ++
>>   2 files changed, 50 insertions(+)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index aa60dd901c..2ab67e875e 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -535,3 +535,51 @@ void vhost_net_virtqueue_stop(VirtIODevice 
>> *vdev, NetClientState *nc,
>>         vhost_dev_virtqueue_stop(&net->dev, vdev, idx);
>>   }
>> +
>> +int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
>> +                                int vq_index)
>> +{
>> +    VHostNetState *net = get_vhost_net(nc->peer);
>> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
>> +    struct vhost_vring_file file = { };
>> +    int idx, r;
>> +
>> +    if (!net->dev.started) {
>> +        return 0;
>> +    }
>> +
>> +    assert(vhost_ops);
>> +
>> +    idx =  vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
>> +
>> +    r = vhost_dev_virtqueue_restart(&net->dev, vdev, idx);
>> +    if (r < 0) {
>> +        goto err_start;
>> +    }
>> +
>> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
>> +        file.index = idx;
>> +        file.fd = net->backend;
>> +        r = vhost_net_set_backend(&net->dev, &file);
>> +        if (r < 0) {
>> +            r = -errno;
>> +            goto err_start;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +
>> +err_start:
>> +    error_report("Error when restarting the queue.");
>> +
>> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
>> +        file.fd = -1;
>> +        file.index = idx;
>> +        int r = vhost_net_set_backend(&net->dev, &file);
>> +        assert(r >= 0);
>> +    }
>> +
>> +    vhost_dev_stop(&net->dev, vdev);
>> +
>> +    return r;
>> +}
>> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
>> index 9b3aaf3814..e11a297380 100644
>> --- a/include/net/vhost_net.h
>> +++ b/include/net/vhost_net.h
>> @@ -50,4 +50,6 @@ int vhost_net_set_mtu(struct vhost_net *net, 
>> uint16_t mtu);
>>     void vhost_net_virtqueue_stop(VirtIODevice *vdev, NetClientState 
>> *nc,
>>                                 int vq_index);
>> +int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
>> +                                int vq_index);
>>   #endif

