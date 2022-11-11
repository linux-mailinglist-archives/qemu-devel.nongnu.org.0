Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7C2625476
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:35:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOYu-0004WL-F9; Fri, 11 Nov 2022 02:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1otOYk-0004Ua-Rq
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:34:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1otOYj-0005Bs-0F
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668152080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGYDSX0Y4IYL9or7FMcFJ9UytPGX9IsysVtxZpm3ad0=;
 b=CbAs3F8Y3ja+AZDmAKjbnHM51S9C35hm2SN9hxoTj1Tm44+18xcgJPRkK/s5yivDEqMOsm
 TyDMPzJBFoaBwjQdMWm47TM/x863lcG6Jr/u1sYoJfCAdSNEYzAH2TpPLgnoahxiS/jH0M
 iLaeOaP2MxxqJStBh7/wrwWzmb2j7a4=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-L-abLWC_O0GLiXdFtwDFjw-1; Fri, 11 Nov 2022 02:34:38 -0500
X-MC-Unique: L-abLWC_O0GLiXdFtwDFjw-1
Received: by mail-pg1-f197.google.com with SMTP id
 k71-20020a63844a000000b004701e90da0dso2286946pgd.22
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qGYDSX0Y4IYL9or7FMcFJ9UytPGX9IsysVtxZpm3ad0=;
 b=o4WunWLxrrwYK/5uNOfSXKCSt+UwwZKwvU6kzxxjnQd371rDWy+hwbHofAgRN14Fza
 UUylMYfdre8oC24T0v+NBI7k7c/9SQX9EN0l08t1wwGPZDm7P/KHWWQhwAwSohhvldQN
 0dLBN9sGFUXA22PuQ8ha4rG7kEypoYXhizK5OzedVX6Yh7efAwfKBBEJ1349nqkR8Aww
 cOYdO2vG2v+3VTw0NFhUx8pNsw9QFhe+LhS0tubvcO75CVc07UXyUE1STxQsPvS2x5iy
 5knIjjNWmusqMRVHdbUv+Swa8jYsGi8vXCPsg3JuQFahztn4SNEtr42a5nK8QShVQqfv
 UYng==
X-Gm-Message-State: ANoB5pmVofrF+GXpFD7C/yyqsjjey0QsUPW3ZwyxmZGWgwz8wpv6QArb
 I3xKDXdf6VPTrOrzGUamsPyxbIU5FjeTOl089PcUrq0k7tGLjByJfS+pFT0Nyrh/9RcPPjATZwZ
 xuQONlUApBFYUnkE=
X-Received: by 2002:a17:90b:3145:b0:212:f2be:bc38 with SMTP id
 ip5-20020a17090b314500b00212f2bebc38mr574451pjb.175.1668152077675; 
 Thu, 10 Nov 2022 23:34:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf43RBsCDrmxjkG9XvIleloJWaJ/Zm4WzbrO3ZsCmosi3TsYDSPMckV8W+AQBMGU+kE2S6nNGA==
X-Received: by 2002:a17:90b:3145:b0:212:f2be:bc38 with SMTP id
 ip5-20020a17090b314500b00212f2bebc38mr574415pjb.175.1668152077294; 
 Thu, 10 Nov 2022 23:34:37 -0800 (PST)
Received: from [10.72.13.217] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a170903215200b00186a6b6350esm913916ple.268.2022.11.10.23.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 23:34:36 -0800 (PST)
Message-ID: <aa82783b-b1f5-a82b-5136-1f7f7725a433@redhat.com>
Date: Fri, 11 Nov 2022 15:34:26 +0800
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
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWd47QdBoSm9RdF2yx21hKv_=YRp3uvP13Qb9PaVksss7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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


