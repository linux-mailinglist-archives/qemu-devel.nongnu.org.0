Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA38F5F9846
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 08:22:11 +0200 (CEST)
Received: from localhost ([::1]:45920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohmB0-0007Rl-El
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 02:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1ohm0c-0007jP-SY; Mon, 10 Oct 2022 02:11:26 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:55050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1ohm0b-0005gK-0F; Mon, 10 Oct 2022 02:11:26 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5BE26218EE;
 Mon, 10 Oct 2022 06:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665382283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mvINi9s0xagNlUb7JX01UsI3QdolYyi656tlgk8+shU=;
 b=dHtOCNEZAM5IIeVU4N829n8aj2R9mLbqUCSKqjAf4FDvjmTiZCjNdm4/jKWoe+0q/PQ9GH
 ew0JX2tcJrac7KJa6PbmEic1NOaK8I7fc0wOQRn6Vq5pVCuQ+DV48f/Q6gDWBYxtZWupYM
 qExWFx/jNt+D2YI72hnG7DWQtMZSW2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665382283;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mvINi9s0xagNlUb7JX01UsI3QdolYyi656tlgk8+shU=;
 b=iesJdzJCT+mJLa4k+gEKxLizeiH5G3/7YegTjNC0MB+cSacwQGqcLrC6io5NO4MRozjwY0
 ej6raMDjsLdiVVBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E998613ACA;
 Mon, 10 Oct 2022 06:11:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WhzPN4q3Q2PnNwAAMHmgww
 (envelope-from <hare@suse.de>); Mon, 10 Oct 2022 06:11:22 +0000
Message-ID: <768bf339-31c1-8300-7342-0f1ee5c00071@suse.de>
Date: Mon, 10 Oct 2022 08:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v11 5/7] config: add check to block layer
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 damien.lemoal@opensource.wdc.com
References: <20221010022116.41942-1-faithilikerun@gmail.com>
 <20221010022116.41942-6-faithilikerun@gmail.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20221010022116.41942-6-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=hare@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.934,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/22 04:21, Sam Li wrote:
> Putting zoned/non-zoned BlockDrivers on top of each other is not
> allowed.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block.c                          | 17 +++++++++++++++++
>   block/file-posix.c               | 13 +++++++++++++
>   block/raw-format.c               |  1 +
>   include/block/block_int-common.h |  5 +++++
>   4 files changed, 36 insertions(+)
>   mode change 100644 => 100755 block.c
>   mode change 100644 => 100755 block/file-posix.c
> 
> diff --git a/block.c b/block.c
> old mode 100644
> new mode 100755
> index bc85f46eed..bf2f2918e7
> --- a/block.c
> +++ b/block.c
> @@ -7947,6 +7947,23 @@ void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
>           return;
>       }
>   
> +    /*
> +     * Non-zoned block drivers do not follow zoned storage constraints
> +     * (i.e. sequential writes to zones). Refuse mixing zoned and non-zoned
> +     * drivers in a graph.
> +     */
> +    if (!parent_bs->drv->supports_zoned_children &&
> +        /* The host-aware model allows zoned storage constraints and random
> +         * write. Allow mixing host-aware and non-zoned drivers. Using
> +         * host-aware device as a regular device. */

It's a very unusual style to put comments inside a condition.
Please move it before or after the condition to keep the condition together.

> +        child_bs->bl.zoned == BLK_Z_HM) {
> +        error_setg(errp, "Cannot add a %s child to a %s parent",
> +                   child_bs->bl.zoned == BLK_Z_HM ? "zoned" : "non-zoned",
> +                   parent_bs->drv->supports_zoned_children ?
> +                   "support zoned children" : "not support zoned children");
> +        return;
> +    }
> +
>       if (!QLIST_EMPTY(&child_bs->parents)) {
>           error_setg(errp, "The node %s already has a parent",
>                      child_bs->node_name);
> diff --git a/block/file-posix.c b/block/file-posix.c
> old mode 100644
> new mode 100755
> index 226f5d48f5..a9d347292e
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -778,6 +778,19 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>               goto fail;
>           }
>       }
> +#ifdef CONFIG_BLKZONED
> +    /*
> +     * The kernel page cache does not reliably work for writes to SWR zones
> +     * of zoned block device because it can not guarantee the order of writes.
> +     */
> +    if (strcmp(bs->drv->format_name, "zoned_host_device") == 0) {
> +        if (!(s->open_flags & O_DIRECT)) {

You can join these conditions with '&&' and safe one level of intendation.

> +            error_setg(errp, "driver=zoned_host_device was specified, but it "
> +                             "requires cache.direct=on, which was not specified.");
> +            return -EINVAL; /* No host kernel page cache */
> +        }
> +    }
> +#endif
>   
>       if (S_ISBLK(st.st_mode)) {
>   #ifdef BLKDISCARDZEROES
> diff --git a/block/raw-format.c b/block/raw-format.c
> index 618c6b1ec2..b885688434 100644
> --- a/block/raw-format.c
> +++ b/block/raw-format.c
> @@ -614,6 +614,7 @@ static void raw_child_perm(BlockDriverState *bs, BdrvChild *c,
>   BlockDriver bdrv_raw = {
>       .format_name          = "raw",
>       .instance_size        = sizeof(BDRVRawState),
> +    .supports_zoned_children = true,
>       .bdrv_probe           = &raw_probe,
>       .bdrv_reopen_prepare  = &raw_reopen_prepare,
>       .bdrv_reopen_commit   = &raw_reopen_commit,
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index cdc06e77a6..37dddc603c 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -127,6 +127,11 @@ struct BlockDriver {
>        */
>       bool is_format;
>   
> +    /*
> +     * Set to true if the BlockDriver supports zoned children.
> +     */
> +    bool supports_zoned_children;
> +
>       /*
>        * Drivers not implementing bdrv_parse_filename nor bdrv_open should have
>        * this field set to true, except ones that are defined only by their

The remainder looks good.
Once you fixed the minor editing issues you can add:

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


