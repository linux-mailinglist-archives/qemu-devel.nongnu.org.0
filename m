Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6A6E7837
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 13:11:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp5hx-0000gn-2u; Wed, 19 Apr 2023 07:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pp5hq-0000gU-VA
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:10:35 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pp5hm-0005Pg-4p
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:10:33 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-54fbb713301so253192657b3.11
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 04:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681902623; x=1684494623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3Ghr+q3oCfidUyqSiWUsks7AHuVw3bMKWV+o74qpkA=;
 b=rz2qqbMXjE+3axJWVMhZ3lq3Scpt2Byb4FZy7G6P3Vo7T8YoIZN36XnkXEHBc0zjaN
 lQCG1aTDsPvtWwu4uX8+qcOC0ZrjRl9S9VmqrM6yAljU88HgHYKT1hd8cYHymFLZgM9Y
 AwZuSDKECBDAIkFKJgXGvJOizJ36V4GCTuTkeZ9ClW+ZOUuJ5F3WmclRfxWKZ9+QF86c
 XSC46vkFmwniUu2pwIOWmQvwkpJ+HnjbvsEkmZPNT7vVCE7UEyvwGKz2do2zSfu2PypX
 tzaYHoyPc73d3Oyo4BrKIbvIFlMoT32+1HOTckzNRt4z64a1KTbBzuLYz+HO5Rpo847P
 vhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681902623; x=1684494623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I3Ghr+q3oCfidUyqSiWUsks7AHuVw3bMKWV+o74qpkA=;
 b=cj4RH7ax1qeQnbBEBy6ajcUaX/7OTvVfYBIt/Z8U3/FHcNCJLrVsB3C7XYmmiLWoI4
 MBSlmyux1etAYnWRgnbDBkrtLUAi7O74facBRuSWEf4cft0Kk8A4zJnYr+PLI5keN6tB
 TqLaF/xj9iMd+E7+I8tVYi2XOszYsBVIlnZFf1cP+kwWgavIgFJvbapd1dtqMiBHS2u4
 2ANEYGlARfhXS8wSjP9vq8dbbrhkl5jPc4PMtRMsSB5xuK56NFWy5zBGDXEBglQhnT1F
 Kzg6xoXO7SFzsFazyPZa9qUMyUxMyRig1u8YbwxCyE4E42eQ4uOHRHW47l8tIHzats9z
 xdbg==
X-Gm-Message-State: AAQBX9d4O/1vCTV6MPE2w1PfhiHu0R/4ydIY4f2oJDRjl/QjCH3c/nYg
 +5lyKuXeA/hG4x7IBE3jNRUz749mG+lEnejAB3o=
X-Google-Smtp-Source: AKy350YOXzAswiLBsjYexGwehaoKds/bOhpXw2yzm7TMOV6rk2zYmR3qfniqb1BexTk7B3bS6DoFZoFJv15ciFk5wQw=
X-Received: by 2002:a0d:d983:0:b0:54f:b945:db81 with SMTP id
 b125-20020a0dd983000000b0054fb945db81mr2432801ywe.36.1681902622667; Wed, 19
 Apr 2023 04:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
 <20230417153810.GE3852722@fedora>
 <CAJaqyWePM_a7AafP9qS40hmYXKHDyMsvn5g24zk=cH8L6s-kUw@mail.gmail.com>
 <CAJSP0QWUfxzad3EmT3r1hhaWmXDQt9Nj1LRPhPs_w79S9GAb1A@mail.gmail.com>
 <CAJaqyWfaDVZDJtMvPUhdRE283e80rB3WFd3RF9i=buaBYG=PKA@mail.gmail.com>
 <20230418175924.GB4041499@fedora>
 <fcb06652-1c27-6882-4818-2c54cbe76686@redhat.com>
In-Reply-To: <fcb06652-1c27-6882-4818-2c54cbe76686@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 19 Apr 2023 07:10:10 -0400
Message-ID: <CAJSP0QURNr0-U-ikUyLhOR2Nfmeoq-XfM1rHwPYO01_b=pBoSg@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH 2/4] vhost-user: Interface for migration state
 transfer
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Eugenio Perez Martin <eperezma@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, 
 virtio-fs@redhat.com, Anton Kuchin <antonkuchin@yandex-team.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 19 Apr 2023 at 06:57, Hanna Czenczek <hreitz@redhat.com> wrote:
