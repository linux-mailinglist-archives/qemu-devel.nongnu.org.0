Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD466E5BB7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 10:10:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pogQ8-0004Me-2o; Tue, 18 Apr 2023 04:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pogQ4-0004M1-RW
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:10:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pogPz-0003nA-AV
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681805409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=frSyBxBJthwZ3vEiowvmDfxEqGAwHxOSQkJxSzWrFC0=;
 b=Itlp0tqwm4vAmhUIV9D08fgJEcZUIf0yuWim/qUuH4DnQPZFwbBotlRwKhpoUH35hAf9IZ
 zByj0KCxr7G+V1cTat2v0tQIbq6r5ai7a82YGUAx9/Nxl4/tGDPzz4ij5PdYkTJBm4fb1i
 uOaMw34kCD1IKJaaW3RUFLylAI2Y0FU=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-dDJMq2n_Nq6JTwSJz0NQLg-1; Tue, 18 Apr 2023 04:10:07 -0400
X-MC-Unique: dDJMq2n_Nq6JTwSJz0NQLg-1
Received: by mail-yb1-f197.google.com with SMTP id
 e63-20020a255042000000b00b953ca0cf4eso1139637ybb.12
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 01:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681805407; x=1684397407;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=frSyBxBJthwZ3vEiowvmDfxEqGAwHxOSQkJxSzWrFC0=;
 b=byvwoUwKXQGogZlK8xGYOtlifQMEKga9rrXXYvjhpehKPCefeXW/TWM+tD/4iEiTt5
 /rL9HvD3E5w+eQ8mBhRtGCEOo3Q/+xaX1QwPc86XqvawVtwWRgTJoU6yeI76GP0f9+dl
 68aggOGrXiTvqF7Cl/dX7dPBkJ41sP2mUkmf8gXl4OGLKdEyM52fByqtKu5MegQxcDI6
 +Cb2xqLuGpc3NeUhvD6lxLAo2z+XkRlqLM9jkSZ108glFJyQRQpnIOyxOd4ZvWiHp9Je
 tmYwwlrhK7dCj5NAL+dpOUQa7h4BtDAFD7hhhqm7uEoMoRGciYsUzQzhLVzca657BL3A
 GxWw==
X-Gm-Message-State: AAQBX9dNsE/sXp6XnEVtznzIHXlHdpSMEsou+eXUqFAAjybTmd/44tk9
 XcSnKBe/CQu3iUI1Dk7TxskyDhB3g4VIZT8Qqp1o2aQc/Vm+Wz/iSKgs1U4Y0uB9zIrt5ZEZizu
 zshbXdZFL4MMnLyf4ytvXJZ8M/BuWAYc=
X-Received: by 2002:a25:4fd6:0:b0:b92:3f9e:b2c1 with SMTP id
 d205-20020a254fd6000000b00b923f9eb2c1mr6281109ybb.58.1681805406973; 
 Tue, 18 Apr 2023 01:10:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350a3AfW+sFn8OHTOtlakMlZ37S1g2/RsvHNneyPXtaZAQyj+DP4PNQxhBdWPinQOrYokFRoLP/6lMOC9Dja0ZqM=
X-Received: by 2002:a25:4fd6:0:b0:b92:3f9e:b2c1 with SMTP id
 d205-20020a254fd6000000b00b923f9eb2c1mr6281087ybb.58.1681805406668; Tue, 18
 Apr 2023 01:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
 <20230417153810.GE3852722@fedora>
 <CAJaqyWePM_a7AafP9qS40hmYXKHDyMsvn5g24zk=cH8L6s-kUw@mail.gmail.com>
 <CAJSP0QWUfxzad3EmT3r1hhaWmXDQt9Nj1LRPhPs_w79S9GAb1A@mail.gmail.com>
In-Reply-To: <CAJSP0QWUfxzad3EmT3r1hhaWmXDQt9Nj1LRPhPs_w79S9GAb1A@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 18 Apr 2023 10:09:30 +0200
Message-ID: <CAJaqyWfaDVZDJtMvPUhdRE283e80rB3WFd3RF9i=buaBYG=PKA@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Hanna Czenczek <hreitz@redhat.com>,
 qemu-devel@nongnu.org, 
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>, 
 Anton Kuchin <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Apr 17, 2023 at 9:33=E2=80=AFPM Stefan Hajnoczi <stefanha@gmail.com=
