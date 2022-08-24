Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E259F60B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:16:02 +0200 (CEST)
Received: from localhost ([::1]:54220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmUT-00007p-SU
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmGy-00044Y-4r
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:02:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmGv-00046Y-2e
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661331719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ukmlk3p1y7Um72V3zijDRtvIng2yf5Vtbub9CfTyWKM=;
 b=HwiHO4d3GRPLY8sNB8gYG0uSOsEkYJ0P/SdFS8WyhqFRP+0jJyB5hdgVI1cIVntCXnIwZU
 04w7A3TLVKDDt+LOVmvuXtoIgkJLawcGZbOCrgNwuhTD3iIuaEkhZppPhTrQ1Jscjk9ZTq
 gQl8x99bdyGERZFQCXFGW5Xhc+EHwV8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-184-LJEtfg0mPy-mGq3hfWTc8A-1; Wed, 24 Aug 2022 05:01:57 -0400
X-MC-Unique: LJEtfg0mPy-mGq3hfWTc8A-1
Received: by mail-pg1-f200.google.com with SMTP id
 g10-20020a63564a000000b0042aa3915494so3979562pgm.18
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Ukmlk3p1y7Um72V3zijDRtvIng2yf5Vtbub9CfTyWKM=;
 b=QcOqAGVOAZITmXPIfhW+Xx4AtiSLmSYvgMW+8eCusJ+RpTNWVu+KA20Lo5IiBSexFK
 8jbTvY1b+fd6wbxxqQ1nyBRFCfWUKPfNPjdw5vfdl7yI0NTjgkR5hA2mPWFFYwohbGtm
 xXs9CJUUIVMts7XnyccAPjoIy1FynkvVKEfLdSW40eAK19YB6rNpXIEr9lxV7/mGAJ++
 ABKgp2n7bq0OAnUHB3ogzb2v1d+q7hM25bAC9sMOdNEGlBk1n107bNlVX1hvhchwDwTd
 eAuZ/Msq0mnubjnTi0FrjlbjONUyzsTZ6pf3ETBnhR9sL1eDjdk9+rF6/GXRZkBt+s6L
 BpQA==
X-Gm-Message-State: ACgBeo3QyLO7oFeyptDoftpifCc3DOfOjNZd+aX6P5pspDSOWFk6yedA
 1JKXzEV0IHEVkHg7ODdaaFwaQUbGNsYPYAIj1w0MpRt8lvDfS5ovmggGcRcv43Fh2jfKE0WhtwP
 VdK9hYrEqEkJIszk=
X-Received: by 2002:a63:ec4d:0:b0:42a:247d:fd7f with SMTP id
 r13-20020a63ec4d000000b0042a247dfd7fmr22442378pgj.151.1661331716173; 
 Wed, 24 Aug 2022 02:01:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7sLrutZEFaU1Hs+RwS833dbREdOCDMg81x9laVqBH7AFxhxND2B95nrnB0D+KmDDeicoT/6w==
X-Received: by 2002:a63:ec4d:0:b0:42a:247d:fd7f with SMTP id
 r13-20020a63ec4d000000b0042a247dfd7fmr22442351pgj.151.1661331715861; 
 Wed, 24 Aug 2022 02:01:55 -0700 (PDT)
Received: from [10.72.13.130] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 p4-20020aa79e84000000b00535fd0cb58bsm10754665pfq.111.2022.08.24.02.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 02:01:55 -0700 (PDT)
Message-ID: <35c12f59-a16e-aeaf-5e41-60238df69d9c@redhat.com>
Date: Wed, 24 Aug 2022 17:01:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 12/24] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_restart()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <be4731ad4548af158396dc5005b656ceb147d3ad.1660611460.git.kangjie.xu@linux.alibaba.com>
 <23bcc037-8b71-a4f4-9b11-7062b024d4ff@redhat.com>
 <29c2e3a5-b137-d16d-a8d3-af74a49fa1f7@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <29c2e3a5-b137-d16d-a8d3-af74a49fa1f7@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/8/24 10:53, Kangjie Xu 写道:
