Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3A73A868F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:33:32 +0200 (CEST)
Received: from localhost ([::1]:47410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltC0J-0003s5-G1
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltBzX-00032e-L7
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:32:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltBzT-00017X-8a
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623774758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rERHteQ+ke/Xd3f1jJ2PTZM0aeI79TwxfC8uC3UPf8k=;
 b=KepQY+idnMQJaEe60rU3qbCbvAxCBrhMKTS1UZOij1w1CVVfBbaPmM4m6RXmgIixj7gIQi
 0lDuAro6NwyMgrg2C0nD6iIlTKKvtxDnt8J5O6DzT/kTsx7oWyjoBJOvhzp1zuIG4mrDyb
 HqUObrrevTCk/P+V60nT8OYa0AH+0DU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-aaWrkv_wOo2z1kVxRd8ELQ-1; Tue, 15 Jun 2021 12:32:37 -0400
X-MC-Unique: aaWrkv_wOo2z1kVxRd8ELQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 p20-20020a1709064994b02903cd421d7803so4809402eju.22
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rERHteQ+ke/Xd3f1jJ2PTZM0aeI79TwxfC8uC3UPf8k=;
 b=EHpXzvz9ReIJc/JLH01rhUSj+uuoIZNk0/EEjCsPYAPUJPg2zJoSCAVKWpH/7O/y8D
 d4FbLgF2SBDrWBHwYS6/9Xxxeb64UpJTWr5PvAcL2F0oVlJ13iDzGqmkwuSwq1sq0dG9
 LGMEXInWmqRfus6okI4LsY4aWsdidnZi+Br2eI4ymrBZ0pbMPjKFO9o6J5Q9SE+H9yAK
 9DEEQ1Bp59x+bQjZtDi0Lfjc4coG35W2e8rkEUwC8g9K/SWqUfFizF6RH6wIQk8aSf+O
 rDMP3UBoH53FH1qYZAKqW2JZJ9QHfz0iqcneae0pBskZj/p82f/aPDCwJPqEGDB4vUPc
 o9EA==
X-Gm-Message-State: AOAM530E7N8pZ0gOuQQtjGaM4NigNAPEelKxtZng3xJHUCjGrYxrWHtH
 V4fXlgsY19seFMcB+oAjjZ+3Punt2Y0UDyOJUNOfB5373JB3Ma8dALCIcVawpROHoBPBNm7Un/X
 uP5+4wanekoluwbY=
X-Received: by 2002:a05:6402:1a25:: with SMTP id
 be5mr321677edb.369.1623774756116; 
 Tue, 15 Jun 2021 09:32:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwWTxry4baxALnST2wnDcvJCPczaiRtJL4Ex9nc0wXpWsXr2DtuSrFAkZPrOVfK5M7vCmj5w==
X-Received: by 2002:a05:6402:1a25:: with SMTP id
 be5mr321648edb.369.1623774755900; 
 Tue, 15 Jun 2021 09:32:35 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 ci4sm1435832ejc.110.2021.06.15.09.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 09:32:35 -0700 (PDT)
Subject: Re: [PATCH v3 4/7] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-5-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6f4ce577-a2d2-e63a-15ae-a248e141634a@redhat.com>
Date: Tue, 15 Jun 2021 18:32:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603133722.218465-5-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.06.21 15:37, Paolo Bonzini wrote:
> bs->sg is only true for character devices, but block devices can also
> be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
> returns bytes in an int for /dev/sgN devices, and sectors in a short
> for block devices, so account for that in the code.
>
> The maximum transfer also need not be a power of 2 (for example I have
> seen disks with 1280 KiB maximum transfer) so there's no need to pass
> the result through pow2floor.
>
> This patch reintroduces the logic that was removed in commit 867eccfed8
> ("file-posix: Use max transfer length/segment count only for SCSI
> passthrough", 2019-07-12).  The removal was motivated by the performance
> regression when using a block device's max_transfer with kernel I/O;
> the new, separate max_hw_transfer limit avoids reintroducing the same
> regression.

(And the fact that the result of hdev_get_max_segments() is no longer 
used to cap max_transfer, but is just stored in max_iov instead.)

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c | 40 ++++++++++++++++++++++------------------
>   1 file changed, 22 insertions(+), 18 deletions(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index f55f92d0f5..1439293f63 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1149,22 +1149,27 @@ static void raw_reopen_abort(BDRVReopenState *state)
>       s->reopen_state = NULL;
>   }
>   
> -static int sg_get_max_transfer_length(int fd)
> +static int hdev_get_max_hw_transfer(int fd, struct stat *st)
>   {
>   #ifdef BLKSECTGET
> -    int max_bytes = 0;
> -
> -    if (ioctl(fd, BLKSECTGET, &max_bytes) == 0) {
> -        return max_bytes;
> +    if (S_ISBLK(st->st_mode)) {
> +        unsigned short max_sectors = 0;
> +        if (ioctl(fd, BLKSECTGET, &max_sectors) == 0) {
> +            return max_sectors * 512;
> +        }
>       } else {
> -        return -errno;
> +        int max_bytes = 0;
> +        if (ioctl(fd, BLKSECTGET, &max_bytes) == 0) {
> +            return max_bytes;
> +        }
>       }
> +    return -errno;
>   #else
>       return -ENOSYS;
>   #endif
>   }
>   
> -static int sg_get_max_segments(int fd)
> +static int hdev_get_max_segments(int fd, struct stat *st)

OK, now I see why in patch 1 you treated `st` as a pointer. Still, needs 
to be `st.` in patch 1, and changed to `st->` in this patch only.

>   {
>   #ifdef CONFIG_LINUX
>       char buf[32];
> @@ -1173,12 +1178,6 @@ static int sg_get_max_segments(int fd)
>       int ret;
>       int sysfd = -1;
>       long max_segments;
> -    struct stat st;
> -
> -    if (fstat(fd, &st)) {
> -        ret = -errno;
> -        goto out;
> -    }
>   
>       if (S_ISCHR(st->st_mode)) {
>           if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> @@ -1192,7 +1191,7 @@ static int sg_get_max_segments(int fd)
>       }
>   
>       sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
> -                                major(st.st_rdev), minor(st.st_rdev));
> +                                major(st->st_rdev), minor(st->st_rdev));
>       sysfd = open(sysfspath, O_RDONLY);
>       if (sysfd == -1) {
>           ret = -errno;
> @@ -1229,15 +1228,20 @@ out:
>   static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>   {
>       BDRVRawState *s = bs->opaque;
> +    struct stat st;
> +
> +    if (fstat(s->fd, &st)) {
> +        return;
> +    }

First, I think if we ignore an error, there should be a comment 
explaining why that’s OK.

It is OK here because inquiring transfer limits is best-effort.

However, the alignment probes below the following block are completely 
independent of `st`. Therefore, I don’t think we should skip them if 
`fstat()` failed here; only the `if (bs->sg || ...)` block should be 
skipped.

Max

>   
> -    if (bs->sg) {
> -        int ret = sg_get_max_transfer_length(s->fd);
> +    if (bs->sg || S_ISBLK(st.st_mode)) {
> +        int ret = hdev_get_max_hw_transfer(s->fd, &st);
>   
>           if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
> -            bs->bl.max_hw_transfer = pow2floor(ret);
> +            bs->bl.max_hw_transfer = ret;
>           }
>   
> -        ret = sg_get_max_segments(s->fd);
> +        ret = hdev_get_max_segments(s->fd, &st);
>           if (ret > 0) {
>               bs->bl.max_iov = ret;
>           }


