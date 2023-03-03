Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CC66A8FE9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:34:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXwA4-0001KE-QY; Thu, 02 Mar 2023 22:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pXwA0-0001JX-B6
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 22:32:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pXw9y-0003t8-2P
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 22:32:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677814360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phYuHNjQM6ykNN6HuegGTsLwLZ0S941A3yDwxOSwtvQ=;
 b=DT49NuT/U4QVHcT/dtJl804WaFJWCoOQTkHlSPPDP2oQ1rqd2gJIxrPp9OtwruwT6cCmd/
 ZrMqyOcgCUFDvn1dEhAiRlhbRJ8wCwTUSOJLmX3bj6dHj+6QVaTJYrxxnFUfhx5wbvwpTo
 aeMcuYX/By0cGMJpGIobVIyCcC2c2Uw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-5pmPKY3yPYudHnE2SXKMgg-1; Thu, 02 Mar 2023 22:32:37 -0500
X-MC-Unique: 5pmPKY3yPYudHnE2SXKMgg-1
Received: by mail-pj1-f72.google.com with SMTP id
 mm13-20020a17090b358d00b002377ec65e7aso2467400pjb.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 19:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677814356;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=phYuHNjQM6ykNN6HuegGTsLwLZ0S941A3yDwxOSwtvQ=;
 b=5FX9UGXodw2zGp2CYaOdSLEt489kGk3BMep6XFGpZH9ditsFYaEQUnT/hdD1ViA/nA
 yWKB2fJwhetpgDhaWzjzn7qcPDOLESdntHNM7/9zCYGlEDsdv5X+I2wmYbAQEsngrhFg
 mjo20eC6asSkovQ+cxAW7Jp0Svgk2YMh/mqSM+1XkoxcTsheadxL9UN2nS7qaVqvUWko
 eAu5IrmWxNZYDJfsIwcoGlKFLmeyZ9fJTBgy2o2JR6S/A6xpmso94buQMz2pxDJ4Y9ds
 vuSpazl87jlGKhDv7SpbwF1OjCqO/r7mvvL+HUj+VCTDBY6ou0mGJxTWGv/XAfHIqjua
 cEbg==
X-Gm-Message-State: AO0yUKXWDpGS6npCG45bXO01fQAvExoxe2UimlMgf55LuKUp/Y2BfNVv
 eBKwXIepO5WWl7RmFXT/qMyZWWFzbWVXcINgmbqibmROHvjo15KyfSNBNLLCjF8DkjcSENL21F5
 f9DcO2cIETQK7Gqk=
X-Received: by 2002:a17:90a:1911:b0:234:b8cb:512b with SMTP id
 17-20020a17090a191100b00234b8cb512bmr105474pjg.30.1677814355947; 
 Thu, 02 Mar 2023 19:32:35 -0800 (PST)
X-Google-Smtp-Source: AK7set93FqC3ax7ZQ3We5hnNBolERKb5yct15WO39v5vw3wYYlvIhMSYNoFeQpfR2e1g2fIVFwT9QA==
X-Received: by 2002:a17:90a:1911:b0:234:b8cb:512b with SMTP id
 17-20020a17090a191100b00234b8cb512bmr105447pjg.30.1677814355548; 
 Thu, 02 Mar 2023 19:32:35 -0800 (PST)
Received: from [10.72.13.180] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a63475a000000b00502ea97cbc0sm407408pgk.40.2023.03.02.19.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 19:32:35 -0800 (PST)
Message-ID: <fcd6405d-294e-3af7-5574-30870904257e@redhat.com>
Date: Fri, 3 Mar 2023 11:32:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 01/15] vdpa net: move iova tree creation from init to
 start
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-2-eperezma@redhat.com>
 <a2f01833-0709-4155-e922-4624e31ac3b3@redhat.com>
 <CAJaqyWebiu1oTAgpnVvjUZ672OLLHSqt1vjn8rNkMGy5n4vq-g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWebiu1oTAgpnVvjUZ672OLLHSqt1vjn8rNkMGy5n4vq-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2023/3/1 15:01, Eugenio Perez Martin 写道:
