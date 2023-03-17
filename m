Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AE06BF70E
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 01:51:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdKm7-0002cn-Dn; Fri, 17 Mar 2023 20:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@google.com>)
 id 1pdHoK-0006G7-Pw
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 17:40:28 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@google.com>)
 id 1pdHoF-0001EY-Hk
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 17:40:26 -0400
Received: by mail-ed1-x529.google.com with SMTP id ek18so25500779edb.6
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 14:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679089220;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xe9kR2CMAbPoM5zRSMGdI2E26KBlU4RkpCgdhiDt4q0=;
 b=D/LEMqj72Q9EYGVhbc1E5Mr0PwPi7UMmbTP7jVOI3WglFSaSc6ea2AE66L++ZvRnXA
 uESk2wT/As3r8Kc0vMrjt+pggFo39LumQ66kjmav5QjP8La+sQysa09/y70cV/lb1OhA
 o1Pkrh0uXvXBSHT3c7/222/z4gi33WjozH/7qw8ZiH4QavkD89vq5+uLIJObg6muqYTG
 2Mlqpp46HosWShLy9L9q+0jFUnfthjTiwgCsP9hnI3AyzPco6Jz1uXSpsT24ONNrrlg0
 nUP76wc12F/me13nwhXvAMniLEYoM4uwwQc8TDxrUBRhBAwVvoNI7dxdDq5jqYDBAOyL
 rXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679089220;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xe9kR2CMAbPoM5zRSMGdI2E26KBlU4RkpCgdhiDt4q0=;
 b=Ne8lAeHEXS6E+F/XqKTF7jbWMbxMW8Cbgq8HyY4jknLnUXsjfBYe+KAmgptnJjav21
 6jmlJANRqkRBfCiyxaAboOASpQaDPx7y9RVweKLXyOQtOrK8eRIF3EqEjHkcgd8V2HjR
 yWGeb7Zz8wI8phWmKUnXjLWszxlc7kvF7lYz7p1ev8wfKaP00O8Uj5DiuxWeuc75/vKI
 jFQS2t5RMgylQwEUCyLt0sSeK9A4zuu7BCS7+VULQ2wOqmba/x4QctjU2Zo05aBUqD3m
 oPILPDL3XAT3d30cKvjz2zsEW/BE62HomXwuSBzCKd8eEX6wKDToWeSyTxiXX5cQhUkp
 kewQ==
X-Gm-Message-State: AO0yUKUoiUy9xlGHWvv9dU9/PIT2k3ccD0RKjWimp4m8jrqYM9ElwwTm
 U8EOiUfvsHgulho9XJYF+8cJtppQMDkqx2W8VP3I3w==
X-Google-Smtp-Source: AK7set+U1wo42oyW9xyCIHc55VTGTj2PMzIvsmZYqxA4EjuEENjIBBnq9pdFWEiDYPmWyJULYI23Z4r41eHR5pf4wJ8=
X-Received: by 2002:a17:906:fca8:b0:92f:cbfe:1635 with SMTP id
 qw8-20020a170906fca800b0092fcbfe1635mr427514ejb.6.1679089220458; Fri, 17 Mar
 2023 14:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <877cx46jjg.fsf@linaro.org>
 <fc74d071-2563-ee8c-ab7e-c5d4a2f3b0cc@collabora.com>
 <CAAfnVBmiB=fokNztOj4XR=6d1U7JFGK9Z0wcyfVYBu_bDmWPbQ@mail.gmail.com>
 <CAJ+F1C+v9tM2FezYoGJ+yAPPoNzT6foPoyJ-_WvS+kTcBSJgPg@mail.gmail.com>
 <CAAfnVBmueH6M_SAmiK0CE77c_yZN-cFLRKMtbtArJb8StjpaDw@mail.gmail.com>
In-Reply-To: <CAAfnVBmueH6M_SAmiK0CE77c_yZN-cFLRKMtbtArJb8StjpaDw@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@google.com>
Date: Fri, 17 Mar 2023 14:40:09 -0700
Message-ID: <CAAfnVBnA5J7NO3FdEh3-PP5_GO3uda-Gs_zdFrLj5C6j6-DOLQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] virtio-gpu: Support Venus Vulkan driver
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 gert.wollny@collabora.com, qemu-devel@nongnu.org, mjt@tls.msk.ru, 
 pkg-qemu-devel@alioth-lists.debian.net
Content-Type: multipart/alternative; boundary="00000000000088b7fc05f71f6c15"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=gurchetansingh@google.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 17 Mar 2023 20:50:21 -0400
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

--00000000000088b7fc05f71f6c15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 11:44=E2=80=AFAM Gurchetan Singh <
gurchetansingh@chromium.org> wrote:

