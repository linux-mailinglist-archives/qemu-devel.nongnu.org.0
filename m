Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F032A6E50A5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 21:10:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poUF0-0006Gs-G2; Mon, 17 Apr 2023 15:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1poUEz-0006Gj-7F
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1poUEx-0005Lf-AS
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681758614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mV64K9EVGqcn7Rj98hEZratnln7tzwSX0IsfUjqd2Es=;
 b=bGi8wwENOa6wIlj8AX1kqUKymkmllE3rSP4VyMqX4WHp4cDmAcmSYQhcB/HlW+niKv6WJT
 b26GtXyKuIvQpg0egeMizlZgS01wmMhlYmh96K51ikV9Z/qOyqjbhT5PzU75B9V98MiXDt
 jePcOpeP1bx4wRO546z7iR+TBBJfyZw=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-F2UgSO8eMBaL-SVqOhiiGw-1; Mon, 17 Apr 2023 15:10:12 -0400
X-MC-Unique: F2UgSO8eMBaL-SVqOhiiGw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-54fde069e4aso90668437b3.3
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 12:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681758612; x=1684350612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mV64K9EVGqcn7Rj98hEZratnln7tzwSX0IsfUjqd2Es=;
 b=ktbpYAys76+RHy1aVktfa991heIXoge/hJ+Gjh66lJoA3nZdizxxAGTqD1ZDvbQLsh
 cv/4Na2nZm3ISFU6/XW0IxpxDjgLX/YDY0p0vw8NYB/aOeA34AA1IwHWHrGMA+lZU/YP
 qkchURrL4EGGIf3c2NxkVtb7NMI4m65LSD+NTWYw7C/E3Ix9l2rE6UEZyj4G6ldTARzQ
 XiVGS5jN0oUug1ZoA5tUVcsc3jfC9m07U2EXzY1M+sIqfxDQUUTRrVzizfqgQ29Xt4mY
 FPec+XBUrJrymu6054H7+US86KKyEHQ3JNZnf8ALg/70Blg2/gAMHMDO2XRbMPYoFy6W
 +m/g==
X-Gm-Message-State: AAQBX9e59vd0geud5H6FlPkl3F6eAwzEb1z6H0GrivceTFNZtsMOPB/x
 qHjjpX6jmYeBOpgRrfV1rL6Yiz17Wnv5LI2LP5CKyDs6PZZUbqWYuD5m5cpQyZXBubJYDzX/cIr
 63y4xreiVeC/L5+aFbCnacCqcDHuUt7o=
X-Received: by 2002:a25:740f:0:b0:b8f:6be0:1732 with SMTP id
 p15-20020a25740f000000b00b8f6be01732mr3330932ybc.2.1681758612177; 
 Mon, 17 Apr 2023 12:10:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZA6dLDjI1umOxzjNvvZ6cBe4xc4MQ1WaWJCPoML+ipvT2oELvpG7JlejI8YZgpbmLMWR3BEIt4qSS5A5/HVy8=
X-Received: by 2002:a25:740f:0:b0:b8f:6be0:1732 with SMTP id
 p15-20020a25740f000000b00b8f6be01732mr3330922ybc.2.1681758611920; Mon, 17 Apr
 2023 12:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
 <20230417153810.GE3852722@fedora>
In-Reply-To: <20230417153810.GE3852722@fedora>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 17 Apr 2023 21:09:35 +0200
Message-ID: <CAJaqyWePM_a7AafP9qS40hmYXKHDyMsvn5g24zk=cH8L6s-kUw@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Hanna Czenczek <hreitz@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>, 
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Mon, Apr 17, 2023 at 5:38=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
>
> On Thu, Apr 13, 2023 at 12:14:24PM +0200, Eugenio Perez Martin wrote:
> > On Wed, Apr 12, 2023 at 11:06=E2=80=AFPM Stefan Hajnoczi <stefanha@redh=
at.com> wrote:
> > >
> > > On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
> > > > So-called "internal" virtio-fs migration refers to transporting the
> > > > back-end's (virtiofsd's) state through qemu's migration stream.  To=
 do
> > > > this, we need to be able to transfer virtiofsd's internal state to =
and
> > > > from virtiofsd.
> > > >
> > > > Because virtiofsd's internal state will not be too large, we believ=
e it
> > > > is best to transfer it as a single binary blob after the streaming
> > > > phase.  Because this method should be useful to other vhost-user
> > > > implementations, too, it is introduced as a general-purpose additio=
n to
> > > > the protocol, not limited to vhost-user-fs.
> > > >
> > > > These are the additions to the protocol:
> > > > - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATORY_S=
TATE:
> > > >   This feature signals support for transferring state, and is added=
 so
