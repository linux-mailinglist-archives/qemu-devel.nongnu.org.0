Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748EF628D84
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:36:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouioi-0000fi-3I; Mon, 14 Nov 2022 18:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ouifp-0005QL-ME
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ouR38-0003aN-Gi
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 23:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668399981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwym0ZaFelNCQ7K3dR9+z21gGG1Ur/tpkn5XSY0qAN8=;
 b=QgLO2wsfjrA4McZ35nQt7fIhwWGMy2hhlPmzxWwnj0jeKtft8eYkm/DXjsgjoheL5egfR1
 00TjIw6b9fweZmpWWbYABbOxOklCwnnZC5gdl5dBKxey9RoBaAs1UDmKBT0dVZYCirx7iJ
 j5AQhMFUQoNyz4HPa3FSWiPgcR1AhHk=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-H-V8Y39eNwGgHTLE4SRoPQ-1; Sun, 13 Nov 2022 23:26:18 -0500
X-MC-Unique: H-V8Y39eNwGgHTLE4SRoPQ-1
Received: by mail-pl1-f199.google.com with SMTP id
 q6-20020a170902dac600b001873ef77938so8098305plx.18
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 20:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vwym0ZaFelNCQ7K3dR9+z21gGG1Ur/tpkn5XSY0qAN8=;
 b=OhNKlRrd564RyVQQF4yEIKnAj8F5uFS6cEbyRMdLdAsw//LKcXx28NuAVsUfD/Gqjo
 /nPlpWd5+bj0uXPkz/wi6KbvU2EChL+0ZJ2RiHXEydmaaj0Zi/M+8LNBF0p1XT/DroyN
 ibpWj5FVD1rfrviQIBBRex64FLFgVrVWjQGOWHYmnV85AYVqEwxjkWrvvo617YawaFDa
 eHcYkPl/PWqpm4CbYWeLfxXkYSWSXg8irmEq07ID7aCajp8gPeDipyBuSIkvxa4mESfe
 juvj+1OPHLZPCg7h7AlENRJ2MxaMmgE6LGrZDV8MXRTEcLM+jIiBskVa7U9Uph+tfJY/
 6X9w==
X-Gm-Message-State: ANoB5pn395smZrG4CP/aCK+mcAg4Mp5DErULjfA2WVNrXX8NQf8UMGIZ
 z83K5F5MeduZ3OzqwAiXNCHY/AMC2Q4sW8DYTmhz8Swb4dUPbrU6ia1x61y2TNChzqJN852G0to
 jKG5CsM+OSKotRLo=
X-Received: by 2002:a17:902:e805:b0:186:880c:167e with SMTP id
 u5-20020a170902e80500b00186880c167emr12038600plg.7.1668399976998; 
 Sun, 13 Nov 2022 20:26:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7V1CaAibhTcmpSTUJLQDa3kEhEiSXrPV4yQY+AFmfwR5pL+Nr3nm56v/oWbybsXnEOi1sJvA==
X-Received: by 2002:a17:902:e805:b0:186:880c:167e with SMTP id
 u5-20020a170902e80500b00186880c167emr12038568plg.7.1668399976575; 
 Sun, 13 Nov 2022 20:26:16 -0800 (PST)
Received: from [10.72.13.180] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 r23-20020aa79637000000b0056b95260b91sm5570576pfg.67.2022.11.13.20.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 20:26:16 -0800 (PST)
Message-ID: <72179a7d-2303-7f11-7ebc-e4d9c8d5392f@redhat.com>
Date: Mon, 14 Nov 2022 12:26:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v6 05/10] vdpa: move SVQ vring features check to net/
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand
 <hanand@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-6-eperezma@redhat.com>
 <56bfad97-74d2-8570-c391-83ecf9965cfd@redhat.com>
 <CAJaqyWd47QdBoSm9RdF2yx21hKv_=YRp3uvP13Qb9PaVksss7Q@mail.gmail.com>
 <aa82783b-b1f5-a82b-5136-1f7f7725a433@redhat.com>
 <CAJaqyWfmTn1_o2z2S_o=bu2mD=r0+T=1+dh_WOwbpQaYQK0YSQ@mail.gmail.com>
 <CACGkMEvQm_0VqF5q2XtWmaHXmSj0Xjg7br3ydOQVVcHJ0yb_GA@mail.gmail.com>
 <CAJaqyWfYN_Y6OQ-ugdH3d4VRGBJufMLBhH47dfB0rLg=MEt47g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWfYN_Y6OQ-ugdH3d4VRGBJufMLBhH47dfB0rLg=MEt47g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2022/11/11 20:58, Eugenio Perez Martin 写道:
