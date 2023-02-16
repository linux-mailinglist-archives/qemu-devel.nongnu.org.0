Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF49698DE0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:36:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSYoP-0001jl-UK; Thu, 16 Feb 2023 02:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSYoE-0001aW-M9
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:36:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSYoC-0000Pf-13
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676532959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QXZ4dobvgNP18DqzAWn9p3EdfW3IdKTaC1/dG9BnCDU=;
 b=MybVBWq5RkQTOqpERI+BM2weWr/B+bosX+8QrsucS0vKEcJf9ulullSCzBRf1hoIXBmicg
 jbNVYEvjBlajffmUbUrK8QRcUuLDz6+FlXWR73pmbY2bjUhgFUSPf18F8YqW2TVyIATca4
 s/Sk7jEp2O7X/al0kPW8ubtomME4854=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-PYIgOgKPM6qt-wOMtTD4SQ-1; Thu, 16 Feb 2023 02:35:58 -0500
X-MC-Unique: PYIgOgKPM6qt-wOMtTD4SQ-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-52ec7c792b1so11688877b3.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QXZ4dobvgNP18DqzAWn9p3EdfW3IdKTaC1/dG9BnCDU=;
 b=Mw9MQGsxP70H6x10X5iF3JqiD2sDg9NIJxnnjBCBTVGKI+l9ZW+U29Q6VM86aDjk1F
 +OHkd8MQIvFaYSTqAgeeqIS0uNXi0QITaYjJDIDq2IfqTELHF1xg3EZSqvlq/37RDs3g
 XMtgdw94K2bq8Yy3aXAojbzsXWWmQjz4uHh6DeW4OEulnn7WwZlrRJbffmaZ++tftG3c
 6RyqQoVsxn7X+Bhr7vlrBZGIWH+7Q0wFlepj3i8uxG5m9q7fDgksKIJeHc0AuSC96DdM
 uCMw1u/Rh+A1cgtr0dhk9JnNXxov1J10heH07Sbb8yXt6h0GyP11MsIN3Pl2n+vxBrZQ
 n4Dw==
X-Gm-Message-State: AO0yUKX6abSa1ZRQoIo5D6KcIApxhh2Enjw0OTfRD+MxvU6qpaMBc4NH
 5dwUW6d0xodJl+/Hnn6EOL3Du93SSmnaKwn5jrSR+u1j3LGxAX0IAp0Nqz8S5p9Ptladr0WoQi4
 hyiX0/M8tBBg1gzIL/pCqZzgLFyCekeM=
X-Received: by 2002:a0d:d302:0:b0:52f:1d6f:c9e7 with SMTP id
 v2-20020a0dd302000000b0052f1d6fc9e7mr668968ywd.15.1676532957497; 
 Wed, 15 Feb 2023 23:35:57 -0800 (PST)
X-Google-Smtp-Source: AK7set9WT9UmdzeO4liyPN1lJ4EHayPr4Ah6kla+6dXHwX3KysX+I8iT8J2X3wcnHFcmoeM+F6fGBofJC07LEaBcJfY=
X-Received: by 2002:a0d:d302:0:b0:52f:1d6f:c9e7 with SMTP id
 v2-20020a0dd302000000b0052f1d6fc9e7mr668951ywd.15.1676532957147; Wed, 15 Feb
 2023 23:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-2-eperezma@redhat.com>
 <a71b4dfc-67ea-ef8b-023b-8e18638bd8b2@oracle.com>
 <CAJaqyWfVOmVs5j_O=TMRSO3ZkDWuX-ZRJMY_nTYicAev8+QMHA@mail.gmail.com>
 <bdd4531e-1616-8513-bb33-80fabb7b2074@oracle.com>
 <CAJaqyWfTPHseAg9fdku00xtvC7kkJyAKMiN5wqoRVioN3zWDFw@mail.gmail.com>
 <5e54b6ed-ae07-d6bf-e143-084c82f1f428@oracle.com>
