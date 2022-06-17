Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09CB54EED5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 03:33:21 +0200 (CEST)
Received: from localhost ([::1]:57216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o20rQ-0008T0-ET
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 21:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o20nx-000781-Tg
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 21:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o20no-0001eo-CE
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 21:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655429371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjW96hslJ3aYwS6IYcuZItJze4DxbzuhO81AUCkEOIE=;
 b=HDLi9MdhDOGhOsM6H1wRTUCSY04478Xm1qKip1E2EJ3Hm/rhP9D9TnyB1bSKMWiy/mLgT5
 Vsn0YafSxfPaklX6LNH1+4nB/nD5k+nr1rCbcUmvdEefx3hu5kg1rkav88mM/dtT3w8nC2
 Zz1BszaiSbpSdZXhUGy90SmHO50ACys=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-rFpRJ88nOZ2Pe9fipbAFuA-1; Thu, 16 Jun 2022 21:29:30 -0400
X-MC-Unique: rFpRJ88nOZ2Pe9fipbAFuA-1
Received: by mail-lj1-f197.google.com with SMTP id
 h23-20020a2e3a17000000b00255788e9a7fso392668lja.10
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 18:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JjW96hslJ3aYwS6IYcuZItJze4DxbzuhO81AUCkEOIE=;
 b=S5/4O598/qqfCtggQsAXr96D5kO4A1edKGHe1mt/yQrlDUZC4o5J9aZybtTl1A/bPk
 rJVL/AGtSTxnAP4m88gUyV+odgEmsc7D9kDm2ZCi/xHa1pS78D5JYn2pz29tsuGh2NE5
 Y/jz2hhcwHPPOgEfc7z3bjM+KrPQS0vqRi00uYyyts9A85duNgoRmVbI18N8MdlpRJm2
 xRrKOxAfVVqLfzUa/qZAZ87zsN2V2qalu2ZYePdtAOee04sVlA8+bNfsLvuKdHvmphAe
 s6lbx4FpRJDwtdVIMcv2NrTPXYCzCKymQeRXgnAos3YbstgFo6pH4JU0/sGhX+lOa90Y
 gBwg==
X-Gm-Message-State: AJIora9ogsw7hzI6+NAajxtBEo1vlEaG3qIJaUbCRQZtsuYeEWnosThW
 EVHm1DqghiP+BWWSlGVwLZKC4gbg2cSE43AOtZwHlq5ezOz7R0KEqUPpKRJhp+vmzjtKdh63MR5
 Ms02CFLgBESfPyOFtH8CvYLei0XZ6uoE=
X-Received: by 2002:a05:6512:13a5:b0:47d:c1d9:dea8 with SMTP id
 p37-20020a05651213a500b0047dc1d9dea8mr4322309lfa.442.1655429368187; 
 Thu, 16 Jun 2022 18:29:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1utG7dgTUcZpdBDbMAElt3xQASPmYjEguI6v33iC/jmVZElkFwwussOaFVSfnhuJqvV6vwgiQCAM5Srj0j1oRE=
X-Received: by 2002:a05:6512:13a5:b0:47d:c1d9:dea8 with SMTP id
 p37-20020a05651213a500b0047dc1d9dea8mr4322283lfa.442.1655429367685; Thu, 16
 Jun 2022 18:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <d34131b7-4193-d82c-056f-23b9d99f897a@redhat.com>
 <CAJaqyWefgjYioDsV4jraPLah_Ty_RPRm9r3etVYEu5Dade9feg@mail.gmail.com>
 <CAJaqyWfy4f579a-pH2rPMB7KBrZ+iiNwuUEn2Y2TDoxPjD3VUQ@mail.gmail.com>
 <CACGkMEutyK2AXZ6uMg2nioXnJoaONkC7u1gGCuzJmuem_OsLLg@mail.gmail.com>
 <CAJaqyWeED1Q0XvrJ1gyYkZxSGXPdUXY+7+UCWAhpiJ+CEjC=WQ@mail.gmail.com>
 <CACGkMEtqNz8b6U6Fzqj5fft8Ax_Evu1=ptGyMs7ACM0OVybmdA@mail.gmail.com>
 <CAJaqyWdoGixF9-Vwfhti4aW8X-qpDma2wVBUrB7of7BxstwAQQ@mail.gmail.com>
 <CACGkMEtAExGWKrwmXFJXOCpaGdD3bvnHfbaAmKeco8ZrL4CYJQ@mail.gmail.com>
 <CAJaqyWeSK-8QivDF0MzrPt29RQMS0+QJ6UuWCra7Ag5sc0L-_Q@mail.gmail.com>
In-Reply-To: <CAJaqyWeSK-8QivDF0MzrPt29RQMS0+QJ6UuWCra7Ag5sc0L-_Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 17 Jun 2022 09:29:16 +0800
Message-ID: <CACGkMEtMSh2bG77+3O2mx3aOT+MUfUtCX4tRd2zBFoYy1vNLng@mail.gmail.com>
Subject: Re: [RFC PATCH v8 00/21] Net Control VQ support with asid in vDPA SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eric Blake <eblake@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 15, 2022 at 6:03 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Jun 15, 2022 at 5:04 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, Jun 14, 2022 at 5:32 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Tue, Jun 14, 2022 at 10:20 AM Jason Wang <jasowang@redhat.com> wro=
te:
> > > >
> > > > On Tue, Jun 14, 2022 at 4:14 PM Eugenio Perez Martin
> > > > <eperezma@redhat.com> wrote:
> > > > >
> > > > > On Tue, Jun 14, 2022 at 10:02 AM Jason Wang <jasowang@redhat.com>=
 wrote:
> > > > > >
> > > > > > On Tue, Jun 14, 2022 at 12:32 AM Eugenio Perez Martin
> > > > > > <eperezma@redhat.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jun 8, 2022 at 9:28 PM Eugenio Perez Martin <eperezma=
@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Jun 8, 2022 at 7:51 AM Jason Wang <jasowang@redhat.=
com> wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > > > > > > > > > Control virtqueue is used by networking device for acce=
pting various
> > > > > > > > > > commands from the driver. It's a must to support multiq=
ueue and other
> > > > > > > > > > configurations.
> > > > > > > > > >
> > > > > > > > > > Shadow VirtQueue (SVQ) already makes possible migration=
 of virtqueue
> > > > > > > > > > states, effectively intercepting them so qemu can track=
 what regions of memory
> > > > > > > > > > are dirty because device action and needs migration. Ho=
wever, this does not
> > > > > > > > > > solve networking device state seen by the driver becaus=
e CVQ messages, like
> > > > > > > > > > changes on MAC addresses from the driver.
> > > > > > > > > >
> > > > > > > > > > To solve that, this series uses SVQ infraestructure pro=
posed to intercept
> > > > > > > > > > networking control messages used by the device. This wa=
y, qemu is able to
> > > > > > > > > > update VirtIONet device model and to migrate it.
> > > > > > > > > >
> > > > > > > > > > However, to intercept all queues would slow device data=
 forwarding. To solve
> > > > > > > > > > that, only the CVQ must be intercepted all the time. Th=
is is achieved using
> > > > > > > > > > the ASID infraestructure, that allows different transla=
tions for different
> > > > > > > > > > virtqueues. The most updated kernel part of ASID is pro=
posed at [1].
> > > > > > > > > >
> > > > > > > > > > You can run qemu in two modes after applying this serie=
s: only intercepting
> > > > > > > > > > cvq with x-cvq-svq=3Don or intercept all the virtqueues=
 adding cmdline x-svq=3Don:
> > > > > > > > > >
> > > > > > > > > > -netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,=
id=3Dvhost-vdpa0,x-cvq-svq=3Don,x-svq=3Don
> > > > > > > > > >
> > > > > > > > > > First three patches enable the update of the virtio-net=
 device model for each
> > > > > > > > > > CVQ message acknoledged by the device.
> > > > > > > > > >
> > > > > > > > > > Patches from 5 to 9 enables individual SVQ to copy the =
buffers to QEMU's VA.
> > > > > > > > > > This allows simplyfing the memory mapping, instead of m=
ap all the guest's
> > > > > > > > > > memory like in the data virtqueues.
> > > > > > > > > >
> > > > > > > > > > Patch 10 allows to inject control messages to the devic=
e. This allows to set
> > > > > > > > > > state to the device both at QEMU startup and at live mi=
gration destination. In
> > > > > > > > > > the future, this may also be used to emulate _F_ANNOUNC=
E.
> > > > > > > > > >
> > > > > > > > > > Patch 11 updates kernel headers, but it assign random n=
umbers to needed ioctls
> > > > > > > > > > because they are still not accepted in the kernel.
> > > > > > > > > >
> > > > > > > > > > Patches 12-16 enables the set of the features of the ne=
t device model to the
> > > > > > > > > > vdpa device at device start.
> > > > > > > > > >
> > > > > > > > > > Last ones enables the sepparated ASID and SVQ.
> > > > > > > > > >
> > > > > > > > > > Comments are welcomed.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > As discussed, I think we need to split this huge series i=
nto smaller ones:
> > > > > > > > >
> > > > > > > > > 1) shadow CVQ only, this makes rx-filter-event work
> > > > > > > > > 2) ASID support for CVQ
> > > > > > > > >
> > > > > > > > > And for 1) we need consider whether or not it could be si=
mplified.
> > > > > > > > >
> > > > > > > > > Or do it in reverse order, since if we do 1) first, we ma=
y have security
> > > > > > > > > issues.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I'm ok with both, but I also think 2) before 1) might make =
more sense.
> > > > > > > > There is no way to only shadow CVQ otherwise ATM.
> > > > > > > >
> > > > > > >
> > > > > > > On second thought, that order is kind of harder.
> > > > > > >
> > > > > > > If we only map CVQ buffers, we need to either:
> > > > > > > a. Copy them to controlled buffers
> > > > > > > b. Track properly when to unmap them
> > > > > >
> > > > > > Just to make sure we're at the same page:
> > > > > >
> > > > > > I meant we can start with e.g having a dedicated ASID for CVQ b=
ut
> > > > > > still using CVQ passthrough.
> > > > > >
> > > > >
> > > > > That would imply duplicating all the memory listener updates to b=
oth
> > > > > ASIDs. That part of the code needs to be reverted. I'm ok with th=
at,
> > > > > but I'm not sure if it's worth it to do it that way.
> > > >
> > > > I don't get why it is related to memory listeners. The only change =
is
> > > >
> > > > 1) read the groups
> > > > 2) set cvq to be an independent asid
> > > > 3) update CVQ's IOTLB with its own ASID
> > > >
> > >
> > > How to track the mappings of step 3) without a copy?
> >
> > So let me try to explain, what I propose is to split the patches. So
> > the above could be the first part. Since we know:
> >
> > 1) CVQ is passthrough to guest right now
> > 2) We know CVQ will use an independent ASID
> >
> > It doesn't harm to implement those first. It's unrelated to the policy
> > (e.g how to shadow CVQ).
> >
> > >
> > > If we don't copy the buffers to qemu's IOVA, we need to track when to
> > > unmap CVQ buffers memory. Many CVQ buffers could be in the same page,
> > > so we need to refcount them (or similar solution).
> >
> > Can we use fixed mapping instead of the dynamic ones?
> >
>
> That implies either to implement something like a memory ring (size?),
> or to effectively duplicate memory listener mappings.

