Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A8B5AD080
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:48:05 +0200 (CEST)
Received: from localhost ([::1]:36806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9e8-0007xH-9R
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oV9Em-0001hh-Eu
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:21:53 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:59985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oV9Ef-0005aW-9y
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:21:47 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VOQTOcl_1662373298; 
Received: from 30.227.174.138(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VOQTOcl_1662373298) by smtp.aliyun-inc.com;
 Mon, 05 Sep 2022 18:21:39 +0800
Message-ID: <10afbebd-20b5-8408-5c85-91a1038bb9bd@linux.alibaba.com>
Date: Mon, 5 Sep 2022 18:21:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 11/15] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_restart()
To: Jason Wang <jasowang@redhat.com>
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
 <6c20c0a02ed0e08565bf3692cef476ba52332720.1661414345.git.kangjie.xu@linux.alibaba.com>
 <db9c8bcd-01f0-d9de-18f6-63f03a00e830@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
In-Reply-To: <db9c8bcd-01f0-d9de-18f6-63f03a00e830@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.43;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-43.freemail.mail.aliyun.com
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


在 2022/9/5 16:24, Jason Wang 写道:
>
> 在 2022/8/25 16:08, Kangjie Xu 写道:
>> Introduce vhost_net_virtqueue_restart(), which can restart the
>> specific virtqueue when the vhost net started running before.
>> If it fails to restart the virtqueue, the device will be stopped.
>>
>> Here we do not reuse vhost_net_start_one() or vhost_dev_start()
>> because they work at queue pair level. The mem table and features
>> do not change, so we can call the vhost_virtqueue_start() to
>> restart a specific queue.
>>
>> This patch only considers the case of vhost-kernel, when
>> NetClientDriver is NET_CLIENT_DRIVER_TAP.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/net/vhost_net.c      | 52 +++++++++++++++++++++++++++++++++++++++++
>>   include/net/vhost_net.h |  2 ++
>>   2 files changed, 54 insertions(+)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index be51be98b3..0716f6cd96 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -536,3 +536,55 @@ void vhost_net_virtqueue_reset(VirtIODevice 
>> *vdev, NetClientState *nc,
>>         vhost_virtqueue_unmap(&net->dev, vdev, net->dev.vqs + idx, idx);
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
>
>
> Should we return error in this case?
>
> Thanks

Yes, I think so. Will fix.

Thanks.

>
>> +
>> +    /* should only be called after backend is connected */
>> +    assert(vhost_ops);
>> +
>> +    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
>> +
>> +    r = vhost_virtqueue_start(&net->dev,
>> +                              vdev,
>> +                              net->dev.vqs + idx,
>> +                              net->dev.vq_index + idx);
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
>> index 85d85a4957..40b9a40074 100644
>> --- a/include/net/vhost_net.h
>> +++ b/include/net/vhost_net.h
>> @@ -50,4 +50,6 @@ int vhost_net_set_mtu(struct vhost_net *net, 
>> uint16_t mtu);
>>     void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState 
>> *nc,
>>                                  int vq_index);
>> +int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
>> +                                int vq_index);
>>   #endif