> > > >   that migration can fail early when the back-end has no support.
> > > >
> > > > - SET_DEVICE_STATE_FD function: Front-end and back-end negotiate a =
pipe
> > > >   over which to transfer the state.  The front-end sends an FD to t=
he
> > > >   back-end into/from which it can write/read its state, and the bac=
k-end
> > > >   can decide to either use it, or reply with a different FD for the
> > > >   front-end to override the front-end's choice.
> > > >   The front-end creates a simple pipe to transfer the state, but ma=
ybe
> > > >   the back-end already has an FD into/from which it has to write/re=
ad
> > > >   its state, in which case it will want to override the simple pipe=
.
> > > >   Conversely, maybe in the future we find a way to have the front-e=
nd
> > > >   get an immediate FD for the migration stream (in some cases), in =
which
> > > >   case we will want to send this to the back-end instead of creatin=
g a
> > > >   pipe.
> > > >   Hence the negotiation: If one side has a better idea than a plain
> > > >   pipe, we will want to use that.
> > > >
> > > > - CHECK_DEVICE_STATE: After the state has been transferred through =
the
> > > >   pipe (the end indicated by EOF), the front-end invokes this funct=
ion
> > > >   to verify success.  There is no in-band way (through the pipe) to
> > > >   indicate failure, so we need to check explicitly.
> > > >
> > > > Once the transfer pipe has been established via SET_DEVICE_STATE_FD
> > > > (which includes establishing the direction of transfer and migratio=
n
> > > > phase), the sending side writes its data into the pipe, and the rea=
ding
> > > > side reads it until it sees an EOF.  Then, the front-end will check=
 for
> > > > success via CHECK_DEVICE_STATE, which on the destination side inclu=
des
> > > > checking for integrity (i.e. errors during deserialization).
> > > >
> > > > Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> > > > ---
> > > >  include/hw/virtio/vhost-backend.h |  24 +++++
> > > >  include/hw/virtio/vhost.h         |  79 ++++++++++++++++
> > > >  hw/virtio/vhost-user.c            | 147 ++++++++++++++++++++++++++=
++++
> > > >  hw/virtio/vhost.c                 |  37 ++++++++
> > > >  4 files changed, 287 insertions(+)
> > > >
> > > > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/=
vhost-backend.h
> > > > index ec3fbae58d..5935b32fe3 100644
> > > > --- a/include/hw/virtio/vhost-backend.h
> > > > +++ b/include/hw/virtio/vhost-backend.h
> > > > @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
> > > >      VHOST_SET_CONFIG_TYPE_MIGRATION =3D 1,
> > > >  } VhostSetConfigType;
> > > >
> > > > +typedef enum VhostDeviceStateDirection {
> > > > +    /* Transfer state from back-end (device) to front-end */
> > > > +    VHOST_TRANSFER_STATE_DIRECTION_SAVE =3D 0,
> > > > +    /* Transfer state from front-end to back-end (device) */
> > > > +    VHOST_TRANSFER_STATE_DIRECTION_LOAD =3D 1,
> > > > +} VhostDeviceStateDirection;
> > > > +
> > > > +typedef enum VhostDeviceStatePhase {
> > > > +    /* The device (and all its vrings) is stopped */
> > > > +    VHOST_TRANSFER_STATE_PHASE_STOPPED =3D 0,
> > > > +} VhostDeviceStatePhase;
> > >
> > > vDPA has:
> > >
> > >   /* Suspend a device so it does not process virtqueue requests anymo=
re
> > >    *
> > >    * After the return of ioctl the device must preserve all the neces=
sary state
> > >    * (the virtqueue vring base plus the possible device specific stat=
es) that is
> > >    * required for restoring in the future. The device must not change=
 its
> > >    * configuration after that point.
> > >    */
> > >   #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
> > >
> > >   /* Resume a device so it can resume processing virtqueue requests
> > >    *
> > >    * After the return of this ioctl the device will have restored all=
 the
> > >    * necessary states and it is fully operational to continue process=
ing the
> > >    * virtqueue descriptors.
> > >    */
> > >   #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
> > >
> > > I wonder if it makes sense to import these into vhost-user so that th=
e
> > > difference between kernel vhost and vhost-user is minimized. It's oka=
y
> > > if one of them is ahead of the other, but it would be nice to avoid
> > > overlapping/duplicated functionality.
> > >
> >
> > That's what I had in mind in the first versions. I proposed VHOST_STOP
> > instead of VHOST_VDPA_STOP for this very reason. Later it did change
> > to SUSPEND.
>
> I noticed QEMU only calls ioctl(VHOST_VDPA_SUSPEND) and not
> ioctl(VHOST_VDPA_RESUME).
>
> The doc comments in <linux/vdpa.h> don't explain how the device can
> leave the suspended state. Can you clarify this?
>

Do you mean in what situations or regarding the semantics of _RESUME?

To me resume is an operation mainly to resume the device in the event
of a VM suspension, not a migration. It can be used as a fallback code
in some cases of migration failure though, but it is not currently
used in qemu.

Thanks!