> On Mon, Feb 27, 2023 at 8:04 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2023/2/24 23:54, Eugenio Pérez 写道:
>>> Only create iova_tree if and when it is needed.
>>>
>>> The cleanup keeps being responsible of last VQ but this change allows it
>>> to merge both cleanup functions.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>> ---
>>> v4:
>>> * Remove leak of iova_tree because double allocation
>>> * Document better the sharing of IOVA tree between data and CVQ
>>> ---
>>>    net/vhost-vdpa.c | 113 ++++++++++++++++++++++++++++++++++-------------
>>>    1 file changed, 83 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index de5ed8ff22..b89c99066a 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -178,13 +178,9 @@ err_init:
>>>    static void vhost_vdpa_cleanup(NetClientState *nc)
>>>    {
>>>        VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>> -    struct vhost_dev *dev = &s->vhost_net->dev;
>>>
>>>        qemu_vfree(s->cvq_cmd_out_buffer);
>>>        qemu_vfree(s->status);
>>> -    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>> -        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>> -    }
>>>        if (s->vhost_net) {
>>>            vhost_net_cleanup(s->vhost_net);
>>>            g_free(s->vhost_net);
>>> @@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
>>>        return size;
>>>    }
>>>
>>> +/** From any vdpa net client, get the netclient of first queue pair */
>>> +static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
>>> +{
>>> +    NICState *nic = qemu_get_nic(s->nc.peer);
>>> +    NetClientState *nc0 = qemu_get_peer(nic->ncs, 0);
>>> +
>>> +    return DO_UPCAST(VhostVDPAState, nc, nc0);
>>> +}
>>> +
>>> +static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
>>> +{
>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>> +
>>> +    if (v->shadow_vqs_enabled) {
>>> +        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>> +                                           v->iova_range.last);
>>> +    }
>>> +}
>>> +
>>> +static int vhost_vdpa_net_data_start(NetClientState *nc)
>>> +{
>>> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>> +
>>> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>> +
>>> +    if (v->index == 0) {
>>> +        vhost_vdpa_net_data_start_first(s);
>>> +        return 0;
>>> +    }
>>> +
>>> +    if (v->shadow_vqs_enabled) {
>>> +        VhostVDPAState *s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>> +        v->iova_tree = s0->vhost_vdpa.iova_tree;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void vhost_vdpa_net_client_stop(NetClientState *nc)
>>> +{
>>> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>> +    struct vhost_dev *dev;
>>> +
>>> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>> +
>>> +    dev = s->vhost_vdpa.dev;
>>> +    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>> +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>> +    }
>>> +}
>>> +
>>>    static NetClientInfo net_vhost_vdpa_info = {
>>>            .type = NET_CLIENT_DRIVER_VHOST_VDPA,
>>>            .size = sizeof(VhostVDPAState),
>>>            .receive = vhost_vdpa_receive,
>>> +        .start = vhost_vdpa_net_data_start,
>>> +        .stop = vhost_vdpa_net_client_stop,
>>
>> Looking at the implementation, it seems nothing net specific, any reason
>> we can't simply use vhost_vdpa_dev_start()?
>>
> IOVA tree must be shared between (at least) all dataplane vhost_vdpa.
> How could we move the call to vhost_vdpa_net_first_nc_vdpa to
> vhost_vdpa_dev_start?


Ok, I think I get it. We should really consider to implement a parent 
structure in the future for vhost_vdpa then we can avoid tricks like:

vq_index_end and vhost_vdpa_net_first_nc_vdpa()

Thanks


>
> A possibility is to always allocate it just in case. But it seems to
> me it is better to not start allocating resources just in case :).
>
>>>            .cleanup = vhost_vdpa_cleanup,
>>>            .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
>>>            .has_ufo = vhost_vdpa_has_ufo,
>>> @@ -351,7 +401,7 @@ dma_map_err:
>>>
>>>    static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>    {
>>> -    VhostVDPAState *s;
>>> +    VhostVDPAState *s, *s0;
>>>        struct vhost_vdpa *v;
>>>        uint64_t backend_features;
>>>        int64_t cvq_group;
>>> @@ -415,8 +465,6 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>            return r;
>>>        }
>>>
>>> -    v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>> -                                       v->iova_range.last);
>>>        v->shadow_vqs_enabled = true;
>>>        s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_ASID;
>>>
>>> @@ -425,6 +473,27 @@ out:
>>>            return 0;
>>>        }
>>>
>>> +    s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>> +    if (s0->vhost_vdpa.iova_tree) {
>>> +        /*
>>> +         * SVQ is already configured for all virtqueues.  Reuse IOVA tree for
>>> +         * simplicity, wether CVQ shares ASID with guest or not, because:
>>
>> Typo, should be "whether", or "regardless of whether"(not a native speaker).
>>
> Good catch, I can fix it in the next version.
>
> Thanks!
>
>> Other looks good.
>>
>> Thanks
>>
>>
>>> +         * - Memory listener need access to guest's memory addresses allocated
>>> +         *   in the IOVA tree.
>>> +         * - There should be plenty of IOVA address space for both ASID not to
>>> +         *   worry about collisions between them.  Guest's translations are
>>> +         *   still validated with virtio virtqueue_pop so there is no risk for
>>> +         *   the guest to access memory it shouldn't.
>>> +         *
>>> +         * To allocate a iova tree per ASID is doable but it complicates the
>>> +         * code and it is not worth for the moment.
>>> +         */
>>> +        v->iova_tree = s0->vhost_vdpa.iova_tree;
>>> +    } else {
>>> +        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>> +                                           v->iova_range.last);
>>> +    }
>>> +
>>>        r = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer,
>>>                                   vhost_vdpa_net_cvq_cmd_page_len(), false);
>>>        if (unlikely(r < 0)) {
>>> @@ -449,15 +518,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
>>>        if (s->vhost_vdpa.shadow_vqs_enabled) {
>>>            vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
>>>            vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
>>> -        if (!s->always_svq) {
>>> -            /*
>>> -             * If only the CVQ is shadowed we can delete this safely.
>>> -             * If all the VQs are shadows this will be needed by the time the
>>> -             * device is started again to register SVQ vrings and similar.
>>> -             */
>>> -            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>> -        }
>>>        }
>>> +
>>> +    vhost_vdpa_net_client_stop(nc);
>>>    }
>>>
>>>    static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
>>> @@ -667,8 +730,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>                                           int nvqs,
>>>                                           bool is_datapath,
>>>                                           bool svq,
>>> -                                       struct vhost_vdpa_iova_range iova_range,
>>> -                                       VhostIOVATree *iova_tree)
>>> +                                       struct vhost_vdpa_iova_range iova_range)
>>>    {
>>>        NetClientState *nc = NULL;
>>>        VhostVDPAState *s;
>>> @@ -690,7 +752,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>        s->vhost_vdpa.shadow_vqs_enabled = svq;
>>>        s->vhost_vdpa.iova_range = iova_range;
>>>        s->vhost_vdpa.shadow_data = svq;
>>> -    s->vhost_vdpa.iova_tree = iova_tree;
>>>        if (!is_datapath) {
>>>            s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
>>>                                                vhost_vdpa_net_cvq_cmd_page_len());
>>> @@ -760,7 +821,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>        uint64_t features;
>>>        int vdpa_device_fd;
>>>        g_autofree NetClientState **ncs = NULL;
>>> -    g_autoptr(VhostIOVATree) iova_tree = NULL;
>>>        struct vhost_vdpa_iova_range iova_range;
>>>        NetClientState *nc;
>>>        int queue_pairs, r, i = 0, has_cvq = 0;
>>> @@ -812,12 +872,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>            goto err;
>>>        }
>>>
>>> -    if (opts->x_svq) {
>>> -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
>>> -            goto err_svq;
>>> -        }
>>> -
>>> -        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
>>> +    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features, errp)) {
>>> +        goto err;
>>>        }
>>>
>>>        ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
>>> @@ -825,7 +881,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>        for (i = 0; i < queue_pairs; i++) {
>>>            ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>                                         vdpa_device_fd, i, 2, true, opts->x_svq,
>>> -                                     iova_range, iova_tree);
>>> +                                     iova_range);
>>>            if (!ncs[i])
>>>                goto err;
>>>        }
>>> @@ -833,13 +889,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>        if (has_cvq) {
>>>            nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>                                     vdpa_device_fd, i, 1, false,
>>> -                                 opts->x_svq, iova_range, iova_tree);
>>> +                                 opts->x_svq, iova_range);
>>>            if (!nc)
>>>                goto err;
>>>        }
>>>
>>> -    /* iova_tree ownership belongs to last NetClientState */
>>> -    g_steal_pointer(&iova_tree);
>>>        return 0;
>>>
>>>    err:
>>> @@ -849,7 +903,6 @@ err:
>>>            }
>>>        }
>>>
>>> -err_svq:
>>>        qemu_close(vdpa_device_fd);
>>>
>>>        return -1;


