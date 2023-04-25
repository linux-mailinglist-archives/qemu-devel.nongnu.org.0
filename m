Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A1D6ED945
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 02:17:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr6MY-0006V8-Tl; Mon, 24 Apr 2023 20:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pr6MW-0006UZ-QC
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 20:16:52 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pr6MU-0006kp-Bm
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 20:16:52 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-506bdf29712so38253911a12.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 17:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682381808; x=1684973808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6zDWDSBUMMLwEz1DERtbb9StXgsQDaHmpO0mXK7YTnI=;
 b=EVn/rFPgbcn07lK0L1ELdflUNgj/nmjq294sFhOU33Vq4OqxbQtPfylCmHeJ92fLu/
 KwSn4hCEc5i/vrxN7tptIxpElQgqzpT3IAlO1N8Bqu/URsCwp2MqU1O+msTMCftbZoTF
 FAumUCqLMk5G7V7IRsFl97ubMT1xxooNbIzLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682381808; x=1684973808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6zDWDSBUMMLwEz1DERtbb9StXgsQDaHmpO0mXK7YTnI=;
 b=mDXKgwiOKc06vVG0L1tuS/BBusT1nHe1akmRQBq0jTsqLAQ2I/KJLA0rfpKNysqMCg
 sdRhb4Abzdz2J4on49xroFU4828kaPJYWv7AiMF5xbBxsIFsb6t4YrDSpXXn3qgPmckz
 ChyVbvze/h510C+Mofh96gTKMkI12T59mC/cjGHZ8riWrSnQTygDvhwZ2R5e5TkgMQMj
 n9BJmPxot7/cj0R1Vvre17iUJxfB7uiX4iKx0KjPgeK2xwzCgW9oDVoQdWMoBkrqo4ag
 uvRbTjB7gsZ1NUVO0QpS7CC9i7l1BYUPQE+1jZ8Rm1pvrg71yTt4WK1hIn2WoRMg/3hs
 Abcw==
X-Gm-Message-State: AAQBX9dhwzNRuseqqUiGFR9EzkPsEEibbYeo6NxxuIduUx8/EGqH0a+c
 h+63LYwXLgs9L80Gqw2pqZbboON2PnXA85bQR9I=
X-Google-Smtp-Source: AKy350Zke2QFgzMWsquf1q5He4X+Vsml98sEIrOMmjwNb5fLgGx8BcsK9fMIREnJ/vVMdhEAys08HA==
X-Received: by 2002:a17:906:1149:b0:94a:8e19:6aba with SMTP id
 i9-20020a170906114900b0094a8e196abamr12099648eja.21.1682381808228; 
 Mon, 24 Apr 2023 17:16:48 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 f14-20020a1709062c4e00b009582c49acdasm3524755ejh.47.2023.04.24.17.16.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 17:16:47 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-509cde0f05eso10473a12.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 17:16:47 -0700 (PDT)
X-Received: by 2002:a05:6402:e96:b0:505:863:d85f with SMTP id
 h22-20020a0564020e9600b005050863d85fmr33244eda.4.1682381807543; Mon, 24 Apr
 2023 17:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230421011223.718-1-gurchetansingh@chromium.org>
 <CAJSP0QVrxSgFJFqPd=iBfBoV9brL2v6d6P+4E7BmGYAxwEYPmw@mail.gmail.com>
 <CAAfnVB=n8CJ7cL9kS84TMu1+hBrnWUYhaXAw7jhBPEra_EdgwQ@mail.gmail.com>
 <3204858e-89f4-261c-0863-49aeb28600cf@gmail.com>
In-Reply-To: <3204858e-89f4-261c-0863-49aeb28600cf@gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 24 Apr 2023 17:16:34 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=C=f_ceSVq11daaVU_JOYixbOqwdJ7xmcO4aGO2JijeA@mail.gmail.com>
Message-ID: <CAAfnVB=C=f_ceSVq11daaVU_JOYixbOqwdJ7xmcO4aGO2JijeA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] gfxstream + rutabaga_gfx: a surprising delight
 or startling epiphany?
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, 
 philmd@linaro.org, david@redhat.com, stefanha@redhat.com, kraxel@redhat.com, 
 marcandre.lureau@redhat.com, dmitry.osipenko@collabora.com, ray.huang@amd.com, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=gurchetansingh@chromium.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Apr 22, 2023 at 9:41=E2=80=AFAM Akihiko Odaki <akihiko.odaki@gmail.=
