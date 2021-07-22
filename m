Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B285C3D20CC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 11:23:39 +0200 (CEST)
Received: from localhost ([::1]:33558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Uva-0001Iq-PS
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 05:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6UuY-0000UD-4x
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:22:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6UuV-0003gH-KP
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626945751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZB1G/FG4dec2QZHlSC2rEcg31TOF8yJZCcsFJNVa/Xo=;
 b=Pjc5/45YmKZmmL/Z4145rY/WJJZGcZ6EqwROhN7AgBIOR63iLZRv2aRJaK/VsW98JAgzyX
 nxL+m7sd97M6fgMpb9RtjeF84rFSQSELdZF4l3IB+2+wB7ZXNEU05KZkbtQDABGIud6D2C
 4IrsdHRRKkZJVymUBEbcNnsxsBrzqF4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-vWGxbes0OuyUQvxsNIfYzg-1; Thu, 22 Jul 2021 05:22:27 -0400
X-MC-Unique: vWGxbes0OuyUQvxsNIfYzg-1
Received: by mail-pj1-f69.google.com with SMTP id
 j22-20020a17090a7e96b0290175fc969950so83290pjl.4
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 02:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZB1G/FG4dec2QZHlSC2rEcg31TOF8yJZCcsFJNVa/Xo=;
 b=GBZPDidUqss2YJZMHXyKHSVWUJQsxVjihOTjQElc9prAVY7+STeXFVTtN5X+n+pqYI
 5AXc/fjMHjQurxcPQOt1us7flSTik9k5Qh5IAlmuHlwfg7heui5zS0yQobLNpjO/YQ9D
 40rC9ODX4JtkOCdlV1mCZnLOXtfL+6wIRz4WGEt00jup7PQKDVN/1Ctl3hvj3BX6qmSX
 XoRAWff381xdZmNFfUj2la2LGfbYV+IKy9Lx7XFLRPxZpo7JMWv6s1jFDhoV/feHmFfs
 KwpNcOsMf20NUgu7GHDAYbIdoEa00xicIIwA+U5d7qKSXwYxXwp0ly/w/3m0qn9OO3wR
 HOaA==
X-Gm-Message-State: AOAM530BCw2daJ/5jcKXaQ9j5DBJ4mVtvXGn0j4xChGZwU95D+pSeKtI
 Eysd7/qHpFWJJyQAnqZnoht/FsBS2lIUG9SZCVcJuEqeS7vavK4eg0Ws7Z6glaOJYyDoGElQXUd
 tJvnccn2OssJDZBI=
X-Received: by 2002:a17:90b:3647:: with SMTP id
 nh7mr39692619pjb.228.1626945746631; 
 Thu, 22 Jul 2021 02:22:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa2rCpZ1QC1F4UntyenenkKcYKMJ2jBTjNa6uvZolGl0tiGG3nl8YtE4F6RU1CJqb1HmsJ8Q==
X-Received: by 2002:a17:90b:3647:: with SMTP id
 nh7mr39692581pjb.228.1626945746382; 
 Thu, 22 Jul 2021 02:22:26 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b20sm29289372pfl.9.2021.07.22.02.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 02:22:25 -0700 (PDT)
Subject: Re: [PATCH v6 4/6] qmp: add QMP command x-debug-virtio-queue-status
To: Jonah Palmer <jonah.palmer@oracle.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-5-git-send-email-jonah.palmer@oracle.com>
 <b0c11f6c-31dd-121d-ab27-e83e5afa8596@redhat.com>
 <82c4ad5d-c866-9b25-42b0-d1c3a731ed3a@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <11a89103-dd0c-26ca-37e1-7e1b0aeac1f3@redhat.com>
Date: Thu, 22 Jul 2021 17:22:16 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <82c4ad5d-c866-9b25-42b0-d1c3a731ed3a@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/21 下午4:59, Jonah Palmer 写道:
>
>
> On 7/13/21 10:37 PM, Jason Wang wrote:
>>
>> 在 2021/7/12 下午6:35, Jonah Palmer 写道:
>>> From: Laurent Vivier <lvivier@redhat.com>
>>>
>>> This new command shows internal status of a VirtQueue.
>>> (vrings and indexes).
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>>> ---
>>>   hw/virtio/virtio-stub.c |   6 +++
>>>   hw/virtio/virtio.c      |  37 ++++++++++++++++++
>>>   qapi/virtio.json        | 102 
>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 145 insertions(+)
>>>
>>>   [Jonah: Added 'device-type' field to VirtQueueStatus and
>>>   qmp command x-debug-virtio-queue-status.]
>>>
>>> diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
>>> index ddb592f..3c1bf17 100644
>>> --- a/hw/virtio/virtio-stub.c
>>> +++ b/hw/virtio/virtio-stub.c
>>> @@ -17,3 +17,9 @@ VirtioStatus *qmp_x_debug_virtio_status(const 
>>> char* path, Error **errp)
>>>   {
>>>       return qmp_virtio_unsupported(errp);
>>>   }
>>> +
>>> +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
>>> +                                                 uint16_t queue, 
>>> Error **errp)
>>> +{
>>> +    return qmp_virtio_unsupported(errp);
>>> +}
>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>> index 81a0ee8..ccd4371 100644
>>> --- a/hw/virtio/virtio.c
>>> +++ b/hw/virtio/virtio.c
>>> @@ -3935,6 +3935,43 @@ static VirtIODevice *virtio_device_find(const 
>>> char *path)
>>>       return NULL;
>>>   }
>>>   +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
>>> +                                                 uint16_t queue, 
>>> Error **errp)
>>> +{
>>> +    VirtIODevice *vdev;
>>> +    VirtQueueStatus *status;
>>> +
>>> +    vdev = virtio_device_find(path);
>>> +    if (vdev == NULL) {
>>> +        error_setg(errp, "Path %s is not a VirtIO device", path);
>>> +        return NULL;
>>> +    }
>>> +
>>> +    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, 
>>> queue)) {
>>> +        error_setg(errp, "Invalid virtqueue number %d", queue);
>>> +        return NULL;
>>> +    }
>>> +
>>> +    status = g_new0(VirtQueueStatus, 1);
>>> +    status->device_type = qapi_enum_parse(&VirtioType_lookup, 
>>> vdev->name,
>>> + VIRTIO_TYPE_UNKNOWN, NULL);
>>> +    status->queue_index = vdev->vq[queue].queue_index;
>>> +    status->inuse = vdev->vq[queue].inuse;
>>> +    status->vring_num = vdev->vq[queue].vring.num;
>>> +    status->vring_num_default = vdev->vq[queue].vring.num_default;
>>> +    status->vring_align = vdev->vq[queue].vring.align;
>>> +    status->vring_desc = vdev->vq[queue].vring.desc;
>>> +    status->vring_avail = vdev->vq[queue].vring.avail;
>>> +    status->vring_used = vdev->vq[queue].vring.used;
>>> +    status->last_avail_idx = vdev->vq[queue].last_avail_idx;
>>
>>
>> As mentioned in previous versions. We need add vhost support 
>> otherwise the value here is wrong.
> Got it. I'll add a case to determine if vhost is active for a given device.
> So, in the case that vhost is active, should I just not print out the value or would I substitute it with
> another value (whatever that might be)?


