Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C84628EB4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:52:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouik7-0004vO-3M; Mon, 14 Nov 2022 18:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ouiew-0004Ov-DZ
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oucMu-00016N-CH
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 11:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668443491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojH/psRRzArBJAwxVzugaljJuwFZRup6Gb5bmk7DgwQ=;
 b=RdWhIqIFffJdOUxVMoDElfJufq7iksERoxkdCg4EDDl4v+LzKX913lShgf+4T81CRV5n45
 JUoS427/3gHOFBUVGRoGFNAkNv5V3M9mzcmI526M+e7dmKCBbRAdY4/P//9LO1v8LyLwBx
 a7tJvj1B2yWG5RbMnIylxhbSHr3tvuo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-ElB0GnosMQ-idvHjAjEq_Q-1; Mon, 14 Nov 2022 11:31:29 -0500
X-MC-Unique: ElB0GnosMQ-idvHjAjEq_Q-1
Received: by mail-pl1-f200.google.com with SMTP id
 n12-20020a170902e54c00b00188515e81a6so9405261plf.23
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 08:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ojH/psRRzArBJAwxVzugaljJuwFZRup6Gb5bmk7DgwQ=;
 b=RgF9OqnnFusieTh9rxoU4ggi57+5thWZ58VQ8BXuOIaVDiNv270JiFAXdEeITe8XGQ
 t9x29Faw7xBkrnqn6Ky7MzFSalaQCND5NQQrNDxt4psFDL4VPzNEovaH/CD3M/kJwvMi
 fX8ng9yxD4m5jxUaxWoit1GjyIrRKu60OVlyin5/IecKhfmdlNW3smAD86LwBCaxFurK
 0qFUMW41CxGWEbUJCfJaymh/QMfc6z9GZfSCDFDlXWCTkmZVsTF8zuUMFuPtfZtedb50
 LQ2/f0rJH+gzTM176G6r/CS0dzTDZ/lqCjq9I801oepkFsPfVpYKCvJMUezv9wqSyRzh
 JE0Q==
X-Gm-Message-State: ANoB5pmUTPnWrcmC8Na3cbWmgxBhZu+2csOWxaiTPSxDGPMqixOEvpU8
 Z4/zNFeSJ23ZEyrMp8Gfn/95cT5TFvkISCx6j1sHHRbvwcfbcqxyMc6QcbXlFrwMZz1vN57PtkZ
 i0aEY/lBDTDMCb9myuJuPrLw73xGl5Jc=
X-Received: by 2002:a17:902:ccca:b0:188:aa84:14 with SMTP id
 z10-20020a170902ccca00b00188aa840014mr150371ple.17.1668443488064; 
 Mon, 14 Nov 2022 08:31:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4R9JZBu4RFHn7Ru1bTBL82/OuXiBi35elHsJcx/x4J3VxQPRa+NoAcmIQWZ/Qqx1MYow2GBAROuzHp4Pb+Rpc=
X-Received: by 2002:a17:902:ccca:b0:188:aa84:14 with SMTP id
 z10-20020a170902ccca00b00188aa840014mr150351ple.17.1668443487712; Mon, 14 Nov
 2022 08:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-10-eperezma@redhat.com>
 <CACGkMEsr=fpbbOpUBHawt5DR+nTWcK1uMzXgorEcbijso1wsMQ@mail.gmail.com>
 <CAJaqyWemKoRNd6_uvFc79qYe+7pbavJSjnZuczxk5uxSZZdZ2Q@mail.gmail.com>
 <be553273-7c06-78f7-4d23-de9f46a210b1@redhat.com>
 <CAJaqyWeZWQgGm7XZ-+DBHNS4XW_-GgWeeOqTb82v__jS8ONRyQ@mail.gmail.com>
 <6a35e659-698e-ff71-fe9b-06e15809c9e4@redhat.com>
In-Reply-To: <6a35e659-698e-ff71-fe9b-06e15809c9e4@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 14 Nov 2022 17:30:51 +0100
Message-ID: <CAJaqyWeF7bNuu-e6g4RghBkc-5oqEAuaEVbJ9uDgGPWWsP36Lg@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] vdpa: Add listener_shadow_vq to vhost_vdpa
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
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

