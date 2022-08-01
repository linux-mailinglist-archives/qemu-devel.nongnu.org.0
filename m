Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760B6586D64
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 17:08:08 +0200 (CEST)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIX1b-0002Os-9K
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 11:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWvQ-0007J4-69; Mon, 01 Aug 2022 11:01:46 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:35736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWvO-0000dG-BH; Mon, 01 Aug 2022 11:01:43 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-32269d60830so111909797b3.2; 
 Mon, 01 Aug 2022 08:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=vmSB0cfqwbxWnG8qJ3vr848uMHvq8DO9p2tIsRDaW+Q=;
 b=F94oTnTyeAgunVApFSDsewDKMaDIdNHqLFhqH9icY6+JzHWaSVmsn/f6K4QY1Xp9aT
 10JnXHGGgbZjgIX2MoXqweluHhfeWOELzepSr/OdSxvZGANFo/6Y6Y+odn03TWLtgzKC
 d1Djub9RednfZddjObbplpZtHi9LbHmz8SOwsWkJPTenf20UQO1mMtJjA3LhyqdpPL+J
 RPA4TJU+NcGt9yn6rhJI2DlQsh1rtlxaiM0naiIhVZMbNfVVXuEicWj7V+oSRqt6t211
 TdN1y7ilAmv1/umddpc8vgxfjg8Us5Ec26clgMUuH2fWGLzagcZvT1B62xowObuBfC1c
 hgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=vmSB0cfqwbxWnG8qJ3vr848uMHvq8DO9p2tIsRDaW+Q=;
 b=oZ9QPeoAfDmc/2QTPMDGqEwT+qBoUTxzZ4BBS9yTBTsyWyPZ22LpgAEzYvvpAaBtRr
 dUiffZiZMGW2LLbaVUm3B1siNG91d9L4NWOnZ1dLOztFzhEK7UxbZNiz+U6Wzp7MNWHE
 iAdy9ZLZ1HGPG3jxaq/8AGMHjFm1BZiuj2vWTU7LyaXl3KeubcnVyUS+E18F88cKQfaY
 kGajXXwj3DusvROq/rJ5qgCAY7+GEm5hQcUQGNkmzjw+GAXHNM+L3UcLdxpBjD0BQhbM
 e5My+A+VAnKLFCmdpf9+t3wraSfyoY/YSi/ODovtF31gy+2tXaz9LUxxn05PF6sRjMBz
 8aUQ==
X-Gm-Message-State: ACgBeo3MPFBJHj7ilJUxc0mF85OUPjT6H58hYQv6W6mSm8nWuIj6nWLc
 a9HjJUz8R7P7vXIXwWTYsborkgz4y/0jXMMA4T4=
X-Google-Smtp-Source: AA6agR5QwoiH1CW0G31HWGEAJugeCVn3D/BkBhg+AHcH5/w+KKkYB7WNMk54lsC2QNhoy62amNULi3I/0ggKiagogoA=
X-Received: by 2002:a81:8801:0:b0:324:68a0:ea7c with SMTP id
 y1-20020a818801000000b0032468a0ea7cmr10729143ywf.156.1659366100655; Mon, 01
 Aug 2022 08:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220801013333.10644-1-faithilikerun@gmail.com>
In-Reply-To: <20220801013333.10644-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 1 Aug 2022 11:01:29 -0400
Message-ID: <CAJSP0QXZoVqmMasEGv2q86uh8sJNBOweSxh2XG5H8=N=CMGwuA@mail.gmail.com>
Subject: Re: [RFC v5 07/11] config: add check to block layer
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com, 
 dmitry.fomichev@wdc.com, hare@suse.de, stefanha@redhat.com, mst@redhat.com, 
 armbru@redhat.com, qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, 
 hreitz@redhat.com, eblake@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 31 Jul 2022 at 21:39, Sam Li <faithilikerun@gmail.com> wrote:
>
> Putting zoned/non-zoned BlockDrivers on top of each other is not
> allowed.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block.c                          | 13 +++++++++++++
>  block/file-posix.c               |  2 ++
>  block/raw-format.c               |  1 +
>  include/block/block_int-common.h | 10 ++++++++++
>  4 files changed, 26 insertions(+)
>
> diff --git a/block.c b/block.c
> index bc85f46eed..8a259b158c 100644
> --- a/block.c
> +++ b/block.c
> @@ -7947,6 +7947,19 @@ void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
>          return;
>      }
>
> +    /*
> +     * Non-zoned block drivers do not follow zoned storage constraints
> +     * (i.e. sequential writes to zones). Refuse mixing zoned and non-zoned
> +     * drivers in a graph.
> +     */
> +    if (!parent_bs->drv->supports_zoned_children && child_bs->drv->is_zoned) {
> +        error_setg(errp, "Cannot add a %s child to a %s parent",
> +                   child_bs->drv->is_zoned ? "zoned" : "non-zoned",
> +                   parent_bs->drv->supports_zoned_children ?
> +                   "support zoned children" : "not support zoned children");
> +        return;
> +    }
> +
>      if (!QLIST_EMPTY(&child_bs->parents)) {
>          error_setg(errp, "The node %s already has a parent",
>                     child_bs->node_name);
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 6c045eb6e8..8eb0b7bc9b 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -4023,6 +4023,8 @@ static BlockDriver bdrv_zoned_host_device = {
>          .format_name = "zoned_host_device",
>          .protocol_name = "zoned_host_device",
>          .instance_size = sizeof(BDRVRawState),
> +        .is_zoned = true,
> +        .supports_zoned_children = true,

zoned_host_device never has children, so supports_zoned_children
should not be set.

>          .bdrv_needs_filename = true,
>          .bdrv_probe_device  = hdev_probe_device,
>          .bdrv_parse_filename = zoned_host_device_parse_filename,
> diff --git a/block/raw-format.c b/block/raw-format.c
> index 6b20bd22ef..9441536819 100644
> --- a/block/raw-format.c
> +++ b/block/raw-format.c
> @@ -614,6 +614,7 @@ static void raw_child_perm(BlockDriverState *bs, BdrvChild *c,
>  BlockDriver bdrv_raw = {
>      .format_name          = "raw",
>      .instance_size        = sizeof(BDRVRawState),
> +    .supports_zoned_children = true,
>      .bdrv_probe           = &raw_probe,
>      .bdrv_reopen_prepare  = &raw_reopen_prepare,
>      .bdrv_reopen_commit   = &raw_reopen_commit,
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index de44c7b6f4..0476cd0491 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -126,6 +126,16 @@ struct BlockDriver {
>       */
>      bool is_format;
>
> +    /*
> +     * Set to true if the BlockDriver is a zoned block driver.
> +     */
> +    bool is_zoned;
> +
> +    /*
> +     * Set to true if the BlockDriver supports zoned children.
> +     */
> +    bool supports_zoned_children;
> +
>      /*
>       * Drivers not implementing bdrv_parse_filename nor bdrv_open should have
>       * this field set to true, except ones that are defined only by their
> --
> 2.37.1
>
>