In-Reply-To: <5e54b6ed-ae07-d6bf-e143-084c82f1f428@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 16 Feb 2023 08:35:21 +0100
Message-ID: <CAJaqyWe8+L208dn1D=vmA2J+MZpdLETKefmwzg340FNu2RiEcg@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] vdpa net: move iova tree creation from init to
 start
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Shannon Nelson <snelson@pensando.io>, 
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Feb 16, 2023 at 3:15 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 2/14/2023 11:07 AM, Eugenio Perez Martin wrote:
> > On Tue, Feb 14, 2023 at 2:45 AM Si-Wei Liu <si-wei.liu@oracle.com> wrot=
e:
> >>
> >>
> >> On 2/13/2023 3:14 AM, Eugenio Perez Martin wrote:
> >>> On Mon, Feb 13, 2023 at 7:51 AM Si-Wei Liu <si-wei.liu@oracle.com> wr=
ote:
> >>>>
> >>>> On 2/8/2023 1:42 AM, Eugenio P=C3=A9rez wrote:
> >>>>> Only create iova_tree if and when it is needed.
> >>>>>
> >>>>> The cleanup keeps being responsible of last VQ but this change allo=
ws it
> >>>>> to merge both cleanup functions.
> >>>>>
> >>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>> Acked-by: Jason Wang <jasowang@redhat.com>
> >>>>> ---
> >>>>>     net/vhost-vdpa.c | 99 ++++++++++++++++++++++++++++++++++-------=
-------
> >>>>>     1 file changed, 71 insertions(+), 28 deletions(-)
> >>>>>
> >>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>>>> index de5ed8ff22..a9e6c8f28e 100644
> >>>>> --- a/net/vhost-vdpa.c
> >>>>> +++ b/net/vhost-vdpa.c
> >>>>> @@ -178,13 +178,9 @@ err_init:
> >>>>>     static void vhost_vdpa_cleanup(NetClientState *nc)
> >>>>>     {
> >>>>>         VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>>>> -    struct vhost_dev *dev =3D &s->vhost_net->dev;
> >>>>>
> >>>>>         qemu_vfree(s->cvq_cmd_out_buffer);
> >>>>>         qemu_vfree(s->status);
> >>>>> -    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> >>>>> -        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_=
delete);
> >>>>> -    }
> >>>>>         if (s->vhost_net) {
> >>>>>             vhost_net_cleanup(s->vhost_net);
> >>>>>             g_free(s->vhost_net);
> >>>>> @@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientSt=
ate *nc, const uint8_t *buf,
> >>>>>         return size;
> >>>>>     }
> >>>>>
> >>>>> +/** From any vdpa net client, get the netclient of first queue pai=
r */
> >>>>> +static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState=
 *s)
