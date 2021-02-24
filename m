Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96390324100
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:03:41 +0100 (CET)
Received: from localhost ([::1]:46962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwdY-0004hM-7B
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lEwZb-0002kU-3V
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:59:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lEwZZ-0003Ta-8Y
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614182372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V4IqRjajg5MhQCTVSPld6RqEOu3q0cWoEk9Y17NvqoI=;
 b=CLE4fqF5Bboma2FAsYSVWSzTd69mYB6dgeonbqeq8DTRMulazJUyUN0wQvdNbnNop1PUS8
 a+BMGKeaxlkxVjor/xCj2TgP0Etlcsn6YCLC1ZLMm5/l4grk09ycofu52Jn0lQlc8nxsWj
 CY+uljKhcNtsxuO80TMVcrkEnDfzGr0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-DSquA_dlPzajRhLk91jdZA-1; Wed, 24 Feb 2021 10:59:30 -0500
X-MC-Unique: DSquA_dlPzajRhLk91jdZA-1
Received: by mail-wm1-f71.google.com with SMTP id t15so1563802wmj.1
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 07:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V4IqRjajg5MhQCTVSPld6RqEOu3q0cWoEk9Y17NvqoI=;
 b=HcJ/dGtmB8a+bA5gU4HgGLg87DlFJm42AweTh5SnU/YVm4sMqPViXP1Y5yVZuaRZV5
 6mPiAwEcYkwjuoUC5UGPGAxgcfhiESF7gS56RDmSryg7wnG8lxNfRfPZ/qf2MrDbJr+A
 VueuZO88P0TDn+4fsk6UShIftyRDR2NAL0g90Og7m+scCw4msKGOulELUx8qc6TBxlYK
 udAiBaHp4FsT8/RHx3eC0YXFerkial+wgkia4G5tlCVlR+VqqbqKUnYw/UNMoMlkrFUe
 Avv3G77Rw4OFpNLUCky8W2CxHGAlL7oepYdCwYulYKvoscDqIA7bmLWV/YMlOxD+pP6p
 LtCw==
X-Gm-Message-State: AOAM53031l3BCQSH6GxR8bVy1Dr3fdNKwoTHmF0M7CzBpbis9KeEmGyG
 WbddoW5Q5PADqk+RpxzM83/I+s2M5R4oj1nabYBCvNOBMAHLLGZl4KOctDtnWs41whuO454La6t
 sNmUnLKqyYX3xmg4=
X-Received: by 2002:a05:600c:4f46:: with SMTP id
 m6mr4398314wmq.154.1614182368391; 
 Wed, 24 Feb 2021 07:59:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNZGr2qgDc2U9DaWVCLlGeHhnLUYxmutYAWuN5L3mUgoakY0SEyNzh5YemeTvw9XPbyli5pw==
X-Received: by 2002:a05:600c:4f46:: with SMTP id
 m6mr4398288wmq.154.1614182368033; 
 Wed, 24 Feb 2021 07:59:28 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id f7sm4485444wrm.92.2021.02.24.07.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 07:59:27 -0800 (PST)
Date: Wed, 24 Feb 2021 16:59:25 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] blockjob: report a better error message
Message-ID: <20210224155925.kzyatjog67ldwpzf@steredhat>
References: <20210223131150.124867-1-sgarzare@redhat.com>
 <20210224143620.GB11025@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210224143620.GB11025@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 03:36:20PM +0100, Kevin Wolf wrote:
>Am 23.02.2021 um 14:11 hat Stefano Garzarella geschrieben:
>> When a block job fails, we report 'strerror(-job->job.ret)' error
>> message, also if the job set an error object.
>> Let's report a better error message using 'error_get_pretty(job->job.err)'.
>>
>> If an error object was not set, strerror(-job->ret) is used as fallback,
>> as explained in include/qemu/job.h:
>>
>> typedef struct Job {
>>     ...
>>     /**
>>      * Error object for a failed job.
>>      * If job->ret is nonzero and an error object was not set, it will be set
>>      * to strerror(-job->ret) during job_completed.
>>      */
>>     Error *err;
>> }
>
>This is true, but there is a short time where job->ret is already set,
>but not turned into job->err yet if necessary. The latter is done in a
>bottom half scheduled after the former has happened.
>
>It doesn't matter for block_job_event_completed(), which is called only
>after both, but block_job_query() could in theory be called in this
>window.
>
>> Suggested-by: Kevin Wolf <kwolf@redhat.com>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  blockjob.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/blockjob.c b/blockjob.c
>> index f2feff051d..a696f3408d 100644
>> --- a/blockjob.c
>> +++ b/blockjob.c
>> @@ -319,7 +319,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
>>      info->auto_finalize = job->job.auto_finalize;
>>      info->auto_dismiss  = job->job.auto_dismiss;
>>      info->has_error = job->job.ret != 0;
>> -    info->error     = job->job.ret ? g_strdup(strerror(-job->job.ret)) : NULL;
>> +    info->error     = job->job.ret ?
>> +                        g_strdup(error_get_pretty(job->job.err)) : NULL;
>
>So I think we can't rely on job->job.err being non-NULL here.

Do you think is better to leave it as it was or do something like this?

     if (job->job.ret) {
         info->has_error = true;
         info->error = job->job.err ? g_strdup(error_get_pretty(job->job.err)) :
                         g_strdup(strerror(-job->job.ret);
     }

Thanks,
Stefano

>
>>      return info;
>>  }
>>
>> @@ -356,7 +357,7 @@ static void block_job_event_completed(Notifier *n, void *opaque)
>>      }
>>
>>      if (job->job.ret < 0) {
>> -        msg = strerror(-job->job.ret);
>> +        msg = error_get_pretty(job->job.err);
>>      }
>>
>>      qapi_event_send_block_job_completed(job_type(&job->job),
>
>Kevin
>


