Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5F6836D1
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 20:50:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMwcy-0007e1-Gd; Tue, 31 Jan 2023 14:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pMwce-0007dZ-Gl
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:48:53 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pMwcc-0005Rz-6s
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:48:52 -0500
Received: by mail-lj1-x22c.google.com with SMTP id h17so17087314ljq.4
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 11:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5UPBdNyaD03yIzLAGGvhg7qlJywnOmIUEThabh/GtoM=;
 b=JCPgu1mRjovmKIxNdvWTkfg5DACeLaPwrJ5Umd5ZNHR+AFqIMnEYliQPIRlsXiVIfT
 AGD7xoIqizA9QEH5VSVHk/tqz5o+js1mlgi2gN4fXZQI02okU+9sTEspmLdsF9wdbxpP
 8+93P6ynmK6KWOBYBNyPWUSJNGVJtqj/ILQ0l6+bcEKQQ7krt+3L4x6r43u8lQ8DQy6L
 JUfb9b2K6kFj3OfyFzAkAzrVGt9BYLctIVHZPicSSIttF7clwEeT+89hLqEsbGrh57dS
 qc1F5uIoQ5JdVtJX73oU2LZgMclD+gIt13YSkLjh05hVpeswtX8gfu5POoZqb6JCbNVb
 vsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5UPBdNyaD03yIzLAGGvhg7qlJywnOmIUEThabh/GtoM=;
 b=pSazmMRCKyDSj4g/xuE9wZ+79jl4PAgArSFaIU8OoKDJhRcSbWHaLgzCOVQ0OjYYXJ
 Ds4FgDrPd/BXsNnWbVeo/BmAhrUvLdfWa8FN+kXlPwbDZjwF/N/b4MHSeGkyD15cyLjY
 hULgPl1ybOiTGtAO6Wt+xKqVzpp/4VbP9xRfz+OBoxyhNVfsJMZIwj8mNaCzBRsmf4NE
 5XW9RiSwRO4MWS1Wr4Ewj1dcTCSPXY5bjSh9ddc4VG2uyEIvmPeRx3hW4B5q78RF8DgB
 d4vMCVkyBJenRn+h5pbEViKPpnaZmb+o7GHCAQV3mYP87JkcLJAvpIQ5nqrhKwxnR262
 c41w==
X-Gm-Message-State: AO0yUKUWenJT5TMEcqYght/is9ux+Nk46RL4IKUZSYezWydD6fsSOz8t
 L/lYwlhOb63NGIRYDHPPz9tIqYS3JYPTSPM7g/s=
X-Google-Smtp-Source: AK7set8RL3YSOzD4HdGeCAmpIBc2CPH0c2+iJIb9Ygio4SnikRFDs/cFg5XETJ/WF8jE2Ard+RM/aWSPd4lbpljJ+9E=
X-Received: by 2002:a2e:b165:0:b0:290:4fce:f881 with SMTP id
 a5-20020a2eb165000000b002904fcef881mr1931916ljm.126.1675194527767; Tue, 31
 Jan 2023 11:48:47 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
 <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
 <874js661lu.fsf@linaro.org>
 <CAJSP0QVN1VVHEms=7p9pwJRDDk6vM+Xvk3Wzi04w7e=+0G+F2g@mail.gmail.com>
In-Reply-To: <CAJSP0QVN1VVHEms=7p9pwJRDDk6vM+Xvk3Wzi04w7e=+0G+F2g@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 31 Jan 2023 23:48:36 +0400
Message-ID: <CAJ+F1C+gfQRpKqG1Nr6tmcHCLjP2dfM3fq-YjKE5-HzkA832hw@mail.gmail.com>
Subject: Re: virtio-sound Google Summer of Code project?
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 chouhan.shreyansh2702@gmail.com, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <Laurent@vivier.eu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi

On Tue, Jan 31, 2023 at 10:20 PM Stefan Hajnoczi <stefanha@gmail.com> wrote=
:
>
> On Tue, 31 Jan 2023 at 12:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> >
> >
> > Stefan Hajnoczi <stefanha@gmail.com> writes:
> >
> > > On Sun, 29 Jan 2023 at 17:10, Stefan Hajnoczi <stefanha@gmail.com> wr=
ote:
> > >>
> > >> Hi Shreyansh, Gerd, and Laurent,
> > >> The last virtio-sound RFC was sent in February last year. It was a
> > >> spare time project. Understandably it's hard to complete the whole
> > >> thing on weekends, evenings, etc. So I wanted to suggest relaunching
> > >> the virtio-sound effort as a Google Summer of Code project.
> > >>
> > >> Google Summer of Code is a 12-week full-time remote work internship.
> > >> The intern would be co-mentored by some (or all) of us. The project
> > >> goal would be to merge virtio-sound with support for both playback a=
nd
> > >> capture. Advanced features for multi-channel audio, etc can be stret=
ch
> > >> goals.
> > >>
> > >> I haven't looked in detail at the patches from February 2022, so I
> > >> don't know the exact state and whether there is enough work remainin=
g
> > >> for a 12-week internship. What do you think?
> > >
> > > Adding Anton.
> > >
> > > I have updated the old wiki page for this project idea and added it t=
o
> > > the 2023 ideas list:
> > > https://wiki.qemu.org/Internships/ProjectIdeas/VirtioSound
> > >
> > > Please let me know if you wish to co-mentor this project!
> >
> > I'd be happy to help - although if someone was rust inclined I'd also b=
e
> > happy to mentor a rust-vmm vhost-user implementation of VirtIO sound.
>
> Maybe Gerd can tell us about the QEMU audio subsystem features that
> may be lost if developing a standalone vhost-user device.
>
> Two things come to mind:
> 1. May not run on all host OSes that QEMU supports if it supports
> fewer native audio APIs than QEMU.

Using GStreamer in Rust is well supported, and should give all the
backends that you ever need (alternatively, there might be some Rust
audio crates that I am not aware of). In all cases, I would not
implement various backends the way QEMU audio/ has grown...

> 2. May not support forwarding audio to remote desktop solutions that
> stream audio over the network. I don't know if/how this works with
> VNC/RDP/Spice, but a separate vhost-user process will need to do extra
> work to send the audio over the remote desktop connection.

Well, some of the goal with `-display dbus` is to move the remote
desktop handling outside of QEMU. I had in mind that the protocol will
have to evolve to handle multiprocess, so audio, display, input etc
interfaces can be provided by external processes. In fact, it should
be possible without protocol change for audio devices with the current
interface (https://gitlab.com/qemu-project/qemu/-/blob/master/ui/dbus-displ=
ay1.xml#L483).

In short, I wish the project implements the device in Rust, with
`gstreamer` and `dbus` as optional features. (that should be
introspectable via --print-capabilities stuff)

--=20
Marc-Andr=C3=A9 Lureau