I'm not sure I get this.

But it's mainly the CVQ buffer + CVQ virtqueue.

It should be possible if:

1) allocate something like a buffer of several megabytes
2) only process one CVQ command from guest at once

?

>
> I'm not against that, but it's something we need to remove on the
> final solution. To use the order presented here will avoid that.
>
> > >
> > > This series copies the buffers to an independent buffer in qemu memor=
y
> > > to avoid that. Once you copy them, we have the problem you point at
> > > some patch later: The guest control buffers, so qemu must understand
> > > CVQ so the guest cannot trick it. All of this is orthogonal to ASID.
> > > At that point, we have this series except for the asid part and the
> > > injection of CVQ buffers at the LM destination, isn't it?
> >
> > So we have several stuffs:
> >
> > 1) ASID support
> > 2) Shadow CVQ only
> > 3) State restoring
> >
> > I hope we can split them into independent series. If we want to shadow
> > CVQ first, we need to prove that it is safe without ASID.
> >
> > >
> > > CVQ buffers can be copied in the qemu IOVA space and be offered to th=
e
> > > device. Much like SVQ vrings, the copied buffers will not be
> > > accessible from the guest. The hw device (as "non emulated cvq") will
> > > receive a lot of dma updates, but it's temporary. We can add ASID on
> > > top of that as a mean to:
> > > - Not to SVQ data plane (fundamental to the intended use case of vdpa=
).
> > > - Not to pollute data plane DMA mappings.
> > >
> > > > ?
> > > >
> > > > >
> > > > > > Then do other stuff on top.
> > > > > >
> > > > > > >
> > > > > > > Alternative a. have the same problems exposed in this RFC: It=
's hard
> > > > > > > (and unneeded in the final version) to know the size to copy.
> > > > > > > Alternative b. also requires things not needed in the final v=
ersion,
> > > > > > > like to count the number of times each page is mapped and unm=
apped.
> > > > > > >
> > > > > > > So I'll go to the first alternative, that is also the propose=
d order
> > > > > > > of the RFC. What security issues do you expect beyond the com=
ments in
> > > > > > > this series?
> > > > > >
> > > > > > If we shadow CVQ without ASID. The guest may guess the IOVA of =
CVQ and
> > > > > > try to peek/modify it?
> > > > > >
> > > > >
> > > > > It works the same way as data vqs, we're just updating the device
> > > > > model in the middle. It should imply the exact same risk as updat=
ing
> > > > > an emulated NIC control plane (including vhost-kernel / vhost-use=
r).
> > > >
> > > > Not sure I got you here. For vhost-kernel and vhost-user, CVQ's buf=
fer
> > > > is owned by guests.
> > > >
> > >
> > > The same way they control the data plane when all data virtqueues are
> > > shadowed for dirty page tracking (more on the risk of qemu updating
> > > the device model below).
> >
> > Ok.
> >
> > >
> > > > But if we shadow CVQ without ASID, the CVQ buffer is owned by QEMU =
and
> > > > there's no way to prevent guests from accessing it?
> > > >
> > >
> > > With SVQ the memory exposed to the device is already shadowed. They
> > > cannot access the CVQ buffers memory the same way they cannot access
> > > the SVQ vrings.
> >
> > Ok, I think I kind of get you, it looks like we have different
> > assumptions here: So if we only shadow CVQ, it will have security
> > issues, since RX/TX is not shadowed. If we shadow CVQ as well as
> > TX/RX, there's no security issue, since each IOVA is validated and the
> > descriptors are prepared by Qemu.
> >
>
> Right. I expected to maintain the all-shadowed-or-nothing behavior,
> sorry if I was not clear.
>
> > This goes back to another question, what's the order of the series.
> >
>
> I think that the shortest path is to follow the order of this series.
> I tried to reorder your way, but ASID patches have to come with a lot
> of CVQ patches if we want proper validation.

