Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5936B8106
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 19:46:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbnAn-0008MS-8c; Mon, 13 Mar 2023 14:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pbnAJ-0008M3-V9
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:45:00 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pbnAF-00019f-Ph
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:44:59 -0400
Received: by mail-ed1-x52c.google.com with SMTP id y4so23161610edo.2
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 11:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678733093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDfFptip/fJatCB/mVQp7kn28NOhIrtllg9y8JJxUNk=;
 b=hRn52wawxhKa/z95w6qUKa7N0zKE98zkICz3TSAWoIrCHYWDjC1VaQoKo1gSLBXMKZ
 sBILBEnq6BDGMJptBjTmT4s6oqYj/vp0aliXGUIA8PiqfS+a2z2bFRFMjW26wuC+TSUG
 OYylttaWcNAsmNV7H6FLdvBNTZESOu8l8kOZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678733093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DDfFptip/fJatCB/mVQp7kn28NOhIrtllg9y8JJxUNk=;
 b=37nkE/ZWvlZPs19lz3YKsq+0mCe6tdjGf0a+1MYUVLVmT5BeiN/nHf1TWK8fWtQSGf
 I//DFowTGFnsEOcwahT5sR6I1Ds3KAGTxjzsEltM53vIg/0kMnauNjEg/vA+p5YMXkHc
 PdPvSCCT4qdV4f9MCvafcSEmgyjb7fALbxtjLLanL3eef8lLq9vy5vD64PgoJsBiy/+b
 8LIGLbRu6UbuGYe/Zu25CrivRwAbZ7O5FPH+iDxm7XDKHrh1rYcd5mElVXBo55c+qKqg
 K0jY7OQBrN4zpIqf4reHbviZuxm5y5cSY3GPEzGGE6Vu9PLnCA3xs4w/GFZSXCWkRbEk
 /VBQ==
X-Gm-Message-State: AO0yUKWOCz88am18VjEXpU6nF9p/a+vg69X8NDfZ2uPo0wPfA376Wm99
 NCDp1pSKjmPXu3vDEE9zrqIsSPaDhqx6koXDiTA=
X-Google-Smtp-Source: AK7set/gH/HABhwZmD5CVGnkmTtS85352yZwKCgfZrXM8UGbc9C3/+q6FcUwSgZA9TZ/5OQ4hwXp/A==
X-Received: by 2002:a17:906:13c8:b0:922:7b95:416a with SMTP id
 g8-20020a17090613c800b009227b95416amr7972218ejc.36.1678733092762; 
 Mon, 13 Mar 2023 11:44:52 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 z22-20020a170906271600b0091f58083a15sm113981ejc.175.2023.03.13.11.44.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 11:44:52 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id o12so52605517edb.9
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 11:44:52 -0700 (PDT)
X-Received: by 2002:a50:f614:0:b0:4fc:2096:b15c with SMTP id
 c20-20020a50f614000000b004fc2096b15cmr2456165edn.1.1678733091546; Mon, 13 Mar
 2023 11:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <877cx46jjg.fsf@linaro.org>
 <fc74d071-2563-ee8c-ab7e-c5d4a2f3b0cc@collabora.com>
 <CAAfnVBmiB=fokNztOj4XR=6d1U7JFGK9Z0wcyfVYBu_bDmWPbQ@mail.gmail.com>
 <CAJ+F1C+v9tM2FezYoGJ+yAPPoNzT6foPoyJ-_WvS+kTcBSJgPg@mail.gmail.com>