> On Fri, Nov 11, 2022 at 9:07 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Fri, Nov 11, 2022 at 3:56 PM Eugenio Perez Martin
>> <eperezma@redhat.com> wrote:
>>> On Fri, Nov 11, 2022 at 8:34 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>
>>>> 在 2022/11/10 21:09, Eugenio Perez Martin 写道:
>>>>> On Thu, Nov 10, 2022 at 6:40 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> 在 2022/11/9 01:07, Eugenio Pérez 写道:
>>>>>>> The next patches will start control SVQ if possible. However, we don't
>>>>>>> know if that will be possible at qemu boot anymore.
>>>>>> If I was not wrong, there's no device specific feature that is checked
>>>>>> in the function. So it should be general enough to be used by devices
>>>>>> other than net. Then I don't see any advantage of doing this.
>>>>>>
>>>>> Because vhost_vdpa_init_svq is called at qemu boot, failing if it is
>>>>> not possible to shadow the Virtqueue.
>>>>>
>>>>> Now the CVQ will be shadowed if possible, so we need to check this at
>>>>> device start, not at initialization.
>>>>
>>>> Any reason we can't check this at device start? We don't need
>>>> driver_features and we can do any probing to make sure cvq has an unique
>>>> group during initialization time.
>>>>
>>> We need the CVQ index to check if it has an independent group. CVQ
>>> index depends on the features the guest's ack:
>>> * If it acks _F_MQ, it is the last one.
>>> * If it doesn't, CVQ idx is 2.
>>>
>>> We cannot have acked features at initialization, and they could
>>> change: It is valid for a guest to ack _F_MQ, then reset the device,
>>> then not ack it.
>> Can we do some probing by negotiating _F_MQ if the device offers it,
>> then we can know if cvq has a unique group?
>>
> What if the guest does not ack _F_MQ?
>
> To be completed it would go like:
>
> * Probe negotiate _F_MQ, check unique group,
> * Probe negotiate !_F_MQ, check unique group,


I think it should be a bug if device present a unique virtqueue group 
that depends on a specific feature. That is to say, we can do a single 
round of probing instead of try it twice here.


> * Actually negotiate with the guest's feature set.
> * React to failures. Probably the same way as if the CVQ is not
> isolated, disabling SVQ?
>
> To me it seems simpler to specify somehow that the vq must be independent.


It's just a suggestion, if you think doing it at the start, I'm fine. 
But we need document the reason with a comment maybe.

Thanks


