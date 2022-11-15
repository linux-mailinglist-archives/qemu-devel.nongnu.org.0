Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7F0629075
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 04:06:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oumFu-0002Vo-Aw; Mon, 14 Nov 2022 22:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oumFr-0002VA-Ks
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 22:04:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oumFn-0001B9-Pa
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 22:04:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668481488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TPEi0usGMVReui2aXbySt3V7GWIisbVdd+LlCaPrijg=;
 b=gpeerZ6e61QN9sipUuWD3gAA9pwcYuI0IhE+fzS1HKFIPusc09hRS40/9wpQ2NXiwNznnF
 AkrI4E8k40HrIHW/RYBqaxg3MrqEhC2UAV3QYKz9Mbv9eFmT3yxB0vkRE4SXr5FahVsDCv
 /TaS2hS4EEhvmzNMjzMUhEaj/ALTeO0=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-HwAY3nOSPfW11vtaKn-Zjw-1; Mon, 14 Nov 2022 22:04:46 -0500
X-MC-Unique: HwAY3nOSPfW11vtaKn-Zjw-1
Received: by mail-oo1-f69.google.com with SMTP id
 d23-20020a4a3c17000000b0049f46b4313aso3190032ooa.17
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 19:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TPEi0usGMVReui2aXbySt3V7GWIisbVdd+LlCaPrijg=;
 b=h1/W+SZXwSQsx8aeBDcYDF4TBHDyobGdZVokC9qDjswQjZAqamXmrq0teeiQSZrttO
 kXP+b4omz4jjLRHAzsMKezL89SWfLCCODUOycM1nHweqMgumznfhpsk9OdVtNK3Q+ClQ
 67FQCm04CXzsdl35B9W33SBwl5SUx+hWOC2j6Wu1RPP1NiZYh3yx3iwDOsjffUlQ9Beg
 tguXmMzfbzgn0paJHSiIqFPs1xLAtC62Dpr2pvLQp30eGn03UUWspXjJj7QL6n4xwwyd
 Bx+Ll6lvJpgK4havmB/Bztt4lalBxRo4HxJyTmMqbiS2gAWv4Ad3dyw1i1H9TAiQk2hr
 Z+/Q==
X-Gm-Message-State: ANoB5pm9iqC40NKXRJypl/5OMB+B6CeRSNUOFzVeMz/0hZlerTRn75kC
 Es3NY0XRcD+GR1vqXUk2p/SSunqL7pNd7LATVpx3WLTy2TIRmFN8ENomBTXaG7/r4HCuKA2GzXz
 v9ulMqGE7wHOX5g8MVqoqX7YyC8B11Ug=
X-Received: by 2002:a05:6870:638b:b0:132:7b3:29ac with SMTP id
 t11-20020a056870638b00b0013207b329acmr65578oap.35.1668481485593; 
 Mon, 14 Nov 2022 19:04:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5VfCdjrBEXCPrNojCexj/pFRt/7FxQnvBgNNhH0zyiley/G6sv5N4FKrqrRnhS+Q80zSRvz7zL/w44nQ1f0ps=
X-Received: by 2002:a05:6870:638b:b0:132:7b3:29ac with SMTP id
 t11-20020a056870638b00b0013207b329acmr65553oap.35.1668481485346; Mon, 14 Nov
 2022 19:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-10-eperezma@redhat.com>
 <CACGkMEsr=fpbbOpUBHawt5DR+nTWcK1uMzXgorEcbijso1wsMQ@mail.gmail.com>
 <CAJaqyWemKoRNd6_uvFc79qYe+7pbavJSjnZuczxk5uxSZZdZ2Q@mail.gmail.com>
 <be553273-7c06-78f7-4d23-de9f46a210b1@redhat.com>
 <CAJaqyWeZWQgGm7XZ-+DBHNS4XW_-GgWeeOqTb82v__jS8ONRyQ@mail.gmail.com>
 <6a35e659-698e-ff71-fe9b-06e15809c9e4@redhat.com>
 <CAJaqyWeF7bNuu-e6g4RghBkc-5oqEAuaEVbJ9uDgGPWWsP36Lg@mail.gmail.com>
In-Reply-To: <CAJaqyWeF7bNuu-e6g4RghBkc-5oqEAuaEVbJ9uDgGPWWsP36Lg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 15 Nov 2022 11:04:34 +0800
Message-ID: <CACGkMEvvjC21XjMEwcv6QP=WKTH2Vh-3dfZkR6vVFi67SWYYvw@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] vdpa: Add listener_shadow_vq to vhost_vdpa
To: Eugenio Perez Martin <eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Nov 15, 2022 at 12:31 AM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Mon, Nov 14, 2022 at 5:30 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/11/11 21:12, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > > On Fri, Nov 11, 2022 at 8:49 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > >>
> > >> =E5=9C=A8 2022/11/10 21:47, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > >>> On Thu, Nov 10, 2022 at 7:01 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > >>>> On Wed, Nov 9, 2022 at 1:08 AM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
> > >>>>> The memory listener that thells the device how to convert GPA to =
qemu's
> > >>>>> va is registered against CVQ vhost_vdpa. This series try to map t=
he
> > >>>>> memory listener translations to ASID 0, while it maps the CVQ one=
s to
> > >>>>> ASID 1.
> > >>>>>
> > >>>>> Let's tell the listener if it needs to register them on iova tree=
 or