In-Reply-To: <CAJ+F1C+v9tM2FezYoGJ+yAPPoNzT6foPoyJ-_WvS+kTcBSJgPg@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 13 Mar 2023 11:44:39 -0700
X-Gmail-Original-Message-ID: <CAAfnVBmueH6M_SAmiK0CE77c_yZN-cFLRKMtbtArJb8StjpaDw@mail.gmail.com>
Message-ID: <CAAfnVBmueH6M_SAmiK0CE77c_yZN-cFLRKMtbtArJb8StjpaDw@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] virtio-gpu: Support Venus Vulkan driver
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 gert.wollny@collabora.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=gurchetansingh@chromium.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, Mar 13, 2023 at 5:58=E2=80=AFAM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi Gurchetan
>
> On Tue, Mar 7, 2023 at 2:41=E2=80=AFAM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> > On Tue, Jan 31, 2023 at 3:15=E2=80=AFPM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> > >
> > > Hello,
> > >
> > > On 1/30/23 20:00, Alex Benn=C3=A9e wrote:
> > > >
> > > > Antonio Caggiano <antonio.caggiano@collabora.com> writes:
> > > >
> > > >> This series of patches enables support for the Venus VirtIO-GPU Vu=
lkan
> > > >> driver by adding some features required by the driver:
> > > >>
> > > >> - CONTEXT_INIT
> > > >> - HOSTMEM
> > > >> - RESOURCE_UUID
> > > >> - BLOB_RESOURCES
> > > >>
> > > >> In addition to these features, Venus capset support was required
> > > >> together with the implementation for Virgl blob resource commands.
> > > >
> > > > I managed to apply to current master but I needed a bunch of patche=
s to
> > > > get it to compile with my old virgl:
> > >
> > > Thank you for reviewing and testing the patches! Antonio isn't workin=
g
> > > on Venus anymore, I'm going to continue this effort. Last year we
> > > stabilized some of the virglrenderer Venus APIs, this year Venus may
> > > transition to supporting per-context fences only and require to init =
a
> > > renderserver, which will result in a more changes to Qemu. I'm going =
to
> > > wait a bit for Venus to settle down and then make a v4.
> > >
> > > In the end we will either need to add more #ifdefs if we will want to
> > > keep supporting older virglrenderer versions in Qemu, or bump the min
> > > required virglrenderer version.
> >
> > Hi Dmitry,
> >
> > Thanks for working on this, it's great to see QEMU graphics moving
> > forward.  I noticed a few things from your patchset:
> >
> > 1)  Older versions of virglrenderer -- supported or not?
> >
> > As you alluded to, there have been significant changes to
> > virglrenderer since the last QEMU graphics update.  For example, the
> > asynchronous callback introduces an entirely different and
> > incompatible way to signal fence completion.
> >
> > Notionally, QEMU must support older versions of virglrenderer, though
> > in practice I'm not sure how much that is true.  If we want to keep up
> > the notion that older versions must be supported, you'll need:
> >
> > a) virtio-gpu-virgl.c
> > b) virtio-gpu-virgl2.c (or an equivalent)
> >
> > Similarly for the vhost-user paths (if you want to support that).  If
> > older versions of virglrenderer don't need to be supported, then that
> > would simplify the amount of additional paths/#ifdefs.
>
> We should support old versions of virgl (as described in
> https://www.qemu.org/docs/master/about/build-platforms.html#linux-os-maco=
s-freebsd-netbsd-openbsd).
>
> Whether a new virtio-gpu-virgl2. (or equivalent) is necessary, we
> can't really tell without seeing the changes involved.

Ack.  Something to keep in mind as Dmitry refactors.

>
> >
> > 2) Additional context type: gfxstream [i]?
> >
> > One of the major motivations for adding context types in the
> > virtio-gpu spec was supporting gfxstream.  gfxstream is used in the
> > Android Studio emulator (a variant of QEMU) [ii], among other places.
> > That would move the Android emulator closer to the goal of using
> > upstream QEMU for everything.
>
> What is the advantage of using gfxstream over virgl? or zink+venus?

History/backstory:

gfxstream development has its roots in the development of the Android
Emulator (circa 2010).  In those days, both DRM and Android were
relatively new and the communities didn't know much about each other.

A method was devised to auto-generate GLES calls (that's all Android
needed) and stream it over an interface very similar to pipe(..).
Host generated IDs were used to track shareable buffers.

