Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE43628E19
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:15:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouioJ-0000Bw-H5; Mon, 14 Nov 2022 18:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ouig9-0006LX-0G
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ouR71-0004Hf-RT
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 23:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668400223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KfG44Vz1URbgkpQEdXRZWY0nTsuZKI0JGhM4zYGq6UE=;
 b=d7gm4chqVjRwtZ4Wu4xWa1mxvbrD3YxSIALVo5YoYn+agTGFyZNPDqqGkvyY/A2uoIfesU
 LIJ1Jsf70bblGvHFWDgMv/NitYQybYfz6Wez4mraI1yCqs5915QAmkPMX3VLeywdicctiK
 y93lo2Di/pcKlNptscritMBNBDwRFy8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-499-RzKyNus1NjOwh41-g9qbhA-1; Sun, 13 Nov 2022 23:30:20 -0500
X-MC-Unique: RzKyNus1NjOwh41-g9qbhA-1
Received: by mail-pg1-f198.google.com with SMTP id
 138-20020a630290000000b004708e8a8dcfso5273454pgc.11
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 20:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KfG44Vz1URbgkpQEdXRZWY0nTsuZKI0JGhM4zYGq6UE=;
 b=0lMvEefaBQNijCfa/XpPFBezGVBiy3V1+FvpStfppGKNMAn7i5uPQXPSww6GI5bVxu
 CNy1VgeSjXOq3hOfwi4Jn2I1asVLbHX+O8OXVyXsewS2KMvmiusCToL8/xIoBvCExHk/
 THskstD3gtLinzJM5SBk9OFUypwXPVClTLmQaaYmW5ApT4yh2HxqdBzLmsYflxDdJkzF
 VY/nkXT7d8IVNIRLidFB89dy5xWd7cgaPhPx7s3hLcMxSimMt3MgYLOEP7EzDySCAiNQ
 bVFCpRVIly/t+HLJXLPkM03mpc6I2YQJxi9gxgygug/ePT3cv94IN8OYgBOREAnv5CDj
 G5vA==
X-Gm-Message-State: ANoB5pnKyp9EZj29dfjH5D4eB002cMje4znUdCY72Cb7ZaVRN3UJuhmZ
 K/OqfSdSgDRLB3C6bv39BpzExW0PVd286cP5Xc5lM+k6GhnHPdbNf2Iqs1Ns9gKc4zKz5QqZhWM
 lLH8BLQ6Whr8J/f4=
X-Received: by 2002:a17:903:3308:b0:186:d89d:f0bc with SMTP id
 jk8-20020a170903330800b00186d89df0bcmr12144135plb.19.1668400219488; 
 Sun, 13 Nov 2022 20:30:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4JGvLcGS0rUrYEviFQkpojH+lEE7BEpMuELAsAPQuEtf4LBl9s7c8lbM64KlBjB5Q420+QeQ==
X-Received: by 2002:a17:903:3308:b0:186:d89d:f0bc with SMTP id
 jk8-20020a170903330800b00186d89df0bcmr12144113plb.19.1668400219229; 
 Sun, 13 Nov 2022 20:30:19 -0800 (PST)
Received: from [10.72.13.180] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a170902c94800b00187197c4999sm6134805pla.167.2022.11.13.20.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 20:30:18 -0800 (PST)
Message-ID: <6a35e659-698e-ff71-fe9b-06e15809c9e4@redhat.com>
Date: Mon, 14 Nov 2022 12:30:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v6 09/10] vdpa: Add listener_shadow_vq to vhost_vdpa
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
 <20221108170755.92768-10-eperezma@redhat.com>
 <CACGkMEsr=fpbbOpUBHawt5DR+nTWcK1uMzXgorEcbijso1wsMQ@mail.gmail.com>
 <CAJaqyWemKoRNd6_uvFc79qYe+7pbavJSjnZuczxk5uxSZZdZ2Q@mail.gmail.com>
 <be553273-7c06-78f7-4d23-de9f46a210b1@redhat.com>
 <CAJaqyWeZWQgGm7XZ-+DBHNS4XW_-GgWeeOqTb82v__jS8ONRyQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWeZWQgGm7XZ-+DBHNS4XW_-GgWeeOqTb82v__jS8ONRyQ@mail.gmail.com>
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


