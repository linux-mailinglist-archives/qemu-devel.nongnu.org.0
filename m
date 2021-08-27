Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529E73F92A7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 05:12:49 +0200 (CEST)
Received: from localhost ([::1]:40664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJSIR-0000xK-Pr
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 23:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mJSHE-00007o-VT
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 23:11:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mJSHB-0008VI-EM
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 23:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630033887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f286+zwKDwYeZ0Si6US+fGcJhTTH7adVwpWH1Z4jau8=;
 b=OEatvWg9LeRsRxyzCicUYQa5P6ifaNTxphecQI1cfMACdZ1O6cMxihHFtL+GAv8bChg9nh
 hmagOEUq4AqWwDQ97hKG/hBmvead19QjeYkAJabAbOLjaSran90S8WqR3JVKv+0OwhImjO
 bFuMsblavqDdDei9U7tjlvLsI3+MQjc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-Yfa9FcmCOMqRoWL42ejvYw-1; Thu, 26 Aug 2021 23:11:26 -0400
X-MC-Unique: Yfa9FcmCOMqRoWL42ejvYw-1
Received: by mail-pj1-f69.google.com with SMTP id
 ci5-20020a17090afc8500b00195cd7d2f7aso1678636pjb.8
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 20:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=f286+zwKDwYeZ0Si6US+fGcJhTTH7adVwpWH1Z4jau8=;
 b=SvqBzZkHP1FvLVOS96DN2BrelKjfXUDC2DOcHBYaFtjPn5nMnfvz/2AwjQvUDOf3dg
 Con5PA7xyDurpV7JEHtCEsUMe7kRC4ORhIrCZ0JQl4LVZu9cjfDU4wAJo+pSe4XyTZKY
 pjXW7XhJF0NY5p5meQ0ODkZy3BAs3VJwCQ8G9s+SNY//TZe6ZosZ+wTgbl+J6ifFXRA9
 2M2JJpuB061eFMLLI28epcTsdvAoWsatQffpBxRTc4oMIHnEV2FcuE1lCvElUqnn0cd6
 YfAUsGaN6kMXnVcGNX9aWbyPi+CEsr4gOdfYC6fpzJd/Wd9MQxl/EeI+sdXJs928Sdho
 HPDA==
X-Gm-Message-State: AOAM531IuQx8a2wETpM5eukzaqqz5veZF7wcXz21IOxcDCXBGXmcYqAg
 AvSKshG8C8aT2bX8veXqvlZwVdvDi4ZJErM4N3G+frFf10FcVN/ZNWYZNdPOmaokVzdLUwi5zGR
 9RwWeY7r39/vGRnk=
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr20132044pjg.202.1630033884979; 
 Thu, 26 Aug 2021 20:11:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzOk0ghaoZF93dIz7JYfv0DYvbN9YIF0ToN/fyhDJKdccbj0mI6KHqdg045UbmO/d8UNCDvA==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr20132007pjg.202.1630033884569; 
 Thu, 26 Aug 2021 20:11:24 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x207sm4608742pfc.177.2021.08.26.20.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 20:11:23 -0700 (PDT)
Subject: Re: [PATCH v6 4/6] qmp: add QMP command x-debug-virtio-queue-status
To: Jonah Palmer <jonah.palmer@oracle.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-5-git-send-email-jonah.palmer@oracle.com>
 <b0c11f6c-31dd-121d-ab27-e83e5afa8596@redhat.com>
 <82c4ad5d-c866-9b25-42b0-d1c3a731ed3a@oracle.com>
 <11a89103-dd0c-26ca-37e1-7e1b0aeac1f3@redhat.com>
 <4e1c3a57-8360-2618-8c74-62e26c1c7aee@oracle.com>
 <d6234a95-4035-8e7a-2def-fd891ee15409@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3c3c1388-0b5a-3e97-af27-b8e96b642cbc@redhat.com>
Date: Fri, 27 Aug 2021 11:11:09 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d6234a95-4035-8e7a-2def-fd891ee15409@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, david@redhat.com, armbru@redhat.com,
 amit@kernel.org, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com, si-wei.liu@oracle.com, pbonzini@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/8/26 下午2:25, Jonah Palmer 写道:
>
> Hi Jason, could I get your thoughts on this implementation question below?
>
> I'm not too sure on how I should proceed determining if vhost is 
> active or not.
>
> Thank you!
>
>
> Jonah
>
> On 7/26/21 5:33 AM, Jonah Palmer wrote:
>>
>>
>> On 7/22/21 5:22 AM, Jason Wang wrote:
>>>
>>> 在 2021/7/21 下午4:59, Jonah Palmer 写道:
>>>>
>>>>
>>>> On 7/13/21 10:37 PM, Jason Wang wrote:
>>>>>
>>>>> 在 2021/7/12 下午6:35, Jonah Palmer 写道:
>>>>>> From: Laurent Vivier <lvivier@redhat.com>
>>>>>>
>>>>>> This new command shows internal status of a VirtQueue.
>>>>>> (vrings and indexes).
>>>>>>
>>>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>>>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>>>>>> ---
>>>>>>   hw/virtio/virtio-stub.c |   6 +++
>>>>>>   hw/virtio/virtio.c      |  37 ++++++++++++++++++
>>>>>>   qapi/virtio.json        | 102 
>>>>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>   3 files changed, 145 insertions(+)
>>>>>>
>>>>>>   [Jonah: Added 'device-type' field to VirtQueueStatus and
>>>>>>   qmp command x-debug-virtio-queue-status.]
>>>>>>
>>>>>> diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
>>>>>> index ddb592f..3c1bf17 100644
>>>>>> --- a/hw/virtio/virtio-stub.c
>>>>>> +++ b/hw/virtio/virtio-stub.c
>>>>>> @@ -17,3 +17,9 @@ VirtioStatus *qmp_x_debug_virtio_status(const 
>>>>>> char* path, Error **errp)
>>>>>>   {
>>>>>>       return qmp_virtio_unsupported(errp);
>>>>>>   }
>>>>>> +
>>>>>> +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
>>>>>> + uint16_t queue, Error **errp)
>>>>>> +{
>>>>>> +    return qmp_virtio_unsupported(errp);
>>>>>> +}
>>>>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>>>>> index 81a0ee8..ccd4371 100644
>>>>>> --- a/hw/virtio/virtio.c
>>>>>> +++ b/hw/virtio/virtio.c
>>>>>> @@ -3935,6 +3935,43 @@ static VirtIODevice 
>>>>>> *virtio_device_find(const char *path)
>>>>>>       return NULL;
>>>>>>   }
>>>>>>   +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char 
>>>>>> *path,
>>>>>> + uint16_t queue, Error **errp)
>>>>>> +{
>>>>>> +    VirtIODevice *vdev;
>>>>>> +    VirtQueueStatus *status;
>>>>>> +
>>>>>> +    vdev = virtio_device_find(path);
>>>>>> +    if (vdev == NULL) {
>>>>>> +        error_setg(errp, "Path %s is not a VirtIO device", path);
>>>>>> +        return NULL;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, 
>>>>>> queue)) {
>>>>>> +        error_setg(errp, "Invalid virtqueue number %d", queue);
>>>>>> +        return NULL;
>>>>>> +    }
>>>>>> +
>>>>>> +    status = g_new0(VirtQueueStatus, 1);
>>>>>> +    status->device_type = qapi_enum_parse(&VirtioType_lookup, 
>>>>>> vdev->name,
>>>>>> + VIRTIO_TYPE_UNKNOWN, NULL);
>>>>>> +    status->queue_index = vdev->vq[queue].queue_index;
>>>>>> +    status->inuse = vdev->vq[queue].inuse;
>>>>>> +    status->vring_num = vdev->vq[queue].vring.num;
>>>>>> +    status->vring_num_default = vdev->vq[queue].vring.num_default;
>>>>>> +    status->vring_align = vdev->vq[queue].vring.align;
>>>>>> +    status->vring_desc = vdev->vq[queue].vring.desc;
>>>>>> +    status->vring_avail = vdev->vq[queue].vring.avail;
>>>>>> +    status->vring_used = vdev->vq[queue].vring.used;
>>>>>> +    status->last_avail_idx = vdev->vq[queue].last_avail_idx;
>>>>>
>>>>>
>>>>> As mentioned in previous versions. We need add vhost support 
>>>>> otherwise the value here is wrong.
>>>> Got it. I'll add a case to determine if vhost is active for a given 
>>>> device.
>>>> So, in the case that vhost is active, should I just not print out 
>>>> the value or would I substitute it with
>>>> another value (whatever that might be)?
>>>
>>>
>>> You can query the vhost for those index.
>>>
>>> (vhost_get_vring_base())
>>>
>>>
>>>>   Same question for shadow_avail_idx below as well.
>>>
>>>
>>> It's an implementation specific. I think we can simply not show it 
>>> if vhost is enabled.
>>>
>>> Thanks
>>
>> Ah I see, thank you!
>>
>> So, it appears to me that it's not very easy to get the struct 
>> vhost_dev pointer from struct VirtIODevice to indicate whether or not 
>> vhost is active, e.g. there's no virtio class-independent way to get 
>> struct vhost_dev.
>>
>> I was thinking of adding an op/callback function to struct 
>> VirtioDeviceClass, e.g. bool has_vhost(VirtIODevice *vdev), and 
>> implement it for each virtio class (net, scsi, blk, etc.).
>>
>> For example, for virtio-net, maybe it'd be something like:
>>
>> bool has_vhost(VirtIODevice *vdev) {
>>    VirtIONet *n = VIRTIO_NET(vdev);
>>    NetClientState *nc = qemu_get_queue(n->nic);
>>    return nc->peer ? get_vhost_net(nc->peer) : false;
>> }