>
> On 18.04.23 19:59, Stefan Hajnoczi wrote:
> > On Tue, Apr 18, 2023 at 10:09:30AM +0200, Eugenio Perez Martin wrote:
> >> On Mon, Apr 17, 2023 at 9:33=E2=80=AFPM Stefan Hajnoczi <stefanha@gmai=
l.com> wrote:
> >>> On Mon, 17 Apr 2023 at 15:10, Eugenio Perez Martin <eperezma@redhat.c=
om> wrote:
> >>>> On Mon, Apr 17, 2023 at 5:38=E2=80=AFPM Stefan Hajnoczi <stefanha@re=
dhat.com> wrote:
> >>>>> On Thu, Apr 13, 2023 at 12:14:24PM +0200, Eugenio Perez Martin wrot=
e:
> >>>>>> On Wed, Apr 12, 2023 at 11:06=E2=80=AFPM Stefan Hajnoczi <stefanha=
@redhat.com> wrote:
> >>>>>>> On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
> >>>>>>>> So-called "internal" virtio-fs migration refers to transporting =
the
> >>>>>>>> back-end's (virtiofsd's) state through qemu's migration stream. =
 To do
> >>>>>>>> this, we need to be able to transfer virtiofsd's internal state =
to and
> >>>>>>>> from virtiofsd.
> >>>>>>>>
> >>>>>>>> Because virtiofsd's internal state will not be too large, we bel=
ieve it
> >>>>>>>> is best to transfer it as a single binary blob after the streami=
ng
> >>>>>>>> phase.  Because this method should be useful to other vhost-user
> >>>>>>>> implementations, too, it is introduced as a general-purpose addi=
tion to
> >>>>>>>> the protocol, not limited to vhost-user-fs.
> >>>>>>>>
> >>>>>>>> These are the additions to the protocol:
> >>>>>>>> - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATOR=
Y_STATE:
> >>>>>>>>    This feature signals support for transferring state, and is a=
dded so
> >>>>>>>>    that migration can fail early when the back-end has no suppor=
t.
> >>>>>>>>
> >>>>>>>> - SET_DEVICE_STATE_FD function: Front-end and back-end negotiate=
 a pipe
> >>>>>>>>    over which to transfer the state.  The front-end sends an FD =
to the
> >>>>>>>>    back-end into/from which it can write/read its state, and the=
 back-end
> >>>>>>>>    can decide to either use it, or reply with a different FD for=
 the
> >>>>>>>>    front-end to override the front-end's choice.
> >>>>>>>>    The front-end creates a simple pipe to transfer the state, bu=
t maybe
> >>>>>>>>    the back-end already has an FD into/from which it has to writ=
e/read
> >>>>>>>>    its state, in which case it will want to override the simple =
pipe.
> >>>>>>>>    Conversely, maybe in the future we find a way to have the fro=
nt-end
> >>>>>>>>    get an immediate FD for the migration stream (in some cases),=
 in which