You can query the vhost for those index.

(vhost_get_vring_base())


>   Same question for shadow_avail_idx below as well.


It's an implementation specific. I think we can simply not show it if 
vhost is enabled.

Thanks


>
> Jonah
>>
>>
>>> +    status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;
>>
>>
>> The shadow index is something that is implementation specific e.g in 
>> the case of vhost it's kind of meaningless.
>>
>> Thanks
>>
>>
>>> +    status->used_idx = vdev->vq[queue].used_idx;
>>> +    status->signalled_used = vdev->vq[queue].signalled_used;
>>> +    status->signalled_used_valid = 
>>> vdev->vq[queue].signalled_used_valid;
>>> +
>>> +    return status;
>>> +}
>>> +
>>>   #define CONVERT_FEATURES(type, map)                \
>>>       ({                                           \
>>>           type *list = NULL;                         \
>>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>>> index 78873cd..7007e0c 100644
>>> --- a/qapi/virtio.json
>>> +++ b/qapi/virtio.json
>>> @@ -406,3 +406,105 @@
>>>     'data': { 'path': 'str' },
>>>     'returns': 'VirtioStatus'
>>>   }
>>> +
>>> +##
>>> +# @VirtQueueStatus:
>>> +#
>>> +# Status of a VirtQueue
>>> +#
>>> +# @device-type: VirtIO device type
>>> +#
>>> +# @queue-index: VirtQueue queue_index
>>> +#
>>> +# @inuse: VirtQueue inuse
>>> +#
>>> +# @vring-num: VirtQueue vring.num
>>> +#
>>> +# @vring-num-default: VirtQueue vring.num_default
>>> +#
>>> +# @vring-align: VirtQueue vring.align
>>> +#
>>> +# @vring-desc: VirtQueue vring.desc
>>> +#
>>> +# @vring-avail: VirtQueue vring.avail
>>> +#
>>> +# @vring-used: VirtQueue vring.used
>>> +#
>>> +# @last-avail-idx: VirtQueue last_avail_idx
>>> +#
>>> +# @shadow-avail-idx: VirtQueue shadow_avail_idx
>>> +#
>>> +# @used-idx: VirtQueue used_idx
>>> +#
>>> +# @signalled-used: VirtQueue signalled_used
>>> +#
>>> +# @signalled-used-valid: VirtQueue signalled_used_valid
>>> +#
>>> +# Since: 6.1
>>> +#
>>> +##
>>> +
>>> +{ 'struct': 'VirtQueueStatus',
>>> +  'data': {
>>> +    'device-type': 'VirtioType',
>>> +    'queue-index': 'uint16',
>>> +    'inuse': 'uint32',
>>> +    'vring-num': 'int',
>>> +    'vring-num-default': 'int',
>>> +    'vring-align': 'int',
>>> +    'vring-desc': 'uint64',
>>> +    'vring-avail': 'uint64',
>>> +    'vring-used': 'uint64',
>>> +    'last-avail-idx': 'uint16',
>>> +    'shadow-avail-idx': 'uint16',
>>> +    'used-idx': 'uint16',
>>> +    'signalled-used': 'uint16',
>>> +    'signalled-used-valid': 'uint16'
>>> +  }
>>> +}
>>> +
>>> +##
>>> +# @x-debug-virtio-queue-status:
>>> +#
>>> +# Return the status of a given VirtQueue
>>> +#
>>> +# @path: QOBject path of the VirtIODevice
>>> +#
>>> +# @queue: queue number to examine
>>> +#
>>> +# Returns: Status of the VirtQueue
>>> +#
>>> +# Since: 6.1
>>> +#
>>> +# Example:
>>> +#
>>> +# -> { "execute": "x-debug-virtio-queue-status",
>>> +#      "arguments": {
>>> +#          "path": 
>>> "/machine/peripheral-anon/device[3]/virtio-backend",
>>> +#          "queue": 0
>>> +#      }
>>> +#   }
>>> +# <- { "return": {
>>> +#      "signalled-used": 373,
>>> +#      "inuse": 0,
>>> +#      "vring-align": 4096,
>>> +#      "vring-desc": 864411648,
>>> +#      "signalled-used-valid": 0,
>>> +#      "vring-num-default": 256,
>>> +#      "vring-avail": 864415744,
>>> +#      "queue-index": 0,
>>> +#      "last-avail-idx": 373,
>>> +#      "vring-used": 864416320,
>>> +#      "used-idx": 373,
>>> +#      "device-type": "virtio-net",
>>> +#      "shadow-avail-idx": 619,
>>> +#      "vring-num": 256
>>> +#      }
>>> +#    }
>>> +#
>>> +##
>>> +
>>> +{ 'command': 'x-debug-virtio-queue-status',
>>> +  'data': { 'path': 'str', 'queue': 'uint16' },
>>> +  'returns': 'VirtQueueStatus'
>>> +}
>>