> On Mon, Mar 13, 2023 at 5:58=E2=80=AFAM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi Gurchetan
> >
> > On Tue, Mar 7, 2023 at 2:41=E2=80=AFAM Gurchetan Singh
> > <gurchetansingh@chromium.org> wrote:
> > >
> > > On Tue, Jan 31, 2023 at 3:15=E2=80=AFPM Dmitry Osipenko
> > > <dmitry.osipenko@collabora.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > On 1/30/23 20:00, Alex Benn=C3=A9e wrote:
> > > > >
> > > > > Antonio Caggiano <antonio.caggiano@collabora.com> writes:
> > > > >
> > > > >> This series of patches enables support for the Venus VirtIO-GPU
> Vulkan
> > > > >> driver by adding some features required by the driver:
> > > > >>
> > > > >> - CONTEXT_INIT
> > > > >> - HOSTMEM
> > > > >> - RESOURCE_UUID
> > > > >> - BLOB_RESOURCES
> > > > >>
> > > > >> In addition to these features, Venus capset support was required
> > > > >> together with the implementation for Virgl blob resource command=
s.
> > > > >
> > > > > I managed to apply to current master but I needed a bunch of
> patches to
> > > > > get it to compile with my old virgl:
> > > >
> > > > Thank you for reviewing and testing the patches! Antonio isn't
> working
> > > > on Venus anymore, I'm going to continue this effort. Last year we
> > > > stabilized some of the virglrenderer Venus APIs, this year Venus ma=
y
> > > > transition to supporting per-context fences only and require to ini=
t
> a
> > > > renderserver, which will result in a more changes to Qemu. I'm goin=
g
> to
> > > > wait a bit for Venus to settle down and then make a v4.
> > > >
> > > > In the end we will either need to add more #ifdefs if we will want =
to
> > > > keep supporting older virglrenderer versions in Qemu, or bump the m=
in
> > > > required virglrenderer version.
> > >
> > > Hi Dmitry,
> > >
> > > Thanks for working on this, it's great to see QEMU graphics moving
> > > forward.  I noticed a few things from your patchset:
> > >
> > > 1)  Older versions of virglrenderer -- supported or not?
> > >
> > > As you alluded to, there have been significant changes to
> > > virglrenderer since the last QEMU graphics update.  For example, the
> > > asynchronous callback introduces an entirely different and
> > > incompatible way to signal fence completion.
> > >
> > > Notionally, QEMU must support older versions of virglrenderer, though
> > > in practice I'm not sure how much that is true.  If we want to keep u=
p
> > > the notion that older versions must be supported, you'll need:
> > >
> > > a) virtio-gpu-virgl.c
> > > b) virtio-gpu-virgl2.c (or an equivalent)
> > >
> > > Similarly for the vhost-user paths (if you want to support that).  If
> > > older versions of virglrenderer don't need to be supported, then that
> > > would simplify the amount of additional paths/#ifdefs.
> >
> > We should support old versions of virgl (as described in
> >
> https://www.qemu.org/docs/master/about/build-platforms.html#linux-os-maco=
s-freebsd-netbsd-openbsd
> ).
> >
> > Whether a new virtio-gpu-virgl2. (or equivalent) is necessary, we
> > can't really tell without seeing the changes involved.
>
> Ack.  Something to keep in mind as Dmitry refactors.
>
> >
> > >
> > > 2) Additional context type: gfxstream [i]?
> > >
> > > One of the major motivations for adding context types in the
> > > virtio-gpu spec was supporting gfxstream.  gfxstream is used in the
> > > Android Studio emulator (a variant of QEMU) [ii], among other places.
> > > That would move the Android emulator closer to the goal of using
> > > upstream QEMU for everything.
> >
> > What is the advantage of using gfxstream over virgl? or zink+venus?
>
> History/backstory:
>
> gfxstream development has its roots in the development of the Android
> Emulator (circa 2010).  In those days, both DRM and Android were
> relatively new and the communities didn't know much about each other.
>
> A method was devised to auto-generate GLES calls (that's all Android
> needed) and stream it over an interface very similar to pipe(..).
> Host generated IDs were used to track shareable buffers.
>
> That same method used to auto-generate GLES was expanded to Vulkan and
> support for coherent memory was added.  In 2018 the Android Emulator
> was the first to ship CTS-compliant virtualized Vulkan via downstream
> kernel interfaces, before work on venus began.
>
> As virtio-gpu continued to mature, gfxstream was actually the first to
> ship both blob resources [1] and context types [2] in production via
> crosvm to form a completely upstreamable solution (I consider AOSP to
> be an "upstream" as well).
>
> [1]
> https://patchwork.kernel.org/project/dri-devel/cover/20200814024000.2485-=
1-gurchetansingh@chromium.org/
> [2] https://lists.oasis-open.org/archives/virtio-dev/202108/msg00141.html
>
> With this history out of the way, here are some advantages of
> gfxstream GLES over virgl:
>
> - gfxstream GLES actually has much less rendering artifacts than virgl
> since it's autogenerated and not hand-written.  Using an Gallium
> command stream is lossy (partly since the GLES spec is ambiguous and
> drivers are buggy), and we always had better dEQP runs on gfxstream
> GLES than on virgl (especially on closed source drivers).
>
> - Better memory management: virgl makes heavy use of
> RESOURCE_CREATE_3D, which creates shadow buffers for every GL
> texture/buffer.  gfxstream just uses a single guest memory buffer per
> DRM instance for buffer/texture upload.  For example, gfxstream
> doesn't need the virtio-gpu shrinker as much [3] since it doesn't use
> as much guest memory.  Though I know there have been recent fixes for
> this in virgl, but talking from a design POV.
>
> - Performance:  In 2020, a vendor ran the GPU emulation stress test
> comparing virgl and gfxstream GLES.  Here are some results:
>
> CVD: drm_virgl - 7.01 fps
> CVD: gfxstream - 43.68 fps
>
> I've seen similarly dramatic results with gfxbench/3D Mark on some
> automotive platforms.
>
> - Multi-threaded by design:  gfxstream GLES is multi-threaded by
> design.  Each guest GL thread get's its own host thread to decod
> commands. virgl is single threaded (before the asynchronous callback,
> which hasn't landed in QEMU yet)
>
> - Cross-platform:  Windows, MacOS, and Linux support (though with
> downstream QEMU patches unfortunately).  virgl is more a Linux thing.
>
> - Snapshots: Not possible with virgl.  We don't intend to upstream
> live migration snapshot support in the initial CL, but that's
> something to note that users like.
>
> gfxstream is the "native" solution for Android and is thus better
> optimized, just like virgl is the native solution for Linux guests.
>
> Re: Zink/ANGLE/venus versus ANGLE/gfxstream VK
>
> venus in many ways has similar design characteristics as gfxstream VK
> (auto-generated, multi-threaded).  gfxstream VK has better
> cross-platform support, with it shipping on via the Android emulator
> and Google Play Games [4] on PC.  venus is designed with open-source
> Linux platforms in mind, with Chromebook gaming as the initial use
> case [5].
>
> That leads to different design decisions, mostly centered around
> resource sharing/state-tracking.  Snapshots are also a goal for
> gfxstream VK, though not ready yet.
>
> Both venus and gfxstream are Google-sponsored.  There were meetings
> between Android and ChromeOS bigwigs about gfxstream VK/venus in 2019,
> and the outcome seemed to be "we'll share work where it makes sense,
> but there might not be a one-size fits all solution".
>
> Layering which passes CTS is expected to take quite a while,
> especially for a cross-platform target such as the emulator.  It would
> be great to have gfxstream GLES support alone in the interim.
>
> [3]
> https://lore.kernel.org/lkml/20230305221011.1404672-1-dmitry.osipenko@col=
labora.com/
> [4] https://play.google.com/googleplaygames
> [5] https://www.xda-developers.com/how-to-run-steam-chromebook/
>
> >
> > Only AOSP can run with virgl perhaps? I am not familiar with Android
> > development.. I guess it doesn't make use of Mesa, and thus no virgl
> > at all?
>
> Some AOSP targets (Cuttlefish) can use virgl along with gfxstream,
> just for testing sake.  It's not hard to support both via crosvm, so
> we do it.
>
> https://source.android.com/docs/setup/create/cuttlefish-ref-gpu
>
> The Android Emulator (the most relevant use case here) does ship
> gfxstream when a developer uses Android Studio though, and plans to do
> so in the future.
>
> >
> > >
> > > If (1) is resolved, I don't think it's actually too bad to add
> > > gfxstream support.  We just need an additional layer of dispatch
> > > between virglrenderer and gfxstream (thus, virtio-gpu-virgl2.c would
> > > be renamed virtio-gpu-context-types.c or something similar).  The QEM=
U
> > > command line will have to be modified to pass in the enabled context
> > > type (--context=3D{virgl, venus, gfxstream}).  crosvm has been using =
the
> > > same trick.
> > >
> > > If (1) is resolved in v4, I would estimate adding gfxstream support
> > > would at max take 1-2 months for a single engineer.  I'm not saying
> > > gfxstream need necessarily be a part of a v5 patch-stack, but given
> > > this patch-stack has been around for 1 year plus, it certainly could
> > > be.  We can certainly design things in such a way that adding
> > > gfxstream is easy subsequently.
> > >
> > > The hardest part is actually package management (Debian) for
> > > gfxstream, but those can be resolved.
> > >
> >
> > It looks like gfxstream is actually offering an API similar to
> > virlgrenderer (with "pipe_" prefix).
>
> For gfxstream, my ideal solution would not use that "pipe_" API
> directly from QEMU (though vulkan-cereal will be packaged properly).
> Instead, I intend to package the "rutabaga_gfx_ffi.h"  proxy library
> over gfxstream [6]:
>
>
> https://chromium.googlesource.com/chromiumos/platform/crosvm/+/refs/heads=
/main/rutabaga_gfx/ffi/src/include/rutabaga_gfx_ffi.h
>
> The advantage with this approach is one gets Wayland passthrough [7]
> with Linux guests which is written in Rust , along with gfxstream.
> The main issues are around Debian Rust packaging.
>
> Rough sketch, here's what I think we might need:
>
> a) virtio-gpu-virgl-legacy.c for older versions of virglrenderer
> b) virtio-gpu-virgl2.c
> c) virtio-gpu-rutabaga.c or virtio-gpu-gfxstream.c (depending on rust
> packaging investigations)
>
> Though Wayland passthrough is a "nice to have", upstreaming gfxstream
> for Android Emulator is the most important product goal.  So if Rust
> Debian packaging becomes too onerous (virtio-gpu-rutabaga.c), we can
> backtrack to a simpler solution (virtio-gpu-gfxstream.c).
>
> [6] it can also proxy virglrenderer calls too, but I'll that decision
> to virglrenderer maintainers
> [7] try out the feature here:
> https://crosvm.dev/book/devices/wayland.html
>
> > I suppose the guest needs to be
> > configured in a special way then (how? without mesa?).
>
> For AOSP, androidboot.hardware.vulkan and androidboot.hardware.egl
> allow toggling of GLES and Vulkan impls.  QEMU
> won't have to do anything special given the way the launchers are
> designed (there's an equivalent of a "virtmanager").
>
> There needs to be logic around context selection for Linux guests.
> QEMU needs a "--ctx_type=3D{virgl, venus, drm, gfxstream}" argument.
> See crosvm for an example:
>
>
> https://chromium.googlesource.com/chromiumos/platform/crosvm/+/refs/heads=
/main/rutabaga_gfx/src/rutabaga_core.rs#910
>
> This argument is important for Linux upcoming "DRM native" context
> types [8] as well.
>
> [8] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21658
>
> >
> > > I'm not sure exactly how QEMU accelerated graphics are utilized in
> > > user-facing actual products currently, so not sure what the standard
> > > is.
> > >
> > > What do QEMU maintainers and users think about these issues,
> > > particularly about the potential gfxstream addition in QEMU as a
> > > context type?  We are most interested in Android guests.
> >
> > It would be great if the Android emulator was more aligned with
> > upstream QEMU development!
>
> Awesome!  I envisage the initial gfxstream integration as just a first
> step.  With the graphics solution upstreamed, subsequent MacOS/Windows
> specific patches will start to make more sense.
>

Okay, I think the next steps would actually be code so you can see our
vision.  I have few questions that will help with my RFC:

1)  Packaging -- before or after?

