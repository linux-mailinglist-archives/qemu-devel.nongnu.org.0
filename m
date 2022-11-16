Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B723062B1DE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 04:36:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov9Bs-0007sr-T4; Tue, 15 Nov 2022 22:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ov9Bq-0007sb-E3
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 22:34:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ov9Bn-0003sv-0j
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 22:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668569652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TNHR8SSjrDMJFhcA9aKCFjRxkzUSsMDKZLk1c8l72Xs=;
 b=i8LTXFo5gBe3O4CffVMq1N19Q6LLy3D626Rp0YWWUfAVvROWZ0JpX9zbkAROAvsG6MTGjr
 1Az4RFC91puSJN3yKnOwPp7Tn00qZt/JZi3JFqGuVJYDtOksWUgAkBQTLu7Fq5dhONwbRk
 1p2WCRzwFuxt/Xq/oTMxr8srSYNAVLE=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-133-Ro5snPk6PNqW4Wu1_S2Qyg-1; Tue, 15 Nov 2022 22:34:10 -0500
X-MC-Unique: Ro5snPk6PNqW4Wu1_S2Qyg-1
Received: by mail-ot1-f71.google.com with SMTP id
 s5-20020a9d7585000000b0066c7a3ddf59so8463818otk.13
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 19:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TNHR8SSjrDMJFhcA9aKCFjRxkzUSsMDKZLk1c8l72Xs=;
 b=7oliUgJxG2DRl66FAU2XFH2BQl73p59khzg5cJrqcZnY7quQYeTVGDKRHHBpoYGQV+
 ok3lEeasJe/6EmzHJXyOUok9Q1f4G/iUH4aHInjMxn3mphB2HwfNV/onRUGaivb8XnZW
 05LdxYgX31n0NDoGk/1nHR+Gpzy+m7Nap2VdUr1yhqZGcMD5cX9ICGHNlN9PX7mYfaBz
 1/NyBMq2RF9oemtDqrYcE4H5bXoiqpPQlyZd9bzc6g1X/x4cjC92BTIy+997I/Un/HiR
 0Sa22qEbbziFWwwIkiMnjg7bfKKweq4B6GVDguA5doP2ONGkT/x2far7OkZuyR62jNFS
 mGkw==
X-Gm-Message-State: ANoB5pmNhfZCRacZjogUuYeruZReS3tVtrwho8DvQ9ZBNXvek10kjjlk
 Ok3Yfc4Xq3Xu9sO1J2MbRJCBetyZv+Ru7VLxxPTCK0vIkJY1GDAF5zUPaG3UATpDyEOOJgn2U/d
 2qF6HBMj6VAdjEHSIswQYZJzi/vfPCco=
X-Received: by 2002:a4a:bd8b:0:b0:480:8f4a:7062 with SMTP id
 k11-20020a4abd8b000000b004808f4a7062mr8881381oop.57.1668569649667; 
 Tue, 15 Nov 2022 19:34:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5pyS8MnsETYO/Vo5l7EgUeOSwNBJABKBfTYJiOfBwe5cCDlSK+BySS4HprbMgmtFMnnyXJeApZnpv4d0oGEbk=
X-Received: by 2002:a4a:bd8b:0:b0:480:8f4a:7062 with SMTP id
 k11-20020a4abd8b000000b004808f4a7062mr8881374oop.57.1668569649403; Tue, 15
 Nov 2022 19:34:09 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-10-eperezma@redhat.com>
 <CACGkMEsr=fpbbOpUBHawt5DR+nTWcK1uMzXgorEcbijso1wsMQ@mail.gmail.com>
 <CAJaqyWemKoRNd6_uvFc79qYe+7pbavJSjnZuczxk5uxSZZdZ2Q@mail.gmail.com>
 <be553273-7c06-78f7-4d23-de9f46a210b1@redhat.com>
 <CAJaqyWeZWQgGm7XZ-+DBHNS4XW_-GgWeeOqTb82v__jS8ONRyQ@mail.gmail.com>
 <6a35e659-698e-ff71-fe9b-06e15809c9e4@redhat.com>
 <CAJaqyWeF7bNuu-e6g4RghBkc-5oqEAuaEVbJ9uDgGPWWsP36Lg@mail.gmail.com>
 <CACGkMEvvjC21XjMEwcv6QP=WKTH2Vh-3dfZkR6vVFi67SWYYvw@mail.gmail.com>
 <CAJaqyWdFsN1dEmMn92oOH_2cCEt1uYXunr876jd5EYBCXf+Xug@mail.gmail.com>
