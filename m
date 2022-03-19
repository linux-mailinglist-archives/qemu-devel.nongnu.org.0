Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6573D4DE7E1
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 13:34:43 +0100 (CET)
Received: from localhost ([::1]:55694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVYI6-0005Ds-4q
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 08:34:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1nVYGk-0004XW-43; Sat, 19 Mar 2022 08:33:18 -0400
Received: from [2607:f8b0:4864:20::a30] (port=42542
 helo=mail-vk1-xa30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1nVYGi-0001EN-Bq; Sat, 19 Mar 2022 08:33:17 -0400
Received: by mail-vk1-xa30.google.com with SMTP id c4so5744953vkq.9;
 Sat, 19 Mar 2022 05:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bfWqVu2iqbrkbw+owjRYdQCn+AH6d6W7qfIFTyLJIQQ=;
 b=oGk5Oji/diMaSe3n3nMjUrZOTGoxbCEfAnBesJxueRK03EHR9aB0egubXsZstZQhrz
 cmrIXCzH0K4i/9bzeTO/PP9mhC6Cliz3aCl3cm4YixaYkbyIP91DZjeo+czP38TNQZ5W
 SqMaRcmtzBjzODYx7NP4bomVkU12j5nYlqkW6YXMRT1DgC1UGID7M7OwP/k4KNGO4+L1
 OujLfTgYnOT/P1PHyIioy15/kMLJga5qqe2aX5lWXOri36LugeMEZQkUXF3IXgHWWQ0d
 IeVggH3uJBzoYPyeFgnFtpy4fgo4vUOyiZa7ap4QncMpFwCLqVSRD9QRRTT6jec8pHnO
 F1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bfWqVu2iqbrkbw+owjRYdQCn+AH6d6W7qfIFTyLJIQQ=;
 b=bDko4v9ELu/VW9yirnrdsiMry/BH3uyj0Y7e1kNrEfRx51Lc9p+sstWUUb0AjWcohS
 dzAa6XgHoOrmGbBcLU7xbRgoxUyeEwd24uF/+G6lqXLmhi4jTP4rmxzLA6DfR1AZCkXB
 f79nSlR4cAopubG1pHTB3QDBw+vLIu+GmUHOi4Ds7gDiaUfqn13sQV814VamWmFaYKK6
 Px7/YFFGfkyQW+Z3b0qvw72fJ4eYzPKE4drkGL+9bSCHPM4I3mK/6U92aTWu0HLh1Gpz
 nxXRI0j4zne5lP59QWQ7xZB9xFildSUCBte1mRkLrjqO0kjrej4hmC/3iWOhvuxjoMz1
 fp8g==
X-Gm-Message-State: AOAM532CPc51/1QK7gsI81l5xQXueeo+LCybP5ec/fzG8fT78E9DsOvS
 JrjhX3R6gEkp6asVr8IjiTTyRH3H10pdftkktQM=
X-Google-Smtp-Source: ABdhPJwZ4BXsLdFaCPu2+1JLMBumKNQEmME05o6gVVX6+FhzI6QVmvc0jVGuj88Jx3TqXM1L+DEwmxUfBQozxFzD+vA=
X-Received: by 2002:a1f:2e95:0:b0:33e:bd23:f1f with SMTP id
 u143-20020a1f2e95000000b0033ebd230f1fmr2063400vku.1.1647693194698; Sat, 19
 Mar 2022 05:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220317162638.41192-1-sgarzare@redhat.com>
In-Reply-To: <20220317162638.41192-1-sgarzare@redhat.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sat, 19 Mar 2022 13:33:46 +0100
Message-ID: <CAOi1vP8c2hLuK9LhEM1FHYhKisY0F2xbbD03cAyYTaXqXp4h9g@mail.gmail.com>
Subject: Re: [PATCH] block/rbd: fix write zeroes with growing images
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=idryomov@gmail.com; helo=mail-vk1-xa30.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 qemu block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 5:26 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> Commit d24f80234b ("block/rbd: increase dynamically the image size")
> added a workaround to support growing images (eg. qcow2), resizing
> the image before write operations that exceed the current size.
>
> We recently added support for write zeroes and without the
> workaround we can have problems with qcow2.
>
> So let's move the resize into qemu_rbd_start_co() and do it when
> the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.
>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2020993
> Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  block/rbd.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 8f183eba2a..6caf35cbba 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -1107,6 +1107,20 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
>
>      assert(!qiov || qiov->size == bytes);
>
> +    if (cmd == RBD_AIO_WRITE || cmd == RBD_AIO_WRITE_ZEROES) {
> +        /*
> +         * RBD APIs don't allow us to write more than actual size, so in order
> +         * to support growing images, we resize the image before write
> +         * operations that exceed the current size.
> +         */
> +        if (offset + bytes > s->image_size) {
> +            int r = qemu_rbd_resize(bs, offset + bytes);
> +            if (r < 0) {
> +                return r;
> +            }
> +        }
> +    }
> +
>      r = rbd_aio_create_completion(&task,
>                                    (rbd_callback_t) qemu_rbd_completion_cb, &c);
>      if (r < 0) {
> @@ -1182,18 +1196,6 @@ coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, int64_t offset,
>                                   int64_t bytes, QEMUIOVector *qiov,
>                                   BdrvRequestFlags flags)
>  {
> -    BDRVRBDState *s = bs->opaque;
> -    /*
> -     * RBD APIs don't allow us to write more than actual size, so in order
> -     * to support growing images, we resize the image before write
> -     * operations that exceed the current size.
> -     */
> -    if (offset + bytes > s->image_size) {
> -        int r = qemu_rbd_resize(bs, offset + bytes);
> -        if (r < 0) {
> -            return r;
> -        }
> -    }
>      return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_WRITE);
>  }
>
> --
> 2.35.1
>

Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