>
> Thanks!
>
>>>>>    To store this information at boot
>>>>> time is not valid anymore, because v->shadow_vqs_enabled is not valid
>>>>> at this time anymore.
>>>>
>>>> Ok, but this doesn't explain why it is net specific but vhost-vdpa specific.
>>>>
>>> We can try to move it to a vhost op, but we have the same problem as
>>> the svq array allocation: We don't have the right place in vhost ops
>>> to check this. Maybe vhost_set_features is the right one here?
>> If we can do all the probing at the initialization phase, we can do
>> everything there.
>>
>> Thanks
>>
>>> Thanks!
>>>
>>>> Thanks
>>>>
>>>>
>>>>> Thanks!
>>>>>
>>>>>> Thanks
>>>>>>
>>>>>>
>>>>>>> Since the moved checks will be already evaluated at net/ to know if it
>>>>>>> is ok to shadow CVQ, move them.
>>>>>>>
>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>> ---
>>>>>>>     hw/virtio/vhost-vdpa.c | 33 ++-------------------------------
>>>>>>>     net/vhost-vdpa.c       |  3 ++-
>>>>>>>     2 files changed, 4 insertions(+), 32 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>>>> index 3df2775760..146f0dcb40 100644
>>>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>>>> @@ -402,29 +402,9 @@ static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
>>>>>>>         return ret;
>>>>>>>     }
>>>>>>>
>>>>>>> -static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>>>>>>> -                               Error **errp)
>>>>>>> +static void vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v)
>>>>>>>     {
>>>>>>>         g_autoptr(GPtrArray) shadow_vqs = NULL;
>>>>>>> -    uint64_t dev_features, svq_features;
>>>>>>> -    int r;
>>>>>>> -    bool ok;
>>>>>>> -
>>>>>>> -    if (!v->shadow_vqs_enabled) {
>>>>>>> -        return 0;
>>>>>>> -    }
>>>>>>> -
>>>>>>> -    r = vhost_vdpa_get_dev_features(hdev, &dev_features);
>>>>>>> -    if (r != 0) {
>>>>>>> -        error_setg_errno(errp, -r, "Can't get vdpa device features");
>>>>>>> -        return r;
>>>>>>> -    }
>>>>>>> -
>>>>>>> -    svq_features = dev_features;
>>>>>>> -    ok = vhost_svq_valid_features(svq_features, errp);
>>>>>>> -    if (unlikely(!ok)) {
>>>>>>> -        return -1;
>>>>>>> -    }
>>>>>>>
>>>>>>>         shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
>>>>>>>         for (unsigned n = 0; n < hdev->nvqs; ++n) {
>>>>>>> @@ -436,7 +416,6 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>>>>>>>         }
>>>>>>>
>>>>>>>         v->shadow_vqs = g_steal_pointer(&shadow_vqs);
>>>>>>> -    return 0;
>>>>>>>     }
>>>>>>>
>>>>>>>     static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>>>>>>> @@ -461,11 +440,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>>>>>>>         dev->opaque =  opaque ;
>>>>>>>         v->listener = vhost_vdpa_memory_listener;
>>>>>>>         v->msg_type = VHOST_IOTLB_MSG_V2;
>>>>>>> -    ret = vhost_vdpa_init_svq(dev, v, errp);
>>>>>>> -    if (ret) {
>>>>>>> -        goto err;
>>>>>>> -    }
>>>>>>> -
>>>>>>> +    vhost_vdpa_init_svq(dev, v);
>>>>>>>         vhost_vdpa_get_iova_range(v);
>>>>>>>
>>>>>>>         if (!vhost_vdpa_first_dev(dev)) {
>>>>>>> @@ -476,10 +451,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>>>>>>>                                    VIRTIO_CONFIG_S_DRIVER);
>>>>>>>
>>>>>>>         return 0;
>>>>>>> -
>>>>>>> -err:
>>>>>>> -    ram_block_discard_disable(false);
>>>>>>> -    return ret;
>>>>>>>     }
>>>>>>>
>>>>>>>     static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
>>>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>>>>> index d3b1de481b..fb35b17ab4 100644
>>>>>>> --- a/net/vhost-vdpa.c
>>>>>>> +++ b/net/vhost-vdpa.c
>>>>>>> @@ -117,9 +117,10 @@ static bool vhost_vdpa_net_valid_svq_features(uint64_t features, Error **errp)
>>>>>>>         if (invalid_dev_features) {
>>>>>>>             error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
>>>>>>>                        invalid_dev_features);
>>>>>>> +        return false;
>>>>>>>         }
>>>>>>>
>>>>>>> -    return !invalid_dev_features;
>>>>>>> +    return vhost_svq_valid_features(features, errp);
>>>>>>>     }
>>>>>>>
>>>>>>>     static int vhost_vdpa_net_check_device_id(struct vhost_net *net)


