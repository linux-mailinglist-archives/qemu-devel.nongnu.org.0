Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274DA66B5D4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 04:06:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHFoR-0003YA-MF; Sun, 15 Jan 2023 22:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHFoP-0003Xw-KO
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 22:05:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHFoN-0002Yd-8p
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 22:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673838326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3N3ZQxDOLjeuBSrd2/Tz63D+K93QKmkA+uf++AkDXc8=;
 b=QLbnIWph5IfPebRpO7+XEnzvAVAgMFQ1eh73iD5tjWeS4XC74KUjDzvguDF4Gx13au//kp
 JBbl7vAzVsV+cKgze6diFkgq8SZkkuguK7TPxLc3jjPMN20wWIOfApGZVqet1KoZJFDEx5
 6EoLzeY8IO78p8UG8G/9gAC186SX5xw=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-t4JPqav-Pzy7y9AJmnso8w-1; Sun, 15 Jan 2023 22:05:25 -0500
X-MC-Unique: t4JPqav-Pzy7y9AJmnso8w-1
Received: by mail-pl1-f200.google.com with SMTP id
 w18-20020a170902e89200b00192e2fde1ceso19429729plg.20
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 19:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3N3ZQxDOLjeuBSrd2/Tz63D+K93QKmkA+uf++AkDXc8=;
 b=T0C1Nib2efGECjWIxNm5YwapTqUw0hsOoBu5GRH48/TbVYrhsOyMRZ8cVhODohFLJW
 h9i6DtnwjHpzhzD16ETqjkaqi+vuT68Bk9A5nstPB9hkpC1wtBlHw9JMUEP/V7ln2A70
 FgJ3ksNh/CCsj3kFfwHjBMBMcfiIkBfVuz99gDUdsoU+HYQfWLkNDWxJQGolAgHBzgi+
 hQCcSfG+I71jt2Sa1BafzlUBX9nwjDwIwRGmy+dJ9mxlCqnmTAkW17TSV9ztvCQB0xm2
 CHL0NdhxwQ86ywyYG+6kG6XV4wgIC73r7yqLtonEMnaq4zWrqDIJsNYyn+ERGRdpPwDe
 E7yg==
X-Gm-Message-State: AFqh2krjyKUd9uKxgfCy3bdzWIEDlBtqjKWHxTePf9E/Fl5F9CywPDxp
 OUpb1HSL0Tggoa+ROtjJ/9t1A0BM+K7M4sH/S2ylXx+xlnsmiNnt5G+VxpIHmE+8ygDHmaRILA3
 ah7sigIInNvpcJbc=
X-Received: by 2002:a17:902:c94f:b0:189:9e91:762e with SMTP id
 i15-20020a170902c94f00b001899e91762emr134829492pla.57.1673838324272; 
 Sun, 15 Jan 2023 19:05:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtAyIZLUwMfSkYsJZIRySdTRs+6OpEyHCfOy8jjISfgrBvcIUsPcrPAMsV9uPSjmpOCO6N1ew==
X-Received: by 2002:a17:902:c94f:b0:189:9e91:762e with SMTP id
 i15-20020a170902c94f00b001899e91762emr134829449pla.57.1673838323974; 
 Sun, 15 Jan 2023 19:05:23 -0800 (PST)
Received: from [10.72.13.117] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a170902bd0500b0019248880f75sm18069941pls.77.2023.01.15.19.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 19:05:23 -0800 (PST)
Message-ID: <147cd500-abf3-8d2c-ae7a-02a9672ba61d@redhat.com>
Date: Mon, 16 Jan 2023 11:05:16 +0800
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
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWdioFYZPJT+xfHUxgsZzwVVGKfSbmieuKvhEodgK99c=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2023/1/13 15:28, Eugenio Perez Martin 写道:
> On Fri, Jan 13, 2023 at 4:53 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Fri, Jan 13, 2023 at 1:24 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>> Only create iova_tree if and when it is needed.
>>>
>>> The cleanup keeps being responsability of last VQ but this change allows
>>> to merge both cleanup functions.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>   net/vhost-vdpa.c | 101 +++++++++++++++++++++++++++++++++--------------
>>>   1 file changed, 71 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index de5ed8ff22..75cca497c8 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -178,13 +178,9 @@ err_init:
>>>   static void vhost_vdpa_cleanup(NetClientState *nc)
>>>   {
>>>       VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>> -    struct vhost_dev *dev = &s->vhost_net->dev;
>>>
>>>       qemu_vfree(s->cvq_cmd_out_buffer);
>>>       qemu_vfree(s->status);
>>> -    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>> -        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>> -    }
>>>       if (s->vhost_net) {
>>>           vhost_net_cleanup(s->vhost_net);
>>>           g_free(s->vhost_net);
>>> @@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
>>>       return size;
>>>   }
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
>> It looks to me the logic here is somehow the same as
>> vhost_vdpa_net_cvq_start(), can we unify the them?
>>
> It depends on what you mean by unify :). But we can explore it for sure.
>
> We can call vhost_vdpa_net_data_start, but the steps to do if
> s0->vhost_vdpa.iova_tree == NULL are different. Data queues must do
> nothing, but CVQ must create a new iova tree.
>
> So one possibility is to convert this part of vhost_vdpa_net_cvq_start:
>      s0 = vhost_vdpa_net_first_nc_vdpa(s);
>      if (s0->vhost_vdpa.iova_tree) {
>          /* SVQ is already configured for all virtqueues */
>          v->iova_tree = s0->vhost_vdpa.iova_tree;
>      } else {
>          v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>                                             v->iova_range.last);
>      }
>
> into:
>      vhost_vdpa_net_data_start(nc);
>      if (!v->iova_tree) {
>          v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>                                             v->iova_range.last);
>      }
>
> I'm ok with the change but it's less clear in my opinion: it's not
> obvious that net_data_start is in charge of setting v->iova_tree to
> me.