gfxstream does not have a package in upstream Portage or Debian (though
there are downstream implementations).  Is it sufficient to have a
versioned release (i.e, Git tag) without the package before the change can
be merged into QEMU?

Is packaging required before merging into QEMU?

2) Optional Rust dependencies

To achieve seamless Wayland windowing with the same implementation as
crosvm, we'll need optional Rust dependencies.  There actually has been
interest in making Rust a non-optional dependency:

https://wiki.qemu.org/RustInQemu
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04589.html

I actually only want Rust as an optional dependency on Linux, Windows, and
MacOS -- where Rust support is quite good.  Is there any problem with using
Rust library with a C API from QEMU?

3) Rust "Build-Depends" in Debian

This is mostly a question to Debian packagers (CC: mjt@)

Any Rust package would likely depend on 10-30 additional packages (that's
just the way Rust works), but they are all in Debian stable right now.

https://packages.debian.org/stable/rust/

I noticed when enabling virgl, there were complaints about a ton of UI
libraries being pulled in.

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D813658

That necessitated the creation of the `qemu-system-gui` package for people
who don't need a UI.  I want to make gfxstream a Suggested Package in
qemu-system-gui, but that would potentially pull in 10-30 additional Rust
build dependencies I mentioned.

Would the 10-30 Rust Build dependencies be problematic?  I think QEMU
already has hundreds right now.

