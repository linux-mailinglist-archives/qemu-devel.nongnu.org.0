Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E816E5051
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 20:39:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poTk8-00042t-Uu; Mon, 17 Apr 2023 14:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1poTk7-00042f-1e
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 14:38:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1poTk4-0007Lf-N2
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 14:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681756696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xerx4q0igGv7b3MGGtCdzSOsWpQ/s/01h/aykyuEQVI=;
 b=CHXgi0jfax6GCqZAR1A1SFhny2N6UfQ2oktWG/kNEdWFFibwtNLmsEqu1v0YMTgOm8yADA
 46aXwFEgm0NKw+zf2a9gY8RzP2ynfIwYjOAMR4/WLkHQjZzUJoQzp4QTKDLFaCIA8MqhDj
 NbaN67f2PSB2Nm/SudMynXE8PJdp3Qw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-KKiIQeNSNYiT7Yb_Jpn3IA-1; Mon, 17 Apr 2023 14:38:15 -0400
X-MC-Unique: KKiIQeNSNYiT7Yb_Jpn3IA-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-54fba72c1adso115130787b3.18
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 11:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681756695; x=1684348695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xerx4q0igGv7b3MGGtCdzSOsWpQ/s/01h/aykyuEQVI=;
 b=F1MRggFaXx9plSKl3Lm09Iocwouv6VZpWs3Y7p10V5Vw0XQbNHP4ihJdJy736HgVIi
 p8oGd81uYw1UofwiPsbpGUQafjpqeb8T444G/UbeTSeMzPBXMVdH6HuhD+63AjD5rUlz
 GrW1AKes94Vwwdf7auyzZuj2GTPJ1Mlf22Mg1TAVxOO5qdbkZWCgeke3N9Ctij3T1WuT
 o9N3ccwAU9OrdJhN0fdmNjtJL54fARVn7cemObmTizTslhbN9Xu1qU4LgaTPZ+T9RPNi
 AXDMe7/ptLmSeTIw1Wkbi1Xv7i2CEy0tNRiXxZAbTdtjj574311Yh6GjobK1raSpjqEg
 2YNQ==
X-Gm-Message-State: AAQBX9eLDvFE1r/rXSRj2uJCKYd2r+8UoOBjcNx7pl4g2rr1FfVrzENH
 2ISsnoz74X6ZdWTLZ1XAIrZuFVAKBJn3woBiZT+LrBRUMN+wmNaf6ky1p+XcCvpFZRbTcMM1OIO
 oP+c8mMgsktqHdvvsZIPuktCqynaa5Cc=
X-Received: by 2002:a81:ac5a:0:b0:54f:b56a:cd0f with SMTP id
 z26-20020a81ac5a000000b0054fb56acd0fmr9975503ywj.3.1681756694139; 
 Mon, 17 Apr 2023 11:38:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350ajFpfFVrVNHpcslJxt/C7XSd2ZrzDHSEiRtgRAkyOtxH5rtHPTjLYjEOTNOdBF//w4SXd6bAERqb5eL6yy4ys=
X-Received: by 2002:a81:ac5a:0:b0:54f:b56a:cd0f with SMTP id
 z26-20020a81ac5a000000b0054fb56acd0fmr9975462ywj.3.1681756692991; Mon, 17 Apr
 2023 11:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
 <d9d67f07-3d4c-9bdb-052b-28e21fa27dd6@redhat.com>
In-Reply-To: <d9d67f07-3d4c-9bdb-052b-28e21fa27dd6@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 17 Apr 2023 20:37:36 +0200
Message-ID: <CAJaqyWd9=4BEY5urge2e1qwyFTisjXijnqr762Y-aDAh5WPiWA@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>, 
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
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

