Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A503E66D5B6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 06:43:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHejl-0002uw-Hg; Tue, 17 Jan 2023 00:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHejj-0002uj-Pp
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 00:42:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHejh-000516-UU
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 00:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673934135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VoxLQR8qtdzkr81hfRn/VOoZ7uZ/IeMJ+CvmKEA5jbY=;
 b=cBWua9cfLJqo38Cj9YRxgpp1o3PCXxMUgnbxAMN6fkXQf9nzMg2+isj5zweTBcFe+LE7f4
 yr2l0eAGAv7NTQkboaKOf1fsvZc7x2oPsX5FqYGOb6mkXWlI0gOPzpvXQYtR02Q/3BdWAc
 80QcScq0QTb1H9zXPncqr0k2ybaZAkM=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-336-z4OtbLtONmeIoYDEFMyCbA-1; Tue, 17 Jan 2023 00:42:14 -0500
X-MC-Unique: z4OtbLtONmeIoYDEFMyCbA-1
Received: by mail-pf1-f197.google.com with SMTP id
 f15-20020a62380f000000b0058db55a8d7aso1643860pfa.21
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 21:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VoxLQR8qtdzkr81hfRn/VOoZ7uZ/IeMJ+CvmKEA5jbY=;
 b=HNp+ytQtDonZthZiySuTVcOnvnVMZHarZPBBkYCmlHYE8SCeyILl27DmJuZRVznMqg
 F2W0CozXvtyRAwY5uac37ROfAqm10fFV1a6+ee8ltC8PbTTQNk297frznQsPv9O/g7Ua
 u0OvF4AVgo2Mqr06UcdJg8JUajprWG7n1taV7u9Qar8liXsGAaf16do+flvNg1IDXioS
 +YyZDPTMwH98TZF/UjL/Uk4VCu9XXdkTo4DTfBtNjT6pyLpbnCECBeMDJZJYgOgghExA
 q4ctsaeTJM9wg5GQ2VuPrp2Plq92ciUXO+a7dUHxG2EbaBRLBkiDHZXGid4lm1Kv4GsO
 02Iw==
X-Gm-Message-State: AFqh2kr0XAQJ7zmzBUEDN9m+1s0VnmNKLD2+aFL8b4ioOIMfpBFG7P5c
 xBNWZZyj+8LBWowiWTCV0oN6kR5ZkqZbXW6eldtY0ZbjmVn07pgRgUyG7f3F3j3qWc7KCHa8jvf
 eW65nhRL+Xl7lHRk=
X-Received: by 2002:aa7:8283:0:b0:588:9c15:65c4 with SMTP id
 s3-20020aa78283000000b005889c1565c4mr1291470pfm.3.1673934133268; 
 Mon, 16 Jan 2023 21:42:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsK92lAYpbsPKmX47rCAjVTPO4YVIN6x77Y4uA/jrwDrdiYwY1M6ASNNlnwZhoccw7R4ApGrQ==
X-Received: by 2002:aa7:8283:0:b0:588:9c15:65c4 with SMTP id
 s3-20020aa78283000000b005889c1565c4mr1291437pfm.3.1673934132952; 
 Mon, 16 Jan 2023 21:42:12 -0800 (PST)
Received: from [10.72.13.93] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d12-20020aa797ac000000b0058da3f2eba8sm3044407pfq.40.2023.01.16.21.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 21:42:12 -0800 (PST)
Message-ID: <2616f0cd-f9e8-d183-ea78-db1be4825d9c@redhat.com>
Date: Tue, 17 Jan 2023 13:42:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v2 05/13] vdpa net: add migration blocker if cannot migrate
 cvq
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-6-eperezma@redhat.com>
 <451c3617-61a1-a4bb-791a-6c55e363e961@redhat.com>
 <CAJaqyWfBGyibFq7_nAj61OedpXX2T3c=Mbw39XXpxEvE0OOyig@mail.gmail.com>
 <065243b8-c93f-17e6-72cb-c1db33da6df6@redhat.com>
 <20230116002152-mutt-send-email-mst@kernel.org>
 <CAJaqyWd=Lt+41Zrn70v7rN_0ociiRcvRSXuS4ZpevCUFrajEJQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWd=Lt+41Zrn70v7rN_0ociiRcvRSXuS4ZpevCUFrajEJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2023/1/16 17:33, Eugenio Perez Martin 写道:
