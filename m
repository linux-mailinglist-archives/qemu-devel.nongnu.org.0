Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1246B783D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 13:59:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbhkz-0002Rx-7P; Mon, 13 Mar 2023 08:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pbhkt-0002RD-6L
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:58:23 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pbhkr-0001EO-6V
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:58:22 -0400
Received: by mail-lj1-x229.google.com with SMTP id b13so12527410ljf.6
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678712299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zmlqrk0DIrYQ78l+Hx8HvkXkELGpmn9FEP8wwoVvE+4=;
 b=HSKT1OLPrsNdgZ3KadXNynGpZGosvcVBfXw5Hd1yeHgmScQh7pxokbmOZQrBLXl6+d
 EHIUyzNNBIkN3uDvdNB4WyC24oLWIuAB5flcR8MXNYuwKuur6mlzJT44OFGZVs3jZ2Jx
 S1k0yPVUOf8HPM82mqr1oW5FUaOs14Xnj2oSHlAPRux5Lxu9LPqywSdE4fz0JwhuQzKj
 DwBb3fmZpmi1oONL9t8cB93UdBHtt49LcwRR/o9G5xzlTCKtjIh/ZmgzgSVoDRmydyFl
 bly0cfaIa7PYmFH96mKSRP2eCcBCJ4d+4ddSz0JRS17+oe1A2UXjzxJOcMgjSuAFtV5C
 cg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678712299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zmlqrk0DIrYQ78l+Hx8HvkXkELGpmn9FEP8wwoVvE+4=;
 b=exHIc55QDukaZyi/9DSy1vGGoIjqxuRGxrl0Vi2MgSV7/aySxi2+xfGzJrAaEHkfhP
 t9tyob1bWfb2GDK++ID+KxMfoWAa1cgSTbVIlfb421gSzNB49+TPQ7g6LryeK1ADH9xr
 vsfcNAID9QxYy5vbdbCNNeL0evg7liwlQPbNH06IWVp6YvaOQdJyhu+y1QRP22JkVXOD
 1ae5WSCfQ9Qn0OXrYCjBWpGddOpPqNi/QpltIdgHPd9JpZFyvrccJqflmiI+I5GC5GOs
 z63x93mqVi/7Cm1YmCtxta2nLvjbQoSziZgS3HmceIXZt4apPXpuUPQgD+EqeH1PeLQi
 lr3w==
X-Gm-Message-State: AO0yUKXN6R1UqW9v5DPYTZZkD3z5UQSL6h6WoZStnGPT+B2NULMxQ8I2
 3MkNHAOEJxqdvYGM+Uqq2ZrCwVHLbjW92yYlpKw=
X-Google-Smtp-Source: AK7set9lTXuzLaDDnZMcq8+6NIY9HfGysnQSOKbcYhMEVImbGdUhwRbx+ivrU2s3c14c6hNX+bWqiWdUjZ8F8oM8bdM=
X-Received: by 2002:a2e:a4d5:0:b0:295:897c:6f7a with SMTP id
 p21-20020a2ea4d5000000b00295897c6f7amr10609439ljm.0.1678712299344; Mon, 13
 Mar 2023 05:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <877cx46jjg.fsf@linaro.org>
 <fc74d071-2563-ee8c-ab7e-c5d4a2f3b0cc@collabora.com>
 <CAAfnVBmiB=fokNztOj4XR=6d1U7JFGK9Z0wcyfVYBu_bDmWPbQ@mail.gmail.com>
In-Reply-To: <CAAfnVBmiB=fokNztOj4XR=6d1U7JFGK9Z0wcyfVYBu_bDmWPbQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 13 Mar 2023 16:58:07 +0400
Message-ID: <CAJ+F1C+v9tM2FezYoGJ+yAPPoNzT6foPoyJ-_WvS+kTcBSJgPg@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] virtio-gpu: Support Venus Vulkan driver
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 gert.wollny@collabora.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x229.google.com
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

Hi Gurchetan