在 2022/11/11 21:12, Eugenio Perez Martin 写道:
> On Fri, Nov 11, 2022 at 8:49 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/11/10 21:47, Eugenio Perez Martin 写道:
>>> On Thu, Nov 10, 2022 at 7:01 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> On Wed, Nov 9, 2022 at 1:08 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>>>> The memory listener that thells the device how to convert GPA to qemu's
>>>>> va is registered against CVQ vhost_vdpa. This series try to map the
>>>>> memory listener translations to ASID 0, while it maps the CVQ ones to
>>>>> ASID 1.
>>>>>
>>>>> Let's tell the listener if it needs to register them on iova tree or
>>>>> not.
>>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>> v5: Solve conflict about vhost_iova_tree_remove accepting mem_region by
>>>>>       value.
>>>>> ---
>>>>>    include/hw/virtio/vhost-vdpa.h | 2 ++
>>>>>    hw/virtio/vhost-vdpa.c         | 6 +++---
>>>>>    net/vhost-vdpa.c               | 1 +
>>>>>    3 files changed, 6 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
>>>>> index 6560bb9d78..0c3ed2d69b 100644
>>>>> --- a/include/hw/virtio/vhost-vdpa.h
>>>>> +++ b/include/hw/virtio/vhost-vdpa.h
>>>>> @@ -34,6 +34,8 @@ typedef struct vhost_vdpa {
>>>>>        struct vhost_vdpa_iova_range iova_range;
>>>>>        uint64_t acked_features;
>>>>>        bool shadow_vqs_enabled;
>>>>> +    /* The listener must send iova tree addresses, not GPA */
>>
>> Btw, cindy's vIOMMU series will make it not necessarily GPA any more.
>>
> Yes, this comment should be tuned then. But the SVQ iova_tree will not
> be equal to vIOMMU one because shadow vrings.
>
> But maybe SVQ can inspect both instead of having all the duplicated entries.
>
>>>>> +    bool listener_shadow_vq;
>>>>>        /* IOVA mapping used by the Shadow Virtqueue */
>>>>>        VhostIOVATree *iova_tree;
>>>>>        GPtrArray *shadow_vqs;
>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>> index 8fd32ba32b..e3914fa40e 100644
>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>> @@ -220,7 +220,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>>>>>                                             vaddr, section->readonly);
>>>>>
>>>>>        llsize = int128_sub(llend, int128_make64(iova));
>>>>> -    if (v->shadow_vqs_enabled) {
>>>>> +    if (v->listener_shadow_vq) {
>>>>>            int r;
>>>>>
>>>>>            mem_region.translated_addr = (hwaddr)(uintptr_t)vaddr,
>>>>> @@ -247,7 +247,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>>>>>        return;
>>>>>
>>>>>    fail_map:
>>>>> -    if (v->shadow_vqs_enabled) {
>>>>> +    if (v->listener_shadow_vq) {
>>>>>            vhost_iova_tree_remove(v->iova_tree, mem_region);
>>>>>        }
>>>>>
>>>>> @@ -292,7 +292,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>>>>>
>>>>>        llsize = int128_sub(llend, int128_make64(iova));
>>>>>
>>>>> -    if (v->shadow_vqs_enabled) {
>>>>> +    if (v->listener_shadow_vq) {
>>>>>            const DMAMap *result;
>>>>>            const void *vaddr = memory_region_get_ram_ptr(section->mr) +
>>>>>                section->offset_within_region +
>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>>> index 85a318faca..02780ee37b 100644
>>>>> --- a/net/vhost-vdpa.c
>>>>> +++ b/net/vhost-vdpa.c
>>>>> @@ -570,6 +570,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>>>        s->vhost_vdpa.index = queue_pair_index;
>>>>>        s->always_svq = svq;
>>>>>        s->vhost_vdpa.shadow_vqs_enabled = svq;
>>>>> +    s->vhost_vdpa.listener_shadow_vq = svq;
>>>> Any chance those above two can differ?
>>>>
>>> If CVQ is shadowed but data VQs are not, shadow_vqs_enabled is true
>>> but listener_shadow_vq is not.
>>>
>>> It is more clear in the next commit, where only shadow_vqs_enabled is
>>> set to true at vhost_vdpa_net_cvq_start.
>>
>> Ok, the name looks a little bit confusing. I wonder if it's better to
>> use shadow_cvq and shadow_data ?
>>
> I'm ok with renaming it, but struct vhost_vdpa is generic across all
> kind of devices, and it does not know if it is a datapath or not for
> the moment.
>
> Maybe listener_uses_iova_tree?


I think "iova_tree" is something that is internal to svq implementation, 
it's better to define the name from the view of vhost_vdpa level.

Thanks


>
> Thanks!
>


