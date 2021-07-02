Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7AF3BA0B6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 14:48:29 +0200 (CEST)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIaq-0005iU-HP
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 08:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzIZ9-0004sd-LI; Fri, 02 Jul 2021 08:46:44 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:42876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzIZ5-000399-Lb; Fri, 02 Jul 2021 08:46:43 -0400
Received: by mail-il1-x130.google.com with SMTP id h3so9585657ilc.9;
 Fri, 02 Jul 2021 05:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=khXChB4JS2UUWSEr9d1pyr++RVk92rCjJJDAIGnRG4s=;
 b=fE7bwoKEPYeDSOCBoXCmC5t8DKNOE58CDeAZB+V2/l8/KqWPlwZoMqcuUUafWl5evL
 mPP/1/4HSiC8DEOSwH4Zqn1aHuk9a2Hb3oHSTwZt+KYF2DnJCU162kJ/PizG0nrHlmop
 6NmoLhXq6AX4OuKMgyNbaxsN6zqcF5YpyiKqYJOUX8ekvMS3CGGCxAS4EzoQuUEBZWUc
 Ys56iy1vcClYhcg5p828YiCPIz8zkX6T4oxwtf2u5GWNYi0dwtgwcLOWWLHVtwLnY3lU
 ueCw7rwFhSnu3bL3nlpZdXXilrYTBQhowd9XM6I+Ml/jw+RuYUZz7OscWpMLwcyV+Iwr
 HXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=khXChB4JS2UUWSEr9d1pyr++RVk92rCjJJDAIGnRG4s=;
 b=bdofvlW3ZmyBI2KGuehkBADcf49p6xlQXgd5QlFz9mwfXH40YVsKDbEkcCooFNzMaE
 tpnO7YHgWkv0RulHEnHeB+PM4E/Wdjpo0M0IXnM5Nj0oZV9okK7QmIWoXy3fkgpNvfKn
 121PTNl+a4k63mi1lWg1Lyjk7LI1uOStYaMGs0wqpFnM0yqlO4ft9Oe3zeTCO9FEp3Eq
 uiK4A84JTLG+AYnMwEAYZ/GMaE3QhIdOORTIUP4M0a301JSCGCLeq8v+k7x55sbtFzm3
 +MSxoKgE5gZ9UceloPMGU9G00uvqcygDtgWRoaq2txB/LkRmT/GRsoHhokVUDlQ1g0tb
 ItOw==
X-Gm-Message-State: AOAM530qi4I/bPUz7lwD15t+8umPvEEUxj5syPhqLZyYu3mOtzHQSA/i
 1G7DWAd6GrR4UDGVbba0lgIlT0WhDM3OQoyeOdc=
X-Google-Smtp-Source: ABdhPJxr7URT66rQGiWu7+Xv62q/GaNsh2oZdvjEdKDOForBGdPnZV0IKMYGmNE+u76CoyVMr7cZURAS72+3MAVpOhM=
X-Received: by 2002:a05:6e02:18c9:: with SMTP id
 s9mr1237083ilu.220.1625229998389; 
 Fri, 02 Jul 2021 05:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210702090935.15300-1-pl@kamp.de>
In-Reply-To: <20210702090935.15300-1-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 2 Jul 2021 14:46:17 +0200
Message-ID: <CAOi1vP_vYeMf+J2SkBef5VFcHMq++sBmDN_ffPWh0Wz8vtBHhg@mail.gmail.com>
Subject: Re: [PATCH V4 0/6] block/rbd: migrate to coroutines and add write
 zeroes support
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=idryomov@gmail.com; helo=mail-il1-x130.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, mreitz@redhat.com,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 2, 2021 at 11:09 AM Peter Lieven <pl@kamp.de> wrote:
>
> this series migrates the qemu rbd driver from the old aio emulation
> to native coroutines and adds write zeroes support which is important
> for block operations.
>
> To achive this we first bump the librbd requirement to the already
> outdated luminous release of ceph to get rid of some wrappers and
> ifdef'ry in the code.
>
> V4->V4:
>  - this patch is now rebased on top of current master
>  - Patch 1: just mention librbd, tweak version numbers [Ilya]
>  - Patch 3: use rbd_get_size instead of rbd_stat [Ilya]
>  - Patch 4: retain comment about using a BH in the callback [Ilya]
>  - Patch 5: set BDRV_REQ_NO_FALLBACK and silently ignore BDRV_REQ_MAY_UNMAP [Ilya]
>
> V2->V3:
>  - this patch is now rebased on top of current master
>  - Patch 1: only use cc.links and not cc.run to not break
>    cross-compiling. [Kevin]
>    Since Qemu 6.1 its okay to rely on librbd >= 12.x since RHEL-7
>    support was dropped [Daniel]
>  - Patch 4: dropped
>  - Patch 5: store BDS in RBDTask and use bdrv_get_aio_context() [Kevin]
>
> V1->V2:
>  - this patch is now rebased on top of current master with Paolos
>    upcoming fixes for the meson.build script included:
>     - meson: accept either shared or static libraries if --disable-static
>     - meson: honor --enable-rbd if cc.links test fails
>  - Patch 1: adjusted to meson.build script
>  - Patch 2: unchanged
>  - Patch 3: new patch
>  - Patch 4: do not implement empty detach_aio_context callback [Jason]
>  - Patch 5: - fix aio completion cleanup in error case [Jason]
>             - return error codes from librbd
>  - Patch 6: - add support for thick provisioning [Jason]
>             - do not set write zeroes alignment
>  - Patch 7: new patch
>
> Peter Lieven (6):
>   block/rbd: bump librbd requirement to luminous release
>   block/rbd: store object_size in BDRVRBDState
>   block/rbd: update s->image_size in qemu_rbd_getlength
>   block/rbd: migrate from aio to coroutines
>   block/rbd: add write zeroes support
>   block/rbd: drop qemu_rbd_refresh_limits
>
>  block/rbd.c | 406 ++++++++++++++++------------------------------------
>  meson.build |   7 +-
>  2 files changed, 128 insertions(+), 285 deletions(-)
>
> --
> 2.17.1
>
>

Looks good to me!

Kevin picked up Or's encryption patch, so there are a few simple
conflicts with https://repo.or.cz/qemu/kevin.git block now.  Do you
want to rebase on top of Kevin's block branch and repost with
"Based-on: <20210627114635.39326-1-oro@il.ibm.com>" or some such in
the cover letter or should I?

Thanks,

                Ilya