Thanks!


> >
> > thanks
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>

--00000000000088b7fc05f71f6c15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 13, 2023 at 11:44=E2=80=
=AFAM Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromium.org">gu=
rchetansingh@chromium.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Mon, Mar 13, 2023 at 5:58=E2=80=AFAM Marc-Andr=
=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Gurchetan<br>
&gt;<br>
&gt; On Tue, Mar 7, 2023 at 2:41=E2=80=AFAM Gurchetan Singh<br>
&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">g=
urchetansingh@chromium.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Jan 31, 2023 at 3:15=E2=80=AFPM Dmitry Osipenko<br>
&gt; &gt; &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com" target=3D"_b=
lank">dmitry.osipenko@collabora.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 1/30/23 20:00, Alex Benn=C3=A9e wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Antonio Caggiano &lt;<a href=3D"mailto:antonio.caggiano=
@collabora.com" target=3D"_blank">antonio.caggiano@collabora.com</a>&gt; wr=
ites:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; This series of patches enables support for the Venu=
s VirtIO-GPU Vulkan<br>
&gt; &gt; &gt; &gt;&gt; driver by adding some features required by the driv=
er:<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; - CONTEXT_INIT<br>
&gt; &gt; &gt; &gt;&gt; - HOSTMEM<br>
&gt; &gt; &gt; &gt;&gt; - RESOURCE_UUID<br>
&gt; &gt; &gt; &gt;&gt; - BLOB_RESOURCES<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; In addition to these features, Venus capset support=
 was required<br>