Ok, so if this is the case, let's just split this series and keep the order=
.

>
> We can take the long route if we either implement a fixed ring buffer,
> memory listener cloning, or another use case (sub-slicing?). But I
> expect more issues to arise there.
>
> I have another question actually, is it ok to implement the cvq use
> case but not to merge the x-svq parameter? The more I think on the
> parameter the more I see it's better to leave it as a separated patch
> for testing until we shape the complete series and it's unneeded.

That's fine.

Thanks

>
> Thanks!
>
> > Thanks
> >
> >
> > >
> > > > If in the case of vhost-kernel/vhost-user, there's a way for the gu=
est
> > > > to exploit buffers owned by Qemu, it should be a bug.
> > > >
> > >
> > > The only extra step is the call to virtio_net_handle_ctrl_iov
> > > (extracted from virtio_net_handle_ctrl). If a guest can exploit that
> > > in SVQ mode, it can exploit it too with other vhost backends as far a=
s
> > > I see.
> > >
> > > > Thanks
> > > >
> > > > >
> > > > > Roughly speaking, it's just to propose patches 01 to 03, with you=
r
> > > > > comments. That already meets use cases like rx filter notificatio=
ns
> > > > > for devices with only one ASID.
> > > > >
> > >
> > > This part of my mail is not correct, we need to add a few patches of
> > > this series on top :). If not, it would be exploitable.
> > >
> > > Thanks!
> > >
> > > > > Thanks!
> > > > >
> > > > > > Thanks
> > > > > >
> > > > > > >
> > > > > > > Thanks!
> > > > > > >
> > > > > > > > Can we do as with previous base SVQ patches? they were merg=
ed although
> > > > > > > > there is still no way to enable SVQ.
> > > > > > > >
> > > > > > > > Thanks!
> > > > > > > >
> > > > > > > > > Thoughts?
> > > > > > > > >
> > > > > > > > > Thanks
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > TODO:
> > > > > > > > > > * Fallback on regular CVQ if QEMU cannot isolate in its=
 own ASID by any
