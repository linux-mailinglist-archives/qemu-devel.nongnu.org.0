Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAFD59F626
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:25:40 +0200 (CEST)
Received: from localhost ([::1]:44420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmdn-0005GT-3H
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmHt-0005UU-DC
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmHr-0004CY-MH
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661331779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jh3/gqzGmhQNgJ2l044sT3eZ+7r8PsMMEOrq0lQOxtI=;
 b=SMRbL1nf2dTt9FLtDSRevrXife6HBWlev2P39iPy24iSKCxpvPvHjhh77AflxT/vRNeMC0
 mk77i8ZibnQHLyyBopPGynBLeXDt1ckmbG/bMnoaySci0mdS9x3STKfX09ukAozomVzgPs
 XWhQF4W+HYGRQkhZ2XsvFmxdwMEANBM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-P3XRQoyKNmq0OWhg8GG-Xg-1; Wed, 24 Aug 2022 05:02:57 -0400
X-MC-Unique: P3XRQoyKNmq0OWhg8GG-Xg-1
Received: by mail-pl1-f200.google.com with SMTP id
 s8-20020a170902ea0800b00172e456031eso5708690plg.3
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=jh3/gqzGmhQNgJ2l044sT3eZ+7r8PsMMEOrq0lQOxtI=;
 b=o27Au3kthQuyZ+vC/KPFaH4C9e2W5cd1DpbZdPD1g3HHKm2ZPuMrAlbUhxB9itusry
 iY3kSlwsR3FmEZHdOsdSxI4PwvqLz2p8ehFQPZ6bxEjobu7DQ1Hy5CYGjJN5ICvCTqnI
 FoFbwLPxu7r8j/JGCQN4mYzpgDUbUhooDvQBl1sAw8XQVM9VvN9HxFx+DdXEHOuYbAOw
 F26FqhqEQuJ2WdTy66BvV6hNnAdgCsb/RZW/0RhvzvBaf/ItT95ES8iQO5r6GenPjdPr
 5+pa9vdQiPsNwFvqM2cw53eL1LwW20HsbpW4q/cLxO46DQ76DOV897c69SZYxX142E/b
 KB7g==
X-Gm-Message-State: ACgBeo3aIBqC1mJHOXbS6qwhnVbgDsvCe7HNeawtx7YiL4ne2gSJhcuP
 fOj6KC1fyl5gEVuNNqcFfpGKNMSy2gETVgUDGIbyHrQwEcpbeAjp21LUWDDeOFl+uSeIQjHEVhT
 FABEK/ISk7zeWLRw=
X-Received: by 2002:a17:90b:38cf:b0:1fb:783c:e0f with SMTP id
 nn15-20020a17090b38cf00b001fb783c0e0fmr3960015pjb.204.1661331776590; 
 Wed, 24 Aug 2022 02:02:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR51A1gciRJUrcGybDlCqLBPGda27REUWbo/cnDl2RUUuZzi8iox5KkHUSpR1VVI80WlwFYunw==
X-Received: by 2002:a17:90b:38cf:b0:1fb:783c:e0f with SMTP id
 nn15-20020a17090b38cf00b001fb783c0e0fmr3959991pjb.204.1661331776304; 
 Wed, 24 Aug 2022 02:02:56 -0700 (PDT)
Received: from [10.72.13.130] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a634b09000000b004114cc062f0sm10417706pga.65.2022.08.24.02.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 02:02:55 -0700 (PDT)
Message-ID: <40b968c3-96fc-fff5-4849-f899e261f7e5@redhat.com>
Date: Wed, 24 Aug 2022 17:02:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 15/24] vhost-user: add op to enable or disable a single
 vring
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <9507fa8179afe9d02dfa03a3dbf6424cd5eba437.1660611460.git.kangjie.xu@linux.alibaba.com>
 <8fc12420-f171-e015-6666-0a40b1bdf85c@redhat.com>
 <4e6e5211-04f7-f27c-cbfd-6393b412b769@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <4e6e5211-04f7-f27c-cbfd-6393b412b769@linux.alibaba.com>
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