In-Reply-To: <CAJaqyWdFsN1dEmMn92oOH_2cCEt1uYXunr876jd5EYBCXf+Xug@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 16 Nov 2022 11:33:58 +0800
Message-ID: <CACGkMEuQHi19JZjSPRNBw_Ct2GZ7aOXKAB=YJkKgzc-+oswzew@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Tue, Nov 15, 2022 at 7:25 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Nov 15, 2022 at 4:04 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, Nov 15, 2022 at 12:31 AM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Mon, Nov 14, 2022 at 5:30 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > >
> > > > =E5=9C=A8 2022/11/11 21:12, Eugenio Perez Martin =E5=86=99=E9=81=93=
:
> > > > > On Fri, Nov 11, 2022 at 8:49 AM Jason Wang <jasowang@redhat.com> =
wrote:
> > > > >>
> > > > >> =E5=9C=A8 2022/11/10 21:47, Eugenio Perez Martin =E5=86=99=E9=81=
=93:
> > > > >>> On Thu, Nov 10, 2022 at 7:01 AM Jason Wang <jasowang@redhat.com=
> wrote:
> > > > >>>> On Wed, Nov 9, 2022 at 1:08 AM Eugenio P=C3=A9rez <eperezma@re=
dhat.com> wrote:
> > > > >>>>> The memory listener that thells the device how to convert GPA=
 to qemu's
> > > > >>>>> va is registered against CVQ vhost_vdpa. This series try to m=
ap the
> > > > >>>>> memory listener translations to ASID 0, while it maps the CVQ=
 ones to
