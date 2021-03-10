Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8E13337DF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:54:32 +0100 (CET)
Received: from localhost ([::1]:60064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJubv-0005F1-6g
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWU-0008C3-Pu; Wed, 10 Mar 2021 03:48:54 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:34817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWT-0007zW-1R; Wed, 10 Mar 2021 03:48:54 -0500
Received: by mail-yb1-xb32.google.com with SMTP id p186so17056687ybg.2;
 Wed, 10 Mar 2021 00:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I9+335SXYDezG8Yo9E+0yqTNKjeMieiZ8blkq7Sl4qg=;
 b=pfr7u4hvsU57TPA5jtqTK7Pkwdk2LVH7SsyNXIlYyfODsBZqAF979X+yCza/wMdo5Q
 HpuZXUCadV0hFOgy47gI8INO0m70kk6PFvSjBcV8lLgBUSxgXeLaG0iXtFwP4B7av+2E
 +C0UCmkZRhMfibD+FqIes23waNQBV3C0vCvWpIaY/o9lMINs4bXNJWWkFO1caT4GivOC
 V6DGiVZ72bJHzUGnB6cveyM/JJ9ku/X4WiovceeRpV6Oxod9QtMMWV3o3jxuwWRoUQfP
 lGAQ3MB5mAjaba1sWC031Z+0xCXMtugSoV/LY6ChJyGuwoRTvgqJWEFaGt9aP5aP3+jS
 WG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I9+335SXYDezG8Yo9E+0yqTNKjeMieiZ8blkq7Sl4qg=;
 b=Jm3YuY8tLnNyYLCG8Nx+deAyflHdtduQ2/JWuIOzlt3pgayBaACeEOtAaqV28Dzig2
 gpNhipGrzTXWEfQGPyw6rMG+JzIDEsAYapdII2i6QdzCAJIzzD5J/vXXu2Q5fu+ybkC9
 S1b3FNj511ZQGbae9yGR7qASem9wlN7qO1cEDtzHa1iRRJ7HnlrXRprXmN+mkdR8p6yQ
 H+PoLsvKPy3m+5qC/2KJlX9FEXvYKsA19hHjbqP/5Sj33Ik+olrcD1L39imifmxo8PRK
 3yRgHmgP1XkdfVXMtMXkVR1vV1Xz2efir+VPNUSNZW0CAYOPxvQzQwMBnbfPxDsVzeGU
 sRkA==
X-Gm-Message-State: AOAM532Q4V3q7cfUiPU3BxP2MoqTyGRVrVHsyiAyy4TKWGmUX3pI/JH9
 mO9m3OaqjL3ZUAKybe+b3apLAF42frK5z6Yd4jU=
X-Google-Smtp-Source: ABdhPJxxn8MxX+6iQXyF8YJ24eOV+js573mLHQ9rTAc6tD/cSfOuvQlD4h3tKqT+2Qkw26E2bacwMf54RnfT3etYLiA=
X-Received: by 2002:a25:c090:: with SMTP id c138mr2589532ybf.314.1615366131368; 
 Wed, 10 Mar 2021 00:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-6-philmd@redhat.com>
In-Reply-To: <20210309235028.912078-6-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Mar 2021 16:48:39 +0800
Message-ID: <CAEUhbmVBjnZ9mFN0MkvRK_LVxVMiZc5ApkNkPf1gqqJEf8EwVQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] hw/block/pflash_cfi02: Open-code
 pflash_register_memory(rom=false)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 7:51 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> There is only one call to pflash_register_memory() with
> rom_mode =3D=3D false. As we want to modify pflash_register_memory()
> in the next patch, open-code this trivial function in place for
> the 'rom_mode =3D=3D false' case.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi02.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