> >>>>>>>>    case we will want to send this to the back-end instead of cre=
ating a
> >>>>>>>>    pipe.
> >>>>>>>>    Hence the negotiation: If one side has a better idea than a p=
lain
> >>>>>>>>    pipe, we will want to use that.
> >>>>>>>>
> >>>>>>>> - CHECK_DEVICE_STATE: After the state has been transferred throu=
gh the
> >>>>>>>>    pipe (the end indicated by EOF), the front-end invokes this f=
unction
> >>>>>>>>    to verify success.  There is no in-band way (through the pipe=
) to
> >>>>>>>>    indicate failure, so we need to check explicitly.
> >>>>>>>>
> >>>>>>>> Once the transfer pipe has been established via SET_DEVICE_STATE=
_FD
> >>>>>>>> (which includes establishing the direction of transfer and migra=
tion
> >>>>>>>> phase), the sending side writes its data into the pipe, and the =
reading
> >>>>>>>> side reads it until it sees an EOF.  Then, the front-end will ch=
eck for
> >>>>>>>> success via CHECK_DEVICE_STATE, which on the destination side in=
cludes
> >>>>>>>> checking for integrity (i.e. errors during deserialization).
> >>>>>>>>
> >>>>>>>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> >>>>>>>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> >>>>>>>> ---
> >>>>>>>>   include/hw/virtio/vhost-backend.h |  24 +++++
> >>>>>>>>   include/hw/virtio/vhost.h         |  79 ++++++++++++++++
> >>>>>>>>   hw/virtio/vhost-user.c            | 147 ++++++++++++++++++++++=
++++++++
> >>>>>>>>   hw/virtio/vhost.c                 |  37 ++++++++
> >>>>>>>>   4 files changed, 287 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virt=
io/vhost-backend.h
> >>>>>>>> index ec3fbae58d..5935b32fe3 100644
> >>>>>>>> --- a/include/hw/virtio/vhost-backend.h
> >>>>>>>> +++ b/include/hw/virtio/vhost-backend.h
> >>>>>>>> @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
> >>>>>>>>       VHOST_SET_CONFIG_TYPE_MIGRATION =3D 1,
> >>>>>>>>   } VhostSetConfigType;
> >>>>>>>>
> >>>>>>>> +typedef enum VhostDeviceStateDirection {
> >>>>>>>> +    /* Transfer state from back-end (device) to front-end */
> >>>>>>>> +    VHOST_TRANSFER_STATE_DIRECTION_SAVE =3D 0,
> >>>>>>>> +    /* Transfer state from front-end to back-end (device) */
> >>>>>>>> +    VHOST_TRANSFER_STATE_DIRECTION_LOAD =3D 1,
> >>>>>>>> +} VhostDeviceStateDirection;
> >>>>>>>> +
> >>>>>>>> +typedef enum VhostDeviceStatePhase {
> >>>>>>>> +    /* The device (and all its vrings) is stopped */
> >>>>>>>> +    VHOST_TRANSFER_STATE_PHASE_STOPPED =3D 0,
> >>>>>>>> +} VhostDeviceStatePhase;
> >>>>>>> vDPA has:
> >>>>>>>
> >>>>>>>    /* Suspend a device so it does not process virtqueue requests =
anymore
> >>>>>>>     *
> >>>>>>>     * After the return of ioctl the device must preserve all the =
necessary state
> >>>>>>>     * (the virtqueue vring base plus the possible device specific=
 states) that is
> >>>>>>>     * required for restoring in the future. The device must not c=
hange its
> >>>>>>>     * configuration after that point.
> >>>>>>>     */
> >>>>>>>    #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
> >>>>>>>
> >>>>>>>    /* Resume a device so it can resume processing virtqueue reque=
sts
> >>>>>>>     *
> >>>>>>>     * After the return of this ioctl the device will have restore=
d all the
> >>>>>>>     * necessary states and it is fully operational to continue pr=
ocessing the
> >>>>>>>     * virtqueue descriptors.
> >>>>>>>     */
> >>>>>>>    #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
> >>>>>>>
> >>>>>>> I wonder if it makes sense to import these into vhost-user so tha=
t the
> >>>>>>> difference between kernel vhost and vhost-user is minimized. It's=
 okay
