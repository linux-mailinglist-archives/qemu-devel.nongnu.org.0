Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CC066D55F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 05:32:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHdcb-0006V0-Nj; Mon, 16 Jan 2023 23:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHdcJ-0006Ug-NK
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 23:30:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHdcH-0002MK-Au
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 23:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673929832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rb5XiD0pO7Yyp6kh/iIo//wIDhGUnuK/A8vvsWTLDo=;
 b=T1rAQcXAlcAdutLozjxCWJ6xWkybShS2r5KqyxqfJ/Lcym2uRMCO0zfS/YhEQablEO/F2B
 DZHaV3+aruVwXAlwhWAWiLG4iLVK1NG+rFbSciBiuEOQ+61LKJw47t6SJnfev7ijTE032K
 UJyX3Wa4UTVkAZLNe039DTM4lMei+wg=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-404-vl6hPQTpP2yzYGkxLyudiA-1; Mon, 16 Jan 2023 23:30:29 -0500
X-MC-Unique: vl6hPQTpP2yzYGkxLyudiA-1
Received: by mail-pl1-f198.google.com with SMTP id
 i1-20020a170902c94100b0019486e621d8so4556772pla.22
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 20:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2rb5XiD0pO7Yyp6kh/iIo//wIDhGUnuK/A8vvsWTLDo=;
 b=Qc9cxgWWixD9maDy5wiInU7QlvQpEnzQtWFyyhZXhs5IzgaLYHTU1ZwT5ENccnlloK
 0X0LygyXzVLQU8am8biSNSD7acPEjBWNVaEDzg7ihn6hCAdx2Ah9obO/BvBeJfHDiuvp
 UbOK70U+/alhqgiv3EQUL2uHrcUzE0wX1Tr10In4++vK7L8FAhQ2FV9S/xmsDpGjdIO7
 RWMoUrHYRK/4GWC+wjcqWbUY61u+/lCgzY9/AsRbvFvT4x9X3yC6oq5cApEfPJvYSKhK
 31DAYNLx3aG11m6IR+uhygOh0GqW12Y7A7NrOXM4yyLj/DVjTLb3sozThHjO0W5ExU+T
 hyOw==
X-Gm-Message-State: AFqh2kpxhNo0TVleJhw0Rjh1jSwPDTH4ISh6iGK0Jtt7Scq1ATd6inSb
 z9aBmhStwmUtCjP5zC0ol7+iwN8B7Kp3Cqa7/RpVp0VbVb5FCboCJVWHGszGj3l98fLt3tUdxoi
 kcoptPNrcKzoyNX0=
X-Received: by 2002:a17:903:25c3:b0:18f:a5b6:54f9 with SMTP id
 jc3-20020a17090325c300b0018fa5b654f9mr2286265plb.11.1673929828692; 
 Mon, 16 Jan 2023 20:30:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvzAaWQqBtOlrr61wtTohH1YDbBWTJqDNq0ajmNS1NRmW0OrH9/KKlplrbQvhWPF2fb8ZRXVw==
X-Received: by 2002:a17:903:25c3:b0:18f:a5b6:54f9 with SMTP id
 jc3-20020a17090325c300b0018fa5b654f9mr2286232plb.11.1673929828266; 
 Mon, 16 Jan 2023 20:30:28 -0800 (PST)
Received: from [10.72.13.215] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902c24d00b001926ccaa4bcsm20157310plg.161.2023.01.16.20.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 20:30:27 -0800 (PST)
Message-ID: <c4fa9963-af4a-e712-162c-926a79016bfe@redhat.com>
Date: Tue, 17 Jan 2023 12:30:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v2 02/13] vdpa net: move iova tree creation from init to
 start
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-3-eperezma@redhat.com>
 <CACGkMEvoo1LkBj9m9afCu39J9ngBPVV7T2R7VaRabd8-WdN0oQ@mail.gmail.com>
 <CAJaqyWdioFYZPJT+xfHUxgsZzwVVGKfSbmieuKvhEodgK99c=Q@mail.gmail.com>
 <147cd500-abf3-8d2c-ae7a-02a9672ba61d@redhat.com>
 <CAJaqyWfcV2stgY7mNrw2rEpBN+RC72L39it6Ag=3jW1Pxx_7eA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWfcV2stgY7mNrw2rEpBN+RC72L39it6Ag=3jW1Pxx_7eA@mail.gmail.com>
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


