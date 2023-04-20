Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2613A6E95D8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:28:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUKS-00011Z-8f; Thu, 20 Apr 2023 09:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppUKP-00011J-HZ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppUKL-0001Ze-FO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681997276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCj8/so3V3BjyDPOYC9pwhl/KTvxpI60cM86FPwSqc0=;
 b=fAHbRY/uy1dRYsDPYQiYc+QncqQaIpXZ0wGb+vGpCaCY7P9FG6cFwrn8ViZGavOvaENyBW
 xmdVTNysJ96bVsAIeqBTMjsU/jBj2Nl5uBuuwlOHuBbO0Lk8GPcPFGg4dU8wCJwNcXcEDd
 AjkWUAffn9j2yG3oRIoyeTWB+35ZxUE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-Hp59tQVsM12OQmxe1xgM4A-1; Thu, 20 Apr 2023 09:27:55 -0400
X-MC-Unique: Hp59tQVsM12OQmxe1xgM4A-1
Received: by mail-wm1-f72.google.com with SMTP id
 c20-20020a05600c171400b003f173d94427so2084486wmn.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681997274; x=1684589274;
 h=content-transfer-encoding:mime-version:references:in-reply-to:date
 :cc:to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zCj8/so3V3BjyDPOYC9pwhl/KTvxpI60cM86FPwSqc0=;
 b=T9vnOdaDo3NTH3VvXAL3R8QhAgAGRFSj7wBWEo2c33dh2JuEXJjWTfhkYo62xs+VGQ
 Wcs1SmnOh3k1M3wdgQsA3tYXU102G98pw90zxCAhOGVp0vRmaDtNnu2KtZkMHUxrImQo
 T6tPaQLyCNrXGNrE4MpgbDHMFGbKF9CaCYDso5igP8ft/jIfqIX/JDMdHm08FYImqQl+
 BvRPMZcNfSv9J9xPUIu0XBK334lXg/rXyp4VoHgYURh+B0lnp0oSHwqB5qOgiodlrrSv
 juSrljY7qwF0UWnzCwRFKGDWLN5N5SGBtrZMQ53KNTMc8NFSdwvjjZe8DlR0eEyRwnBR
 YZ+w==
X-Gm-Message-State: AAQBX9cXPGVNAO1hRbomUVESCMZSdObBuwryc0GbcSo06dnvga9qwyv+
 Kni2zVsMphA1dSQPp/4bPrIJWgtAnzU4Gmdf47dc6728vMErIIpYm4ftRlv8PXCooa1cSPeeh+x
 WtL65tsVv9xqVyms=
X-Received: by 2002:a7b:cb02:0:b0:3f1:7a50:dd66 with SMTP id
 u2-20020a7bcb02000000b003f17a50dd66mr1465657wmj.27.1681997273982; 
 Thu, 20 Apr 2023 06:27:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350ayo7oN+yr8uYvR+Xz+NeUqOD+GzMSJu+UD2pTc0lqk3339RSsQUjQkmXeQjELZuLfRVGoZPQ==
X-Received: by 2002:a7b:cb02:0:b0:3f1:7a50:dd66 with SMTP id
 u2-20020a7bcb02000000b003f17a50dd66mr1465632wmj.27.1681997273609; 
 Thu, 20 Apr 2023 06:27:53 -0700 (PDT)
Received: from eperezma.remote.csb ([79.116.3.213])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003f182cc55c4sm2062451wmj.12.2023.04.20.06.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 06:27:53 -0700 (PDT)
Message-ID: <a95c1ad494ce5f8d7f27af788708966e7ba1925a.camel@redhat.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
From: Eugenio =?ISO-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Hanna Czenczek
 <hreitz@redhat.com>,  qemu-devel@nongnu.org, virtio-fs@redhat.com, German
 Maglione <gmaglione@redhat.com>,  Anton Kuchin
 <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>, "Michael
 S . Tsirkin" <mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 20 Apr 2023 15:27:51 +0200