Something like this, yes.


>> Also, for getting the last_avail_idx, I was also thinking of adding 
>> another op/callback to struct VirtioDeviceClass, e.g. unsigned int 
>> get_last_avail_idx(VirtIODevice *vdev, unsigned int vq_idx) that 
>> finds if vhost is active or not and either gets last_avail_idx from 
>> virtio directly or through vhost (e.g. 
>> vhost_dev->vhost_ops->vhost_get_vring_base()).
>>

So I think instead of has_vhost, we probably need get_vhost() to have a 
pointer to vhost_dev. Then we can do anything we want other than a 
dedicated interface just for avail index.

Thanks


>> I wanted to run this by you and get your opinion on this before I 
>> started implementing it in code. Let me know what you think about this.
>>
>>
>> Jonah
>>
>>>
>>>
>>>>
>>>> Jonah
>>>>>
>>>>>
>>>>>> +    status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;
>>>>>
>>>>>
>>>>> The shadow index is something that is implementation specific e.g 
>>>>> in the case of vhost it's kind of meaningless.
>>>>>
>>>>> Thanks
>>>>>
>>>>>
>>>>>> +    status->used_idx = vdev->vq[queue].used_idx;
>>>>>> +    status->signalled_used = vdev->vq[queue].signalled_used;
>>>>>> +    status->signalled_used_valid = 
>>>>>> vdev->vq[queue].signalled_used_valid;
>>>>>> +
>>>>>> +    return status;
>>>>>> +}
>>>>>> +
>>>>>>   #define CONVERT_FEATURES(type, map)                \
>>>>>>       ({                                           \
>>>>>>           type *list = NULL;                         \
>>>>>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>>>>>> index 78873cd..7007e0c 100644
>>>>>> --- a/qapi/virtio.json
>>>>>> +++ b/qapi/virtio.json
>>>>>> @@ -406,3 +406,105 @@
>>>>>>     'data': { 'path': 'str' },
>>>>>>     'returns': 'VirtioStatus'
>>>>>>   }
>>>>>> +
>>>>>> +##
>>>>>> +# @VirtQueueStatus:
>>>>>> +#
>>>>>> +# Status of a VirtQueue
>>>>>> +#
>>>>>> +# @device-type: VirtIO device type
>>>>>> +#
>>>>>> +# @queue-index: VirtQueue queue_index
>>>>>> +#
>>>>>> +# @inuse: VirtQueue inuse
>>>>>> +#
>>>>>> +# @vring-num: VirtQueue vring.num
>>>>>> +#
>>>>>> +# @vring-num-default: VirtQueue vring.num_default
>>>>>> +#
>>>>>> +# @vring-align: VirtQueue vring.align
>>>>>> +#
>>>>>> +# @vring-desc: VirtQueue vring.desc
>>>>>> +#
>>>>>> +# @vring-avail: VirtQueue vring.avail
>>>>>> +#
>>>>>> +# @vring-used: VirtQueue vring.used
>>>>>> +#
>>>>>> +# @last-avail-idx: VirtQueue last_avail_idx
>>>>>> +#
>>>>>> +# @shadow-avail-idx: VirtQueue shadow_avail_idx
>>>>>> +#
>>>>>> +# @used-idx: VirtQueue used_idx
>>>>>> +#
>>>>>> +# @signalled-used: VirtQueue signalled_used
>>>>>> +#
>>>>>> +# @signalled-used-valid: VirtQueue signalled_used_valid
>>>>>> +#
>>>>>> +# Since: 6.1
>>>>>> +#
>>>>>> +##
>>>>>> +
>>>>>> +{ 'struct': 'VirtQueueStatus',
>>>>>> +  'data': {
>>>>>> +    'device-type': 'VirtioType',
>>>>>> +    'queue-index': 'uint16',
>>>>>> +    'inuse': 'uint32',
>>>>>> +    'vring-num': 'int',
>>>>>> +    'vring-num-default': 'int',
>>>>>> +    'vring-align': 'int',
>>>>>> +    'vring-desc': 'uint64',
>>>>>> +    'vring-avail': 'uint64',
>>>>>> +    'vring-used': 'uint64',
>>>>>> +    'last-avail-idx': 'uint16',
>>>>>> +    'shadow-avail-idx': 'uint16',
>>>>>> +    'used-idx': 'uint16',
>>>>>> +    'signalled-used': 'uint16',
>>>>>> +    'signalled-used-valid': 'uint16'
>>>>>> +  }
>>>>>> +}
>>>>>> +
>>>>>> +##
>>>>>> +# @x-debug-virtio-queue-status:
>>>>>> +#
>>>>>> +# Return the status of a given VirtQueue
>>>>>> +#
>>>>>> +# @path: QOBject path of the VirtIODevice
>>>>>> +#
>>>>>> +# @queue: queue number to examine
>>>>>> +#
>>>>>> +# Returns: Status of the VirtQueue
>>>>>> +#
>>>>>> +# Since: 6.1
>>>>>> +#
>>>>>> +# Example:
>>>>>> +#
>>>>>> +# -> { "execute": "x-debug-virtio-queue-status",
>>>>>> +#      "arguments": {
>>>>>> +#          "path": 
>>>>>> "/machine/peripheral-anon/device[3]/virtio-backend",
>>>>>> +#          "queue": 0
>>>>>> +#      }
>>>>>> +#   }
>>>>>> +# <- { "return": {
>>>>>> +#      "signalled-used": 373,
>>>>>> +#      "inuse": 0,
>>>>>> +#      "vring-align": 4096,
>>>>>> +#      "vring-desc": 864411648,
>>>>>> +#      "signalled-used-valid": 0,
>>>>>> +#      "vring-num-default": 256,
>>>>>> +#      "vring-avail": 864415744,
>>>>>> +#      "queue-index": 0,
>>>>>> +#      "last-avail-idx": 373,
>>>>>> +#      "vring-used": 864416320,
>>>>>> +#      "used-idx": 373,
>>>>>> +#      "device-type": "virtio-net",
>>>>>> +#      "shadow-avail-idx": 619,
>>>>>> +#      "vring-num": 256
>>>>>> +#      }
>>>>>> +#    }
>>>>>> +#
>>>>>> +##
>>>>>> +
>>>>>> +{ 'command': 'x-debug-virtio-queue-status',
>>>>>> +  'data': { 'path': 'str', 'queue': 'uint16' },
>>>>>> +  'returns': 'VirtQueueStatus'
>>>>>> +}
>>>>>
>>>