在 2023/1/16 17:14, Eugenio Perez Martin 写道:
> On Mon, Jan 16, 2023 at 4:05 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2023/1/13 15:28, Eugenio Perez Martin 写道:
>>> On Fri, Jan 13, 2023 at 4:53 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> On Fri, Jan 13, 2023 at 1:24 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>>>> Only create iova_tree if and when it is needed.
>>>>>
>>>>> The cleanup keeps being responsability of last VQ but this change allows
>>>>> to merge both cleanup functions.
>>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>>    net/vhost-vdpa.c | 101 +++++++++++++++++++++++++++++++++--------------
>>>>>    1 file changed, 71 insertions(+), 30 deletions(-)
>>>>>
>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>>> index de5ed8ff22..75cca497c8 100644
>>>>> --- a/net/vhost-vdpa.c
>>>>> +++ b/net/vhost-vdpa.c
>>>>> @@ -178,13 +178,9 @@ err_init:
>>>>>    static void vhost_vdpa_cleanup(NetClientState *nc)
>>>>>    {
>>>>>        VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>> -    struct vhost_dev *dev = &s->vhost_net->dev;
>>>>>
>>>>>        qemu_vfree(s->cvq_cmd_out_buffer);
>>>>>        qemu_vfree(s->status);
>>>>> -    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>>>> -        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>>>> -    }
>>>>>        if (s->vhost_net) {
>>>>>            vhost_net_cleanup(s->vhost_net);
>>>>>            g_free(s->vhost_net);
>>>>> @@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
>>>>>        return size;
>>>>>    }
>>>>>
>>>>> +/** From any vdpa net client, get the netclient of first queue pair */
>>>>> +static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
>>>>> +{
>>>>> +    NICState *nic = qemu_get_nic(s->nc.peer);
>>>>> +    NetClientState *nc0 = qemu_get_peer(nic->ncs, 0);
>>>>> +
>>>>> +    return DO_UPCAST(VhostVDPAState, nc, nc0);
>>>>> +}
>>>>> +
>>>>> +static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
>>>>> +{
>>>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>>>> +
>>>>> +    if (v->shadow_vqs_enabled) {
>>>>> +        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>>>> +                                           v->iova_range.last);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>> +static int vhost_vdpa_net_data_start(NetClientState *nc)
>>>>> +{
>>>>> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>>>> +
>>>>> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>>> +
>>>>> +    if (v->index == 0) {
>>>>> +        vhost_vdpa_net_data_start_first(s);
>>>>> +        return 0;
>>>>> +    }
>>>>> +
>>>>> +    if (v->shadow_vqs_enabled) {
>>>>> +        VhostVDPAState *s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>>>> +        v->iova_tree = s0->vhost_vdpa.iova_tree;
>>>>> +    }
>>>> It looks to me the logic here is somehow the same as
>>>> vhost_vdpa_net_cvq_start(), can we unify the them?
>>>>
>>> It depends on what you mean by unify :). But we can explore it for sure.
>>>
>>> We can call vhost_vdpa_net_data_start, but the steps to do if
>>> s0->vhost_vdpa.iova_tree == NULL are different. Data queues must do
>>> nothing, but CVQ must create a new iova tree.
>>>
>>> So one possibility is to convert this part of vhost_vdpa_net_cvq_start:
>>>       s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>>       if (s0->vhost_vdpa.iova_tree) {
>>>           /* SVQ is already configured for all virtqueues */
>>>           v->iova_tree = s0->vhost_vdpa.iova_tree;
>>>       } else {
>>>           v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>>                                              v->iova_range.last);
>>>       }
>>>
>>> into:
>>>       vhost_vdpa_net_data_start(nc);
>>>       if (!v->iova_tree) {
>>>           v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>>                                              v->iova_range.last);
>>>       }
>>>
>>> I'm ok with the change but it's less clear in my opinion: it's not
>>> obvious that net_data_start is in charge of setting v->iova_tree to
>>> me.
>>
>> Ok.
>>
>>
>>> Another possibility is to abstract something like
>>> first_nc_iova_tree(), but we need to check more fields of s0 later
>>> (shadow_data) so I'm not sure about the benefit.
>>>
>>> Is that what you have in mind?
>>
>> Kind of, but I think we can leave the code as is.
>>
>> In the future, as discussed, we need to introduce something like a
>> parent or opaque structure for NetClientState structure, it can simply a
>> lot of things: we can have one same common parent for all queues, then
>> there's no need for the trick like first_nc_iova_tree() and other
>> similar tricks.
>>
> So we can ack this patch or you prefer to explore the change for the
> next series?


Let's let it for future.

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