> wrote:
>
> On Mon, 17 Apr 2023 at 15:10, Eugenio Perez Martin <eperezma@redhat.com> =
wrote:
> >
> > On Mon, Apr 17, 2023 at 5:38=E2=80=AFPM Stefan Hajnoczi <stefanha@redha=
t.com> wrote:
> > >
> > > On Thu, Apr 13, 2023 at 12:14:24PM +0200, Eugenio Perez Martin wrote:
> > > > On Wed, Apr 12, 2023 at 11:06=E2=80=AFPM Stefan Hajnoczi <stefanha@=
redhat.com> wrote:
> > > > >
> > > > > On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
> > > > > > So-called "internal" virtio-fs migration refers to transporting=
 the
> > > > > > back-end's (virtiofsd's) state through qemu's migration stream.=
  To do
> > > > > > this, we need to be able to transfer virtiofsd's internal state=
 to and
> > > > > > from virtiofsd.
> > > > > >
> > > > > > Because virtiofsd's internal state will not be too large, we be=
lieve it
> > > > > > is best to transfer it as a single binary blob after the stream=
ing
> > > > > > phase.  Because this method should be useful to other vhost-use=
r
> > > > > > implementations, too, it is introduced as a general-purpose add=
ition to
> > > > > > the protocol, not limited to vhost-user-fs.
> > > > > >
> > > > > > These are the additions to the protocol:
> > > > > > - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATO=
RY_STATE:
> > > > > >   This feature signals support for transferring state, and is a=
dded so
> > > > > >   that migration can fail early when the back-end has no suppor=
t.
> > > > > >
> > > > > > - SET_DEVICE_STATE_FD function: Front-end and back-end negotiat=
e a pipe
> > > > > >   over which to transfer the state.  The front-end sends an FD =
to the
> > > > > >   back-end into/from which it can write/read its state, and the=
 back-end
> > > > > >   can decide to either use it, or reply with a different FD for=
 the
> > > > > >   front-end to override the front-end's choice.
> > > > > >   The front-end creates a simple pipe to transfer the state, bu=
t maybe
> > > > > >   the back-end already has an FD into/from which it has to writ=
e/read
> > > > > >   its state, in which case it will want to override the simple =
pipe.
> > > > > >   Conversely, maybe in the future we find a way to have the fro=
nt-end
> > > > > >   get an immediate FD for the migration stream (in some cases),=
 in which
> > > > > >   case we will want to send this to the back-end instead of cre=
ating a
> > > > > >   pipe.
> > > > > >   Hence the negotiation: If one side has a better idea than a p=
lain
> > > > > >   pipe, we will want to use that.
> > > > > >
> > > > > > - CHECK_DEVICE_STATE: After the state has been transferred thro=
ugh the
> > > > > >   pipe (the end indicated by EOF), the front-end invokes this f=
unction
> > > > > >   to verify success.  There is no in-band way (through the pipe=
) to
> > > > > >   indicate failure, so we need to check explicitly.
> > > > > >
> > > > > > Once the transfer pipe has been established via SET_DEVICE_STAT=
E_FD
> > > > > > (which includes establishing the direction of transfer and migr=
ation
> > > > > > phase), the sending side writes its data into the pipe, and the=
 reading
