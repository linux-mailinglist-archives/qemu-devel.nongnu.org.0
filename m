Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49A13FD93F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:09:10 +0200 (CEST)
Received: from localhost ([::1]:44682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLP3F-0000y5-ND
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLOrf-0001h3-Ae
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLOrb-0006LP-7V
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630497425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTA2muxnZIu6jJAt9bnnH9DwGEVE55LUM4VLGF8vBR0=;
 b=fOdR6rutDDSVp+KR9tqOGA9ivqUblMOla6Sn/MSaEuIbgMuQdQLTAXkbCK1jbzNuexMk4C
 sTIQLuMH35nRgRHg1w0yIavDpe1RAMf4x5Ii/Ch/4IQ6i2ZsxlBzvjZGlDHjycKb5/k+r6
 hksSnFk8oUnYXo3YjrHJ3HBzkB301OU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-F23iatfrMdCuiwRBFO8New-1; Wed, 01 Sep 2021 07:57:05 -0400
X-MC-Unique: F23iatfrMdCuiwRBFO8New-1
Received: by mail-wm1-f71.google.com with SMTP id
 f19-20020a1c1f13000000b002e6bd83c344so925269wmf.3
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 04:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oTA2muxnZIu6jJAt9bnnH9DwGEVE55LUM4VLGF8vBR0=;
 b=ccQYDKmtuYw9W/yHiLgGt2W++9Vz/pLgJghQHaZFY/RDiZw2mhmU2dKsRFLvVVOL+V
 BNqFEX61SdKJiWvj7jOZgdf1RSpcaXlrw16JlPBIkXwS6Pn2LA+G99x3+XYWpKFkG+rm
 vYT/MaiIwZRz6x5pJw6qDJYXaRU/odloQ0Pp9YX0LCKylOWAW9npzRvHUHM5O/eqxvXw
 CVgiknx5F5MULgUn65bAcwDjUlDXsSxQYE2/mTklzMubpQtpDkWbi0r+EyVBBsxf1n2R
 OphBEDsDURxCvRZ7Qw2ynrWVyJ/MsswSE4Zb4VDwOy0xqWMnyn8K1KMpQlbaFfR6DRVJ
 DXpQ==
X-Gm-Message-State: AOAM533Q1z+vkPKT0RpeTEp3ujFnod0byTq6WzRyChuHfKKp6LsNqKUJ
 ruoKja2bEQIZl5ZmPBkBQVnF+YblUvFRp5rD2bqJmVxvtIW0lF4vOp1SPifmd4MbJgnnZjOtklc
 7xzVlK381CgVbdtQ=
X-Received: by 2002:a5d:570c:: with SMTP id a12mr36799713wrv.117.1630497423824; 
 Wed, 01 Sep 2021 04:57:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+mDm6KSWiD+2+wown+axOq5d1e9K5CBfd8BjHKLjxfM2LU33kRoTKNMKYgdyZqqgQCb7nZw==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr36799692wrv.117.1630497423559; 
 Wed, 01 Sep 2021 04:57:03 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 k16sm1725480wrh.24.2021.09.01.04.57.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 04:57:03 -0700 (PDT)
Subject: Re: [PATCH v8 09/34] block/backup: move cluster size calculation to
 block-copy
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
 <20210824083856.17408-10-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <8c8a44c3-0aa1-ca40-8b34-6a863cc7c2fa@redhat.com>
Date: Wed, 1 Sep 2021 13:57:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824083856.17408-10-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Max Reitz <mreitz@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.21 10:38, Vladimir Sementsov-Ogievskiy wrote:
> The main consumer of cluster-size is block-copy. Let's calculate it
> here instead of passing through backup-top.
>
> We are going to publish copy-before-write filter soon, so it will be
> created through options. But we don't want for now to make explicit
> option for cluster-size, let's continue to calculate it automatically.
> So, now is the time to get rid of cluster_size argument for
> bdrv_cbw_append().
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/copy-before-write.h  |  1 -
>   include/block/block-copy.h |  5 +--
>   block/backup.c             | 62 ++++++--------------------------------
>   block/block-copy.c         | 51 ++++++++++++++++++++++++++++++-
>   block/copy-before-write.c  | 10 +++---
>   5 files changed, 66 insertions(+), 63 deletions(-)

[...]

> diff --git a/block/block-copy.c b/block/block-copy.c
> index e83870ff81..b0e0a38330 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c

[...]

> @@ -342,14 +343,57 @@ void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
>       }
>   }
>   
> +static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
> +                                                 Error **errp)
> +{
> +    int ret;
> +    BlockDriverInfo bdi;
> +    bool target_does_cow = bdrv_backing_chain_next(target);
> +
> +    /*
> +     * If there is no backing file on the target, we cannot rely on COW if our
> +     * backup cluster size is smaller than the target cluster size. Even for
> +     * targets with a backing file, try to avoid COW if possible.
> +     */
> +    ret = bdrv_get_info(target, &bdi);
> +    if (ret == -ENOTSUP && !target_does_cow) {
> +        /* Cluster size is not defined */
> +        warn_report("The target block device doesn't provide "
> +                    "information about the block size and it doesn't have a "
> +                    "backing file. The default block size of %u bytes is "
> +                    "used. If the actual block size of the target exceeds "
> +                    "this default, the backup may be unusable",
> +                    BLOCK_COPY_CLUSTER_SIZE_DEFAULT);

I get some build errors in the gitlab CI because of this – I think we 
need to add a qemu/error-report.h include in block/block-copy.c now.  (I 
don’t know why this works for some configurations, apparently, but not 
for others...)

Is it OK if I add it to this patch?

diff --git a/block/block-copy.c b/block/block-copy.c
index b0e0a38330..5d0076ac93 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -21,6 +21,7 @@
  #include "qemu/units.h"
  #include "qemu/coroutine.h"
  #include "block/aio_task.h"
+#include "qemu/error-report.h"

  #define BLOCK_COPY_MAX_COPY_RANGE (16 * MiB)
  #define BLOCK_COPY_MAX_BUFFER (1 * MiB)

Hanna