> >>>>> +{
> >>>>> +    NICState *nic =3D qemu_get_nic(s->nc.peer);
> >>>>> +    NetClientState *nc0 =3D qemu_get_peer(nic->ncs, 0);
> >>>>> +
> >>>>> +    return DO_UPCAST(VhostVDPAState, nc, nc0);
> >>>>> +}
> >>>>> +
> >>>>> +static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
> >>>>> +{
> >>>>> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> >>>>> +
> >>>>> +    if (v->shadow_vqs_enabled) {
> >>>>> +        v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> >>>>> +                                           v->iova_range.last);
> >>>>> +    }
> >>>>> +}
> >>>>> +
> >>>>> +static int vhost_vdpa_net_data_start(NetClientState *nc)
> >>>>> +{
> >>>>> +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>>>> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> >>>>> +
> >>>>> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >>>>> +
> >>>>> +    if (v->index =3D=3D 0) {
> >>>>> +        vhost_vdpa_net_data_start_first(s);
> >>>>> +        return 0;
> >>>>> +    }
> >>>>> +
> >>>>> +    if (v->shadow_vqs_enabled) {
> >>>>> +        VhostVDPAState *s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> >>>>> +        v->iova_tree =3D s0->vhost_vdpa.iova_tree;
> >>>>> +    }
> >>>>> +
> >>>>> +    return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static void vhost_vdpa_net_client_stop(NetClientState *nc)
> >>>>> +{
> >>>>> +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>>>> +    struct vhost_dev *dev;
> >>>>> +
> >>>>> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >>>>> +
> >>>>> +    dev =3D s->vhost_vdpa.dev;
> >>>>> +    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> >>>>> +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_=
delete);
> >>>>> +    }
> >>>>> +}
> >>>>> +
> >>>>>     static NetClientInfo net_vhost_vdpa_info =3D {
> >>>>>             .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> >>>>>             .size =3D sizeof(VhostVDPAState),
> >>>>>             .receive =3D vhost_vdpa_receive,
> >>>>> +        .start =3D vhost_vdpa_net_data_start,
> >>>>> +        .stop =3D vhost_vdpa_net_client_stop,
> >>>>>             .cleanup =3D vhost_vdpa_cleanup,
> >>>>>             .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> >>>>>             .has_ufo =3D vhost_vdpa_has_ufo,
> >>>>> @@ -351,7 +401,7 @@ dma_map_err:
> >>>>>
> >>>>>     static int vhost_vdpa_net_cvq_start(NetClientState *nc)
> >>>>>     {
> >>>>> -    VhostVDPAState *s;
> >>>>> +    VhostVDPAState *s, *s0;
> >>>>>         struct vhost_vdpa *v;
> >>>>>         uint64_t backend_features;
> >>>>>         int64_t cvq_group;
> >>>>> @@ -425,6 +475,15 @@ out:
> >>>>>             return 0;
> >>>>>         }
> >>>>>
> >>>>> +    s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> >>>>> +    if (s0->vhost_vdpa.iova_tree) {
> >>>>> +        /* SVQ is already configured for all virtqueues */
> >>>>> +        v->iova_tree =3D s0->vhost_vdpa.iova_tree;
> >>>>> +    } else {
> >>>>> +        v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> >>>>> +                                           v->iova_range.last);
> >>>> I wonder how this case could happen, vhost_vdpa_net_data_start_first=
()
> >>>> should've allocated an iova tree on the first data vq. Is zero data =
vq
> >>>> ever possible on net vhost-vdpa?
> >>>>
> >>> It's the case of the current qemu master when only CVQ is being
> >>> shadowed. It's not that "there are no data vq": If that case were
> >>> possible, CVQ vhost-vdpa state would be s0.
> >>>
> >>> The case is that since only CVQ vhost-vdpa is the one being migrated,
> >>> only CVQ has an iova tree.
> >> OK, so this corresponds to the case where live migration is not starte=
d
> >> and CVQ starts in its own address space of VHOST_VDPA_NET_CVQ_ASID.
> >> Thanks for explaining it!
> >>
> >>> With this series applied and with no migration running, the case is
> >>> the same as before: only SVQ gets shadowed. When migration starts, al=
l
> >>> vqs are migrated, and share iova tree.
> >> I wonder what is the reason to share the iova tree when migration
> >> starts, I think CVQ may stay on its own VHOST_VDPA_NET_CVQ_ASID still?
> >>
> >> Actually there's discrepancy in vhost_vdpa_net_log_global_enable(), I
> >> don't see explicit code to switch from VHOST_VDPA_NET_CVQ_ASID to
> >> VHOST_VDPA_GUEST_PA_ASID for the CVQ. This is the address space I
> >> collision I mentioned earlier:
> >>
> > There is no such change. This code only migrates devices with no CVQ,
> > as they have their own difficulties.
> >
> > In the previous RFC there was no such change either. Since it's hard
> > to modify passthrough devices IOVA tree, CVQ AS updates keep being
> > VHOST_VDPA_NET_CVQ_ASID.
> That's my understanding too, the current code doesn't support changing
> AS once it is set, although uAPI doesn't prohibit it.
>
> > They both share the same IOVA tree though, just for simplicity.
> It would be good to document this assumption somewhere in the code, it's
> not easy to infer userspace doesn't have the same view as that in the
> kernel in terms of the iova tree being used.
>
> >   If
> > address space exhaustion is a problem we can make them independent,
> > but this complicates the code a little bit.
> >
> >> 9585@1676093788.259201:vhost_vdpa_dma_map vdpa:0x7ff13088a190 fd: 16
> >> msg_type: 2 asid: 0 iova: 0x1000 size: 0x2000 uaddr: 0x55a5a7ff3000
> >> perm: 0x1 type: 2
> >> 9585@1676093788.279923:vhost_vdpa_dma_map vdpa:0x7ff13088a190 fd: 16
> >> msg_type: 2 asid: 0 iova: 0x3000 size: 0x1000 uaddr: 0x55a5a7ff6000
> >> perm: 0x3 type: 2
> >> 9585@1676093788.290529:vhost_vdpa_set_vring_addr dev: 0x55a5a77cec20
> >> index: 0 flags: 0x0 desc_user_addr: 0x1000 used_user_addr: 0x3000
> >> avail_user_addr: 0x2000 log_guest_addr: 0x0
> >> :
> >> :
> >> 9585@1676093788.543567:vhost_vdpa_dma_map vdpa:0x7ff1302b6190 fd: 16
> >> msg_type: 2 asid: 0 iova: 0x16000 size: 0x2000 uaddr: 0x55a5a7959000
> >> perm: 0x1 type: 2
> >> 9585@1676093788.576923:vhost_vdpa_dma_map vdpa:0x7ff1302b6190 fd: 16
> >> msg_type: 2 asid: 0 iova: 0x18000 size: 0x1000 uaddr: 0x55a5a795c000
> >> perm: 0x3 type: 2
> >> 9585@1676093788.593881:vhost_vdpa_set_vring_addr dev: 0x55a5a7580930
> >> index: 7 flags: 0x0 desc_user_addr: 0x16000 used_user_addr: 0x18000
> >> avail_user_addr: 0x17000 log_guest_addr: 0x0
> >> 9585@1676093788.593904:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
> >> msg_type: 2 asid: 1 iova: 0x19000 size: 0x1000 uaddr: 0x55a5a77f8000
> >> perm: 0x1 type: 2
> >> 9585@1676093788.606448:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
> >> msg_type: 2 asid: 1 iova: 0x1a000 size: 0x1000 uaddr: 0x55a5a77fa000
> >> perm: 0x3 type: 2
> >> 9585@1676093788.616253:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
> >> msg_type: 2 asid: 1 iova: 0x1b000 size: 0x1000 uaddr: 0x55a5a795f000
> >> perm: 0x1 type: 2
> >> 9585@1676093788.625956:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
> >> msg_type: 2 asid: 1 iova: 0x1c000 size: 0x1000 uaddr: 0x55a5a7f4e000
> >> perm: 0x3 type: 2
> >> 9585@1676093788.635655:vhost_vdpa_set_vring_addr dev: 0x55a5a7580ec0
> >> index: 8 flags: 0x0 desc_user_addr: 0x1b000 used_user_addr: 0x1c000
> >> avail_user_addr: 0x1b400 log_guest_addr: 0x0
> >> 9585@1676093788.635667:vhost_vdpa_listener_region_add vdpa:
> >> 0x7ff13026d190 iova 0x0 llend 0xa0000 vaddr: 0x7fef1fe00000 read-only:=
 0
> >> 9585@1676093788.635670:vhost_vdpa_listener_begin_batch
> >> vdpa:0x7ff13026d190 fd: 16 msg_type: 2 type: 5
> >> 9585@1676093788.635677:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
> >> msg_type: 2 asid: 0 iova: 0x0 size: 0xa0000 uaddr: 0x7fef1fe00000 perm=
:
> >> 0x3 type: 2
> >> 2023-02-11T05:36:28.635686Z qemu-system-x86_64: failed to write, fd=3D=
16,
> >> errno=3D14 (Bad address)
> >> 2023-02-11T05:36:28.635721Z qemu-system-x86_64: vhost vdpa map fail!
> >> 2023-02-11T05:36:28.635744Z qemu-system-x86_64: vhost-vdpa: DMA mappin=
g
> >> failed, unable to continue
> >>
> > I'm not sure how you get to this. Maybe you were able to start the
> > migration because the CVQ migration blocker was not effectively added?
> It's something else, below line at the start of
> vhost_vdpa_net_cvq_start() would override the shadow_data on the CVQ.
>
>      v->shadow_data =3D s->always_svq;
>
> Which leads to my previous question why shadow_data needs to apply to
> the CVQ
>

Ok, I'm proposing some documentation here. I'll send a new patch
adding it to the sources if you think it is complete.

Shadow_data needs to apply to CVQ because memory_listener is
registered against CVQ, and memory listener needs to know if data vqs
are passthrough or shadowed. We could apply a memory register to a
different vhost_vdpa but then its lifecycle gets complicated.
---

For completion, the original discussion was [1].

> and why the userspace iova is shared between data queues and CVQ.

It's not shared unless the device does not support ASID. They only
share the iova tree because iova tree itself is not used for tracking
memory itself but only translations, so its lifecycle is easier. Each
piece of memory's lifecycle is tracked differently:
* Guest's memory is tracked by the memory listener itself, so we got
all the regions at register / unregister and in its own updates.
* SVQ vrings are tracked in vhost_vdpa->shadow_vqs[i].
* CVQ shadow buffers are tracked in net VhostVDPAState.
---

I'll send a new series adding the two pieces of doc if you think they
are complete. Please let me know if you'd add or remove something.

Note that this code is already on qemu master so this doc should not
block this series, correct?

Thanks!

[1] https://mail.gnu.org/archive/html/qemu-devel/2022-11/msg02033.html

> -Siwei
>
>
> >
> > Thanks!
> >
> >
> >> Regards,
> >> -Siwei
> >>> Thanks!
> >>>
> >>>> Thanks,
> >>>> -Siwei
> >>>>> +    }
> >>>>> +
> >>>>>         r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out=
_buffer,
> >>>>>                                    vhost_vdpa_net_cvq_cmd_page_len(=
), false);
> >>>>>         if (unlikely(r < 0)) {
> >>>>> @@ -449,15 +508,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientS=
tate *nc)
> >>>>>         if (s->vhost_vdpa.shadow_vqs_enabled) {
> >>>>>             vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out=
_buffer);
> >>>>>             vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
> >>>>> -        if (!s->always_svq) {
> >>>>> -            /*
> >>>>> -             * If only the CVQ is shadowed we can delete this safe=
ly.
> >>>>> -             * If all the VQs are shadows this will be needed by t=
he time the
> >>>>> -             * device is started again to register SVQ vrings and =
similar.
> >>>>> -             */
> >>>>> -            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_t=
ree_delete);
> >>>>> -        }
> >>>>>         }
> >>>>> +
> >>>>> +    vhost_vdpa_net_client_stop(nc);
> >>>>>     }
> >>>>>
> >>>>>     static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t=
 out_len,