> > >>>>> not.
> > >>>>>
> > >>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >>>>> ---
> > >>>>> v5: Solve conflict about vhost_iova_tree_remove accepting mem_reg=
ion by
> > >>>>>       value.
> > >>>>> ---
> > >>>>>    include/hw/virtio/vhost-vdpa.h | 2 ++
> > >>>>>    hw/virtio/vhost-vdpa.c         | 6 +++---
> > >>>>>    net/vhost-vdpa.c               | 1 +
> > >>>>>    3 files changed, 6 insertions(+), 3 deletions(-)
> > >>>>>
> > >>>>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/v=
host-vdpa.h
> > >>>>> index 6560bb9d78..0c3ed2d69b 100644
> > >>>>> --- a/include/hw/virtio/vhost-vdpa.h
> > >>>>> +++ b/include/hw/virtio/vhost-vdpa.h
> > >>>>> @@ -34,6 +34,8 @@ typedef struct vhost_vdpa {
> > >>>>>        struct vhost_vdpa_iova_range iova_range;
> > >>>>>        uint64_t acked_features;
> > >>>>>        bool shadow_vqs_enabled;
> > >>>>> +    /* The listener must send iova tree addresses, not GPA */
> > >>
> > >> Btw, cindy's vIOMMU series will make it not necessarily GPA any more=
.
> > >>
> > > Yes, this comment should be tuned then. But the SVQ iova_tree will no=
t
> > > be equal to vIOMMU one because shadow vrings.
> > >
> > > But maybe SVQ can inspect both instead of having all the duplicated e=
ntries.
> > >
> > >>>>> +    bool listener_shadow_vq;
> > >>>>>        /* IOVA mapping used by the Shadow Virtqueue */
> > >>>>>        VhostIOVATree *iova_tree;
> > >>>>>        GPtrArray *shadow_vqs;
> > >>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > >>>>> index 8fd32ba32b..e3914fa40e 100644
> > >>>>> --- a/hw/virtio/vhost-vdpa.c
> > >>>>> +++ b/hw/virtio/vhost-vdpa.c
> > >>>>> @@ -220,7 +220,7 @@ static void vhost_vdpa_listener_region_add(Me=
moryListener *listener,
> > >>>>>                                             vaddr, section->reado=
nly);
> > >>>>>
> > >>>>>        llsize =3D int128_sub(llend, int128_make64(iova));
> > >>>>> -    if (v->shadow_vqs_enabled) {
> > >>>>> +    if (v->listener_shadow_vq) {
> > >>>>>            int r;
> > >>>>>
> > >>>>>            mem_region.translated_addr =3D (hwaddr)(uintptr_t)vadd=
r,
> > >>>>> @@ -247,7 +247,7 @@ static void vhost_vdpa_listener_region_add(Me=
moryListener *listener,
> > >>>>>        return;
> > >>>>>
> > >>>>>    fail_map:
> > >>>>> -    if (v->shadow_vqs_enabled) {
> > >>>>> +    if (v->listener_shadow_vq) {
> > >>>>>            vhost_iova_tree_remove(v->iova_tree, mem_region);
> > >>>>>        }
> > >>>>>
> > >>>>> @@ -292,7 +292,7 @@ static void vhost_vdpa_listener_region_del(Me=
moryListener *listener,
> > >>>>>
> > >>>>>        llsize =3D int128_sub(llend, int128_make64(iova));
> > >>>>>
> > >>>>> -    if (v->shadow_vqs_enabled) {
> > >>>>> +    if (v->listener_shadow_vq) {
> > >>>>>            const DMAMap *result;
> > >>>>>            const void *vaddr =3D memory_region_get_ram_ptr(sectio=
n->mr) +
> > >>>>>                section->offset_within_region +
> > >>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > >>>>> index 85a318faca..02780ee37b 100644
> > >>>>> --- a/net/vhost-vdpa.c
> > >>>>> +++ b/net/vhost-vdpa.c
> > >>>>> @@ -570,6 +570,7 @@ static NetClientState *net_vhost_vdpa_init(Ne=
tClientState *peer,
> > >>>>>        s->vhost_vdpa.index =3D queue_pair_index;
> > >>>>>        s->always_svq =3D svq;
> > >>>>>        s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > >>>>> +    s->vhost_vdpa.listener_shadow_vq =3D svq;
> > >>>> Any chance those above two can differ?
> > >>>>
> > >>> If CVQ is shadowed but data VQs are not, shadow_vqs_enabled is true
> > >>> but listener_shadow_vq is not.
> > >>>
> > >>> It is more clear in the next commit, where only shadow_vqs_enabled =
is
> > >>> set to true at vhost_vdpa_net_cvq_start.
> > >>
> > >> Ok, the name looks a little bit confusing. I wonder if it's better t=
o
> > >> use shadow_cvq and shadow_data ?
> > >>
> > > I'm ok with renaming it, but struct vhost_vdpa is generic across all
> > > kind of devices, and it does not know if it is a datapath or not for
> > > the moment.
> > >
> > > Maybe listener_uses_iova_tree?
> >
> >
> > I think "iova_tree" is something that is internal to svq implementation=
,
> > it's better to define the name from the view of vhost_vdpa level.
> >
>
> I don't get this, vhost_vdpa struct already has a pointer to its iova_tre=
e.

Yes, this is a suggestion to improve the readability of the code. So
what I meant is to have a name to demonstrate why we need to use
iova_tree instead of "uses_iova_tree".

Thanks

>
> Thanks!
>