&gt; &gt; &gt; &gt;&gt; together with the implementation for Virgl blob res=
ource commands.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I managed to apply to current master but I needed a bun=
ch of patches to<br>
&gt; &gt; &gt; &gt; get it to compile with my old virgl:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thank you for reviewing and testing the patches! Antonio isn=
&#39;t working<br>
&gt; &gt; &gt; on Venus anymore, I&#39;m going to continue this effort. Las=
t year we<br>
&gt; &gt; &gt; stabilized some of the virglrenderer Venus APIs, this year V=
enus may<br>
&gt; &gt; &gt; transition to supporting per-context fences only and require=
 to init a<br>
&gt; &gt; &gt; renderserver, which will result in a more changes to Qemu. I=
&#39;m going to<br>
&gt; &gt; &gt; wait a bit for Venus to settle down and then make a v4.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; In the end we will either need to add more #ifdefs if we wil=
l want to<br>
&gt; &gt; &gt; keep supporting older virglrenderer versions in Qemu, or bum=
p the min<br>
&gt; &gt; &gt; required virglrenderer version.<br>
&gt; &gt;<br>
&gt; &gt; Hi Dmitry,<br>
&gt; &gt;<br>
&gt; &gt; Thanks for working on this, it&#39;s great to see QEMU graphics m=
oving<br>
&gt; &gt; forward.=C2=A0 I noticed a few things from your patchset:<br>
&gt; &gt;<br>
&gt; &gt; 1)=C2=A0 Older versions of virglrenderer -- supported or not?<br>
&gt; &gt;<br>
&gt; &gt; As you alluded to, there have been significant changes to<br>
&gt; &gt; virglrenderer since the last QEMU graphics update.=C2=A0 For exam=
ple, the<br>
&gt; &gt; asynchronous callback introduces an entirely different and<br>
&gt; &gt; incompatible way to signal fence completion.<br>
&gt; &gt;<br>
&gt; &gt; Notionally, QEMU must support older versions of virglrenderer, th=
ough<br>
&gt; &gt; in practice I&#39;m not sure how much that is true.=C2=A0 If we w=
ant to keep up<br>
&gt; &gt; the notion that older versions must be supported, you&#39;ll need=
:<br>
&gt; &gt;<br>
&gt; &gt; a) virtio-gpu-virgl.c<br>
&gt; &gt; b) virtio-gpu-virgl2.c (or an equivalent)<br>
&gt; &gt;<br>
&gt; &gt; Similarly for the vhost-user paths (if you want to support that).=
=C2=A0 If<br>
&gt; &gt; older versions of virglrenderer don&#39;t need to be supported, t=
hen that<br>
&gt; &gt; would simplify the amount of additional paths/#ifdefs.<br>
&gt;<br>
&gt; We should support old versions of virgl (as described in<br>
&gt; <a href=3D"https://www.qemu.org/docs/master/about/build-platforms.html=
#linux-os-macos-freebsd-netbsd-openbsd" rel=3D"noreferrer" target=3D"_blank=
">https://www.qemu.org/docs/master/about/build-platforms.html#linux-os-maco=
s-freebsd-netbsd-openbsd</a>).<br>
&gt;<br>
&gt; Whether a new virtio-gpu-virgl2. (or equivalent) is necessary, we<br>
&gt; can&#39;t really tell without seeing the changes involved.<br>
<br>
Ack.=C2=A0 Something to keep in mind as Dmitry refactors.<br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; 2) Additional context type: gfxstream [i]?<br>
&gt; &gt;<br>
&gt; &gt; One of the major motivations for adding context types in the<br>
&gt; &gt; virtio-gpu spec was supporting gfxstream.=C2=A0 gfxstream is used=
 in the<br>
