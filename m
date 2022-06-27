Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0492D55B83E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:35:55 +0200 (CEST)
Received: from localhost ([::1]:33236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jHm-00040H-1g
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1o5jCR-0004k1-Da; Mon, 27 Jun 2022 03:30:23 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:35856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1o5jCP-0005wz-An; Mon, 27 Jun 2022 03:30:23 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 709171FA72;
 Mon, 27 Jun 2022 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656315019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrTz+MGN8+I1fwI+O7uRLdchY4S3OoMLDQqgxFt8BMc=;
 b=zzLHshyF9qEMuBfZP+C4uNFzWnjt8+OPdOBxtD44oH5lE5G1Nos6xgbh0kEUkk0xKUOsaR
 gUquSCHVD9n91P6vBWgJwnIzeP8+cZ9bh0fWGHwa3NncDzeuGknZofTXyrZ8r7QDHPbPJf
 Fu1itDErjLRNzsRVx63pa7KWRnEGReM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656315019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrTz+MGN8+I1fwI+O7uRLdchY4S3OoMLDQqgxFt8BMc=;
 b=Snc0H8qSSXckyK9sVfhf+1c/ya45DNAEKO2DQtouQ45cFcqLCD9LlL4lMWUkkse2ITL31c
 i0oJ9REvc4/4eaCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5567C13456;
 Mon, 27 Jun 2022 07:30:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7dWpE4tcuWKpcwAAMHmgww
 (envelope-from <hare@suse.de>); Mon, 27 Jun 2022 07:30:19 +0000
Message-ID: <4b283da3-8f9b-2064-95b0-e0e963e5044a@suse.de>
Date: Mon, 27 Jun 2022 09:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-3-faithilikerun@gmail.com>
From: Hannes Reinecke <hare@suse.de>
Subject: Re: [RFC v3 2/5] qemu-io: add zoned block device operations.
In-Reply-To: <20220627001917.9417-3-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=hare@suse.de;
 helo=smtp-out2.suse.de
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

On 6/27/22 02:19, Sam Li wrote:
> ---

Good coding style would advise to add some text here what the patch does.

>   block/io.c               |  21 +++++++
>   include/block/block-io.h |  13 +++++
>   qemu-io-cmds.c           | 121 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 155 insertions(+)
> 
> diff --git a/block/io.c b/block/io.c
> index 789e6373d5..656a1b7271 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3258,6 +3258,27 @@ out:
>       return co.ret;
>   }
>   
> +int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                        int64_t len, int64_t *nr_zones,
> +                        BlockZoneDescriptor *zones)
> +{
> +    if (!bs->drv->bdrv_co_zone_report) {
> +        return -ENOTSUP;

ENOTSUP or EOPNOTSUP?
Kevin?

> +    }
> +
> +    return bs->drv->bdrv_co_zone_report(bs, offset, len, nr_zones, zones);
> +}
> +
> +int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
> +        int64_t offset, int64_t len)
> +{
> +    if (!bs->drv->bdrv_co_zone_mgmt) {
> +        return -ENOTSUP;
> +    }
> +
> +    return bs->drv->bdrv_co_zone_mgmt(bs, op, offset, len);
> +}
> +
>   void *qemu_blockalign(BlockDriverState *bs, size_t size)
>   {
>       IO_CODE();
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index 62c84f0519..c85c174579 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -80,6 +80,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
>   /* Ensure contents are flushed to disk.  */
>   int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
>   
> +/* Report zone information of zone block device. */
> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                                     int64_t len, int64_t *nr_zones,
> +                                     BlockZoneDescriptor *zones);
> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, zone_op op,
> +        int64_t offset, int64_t len);
> +

There's the thing with the intendation ... please make it consistent, 
and ideally follow with whatever the remaining prototypes do.

>   int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
>   bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
>   int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> @@ -290,6 +297,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>   int generated_co_wrapper
>   bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>   
> +int generated_co_wrapper blk_zone_report(BlockBackend *blk, int64_t offset,
> +                                         int64_t len, int64_t *nr_zones,
> +                                         BlockZoneDescriptor *zones);
> +int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, enum zone_op op,
> +        int64_t offset, int64_t len);
> +

Again here.