> > > > > > side reads it until it sees an EOF.  Then, the front-end will c=
heck for
> > > > > > success via CHECK_DEVICE_STATE, which on the destination side i=
ncludes
> > > > > > checking for integrity (i.e. errors during deserialization).
> > > > > >
> > > > > > Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > > Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> > > > > > ---
> > > > > >  include/hw/virtio/vhost-backend.h |  24 +++++
> > > > > >  include/hw/virtio/vhost.h         |  79 ++++++++++++++++
> > > > > >  hw/virtio/vhost-user.c            | 147 ++++++++++++++++++++++=
++++++++
> > > > > >  hw/virtio/vhost.c                 |  37 ++++++++
> > > > > >  4 files changed, 287 insertions(+)
> > > > > >
> > > > > > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/vir=
tio/vhost-backend.h
> > > > > > index ec3fbae58d..5935b32fe3 100644
> > > > > > --- a/include/hw/virtio/vhost-backend.h
> > > > > > +++ b/include/hw/virtio/vhost-backend.h
> > > > > > @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
> > > > > >      VHOST_SET_CONFIG_TYPE_MIGRATION =3D 1,
> > > > > >  } VhostSetConfigType;
> > > > > >
> > > > > > +typedef enum VhostDeviceStateDirection {
> > > > > > +    /* Transfer state from back-end (device) to front-end */
> > > > > > +    VHOST_TRANSFER_STATE_DIRECTION_SAVE =3D 0,
> > > > > > +    /* Transfer state from front-end to back-end (device) */
> > > > > > +    VHOST_TRANSFER_STATE_DIRECTION_LOAD =3D 1,
> > > > > > +} VhostDeviceStateDirection;
> > > > > > +
> > > > > > +typedef enum VhostDeviceStatePhase {
> > > > > > +    /* The device (and all its vrings) is stopped */
> > > > > > +    VHOST_TRANSFER_STATE_PHASE_STOPPED =3D 0,
> > > > > > +} VhostDeviceStatePhase;
> > > > >
> > > > > vDPA has:
> > > > >
> > > > >   /* Suspend a device so it does not process virtqueue requests a=
nymore
> > > > >    *
> > > > >    * After the return of ioctl the device must preserve all the n=
ecessary state
> > > > >    * (the virtqueue vring base plus the possible device specific =
states) that is
> > > > >    * required for restoring in the future. The device must not ch=
ange its
> > > > >    * configuration after that point.
> > > > >    */
> > > > >   #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
> > > > >
> > > > >   /* Resume a device so it can resume processing virtqueue reques=
ts
> > > > >    *
> > > > >    * After the return of this ioctl the device will have restored=
 all the
> > > > >    * necessary states and it is fully operational to continue pro=
cessing the
> > > > >    * virtqueue descriptors.
> > > > >    */
> > > > >   #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
> > > > >
> > > > > I wonder if it makes sense to import these into vhost-user so tha=
t the
> > > > > difference between kernel vhost and vhost-user is minimized. It's=
 okay
> > > > > if one of them is ahead of the other, but it would be nice to avo=
id
> > > > > overlapping/duplicated functionality.
> > > > >
> > > >
> > > > That's what I had in mind in the first versions. I proposed VHOST_S=
TOP
> > > > instead of VHOST_VDPA_STOP for this very reason. Later it did chang=
e
> > > > to SUSPEND.
> > >
> > > I noticed QEMU only calls ioctl(VHOST_VDPA_SUSPEND) and not
> > > ioctl(VHOST_VDPA_RESUME).
> > >
> > > The doc comments in <linux/vdpa.h> don't explain how the device can
> > > leave the suspended state. Can you clarify this?
> > >
> >
> > Do you mean in what situations or regarding the semantics of _RESUME?
> >
> > To me resume is an operation mainly to resume the device in the event
> > of a VM suspension, not a migration. It can be used as a fallback code
> > in some cases of migration failure though, but it is not currently
> > used in qemu.
>
> Is a "VM suspension" the QEMU HMP 'stop' command?
>
> I guess the reason why QEMU doesn't call RESUME anywhere is that it
> resets the device in vhost_dev_stop()?
>

The actual reason for not using RESUME is that the ioctl was added
after the SUSPEND design in qemu. Same as this proposal, it is was not
needed at the time.

In the case of vhost-vdpa net, the only usage of suspend is to fetch
the vq indexes, and in case of error vhost already fetches them from
guest's used ring way before vDPA, so it has little usage.

> Does it make sense to combine SUSPEND and RESUME with Hanna's
> SET_DEVICE_STATE_FD? For example, non-iterative migration works like
> this:
> - Saving the device's state is done by SUSPEND followed by
> SET_DEVICE_STATE_FD. If the guest needs to continue executing (e.g.
> savevm command or migration failed), then RESUME is called to
> continue.

I think the previous steps make sense at vhost_dev_stop, not virtio
savevm handlers. To start spreading this logic to more places of qemu
can bring confusion.

> - Loading the device's state is done by SUSPEND followed by
> SET_DEVICE_STATE_FD, followed by RESUME.
>

I think the restore makes more sense after reset and before driver_ok,
suspend does not seem a right call there. SUSPEND implies there may be
other operations before, so the device may have processed some
requests wrong, as it is not in the right state.

Thanks!