&gt; &gt; Android Studio emulator (a variant of QEMU) [ii], among other pla=
ces.<br>
&gt; &gt; That would move the Android emulator closer to the goal of using<=
br>
&gt; &gt; upstream QEMU for everything.<br>
&gt;<br>
&gt; What is the advantage of using gfxstream over virgl? or zink+venus?<br=
>
<br>
History/backstory:<br>
<br>
gfxstream development has its roots in the development of the Android<br>
Emulator (circa 2010).=C2=A0 In those days, both DRM and Android were<br>
relatively new and the communities didn&#39;t know much about each other.<b=
r>
<br>
A method was devised to auto-generate GLES calls (that&#39;s all Android<br=
>
needed) and stream it over an interface very similar to pipe(..).<br>
Host generated IDs were used to track shareable buffers.<br>
<br>
That same method used to auto-generate GLES was expanded to Vulkan and<br>
support for coherent memory was added.=C2=A0 In 2018 the Android Emulator<b=
r>
was the first to ship CTS-compliant virtualized Vulkan via downstream<br>
kernel interfaces, before work on venus began.<br>
<br>
As virtio-gpu continued to mature, gfxstream was actually the first to<br>
ship both blob resources [1] and context types [2] in production via<br>
crosvm to form a completely upstreamable solution (I consider AOSP to<br>
be an &quot;upstream&quot; as well).<br>
<br>
[1] <a href=3D"https://patchwork.kernel.org/project/dri-devel/cover/2020081=
4024000.2485-1-gurchetansingh@chromium.org/" rel=3D"noreferrer" target=3D"_=
blank">https://patchwork.kernel.org/project/dri-devel/cover/20200814024000.=
2485-1-gurchetansingh@chromium.org/</a><br>
[2] <a href=3D"https://lists.oasis-open.org/archives/virtio-dev/202108/msg0=
0141.html" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-open.or=
g/archives/virtio-dev/202108/msg00141.html</a><br>
<br>
With this history out of the way, here are some advantages of<br>
gfxstream GLES over virgl:<br>
<br>
- gfxstream GLES actually has much less rendering artifacts than virgl<br>
since it&#39;s autogenerated and not hand-written.=C2=A0 Using an Gallium<b=
r>
command stream is lossy (partly since the GLES spec is ambiguous and<br>
drivers are buggy), and we always had better dEQP runs on gfxstream<br>
GLES than on virgl (especially on closed source drivers).<br>
<br>
- Better memory management: virgl makes heavy use of<br>
RESOURCE_CREATE_3D, which creates shadow buffers for every GL<br>
texture/buffer.=C2=A0 gfxstream just uses a single guest memory buffer per<=
br>
DRM instance for buffer/texture upload.=C2=A0 For example, gfxstream<br>
doesn&#39;t need the virtio-gpu shrinker as much [3] since it doesn&#39;t u=
se<br>
as much guest memory.=C2=A0 Though I know there have been recent fixes for<=
br>
this in virgl, but talking from a design POV.<br>
<br>
- Performance:=C2=A0 In 2020, a vendor ran the GPU emulation stress test<br=
>
comparing virgl and gfxstream GLES.=C2=A0 Here are some results:<br>
<br>
CVD: drm_virgl - 7.01 fps<br>
CVD: gfxstream - 43.68 fps<br>
<br>
I&#39;ve seen similarly dramatic results with gfxbench/3D Mark on some<br>
automotive platforms.<br>
<br>
- Multi-threaded by design:=C2=A0 gfxstream GLES is multi-threaded by<br>
design.=C2=A0 Each guest GL thread get&#39;s its own host thread to decod<b=
r>
commands. virgl is single threaded (before the asynchronous callback,<br>
which hasn&#39;t landed in QEMU yet)<br>
<br>
- Cross-platform:=C2=A0 Windows, MacOS, and Linux support (though with<br>
downstream QEMU patches unfortunately).=C2=A0 virgl is more a Linux thing.<=
br>
<br>
- Snapshots: Not possible with virgl.=C2=A0 We don&#39;t intend to upstream=
<br>
live migration snapshot support in the initial CL, but that&#39;s<br>
something to note that users like.<br>
<br>
gfxstream is the &quot;native&quot; solution for Android and is thus better=
<br>
optimized, just like virgl is the native solution for Linux guests.<br>
<br>
Re: Zink/ANGLE/venus versus ANGLE/gfxstream VK<br>
<br>
venus in many ways has similar design characteristics as gfxstream VK<br>
(auto-generated, multi-threaded).=C2=A0 gfxstream VK has better<br>
cross-platform support, with it shipping on via the Android emulator<br>
and Google Play Games [4] on PC.=C2=A0 venus is designed with open-source<b=
r>
Linux platforms in mind, with Chromebook gaming as the initial use<br>
case [5].<br>
<br>
That leads to different design decisions, mostly centered around<br>
resource sharing/state-tracking.=C2=A0 Snapshots are also a goal for<br>
gfxstream VK, though not ready yet.<br>
<br>
Both venus and gfxstream are Google-sponsored.=C2=A0 There were meetings<br=
>
between Android and ChromeOS bigwigs about gfxstream VK/venus in 2019,<br>
and the outcome seemed to be &quot;we&#39;ll share work where it makes sens=
e,<br>
but there might not be a one-size fits all solution&quot;.<br>
<br>
Layering which passes CTS is expected to take quite a while,<br>
especially for a cross-platform target such as the emulator.=C2=A0 It would=
<br>
be great to have gfxstream GLES support alone in the interim.<br>
<br>
[3] <a href=3D"https://lore.kernel.org/lkml/20230305221011.1404672-1-dmitry=
.osipenko@collabora.com/" rel=3D"noreferrer" target=3D"_blank">https://lore=
.kernel.org/lkml/20230305221011.1404672-1-dmitry.osipenko@collabora.com/</a=
><br>
[4] <a href=3D"https://play.google.com/googleplaygames" rel=3D"noreferrer" =
target=3D"_blank">https://play.google.com/googleplaygames</a><br>
[5] <a href=3D"https://www.xda-developers.com/how-to-run-steam-chromebook/"=
 rel=3D"noreferrer" target=3D"_blank">https://www.xda-developers.com/how-to=
-run-steam-chromebook/</a><br>
<br>
&gt;<br>
&gt; Only AOSP can run with virgl perhaps? I am not familiar with Android<b=
r>
&gt; development.. I guess it doesn&#39;t make use of Mesa, and thus no vir=
gl<br>
&gt; at all?<br>
<br>
Some AOSP targets (Cuttlefish) can use virgl along with gfxstream,<br>
just for testing sake.=C2=A0 It&#39;s not hard to support both via crosvm, =
so<br>
we do it.<br>
<br>
<a href=3D"https://source.android.com/docs/setup/create/cuttlefish-ref-gpu"=
 rel=3D"noreferrer" target=3D"_blank">https://source.android.com/docs/setup=
/create/cuttlefish-ref-gpu</a><br>
<br>
The Android Emulator (the most relevant use case here) does ship<br>
gfxstream when a developer uses Android Studio though, and plans to do<br>
so in the future.<br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; If (1) is resolved, I don&#39;t think it&#39;s actually too bad t=
o add<br>
&gt; &gt; gfxstream support.=C2=A0 We just need an additional layer of disp=
atch<br>
&gt; &gt; between virglrenderer and gfxstream (thus, virtio-gpu-virgl2.c wo=
uld<br>
&gt; &gt; be renamed virtio-gpu-context-types.c or something similar).=C2=
=A0 The QEMU<br>
&gt; &gt; command line will have to be modified to pass in the enabled cont=
ext<br>
&gt; &gt; type (--context=3D{virgl, venus, gfxstream}).=C2=A0 crosvm has be=
en using the<br>
&gt; &gt; same trick.<br>
&gt; &gt;<br>
&gt; &gt; If (1) is resolved in v4, I would estimate adding gfxstream suppo=
rt<br>
&gt; &gt; would at max take 1-2 months for a single engineer.=C2=A0 I&#39;m=
 not saying<br>
&gt; &gt; gfxstream need necessarily be a part of a v5 patch-stack, but giv=
en<br>
&gt; &gt; this patch-stack has been around for 1 year plus, it certainly co=
uld<br>
&gt; &gt; be.=C2=A0 We can certainly design things in such a way that addin=
g<br>
&gt; &gt; gfxstream is easy subsequently.<br>
&gt; &gt;<br>
&gt; &gt; The hardest part is actually package management (Debian) for<br>
&gt; &gt; gfxstream, but those can be resolved.<br>
&gt; &gt;<br>
&gt;<br>
&gt; It looks like gfxstream is actually offering an API similar to<br>
&gt; virlgrenderer (with &quot;pipe_&quot; prefix).<br>
<br>
For gfxstream, my ideal solution would not use that &quot;pipe_&quot; API<b=
r>
directly from QEMU (though vulkan-cereal will be packaged properly).<br>
Instead, I intend to package the &quot;rutabaga_gfx_ffi.h&quot;=C2=A0 proxy=
 library<br>
over gfxstream [6]:<br>
<br>
<a href=3D"https://chromium.googlesource.com/chromiumos/platform/crosvm/+/r=
efs/heads/main/rutabaga_gfx/ffi/src/include/rutabaga_gfx_ffi.h" rel=3D"nore=
ferrer" target=3D"_blank">https://chromium.googlesource.com/chromiumos/plat=
form/crosvm/+/refs/heads/main/rutabaga_gfx/ffi/src/include/rutabaga_gfx_ffi=
.h</a><br>
<br>
The advantage with this approach is one gets Wayland passthrough [7]<br>
with Linux guests which is written in Rust , along with gfxstream.<br>
The main issues are around Debian Rust packaging.<br>
<br>
Rough sketch, here&#39;s what I think we might need:<br>
<br>
a) virtio-gpu-virgl-legacy.c for older versions of virglrenderer<br>
b) virtio-gpu-virgl2.c<br>
c) virtio-gpu-rutabaga.c or virtio-gpu-gfxstream.c (depending on rust<br>
packaging investigations)<br>
<br>
Though Wayland passthrough is a &quot;nice to have&quot;, upstreaming gfxst=
ream<br>
for Android Emulator is the most important product goal.=C2=A0 So if Rust<b=
r>
Debian packaging becomes too onerous (virtio-gpu-rutabaga.c), we can<br>
backtrack to a simpler solution (virtio-gpu-gfxstream.c).<br>
<br>
[6] it can also proxy virglrenderer calls too, but I&#39;ll that decision<b=
r>
to virglrenderer maintainers<br>
[7] try out the feature here:=C2=A0 <a href=3D"https://crosvm.dev/book/devi=
ces/wayland.html" rel=3D"noreferrer" target=3D"_blank">https://crosvm.dev/b=
ook/devices/wayland.html</a><br>
<br>
&gt; I suppose the guest needs to be<br>
&gt; configured in a special way then (how? without mesa?).<br>
<br>
For AOSP, androidboot.hardware.vulkan and androidboot.hardware.egl<br>
allow toggling of GLES and Vulkan impls.=C2=A0 QEMU<br>
won&#39;t have to do anything special given the way the launchers are<br>
designed (there&#39;s an equivalent of a &quot;virtmanager&quot;).<br>
<br>
There needs to be logic around context selection for Linux guests.<br>
QEMU needs a &quot;--ctx_type=3D{virgl, venus, drm, gfxstream}&quot; argume=
nt.<br>
See crosvm for an example:<br>
<br>
<a href=3D"https://chromium.googlesource.com/chromiumos/platform/crosvm/+/r=
efs/heads/main/rutabaga_gfx/src/rutabaga_core.rs#910" rel=3D"noreferrer" ta=
rget=3D"_blank">https://chromium.googlesource.com/chromiumos/platform/crosv=
m/+/refs/heads/main/rutabaga_gfx/src/rutabaga_core.rs#910</a><br>
<br>
This argument is important for Linux upcoming &quot;DRM native&quot; contex=
t<br>
types [8] as well.<br>
<br>
[8] <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21=
658" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/me=
sa/mesa/-/merge_requests/21658</a><br>
<br>
&gt;<br>
&gt; &gt; I&#39;m not sure exactly how QEMU accelerated graphics are utiliz=
ed in<br>
&gt; &gt; user-facing actual products currently, so not sure what the stand=
ard<br>
&gt; &gt; is.<br>
&gt; &gt;<br>
&gt; &gt; What do QEMU maintainers and users think about these issues,<br>
&gt; &gt; particularly about the potential gfxstream addition in QEMU as a<=
br>
&gt; &gt; context type?=C2=A0 We are most interested in Android guests.<br>
&gt;<br>
&gt; It would be great if the Android emulator was more aligned with<br>
&gt; upstream QEMU development!<br>
<br>
Awesome!=C2=A0 I envisage the initial gfxstream integration as just a first=
<br>
step.=C2=A0 With the graphics solution upstreamed, subsequent MacOS/Windows=
<br>
specific patches will start to make more sense.<br></blockquote><div><br></=
div><div>Okay, I think the next steps would actually be code so you can see=
 our vision.=C2=A0 I have few questions that will help with my RFC:</div><d=
iv><br></div><div>1)=C2=A0 Packaging -- before or after?</div><div><br></di=
v><div>gfxstream does not have a package in upstream Portage or Debian (tho=
ugh there are downstream implementations).=C2=A0 Is it sufficient to have a=
 versioned release (i.e, Git tag) without the package before the change can=
 be merged into QEMU?</div><div><br></div><div>Is packaging required before=
 merging into QEMU?</div><div><br></div><div>2) Optional Rust dependencies<=