在 2022/8/24 11:09, Kangjie Xu 写道:
>
> 在 2022/8/24 10:53, Jason Wang 写道:
>>
>> 在 2022/8/16 09:06, Kangjie Xu 写道:
>>> The interface to set enable status for a single vring is lacked in
>>> VhostOps, since the vhost_set_vring_enable_op will manipulate all
>>> virtqueues in a device.
>>>
>>> Resetting a single vq will rely on this interface.
>>>
>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>> ---
>>>   hw/virtio/vhost-user.c            | 26 +++++++++++++++++++-------
>>>   include/hw/virtio/vhost-backend.h |  3 +++
>>>   2 files changed, 22 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>>> index 56033f7a92..8307976cda 100644
>>> --- a/hw/virtio/vhost-user.c
>>> +++ b/hw/virtio/vhost-user.c
>>> @@ -1199,6 +1199,22 @@ static int vhost_user_set_vring_base(struct 
>>> vhost_dev *dev,
>>>       return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
>>>   }
>>>   +static int vhost_user_set_single_vring_enable(struct vhost_dev *dev,
>>> +                                              int index,
>>> +                                              int enable)
>>> +{
>>> +    if (index < dev->vq_index || index >= dev->vq_index + dev->nvqs) {
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    struct vhost_vring_state state = {
>>> +        .index = index,
>>> +        .num   = enable,
>>> +    };
>>> +
>>> +    return vhost_set_vring(dev, VHOST_USER_SET_VRING_ENABLE, &state);
>>> +}
>>> +
>>>   static int vhost_user_set_vring_enable(struct vhost_dev *dev, int 
>>> enable)
>>>   {
>>>       int i;
>>> @@ -1208,13 +1224,8 @@ static int vhost_user_set_vring_enable(struct 
>>> vhost_dev *dev, int enable)
>>>       }
>>>         for (i = 0; i < dev->nvqs; ++i) {
>>> -        int ret;
>>> -        struct vhost_vring_state state = {
>>> -            .index = dev->vq_index + i,
>>> -            .num   = enable,
>>> -        };
>>> -
>>> -        ret = vhost_set_vring(dev, VHOST_USER_SET_VRING_ENABLE, 
>>> &state);
>>
>>
>> Then I'd squash this into previous patch or re-roder to let this 
>> patch (vhost_user_set_single_vring_enable()) to be first.
>>
>> Thanks
>>
>>
> Sorry, I don't get why we should re-order them, since these two 
> patches are independent.


I meant it's not good to introduce some codes in patch 14 but delete 
them in patch 15 (the above part for example).

Thanks


>
> Thanks
>
>>> +        int ret = vhost_user_set_single_vring_enable(dev, 
>>> dev->vq_index + i,
>>> +                                                     enable);
>>>           if (ret < 0) {
>>>               /*
>>>                * Restoring the previous state is likely infeasible, 
>>> as well as
>>> @@ -2668,6 +2679,7 @@ const VhostOps user_ops = {
>>>           .vhost_reset_vring = vhost_user_reset_vring,
>>>           .vhost_reset_device = vhost_user_reset_device,
>>>           .vhost_get_vq_index = vhost_user_get_vq_index,
>>> +        .vhost_set_single_vring_enable = 
>>> vhost_user_set_single_vring_enable,
>>>           .vhost_set_vring_enable = vhost_user_set_vring_enable,
>>>           .vhost_requires_shm_log = vhost_user_requires_shm_log,
>>>           .vhost_migration_done = vhost_user_migration_done,
>>> diff --git a/include/hw/virtio/vhost-backend.h 
>>> b/include/hw/virtio/vhost-backend.h
>>> index f23bf71a8d..38f6b752ff 100644
>>> --- a/include/hw/virtio/vhost-backend.h
>>> +++ b/include/hw/virtio/vhost-backend.h
>>> @@ -83,6 +83,8 @@ typedef int (*vhost_reset_vring_op)(struct 
>>> vhost_dev *dev,
>>>                                       struct vhost_vring_state *ring);
>>>   typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
>>>   typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
>>> +typedef int (*vhost_set_single_vring_enable_op)(struct vhost_dev *dev,
>>> +                                                int index, int 
>>> enable);
>>>   typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
>>>                                            int enable);
>>>   typedef bool (*vhost_requires_shm_log_op)(struct vhost_dev *dev);
>>> @@ -158,6 +160,7 @@ typedef struct VhostOps {
>>>       vhost_reset_device_op vhost_reset_device;
>>>       vhost_reset_vring_op vhost_reset_vring;
>>>       vhost_get_vq_index_op vhost_get_vq_index;
>>> +    vhost_set_single_vring_enable_op vhost_set_single_vring_enable;
>>>       vhost_set_vring_enable_op vhost_set_vring_enable;
>>>       vhost_requires_shm_log_op vhost_requires_shm_log;
>>>       vhost_migration_done_op vhost_migration_done;
>


