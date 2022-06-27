Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852CF55B85B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:53:51 +0200 (CEST)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jZ8-0008ID-Jr
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1o5jMp-0004Ol-IA; Mon, 27 Jun 2022 03:41:11 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:49508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1o5jMn-0000AR-QS; Mon, 27 Jun 2022 03:41:07 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC11D21B55;
 Mon, 27 Jun 2022 07:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656315663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrNvcoGmZFncVXD8/k3xm7a1JZccg4qjIaqXas/8hG0=;
 b=0ycffnun0XwcCWXSPdZAXFMpFqzH5L6ZQVrCdaVAY8LaXayF7n6bxevq5nW52nEn4LCWde
 nh3SqSYnnO192qtBT4MKTSEoePANPSQGvMnFBU7a4ONGEGRc49kyDx1ZmNuq60PTQNuAJ5
 DPRz7an3bYauL1bo2ixDxogsarhmNzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656315663;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrNvcoGmZFncVXD8/k3xm7a1JZccg4qjIaqXas/8hG0=;
 b=UidH2QEtbTa1Xq44xCQ/VRvUX4uTYJmk1W4vNqwEKroMU5vcsEMwyiLLaCfHjFd6D2a7sO
 ouYtArusIIuT6zCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B28FE13456;
 Mon, 27 Jun 2022 07:41:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HCiYKQ9fuWJieAAAMHmgww
 (envelope-from <hare@suse.de>); Mon, 27 Jun 2022 07:41:03 +0000
Message-ID: <b9fab319-aaef-9f4e-090e-b10fa010eb5d@suse.de>
Date: Mon, 27 Jun 2022 09:41:03 +0200
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
 <20220627001917.9417-5-faithilikerun@gmail.com>
From: Hannes Reinecke <hare@suse.de>
Subject: Re: [RFC v3 4/5] file-posix: introduce get_sysfs_str_val for device
 zoned model.
In-Reply-To: <20220627001917.9417-5-faithilikerun@gmail.com>
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

On 6/27/22 02:19, Sam Li wrote:
> ---
>   block/file-posix.c           | 60 ++++++++++++++++++++++++++++++++++++
>   include/block/block-common.h |  4 +--
>   2 files changed, 62 insertions(+), 2 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 73c2cdfbca..74c0245e0f 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1277,6 +1277,66 @@ out:
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
> +    int ret;
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
> +    do {
> +        ret = read(sysfd, buf, sizeof(buf) - 1);
> +    } while (ret == -1 && errno == EINTR);

This is wrong.
read() might return a value smaller than the 'len' argument (sizeof(buf) 
-1 in your case). But in that case it's a short read, and one need to 
call 'read()' again to fetch the remaining bytes.

So the correct code would be something like:

offset = 0;
do {
     ret = read(sysfd, buf + offset, sizeof(buf) - 1 + offset);
     if (ret > 0)
         offset += ret;
} while (ret > 0);

Not that you'd actually need it; reads from sysfs are basically never 
interrupted, so you should be able to read from an attribute in one go.
IE alternatively you can drop the 'while' loop and just call read().

> +    if (ret < 0) {
> +        ret = -errno;
> +        goto out;
> +    } else if (ret == 0) {
> +        ret = -EIO;
> +        goto out;
> +    }
> +    buf[ret] = 0;
> +
> +    /* The file is ended with '\n' */

I'd rather check if the string ends with an '\n', and overwrite
it with a '\0'. That way you'd be insulated against any changes
to sysfs.

> +    if (strcmp(buf, "host-managed\n") == 0) {
> +        return BLK_Z_HM;
> +    } else if (strcmp(buf, "host-aware\n") == 0) {
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
>       int ret;
>       ret = get_sysfs_long_val(fd, st, "max_segments");

And as you already set a precedent in your previous patch, I'd recommend 
split this in two patches, one introducing a generic function 
'get_sysfs_str_val()' which returns a string and another function
(eg hdev_get_zone_model()) which calls this function to fetch the device 
zoned model.

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

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), GF: Felix Imendörffer