On Thu, Apr 13, 2023 at 7:32=E2=80=AFPM Hanna Czenczek <hreitz@redhat.com> =
wrote:
>
> On 13.04.23 12:14, Eugenio Perez Martin wrote:
> > On Wed, Apr 12, 2023 at 11:06=E2=80=AFPM Stefan Hajnoczi <stefanha@redh=
at.com> wrote:
> >> On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
> >>> So-called "internal" virtio-fs migration refers to transporting the
> >>> back-end's (virtiofsd's) state through qemu's migration stream.  To d=
o
> >>> this, we need to be able to transfer virtiofsd's internal state to an=
d
> >>> from virtiofsd.
> >>>
> >>> Because virtiofsd's internal state will not be too large, we believe =
it
> >>> is best to transfer it as a single binary blob after the streaming
> >>> phase.  Because this method should be useful to other vhost-user
> >>> implementations, too, it is introduced as a general-purpose addition =
to
> >>> the protocol, not limited to vhost-user-fs.
> >>>
> >>> These are the additions to the protocol:
> >>> - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATORY_STA=
TE:
> >>>    This feature signals support for transferring state, and is added =
so
> >>>    that migration can fail early when the back-end has no support.
> >>>
> >>> - SET_DEVICE_STATE_FD function: Front-end and back-end negotiate a pi=
pe
> >>>    over which to transfer the state.  The front-end sends an FD to th=
e
> >>>    back-end into/from which it can write/read its state, and the back=
-end
> >>>    can decide to either use it, or reply with a different FD for the
> >>>    front-end to override the front-end's choice.
> >>>    The front-end creates a simple pipe to transfer the state, but may=
be
> >>>    the back-end already has an FD into/from which it has to write/rea=
d
> >>>    its state, in which case it will want to override the simple pipe.
> >>>    Conversely, maybe in the future we find a way to have the front-en=
d
> >>>    get an immediate FD for the migration stream (in some cases), in w=
hich
> >>>    case we will want to send this to the back-end instead of creating=
 a
> >>>    pipe.
> >>>    Hence the negotiation: If one side has a better idea than a plain
> >>>    pipe, we will want to use that.
> >>>
> >>> - CHECK_DEVICE_STATE: After the state has been transferred through th=
e
> >>>    pipe (the end indicated by EOF), the front-end invokes this functi=
on
> >>>    to verify success.  There is no in-band way (through the pipe) to
> >>>    indicate failure, so we need to check explicitly.
> >>>
> >>> Once the transfer pipe has been established via SET_DEVICE_STATE_FD
> >>> (which includes establishing the direction of transfer and migration
> >>> phase), the sending side writes its data into the pipe, and the readi=
ng
> >>> side reads it until it sees an EOF.  Then, the front-end will check f=
or
> >>> success via CHECK_DEVICE_STATE, which on the destination side include=
s
> >>> checking for integrity (i.e. errors during deserialization).
> >>>
> >>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> >>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> >>> ---
> >>>   include/hw/virtio/vhost-backend.h |  24 +++++
> >>>   include/hw/virtio/vhost.h         |  79 ++++++++++++++++
> >>>   hw/virtio/vhost-user.c            | 147 +++++++++++++++++++++++++++=
+++
> >>>   hw/virtio/vhost.c                 |  37 ++++++++
> >>>   4 files changed, 287 insertions(+)
> >>>
> >>> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vh=
ost-backend.h
> >>> index ec3fbae58d..5935b32fe3 100644
> >>> --- a/include/hw/virtio/vhost-backend.h
> >>> +++ b/include/hw/virtio/vhost-backend.h
> >>> @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
> >>>       VHOST_SET_CONFIG_TYPE_MIGRATION =3D 1,
> >>>   } VhostSetConfigType;
> >>>
> >>> +typedef enum VhostDeviceStateDirection {
> >>> +    /* Transfer state from back-end (device) to front-end */
> >>> +    VHOST_TRANSFER_STATE_DIRECTION_SAVE =3D 0,
> >>> +    /* Transfer state from front-end to back-end (device) */
> >>> +    VHOST_TRANSFER_STATE_DIRECTION_LOAD =3D 1,
> >>> +} VhostDeviceStateDirection;
> >>> +
> >>> +typedef enum VhostDeviceStatePhase {
> >>> +    /* The device (and all its vrings) is stopped */
> >>> +    VHOST_TRANSFER_STATE_PHASE_STOPPED =3D 0,
> >>> +} VhostDeviceStatePhase;
> >> vDPA has:
> >>
> >>    /* Suspend a device so it does not process virtqueue requests anymo=
re
> >>     *
> >>     * After the return of ioctl the device must preserve all the neces=
sary state
> >>     * (the virtqueue vring base plus the possible device specific stat=
es) that is
> >>     * required for restoring in the future. The device must not change=
 its
> >>     * configuration after that point.
> >>     */
> >>    #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
> >>
> >>    /* Resume a device so it can resume processing virtqueue requests
> >>     *
> >>     * After the return of this ioctl the device will have restored all=
 the
> >>     * necessary states and it is fully operational to continue process=
ing the
> >>     * virtqueue descriptors.
> >>     */
> >>    #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
> >>
> >> I wonder if it makes sense to import these into vhost-user so that the
> >> difference between kernel vhost and vhost-user is minimized. It's okay
> >> if one of them is ahead of the other, but it would be nice to avoid
> >> overlapping/duplicated functionality.
> >>
> > That's what I had in mind in the first versions. I proposed VHOST_STOP
> > instead of VHOST_VDPA_STOP for this very reason. Later it did change
> > to SUSPEND.
> >
> > Generally it is better if we make the interface less parametrized and
> > we trust in the messages and its semantics in my opinion. In other
> > words, instead of
> > vhost_set_device_state_fd_op(VHOST_TRANSFER_STATE_PHASE_STOPPED), send
> > individually the equivalent of VHOST_VDPA_SUSPEND vhost-user command.
>
> I.e. you mean that this should simply be stateful instead of
> re-affirming the current state with a parameter?
>
> The problem I see is that transferring states in different phases of
> migration will require specialized implementations.  So running
> SET_DEVICE_STATE_FD in a different phase will require support from the
> back-end.  Same in the front-end, the exact protocol and thus
> implementation will (probably, difficult to say at this point) depend on
> the migration phase.  I would therefore prefer to have an explicit
> distinction in the command itself that affirms the phase we=E2=80=99re
> targeting.
>