>
> 在 2022/8/24 10:44, Jason Wang 写道:
>>
>> 在 2022/8/16 09:06, Kangjie Xu 写道:
>>> Introduce vhost_net_virtqueue_restart(), which can restart the
>>> virtqueue when the vhost net started running before. If it fails
>>> to restart the virtqueue, the device will be stopped.
>>>
>>> This patch only considers the case for vhost-kernel, when
>>> NetClientDriver is NET_CLIENT_DRIVER_TAP.
>>>
>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>
>>
>> I would explain why current 
>> vhost_net_start_one()/vhost_net_stop_one() can't work. Is it because 
>> it works at queue pair level? If yes can we restructure the code and 
>> try to reuse ?
>>
>> Thanks
>>
> Because vhost_net_start_one()/vhost_net_stop_one() works at device level.
>
> The queue pair level start/stop are vhost_virtqueue_start() and 
> vhost_virtqueue_stop().
>
> What we can reuse is the vhost_virtqueue_start(). 
> vhost_virtqueue_stop() cannot be reused because it will destroy device.


Let's add this in the changelog or a comment in the code.

Thanks


>
> I think we do not need to restructure because we've already had an 
> abstraction vhost_virtqueue_start().
>
> Thanks.
>
>>
>>> ---
>>>   hw/net/vhost_net.c      | 48 
>>> +++++++++++++++++++++++++++++++++++++++++
>>>   include/net/vhost_net.h |  2 ++
>>>   2 files changed, 50 insertions(+)
>>>
>>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>>> index aa60dd901c..2ab67e875e 100644
>>> --- a/hw/net/vhost_net.c
>>> +++ b/hw/net/vhost_net.c
>>> @@ -535,3 +535,51 @@ void vhost_net_virtqueue_stop(VirtIODevice 
>>> *vdev, NetClientState *nc,
>>>         vhost_dev_virtqueue_stop(&net->dev, vdev, idx);
>>>   }
>>> +
>>> +int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState 
>>> *nc,
>>> +                                int vq_index)
>>> +{
>>> +    VHostNetState *net = get_vhost_net(nc->peer);
>>> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
>>> +    struct vhost_vring_file file = { };
>>> +    int idx, r;
>>> +
>>> +    if (!net->dev.started) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    assert(vhost_ops);
>>> +
>>> +    idx =  vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
>>> +
>>> +    r = vhost_dev_virtqueue_restart(&net->dev, vdev, idx);
>>> +    if (r < 0) {
>>> +        goto err_start;
>>> +    }
>>> +
>>> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
>>> +        file.index = idx;
>>> +        file.fd = net->backend;
>>> +        r = vhost_net_set_backend(&net->dev, &file);
>>> +        if (r < 0) {
>>> +            r = -errno;
>>> +            goto err_start;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +
>>> +err_start:
>>> +    error_report("Error when restarting the queue.");
>>> +
>>> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
>>> +        file.fd = -1;
>>> +        file.index = idx;
>>> +        int r = vhost_net_set_backend(&net->dev, &file);
>>> +        assert(r >= 0);
>>> +    }
>>> +
>>> +    vhost_dev_stop(&net->dev, vdev);
>>> +
>>> +    return r;
>>> +}
>>> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
>>> index 9b3aaf3814..e11a297380 100644
>>> --- a/include/net/vhost_net.h
>>> +++ b/include/net/vhost_net.h
>>> @@ -50,4 +50,6 @@ int vhost_net_set_mtu(struct vhost_net *net, 
>>> uint16_t mtu);
>>>     void vhost_net_virtqueue_stop(VirtIODevice *vdev, NetClientState 
>>> *nc,
>>>                                 int vq_index);
>>> +int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState 
>>> *nc,
>>> +                                int vq_index);
>>>   #endif
>


