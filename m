Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8B9337A32
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:59:32 +0100 (CET)
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOeo-0002QN-Ro
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKOdI-0000j7-HP
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKOdD-0000XG-Go
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615481866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=huH4ShnWcb1ZGTcud79ZhzJpVLMwEGcDSQv3N79PtSc=;
 b=Wzp6Sxi/CP8sNn9AduUloLAytX2B4ozyONGG2MOALIX4Foti9ffBGWz2N4H1E4EOe5tvG5
 j0k4oTx4HpChuXtM26OasRiQQurJVJef9dH6PwdX+/5MlwWQ+/A8rgY5BRt1zcVSJ3KZnA
 bMFbZKaduf7qyPF7WTqYhNuBTFCiapY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-kGrxNT5MMe26APsqEAY-Yg-1; Thu, 11 Mar 2021 11:57:45 -0500
X-MC-Unique: kGrxNT5MMe26APsqEAY-Yg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12965193248A;
 Thu, 11 Mar 2021 16:57:44 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 474E75C1CF;
 Thu, 11 Mar 2021 16:57:42 +0000 (UTC)
Subject: Re: [PATCH v3 1/6] block-jobs: flush target at the end of .run()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-2-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <33bf5c5b-f48f-813a-acc8-b3129bc85714@redhat.com>
Date: Thu, 11 Mar 2021 17:57:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305173507.393137-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
> We are going to implement compressed write cache to improve performance
> of compressed backup when target is opened in O_DIRECT mode. We
> definitely want to flush the cache at backup finish, and if flush fails
> it should be reported as block-job failure, not simply ignored in
> bdrv_close(). So, teach all block-jobs to flush their targets at the
> end.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/blockjob_int.h | 18 ++++++++++++++++++
>   block/backup.c               |  8 +++++---
>   block/commit.c               |  2 ++
>   block/mirror.c               |  2 ++
>   block/stream.c               |  2 ++
>   blockjob.c                   | 16 ++++++++++++++++
>   6 files changed, 45 insertions(+), 3 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>

Just a nit on the function’s description.

> diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
> index 6633d83da2..6ef3123120 100644
> --- a/include/block/blockjob_int.h
> +++ b/include/block/blockjob_int.h
> @@ -119,4 +119,22 @@ int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n);
>   BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
>                                           int is_read, int error);
>   
> +/**
> + * block_job_final_target_flush:
> + * @job: The job to signal an error for if flush failed.
> + * @target_bs: The bs to flush.
> + * @ret: Will be updated (to return code of bdrv_flush()) only if it is zero
> + *       now. This is a bit unusual interface but all callers are comfortable
> + *       with it.
> + *
> + * The function is intended to be called at the end of .run() for any data
> + * copying job.
> + *
> + * There are may be some internal caches in format layers of target,
-are, *in the format layers of the target

> + * like compressed_cache in qcow2 format. So we should call flush to
> + * be sure that all data reached the destination protocol layer.
> + */
> +void block_job_final_target_flush(BlockJob *job, BlockDriverState *target_bs,
> +                                  int *ret);
> +
>   #endif


