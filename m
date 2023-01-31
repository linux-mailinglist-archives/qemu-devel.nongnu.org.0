Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BD468358C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:46:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMvdg-0007ZE-UK; Tue, 31 Jan 2023 13:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMvdY-0007Y6-DC
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:45:44 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMvdW-0000A8-Ki
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:45:44 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-50660e2d2ffso216108287b3.1
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r+MUzyuvpcDNx/nTLcdAhJ7BBBXlGm6jiNWLrOShxMk=;
 b=me+ySS7UlNLNPBVj7V7m1/DCw1xtKHt8Y4nah3N1JCVeEy6JH8C1OtAE4r5e3bD8QC
 bPQC1KJL9JxeiNrPQ6JJiBjSmgny2ZWGBwOJnoR3iH0ji3eUr5IRyRipzlwSAl438w77
 WahLk2K5lOKLoBvk1KRO0XPOK5AlndXNU1gXiFPoKwtTMVZBkRGmOMds3Am5ZLkFIN2w
 wSDdpXd384jQV7kVyzezRgdhwj3XAiH+nSU4WMuZ0t5mdGVYovLmTyC/kzt/eimJkCK7
 d2m8XJ2iKqE/adGPVHytf+2r/wev4Vqv9rWh1RS4kg7rCaahrHOoUiWDA5TLOyYmFM9c
 M6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r+MUzyuvpcDNx/nTLcdAhJ7BBBXlGm6jiNWLrOShxMk=;
 b=ZdAR4mdVjtAPVd/uKgLgGFo+brBetQw/n8YjC+BdAZ6LkNn4CB52v64fSArb1Jyhcc
 /6FRJCULZjEHx1YG71j7siMcJnWJlVEPWO34ML81us3albb1S0CyLnl6TnRn74nKx/cs
 T+505OxLhqNrH1uIxpuCMsAN0M96OEjgiRYsLl4WmnYAXT0/HbOm9BWuwsh06sEP0yKJ
 r8LRhbveIZrGSpnXSeG1egD1Jt1VA012zeRkDnzwuw0wygll2PlucNAufeOjn4AN+e8E
 qAx2yec2G1ZAlVIZNSd/Vzf02YP081Mxykci+LPsbeXEm3Mauukq+wco9Hrup0Qbwm+a
 RIlw==
X-Gm-Message-State: AFqh2kr4n4ocreMJxBim+i2mix+cZOlucRsKHtAeKh3Ldn+7zHAo57RA
 XXUbL6BA+2z8njUJc4DvTO+froeUsyH74+EIwVE=
X-Google-Smtp-Source: AMrXdXt84QekGifJ5RhVgwXO3sYxBRzuYB3faD5k0YnQ2RHdz0A/EFzYL4O3SvxxEGmqOVuIFve1n8fY9pxPhZwBwYU=
X-Received: by 2002:a81:1e90:0:b0:489:e4c5:45ca with SMTP id
 e138-20020a811e90000000b00489e4c545camr7085877ywe.336.1675190741574; Tue, 31
 Jan 2023 10:45:41 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
 <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
 <874js661lu.fsf@linaro.org>
 <CAJSP0QVN1VVHEms=7p9pwJRDDk6vM+Xvk3Wzi04w7e=+0G+F2g@mail.gmail.com>
 <87h6w6tui9.fsf@linaro.org>
In-Reply-To: <87h6w6tui9.fsf@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 31 Jan 2023 13:45:29 -0500
Message-ID: <CAJSP0QUC7g5DQFQgz77Xkw8j96teUuc53e7XB2sFPXXWy5kDPw@mail.gmail.com>
Subject: Re: virtio-sound Google Summer of Code project?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: chouhan.shreyansh2702@gmail.com, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <Laurent@vivier.eu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112e.google.com
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

On Tue, 31 Jan 2023 at 13:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
> > On Tue, 31 Jan 2023 at 12:43, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >>
> >> Stefan Hajnoczi <stefanha@gmail.com> writes:
> >>
> >> > On Sun, 29 Jan 2023 at 17:10, Stefan Hajnoczi <stefanha@gmail.com> w=
rote:
> >> >>
> >> >> Hi Shreyansh, Gerd, and Laurent,
> >> >> The last virtio-sound RFC was sent in February last year. It was a
> >> >> spare time project. Understandably it's hard to complete the whole
> >> >> thing on weekends, evenings, etc. So I wanted to suggest relaunchin=
g
> >> >> the virtio-sound effort as a Google Summer of Code project.
> >> >>
> >> >> Google Summer of Code is a 12-week full-time remote work internship=
.
> >> >> The intern would be co-mentored by some (or all) of us. The project
> >> >> goal would be to merge virtio-sound with support for both playback =
and
> >> >> capture. Advanced features for multi-channel audio, etc can be stre=
tch
> >> >> goals.
> >> >>
> >> >> I haven't looked in detail at the patches from February 2022, so I
> >> >> don't know the exact state and whether there is enough work remaini=
ng
> >> >> for a 12-week internship. What do you think?
> >> >
> >> > Adding Anton.
> >> >
> >> > I have updated the old wiki page for this project idea and added it =
to
> >> > the 2023 ideas list:
> >> > https://wiki.qemu.org/Internships/ProjectIdeas/VirtioSound
> >> >
> >> > Please let me know if you wish to co-mentor this project!
> >>
> >> I'd be happy to help - although if someone was rust inclined I'd also =
be
> >> happy to mentor a rust-vmm vhost-user implementation of VirtIO sound.
> >
> > Maybe Gerd can tell us about the QEMU audio subsystem features that
> > may be lost if developing a standalone vhost-user device.
> >
> > Two things come to mind:
> > 1. May not run on all host OSes that QEMU supports if it supports
> > fewer native audio APIs than QEMU.
> > 2. May not support forwarding audio to remote desktop solutions that
> > stream audio over the network. I don't know if/how this works with
> > VNC/RDP/Spice, but a separate vhost-user process will need to do extra
> > work to send the audio over the remote desktop connection.
>
> Hmm good point. Maybe a stretch goal?

Let's see what Gerd and Marc-Andr=C3=A9 think. It would be nice to
implement the device in Rust...

Stefan

