Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CB53B9F58
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:53:51 +0200 (CEST)
Received: from localhost ([::1]:33250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGnu-00022w-JO
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzGg0-0005vC-37; Fri, 02 Jul 2021 06:45:40 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:37461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzGfy-0002PW-Gn; Fri, 02 Jul 2021 06:45:39 -0400
Received: by mail-il1-x134.google.com with SMTP id i13so9304902ilu.4;
 Fri, 02 Jul 2021 03:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jkcbQJ6oHo1Y0xo7BhcVKOg1wrcLVvqq39jfaYD79s0=;
 b=Sn2uSu/1rYPiJzhcbTG6eRjjUs7b9nHZLAqjO/dI8wVZUj6S3G9lAY015CipeJRVyQ
 TTU9Sajgf2eYZRCo0ozhREnR41ST/uBGTFKwKRvoKgvz01mww3FnHsfBkuuBvIOg9/yS
 R4siz0TJSKJqjA1it32nj5bYb8qC7eEAybOqrzGegJEb4hg1F3wfq1F64Cg6gaig5Ri/
 /XT7z9axwpOORL8AP+LFXZGaEF3TGgDaBbCaFfJjsib2Me+zp6VLi6hGe0hi9MTQdE+8
 kfGJyJNzpaEK0K4HmJ24vvU0cvcxQrlC6iygTu3peIpRUAn2ExHE1ksIEyLxkZjEOfnC
 P3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jkcbQJ6oHo1Y0xo7BhcVKOg1wrcLVvqq39jfaYD79s0=;
 b=BOOkGLWAYigYbcMGQO1B6Z482CSatYFz1nUeEkW29jFpnlBPyIeFuGTgqiGh+/wZbK
 2Wn8ZfLsHJAF35mlQt4MyC4UnmKtDt3SeEY0DBs3F41hNQv/tHx6k2VUVhDfnBQdtw44
 t+6s6VUsy7dEZ5+tV2h8px9uSBiRyRYdieNPjJGgeEvwsglj/Uxi5bZG9CmhNdj7w/KH
 WutCioLPhKdBcCnJsWN7pVPFSFPSoj6KF6AWZhWafLmqs8lWwHNu2iNjjkqK+aEJF2lb
 8IcN+c4eLtQD9KcsovBq/j9pqGO6TAJ/Waz6Rgsf1/d7pxl+MIcjyjRRaSul/eS751CM
 FNKw==
X-Gm-Message-State: AOAM5306NYNGb4kohxeO+NjxMj0FWH8OMHmS4OcGgPWefjHrXod0hbdL
 NUmi9aSrLE3YdC05pac8OI1fe+ZPLZXbbMRFRo0=
X-Google-Smtp-Source: ABdhPJw5esJI9/j0GC1bMNP40HLgB3C8QyKRoPmFGnjVd62gY2wVMPf3nhAf36jF6KsPrzFuY9kSEBB8PZZ2uQgbVf8=
X-Received: by 2002:a05:6e02:50e:: with SMTP id
 d14mr102713ils.281.1625222736840; 
 Fri, 02 Jul 2021 03:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210702090935.15300-1-pl@kamp.de>
 <20210702090935.15300-4-pl@kamp.de>
In-Reply-To: <20210702090935.15300-4-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 2 Jul 2021 12:45:15 +0200
Message-ID: <CAOi1vP9pBm=edyj+ZSh9ixzCp5o3Z=UJMxBatWSTpUc5z2ymKg@mail.gmail.com>
Subject: Re: [PATCH V4 3/6] block/rbd: update s->image_size in
 qemu_rbd_getlength
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=idryomov@gmail.com; helo=mail-il1-x134.google.com
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
> while at it just call rbd_get_size and avoid rbd_stat.
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index b4caea4f1b..1f8dc84079 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -968,15 +968,14 @@ static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
>  static int64_t qemu_rbd_getlength(BlockDriverState *bs)
>  {
>      BDRVRBDState *s = bs->opaque;
> -    rbd_image_info_t info;
>      int r;
>
> -    r = rbd_stat(s->image, &info, sizeof(info));
> +    r = rbd_get_size(s->image, &s->image_size);
>      if (r < 0) {
>          return r;
>      }
>
> -    return info.size;
> +    return s->image_size;
>  }
>
>  static int coroutine_fn qemu_rbd_co_truncate(BlockDriverState *bs,
> --
> 2.17.1
>
>

Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