>   /**
>    * bdrv_parent_drained_begin_single:
>    *
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 2f0d8ac25a..3f2592b9f5 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -1706,6 +1706,122 @@ static const cmdinfo_t flush_cmd = {
>       .oneline    = "flush all in-core file state to disk",
>   };
>   
> +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len, nr_zones;
> +    int i = 0;
> +
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ++optind;
> +    nr_zones = cvtnum(argv[optind]);
> +
And 'optind' is set where?
Plus do check for 'argv' overflow; before increasing 'optind' and using 
'argv[optind]' you have to validate that 'argv[optind]' is a valid pointer.

> +    g_autofree BlockZoneDescriptor *zones = g_new(BlockZoneDescriptor, nr_zones);
> +    ret = blk_zone_report(blk, offset, len, &nr_zones, zones);
> +    while (i < nr_zones) {
> +        fprintf(stdout, "start: 0x%lx, len 0x%lx, cap 0x%lx, wptr 0x%lx, "
> +                        "zcond:%u, [type: %u]\n",
> +                zones[i].start, zones[i].length, zones[i].cap, zones[i].wp,
> +                zones[i].cond, zones[i].type);
> +        ++i;
As 'i' is a simple iterator maybe use a 'for' loop here.
But that really is a matter of preference :-)

> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_report_cmd = {
> +        .name = "zone_report",
> +        .altname = "f",

altname 'f'?
Is that correct?

> +        .cfunc = zone_report_f,
> +        .argmin = 3,
> +        .argmax = 3,
> +        .args = "offset [offset..] len [len..] number [num..]",
> +        .oneline = "report a number of zones",
> +};
> +
> +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);

Same here: please check for 'argv' overflow.

> +    return blk_zone_mgmt(blk, zone_open, offset, len);
> +}
> +
> +static const cmdinfo_t zone_open_cmd = {
> +        .name = "zone_open",
> +        .altname = "f",

Same here; shouldn't 'altname' be different for each function?
'zo', maybe?

> +        .cfunc = zone_open_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset [offset..] len [len..]",
> +        .oneline = "explicit open a range of zones in zone block device",
> +};
> +
> +static int zone_close_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);

argv checking.

> +    return blk_zone_mgmt(blk, zone_close, offset, len);
> +}
> +
> +static const cmdinfo_t zone_close_cmd = {
> +        .name = "zone_close",
> +        .altname = "f",

altname 'zc'

> +        .cfunc = zone_close_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset [offset..] len [len..]",
> +        .oneline = "close a range of zones in zone block device",
> +};
> +
> +static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);

Argv checking.

> +    return blk_zone_mgmt(blk, zone_finish, offset, len);
> +}
> +
> +static const cmdinfo_t zone_finish_cmd = {
> +        .name = "zone_finish",
> +        .altname = "f",

altname 'zf'

> +        .cfunc = zone_finish_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset [offset..] len [len..]",
> +        .oneline = "finish a range of zones in zone block device",
> +};
> +
> +static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);

Argv checking.

> +    return blk_zone_mgmt(blk, zone_reset, offset, len);
> +}
> +
> +static const cmdinfo_t zone_reset_cmd = {
> +        .name = "zone_reset",
> +        .altname = "f",

altname 'zf'

> +        .cfunc = zone_reset_f, > +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset [offset..] len [len..]",
> +        .oneline = "reset a zone write pointer in zone block device",
> +};
> +
> +
>   static int truncate_f(BlockBackend *blk, int argc, char **argv);
>   static const cmdinfo_t truncate_cmd = {
>       .name       = "truncate",
> @@ -2498,6 +2614,11 @@ static void __attribute((constructor)) init_qemuio_commands(void)
>       qemuio_add_command(&aio_write_cmd);
>       qemuio_add_command(&aio_flush_cmd);
>       qemuio_add_command(&flush_cmd);
> +    qemuio_add_command(&zone_report_cmd);
> +    qemuio_add_command(&zone_open_cmd);
> +    qemuio_add_command(&zone_close_cmd);
> +    qemuio_add_command(&zone_finish_cmd);
> +    qemuio_add_command(&zone_reset_cmd);
>       qemuio_add_command(&truncate_cmd);
>       qemuio_add_command(&length_cmd);
>       qemuio_add_command(&info_cmd);

Otherwise looks okay.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), GF: Felix Imendörffer

