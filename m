Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D693738A2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:37:48 +0200 (CEST)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEuZ-0008JY-CW
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1leEqn-0006m6-4W
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:33:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1leEqg-0005eT-9C
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620210825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3SYkT0vNcBODP04FkpE+G9bNSw4u79FchpNfV0+dAw=;
 b=TF8/Mb9LhuCTlzfmdx+WBIYibRWW6EzLeVQ0H2t1qZmdHuhP8uEaAKLof9tdHcEGCkZ6vy
 R9H+n6wDgEcrugVXR4mevuRWvQdGlJjyXi8UMzXIZyS7HyEe/zfVV5VKWCv+Ile9Q3acKx
 q7+Y35cIPq8dv145DUkGzZ9gAZ0Q7lI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-_h9hgCqHOyaqMj8qpgTPbg-1; Wed, 05 May 2021 06:33:43 -0400
X-MC-Unique: _h9hgCqHOyaqMj8qpgTPbg-1
Received: by mail-ej1-f71.google.com with SMTP id
 bx15-20020a170906a1cfb029037415131f28so283685ejb.18
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 03:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y3SYkT0vNcBODP04FkpE+G9bNSw4u79FchpNfV0+dAw=;
 b=H5w5jw996W/mkLt6o4DjmlNMGZAcfl2uXncGgODsc0jtaXksMrnSCFwbDWmbQ74kTk
 ysUW4+Hi8t3eSNDoivC8+9Z0b2bfSHKJbaVzsCNt0WN7ZzEC/wPiCBqt3I3CpAJXN1K3
 yFA2/MQBIyYQreukXHNT+rZv1e8rn0xh1Pr7dq8OT0YgND6P6/f+DUcMfyzFMxrj1j1x
 k478QvSlC2sU7CK1V36NW21Gatt4re6P7QLt6OWYvlvEr4591lGGYdUeWqrTjTtGzwpl
 9fPC4WGsqcZye42BRgAtjKLmkv/2INwNeNiQBJSQ27Xx1xOYPaqRkhOXYlyJj3hnvDD+
 HCTA==
X-Gm-Message-State: AOAM533cXNCfUkS4BoQnv6Pbg9Pn2ldEliNVvJ/9o5YRZjrfeh+8nkm3
 r6aughQ7g+LNTswQTf2UT1qHajoz+qwVq3TJS+h4kdfqiEihFrYaCHgDQuDnx7NExaidQoXAvna
 mjfvTGK0E8HgQstA=
X-Received: by 2002:a17:906:c0c3:: with SMTP id
 bn3mr11837685ejb.498.1620210822400; 
 Wed, 05 May 2021 03:33:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLFfb2ve03GExBE2BC3exrlnAmevp2Km7HACy2NFF7UaFjil+HmOkYvTWNp29HOK7psbATnQ==
X-Received: by 2002:a17:906:c0c3:: with SMTP id
 bn3mr11837656ejb.498.1620210822096; 
 Wed, 05 May 2021 03:33:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q12sm2734427ejy.91.2021.05.05.03.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 03:33:41 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] block/replication: do not acquire AioContext
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-8-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d223ddc1-fe04-36ba-245c-f984faa1639e@redhat.com>
Date: Wed, 5 May 2021 12:33:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210419085541.22310-8-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/21 10:55, Emanuele Giuseppe Esposito wrote:
> Replication functions are mostly called when the BDS is quiescent and
> does not have any pending I/O.  They do not need to synchronize on
> anything since BDS and BB are now thread-safe.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This patch has the same issue that Stefan mentioned in patch 2.  In 
particular, the following chain leads to the bdrv*drain family of 
functions and thus AIO_WAIT_WHILE:

replication_start -> reopen_backing_file -> bdrv_subtree_drained_begin

and also

replication_stop -> commit_active_start -> bdrv_reopen_set_read_only

The same is true of patch 8, where you have call sequences like

bdrv_commit -> blk_flush -> bdrv_flush (in the generated file 
block/block-gen.c) -> bdrv_poll_co

So patches 7 and 8 need to be shelved for now, as they can only go in 
with the overall removal of AioContext lock.

Paolo