I think we will have this same problem when more phases are added, as
the fd and direction arguments are always  passed whatever phase you
set. Future phases may not require it, or require different arguments.

> On the other hand, I don=E2=80=99t see the parameter complicating anythin=
g. The
> front-end must supply it, but it will know the phase anyway, so this is
> easy.  The back-end can just choose to ignore it, if it doesn=E2=80=99t f=
eel the
> need to verify that the phase is what it thinks it is.
>
> > Another way to apply this is with the "direction" parameter. Maybe it
> > is better to split it into "set_state_fd" and "get_state_fd"?
>
> Well, it would rather be `set_state_send_fd` and `set_state_receive_fd`.

Right, thanks for the correction.

> We always negotiate a pipe between front-end and back-end, the question
> is just whether the back-end gets the receiving (load) or the sending
> (save) end.
>
> Technically, one can make it fully stateful and say that if the device
> hasn=E2=80=99t been started already, it=E2=80=99s always a LOAD, and othe=
rwise always a
> SAVE.  But as above, I=E2=80=99d prefer to keep the parameter because the
> implementations are different, so I=E2=80=99d prefer there to be a
> re-affirmation that front-end and back-end are in sync about what should
> be done.
>
> Personally, I don=E2=80=99t really see the advantage of having two functi=
ons
> instead of one function with an enum with two values.  The thing about
> SET_DEVICE_STATE_FD is that it itself won=E2=80=99t differ much regardles=
s of
> whether we=E2=80=99re loading or saving, it just negotiates the pipe =E2=
=80=93 the
> difference is what happens after the pipe has been negotiated.  So if we
> split the function into two, both implementations will share most of
> their code anyway, which makes me think it should be a single function.
>

Yes, all of that makes sense.

My proposal was in the line of following other commands like
VHOST_USER_SET_VRING_BASE / VHOST_USER_GET_VRING_BASE or
VHOST_USER_SET_INFLIGHT_FD and VHOST_USER_GET_INFLIGHT_FD. If that has
been considered and it is more convenient to use the arguments I'm
totally fine.

> > In that case, reusing the ioctls as vhost-user messages would be ok.
> > But that puts this proposal further from the VFIO code, which uses
> > "migration_set_state(state)", and maybe it is better when the number
> > of states is high.
>
> I=E2=80=99m not sure what you mean (because I don=E2=80=99t know the VFIO=
 code, I
> assume).  Are you saying that using a more finely grained
> migration_set_state() model would conflict with the rather coarse
> suspend/resume?
>

I don't think it exactly conflicts, as we should be able to map both
to a given set_state. They may overlap if vhost-user decides to use
them. Or if vdpa decides to use SET_DEVICE_STATE_FD.

This already happens with the different vhost backends, each one has a
different way to suspend the device in the case of a migration anyway.

Thanks!

> > BTW, is there any usage for *reply_fd at this moment from the backend?
>
> No, virtiofsd doesn=E2=80=99t plan to make use of it.
>
> Hanna
>