> On Mon, Jan 16, 2023 at 6:24 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Mon, Jan 16, 2023 at 11:34:20AM +0800, Jason Wang wrote:
>>> 在 2023/1/13 15:46, Eugenio Perez Martin 写道:
>>>> On Fri, Jan 13, 2023 at 5:25 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>> 在 2023/1/13 01:24, Eugenio Pérez 写道:
>>>>>> A vdpa net device must initialize with SVQ in order to be migratable,
>>>>>> and initialization code verifies conditions.  If the device is not
>>>>>> initialized with the x-svq parameter, it will not expose _F_LOG so vhost
>>>>>> sybsystem will block VM migration from its initialization.
>>>>>>
>>>>>> Next patches change this. Net data VQs will be shadowed only at
>>>>>> migration time and vdpa net devices need to expose _F_LOG as long as it
>>>>>> can go to SVQ.
>>>>>>
>>>>>> Since we don't know that at initialization time but at start, add an
>>>>>> independent blocker at CVQ.
>>>>>>
>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>> ---
>>>>>>     net/vhost-vdpa.c | 35 +++++++++++++++++++++++++++++------
>>>>>>     1 file changed, 29 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>>>> index 631424d9c4..2ca93e850a 100644
>>>>>> --- a/net/vhost-vdpa.c
>>>>>> +++ b/net/vhost-vdpa.c
>>>>>> @@ -26,12 +26,14 @@
>>>>>>     #include <err.h>
>>>>>>     #include "standard-headers/linux/virtio_net.h"
>>>>>>     #include "monitor/monitor.h"
>>>>>> +#include "migration/blocker.h"
>>>>>>     #include "hw/virtio/vhost.h"
>>>>>>
>>>>>>     /* Todo:need to add the multiqueue support here */
>>>>>>     typedef struct VhostVDPAState {
>>>>>>         NetClientState nc;
>>>>>>         struct vhost_vdpa vhost_vdpa;
>>>>>> +    Error *migration_blocker;
>>>>> Any reason we can't use the mivration_blocker in vhost_dev structure?
>>>>>
>>>>> I believe we don't need to wait until start to know we can't migrate.
>>>>>
>>>> Device migratability also depends on features that the guest acks.
>>>
>>> This sounds a little bit tricky, more below:
>>>
>>>
>>>> For example, if the device does not support ASID it can be migrated as
>>>> long as _F_CVQ is not acked.
>>>
>>> The management may notice a non-consistent behavior in this case. I wonder
>>> if we can simply check the host features.
>>>
> That's right, and I can see how that can be an issue.
>
> However, the check for the ASID is based on queue indexes at the
> moment. If we want to register the blocker at the initialization
> moment the only option I see is to do two features ack & reset cycle:
> one with MQ and another one without MQ.


That's should be fine, or any issue you saw?

Thanks


>
> Would it be more correct to assume the device will assign the right
> ASID only probing one configuration? I don't think so but I'm ok to
> leave the code that way if we agree it is more viable.
>
>>> Thanks
>>
>> Yes the issue is that ack can happen after migration started.
>> I don't think this kind of blocker appearing during migration
>> is currently expected/supported well. Is it?
>>
> In that case the guest cannot DRIVER_OK the device, because the call
> to migrate_add_blocker fails and the error propagates from
> vhost_net_start up to the virtio device.
>
> But I can also see how this is inconvenient and to add a migration
> blocker at initialization can simplify things here. As long as we
> agree on the right way to probe I can send a new version that way for
> sure.
>
> Thanks!
>
>>>> Thanks!
>>>>
>>>>> Thanks
>>>>>
>>>>>
>>>>>>         VHostNetState *vhost_net;
>>>>>>
>>>>>>         /* Control commands shadow buffers */
>>>>>> @@ -433,9 +435,15 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>>>>                 g_strerror(errno), errno);
>>>>>>             return -1;
>>>>>>         }
>>>>>> -    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
>>>>>> -        !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
>>>>>> -        return 0;
>>>>>> +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID))) {
>>>>>> +        error_setg(&s->migration_blocker,
>>>>>> +                   "vdpa device %s does not support ASID",
>>>>>> +                   nc->name);
>>>>>> +        goto out;
>>>>>> +    }
>>>>>> +    if (!vhost_vdpa_net_valid_svq_features(v->dev->features,
>>>>>> +                                           &s->migration_blocker)) {
>>>>>> +        goto out;
>>>>>>         }
>>>>>>
>>>>>>         /*
>>>>>> @@ -455,7 +463,10 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>>>>             }
>>>>>>
>>>>>>             if (group == cvq_group) {
>>>>>> -            return 0;
>>>>>> +            error_setg(&s->migration_blocker,
>>>>>> +                "vdpa %s vq %d group %"PRId64" is the same as cvq group "
>>>>>> +                "%"PRId64, nc->name, i, group, cvq_group);
>>>>>> +            goto out;
>>>>>>             }
>>>>>>         }
>>>>>>
>>>>>> @@ -468,8 +479,15 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>>>>         s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_ASID;
>>>>>>
>>>>>>     out:
>>>>>> -    if (!s->vhost_vdpa.shadow_vqs_enabled) {
>>>>>> -        return 0;
>>>>>> +    if (s->migration_blocker) {
>>>>>> +        Error *errp = NULL;
>>>>>> +        r = migrate_add_blocker(s->migration_blocker, &errp);
>>>>>> +        if (unlikely(r != 0)) {
>>>>>> +            g_clear_pointer(&s->migration_blocker, error_free);
>>>>>> +            error_report_err(errp);
>>>>>> +        }
>>>>>> +
>>>>>> +        return r;
>>>>>>         }
>>>>>>
>>>>>>         s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>>>>> @@ -513,6 +531,11 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
>>>>>>             vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
>>>>>>         }
>>>>>>
>>>>>> +    if (s->migration_blocker) {
>>>>>> +        migrate_del_blocker(s->migration_blocker);
>>>>>> +        g_clear_pointer(&s->migration_blocker, error_free);
>>>>>> +    }
>>>>>> +
>>>>>>         vhost_vdpa_net_client_stop(nc);
>>>>>>     }
>>>>>>