> > > > > > > > > >    reason, blocking migration. This is tricky, since it=
 can cause that the VM
> > > > > > > > > >    cannot be migrated anymore, so some way of block it =
must be used.
> > > > > > > > > > * Review failure paths, some are with TODO notes, other=
 don't.
> > > > > > > > > >
> > > > > > > > > > Changes from rfc v7:
> > > > > > > > > > * Don't map all guest space in ASID 1 but copy all the =
buffers. No need for
> > > > > > > > > >    more memory listeners.
> > > > > > > > > > * Move net backend start callback to SVQ.
> > > > > > > > > > * Wait for device CVQ commands used by the device at SV=
Q start, avoiding races.
> > > > > > > > > > * Changed ioctls, but they're provisional anyway.
> > > > > > > > > > * Reorder commits so refactor and code adding ones are =
closer to usage.
> > > > > > > > > > * Usual cleaning: better tracing, doc, patches messages=
, ...
> > > > > > > > > >
> > > > > > > > > > Changes from rfc v6:
> > > > > > > > > > * Fix bad iotlb updates order when batching was enabled
> > > > > > > > > > * Add reference counting to iova_tree so cleaning is si=
mpler.
> > > > > > > > > >
> > > > > > > > > > Changes from rfc v5:
> > > > > > > > > > * Fixes bad calculus of cvq end group when MQ is not ac=
ked by the guest.
> > > > > > > > > >
> > > > > > > > > > Changes from rfc v4:
> > > > > > > > > > * Add missing tracing
> > > > > > > > > > * Add multiqueue support
> > > > > > > > > > * Use already sent version for replacing g_memdup
> > > > > > > > > > * Care with memory management
> > > > > > > > > >
> > > > > > > > > > Changes from rfc v3:
> > > > > > > > > > * Fix bad returning of descriptors to SVQ list.
> > > > > > > > > >
> > > > > > > > > > Changes from rfc v2:
> > > > > > > > > > * Fix use-after-free.
> > > > > > > > > >
> > > > > > > > > > Changes from rfc v1:
> > > > > > > > > > * Rebase to latest master.
> > > > > > > > > > * Configure ASID instead of assuming cvq asid !=3D data=
 vqs asid.