That same method used to auto-generate GLES was expanded to Vulkan and
support for coherent memory was added.  In 2018 the Android Emulator
was the first to ship CTS-compliant virtualized Vulkan via downstream
kernel interfaces, before work on venus began.

As virtio-gpu continued to mature, gfxstream was actually the first to
ship both blob resources [1] and context types [2] in production via
crosvm to form a completely upstreamable solution (I consider AOSP to
be an "upstream" as well).

[1] https://patchwork.kernel.org/project/dri-devel/cover/20200814024000.248=
5-1-gurchetansingh@chromium.org/
[2] https://lists.oasis-open.org/archives/virtio-dev/202108/msg00141.html

With this history out of the way, here are some advantages of
gfxstream GLES over virgl:

- gfxstream GLES actually has much less rendering artifacts than virgl
since it's autogenerated and not hand-written.  Using an Gallium
command stream is lossy (partly since the GLES spec is ambiguous and
drivers are buggy), and we always had better dEQP runs on gfxstream
GLES than on virgl (especially on closed source drivers).

- Better memory management: virgl makes heavy use of
RESOURCE_CREATE_3D, which creates shadow buffers for every GL
texture/buffer.  gfxstream just uses a single guest memory buffer per
DRM instance for buffer/texture upload.  For example, gfxstream
doesn't need the virtio-gpu shrinker as much [3] since it doesn't use
as much guest memory.  Though I know there have been recent fixes for
this in virgl, but talking from a design POV.

- Performance:  In 2020, a vendor ran the GPU emulation stress test
comparing virgl and gfxstream GLES.  Here are some results:

CVD: drm_virgl - 7.01 fps
CVD: gfxstream - 43.68 fps

I've seen similarly dramatic results with gfxbench/3D Mark on some
automotive platforms.

- Multi-threaded by design:  gfxstream GLES is multi-threaded by
design.  Each guest GL thread get's its own host thread to decod
commands. virgl is single threaded (before the asynchronous callback,
which hasn't landed in QEMU yet)

- Cross-platform:  Windows, MacOS, and Linux support (though with
downstream QEMU patches unfortunately).  virgl is more a Linux thing.

- Snapshots: Not possible with virgl.  We don't intend to upstream
live migration snapshot support in the initial CL, but that's
something to note that users like.

gfxstream is the "native" solution for Android and is thus better
optimized, just like virgl is the native solution for Linux guests.

Re: Zink/ANGLE/venus versus ANGLE/gfxstream VK

venus in many ways has similar design characteristics as gfxstream VK
(auto-generated, multi-threaded).  gfxstream VK has better
cross-platform support, with it shipping on via the Android emulator
and Google Play Games [4] on PC.  venus is designed with open-source
Linux platforms in mind, with Chromebook gaming as the initial use
case [5].

That leads to different design decisions, mostly centered around
resource sharing/state-tracking.  Snapshots are also a goal for
gfxstream VK, though not ready yet.

Both venus and gfxstream are Google-sponsored.  There were meetings
between Android and ChromeOS bigwigs about gfxstream VK/venus in 2019,
and the outcome seemed to be "we'll share work where it makes sense,
but there might not be a one-size fits all solution".

Layering which passes CTS is expected to take quite a while,
especially for a cross-platform target such as the emulator.  It would
be great to have gfxstream GLES support alone in the interim.

[3] https://lore.kernel.org/lkml/20230305221011.1404672-1-dmitry.osipenko@c=
ollabora.com/
[4] https://play.google.com/googleplaygames
[5] https://www.xda-developers.com/how-to-run-steam-chromebook/

>
> Only AOSP can run with virgl perhaps? I am not familiar with Android
> development.. I guess it doesn't make use of Mesa, and thus no virgl
> at all?

Some AOSP targets (Cuttlefish) can use virgl along with gfxstream,
just for testing sake.  It's not hard to support both via crosvm, so
we do it.

https://source.android.com/docs/setup/create/cuttlefish-ref-gpu

The Android Emulator (the most relevant use case here) does ship
gfxstream when a developer uses Android Studio though, and plans to do
so in the future.

>
> >
> > If (1) is resolved, I don't think it's actually too bad to add
> > gfxstream support.  We just need an additional layer of dispatch
> > between virglrenderer and gfxstream (thus, virtio-gpu-virgl2.c would
> > be renamed virtio-gpu-context-types.c or something similar).  The QEMU
> > command line will have to be modified to pass in the enabled context
> > type (--context=3D{virgl, venus, gfxstream}).  crosvm has been using th=
e
> > same trick.
> >
> > If (1) is resolved in v4, I would estimate adding gfxstream support
> > would at max take 1-2 months for a single engineer.  I'm not saying
> > gfxstream need necessarily be a part of a v5 patch-stack, but given
> > this patch-stack has been around for 1 year plus, it certainly could
> > be.  We can certainly design things in such a way that adding
> > gfxstream is easy subsequently.
> >
> > The hardest part is actually package management (Debian) for
> > gfxstream, but those can be resolved.
> >
>
> It looks like gfxstream is actually offering an API similar to
> virlgrenderer (with "pipe_" prefix).

For gfxstream, my ideal solution would not use that "pipe_" API
directly from QEMU (though vulkan-cereal will be packaged properly).
Instead, I intend to package the "rutabaga_gfx_ffi.h"  proxy library
over gfxstream [6]:

https://chromium.googlesource.com/chromiumos/platform/crosvm/+/refs/heads/m=
ain/rutabaga_gfx/ffi/src/include/rutabaga_gfx_ffi.h

The advantage with this approach is one gets Wayland passthrough [7]
with Linux guests which is written in Rust , along with gfxstream.
The main issues are around Debian Rust packaging.

Rough sketch, here's what I think we might need:

a) virtio-gpu-virgl-legacy.c for older versions of virglrenderer
b) virtio-gpu-virgl2.c
c) virtio-gpu-rutabaga.c or virtio-gpu-gfxstream.c (depending on rust
packaging investigations)

