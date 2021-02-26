Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7205932679D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 21:01:45 +0100 (CET)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFjJ1-0003QA-Te
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 15:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1lFjGU-0002JE-M3
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:59:08 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:34281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1lFjGP-00072s-Ss
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:59:05 -0500
Received: by mail-ot1-x32c.google.com with SMTP id b16so10230447otq.1
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 11:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j/j9u77DsNCnaG17G8RZbMHhtD6Hj1Dy2kw2ptjKFGM=;
 b=SrwOLHFTt36MnlCaWUcUvg9Rb+L/RFxbmGysfjoVx2AjYWcRajAdZkmIAjk2F4W0RH
 r+vrEgvIZD75fO2VZRvln0+9qVHALJlvl4eWJsOpyj+cOLsr/BoKgsGoYamfoJlLIA3n
 1ZcnPZvinA4DbpSFwerrmvJXcKyQjBczluc9FxTSgfywabegrswpa8qjE+u3evYlu1o2
 u54twms81IUOZsvxNL/z29KDSyIhYquXqh75xflRE08NZqWwwyKhbDq5n2a+t6BLNtBe
 Dym/xceNjzT3cpPqAz05ZHqUUgl1uNWVLEcpxAP5moF9LZleuQc3WKAJjv4vkodRAdai
 dFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j/j9u77DsNCnaG17G8RZbMHhtD6Hj1Dy2kw2ptjKFGM=;
 b=ZRznFJiAaPFDb+mlmtoXtvVLms0yoiGjSP7gdfzRGPsK+NeCJN/xXledj7V7qgvgj3
 UclZZJery7v8W13Qg8Rv8SIq7siR7jQn9HHOKCqNCCcunN2gkeOE/A8lEFCU++GOnhN9
 d2AmkD1iVhjoVmfDOWHTPPyBst7YzBfcz59yg4GD/7iAcIGeXg+RXmngyzgwEGu+26T7
 YSV0mkLe4QDy/CyYC2YgF7Aw1PNz/PgaX1TpvR8RApZXw/qehGwcN+rVZCYFPyo2cch2
 gtjdqfMXPslpQxQH2h/tB7a/WplewUFrPqZEsEgBys30CyBGhN2tCJIpHe4THbc2Y4jD
 cpbQ==
X-Gm-Message-State: AOAM5319GsV1lap6rck6zeZOk08cgOY3wzLOq10XBdVmSjtKdNf7t7od
 KNONx20JL4pVQI6rYIRkUqFNfkMsMqShKeVB7dY=
X-Google-Smtp-Source: ABdhPJxjbIcukcyCGGcrwXlTvNH46VRMMasZ96RKHXJyaSU4olExY5/DcB0dHL5K3P8K9Eir5vtJZ0RfsPionARAywk=
X-Received: by 2002:a05:6830:60b:: with SMTP id
 w11mr3660641oti.326.1614369539949; 
 Fri, 26 Feb 2021 11:58:59 -0800 (PST)
MIME-Version: 1.0
References: <8735xskm7j.fsf@linaro.org> <YDOsP1pWUS+hXiBX@work-vm>
 <871rd86xrf.fsf@linaro.org>
In-Reply-To: <871rd86xrf.fsf@linaro.org>
From: Raphael Norwitz <raphael.s.norwitz@gmail.com>
Date: Fri, 26 Feb 2021 09:58:48 -1000
Message-ID: <CAFubqFuhmDe5=g3_e63rR8hgsYOJMDb3T=oKjs=imb+7zjpLzQ@mail.gmail.com>
Subject: Re: vhost reply_ack negotiation (a.k.a differences in vhost-user
 behaviour with libvhost-user and vhost-user-backend.rs)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=raphael.s.norwitz@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 chirantan@chromium.org, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, keiichiw@chromium.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 dgreid@chromium.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are two sets of features being negotiated - virtio and
vhost-user.  Based on what you've posted here, I suspect the
VHOST_USER_F_PROTOCOL_FEATURES virtio feature may not be negotiated by
the backend, preventing the vhost-user protocol feature negotiation
from happening at all. I'm not 100% sure why this would cause QEMU to
assume that REPLY_ACK was negotiated though.

some questions:

On Mon, Feb 22, 2021 at 3:26 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Dr. David Alan Gilbert <dgilbert@redhat.com> writes:
>
> > * Alex Benn=C3=A9e (alex.bennee@linaro.org) wrote:
> >> Hi,
> >>
> >> I finally got a chance to get down into the guts of vhost-user while
> >> attempting to port my original C RPMB daemon to Rust using the
> >> vhost-user-backend and related crates. I ended up with this hang durin=
g
> >> negotiation:
> >>
> >>   startup
> >>
> >>   vhost_user_write req:1 flags:0x1
> >>   vhost_user_read_start
> >>   vhost_user_read req:1 flags:0x5
> >>   vhost_user_backend_init: we got 170000000
>
> GET_FEATURES

Do we also see a GET_PROTOCOL_FEATURES and a SET_PROTOCOL_FEATURES
message here? If so can you confirm what flags they contained?

vhost-user feature negotiation works as follows (see vhost_user_backend_ini=
t()):

