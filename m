Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4C857123C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 08:28:33 +0200 (CEST)
Received: from localhost ([::1]:55844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB9No-00081D-Bm
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 02:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1oB96Y-00069Q-EW; Tue, 12 Jul 2022 02:10:42 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1oB96W-0006yD-FE; Tue, 12 Jul 2022 02:10:42 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E547224BE;
 Tue, 12 Jul 2022 06:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657606237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obz3GBQ+eG+0umyBnQMaaxFRYyf2HTd/0U/gZADNaps=;
 b=jz+9HNXsXgx5YMJ2xtJodfpfVDqtnDWw603hvCOVBt6WRekCY4Ffy4yXHrefcTYDjCIEUt
 XcGEk6OVMdbhfzranwK4VarF7HoqyfwC4/Rl63BCFIm6SE1t2NGYe3BKTLY6WopGnPA6IG
 aRgUQwNGsdeUldOTXVzx9lDFPxaOIOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657606237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obz3GBQ+eG+0umyBnQMaaxFRYyf2HTd/0U/gZADNaps=;
 b=QOUE00RQY9j6esuv2RkTzgJNYBuUFbnRoLqE7/ZWieHxOewhSDtGO2FjXTsdbLOmTD/AjE
 lgCdYoOKEwaGUEDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14E4013A94;
 Tue, 12 Jul 2022 06:10:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5vZwBF0QzWKvcwAAMHmgww
 (envelope-from <hare@suse.de>); Tue, 12 Jul 2022 06:10:37 +0000
Message-ID: <f864ff9b-c8ed-2336-f5a8-d4819475dc0b@suse.de>
Date: Tue, 12 Jul 2022 08:10:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v4 1/9] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-2-faithilikerun@gmail.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20220712021345.8530-2-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=hare@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/12/22 04:13, Sam Li wrote:
> By adding zone management operations in BlockDriver, storage
> controller emulation can use the new block layer APIs including
> zone_report and zone_mgmt(open, close, finish, reset).
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>   block/block-backend.c            |  41 ++++++
>   block/coroutines.h               |   5 +
>   block/file-posix.c               | 236 +++++++++++++++++++++++++++++++
>   include/block/block-common.h     |  43 +++++-
>   include/block/block_int-common.h |  20 +++
>   5 files changed, 344 insertions(+), 1 deletion(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index f425b00793..0a05247ae4 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1806,6 +1806,47 @@ int blk_flush(BlockBackend *blk)
>       return ret;
>   }
>   
> +/*
> + * Send a zone_report command.
> + * offset can be any number within the zone size. No alignment for offset.
> + * nr_zones represents IN maximum and OUT actual.
> + */
> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> +                                    int64_t *nr_zones,
> +                                    BlockZoneDescriptor *zones)
> +{
> +    int ret;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk); /* increase before waiting */
> +    blk_wait_while_drained(blk);
> +    ret = bdrv_co_zone_report(blk->root->bs, offset, nr_zones, zones);
> +    blk_dec_in_flight(blk);
> +    return ret;
> +}
> +
> +/*
> + * Send a zone_management command.
> + * Offset is the start of a zone and len is aligned to zones.
> + */
> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
> +        int64_t offset, int64_t len)
> +{
> +    int ret;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk);
> +    blk_wait_while_drained(blk);
> +    ret = blk_check_byte_request(blk, offset, len);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    ret = bdrv_co_zone_mgmt(blk->root->bs, op, offset, len);
> +    blk_dec_in_flight(blk);
> +    return ret;
> +}
> +
>   void blk_drain(BlockBackend *blk)
>   {
>       BlockDriverState *bs = blk_bs(blk);
> diff --git a/block/coroutines.h b/block/coroutines.h
> index 830ecaa733..19aa96cc56 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -80,6 +80,11 @@ int coroutine_fn
>   blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
>   
>   int coroutine_fn blk_co_do_flush(BlockBackend *blk);
> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> +                                    int64_t *nr_zones,
> +                                    BlockZoneDescriptor *zones);
> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
> +                                  int64_t offset, int64_t len);
>   
>   
>   /*
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 48cd096624..e7523ae2ed 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -67,6 +67,7 @@
>   #include <sys/param.h>
>   #include <sys/syscall.h>
>   #include <sys/vfs.h>
> +#include <linux/blkzoned.h>
>   #include <linux/cdrom.h>
>   #include <linux/fd.h>
>   #include <linux/fs.h>
> @@ -216,6 +217,13 @@ typedef struct RawPosixAIOData {
>               PreallocMode prealloc;
>               Error **errp;
>           } truncate;
> +        struct {
> +            int64_t *nr_zones;

Why is this a pointer?
I'd rather use a number here, seeing that it's the number
of zones in the *zones array ...

But the remainder looks good.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

