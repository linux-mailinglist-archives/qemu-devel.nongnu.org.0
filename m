Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA023275ACA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 16:52:52 +0200 (CEST)
Received: from localhost ([::1]:49802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL68Z-0007B0-Ng
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 10:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kL675-0005pN-Cw
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 10:51:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kL671-0007hW-To
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 10:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600872674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bscl0wfILNSzhbIGjiUZpWAqb5cxbnHFOiJsNRl+l9k=;
 b=MK+xH8k5kPtPssM1Oxug9/7rC/nVYw/9jf9rDxfSE9mQHgzhkdbU1yM5+jJKBXvwCAbBjq
 1kFpxAnZ677fwQM/6iN2Ej/ybqWSAbFYMA8kIl3LMPl+in7g9nIWP+G4nE1UOiX8nfy6RC
 cLwvgbn0Q8xmg+y6cG2hiFDZQFKwrbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-mOWduOyFMx6LJo1y0iGiXA-1; Wed, 23 Sep 2020 10:51:12 -0400
X-MC-Unique: mOWduOyFMx6LJo1y0iGiXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AEAF8ECE57;
 Wed, 23 Sep 2020 14:51:11 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A99960C04;
 Wed, 23 Sep 2020 14:50:49 +0000 (UTC)
Subject: Re: [PATCH] block/mirror: fix core when using iothreads
To: Peng Liang <liangpeng10@huawei.com>, qemu-block@nongnu.org,
 kwolf@redhat.com
References: <20200826131910.1879079-1-liangpeng10@huawei.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <11c14e57-e285-68c1-33cd-37f2121d302b@redhat.com>
Date: Wed, 23 Sep 2020 10:50:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826131910.1879079-1-liangpeng10@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/20 9:19 AM, Peng Liang wrote:
> We found an issue when doing block-commit with iothreads, which tries to
> dereference a NULL pointer.
> 

I'm clearing out my patch backlog. I am a bit out of the loop on block 
issues at the moment, did this issue get addressed in a later patch that 
I am not seeing, or does it still need attention?

--js

> <main thread>                      |<IO thread>
>                                     |
> mirror_start_job                   |
>   1. bdrv_ref(mirror_top_bs);       |
>      bdrv_drained_begin(bs);        |
>      bdrv_append(mirror_top_bs,     |
>                  bs, &local_err);   |
>      bdrv_drained_end(bs);          |
>                                     |
>   2. s = block_job_create(...);     |
>                                     |bdrv_mirror_top_pwritev
>                                     | MirrorBDSOpaque *s = bs->opaque;
>                                     | bool copy_to_target;
>                                     | copy_to_target = s->job->ret >= 0 &&
>                                     |     s->job->copy_mode ==
>                                     |     MIRROR_COPY_MODE_WRITE_BLOCKING;
>                                     | (s->job is not NULL until 3!)
>   3. bs_opaque->job = s;            |
> 
> Just moving step 2 & 3 before 1 can avoid this.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> ---
>   block/mirror.c | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index e8e8844afc40..7c872be71149 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -1600,6 +1600,16 @@ static BlockJob *mirror_start_job(
>       mirror_top_bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
>                                             BDRV_REQ_NO_FALLBACK;
>       bs_opaque = g_new0(MirrorBDSOpaque, 1);
> +    /* Make sure that the source is not resized while the job is running */
> +    s = block_job_create(job_id, driver, NULL, bs,
> +                         BLK_PERM_CONSISTENT_READ,
> +                         BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED |
> +                         BLK_PERM_WRITE | BLK_PERM_GRAPH_MOD, speed,
> +                         creation_flags, cb, opaque, errp);
> +    if (!s) {
> +        goto fail;
> +    }
> +    bs_opaque->job = s;
>       mirror_top_bs->opaque = bs_opaque;
>   
>       /* bdrv_append takes ownership of the mirror_top_bs reference, need to keep
> @@ -1612,19 +1622,8 @@ static BlockJob *mirror_start_job(
>       if (local_err) {
>           bdrv_unref(mirror_top_bs);
>           error_propagate(errp, local_err);
> -        return NULL;
> -    }
> -
> -    /* Make sure that the source is not resized while the job is running */
> -    s = block_job_create(job_id, driver, NULL, mirror_top_bs,
> -                         BLK_PERM_CONSISTENT_READ,
> -                         BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED |
> -                         BLK_PERM_WRITE | BLK_PERM_GRAPH_MOD, speed,
> -                         creation_flags, cb, opaque, errp);
> -    if (!s) {
>           goto fail;
>       }
> -    bs_opaque->job = s;
>   
>       /* The block job now has a reference to this node */
>       bdrv_unref(mirror_top_bs);
> 