Though Wayland passthrough is a "nice to have", upstreaming gfxstream
for Android Emulator is the most important product goal.  So if Rust
Debian packaging becomes too onerous (virtio-gpu-rutabaga.c), we can
backtrack to a simpler solution (virtio-gpu-gfxstream.c).

[6] it can also proxy virglrenderer calls too, but I'll that decision
to virglrenderer maintainers
[7] try out the feature here:  https://crosvm.dev/book/devices/wayland.html

> I suppose the guest needs to be
> configured in a special way then (how? without mesa?).

For AOSP, androidboot.hardware.vulkan and androidboot.hardware.egl
allow toggling of GLES and Vulkan impls.  QEMU
won't have to do anything special given the way the launchers are
designed (there's an equivalent of a "virtmanager").

There needs to be logic around context selection for Linux guests.
QEMU needs a "--ctx_type=3D{virgl, venus, drm, gfxstream}" argument.
See crosvm for an example:

https://chromium.googlesource.com/chromiumos/platform/crosvm/+/refs/heads/m=
ain/rutabaga_gfx/src/rutabaga_core.rs#910

This argument is important for Linux upcoming "DRM native" context
types [8] as well.

[8] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21658

>
> > I'm not sure exactly how QEMU accelerated graphics are utilized in
> > user-facing actual products currently, so not sure what the standard
> > is.
> >
> > What do QEMU maintainers and users think about these issues,
> > particularly about the potential gfxstream addition in QEMU as a
> > context type?  We are most interested in Android guests.
>
> It would be great if the Android emulator was more aligned with
> upstream QEMU development!

Awesome!  I envisage the initial gfxstream integration as just a first
step.  With the graphics solution upstreamed, subsequent MacOS/Windows
specific patches will start to make more sense.

>
> thanks
>
> --
> Marc-Andr=C3=A9 Lureau