Ok.


>
> Another possibility is to abstract something like
> first_nc_iova_tree(), but we need to check more fields of s0 later
> (shadow_data) so I'm not sure about the benefit.
>
> Is that what you have in mind?


Kind of, but I think we can leave the code as is.

In the future, as discussed, we need to introduce something like a 
parent or opaque structure for NetClientState structure, it can simply a 
lot of things: we can have one same common parent for all queues, then 
there's no need for the trick like first_nc_iova_tree() and other 
similar tricks.

Thanks

>
> Thanks!
>
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
>>>   static NetClientInfo net_vhost_vdpa_info = {
>>>           .type = NET_CLIENT_DRIVER_VHOST_VDPA,
>>>           .size = sizeof(VhostVDPAState),
>>>           .receive = vhost_vdpa_receive,
>>> +        .start = vhost_vdpa_net_data_start,
>>> +        .stop = vhost_vdpa_net_client_stop,
>>>           .cleanup = vhost_vdpa_cleanup,
>>>           .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
>>>           .has_ufo = vhost_vdpa_has_ufo,
>>> @@ -351,7 +401,7 @@ dma_map_err:
>>>
>>>   static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>   {
>>> -    VhostVDPAState *s;
>>> +    VhostVDPAState *s, *s0;
>>>       struct vhost_vdpa *v;
>>>       uint64_t backend_features;
>>>       int64_t cvq_group;
>>> @@ -415,8 +465,6 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>           return r;
>>>       }
>>>
>>> -    v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>> -                                       v->iova_range.last);
>>>       v->shadow_vqs_enabled = true;
>>>       s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_ASID;
>>>
>>> @@ -425,6 +473,15 @@ out:
>>>           return 0;
>>>       }
>>>
>>> +    s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>> +    if (s0->vhost_vdpa.iova_tree) {
>>> +        /* SVQ is already configured for all virtqueues */
>>> +        v->iova_tree = s0->vhost_vdpa.iova_tree;
>>> +    } else {
>>> +        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>> +                                           v->iova_range.last);
>>> +    }
>>> +
>>>       r = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer,
>>>                                  vhost_vdpa_net_cvq_cmd_page_len(), false);
>>>       if (unlikely(r < 0)) {
>>> @@ -449,15 +506,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
>>>       if (s->vhost_vdpa.shadow_vqs_enabled) {
>>>           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
>>>           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
>>> -        if (!s->always_svq) {
>>> -            /*
>>> -             * If only the CVQ is shadowed we can delete this safely.
>>> -             * If all the VQs are shadows this will be needed by the time the
>>> -             * device is started again to register SVQ vrings and similar.
>>> -             */
>>> -            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>> -        }
>>>       }
>>> +
>>> +    vhost_vdpa_net_client_stop(nc);
>>>   }
>>>
>>>   static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
>>> @@ -667,8 +718,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>                                          int nvqs,
>>>                                          bool is_datapath,
>>>                                          bool svq,
>>> -                                       struct vhost_vdpa_iova_range iova_range,
>>> -                                       VhostIOVATree *iova_tree)
>>> +                                       struct vhost_vdpa_iova_range iova_range)
>>>   {
>>>       NetClientState *nc = NULL;
>>>       VhostVDPAState *s;
>>> @@ -690,7 +740,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>       s->vhost_vdpa.shadow_vqs_enabled = svq;
>>>       s->vhost_vdpa.iova_range = iova_range;
>>>       s->vhost_vdpa.shadow_data = svq;
>>> -    s->vhost_vdpa.iova_tree = iova_tree;
>>>       if (!is_datapath) {
>>>           s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
>>>                                               vhost_vdpa_net_cvq_cmd_page_len());
>>> @@ -760,7 +809,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>       uint64_t features;
>>>       int vdpa_device_fd;
>>>       g_autofree NetClientState **ncs = NULL;
>>> -    g_autoptr(VhostIOVATree) iova_tree = NULL;
>>>       struct vhost_vdpa_iova_range iova_range;
>>>       NetClientState *nc;
>>>       int queue_pairs, r, i = 0, has_cvq = 0;
>>> @@ -812,12 +860,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>           goto err;
>>>       }
>>>
>>> -    if (opts->x_svq) {
>>> -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
>>> -            goto err_svq;
>>> -        }
>>> -
>>> -        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
>>> +    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features, errp)) {
>>> +        goto err;
>>>       }
>>>
>>>       ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
>>> @@ -825,7 +869,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>       for (i = 0; i < queue_pairs; i++) {
>>>           ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>                                        vdpa_device_fd, i, 2, true, opts->x_svq,
>>> -                                     iova_range, iova_tree);
>>> +                                     iova_range);
>>>           if (!ncs[i])
>>>               goto err;
>>>       }
>>> @@ -833,13 +877,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>       if (has_cvq) {
>>>           nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>                                    vdpa_device_fd, i, 1, false,
>>> -                                 opts->x_svq, iova_range, iova_tree);
>>> +                                 opts->x_svq, iova_range);
>>>           if (!nc)
>>>               goto err;
>>>       }
>>>
>>> -    /* iova_tree ownership belongs to last NetClientState */
>>> -    g_steal_pointer(&iova_tree);
>>>       return 0;
>>>
>>>   err:
>>> @@ -849,7 +891,6 @@ err:
>>>           }
>>>       }
>>>
>>> -err_svq:
>>>       qemu_close(vdpa_device_fd);
>>>
>>>       return -1;
>>> --
>>> 2.31.1
>>>