>
> Thanks!
>
>> Thanks
>>
>>> Thanks!
>>>
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static void vhost_vdpa_net_client_stop(NetClientState *nc)
>>>>> +{
>>>>> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>> +    struct vhost_dev *dev;
>>>>> +
>>>>> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>>> +
>>>>> +    dev = s->vhost_vdpa.dev;
>>>>> +    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>>>> +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>>    static NetClientInfo net_vhost_vdpa_info = {
>>>>>            .type = NET_CLIENT_DRIVER_VHOST_VDPA,
>>>>>            .size = sizeof(VhostVDPAState),
>>>>>            .receive = vhost_vdpa_receive,
>>>>> +        .start = vhost_vdpa_net_data_start,
>>>>> +        .stop = vhost_vdpa_net_client_stop,
>>>>>            .cleanup = vhost_vdpa_cleanup,
>>>>>            .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
>>>>>            .has_ufo = vhost_vdpa_has_ufo,
>>>>> @@ -351,7 +401,7 @@ dma_map_err:
>>>>>
>>>>>    static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>>>    {
>>>>> -    VhostVDPAState *s;
>>>>> +    VhostVDPAState *s, *s0;
>>>>>        struct vhost_vdpa *v;
>>>>>        uint64_t backend_features;
>>>>>        int64_t cvq_group;
>>>>> @@ -415,8 +465,6 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>>>            return r;
>>>>>        }
>>>>>
>>>>> -    v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>>>> -                                       v->iova_range.last);
>>>>>        v->shadow_vqs_enabled = true;
>>>>>        s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_ASID;
>>>>>
>>>>> @@ -425,6 +473,15 @@ out:
>>>>>            return 0;
>>>>>        }
>>>>>
>>>>> +    s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>>>> +    if (s0->vhost_vdpa.iova_tree) {
>>>>> +        /* SVQ is already configured for all virtqueues */
>>>>> +        v->iova_tree = s0->vhost_vdpa.iova_tree;
>>>>> +    } else {
>>>>> +        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>>>> +                                           v->iova_range.last);
>>>>> +    }
>>>>> +
>>>>>        r = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer,
>>>>>                                   vhost_vdpa_net_cvq_cmd_page_len(), false);
>>>>>        if (unlikely(r < 0)) {
>>>>> @@ -449,15 +506,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
>>>>>        if (s->vhost_vdpa.shadow_vqs_enabled) {
>>>>>            vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
>>>>>            vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
>>>>> -        if (!s->always_svq) {
>>>>> -            /*
>>>>> -             * If only the CVQ is shadowed we can delete this safely.
>>>>> -             * If all the VQs are shadows this will be needed by the time the
>>>>> -             * device is started again to register SVQ vrings and similar.
>>>>> -             */
>>>>> -            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>>>> -        }
>>>>>        }
>>>>> +
>>>>> +    vhost_vdpa_net_client_stop(nc);
>>>>>    }
>>>>>
>>>>>    static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
>>>>> @@ -667,8 +718,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>>>                                           int nvqs,
>>>>>                                           bool is_datapath,
>>>>>                                           bool svq,
>>>>> -                                       struct vhost_vdpa_iova_range iova_range,
>>>>> -                                       VhostIOVATree *iova_tree)
>>>>> +                                       struct vhost_vdpa_iova_range iova_range)
>>>>>    {
>>>>>        NetClientState *nc = NULL;
>>>>>        VhostVDPAState *s;
>>>>> @@ -690,7 +740,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>>>        s->vhost_vdpa.shadow_vqs_enabled = svq;
>>>>>        s->vhost_vdpa.iova_range = iova_range;
>>>>>        s->vhost_vdpa.shadow_data = svq;
>>>>> -    s->vhost_vdpa.iova_tree = iova_tree;
>>>>>        if (!is_datapath) {
>>>>>            s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
>>>>>                                                vhost_vdpa_net_cvq_cmd_page_len());
>>>>> @@ -760,7 +809,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>>        uint64_t features;
>>>>>        int vdpa_device_fd;
>>>>>        g_autofree NetClientState **ncs = NULL;
>>>>> -    g_autoptr(VhostIOVATree) iova_tree = NULL;
>>>>>        struct vhost_vdpa_iova_range iova_range;
>>>>>        NetClientState *nc;
>>>>>        int queue_pairs, r, i = 0, has_cvq = 0;
>>>>> @@ -812,12 +860,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>>            goto err;
>>>>>        }
>>>>>
>>>>> -    if (opts->x_svq) {
>>>>> -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
>>>>> -            goto err_svq;
>>>>> -        }
>>>>> -
>>>>> -        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
>>>>> +    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features, errp)) {
>>>>> +        goto err;
>>>>>        }
>>>>>
>>>>>        ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
>>>>> @@ -825,7 +869,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>>        for (i = 0; i < queue_pairs; i++) {
>>>>>            ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>>>                                         vdpa_device_fd, i, 2, true, opts->x_svq,
>>>>> -                                     iova_range, iova_tree);
>>>>> +                                     iova_range);
>>>>>            if (!ncs[i])
>>>>>                goto err;
>>>>>        }
>>>>> @@ -833,13 +877,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>>        if (has_cvq) {
>>>>>            nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>>>                                     vdpa_device_fd, i, 1, false,
>>>>> -                                 opts->x_svq, iova_range, iova_tree);
>>>>> +                                 opts->x_svq, iova_range);
>>>>>            if (!nc)
>>>>>                goto err;
>>>>>        }
>>>>>
>>>>> -    /* iova_tree ownership belongs to last NetClientState */
>>>>> -    g_steal_pointer(&iova_tree);
>>>>>        return 0;
>>>>>
>>>>>    err:
>>>>> @@ -849,7 +891,6 @@ err:
>>>>>            }
>>>>>        }
>>>>>
>>>>> -err_svq:
>>>>>        qemu_close(vdpa_device_fd);
>>>>>
>>>>>        return -1;
>>>>> --
>>>>> 2.31.1
>>>>>