> >>>>>>> if one of them is ahead of the other, but it would be nice to avo=
id
> >>>>>>> overlapping/duplicated functionality.
> >>>>>>>
> >>>>>> That's what I had in mind in the first versions. I proposed VHOST_=
STOP
> >>>>>> instead of VHOST_VDPA_STOP for this very reason. Later it did chan=
ge
> >>>>>> to SUSPEND.
> >>>>> I noticed QEMU only calls ioctl(VHOST_VDPA_SUSPEND) and not
> >>>>> ioctl(VHOST_VDPA_RESUME).
> >>>>>
> >>>>> The doc comments in <linux/vdpa.h> don't explain how the device can
> >>>>> leave the suspended state. Can you clarify this?
> >>>>>
> >>>> Do you mean in what situations or regarding the semantics of _RESUME=
?
> >>>>
> >>>> To me resume is an operation mainly to resume the device in the even=
t
> >>>> of a VM suspension, not a migration. It can be used as a fallback co=
de
> >>>> in some cases of migration failure though, but it is not currently
> >>>> used in qemu.
> >>> Is a "VM suspension" the QEMU HMP 'stop' command?
> >>>
> >>> I guess the reason why QEMU doesn't call RESUME anywhere is that it
> >>> resets the device in vhost_dev_stop()?
> >>>
> >> The actual reason for not using RESUME is that the ioctl was added
> >> after the SUSPEND design in qemu. Same as this proposal, it is was not
> >> needed at the time.
> >>
> >> In the case of vhost-vdpa net, the only usage of suspend is to fetch
> >> the vq indexes, and in case of error vhost already fetches them from
> >> guest's used ring way before vDPA, so it has little usage.
> >>
> >>> Does it make sense to combine SUSPEND and RESUME with Hanna's
> >>> SET_DEVICE_STATE_FD? For example, non-iterative migration works like
> >>> this:
> >>> - Saving the device's state is done by SUSPEND followed by
> >>> SET_DEVICE_STATE_FD. If the guest needs to continue executing (e.g.
> >>> savevm command or migration failed), then RESUME is called to
> >>> continue.
> >> I think the previous steps make sense at vhost_dev_stop, not virtio
> >> savevm handlers. To start spreading this logic to more places of qemu
> >> can bring confusion.
> > I don't think there is a way around extending the QEMU vhost's code
> > model. The current model in QEMU's vhost code is that the backend is
> > reset when the VM stops. This model worked fine for stateless devices
> > but it doesn't work for stateful devices.
> >
> > Imagine a vdpa-gpu device: you cannot reset the device in
> > vhost_dev_stop() and expect the GPU to continue working when
> > vhost_dev_start() is called again because all its state has been lost.
> > The guest driver will send requests that references a virtio-gpu
> > resources that no longer exist.
> >
> > One solution is to save the device's state in vhost_dev_stop(). I think
> > this is what you're suggesting. It requires keeping a copy of the state
> > and then loading the state again in vhost_dev_start(). I don't think
> > this approach should be used because it requires all stateful devices t=
o
> > support live migration (otherwise they break across HMP 'stop'/'cont').
> > Also, the device state for some devices may be large and it would also
> > become more complicated when iterative migration is added.
> >
> > Instead, I think the QEMU vhost code needs to be structured so that
> > struct vhost_dev has a suspended state:
> >
> >          ,---------.
> >       v         |
> >    started ------> stopped
> >      \   ^
> >       \  |
> >        -> suspended
> >
> > The device doesn't lose state when it enters the suspended state. It ca=
n
> > be resumed again.
> >
> > This is why I think SUSPEND/RESUME need to be part of the solution.
> > (It's also an argument for not including the phase argument in
> > SET_DEVICE_STATE_FD because the SUSPEND message is sent during
> > vhost_dev_stop() separately from saving the device's state.)
>
> So let me ask if I understand this protocol correctly: Basically,
> SUSPEND would ask the device to fully serialize its internal state,
> retain it in some buffer, and RESUME would then deserialize the state
> from the buffer, right?

That's not how I understand SUSPEND/RESUME. I was thinking that
SUSPEND pauses device operation so that virtqueues are no longer
processed and no other events occur (e.g. VIRTIO Configuration Change
Notifications). RESUME continues device operation. Neither command is
directly related to device state serialization but SUSPEND freezes the
device state, while RESUME allows the device state to change again.

> While this state needn=E2=80=99t necessarily be immediately migratable, I
> suppose (e.g. one could retain file descriptors there, and it doesn=E2=80=
=99t
> need to be a serialized byte buffer, but could still be structured), it
> would basically be a live migration implementation already.  As far as I
> understand, that=E2=80=99s why you suggest not running a SUSPEND+RESUME c=
ycle on
> anything but live migration, right?

No, SUSPEND/RESUME would also be used across vm_stop()/vm_start().
That way stateful devices are no longer reset across HMP 'stop'/'cont'
(we're lucky it even works for most existing vhost-user backends today
and that's just because they don't yet implement
VHOST_USER_SET_STATUS).

> I wonder how that model would then work with iterative migration,
> though.  Basically, for non-iterative migration, the back-end would
> expect SUSPEND first to flush its state out to a buffer, and then the
> state transfer would just copy from that buffer.  For iterative
> migration, though, there is no SUSPEND first, so the back-end must
> implicitly begin to serialize its state and send it over.  I find that a
> bit strange.

I expected SET_DEVICE_STATE_FD to be sent while the device is still
running for iterative migration. Device state chunks are saved while
the device is still operating.

When the VMM decides to stop the guest, it sends SUSPEND to freeze the
device. The remainder of the device state can then be read from the fd
in the knowledge that the size is now finite.

After migration completes, the device is still suspended on the
source. If migration failed, RESUME is sent to continue running on the
source.

> Also, how would this work with currently migratable stateless
> back-ends?  Do they already implement SUSPEND+RESUME as no-ops?  If not,
> I think we should detect stateless back-ends and skip the operations in
> qemu lest we have to update those back-ends for no real reason.

Yes, I think backwards compatibility is a requirement, too. The
vhost-user frontend checks the SUSPEND vhost-user protocol feature
bit. If the bit is cleared, then it must assume this device is
stateless and use device reset operations. Otherwise it can use
SUSPEND/RESUME.

Stefan

