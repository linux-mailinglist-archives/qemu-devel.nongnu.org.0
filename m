Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682B968378F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 21:30:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMxFx-0001nl-1p; Tue, 31 Jan 2023 15:29:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMxFq-0001n7-2n
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:29:23 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMxFl-0004O1-7z
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:29:18 -0500
Received: by mail-yb1-xb33.google.com with SMTP id c124so19638879ybb.13
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 12:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jDtajLbw+EBQ1dYIKmhU0hBBa/JoW2NywJywlGRH+Gk=;
 b=GuUDffQ81aep/9//dqW2+OuB9kETcTfEh3GJnkCa6ic6HV1KLYclMIldBkoJ2TT/FU
 81Fw3KZR9QqI8JtxuYoBNeEhuuY9CtVymP6b4cBvkBMAhFVSZEZh7zo9UynQNdx3FjaG
 NfsMqlXIjjp42fmrL7SKVBBLNdcxoFGdeCBEmgxW6JTk+MvK/LU87yYQDJHMCT8w8jv5
 frwrzUZoSmb5EC9UpMrdG5p8x62j/d0K18WyKXMFTSqG/b5tM/mjbzSWMIpgQYF6OX0m
 Ck35u6ylViJFWFncFyNzaaq+SaHTOUdi3wbjz9GxdlGX4YeSDkQZgfBMbYgtzNtJEMxF
 qkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jDtajLbw+EBQ1dYIKmhU0hBBa/JoW2NywJywlGRH+Gk=;
 b=nmIuQi/X1q7vSUBfc4eHVZf9okc5BXI2UnGjI71z5wOySK/vrdY81BM1IBWVl6Rkks
 88nrJLEsgBuRJjvjNOin16Iae9t7UNr3rMqp06EbJMScqR8qqssMFfbL0DTz8hCqYOwO
 YSk+EHgOAlKCE1yUcId/rsiHQ21dHuIpZb7U/JOV2DBQK7uQsjydK+0aa+0xjdEd1eMs
 tzv5n+pX035R+7zWbLtQ3v4OrXNid41FC5puEk9dH8wdy1cwSGj2XCxgWY6hiSCJdiQv
 J6s7ThsPpiFOAvYo0fQGFC+rXW9wMJRIZWV1l30Y7fStl70pGIloRryDNZUqdVRHs/QD
 LyBQ==
X-Gm-Message-State: AO0yUKUEXwrgzd7pdLT45kcLhNvmGwQ6M4FD4/SMW21QfNv9D6Q7l39I
 Bqr5QN0XfQ/43WliE65rbEthIQCzCeZILR95ks4=
X-Google-Smtp-Source: AK7set8GrCxDqtIpZQQIv67Ow7C9D7+kDMkbDE294jT0TqIDnoEntAzbUSfZ72jEMi/bgPVoWgxEFT55rL50RF+WlQA=
X-Received: by 2002:a5b:a8e:0:b0:803:19fa:2c20 with SMTP id
 h14-20020a5b0a8e000000b0080319fa2c20mr29567ybq.207.1675196955467; Tue, 31 Jan
 2023 12:29:15 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
 <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
 <874js661lu.fsf@linaro.org>
 <CAJSP0QVN1VVHEms=7p9pwJRDDk6vM+Xvk3Wzi04w7e=+0G+F2g@mail.gmail.com>
 <CAJ+F1C+gfQRpKqG1Nr6tmcHCLjP2dfM3fq-YjKE5-HzkA832hw@mail.gmail.com>
In-Reply-To: <CAJ+F1C+gfQRpKqG1Nr6tmcHCLjP2dfM3fq-YjKE5-HzkA832hw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 31 Jan 2023 15:29:03 -0500
Message-ID: <CAJSP0QVa9W0v+FAqCZTz4LZYPeic7k6w2k=4Yk9TqAEwts_v7g@mail.gmail.com>
Subject: Re: virtio-sound Google Summer of Code project?
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 chouhan.shreyansh2702@gmail.com, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <Laurent@vivier.eu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb33.google.com
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

On Tue, 31 Jan 2023 at 14:48, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Jan 31, 2023 at 10:20 PM Stefan Hajnoczi <stefanha@gmail.com> wro=
te:
> >
> > On Tue, 31 Jan 2023 at 12:43, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> > >
> > >
> > > Stefan Hajnoczi <stefanha@gmail.com> writes:
> > >
> > > > On Sun, 29 Jan 2023 at 17:10, Stefan Hajnoczi <stefanha@gmail.com> =
wrote:
> > > >>
> > > >> Hi Shreyansh, Gerd, and Laurent,
> > > >> The last virtio-sound RFC was sent in February last year. It was a
> > > >> spare time project. Understandably it's hard to complete the whole
> > > >> thing on weekends, evenings, etc. So I wanted to suggest relaunchi=
ng
> > > >> the virtio-sound effort as a Google Summer of Code project.
> > > >>
> > > >> Google Summer of Code is a 12-week full-time remote work internshi=
p.
> > > >> The intern would be co-mentored by some (or all) of us. The projec=
t
> > > >> goal would be to merge virtio-sound with support for both playback=
 and
> > > >> capture. Advanced features for multi-channel audio, etc can be str=
etch
> > > >> goals.
> > > >>
> > > >> I haven't looked in detail at the patches from February 2022, so I
> > > >> don't know the exact state and whether there is enough work remain=
ing
> > > >> for a 12-week internship. What do you think?
> > > >
> > > > Adding Anton.
> > > >
> > > > I have updated the old wiki page for this project idea and added it=
 to
> > > > the 2023 ideas list:
> > > > https://wiki.qemu.org/Internships/ProjectIdeas/VirtioSound
> > > >
> > > > Please let me know if you wish to co-mentor this project!
> > >
> > > I'd be happy to help - although if someone was rust inclined I'd also=
 be
> > > happy to mentor a rust-vmm vhost-user implementation of VirtIO sound.
> >
> > Maybe Gerd can tell us about the QEMU audio subsystem features that
> > may be lost if developing a standalone vhost-user device.
> >
> > Two things come to mind:
> > 1. May not run on all host OSes that QEMU supports if it supports
> > fewer native audio APIs than QEMU.
>
> Using GStreamer in Rust is well supported, and should give all the
> backends that you ever need (alternatively, there might be some Rust
> audio crates that I am not aware of). In all cases, I would not
> implement various backends the way QEMU audio/ has grown...
>
> > 2. May not support forwarding audio to remote desktop solutions that
> > stream audio over the network. I don't know if/how this works with
> > VNC/RDP/Spice, but a separate vhost-user process will need to do extra
> > work to send the audio over the remote desktop connection.
>
> Well, some of the goal with `-display dbus` is to move the remote
> desktop handling outside of QEMU. I had in mind that the protocol will
> have to evolve to handle multiprocess, so audio, display, input etc
> interfaces can be provided by external processes. In fact, it should
> be possible without protocol change for audio devices with the current
> interface (https://gitlab.com/qemu-project/qemu/-/blob/master/ui/dbus-dis=
play1.xml#L483).
>
> In short, I wish the project implements the device in Rust, with
> `gstreamer` and `dbus` as optional features. (that should be
> introspectable via --print-capabilities stuff)

Cool, then let's go with a Rust vhost-user device implementation!

Can you elaborate on how the "gstreamer" feature would be used by the
process launching the vhost-user back-end? Do you mean there should be
a standard command-line syntax for specifying the playback and capture
devices that maps directly to GStreamer (e.g. like gst-launch-1.0)?

Stefan

