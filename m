Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159A23ADB98
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 22:12:20 +0200 (CEST)
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luhKF-00032P-52
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 16:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1luhIY-000241-Ke; Sat, 19 Jun 2021 16:10:34 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:36701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1luhIW-0000AS-L9; Sat, 19 Jun 2021 16:10:34 -0400
Received: by mail-io1-xd2a.google.com with SMTP id s19so4472345ioc.3;
 Sat, 19 Jun 2021 13:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hS+TtM19wtWlyJcXW4NYYw/2vh4jUKOS/mHzwCNW2W4=;
 b=Etai9qsxBZNHn2i+ZjurTdBTGg48yR85me6sWE1x0EanPHSPH551Nf0fQHe+vQiPS2
 to/tfUhKsQ/lZvwTuFbiI/gSsGOCYU7UVyeD/hS5IeJ7Ig9iPYOwb35TNuC6OL8WkoXR
 hXmU41q6WRXSdUd62DezvyZMoNkuhdDwvcO6F1Ik1daLBqhacWgG+VXuykHbgfRmhI6Z
 IEeXfce7YopFB6ligYF0jCzZjlTrfK7oZwwMNQ93Yuwhhu2+TS6d/2U94W7cynBKPMk5
 1z3uX3Qc/73WQcWMeQ3U6/O8ranvqGXhv6/1XyIeWkb0jy0GkxY9jp8jniM8ZrBPFpSy
 L2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hS+TtM19wtWlyJcXW4NYYw/2vh4jUKOS/mHzwCNW2W4=;
 b=h8RZhf8D2wcyLzuUFVnwv4gXmeVeIlRjTwTB13UjozZaJaLAdoulqeoEOs9ObuVPua
 Ul9pjMpJdm34ovDmJCOjfU04Bt9/qWfkA0Dn/uC2WOKAUrRfcCYExJoSjDNfeucynBx/
 uS+YbgAXJJ6hnolYQXTcMFJKKsgs40rnTFXdzpmcIM6CsOlc/V4ymRzTZU6v9vtQjIZy
 GdLOfz1Urnxvn+UBXTP1H3bTWlCaxkR7E3Z5blXoxy0+VCMNdumm2jCRz9mBZmWFZ+X7
 TCNdC0Laeq0vugQTaL2j/xwwBPo9xbiHlLQW/0QmbCUio29tznuXNV49b8eTUCHjJTE1
 oNBQ==
X-Gm-Message-State: AOAM531txNWFuEG+4xCtmoAYpkluBMvc3fN/EbMTvzHGt0A8IENumCr8
 iRzyjFhtW5xT5XbYIcCcciTMVJ/tHYZKibRivoE=
X-Google-Smtp-Source: ABdhPJwghLp7vu+AEaBabMZ9BR2IuMCX/4DBe3q5Ur/U9/bIf5SmQ6EluRctvqWQK5nWZUTEEsMBmYdgdwfib3NvIow=
X-Received: by 2002:a05:6602:21d2:: with SMTP id
 c18mr13528791ioc.7.1624133431202; 
 Sat, 19 Jun 2021 13:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210519142359.23083-1-pl@kamp.de>
 <20210519142359.23083-7-pl@kamp.de>
In-Reply-To: <20210519142359.23083-7-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sat, 19 Jun 2021 22:10:21 +0200
Message-ID: <CAOi1vP9-06+Gc2OzPB0vaVNfpY=yGxR8rw4Zx8vrtW=KdWoscw@mail.gmail.com>
Subject: Re: [PATCH V3 6/6] block/rbd: drop qemu_rbd_refresh_limits
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=idryomov@gmail.com; helo=mail-io1-xd2a.google.com
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, ct@flyingcircus.io, Paolo Bonzini <pbonzini@redhat.com>,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 4:26 PM Peter Lieven <pl@kamp.de> wrote:
>
> librbd supports 1 byte alignment for all aio operations.
>
> Currently, there is no API call to query limits from the ceph backend.
> So drop the bdrv_refresh_limits completely until there is such an API call.
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index ee13f08a74..368a674aa0 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -228,14 +228,6 @@ done:
>      return;
>  }
>
> -
> -static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
> -{
> -    /* XXX Does RBD support AIO on less than 512-byte alignment? */
> -    bs->bl.request_alignment = 512;
> -}
> -
> -
>  static int qemu_rbd_set_auth(rados_t cluster, BlockdevOptionsRbd *opts,
>                               Error **errp)
>  {
> @@ -1128,7 +1120,6 @@ static BlockDriver bdrv_rbd = {
>      .format_name            = "rbd",
>      .instance_size          = sizeof(BDRVRBDState),
>      .bdrv_parse_filename    = qemu_rbd_parse_filename,
> -    .bdrv_refresh_limits    = qemu_rbd_refresh_limits,
>      .bdrv_file_open         = qemu_rbd_open,
>      .bdrv_close             = qemu_rbd_close,
>      .bdrv_reopen_prepare    = qemu_rbd_reopen_prepare,
> --
> 2.17.1
>
>
>

librbd does support 1-byte-aligned I/O (with the caveat that those
code paths are probably not very well tested).  Regardless, I think
it is better to do read-modify-write and similar handling in librbd
than in QEMU.

Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

