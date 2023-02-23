Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2816A013A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 03:39:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV1VM-0007Fi-Kp; Wed, 22 Feb 2023 21:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV1VK-0007FU-E0
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 21:38:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV1VI-0002Fk-Kk
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 21:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677119919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ma7/z8WNX1RDXHaIHyV4UxtdHg2TDktAwvW+oBEdYG0=;
 b=eBBYJpWF6H3PmkOiG0f0JpccmwMDDAz8Og9IfJ+kzJcs4e6c4R/xn7wPdZ+O37HHsVWgHo
 1D8wDtqm3u4VipC5abin+0GGNFWXgedJLGaHp8bhIpJeVUHfjDfATscKBYhQRb7wtH5u+X
 5tLslwDSkbCUpGt4BvxSxwyAmRdjxoE=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-271-vKwL790-NDOtKou6j6k2GA-1; Wed, 22 Feb 2023 21:38:37 -0500
X-MC-Unique: vKwL790-NDOtKou6j6k2GA-1
Received: by mail-pg1-f199.google.com with SMTP id
 d18-20020a63f252000000b00502f11fb2fcso693870pgk.6
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 18:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ma7/z8WNX1RDXHaIHyV4UxtdHg2TDktAwvW+oBEdYG0=;
 b=QN/GldNfHi7I8DdBqRvlsvTVr0C8OSPEkzjBM+T1zY/rVL5S1YYXypXf+yLOdHXbPe
 MYOD4otyDoXf/OSaxw38xkjMzQ26a50yV73id+BmQ0fQph62KnKcXO1jkzfp3zthbQa7
 88Dl/jX2U4neCD8ec79in56XW0CEgAMsaJ+FNIEvfaMN7hA5zyCaG0Y0gir4kDYJTD1h
 If9NeFUHIJtRU61X6NDlnMxseEjh6Hiw6F8vudYMZgUZlvt889/DkVLht5MUeMwKqsjR
 WZdw4o0DwUp8HY9XlCckntwHRENIUn/yGaz0VIA9Lq9a8jk73YKYnDt3/Md/xLoWF1aZ
 zvAg==
X-Gm-Message-State: AO0yUKV5PhPZjv5do4BxZhte4IdxxSW8yIscqsmKkVaKGlZumTxrsJCW
 yM+kX8NRdpLBk/F5QtIIaPBt4ItCr4qm2RHMaCFFS3DFJnacX25fP/UJauC+Dpi0fMAcQ7kF1dF
 agaStfUxoLn0dotI=
X-Received: by 2002:a17:90b:4d0d:b0:237:39b1:7cb1 with SMTP id
 mw13-20020a17090b4d0d00b0023739b17cb1mr5553332pjb.19.1677119916638; 
 Wed, 22 Feb 2023 18:38:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8A3Ap4rPUmFf9SKVabNxcAIPB0FfhoQXmkuFsFqQA/M31SHHFeOwKXaPxz01ezpX7ik2VoBg==
X-Received: by 2002:a17:90b:4d0d:b0:237:39b1:7cb1 with SMTP id
 mw13-20020a17090b4d0d00b0023739b17cb1mr5553293pjb.19.1677119916297; 
 Wed, 22 Feb 2023 18:38:36 -0800 (PST)
Received: from [10.72.13.176] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a17090abd8a00b0022bb3ee9b68sm4776210pjr.13.2023.02.22.18.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 18:38:35 -0800 (PST)
Message-ID: <81762a3b-b01f-2c3a-be63-531ac5b6976c@redhat.com>
Date: Thu, 23 Feb 2023 10:38:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 11/13] vdpa: block migration if dev does not have
 _F_SUSPEND
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-12-eperezma@redhat.com>
 <c8d6ecc3-87f6-986e-e78d-003000e8a51e@redhat.com>
 <CAJaqyWdhK7QEHECP7qJP9tPA69e8uTuJtqLPNq_mUUhRDG_2Aw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWdhK7QEHECP7qJP9tPA69e8uTuJtqLPNq_mUUhRDG_2Aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2023/2/22 22:25, Eugenio Perez Martin 写道:
> On Wed, Feb 22, 2023 at 5:05 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2023/2/8 17:42, Eugenio Pérez 写道:
>>> Next patches enable devices to be migrated even if vdpa netdev has not
>>> been started with x-svq. However, not all devices are migratable, so we
>>> need to block migration if we detect that.
>>>
>>> Block vhost-vdpa device migration if it does not offer _F_SUSPEND and it
>>> has not been started with x-svq.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-vdpa.c | 21 +++++++++++++++++++++
>>>    1 file changed, 21 insertions(+)
>>>
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 84a6b9690b..9d30cf9b3c 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -442,6 +442,27 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>>>            return 0;
>>>        }
>>>
>>> +    /*
>>> +     * If dev->shadow_vqs_enabled at initialization that means the device has
>>> +     * been started with x-svq=on, so don't block migration
>>> +     */
>>> +    if (dev->migration_blocker == NULL && !v->shadow_vqs_enabled) {
>>> +        uint64_t backend_features;
>>> +
>>> +        /* We don't have dev->backend_features yet */
>>> +        ret = vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES,
>>> +                              &backend_features);
>>> +        if (unlikely(ret)) {
>>> +            error_setg_errno(errp, -ret, "Could not get backend features");
>>> +            return ret;
>>> +        }
>>> +
>>> +        if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {
>>> +            error_setg(&dev->migration_blocker,
>>> +                "vhost-vdpa backend lacks VHOST_BACKEND_F_SUSPEND feature.");
>>> +        }
>>
>> I wonder why not let the device to decide? For networking device, we can
>> live without suspend probably.
>>
> Right, but how can we know if this is a net device in init? I don't
> think a switch (vhost_vdpa_get_device_id(dev)) is elegant.


I meant the caller of vhost_vdpa_init() which is net_init_vhost_vdpa().

Thanks


>
> If the parent device does not need to be suspended i'd go with
> exposing a suspend ioctl but do nothing in the parent device. After
> that, it could even choose to return an error for GET_VRING_BASE.
>
> If we want to implement it as a fallback in qemu, I'd go for
> implementing it on top of this series. There are a few operations we
> could move to a device-kind specific ops.
>
> Would it make sense to you?
>
> Thanks!
>
>
>> Thanks
>>
>>
>>> +    }
>>> +
>>>        /*
>>>         * Similar to VFIO, we end up pinning all guest memory and have to
>>>         * disable discarding of RAM.