/div><div><br></div><div>To achieve seamless Wayland windowing with the sam=
e implementation as crosvm, we&#39;ll need optional Rust dependencies.=C2=
=A0 There actually has been interest in making Rust a non-optional dependen=
cy:</div><div><br></div><div><a href=3D"https://wiki.qemu.org/RustInQemu">h=
ttps://wiki.qemu.org/RustInQemu</a><br></div><div><a href=3D"https://lists.=
gnu.org/archive/html/qemu-devel/2021-09/msg04589.html">https://lists.gnu.or=
g/archive/html/qemu-devel/2021-09/msg04589.html</a><br></div><div><br></div=
><div>I actually only want Rust as an optional dependency on Linux, Windows=
, and MacOS -- where Rust support is quite good.=C2=A0 Is there any problem=
 with using Rust library with a C API from QEMU?</div><div><br></div><div>3=
) Rust &quot;Build-Depends&quot; in Debian</div><div><br></div><div>This is=
 mostly a question to Debian packagers (CC: mjt@)</div><div><br></div><div>=
Any Rust package would likely depend on 10-30 additional packages (that&#39=
;s just the way Rust works), but they are all in Debian stable right now.=
=C2=A0=C2=A0</div><div><br></div><div><a href=3D"https://packages.debian.or=
g/stable/rust/">https://packages.debian.org/stable/rust/</a>=C2=A0</div><di=
v><br></div><div>I noticed when enabling virgl, there were complaints about=
 a ton of UI libraries being pulled in.</div><div><br></div><div><a href=3D=
"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D813658">https://bugs.d=
ebian.org/cgi-bin/bugreport.cgi?bug=3D813658</a><br></div><div><br></div><d=
iv>That necessitated the creation of the `qemu-system-gui` package for peop=
le who don&#39;t need a UI.=C2=A0 I want to make gfxstream a Suggested Pack=
age in qemu-system-gui, but that would potentially pull in 10-30 additional=
 Rust build dependencies I mentioned.</div><div><br></div><div>Would the 10=
-30 Rust Build dependencies be problematic?=C2=A0 I think QEMU already has =
hundreds right now.</div><div><br></div><div>Thanks!</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; thanks<br>
&gt;<br>
&gt; --<br>
&gt; Marc-Andr=C3=A9 Lureau<br>
</blockquote></div></div>

--00000000000088b7fc05f71f6c15--