> >>>>> @@ -667,8 +720,7 @@ static NetClientState *net_vhost_vdpa_init(NetC=
lientState *peer,
> >>>>>                                            int nvqs,
> >>>>>                                            bool is_datapath,
> >>>>>                                            bool svq,
> >>>>> -                                       struct vhost_vdpa_iova_rang=
e iova_range,
> >>>>> -                                       VhostIOVATree *iova_tree)
> >>>>> +                                       struct vhost_vdpa_iova_rang=
e iova_range)
> >>>>>     {
> >>>>>         NetClientState *nc =3D NULL;
> >>>>>         VhostVDPAState *s;
> >>>>> @@ -690,7 +742,6 @@ static NetClientState *net_vhost_vdpa_init(NetC=
lientState *peer,
> >>>>>         s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >>>>>         s->vhost_vdpa.iova_range =3D iova_range;
> >>>>>         s->vhost_vdpa.shadow_data =3D svq;
> >>>>> -    s->vhost_vdpa.iova_tree =3D iova_tree;
> >>>>>         if (!is_datapath) {
> >>>>>             s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_=
page_size(),
> >>>>>                                                 vhost_vdpa_net_cvq_=
cmd_page_len());
> >>>>> @@ -760,7 +811,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, c=
onst char *name,
> >>>>>         uint64_t features;
> >>>>>         int vdpa_device_fd;
> >>>>>         g_autofree NetClientState **ncs =3D NULL;
> >>>>> -    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> >>>>>         struct vhost_vdpa_iova_range iova_range;
> >>>>>         NetClientState *nc;
> >>>>>         int queue_pairs, r, i =3D 0, has_cvq =3D 0;
> >>>>> @@ -812,12 +862,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, =
const char *name,
> >>>>>             goto err;
> >>>>>         }
> >>>>>
> >>>>> -    if (opts->x_svq) {
> >>>>> -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
> >>>>> -            goto err_svq;
> >>>>> -        }
> >>>>> -
> >>>>> -        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_r=
ange.last);
> >>>>> +    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features=
, errp)) {
> >>>>> +        goto err;
> >>>>>         }
> >>>>>
> >>>>>         ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> >>>>> @@ -825,7 +871,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, c=
onst char *name,
> >>>>>         for (i =3D 0; i < queue_pairs; i++) {
> >>>>>             ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, n=
ame,
> >>>>>                                          vdpa_device_fd, i, 2, true=
, opts->x_svq,
> >>>>> -                                     iova_range, iova_tree);
> >>>>> +                                     iova_range);
> >>>>>             if (!ncs[i])
> >>>>>                 goto err;
> >>>>>         }
> >>>>> @@ -833,13 +879,11 @@ int net_init_vhost_vdpa(const Netdev *netdev,=
 const char *name,
> >>>>>         if (has_cvq) {
> >>>>>             nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >>>>>                                      vdpa_device_fd, i, 1, false,
> >>>>> -                                 opts->x_svq, iova_range, iova_tre=
e);
> >>>>> +                                 opts->x_svq, iova_range);
> >>>>>             if (!nc)
> >>>>>                 goto err;
> >>>>>         }
> >>>>>
> >>>>> -    /* iova_tree ownership belongs to last NetClientState */
> >>>>> -    g_steal_pointer(&iova_tree);
> >>>>>         return 0;
> >>>>>
> >>>>>     err:
> >>>>> @@ -849,7 +893,6 @@ err:
> >>>>>             }
> >>>>>         }
> >>>>>
> >>>>> -err_svq:
> >>>>>         qemu_close(vdpa_device_fd);
> >>>>>
> >>>>>         return -1;
>


