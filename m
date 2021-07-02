Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301403BA483
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 21:57:10 +0200 (CEST)
Received: from localhost ([::1]:37442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzPHg-0004Vh-PO
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 15:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzPGN-0003eX-SB; Fri, 02 Jul 2021 15:55:47 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:38523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzPGJ-0002Ec-IB; Fri, 02 Jul 2021 15:55:47 -0400
Received: by mail-il1-x136.google.com with SMTP id v5so10811237ilo.5;
 Fri, 02 Jul 2021 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vTrqICbMMBQP3CsiQ3Ihm1ecJ+A/v+Cha2xh4BRPwNg=;
 b=pdAy3aTmrJ7QlBSfSNTZAxoII33MUTJqD12AHlpk+Hlkww0DWRM/Kr6PLispeJfOKt
 oG7XRHlVoesK5FxpyGKauVRA94Pm2K8xRugaXDzDtPIJTX86dKdkTAqZvaluNKP2mrNm
 M6S5SIiLlWUim6Kb3LRUrHuTBrUkNTjiChAYSSjL9WxzfBVzSgAVY3xxQK+d3a14RLLD
 sB5dfMhILEnty4pj9Hz2hSPxjaosUAkdHcgCSCV29wxqU3z22p9sJsJ2S14w62Hp7x0O
 tdknkXz4FLb5R4gQVu681SPeySLVlF4laGbtNFL0sMCagy9Wn/sMqaWm8LzwRcEY1RwW
 gmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vTrqICbMMBQP3CsiQ3Ihm1ecJ+A/v+Cha2xh4BRPwNg=;
 b=qpuYs3A2gLoERYcXLmynnis9tHQk3AOMLvhfcgX1IKHwh3k/catSnyAYPLR43vV1pz
 Wyav8QzG4g0hkP+zkN7hxw0VMa4Sra6sft8eNIo0MxndT/RRdwhG2/ivwCSUlzY0BR/a
 xbYlKdduEhJ+3YucrTT9DLfenU4SUQP6YEUNbdqFCuFae10GaiX3G+/84HCA/uzaEhRd
 GWH4//CzJyb8wpmqSRBiGGoe+eNvSCghJhUsmzLWO0ot6d47ht6tPU4ZhStBtrs1QpA6
 OmcvHSDEMcrv36LvEG+0bM/W2g3dJeNQj05ZqDqDw2LrLrZWZ5k1TXZ+Zth4pHS7Cym8
 5eyQ==
X-Gm-Message-State: AOAM532MEPIfPk4qeaxPXU2dyehgrgYPTRd1nxXJweww9UG4Ls/ZecJr
 bcLv6d0jh4KszrrNNG+ePKXyZ9JhKp3CPcRdx0ucwLiV8TuYGA==
X-Google-Smtp-Source: ABdhPJwH7urVwKvR7u8jUj6vO/fK7v4GJChuUscaiRiAxf/0dQ+Z3tdg/DhdjlZp0wIjz97CzhMc/qXQIwRZesenj2Q=
X-Received: by 2002:a92:c708:: with SMTP id a8mr1081220ilp.177.1625255740583; 
 Fri, 02 Jul 2021 12:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210702172356.11574-1-idryomov@gmail.com>
In-Reply-To: <20210702172356.11574-1-idryomov@gmail.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 2 Jul 2021 21:55:19 +0200
Message-ID: <CAOi1vP89m5FC5nLPWM2_h1R1eMFT6UMOMaLP7wutcZPrsram7A@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] block/rbd: migrate to coroutines and add write
 zeroes support
To: qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=idryomov@gmail.com; helo=mail-il1-x136.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 ct@flyingcircus.io, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 2, 2021 at 7:24 PM Ilya Dryomov <idryomov@gmail.com> wrote:
>
> This series migrates the qemu rbd driver from the old aio emulation
> to native coroutines and adds write zeroes support which is important
> for block operations.
>
> To achieve this we first bump the librbd requirement to the already
> outdated luminous release of ceph to get rid of some wrappers and
> ifdef'ry in the code.
>
> V4->V5:
>  - rebase on Kevin's block branch (https://repo.or.cz/qemu/kevin.git block)
>    to resolve conflicts with "block/rbd: Add support for rbd image encryption"
>    patch
>
> V3->V4:
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
> 2.19.2
>

Attempting to suit patchew:

Based-on: <20210627114635.39326-1-oro@il.ibm.com>
([PATCH v2] block/rbd: Add support for rbd image encryption)

Thanks,

                Ilya