On Tue, Mar 7, 2023 at 2:41=E2=80=AFAM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> On Tue, Jan 31, 2023 at 3:15=E2=80=AFPM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
> >
> > Hello,
> >
> > On 1/30/23 20:00, Alex Benn=C3=A9e wrote:
> > >
> > > Antonio Caggiano <antonio.caggiano@collabora.com> writes:
> > >
> > >> This series of patches enables support for the Venus VirtIO-GPU Vulk=
an
> > >> driver by adding some features required by the driver:
> > >>
> > >> - CONTEXT_INIT
> > >> - HOSTMEM
> > >> - RESOURCE_UUID
> > >> - BLOB_RESOURCES
> > >>
> > >> In addition to these features, Venus capset support was required
> > >> together with the implementation for Virgl blob resource commands.
> > >
> > > I managed to apply to current master but I needed a bunch of patches =
to
> > > get it to compile with my old virgl:
> >
> > Thank you for reviewing and testing the patches! Antonio isn't working
> > on Venus anymore, I'm going to continue this effort. Last year we
> > stabilized some of the virglrenderer Venus APIs, this year Venus may
> > transition to supporting per-context fences only and require to init a
> > renderserver, which will result in a more changes to Qemu. I'm going to
> > wait a bit for Venus to settle down and then make a v4.
> >
> > In the end we will either need to add more #ifdefs if we will want to
> > keep supporting older virglrenderer versions in Qemu, or bump the min
> > required virglrenderer version.
>
> Hi Dmitry,
>
> Thanks for working on this, it's great to see QEMU graphics moving
> forward.  I noticed a few things from your patchset:
>
> 1)  Older versions of virglrenderer -- supported or not?
>
> As you alluded to, there have been significant changes to
> virglrenderer since the last QEMU graphics update.  For example, the
> asynchronous callback introduces an entirely different and
> incompatible way to signal fence completion.
>
> Notionally, QEMU must support older versions of virglrenderer, though
> in practice I'm not sure how much that is true.  If we want to keep up
> the notion that older versions must be supported, you'll need:
>
> a) virtio-gpu-virgl.c
> b) virtio-gpu-virgl2.c (or an equivalent)
>
> Similarly for the vhost-user paths (if you want to support that).  If
> older versions of virglrenderer don't need to be supported, then that
> would simplify the amount of additional paths/#ifdefs.

We should support old versions of virgl (as described in
https://www.qemu.org/docs/master/about/build-platforms.html#linux-os-macos-=
freebsd-netbsd-openbsd).

Whether a new virtio-gpu-virgl2. (or equivalent) is necessary, we
can't really tell without seeing the changes involved.

>
> 2) Additional context type: gfxstream [i]?
>
> One of the major motivations for adding context types in the
> virtio-gpu spec was supporting gfxstream.  gfxstream is used in the
> Android Studio emulator (a variant of QEMU) [ii], among other places.
> That would move the Android emulator closer to the goal of using
> upstream QEMU for everything.

What is the advantage of using gfxstream over virgl? or zink+venus?

Only AOSP can run with virgl perhaps? I am not familiar with Android
development.. I guess it doesn't make use of Mesa, and thus no virgl
at all?

>
> If (1) is resolved, I don't think it's actually too bad to add
> gfxstream support.  We just need an additional layer of dispatch
> between virglrenderer and gfxstream (thus, virtio-gpu-virgl2.c would
> be renamed virtio-gpu-context-types.c or something similar).  The QEMU
> command line will have to be modified to pass in the enabled context
> type (--context=3D{virgl, venus, gfxstream}).  crosvm has been using the
> same trick.
>
> If (1) is resolved in v4, I would estimate adding gfxstream support
> would at max take 1-2 months for a single engineer.  I'm not saying
> gfxstream need necessarily be a part of a v5 patch-stack, but given
> this patch-stack has been around for 1 year plus, it certainly could
> be.  We can certainly design things in such a way that adding
> gfxstream is easy subsequently.
>
> The hardest part is actually package management (Debian) for
> gfxstream, but those can be resolved.
>

It looks like gfxstream is actually offering an API similar to
virlgrenderer (with "pipe_" prefix). I suppose the guest needs to be
configured in a special way then (how? without mesa?).

> I'm not sure exactly how QEMU accelerated graphics are utilized in
> user-facing actual products currently, so not sure what the standard
> is.
>
> What do QEMU maintainers and users think about these issues,
> particularly about the potential gfxstream addition in QEMU as a
> context type?  We are most interested in Android guests.

It would be great if the Android emulator was more aligned with
upstream QEMU development!

thanks

--=20
Marc-Andr=C3=A9 Lureau