In-Reply-To: <CAJSP0QWx_9TJa_0QRfhNg6JQemAWCc0ZagvkSxj15bbM5tGD4w@mail.gmail.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
 <20230417153810.GE3852722@fedora>
 <CAJaqyWePM_a7AafP9qS40hmYXKHDyMsvn5g24zk=cH8L6s-kUw@mail.gmail.com>
 <CAJSP0QWUfxzad3EmT3r1hhaWmXDQt9Nj1LRPhPs_w79S9GAb1A@mail.gmail.com>
 <CAJaqyWfaDVZDJtMvPUhdRE283e80rB3WFd3RF9i=buaBYG=PKA@mail.gmail.com>
 <20230418175924.GB4041499@fedora>
 <CAJaqyWd9Ec7hpfv_NUDxOuwK4weyRTm-cVNOuv8VTiGVzyYjHQ@mail.gmail.com>
 <CAJSP0QWx_9TJa_0QRfhNg6JQemAWCc0ZagvkSxj15bbM5tGD4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2023-04-18 at 16:40 -0400, Stefan Hajnoczi wrote:
> On Tue, 18 Apr 2023 at 14:31, Eugenio Perez Martin <eperezma@redhat.com>
> wrote:
> > On Tue, Apr 18, 2023 at 7:59 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > On Tue, Apr 18, 2023 at 10:09:30AM +0200, Eugenio Perez Martin wrote:
> > > > On Mon, Apr 17, 2023 at 9:33 PM Stefan Hajnoczi <stefanha@gmail.com>
> > > > wrote:
> > > > > On Mon, 17 Apr 2023 at 15:10, Eugenio Perez Martin <
> > > > > eperezma@redhat.com> wrote:
> > > > > > On Mon, Apr 17, 2023 at 5:38 PM Stefan Hajnoczi <stefanha@redhat.com
> > > > > > > wrote:
> > > > > > > On Thu, Apr 13, 2023 at 12:14:24PM +0200, Eugenio Perez Martin
> > > > > > > wrote:
> > > > > > > > On Wed, Apr 12, 2023 at 11:06 PM Stefan Hajnoczi <
> > > > > > > > stefanha@redhat.com> wrote:
> > > > > > > > > On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek
> > > > > > > > > wrote:
> > > > > > > > > > So-called "internal" virtio-fs migration refers to
> > > > > > > > > > transporting the
> > > > > > > > > > back-end's (virtiofsd's) state through qemu's migration
> > > > > > > > > > stream.  To do
> > > > > > > > > > this, we need to be able to transfer virtiofsd's internal
> > > > > > > > > > state to and
> > > > > > > > > > from virtiofsd.
> > > > > > > > > > 
> > > > > > > > > > Because virtiofsd's internal state will not be too large, we
> > > > > > > > > > believe it
> > > > > > > > > > is best to transfer it as a single binary blob after the
> > > > > > > > > > streaming
> > > > > > > > > > phase.  Because this method should be useful to other vhost-
> > > > > > > > > > user
> > > > > > > > > > implementations, too, it is introduced as a general-purpose
> > > > > > > > > > addition to
> > > > > > > > > > the protocol, not limited to vhost-user-fs.
> > > > > > > > > > 
> > > > > > > > > > These are the additions to the protocol:
> > > > > > > > > > - New vhost-user protocol feature
> > > > > > > > > > VHOST_USER_PROTOCOL_F_MIGRATORY_STATE:
> > > > > > > > > >   This feature signals support for transferring state, and
> > > > > > > > > > is added so
> > > > > > > > > >   that migration can fail early when the back-end has no
> > > > > > > > > > support.
> > > > > > > > > > 
> > > > > > > > > > - SET_DEVICE_STATE_FD function: Front-end and back-end
> > > > > > > > > > negotiate a pipe
> > > > > > > > > >   over which to transfer the state.  The front-end sends an
> > > > > > > > > > FD to the
> > > > > > > > > >   back-end into/from which it can write/read its state, and
> > > > > > > > > > the back-end
> > > > > > > > > >   can decide to either use it, or reply with a different FD
> > > > > > > > > > for the
> > > > > > > > > >   front-end to override the front-end's choice.
> > > > > > > > > >   The front-end creates a simple pipe to transfer the state,
> > > > > > > > > > but maybe
> > > > > > > > > >   the back-end already has an FD into/from which it has to
> > > > > > > > > > write/read
> > > > > > > > > >   its state, in which case it will want to override the
> > > > > > > > > > simple pipe.
> > > > > > > > > >   Conversely, maybe in the future we find a way to have the
> > > > > > > > > > front-end
> > > > > > > > > >   get an immediate FD for the migration stream (in some
> > > > > > > > > > cases), in which
> > > > > > > > > >   case we will want to send this to the back-end instead of
> > > > > > > > > > creating a
> > > > > > > > > >   pipe.
> > > > > > > > > >   Hence the negotiation: If one side has a better idea than
> > > > > > > > > > a plain
> > > > > > > > > >   pipe, we will want to use that.
> > > > > > > > > > 
> > > > > > > > > > - CHECK_DEVICE_STATE: After the state has been transferred
> > > > > > > > > > through the
> > > > > > > > > >   pipe (the end indicated by EOF), the front-end invokes
> > > > > > > > > > this function
> > > > > > > > > >   to verify success.  There is no in-band way (through the
> > > > > > > > > > pipe) to
> > > > > > > > > >   indicate failure, so we need to check explicitly.
> > > > > > > > > > 
> > > > > > > > > > Once the transfer pipe has been established via
> > > > > > > > > > SET_DEVICE_STATE_FD
> > > > > > > > > > (which includes establishing the direction of transfer and
> > > > > > > > > > migration
> > > > > > > > > > phase), the sending side writes its data into the pipe, and
> > > > > > > > > > the reading
> > > > > > > > > > side reads it until it sees an EOF.  Then, the front-end
> > > > > > > > > > will check for
> > > > > > > > > > success via CHECK_DEVICE_STATE, which on the destination
> > > > > > > > > > side includes
> > > > > > > > > > checking for integrity (i.e. errors during deserialization).
> > > > > > > > > > 
> > > > > > > > > > Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > > > > > > Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> > > > > > > > > > ---
> > > > > > > > > >  include/hw/virtio/vhost-backend.h |  24 +++++
> > > > > > > > > >  include/hw/virtio/vhost.h         |  79 ++++++++++++++++
> > > > > > > > > >  hw/virtio/vhost-user.c            | 147
> > > > > > > > > > ++++++++++++++++++++++++++++++
> > > > > > > > > >  hw/virtio/vhost.c                 |  37 ++++++++
> > > > > > > > > >  4 files changed, 287 insertions(+)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/include/hw/virtio/vhost-backend.h
> > > > > > > > > > b/include/hw/virtio/vhost-backend.h
> > > > > > > > > > index ec3fbae58d..5935b32fe3 100644
> > > > > > > > > > --- a/include/hw/virtio/vhost-backend.h
> > > > > > > > > > +++ b/include/hw/virtio/vhost-backend.h
> > > > > > > > > > @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
> > > > > > > > > >      VHOST_SET_CONFIG_TYPE_MIGRATION = 1,
> > > > > > > > > >  } VhostSetConfigType;
> > > > > > > > > > 
> > > > > > > > > > +typedef enum VhostDeviceStateDirection {
> > > > > > > > > > +    /* Transfer state from back-end (device) to front-end
> > > > > > > > > > */
> > > > > > > > > > +    VHOST_TRANSFER_STATE_DIRECTION_SAVE = 0,
> > > > > > > > > > +    /* Transfer state from front-end to back-end (device)
> > > > > > > > > > */
> > > > > > > > > > +    VHOST_TRANSFER_STATE_DIRECTION_LOAD = 1,
> > > > > > > > > > +} VhostDeviceStateDirection;
> > > > > > > > > > +
> > > > > > > > > > +typedef enum VhostDeviceStatePhase {
> > > > > > > > > > +    /* The device (and all its vrings) is stopped */
> > > > > > > > > > +    VHOST_TRANSFER_STATE_PHASE_STOPPED = 0,
> > > > > > > > > > +} VhostDeviceStatePhase;
> > > > > > > > > 
> > > > > > > > > vDPA has:
> > > > > > > > > 
> > > > > > > > >   /* Suspend a device so it does not process virtqueue
> > > > > > > > > requests anymore
> > > > > > > > >    *
> > > > > > > > >    * After the return of ioctl the device must preserve all
> > > > > > > > > the necessary state
> > > > > > > > >    * (the virtqueue vring base plus the possible device
> > > > > > > > > specific states) that is
> > > > > > > > >    * required for restoring in the future. The device must not
> > > > > > > > > change its
> > > > > > > > >    * configuration after that point.
> > > > > > > > >    */
> > > > > > > > >   #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
> > > > > > > > > 
> > > > > > > > >   /* Resume a device so it can resume processing virtqueue
> > > > > > > > > requests
> > > > > > > > >    *
> > > > > > > > >    * After the return of this ioctl the device will have
> > > > > > > > > restored all the
> > > > > > > > >    * necessary states and it is fully operational to continue
> > > > > > > > > processing the
> > > > > > > > >    * virtqueue descriptors.
> > > > > > > > >    */
> > > > > > > > >   #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
> > > > > > > > > 
> > > > > > > > > I wonder if it makes sense to import these into vhost-user so
> > > > > > > > > that the
> > > > > > > > > difference between kernel vhost and vhost-user is minimized.
> > > > > > > > > It's okay
> > > > > > > > > if one of them is ahead of the other, but it would be nice to
> > > > > > > > > avoid
> > > > > > > > > overlapping/duplicated functionality.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > That's what I had in mind in the first versions. I proposed
> > > > > > > > VHOST_STOP
> > > > > > > > instead of VHOST_VDPA_STOP for this very reason. Later it did
> > > > > > > > change
> > > > > > > > to SUSPEND.
> > > > > > > 
> > > > > > > I noticed QEMU only calls ioctl(VHOST_VDPA_SUSPEND) and not
> > > > > > > ioctl(VHOST_VDPA_RESUME).
> > > > > > > 
> > > > > > > The doc comments in <linux/vdpa.h> don't explain how the device
> > > > > > > can
> > > > > > > leave the suspended state. Can you clarify this?
> > > > > > > 
> > > > > > 
> > > > > > Do you mean in what situations or regarding the semantics of
> > > > > > _RESUME?
> > > > > > 
> > > > > > To me resume is an operation mainly to resume the device in the
> > > > > > event
> > > > > > of a VM suspension, not a migration. It can be used as a fallback
> > > > > > code
> > > > > > in some cases of migration failure though, but it is not currently
> > > > > > used in qemu.
> > > > > 
> > > > > Is a "VM suspension" the QEMU HMP 'stop' command?
> > > > > 
> > > > > I guess the reason why QEMU doesn't call RESUME anywhere is that it
> > > > > resets the device in vhost_dev_stop()?
> > > > > 
> > > > 
> > > > The actual reason for not using RESUME is that the ioctl was added
> > > > after the SUSPEND design in qemu. Same as this proposal, it is was not
> > > > needed at the time.
> > > > 
> > > > In the case of vhost-vdpa net, the only usage of suspend is to fetch
> > > > the vq indexes, and in case of error vhost already fetches them from
> > > > guest's used ring way before vDPA, so it has little usage.
> > > > 
> > > > > Does it make sense to combine SUSPEND and RESUME with Hanna's
> > > > > SET_DEVICE_STATE_FD? For example, non-iterative migration works like
> > > > > this:
> > > > > - Saving the device's state is done by SUSPEND followed by
> > > > > SET_DEVICE_STATE_FD. If the guest needs to continue executing (e.g.
> > > > > savevm command or migration failed), then RESUME is called to
> > > > > continue.
> > > > 
> > > > I think the previous steps make sense at vhost_dev_stop, not virtio
> > > > savevm handlers. To start spreading this logic to more places of qemu
> > > > can bring confusion.
> > > 
> > > I don't think there is a way around extending the QEMU vhost's code
> > > model. The current model in QEMU's vhost code is that the backend is
> > > reset when the VM stops. This model worked fine for stateless devices
> > > but it doesn't work for stateful devices.
> > > 
> > > Imagine a vdpa-gpu device: you cannot reset the device in
> > > vhost_dev_stop() and expect the GPU to continue working when
> > > vhost_dev_start() is called again because all its state has been lost.
> > > The guest driver will send requests that references a virtio-gpu
> > > resources that no longer exist.
> > > 
> > > One solution is to save the device's state in vhost_dev_stop(). I think
> > > this is what you're suggesting. It requires keeping a copy of the state
> > > and then loading the state again in vhost_dev_start(). I don't think
> > > this approach should be used because it requires all stateful devices to
> > > support live migration (otherwise they break across HMP 'stop'/'cont').
> > > Also, the device state for some devices may be large and it would also
> > > become more complicated when iterative migration is added.
> > > 
> > > Instead, I think the QEMU vhost code needs to be structured so that
> > > struct vhost_dev has a suspended state:
> > > 
> > >         ,---------.
> > >         v         |
> > >   started ------> stopped
> > >     \   ^
> > >      \  |
> > >       -> suspended
> > > 
> > > The device doesn't lose state when it enters the suspended state. It can
> > > be resumed again.
> > > 
> > > This is why I think SUSPEND/RESUME need to be part of the solution.

