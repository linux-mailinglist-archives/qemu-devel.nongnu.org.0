Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81E357123B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 08:28:32 +0200 (CEST)
Received: from localhost ([::1]:55796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB9Nn-0007z8-AX
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 02:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1oB9Ah-0000ZM-7o; Tue, 12 Jul 2022 02:14:59 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:50434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1oB9Ad-0001CM-GM; Tue, 12 Jul 2022 02:14:58 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6DE01F9A7;
 Tue, 12 Jul 2022 06:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657606493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hg0WfQmcOU5lAHNYPPm1caoCBZRb/ZaKe8JK5OcFWvs=;
 b=JQuN1GNuyEsbpXndAF9LTlTvlS2wM6f+nT5Ua+4hFwxTqLo46EZlc+ZyXSnFUAfFaeMHrS
 hZjuKhHBpGYh9m4BYaNewDkprn+MAttZWWBhozxGluZeVcxwTGnxKZIsWx+a+mJqCMrPli
 bQRxwZkM1UK4iSSwfR6yLAHlG5iWwEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657606493;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hg0WfQmcOU5lAHNYPPm1caoCBZRb/ZaKe8JK5OcFWvs=;
 b=1cVmjJTTPtA6WvLMJyn6yHmbwegJW/hfViHoBUThZorrkQnflyYwqGoU3JcZR+P/k+2nd+
 Z9wPhgv65nx4D+BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6DBB313A94;
 Tue, 12 Jul 2022 06:14:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kebSGV0RzWLYdAAAMHmgww
 (envelope-from <hare@suse.de>); Tue, 12 Jul 2022 06:14:53 +0000
Message-ID: <0c6fb453-1050-74c9-8f4e-4771493f4c78@suse.de>
Date: Tue, 12 Jul 2022 08:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v4 2/9] qemu-io: add zoned block device operations.
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-3-faithilikerun@gmail.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20220712021345.8530-3-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=hare@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Add zoned storage commands of the device: zone_open(zo), zone_close(zc),
> zone_reset(zs), zone_report(zp), zone_finish(zf).
> 
> For example, it can be called by:
> ./build/qemu-io --image-opts driver=zoned_host_device, filename=/dev/nullb0
> -c "zone_report 0 0 1"
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>   block/io.c               |  57 ++++++++++++++++
>   include/block/block-io.h |  13 ++++
>   qemu-io-cmds.c           | 143 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 213 insertions(+)
> 
> diff --git a/block/io.c b/block/io.c
> index 1e9bf09a49..a760be0131 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3243,6 +3243,63 @@ out:
>       return co.ret;
>   }
>   
> +int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                        int64_t *nr_zones,
> +                        BlockZoneDescriptor *zones)
> +{
> +    BlockDriver *drv = bs->drv;
> +    CoroutineIOCompletion co = {
> +            .coroutine = qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || (!drv->bdrv_co_zone_report)) {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +    }
> +
> +    if (drv->bdrv_co_zone_report) {
> +        co.ret = drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
> +    } else {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +        qemu_coroutine_yield();
> +    }
> +
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
> +int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
> +        int64_t offset, int64_t len)
> +{
> +    BlockDriver *drv = bs->drv;
> +    CoroutineIOCompletion co = {
> +            .coroutine = qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || (!drv->bdrv_co_zone_mgmt)) {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +    }
> +
> +    if (drv->bdrv_co_zone_mgmt) {
> +        co.ret = drv->bdrv_co_zone_mgmt(bs, op, offset, len);
> +    } else {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +        qemu_coroutine_yield();
> +    }
> +
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
>   void *qemu_blockalign(BlockDriverState *bs, size_t size)
>   {
>       IO_CODE();
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index 053a27141a..a0ae140452 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -80,6 +80,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
>   /* Ensure contents are flushed to disk.  */
>   int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
>   
> +/* Report zone information of zone block device. */
> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                                     int64_t *nr_zones,
> +                                     BlockZoneDescriptor *zones);
> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, zone_op op,
> +                                   int64_t offset, int64_t len);
> +
>   int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
>   bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
>   int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> @@ -289,6 +296,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>   int generated_co_wrapper
>   bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>   
> +int generated_co_wrapper
> +blk_zone_report(BlockBackend *blk, int64_t offset, int64_t *nr_zones,
> +                BlockZoneDescriptor *zones);
> +int generated_co_wrapper
> +blk_zone_mgmt(BlockBackend *blk, enum zone_op op, int64_t offset, int64_t len);
> +
>   /**
>    * bdrv_parent_drained_begin_single:
>    *
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 2f0d8ac25a..a88fa322d2 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -1706,6 +1706,144 @@ static const cmdinfo_t flush_cmd = {
>       .oneline    = "flush all in-core file state to disk",
>   };
>   
> +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, nr_zones;
> +
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    nr_zones = cvtnum(argv[optind]);
> +
> +    g_autofree BlockZoneDescriptor *zones = NULL;
> +    zones = g_new(BlockZoneDescriptor, nr_zones);
> +    ret = blk_zone_report(blk, offset, &nr_zones, zones);
> +    if (ret < 0) {
> +        printf("zone report failed: %s\n", strerror(-ret));
> +    } else {
> +        for (int i = 0; i < nr_zones; ++i) {
> +            printf("start: 0x%" PRIx64 ", len 0x%" PRIx64 ", "
> +                   "cap"" 0x%" PRIx64 ",wptr 0x%" PRIx64 ", "
> +                   "zcond:%u, [type: %u]\n",
> +                   zones[i].start, zones[i].length, zones[i].cap, zones[i].wp,
> +                   zones[i].cond, zones[i].type);
> +        }
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_report_cmd = {
> +        .name = "zone_report",
> +        .altname = "zp",
> +        .cfunc = zone_report_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset number",
> +        .oneline = "report zone information",
> +};
> +
'zp' is a bit odd; I'd rather go with 'zrp'.

Otherwise:

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

