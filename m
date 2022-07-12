Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94DC571241
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 08:30:21 +0200 (CEST)
Received: from localhost ([::1]:59426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB9PY-00020R-KI
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 02:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1oB9DA-0002D7-Tq; Tue, 12 Jul 2022 02:17:33 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1oB9D8-0001iL-5d; Tue, 12 Jul 2022 02:17:31 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5BFF5223D2;
 Tue, 12 Jul 2022 06:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657606648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1zZeBTmA8SNEJ2OWG3QTa3XT4DJRjGOAQk/P//gQ1c=;
 b=d9tH4fvHfhWHYNzjOiWgieGtliyvB4Hibn5KsH63OxJGLmBzx5KuNx+tAzssdLxzd4aUMP
 O9mGVGr0s135LAYf0Z+DLMDNuqB4xtxPaaD+i6ASgmjc9MFF1c+ldW+qstZuMHbKYv5CVA
 5TIaSHzWBDfrco4V70PutRDN05xPoyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657606648;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1zZeBTmA8SNEJ2OWG3QTa3XT4DJRjGOAQk/P//gQ1c=;
 b=ES5E6NOwAt6DK3VO9N/j/9Cy0ELWzbSB+E0sx1BHxYTi7ll3dLfSAlsYJdduWdEjKdtL5F
 o8bwSLO3E/JCcfBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A24A13A94;
 Tue, 12 Jul 2022 06:17:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Hj55CfgRzWKjdQAAMHmgww
 (envelope-from <hare@suse.de>); Tue, 12 Jul 2022 06:17:28 +0000
Message-ID: <1854c78a-a8eb-622e-da62-f074b0f08fee@suse.de>
Date: Tue, 12 Jul 2022 08:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v4 4/9] file-posix: introduce get_sysfs_str_val for device
 zoned model.
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-5-faithilikerun@gmail.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20220712021345.8530-5-faithilikerun@gmail.com>
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
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>   block/file-posix.c           | 60 ++++++++++++++++++++++++++++++++++++
>   include/block/block-common.h |  4 +--
>   2 files changed, 62 insertions(+), 2 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 3161d39ea4..42708012ff 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1279,6 +1279,65 @@ out:
>   #endif
>   }
>   
> +/*
> + * Convert the zoned attribute file in sysfs to internal value.
> + */
> +static zone_model get_sysfs_str_val(int fd, struct stat *st) {
> +#ifdef CONFIG_LINUX
> +    char buf[32];
> +    char *sysfspath = NULL;
> +    int ret, offset;
> +    int sysfd = -1;
> +
> +    if (S_ISCHR(st->st_mode)) {
> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> +            return ret;
> +        }
> +        return -ENOTSUP;
> +    }
> +
> +    if (!S_ISBLK(st->st_mode)) {
> +        return -ENOTSUP;
> +    }
> +
> +    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/zoned",
> +                                major(st->st_rdev), minor(st->st_rdev));
> +    sysfd = open(sysfspath, O_RDONLY);
> +    if (sysfd == -1) {
> +        ret = -errno;
> +        goto out;
> +    }
> +    offset = 0;
> +    do {
> +        ret = read(sysfd, buf + offset, sizeof(buf) - 1 + offset);
> +        if (ret > 0) {
> +            offset += ret;
> +        }
> +    } while (ret == -1);
> +    /* The file is ended with '\n' */
> +    if (buf[ret - 1] == '\n') {
> +        buf[ret - 1] = '\0';
> +    }
> +
> +    if (strcmp(buf, "host-managed") == 0) {
> +        return BLK_Z_HM;
> +    } else if (strcmp(buf, "host-aware") == 0) {
> +        return BLK_Z_HA;
> +    } else {
> +        return -ENOTSUP;
> +    }
> +
> +out:
> +    if (sysfd != -1) {
> +        close(sysfd);
> +    }
> +    g_free(sysfspath);
> +    return ret;
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
>   static int hdev_get_max_segments(int fd, struct stat *st) {
>       return get_sysfs_long_val(fd, st, "max_segments");
>   }
> @@ -1885,6 +1944,7 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
>       int64_t len = aiocb->aio_nbytes;
>       zone_op op = aiocb->zone_mgmt.op;
>   
> +    zone_model mod;
>       struct blk_zone_range range;
>       const char *ioctl_name;
>       unsigned long ioctl_op;
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index 78cddeeda5..35e00afe8e 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -56,8 +56,8 @@ typedef enum zone_op {
>   } zone_op;
>   
>   typedef enum zone_model {
> -    BLK_Z_HM,
> -    BLK_Z_HA,
> +    BLK_Z_HM = 0x1,
> +    BLK_Z_HA = 0x2,
>   } zone_model;
>   
>   typedef enum BlkZoneCondition {

This hunk is unrelated, please move it into a different patch.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