I just realize that we can add an arrow from suspended to stopped, isn't it?
"Started" before seems to imply the device may process descriptors after
suspend.

> > 
> > I agree with all of this, especially after realizing vhost_dev_stop is
> > called before the last request of the state in the iterative
> > migration.
> > 
> > However I think we can move faster with the virtiofsd migration code,
> > as long as we agree on the vhost-user messages it will receive. This
> > is because we already agree that the state will be sent in one shot
> > and not iteratively, so it will be small.
> > 
> > I understand this may change in the future, that's why I proposed to
> > start using iterative right now. However it may make little sense if
> > it is not used in the vhost-user device. I also understand that other
> > devices may have a bigger state so it will be needed for them.
> 
> Can you summarize how you'd like save to work today? I'm not sure what
> you have in mind.
> 

I think we're trying to find a solution that satisfies many things.  On one
side, we're assuming that the virtiofsd state will be small enough to be
assumable it will not require iterative migration in the short term.  However,
we also want to support iterative migration, for the shake of *other* future
vhost devices that may need it.

I also think we should prioritize the protocols stability, in the sense of not
adding calls that we will not reuse for iterative LM.  Being vhost-user protocol
more important to maintain than the qemu migration.

To implement the changes you mention will be needed in the future.  But we have
already set that the virtiofsd is small, so we can just fetch them by the same
time than we send VHOST_USER_GET_VRING_BASE message and send the status with the
proposed non-iterative approach.

If we agree on that, now the question is how to fetch them from the device.  The
answers are a little bit scattered in the mail threads, but I think we agree on:
a) We need to signal that the device must stop processing requests.
b) We need a way for the device to dump the state.

At this moment I think any proposal satisfies a), and pipe satisfies better b). 
With proper backend feature flags, the device may support to start writing to
the pipe before SUSPEND so we can implement iterative migration on top.

Does that makes sense?

Thanks!