On Mon, Nov 14, 2022 at 5:30 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/11/11 21:12, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Fri, Nov 11, 2022 at 8:49 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2022/11/10 21:47, Eugenio Perez Martin =E5=86=99=E9=81=93:
> >>> On Thu, Nov 10, 2022 at 7:01 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> >>>> On Wed, Nov 9, 2022 at 1:08 AM Eugenio P=C3=A9rez <eperezma@redhat.c=
om> wrote:
> >>>>> The memory listener that thells the device how to convert GPA to qe=
mu's
> >>>>> va is registered against CVQ vhost_vdpa. This series try to map the
> >>>>> memory listener translations to ASID 0, while it maps the CVQ ones =
to
> >>>>> ASID 1.
> >>>>>
> >>>>> Let's tell the listener if it needs to register them on iova tree o=
r
> >>>>> not.
> >>>>>
> >>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>> ---
> >>>>> v5: Solve conflict about vhost_iova_tree_remove accepting mem_regio=
n by
> >>>>>       value.
> >>>>> ---
> >>>>>    include/hw/virtio/vhost-vdpa.h | 2 ++
> >>>>>    hw/virtio/vhost-vdpa.c         | 6 +++---
> >>>>>    net/vhost-vdpa.c               | 1 +
> >>>>>    3 files changed, 6 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vho=
st-vdpa.h
> >>>>> index 6560bb9d78..0c3ed2d69b 100644
> >>>>> --- a/include/hw/virtio/vhost-vdpa.h
> >>>>> +++ b/include/hw/virtio/vhost-vdpa.h
> >>>>> @@ -34,6 +34,8 @@ typedef struct vhost_vdpa {
> >>>>>        struct vhost_vdpa_iova_range iova_range;
> >>>>>        uint64_t acked_features;
> >>>>>        bool shadow_vqs_enabled;
> >>>>> +    /* The listener must send iova tree addresses, not GPA */
> >>
> >> Btw, cindy's vIOMMU series will make it not necessarily GPA any more.
> >>
> > Yes, this comment should be tuned then. But the SVQ iova_tree will not
> > be equal to vIOMMU one because shadow vrings.
> >
> > But maybe SVQ can inspect both instead of having all the duplicated ent=
ries.
> >
> >>>>> +    bool listener_shadow_vq;
> >>>>>        /* IOVA mapping used by the Shadow Virtqueue */
> >>>>>        VhostIOVATree *iova_tree;
> >>>>>        GPtrArray *shadow_vqs;
> >>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>>>> index 8fd32ba32b..e3914fa40e 100644
> >>>>> --- a/hw/virtio/vhost-vdpa.c
> >>>>> +++ b/hw/virtio/vhost-vdpa.c
> >>>>> @@ -220,7 +220,7 @@ static void vhost_vdpa_listener_region_add(Memo=
ryListener *listener,
> >>>>>                                             vaddr, section->readonl=
y);
> >>>>>
> >>>>>        llsize =3D int128_sub(llend, int128_make64(iova));
> >>>>> -    if (v->shadow_vqs_enabled) {
> >>>>> +    if (v->listener_shadow_vq) {
> >>>>>            int r;
> >>>>>
> >>>>>            mem_region.translated_addr =3D (hwaddr)(uintptr_t)vaddr,
> >>>>> @@ -247,7 +247,7 @@ static void vhost_vdpa_listener_region_add(Memo=
ryListener *listener,
> >>>>>        return;
> >>>>>
> >>>>>    fail_map:
> >>>>> -    if (v->shadow_vqs_enabled) {
> >>>>> +    if (v->listener_shadow_vq) {
> >>>>>            vhost_iova_tree_remove(v->iova_tree, mem_region);
> >>>>>        }
> >>>>>
> >>>>> @@ -292,7 +292,7 @@ static void vhost_vdpa_listener_region_del(Memo=
ryListener *listener,
> >>>>>
> >>>>>        llsize =3D int128_sub(llend, int128_make64(iova));
> >>>>>
> >>>>> -    if (v->shadow_vqs_enabled) {
> >>>>> +    if (v->listener_shadow_vq) {
> >>>>>            const DMAMap *result;
> >>>>>            const void *vaddr =3D memory_region_get_ram_ptr(section-=
>mr) +
> >>>>>                section->offset_within_region +
> >>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>>>> index 85a318faca..02780ee37b 100644
> >>>>> --- a/net/vhost-vdpa.c
> >>>>> +++ b/net/vhost-vdpa.c
> >>>>> @@ -570,6 +570,7 @@ static NetClientState *net_vhost_vdpa_init(NetC=
lientState *peer,
> >>>>>        s->vhost_vdpa.index =3D queue_pair_index;
> >>>>>        s->always_svq =3D svq;
> >>>>>        s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >>>>> +    s->vhost_vdpa.listener_shadow_vq =3D svq;
> >>>> Any chance those above two can differ?
> >>>>
> >>> If CVQ is shadowed but data VQs are not, shadow_vqs_enabled is true
> >>> but listener_shadow_vq is not.
> >>>
> >>> It is more clear in the next commit, where only shadow_vqs_enabled is
> >>> set to true at vhost_vdpa_net_cvq_start.
> >>
> >> Ok, the name looks a little bit confusing. I wonder if it's better to
> >> use shadow_cvq and shadow_data ?
> >>
> > I'm ok with renaming it, but struct vhost_vdpa is generic across all
> > kind of devices, and it does not know if it is a datapath or not for
> > the moment.
> >
> > Maybe listener_uses_iova_tree?
>
>
> I think "iova_tree" is something that is internal to svq implementation,
> it's better to define the name from the view of vhost_vdpa level.
>

I don't get this, vhost_vdpa struct already has a pointer to its iova_tree.

Thanks!


