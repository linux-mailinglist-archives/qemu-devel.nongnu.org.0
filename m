Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064F02F2EA3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:06:41 +0100 (CET)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIRc-0002T1-2B
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzIL3-0005gB-Cd
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:59:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzIL1-0003YX-Tr
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610452791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iucd3qsT+iXHXAi2mMNTk2RBaLOYksRQgj2sClH6eO8=;
 b=fLCGUZongOJiaWRH8AbI7h1FsedE3pSjHwv3UHA0mz/7z9ICEFW3E1t3u+lftXgImHJNlE
 8TCXcZwBaoIBXb38vMrubn9AMczrmxdTZiN0q6FMG5gebsz1nrmd15B1qkf/pU7ja/OuO3
 hwjfJFv+4l+kf9A3CGY/T+anMUfPYV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-fkpm27hCMvqR1Tq6Ovo3oA-1; Tue, 12 Jan 2021 06:59:47 -0500
X-MC-Unique: fkpm27hCMvqR1Tq6Ovo3oA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BCA11966320;
 Tue, 12 Jan 2021 11:59:46 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-161.ams2.redhat.com
 [10.36.115.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54FFE60BE2;
 Tue, 12 Jan 2021 11:59:43 +0000 (UTC)
Subject: Re: [PATCH v3 11/25] qapi: backup: add max-chunk and max-workers to
 x-perf struct
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-12-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6e803c1f-579e-ac13-e7ba-968cbc7898bb@redhat.com>
Date: Tue, 12 Jan 2021 12:59:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201026171815.13233-12-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.20 18:18, Vladimir Sementsov-Ogievskiy wrote:
> Add new parameters to configure future backup features. The patch
> doesn't introduce aio backup requests (so we actually have only one
> worker) neither requests larger than one cluster. Still, formally we
> satisfy these maximums anyway, so add the parameters now, to facilitate
> further patch which will really change backup job behavior.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json | 11 ++++++++++-
>   block/backup.c       | 28 +++++++++++++++++++++++-----
>   block/replication.c  |  2 +-
>   blockdev.c           |  8 +++++++-
>   4 files changed, 41 insertions(+), 8 deletions(-)

[...]

> diff --git a/block/backup.c b/block/backup.c
> index 09ff5a92ef..8c67d77504 100644
> --- a/block/backup.c
> +++ b/block/backup.c
> @@ -388,6 +388,29 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
>           return NULL;
>       }
>   
> +    cluster_size = backup_calculate_cluster_size(target, errp);
> +    if (cluster_size < 0) {
> +        goto error;
> +    }
> +
> +    if (perf->max_workers < 1) {
> +        error_setg(errp, "max-worker must be greater than zero");

*max-workers

With that fixed:

Reviewed-by: Max Reitz <mreitz@redhat.com>

> +        return NULL;
> +    }


