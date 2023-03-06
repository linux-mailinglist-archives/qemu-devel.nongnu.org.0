Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABA76AD1CE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:41:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJWH-0004IU-Hf; Mon, 06 Mar 2023 17:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pZJWF-0004IH-Bf
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:41:23 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pZJWB-0004wF-5T
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:41:21 -0500
Received: by mail-ed1-x52a.google.com with SMTP id o12so45152523edb.9
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678142476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MOWQLJNQwmgQCnywv5a8XYdJbSQGIHqwS97VT4bpS9o=;
 b=ZmcJFzNwdTb+XW5z1vYQWb105iGvVTEXLlelIDmaTgQOIZnkKAEW2huFtcDOXFc1p8
 P+aFOVWcqbJmX2soYwf0g43BHdrDOxGd8aeiLgzhZBLyDYQ452r66QpQuKVnO5Js+lLe
 iz8HdPEreY2zrhhyPWxNjp/BpF5ZlDvs3ONMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678142476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MOWQLJNQwmgQCnywv5a8XYdJbSQGIHqwS97VT4bpS9o=;
 b=VJ9z3A9a5sLliXbJCPdj4xqRoAegJlidlZRJgEclg7dZ89+p902pVjeMT+VM06vxpb
 uEE0U9g6DMVxo29JoAxiZyzzFDEkKZ0rl6cViUpeyHCRoxtWlla4IAfdn2teYSxBXIYA
 J74xABIhN0jbzQxH3gLSFuOU2QipN9vEDiWTIM9LbVp5Qvm6Q3BWjy90dN6NIzRvUD7h
 8lvJPDmVG3ptnCN7Gp8xkqUMqLtzATjkOmHkcCGtnFMWESw0MVwRk1n0tcdYB7mWgaIa
 EEwu/3y606jjWWGYAyk7S1mhwgYqM2Ux6kmJ9toBSGEu3qlP0BY9PUjWoIm4yXybE+oz
 EDdg==
X-Gm-Message-State: AO0yUKVkYBGHYeA2MU8K1ZtWAq7xGoEV9gcKzYTuEHUyrdQY3eVwstmx
 Q4bPYfYYua+5G5FMbRy38+GAtkzJINK0RUWFAFJI76wM
X-Google-Smtp-Source: AK7set/1TFunT8FKKdkVcI9kRa1kuBL6sLNANa354SXU7O/x28va+DH4EDkQ2gcWOSKduOVFVczVdg==
X-Received: by 2002:a17:906:d51:b0:886:50d:be8d with SMTP id
 r17-20020a1709060d5100b00886050dbe8dmr14614735ejh.13.1678142475885; 
 Mon, 06 Mar 2023 14:41:15 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 p20-20020a17090653d400b008e97fdd6c7csm5097171ejo.129.2023.03.06.14.41.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 14:41:15 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id da10so45303406edb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:41:15 -0800 (PST)
X-Received: by 2002:a17:906:a4b:b0:879:9c05:f5fb with SMTP id
 x11-20020a1709060a4b00b008799c05f5fbmr6073100ejf.5.1678142474910; Mon, 06 Mar
 2023 14:41:14 -0800 (PST)
MIME-Version: 1.0
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <877cx46jjg.fsf@linaro.org>
 <fc74d071-2563-ee8c-ab7e-c5d4a2f3b0cc@collabora.com>
In-Reply-To: <fc74d071-2563-ee8c-ab7e-c5d4a2f3b0cc@collabora.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 6 Mar 2023 14:41:03 -0800
X-Gmail-Original-Message-ID: <CAAfnVBmiB=fokNztOj4XR=6d1U7JFGK9Z0wcyfVYBu_bDmWPbQ@mail.gmail.com>
Message-ID: <CAAfnVBmiB=fokNztOj4XR=6d1U7JFGK9Z0wcyfVYBu_bDmWPbQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] virtio-gpu: Support Venus Vulkan driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 gert.wollny@collabora.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=gurchetansingh@chromium.org; helo=mail-ed1-x52a.google.com
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

On Tue, Jan 31, 2023 at 3:15=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Hello,
>
> On 1/30/23 20:00, Alex Benn=C3=A9e wrote:
> >
> > Antonio Caggiano <antonio.caggiano@collabora.com> writes:
> >
> >> This series of patches enables support for the Venus VirtIO-GPU Vulkan
> >> driver by adding some features required by the driver:
> >>
> >> - CONTEXT_INIT
> >> - HOSTMEM
> >> - RESOURCE_UUID
> >> - BLOB_RESOURCES
> >>
> >> In addition to these features, Venus capset support was required
> >> together with the implementation for Virgl blob resource commands.
> >
> > I managed to apply to current master but I needed a bunch of patches to
> > get it to compile with my old virgl:
>
> Thank you for reviewing and testing the patches! Antonio isn't working
> on Venus anymore, I'm going to continue this effort. Last year we
> stabilized some of the virglrenderer Venus APIs, this year Venus may
> transition to supporting per-context fences only and require to init a
> renderserver, which will result in a more changes to Qemu. I'm going to
> wait a bit for Venus to settle down and then make a v4.
>
> In the end we will either need to add more #ifdefs if we will want to
> keep supporting older virglrenderer versions in Qemu, or bump the min
> required virglrenderer version.

Hi Dmitry,

Thanks for working on this, it's great to see QEMU graphics moving
forward.  I noticed a few things from your patchset:

1)  Older versions of virglrenderer -- supported or not?

As you alluded to, there have been significant changes to
virglrenderer since the last QEMU graphics update.  For example, the
asynchronous callback introduces an entirely different and
incompatible way to signal fence completion.

Notionally, QEMU must support older versions of virglrenderer, though
in practice I'm not sure how much that is true.  If we want to keep up
the notion that older versions must be supported, you'll need:

a) virtio-gpu-virgl.c
b) virtio-gpu-virgl2.c (or an equivalent)

Similarly for the vhost-user paths (if you want to support that).  If
older versions of virglrenderer don't need to be supported, then that
would simplify the amount of additional paths/#ifdefs.

2) Additional context type: gfxstream [i]?

One of the major motivations for adding context types in the
virtio-gpu spec was supporting gfxstream.  gfxstream is used in the
Android Studio emulator (a variant of QEMU) [ii], among other places.
That would move the Android emulator closer to the goal of using
upstream QEMU for everything.

If (1) is resolved, I don't think it's actually too bad to add
gfxstream support.  We just need an additional layer of dispatch
between virglrenderer and gfxstream (thus, virtio-gpu-virgl2.c would
be renamed virtio-gpu-context-types.c or something similar).  The QEMU
command line will have to be modified to pass in the enabled context
type (--context=3D{virgl, venus, gfxstream}).  crosvm has been using the
same trick.

If (1) is resolved in v4, I would estimate adding gfxstream support
would at max take 1-2 months for a single engineer.  I'm not saying
gfxstream need necessarily be a part of a v5 patch-stack, but given
this patch-stack has been around for 1 year plus, it certainly could
be.  We can certainly design things in such a way that adding
gfxstream is easy subsequently.

The hardest part is actually package management (Debian) for
gfxstream, but those can be resolved.

I'm not sure exactly how QEMU accelerated graphics are utilized in
user-facing actual products currently, so not sure what the standard
is.

What do QEMU maintainers and users think about these issues,
particularly about the potential gfxstream addition in QEMU as a
context type?  We are most interested in Android guests.

[i] https://android.googlesource.com/device/generic/vulkan-cereal/
[ii] https://developer.android.com/studio/run/emulator

>
> --
> Best regards,
> Dmitry
>
>