> ---
>   block/replication.c | 54 ++++++++++-----------------------------------
>   1 file changed, 12 insertions(+), 42 deletions(-)
> 
> diff --git a/block/replication.c b/block/replication.c
> index 97be7ef4de..25ee37b21b 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -45,6 +45,8 @@ typedef struct BDRVReplicationState {
>       Error *blocker;
>       bool orig_hidden_read_only;
>       bool orig_secondary_read_only;
> +
> +    /* This field is accessed asynchronously.  */
>       int error;
>   } BDRVReplicationState;
>   
> @@ -210,7 +212,7 @@ static int replication_return_value(BDRVReplicationState *s, int ret)
>       }
>   
>       if (ret < 0) {
> -        s->error = ret;
> +        qatomic_set(&s->error, ret);
>           ret = 0;
>       }
>   
> @@ -307,6 +309,7 @@ out:
>       return ret;
>   }
>   
> +/* Called with no I/O pending.  */
>   static void secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
>   {
>       Error *local_err = NULL;
> @@ -420,7 +423,7 @@ static void backup_job_completed(void *opaque, int ret)
>   
>       if (s->stage != BLOCK_REPLICATION_FAILOVER) {
>           /* The backup job is cancelled unexpectedly */
> -        s->error = -EIO;
> +        qatomic_set(&s->error, -EIO);
>       }
>   
>       backup_job_cleanup(bs);
> @@ -445,6 +448,7 @@ static bool check_top_bs(BlockDriverState *top_bs, BlockDriverState *bs)
>       return false;
>   }
>   
> +/* Called with no I/O pending.  */
>   static void replication_start(ReplicationState *rs, ReplicationMode mode,
>                                 Error **errp)
>   {
> @@ -452,12 +456,9 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>       BDRVReplicationState *s;
>       BlockDriverState *top_bs;
>       int64_t active_length, hidden_length, disk_length;
> -    AioContext *aio_context;
>       Error *local_err = NULL;
>       BackupPerf perf = { .use_copy_range = true, .max_workers = 1 };
>   
> -    aio_context = bdrv_get_aio_context(bs);
> -    aio_context_acquire(aio_context);
>       s = bs->opaque;
>   
>       if (s->stage == BLOCK_REPLICATION_DONE ||
> @@ -467,20 +468,17 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>            * Ignore the request because the secondary side of replication
>            * doesn't have to do anything anymore.
>            */
> -        aio_context_release(aio_context);
>           return;
>       }
>   
>       if (s->stage != BLOCK_REPLICATION_NONE) {
>           error_setg(errp, "Block replication is running or done");
> -        aio_context_release(aio_context);
>           return;
>       }
>   
>       if (s->mode != mode) {
>           error_setg(errp, "The parameter mode's value is invalid, needs %d,"
>                      " but got %d", s->mode, mode);
> -        aio_context_release(aio_context);
>           return;
>       }
>   
> @@ -492,21 +490,18 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>           if (!s->active_disk || !s->active_disk->bs ||
>                                       !s->active_disk->bs->backing) {
>               error_setg(errp, "Active disk doesn't have backing file");
> -            aio_context_release(aio_context);
>               return;
>           }
>   
>           s->hidden_disk = s->active_disk->bs->backing;
>           if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
>               error_setg(errp, "Hidden disk doesn't have backing file");
> -            aio_context_release(aio_context);
>               return;
>           }
>   
>           s->secondary_disk = s->hidden_disk->bs->backing;
>           if (!s->secondary_disk->bs || !bdrv_has_blk(s->secondary_disk->bs)) {
>               error_setg(errp, "The secondary disk doesn't have block backend");
> -            aio_context_release(aio_context);
>               return;
>           }
>   
> @@ -518,7 +513,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>               active_length != hidden_length || hidden_length != disk_length) {
>               error_setg(errp, "Active disk, hidden disk, secondary disk's length"
>                          " are not the same");
> -            aio_context_release(aio_context);
>               return;
>           }
>   
> @@ -529,7 +523,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>               !s->hidden_disk->bs->drv->bdrv_make_empty) {
>               error_setg(errp,
>                          "Active disk or hidden disk doesn't support make_empty");
> -            aio_context_release(aio_context);
>               return;
>           }
>   
> @@ -537,7 +530,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>           reopen_backing_file(bs, true, &local_err);
>           if (local_err) {
>               error_propagate(errp, local_err);
> -            aio_context_release(aio_context);
>               return;
>           }
>   
> @@ -550,7 +542,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>               !check_top_bs(top_bs, bs)) {
>               error_setg(errp, "No top_bs or it is invalid");
>               reopen_backing_file(bs, false, NULL);
> -            aio_context_release(aio_context);
>               return;
>           }
>           bdrv_op_block_all(top_bs, s->blocker);
> @@ -566,13 +557,11 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>           if (local_err) {
>               error_propagate(errp, local_err);
>               backup_job_cleanup(bs);
> -            aio_context_release(aio_context);
>               return;
>           }
>           job_start(&s->backup_job->job);
>           break;
>       default:
> -        aio_context_release(aio_context);
>           abort();
>       }
>   
> @@ -582,18 +571,15 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>           secondary_do_checkpoint(s, errp);
>       }
>   
> -    s->error = 0;
> -    aio_context_release(aio_context);
> +    qatomic_set(&s->error, 0);
>   }
>   
> +/* Called with no I/O pending.  */
>   static void replication_do_checkpoint(ReplicationState *rs, Error **errp)
>   {
>       BlockDriverState *bs = rs->opaque;
>       BDRVReplicationState *s;
> -    AioContext *aio_context;
>   
> -    aio_context = bdrv_get_aio_context(bs);
> -    aio_context_acquire(aio_context);
>       s = bs->opaque;
>   
>       if (s->stage == BLOCK_REPLICATION_DONE ||
> @@ -603,38 +589,30 @@ static void replication_do_checkpoint(ReplicationState *rs, Error **errp)
>            * Ignore the request because the secondary side of replication
>            * doesn't have to do anything anymore.
>            */
> -        aio_context_release(aio_context);
>           return;
>       }
>   
>       if (s->mode == REPLICATION_MODE_SECONDARY) {
>           secondary_do_checkpoint(s, errp);
>       }
> -    aio_context_release(aio_context);
>   }
>   
>   static void replication_get_error(ReplicationState *rs, Error **errp)
>   {
>       BlockDriverState *bs = rs->opaque;
>       BDRVReplicationState *s;
> -    AioContext *aio_context;
>   
> -    aio_context = bdrv_get_aio_context(bs);
> -    aio_context_acquire(aio_context);
>       s = bs->opaque;
>   
>       if (s->stage == BLOCK_REPLICATION_NONE) {
>           error_setg(errp, "Block replication is not running");
> -        aio_context_release(aio_context);
>           return;
>       }
>   
> -    if (s->error) {
> +    if (qatomic_read(&s->error)) {
>           error_setg(errp, "I/O error occurred");
> -        aio_context_release(aio_context);
>           return;
>       }
> -    aio_context_release(aio_context);
>   }
>   
>   static void replication_done(void *opaque, int ret)
> @@ -648,10 +626,10 @@ static void replication_done(void *opaque, int ret)
>           s->active_disk = NULL;
>           s->secondary_disk = NULL;
>           s->hidden_disk = NULL;
> -        s->error = 0;
> +        qatomic_set(&s->error, 0);
>       } else {
>           s->stage = BLOCK_REPLICATION_FAILOVER_FAILED;
> -        s->error = -EIO;
> +        qatomic_set(&s->error, -EIO);
>       }
>   }
>   
> @@ -659,10 +637,7 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
>   {
>       BlockDriverState *bs = rs->opaque;
>       BDRVReplicationState *s;
> -    AioContext *aio_context;
>   
> -    aio_context = bdrv_get_aio_context(bs);
> -    aio_context_acquire(aio_context);
>       s = bs->opaque;
>   
>       if (s->stage == BLOCK_REPLICATION_DONE ||
> @@ -672,20 +647,18 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
>            * Ignore the request because the secondary side of replication
>            * doesn't have to do anything anymore.
>            */
> -        aio_context_release(aio_context);
>           return;
>       }
>   
>       if (s->stage != BLOCK_REPLICATION_RUNNING) {
>           error_setg(errp, "Block replication is not running");
> -        aio_context_release(aio_context);
>           return;
>       }
>   
>       switch (s->mode) {
>       case REPLICATION_MODE_PRIMARY:
>           s->stage = BLOCK_REPLICATION_DONE;
> -        s->error = 0;
> +        qatomic_set(&s->error, 0);
>           break;
>       case REPLICATION_MODE_SECONDARY:
>           /*
> @@ -700,7 +673,6 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
>           if (!failover) {
>               secondary_do_checkpoint(s, errp);
>               s->stage = BLOCK_REPLICATION_DONE;
> -            aio_context_release(aio_context);
>               return;
>           }
>   
> @@ -711,10 +683,8 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
>                               NULL, replication_done, bs, true, errp);
>           break;
>       default:
> -        aio_context_release(aio_context);
>           abort();
>       }
> -    aio_context_release(aio_context);
>   }
>   
>   static const char *const replication_strong_runtime_opts[] = {
> 


