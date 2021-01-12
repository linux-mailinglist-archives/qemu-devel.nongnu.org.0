Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0857D2F31AC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:27:34 +0100 (CET)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJht-00055i-3D
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzJeE-0003Ru-17
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:23:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzJeA-0006qe-E2
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610457821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gswitTSe3iYhD8ouzsmowrwKZdgBW2DPzl6oPa1zhr8=;
 b=ZwFcz65QUPfAoFiWNpCCtzU+tcTxzCTmElAcyXbY63NK4aJbGmAz/El0K033FKCD+LuSSf
 hgWGmVO25Z4KmhWzfve4IkJA4YFFmWMXXUn5Qk60iQYlc8LBBzD5clARNDgC/haJQ0m4jJ
 EoUPRNw+kk9BOxGwNClpaW5Lqm4Q7rI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-MTPKjTxPM9WfYP00HE9dNg-1; Tue, 12 Jan 2021 08:23:39 -0500
X-MC-Unique: MTPKjTxPM9WfYP00HE9dNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 943F19CDB3;
 Tue, 12 Jan 2021 13:23:38 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-161.ams2.redhat.com
 [10.36.115.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64F8110016F5;
 Tue, 12 Jan 2021 13:23:36 +0000 (UTC)
Subject: Re: [PATCH v3 19/25] backup: move to block-copy
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-20-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <9708f8d8-3afc-f30d-9245-20071763c5a3@redhat.com>
Date: Tue, 12 Jan 2021 14:23:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201026171815.13233-20-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.20 18:18, Vladimir Sementsov-Ogievskiy wrote:
> This brings async request handling and block-status driven chunk sizes
> to backup out of the box, which improves backup performance.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/backup.c | 187 ++++++++++++++++++++++++++++++++-----------------
>   1 file changed, 121 insertions(+), 66 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>

Irrelevant notes below.

> diff --git a/block/backup.c b/block/backup.c
> index 449b763ce4..0d1cd64eab 100644
> --- a/block/backup.c
> +++ b/block/backup.c

(Just something I noted when looking for remaining instances of 
“ratelimit”: backup.c includes ratelimit.h, which I don’t think it needs 
to do any longer)

[...]

>   static int coroutine_fn backup_loop(BackupBlockJob *job)
>   {

[...]

> +        if (!block_copy_call_finished(s) &&
> +            job_is_cancelled(&job->common.job))
> +        {

Just for the sake of clarity: If !block_copy_call_finished(), then 
job_is_cancelled() must be true, right?

(I.e., could be an assertion instead of the second part of the 
condition.  I don’t mind how it is, but then again, it did made me ask.)

> +            /*
> +             * Note that we can't use job_yield() here, as it doesn't work for
> +             * cancelled job.
> +             */
> +            block_copy_call_cancel(s);
> +            job->wait = true;
> +            qemu_coroutine_yield();
> +            assert(block_copy_call_finished(s));
> +            ret = 0;
> +            goto out;
> +        }
> +
> +        if (job_is_cancelled(&job->common.job) ||
> +            block_copy_call_succeeded(s))
> +        {
> +            ret = 0;
> +            goto out;
> +        }
> +
> +        if (block_copy_call_cancelled(s)) {
> +            /*
> +             * Job is not cancelled but only block-copy call. This is possible
> +             * after job pause. Now the pause is finished, start new block-copy
> +             * iteration.
> +             */
> +            block_copy_call_free(s);
> +            continue;

If one were to avoid all continues, we could alternatively put the whole 
error handling into a block_copy_call_failed() condition, and have the 
block_copy_call_free() common for both the cancel and the fail case.

*shrug*

> +        }
> +
> +        /* The only remaining case is failed block-copy call. */
> +        assert(block_copy_call_failed(s));
> +
> +        ret = block_copy_call_status(s, &error_is_read);
> +        act = backup_error_action(job, error_is_read, -ret);
> +        switch (act) {
> +        case BLOCK_ERROR_ACTION_REPORT:
> +            goto out;
> +        case BLOCK_ERROR_ACTION_STOP:
> +            /*
> +             * Go to pause prior to starting new block-copy call on the next
> +             * iteration.
> +             */
> +            job_pause_point(&job->common.job);
> +            break;
> +        case BLOCK_ERROR_ACTION_IGNORE:
> +            /* Proceed to new block-copy call to retry. */
> +            break;
> +        default:
> +            abort();
> +        }
> +
> +        block_copy_call_free(s);
>       }
>   
> - out:
> -    bdrv_dirty_iter_free(bdbi);
> +out:
> +    block_copy_call_free(s);

Reads a bit weird after the block_copy_call_free(s) at the end of the 
while (true) loop, but is entirely correct, of course.  (And I can’t 
offer any better alternative.)

Max

> +    job->bg_bcs_call = NULL;
>       return ret;
>   }