在 2022/11/10 21:09, Eugenio Perez Martin 写道:
> On Thu, Nov 10, 2022 at 6:40 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/11/9 01:07, Eugenio Pérez 写道:
>>> The next patches will start control SVQ if possible. However, we don't
>>> know if that will be possible at qemu boot anymore.
>>
>> If I was not wrong, there's no device specific feature that is checked
>> in the function. So it should be general enough to be used by devices
>> other than net. Then I don't see any advantage of doing this.
>>
> Because vhost_vdpa_init_svq is called at qemu boot, failing if it is
> not possible to shadow the Virtqueue.
>
> Now the CVQ will be shadowed if possible, so we need to check this at
> device start, not at initialization.


Any reason we can't check this at device start? We don't need 
driver_features and we can do any probing to make sure cvq has an unique 
group during initialization time.


>   To store this information at boot
> time is not valid anymore, because v->shadow_vqs_enabled is not valid
> at this time anymore.


Ok, but this doesn't explain why it is net specific but vhost-vdpa specific.

Thanks


>
> Thanks!
>
>> Thanks
>>
>>
>>> Since the moved checks will be already evaluated at net/ to know if it
>>> is ok to shadow CVQ, move them.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-vdpa.c | 33 ++-------------------------------
>>>    net/vhost-vdpa.c       |  3 ++-
>>>    2 files changed, 4 insertions(+), 32 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 3df2775760..146f0dcb40 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -402,29 +402,9 @@ static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
>>>        return ret;
>>>    }
>>>
>>> -static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>>> -                               Error **errp)
>>> +static void vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v)
>>>    {
>>>        g_autoptr(GPtrArray) shadow_vqs = NULL;
>>> -    uint64_t dev_features, svq_features;
>>> -    int r;
>>> -    bool ok;
>>> -
>>> -    if (!v->shadow_vqs_enabled) {
>>> -        return 0;
>>> -    }
>>> -
>>> -    r = vhost_vdpa_get_dev_features(hdev, &dev_features);
>>> -    if (r != 0) {
>>> -        error_setg_errno(errp, -r, "Can't get vdpa device features");
>>> -        return r;
>>> -    }
>>> -
>>> -    svq_features = dev_features;
>>> -    ok = vhost_svq_valid_features(svq_features, errp);
>>> -    if (unlikely(!ok)) {
>>> -        return -1;
>>> -    }
>>>
>>>        shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
>>>        for (unsigned n = 0; n < hdev->nvqs; ++n) {
>>> @@ -436,7 +416,6 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>>>        }
>>>
>>>        v->shadow_vqs = g_steal_pointer(&shadow_vqs);
>>> -    return 0;
>>>    }
>>>
>>>    static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>>> @@ -461,11 +440,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>>>        dev->opaque =  opaque ;
>>>        v->listener = vhost_vdpa_memory_listener;
>>>        v->msg_type = VHOST_IOTLB_MSG_V2;
>>> -    ret = vhost_vdpa_init_svq(dev, v, errp);
>>> -    if (ret) {
>>> -        goto err;
>>> -    }
>>> -
>>> +    vhost_vdpa_init_svq(dev, v);
>>>        vhost_vdpa_get_iova_range(v);
>>>
>>>        if (!vhost_vdpa_first_dev(dev)) {
>>> @@ -476,10 +451,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>>>                                   VIRTIO_CONFIG_S_DRIVER);
>>>
>>>        return 0;
>>> -
>>> -err:
>>> -    ram_block_discard_disable(false);
>>> -    return ret;
>>>    }
>>>
>>>    static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index d3b1de481b..fb35b17ab4 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -117,9 +117,10 @@ static bool vhost_vdpa_net_valid_svq_features(uint64_t features, Error **errp)
>>>        if (invalid_dev_features) {
>>>            error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
>>>                       invalid_dev_features);
>>> +        return false;
>>>        }
>>>
>>> -    return !invalid_dev_features;
>>> +    return vhost_svq_valid_features(features, errp);
>>>    }
>>>
>>>    static int vhost_vdpa_net_check_device_id(struct vhost_net *net)