> > > > > > > > > > * Update device model so (MAC) state can be migrated to=
o.
> > > > > > > > > >
> > > > > > > > > > [1] https://lkml.kernel.org/kvm/20220224212314.1326-1-g=
dawar@xilinx.com/
> > > > > > > > > >
> > > > > > > > > > Eugenio P=C3=A9rez (21):
> > > > > > > > > >    virtio-net: Expose ctrl virtqueue logic
> > > > > > > > > >    vhost: Add custom used buffer callback
> > > > > > > > > >    vdpa: control virtqueue support on shadow virtqueue
> > > > > > > > > >    virtio: Make virtqueue_alloc_element non-static
> > > > > > > > > >    vhost: Add vhost_iova_tree_find
> > > > > > > > > >    vdpa: Add map/unmap operation callback to SVQ
> > > > > > > > > >    vhost: move descriptor translation to vhost_svq_vrin=
g_write_descs
> > > > > > > > > >    vhost: Add SVQElement
> > > > > > > > > >    vhost: Add svq copy desc mode
> > > > > > > > > >    vhost: Add vhost_svq_inject
> > > > > > > > > >    vhost: Update kernel headers
> > > > > > > > > >    vdpa: delay set_vring_ready after DRIVER_OK
> > > > > > > > > >    vhost: Add ShadowVirtQueueStart operation
> > > > > > > > > >    vhost: Make possible to check for device exclusive v=
q group
> > > > > > > > > >    vhost: add vhost_svq_poll
> > > > > > > > > >    vdpa: Add vhost_vdpa_start_control_svq
> > > > > > > > > >    vdpa: Add asid attribute to vdpa device
> > > > > > > > > >    vdpa: Extract get features part from vhost_vdpa_get_=
max_queue_pairs
> > > > > > > > > >    vhost: Add reference counting to vhost_iova_tree
> > > > > > > > > >    vdpa: Add x-svq to NetdevVhostVDPAOptions
> > > > > > > > > >    vdpa: Add x-cvq-svq
> > > > > > > > > >
> > > > > > > > > >   qapi/net.json                                |  13 +-
> > > > > > > > > >   hw/virtio/vhost-iova-tree.h                  |   7 +-
> > > > > > > > > >   hw/virtio/vhost-shadow-virtqueue.h           |  61 ++=
-
> > > > > > > > > >   include/hw/virtio/vhost-vdpa.h               |   3 +
> > > > > > > > > >   include/hw/virtio/vhost.h                    |   3 +
> > > > > > > > > >   include/hw/virtio/virtio-net.h               |   4 +
> > > > > > > > > >   include/hw/virtio/virtio.h                   |   1 +
> > > > > > > > > >   include/standard-headers/linux/vhost_types.h |  11 +-
> > > > > > > > > >   linux-headers/linux/vhost.h                  |  25 +-
> > > > > > > > > >   hw/net/vhost_net.c                           |   5 +-
> > > > > > > > > >   hw/net/virtio-net.c                          |  84 ++=
+--
> > > > > > > > > >   hw/virtio/vhost-iova-tree.c                  |  35 +-
> > > > > > > > > >   hw/virtio/vhost-shadow-virtqueue.c           | 378 ++=
++++++++++++++---
> > > > > > > > > >   hw/virtio/vhost-vdpa.c                       | 206 ++=
+++++++-
> > > > > > > > > >   hw/virtio/virtio.c                           |   2 +-
> > > > > > > > > >   net/vhost-vdpa.c                             | 294 ++=
++++++++++++-
> > > > > > > > > >   hw/virtio/trace-events                       |  10 +-
> > > > > > > > > >   17 files changed, 1012 insertions(+), 130 deletions(-=
)
> > > > > > > > > >
> > > > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
> >
>