com> wrote:
>
> On 2023/04/22 8:54, Gurchetan Singh wrote:
> > On Fri, Apr 21, 2023 at 9:02=E2=80=AFAM Stefan Hajnoczi <stefanha@gmail=
.com> wrote:
> >>
> >> On Thu, 20 Apr 2023 at 21:13, Gurchetan Singh
> >> <gurchetansingh@chromium.org> wrote:
> >>>
> >>> From: Gurchetan Singh <gurchetansingh@google.com>
> >>>
> >>> Rationale:
> >>>
> >>> - gfxstream [a] is good for the Android Emulator/upstream QEMU
> >>>    alignment
> >>> - Wayland passhthrough [b] via the cross-domain context type is good
> >>>    for Linux on Linux display virtualization
> >>> - rutabaga_gfx [c] sits on top of gfxstream, cross-domain and even
> >>>    virglrenderer
> >>> - This series ports rutabaga_gfx to QEMU
> >>
> >> What rutabaga_gfx and gfxstream? Can you explain where they sit in the
> >> stack and how they build on or complement virtio-gpu and
> >> virglrenderer?
> >
> > rutabaga_gfx and gfxstream are both libraries that implement the
> > virtio-gpu protocol.  There's a document available in the Gitlab issue
> > to see where they fit in the stack [a].
> >
> > gfxstream grew out of the Android Emulator's need to virtualize
> > graphics for app developers.  There's a short history of gfxstream in
> > patch 10.  It complements virglrenderer in that it's a bit more
> > cross-platform and targets different use cases -- more detail here
> > [b].  The ultimate goal is ditch out-of-tree kernel drivers in the
> > Android Emulator and adopt virtio, and porting gfxstream to QEMU would
> > speed up that transition.
>
> I wonder what is motivation for maintaining gfxstream instead of
> switching to virglrenderer/venus.

gfxstream GLES has features that would require significant redesign to
implement in virgl: multi-threading, live migration, widespread CTS
conformance (virgl only works well on FOSS Linux due to TGSI issues),
memory management to name a few.

Re: gfxstream VK and venus, it's a question of minimizing technical
risk.  Going from upstream to a shipping product that works on
MacOS/Windows/Linux means there's always going to be a long tail of
bugs.

The Android Emulator is still on QEMU 2.12 and the update won't be
easy (there are other things that need to be upstreamed besides GPU),
cross-platform API layering over Vulkan is expected to take 1+ year,
Vulkan doesn't work on many GPUs due to KVM issues [a], and no Vulkan
at all support has landed in upstream QEMU.

Probably the most pragmatic way to do this is to take it step by step,
and align over time by sharing components.  There might be a few
proposals to mesa-dev on that front, but getting upstream QEMU working
is a higher priority right now.  A bulk transition from one stack or
the other would be more difficult to pull off.

The great thing about context types/rutabaga_gfx,
gfxstream/virglrenderer details are largely hidden from QEMU and
present little maintenance burden.  Yes, a dependency on a new Rust
library is added, but moving towards Rust makes a ton of sense
security-wise long-term anyways.

[a] https://lore.kernel.org/all/20230330085802.2414466-1-stevensd@google.co=
m/
-- even if this patch lands today, users will still need 1-2 years to
update

>
> >
> > rutabaga_gfx is a much smaller Rust library that sits on top of
> > gfxstream and even virglrenderer, but does a few extra things.  It
> > implements the cross-domain context type, which provides Wayland
> > passthrough.  This helps virtio-gpu by providing more modern display
> > virtualization.  For example, Microsoft for WSL2 also uses a similar
> > technique [c], but I believe it is not virtio-based nor open-source.
>
> The guest side components of WSLg are open-source, but the host side is
> not: https://github.com/microsoft/wslg
> It also uses DirectX for acceleration so it's not really portable for
> outside Windows.
>
> > With this, we can have the same open-source Wayland passthrough
> > solution on crosvm, QEMU and even Fuchsia [d].  Also, there might be
> > an additional small Rust context type for security-sensitive use cases
> > in the future -- rutabaga_gfx wouldn't compile its gfxstream bindings
> > (since it's C++ based) in such cases.
> >
> > Both gfxstream and rutabaga_gfx are a part of the virtio spec [e] now t=
oo.
> >
> > [a] https://gitlab.com/qemu-project/qemu/-/issues/1611
> > [b] https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04271.html
> > [c] https://www.youtube.com/watch?v=3DEkNBsBx501Q
> > [d] https://fuchsia-review.googlesource.com/c/fuchsia/+/778764
> > [e] https://github.com/oasis-tcs/virtio-spec/blob/master/device-types/g=
pu/description.tex#L533
> >
> >>
> >> Stefan

