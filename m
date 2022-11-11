Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A996254E7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:08:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOn9-0004FY-NA; Fri, 11 Nov 2022 02:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1otOmp-0004DB-TP
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:49:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1otOmo-0001ag-7Q
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668152953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQ2OMg/XDBnbe2LjD68xEzX2Z9rZ/ij03O6xGIiQqzA=;
 b=ZYCburme1Nih/VarzLX8xIyrpYI4DMtm0mgpSlWJrI7l64Ma+3g7ee/9CDGN697mey6AGK
 OBaaAhiBGPJ5InkV13F+yrnULWLCHiqftsPYVNbnoCxQSt32D9PTurNjFdJ+tiy+oRyrI9
 OZ4SEJe8ho5zRoND64fc1DFRHsNSw7k=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-ILBD6u_nOaGhrwHiGxegZw-1; Fri, 11 Nov 2022 02:49:11 -0500
X-MC-Unique: ILBD6u_nOaGhrwHiGxegZw-1
Received: by mail-pl1-f199.google.com with SMTP id
 z15-20020a170903018f00b0018862d520fbso3098284plg.11
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lQ2OMg/XDBnbe2LjD68xEzX2Z9rZ/ij03O6xGIiQqzA=;
 b=kR1oC8a6PUPK7kjAg2OuX1nVBcBfW17tGHf76KQxx56VLmwULOZNGWopfuVsj+RAac
 QXLWm1FVQe4B9T89dDLX/gtQxWN7zwsfcdEbYbU7iNXtQuxc9ipS+DSbeZbff0uOTR8T
 UkNsmaPLvUwInJhWfGGvVv+waJsLeDpE0zmuJfvjMUG3oAbZOG6hHgCUHIQ4CgDOZ0eG
 PPxGG92SKl18YXFDeOdeSEhS+m8evmVZgaxXbo8j5qCrMpJMXRYitlkP3Vx9fqpDtoYr
 c+kceHJN8l+6WWknuX3WQCXVqUIwtURYoGXNhaHIPHeSXGc2mt58Ez2C+WzLuVk66q8I
 ROKw==
X-Gm-Message-State: ANoB5pk5bqsJgZ7z75lXVuHbfi3ryeEyi5+rv5i1jSKpQhhyfTAHPfNy
 +FffPSbked0x1aO/01xQk2QrhPFqLiJcJv5m52nZVpcmbKZDhyp2g8RHP+2Wea9HNAPkA1L6NwC
 mdfIySOvmDUB6ko0=
X-Received: by 2002:a17:902:d353:b0:180:be71:6773 with SMTP id
 l19-20020a170902d35300b00180be716773mr1580522plk.42.1668152950585; 
 Thu, 10 Nov 2022 23:49:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5hugxwU3w8Xl0Dv7S4TgEzgOZHCVEsrDcsWDpBKgH57oQNNCHlxuBgcCknkXEzU/xAGZjPTQ==
X-Received: by 2002:a17:902:d353:b0:180:be71:6773 with SMTP id
 l19-20020a170902d35300b00180be716773mr1580496plk.42.1668152950286; 
 Thu, 10 Nov 2022 23:49:10 -0800 (PST)
Received: from [10.72.13.217] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a17090b010d00b002009db534d1sm1000708pjz.24.2022.11.10.23.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 23:49:09 -0800 (PST)
Message-ID: <be553273-7c06-78f7-4d23-de9f46a210b1@redhat.com>
Date: Fri, 11 Nov 2022 15:48:58 +0800
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
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWemKoRNd6_uvFc79qYe+7pbavJSjnZuczxk5uxSZZdZ2Q@mail.gmail.com>
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


在 2022/11/10 21:47, Eugenio Perez Martin 写道:
> On Thu, Nov 10, 2022 at 7:01 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Wed, Nov 9, 2022 at 1:08 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>> The memory listener that thells the device how to convert GPA to qemu's
>>> va is registered against CVQ vhost_vdpa. This series try to map the
>>> memory listener translations to ASID 0, while it maps the CVQ ones to
>>> ASID 1.
>>>
>>> Let's tell the listener if it needs to register them on iova tree or
>>> not.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>> v5: Solve conflict about vhost_iova_tree_remove accepting mem_region by
>>>      value.
>>> ---
>>>   include/hw/virtio/vhost-vdpa.h | 2 ++
>>>   hw/virtio/vhost-vdpa.c         | 6 +++---
>>>   net/vhost-vdpa.c               | 1 +
>>>   3 files changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
>>> index 6560bb9d78..0c3ed2d69b 100644
>>> --- a/include/hw/virtio/vhost-vdpa.h
>>> +++ b/include/hw/virtio/vhost-vdpa.h
>>> @@ -34,6 +34,8 @@ typedef struct vhost_vdpa {
>>>       struct vhost_vdpa_iova_range iova_range;
>>>       uint64_t acked_features;
>>>       bool shadow_vqs_enabled;
>>> +    /* The listener must send iova tree addresses, not GPA */


Btw, cindy's vIOMMU series will make it not necessarily GPA any more.


>>> +    bool listener_shadow_vq;
>>>       /* IOVA mapping used by the Shadow Virtqueue */
>>>       VhostIOVATree *iova_tree;
>>>       GPtrArray *shadow_vqs;
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 8fd32ba32b..e3914fa40e 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -220,7 +220,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>>>                                            vaddr, section->readonly);
>>>
>>>       llsize = int128_sub(llend, int128_make64(iova));
>>> -    if (v->shadow_vqs_enabled) {
>>> +    if (v->listener_shadow_vq) {
>>>           int r;
>>>
>>>           mem_region.translated_addr = (hwaddr)(uintptr_t)vaddr,
>>> @@ -247,7 +247,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>>>       return;
>>>
>>>   fail_map:
>>> -    if (v->shadow_vqs_enabled) {
>>> +    if (v->listener_shadow_vq) {
>>>           vhost_iova_tree_remove(v->iova_tree, mem_region);
>>>       }
>>>
>>> @@ -292,7 +292,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>>>
>>>       llsize = int128_sub(llend, int128_make64(iova));
>>>
>>> -    if (v->shadow_vqs_enabled) {
>>> +    if (v->listener_shadow_vq) {
>>>           const DMAMap *result;
>>>           const void *vaddr = memory_region_get_ram_ptr(section->mr) +
>>>               section->offset_within_region +
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index 85a318faca..02780ee37b 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -570,6 +570,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>       s->vhost_vdpa.index = queue_pair_index;
>>>       s->always_svq = svq;
>>>       s->vhost_vdpa.shadow_vqs_enabled = svq;
>>> +    s->vhost_vdpa.listener_shadow_vq = svq;
>> Any chance those above two can differ?
>>
> If CVQ is shadowed but data VQs are not, shadow_vqs_enabled is true
> but listener_shadow_vq is not.
>
> It is more clear in the next commit, where only shadow_vqs_enabled is
> set to true at vhost_vdpa_net_cvq_start.


Ok, the name looks a little bit confusing. I wonder if it's better to 
use shadow_cvq and shadow_data ?

Thanks


>
> Thanks!
>
>> Thanks
>>
>>>       s->vhost_vdpa.iova_tree = iova_tree;
>>>       if (!is_datapath) {
>>>           s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
>>> --
>>> 2.31.1
>>>