> > > > >>>>> ASID 1.
> > > > >>>>>
> > > > >>>>> Let's tell the listener if it needs to register them on iova =
tree or
> > > > >>>>> not.
> > > > >>>>>
> > > > >>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > >>>>> ---
> > > > >>>>> v5: Solve conflict about vhost_iova_tree_remove accepting mem=
_region by
> > > > >>>>>       value.
> > > > >>>>> ---
> > > > >>>>>    include/hw/virtio/vhost-vdpa.h | 2 ++
> > > > >>>>>    hw/virtio/vhost-vdpa.c         | 6 +++---
> > > > >>>>>    net/vhost-vdpa.c               | 1 +
> > > > >>>>>    3 files changed, 6 insertions(+), 3 deletions(-)
> > > > >>>>>
> > > > >>>>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virt=
io/vhost-vdpa.h
> > > > >>>>> index 6560bb9d78..0c3ed2d69b 100644
> > > > >>>>> --- a/include/hw/virtio/vhost-vdpa.h
> > > > >>>>> +++ b/include/hw/virtio/vhost-vdpa.h
> > > > >>>>> @@ -34,6 +34,8 @@ typedef struct vhost_vdpa {
> > > > >>>>>        struct vhost_vdpa_iova_range iova_range;
> > > > >>>>>        uint64_t acked_features;
> > > > >>>>>        bool shadow_vqs_enabled;
> > > > >>>>> +    /* The listener must send iova tree addresses, not GPA *=
/
> > > > >>
> > > > >> Btw, cindy's vIOMMU series will make it not necessarily GPA any =
more.
> > > > >>
> > > > > Yes, this comment should be tuned then. But the SVQ iova_tree wil=
l not
> > > > > be equal to vIOMMU one because shadow vrings.
> > > > >
> > > > > But maybe SVQ can inspect both instead of having all the duplicat=
ed entries.
> > > > >
> > > > >>>>> +    bool listener_shadow_vq;
> > > > >>>>>        /* IOVA mapping used by the Shadow Virtqueue */
> > > > >>>>>        VhostIOVATree *iova_tree;
> > > > >>>>>        GPtrArray *shadow_vqs;
> > > > >>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > >>>>> index 8fd32ba32b..e3914fa40e 100644
> > > > >>>>> --- a/hw/virtio/vhost-vdpa.c
> > > > >>>>> +++ b/hw/virtio/vhost-vdpa.c
> > > > >>>>> @@ -220,7 +220,7 @@ static void vhost_vdpa_listener_region_ad=
d(MemoryListener *listener,
> > > > >>>>>                                             vaddr, section->r=
eadonly);
> > > > >>>>>
> > > > >>>>>        llsize =3D int128_sub(llend, int128_make64(iova));
> > > > >>>>> -    if (v->shadow_vqs_enabled) {
> > > > >>>>> +    if (v->listener_shadow_vq) {
> > > > >>>>>            int r;
> > > > >>>>>
> > > > >>>>>            mem_region.translated_addr =3D (hwaddr)(uintptr_t)=
vaddr,
> > > > >>>>> @@ -247,7 +247,7 @@ static void vhost_vdpa_listener_region_ad=
d(MemoryListener *listener,
> > > > >>>>>        return;
> > > > >>>>>
> > > > >>>>>    fail_map:
> > > > >>>>> -    if (v->shadow_vqs_enabled) {
> > > > >>>>> +    if (v->listener_shadow_vq) {
> > > > >>>>>            vhost_iova_tree_remove(v->iova_tree, mem_region);
> > > > >>>>>        }
> > > > >>>>>
> > > > >>>>> @@ -292,7 +292,7 @@ static void vhost_vdpa_listener_region_de=
l(MemoryListener *listener,
> > > > >>>>>
> > > > >>>>>        llsize =3D int128_sub(llend, int128_make64(iova));
> > > > >>>>>
> > > > >>>>> -    if (v->shadow_vqs_enabled) {
> > > > >>>>> +    if (v->listener_shadow_vq) {
> > > > >>>>>            const DMAMap *result;
> > > > >>>>>            const void *vaddr =3D memory_region_get_ram_ptr(se=
ction->mr) +
> > > > >>>>>                section->offset_within_region +
> > > > >>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > >>>>> index 85a318faca..02780ee37b 100644
> > > > >>>>> --- a/net/vhost-vdpa.c
> > > > >>>>> +++ b/net/vhost-vdpa.c
> > > > >>>>> @@ -570,6 +570,7 @@ static NetClientState *net_vhost_vdpa_ini=
t(NetClientState *peer,
> > > > >>>>>        s->vhost_vdpa.index =3D queue_pair_index;
> > > > >>>>>        s->always_svq =3D svq;
> > > > >>>>>        s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > > > >>>>> +    s->vhost_vdpa.listener_shadow_vq =3D svq;
> > > > >>>> Any chance those above two can differ?
> > > > >>>>
> > > > >>> If CVQ is shadowed but data VQs are not, shadow_vqs_enabled is =
true
> > > > >>> but listener_shadow_vq is not.
> > > > >>>
> > > > >>> It is more clear in the next commit, where only shadow_vqs_enab=
led is
> > > > >>> set to true at vhost_vdpa_net_cvq_start.
> > > > >>
> > > > >> Ok, the name looks a little bit confusing. I wonder if it's bett=
er to
> > > > >> use shadow_cvq and shadow_data ?
> > > > >>
> > > > > I'm ok with renaming it, but struct vhost_vdpa is generic across =
all
> > > > > kind of devices, and it does not know if it is a datapath or not =
for
> > > > > the moment.
> > > > >
> > > > > Maybe listener_uses_iova_tree?
> > > >
> > > >
> > > > I think "iova_tree" is something that is internal to svq implementa=
tion,
> > > > it's better to define the name from the view of vhost_vdpa level.
> > > >
> > >
> > > I don't get this, vhost_vdpa struct already has a pointer to its iova=
_tree.
> >
> > Yes, this is a suggestion to improve the readability of the code. So
> > what I meant is to have a name to demonstrate why we need to use
> > iova_tree instead of "uses_iova_tree".
> >
>
> I understand.
>
> Knowing that the listener will be always bound to data vqs (being net,
> blk, ...), I think it is ok to rename it to shadow_data.
>
> But I think there is no way to add shadow_cvq properly from
> hw/virtio/vhost-vdpa.c , since we don't know if the vhost_vdpa belongs
> to a datapath or not. Would it work just to rename listener_shadow_vq
> to shadow_data?

This should work.

Thanks

>
> Thanks!
>