err =3D vhost_user_get_features(dev, &features);
if (err < 0) {
    return err;
}

if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
    dev->backend_features |=3D 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;

    err =3D vhost_user_get_u64(dev, VHOST_USER_GET_PROTOCOL_FEATURES,
                                              &protocol_features);
    if (err < 0) {
        return err;
    }

    dev->protocol_features =3D
        protocol_features & VHOST_USER_PROTOCOL_FEATURE_MASK;
...

    err =3D vhost_user_set_protocol_features(dev, dev->protocol_features);
    if (err < 0) {
         return err;
     }
}

So we first get the virtio features and check if the backend
advertises VHOST_USER_F_PROTOCOL_FEATURES. If it does, we proceed to
negotiate vhost-user features, in which case we should see
GET_PROTOCOL_FEATURES and a SET_PROTOCOL_FEATURES. Otherwise it looks
like the function just returns, and we leave the vhost-user features
uninitialized (presumably zeroed out?), and the backend will never
even receive a GET/SET_PROTOCOL_FEATURES.

dev->protocol_features is not touched anywhere else, and, if
VHOST_USER_F_PROTOCOL_FEATURES is negotiated, comes directly to the
backend from the protocol_features the backend &ed with
VHOST_USER_PROTOCOL_FEATURE_MASK. Therefore if
VHOST_USER_F_PROTOCOL_FEATURES is indeed negotiated here I'm not sure
what could cause QEMU to think REPLY_ACK was negotiated while the
backend does not, spare something obvious like the backend mishandling
the GET/SET_PROTOCOL_FEATURES messages. I briefly checked the rustvmm
code for that and didn't see anything obvious.

mst - are backend devices meant to function if
VHOST_USER_F_PROTOCOL_FEATURES is not advertised? Do we know of any
functioning backend which does not advertise this virtio feature? If
not, maybe we consider failing out here?

alex - Are you sure QEMU gets stuck waiting on a reply_ack message,
and not somewhere else in the setup path? I trust a SET_MEM_TABLE
message was actually received by the backend. Did you confirm that
QEMU was indeed stuck waiting for a reply and not somewhere else later
on?

>
> >>   vhost_user_write req:15 flags:0x1
> >>   vhost_user_read_start
> >>   vhost_user_read req:15 flags:0x5
> >>   vhost_user_set_protocol_features: 2008
> >>   vhost_user_write req:16 flags:0x1
> >>   vhost_user_write req:3 flags:0x1
> >>   vhost_user_write req:1 flags:0x1
> >>   vhost_user_read_start
> >>   vhost_user_read req:1 flags:0x5
> >>   vhost_user_write req:13 flags:0x1
> >>
> >>   kernel initialises device
> >>
> >>   virtio_rpmb virtio1: init done!
> >>   vhost_user_write req:13 flags:0x1
> >>   vhost_dev_set_features: 130000000
> >>   vhost_user_set_features: 130000000
>
> SET_FEATURES

This is setting virtio features - should have nothing to do with REPLY_ACK.

>
> >>   vhost_user_write req:2 flags:0x1
> >>   vhost_user_write req:5 flags:0x9
> >>   vhost_user_read_start
> >>
> <snip>
> >>
> >>  - Should QEMU have preserved VhostUserVirtioFeatures::PROTOCOL_FEATUR=
ES
> >>    when doing the eventual VHOST_USER_SET_FEATURES reply?
> >>
> >>  - Is vhost.rs being to strict or libvhost-user too lax in interpretin=
g
> >>    the negotiated features before processing the ``need_reply`` [Bit 3=
]
> >>    field of the messages?
> >
> > I think vhost.rs is being correctly strict - but there would be no harm
> > in it flagging that you'd hit an inconsistency if it finds a need_reply
> > without the feature.
>
> But the feature should have been negotiated. So unless the slave can
> assume it is enabled because it asked I think QEMU is in the wrong by
> not preserving the feature bits in it's SET_FEATURES reply. We just gets
> away with it with libvhostuser being willing to reply anyway.
>
> >
> >>  - are VHOST_USER_SET_MEM_TABLE to VHOST_USER_SET_INFLIGHT_FD included
> >>    in the "list of the ones that do" require replies or do they only
> >>    reply when REPLY_ACK has been negotiated as the ambiguous "seealso:=
:"
> >>    box out seems to imply?
> >
> > set_mem_table gives a reply when postcopy is enabled (and then qemu
> > replies to the reply!) but otherwise doesn't.
> > (Note there's an issue opened for .rs to support ADD_MEM_REGION
> > since it's a lot better than SET_MEM_TABLE which has a fixed size table
> > that's small).
>
> Thanks for the heads up.
>
> >
> > Dave
> >
> >> Currently I have some hacks in:
> >>
> >>   https://github.com/stsquad/vhost/tree/my-hacks
> >>
> >> which gets my daemon booting up to the point we actually need to do a
> >> transaction. However I won't submit a PR until I've worked out exactly
> >> where the problems are.
> >>
> >> --
> >> Alex Benn=C3=A9e
> >>
>
>
> --
> Alex Benn=C3=A9e
>

