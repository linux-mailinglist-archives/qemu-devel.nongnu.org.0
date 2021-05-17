Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D1C383B31
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:23:51 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligy6-0005DS-T0
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ligYS-0005TN-Fq
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ligYL-0008Kv-Kx
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621270632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwC129NVrB5iB4tLmH9o7R2/Lw8GrQhLgAFNn041mKE=;
 b=OOEXfwqcrf6Z6WJTTABWvI6PksiAcDR9x5YFI4Dhn1edVs3zge4elrcYUxZsihCVyOMw6a
 S03ReCUpA0wPPo57wZcb4HcTt6tZzQdrbUQ+HzVEUCgIYi6MZPlb+6IzhI6yFge2RWkbni
 1p3U+1JvQbB1Awc+Q75vAqbgd+A+Uvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-I0QKvSixNc6_-mwMm59d7A-1; Mon, 17 May 2021 12:57:09 -0400
X-MC-Unique: I0QKvSixNc6_-mwMm59d7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C03858015F5;
 Mon, 17 May 2021 16:57:08 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-29.ams2.redhat.com
 [10.36.113.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1B3A2B6C4;
 Mon, 17 May 2021 16:57:06 +0000 (UTC)
Subject: Re: [PATCH 08/21] block/backup: stricter
 backup_calculate_cluster_size()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-10-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d03c7bc4-2ba3-6a81-f152-f88c2368adec@redhat.com>
Date: Mon, 17 May 2021 18:57:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517064428.16223-10-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
> No reason to tolerate bdrv_get_info() errors except for ENOTSUP. Let's
> just error-out, it's simpler and safer.

Hm, doesn’t look that much simpler to me.  Not sure how much safer it 
is, because the point was that in the target_does_cow case, we would 
like a cluster size hint, but it isn’t necessary.  So if we don’t get 
one, regardless of the reason, we use the default cluster size.  I don’t 
know why ENOTSUP should be treated in a special way there.

So I don’t know.

Max

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/backup.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/block/backup.c b/block/backup.c
> index fe685e411b..fe7a1f1e37 100644
> --- a/block/backup.c
> +++ b/block/backup.c
> @@ -367,7 +367,10 @@ static int64_t backup_calculate_cluster_size(BlockDriverState *target,
>        * targets with a backing file, try to avoid COW if possible.
>        */
>       ret = bdrv_get_info(target, &bdi);
> -    if (ret == -ENOTSUP && !target_does_cow) {
> +    if (ret < 0 && ret != -ENOTSUP) {
> +        error_setg_errno(errp, -ret, "Failed to get target info");
> +        return ret;
> +    } else if (ret == -ENOTSUP && !target_does_cow) {
>           /* Cluster size is not defined */
>           warn_report("The target block device doesn't provide "
>                       "information about the block size and it doesn't have a "
> @@ -376,14 +379,7 @@ static int64_t backup_calculate_cluster_size(BlockDriverState *target,
>                       "this default, the backup may be unusable",
>                       BACKUP_CLUSTER_SIZE_DEFAULT);
>           return BACKUP_CLUSTER_SIZE_DEFAULT;
> -    } else if (ret < 0 && !target_does_cow) {
> -        error_setg_errno(errp, -ret,
> -            "Couldn't determine the cluster size of the target image, "
> -            "which has no backing file");
> -        error_append_hint(errp,
> -            "Aborting, since this may create an unusable destination image\n");
> -        return ret;
> -    } else if (ret < 0 && target_does_cow) {
> +    } else if (ret == -ENOTSUP && target_does_cow) {
>           /* Not fatal; just trudge on ahead. */
>           return BACKUP_CLUSTER_SIZE_DEFAULT;
>       }
> 


