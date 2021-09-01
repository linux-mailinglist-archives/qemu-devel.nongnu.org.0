Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C290B3FD9DD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:54:57 +0200 (CEST)
Received: from localhost ([::1]:58622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPlY-0002hu-Q0
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLPgM-0001N0-So
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:49:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLPgE-00050r-OX
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630500566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVU7nL2ATsF90b6vaZfg5cVdWcEjhhWNQesLdoUjuus=;
 b=b8BdxvQ59a/LF+hOmtRf0uLOvcsxPTNO/9nzG7vcsx50tnpmSV3Ty8d7UPH36VX4zfHMuo
 skJffXIuDu0RUYIcDw5LwJQC/B1+VtXQ6C+TTga+J8y60fHZkXs4n/5dlWTy7b/RQON6i/
 iEygYxCOALYQFJezlzzrGgUa+qgR6Ng=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-zrjjrta9OkKiBEMJCMtUfA-1; Wed, 01 Sep 2021 08:49:24 -0400
X-MC-Unique: zrjjrta9OkKiBEMJCMtUfA-1
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so983421wmj.6
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 05:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=AVU7nL2ATsF90b6vaZfg5cVdWcEjhhWNQesLdoUjuus=;
 b=uXY0q6K3/GXN5G58AVicAG6uYmuxcPaFWll5zK9yLJvll4tmpYHOULVF4jBJtfjK/r
 DbHBH+P/Wra+UykVm4T/WMaH0AX+7QsJv2NDLf3nVFgNH2X23euw7xviUcxiejrcnGu9
 0KA0wzwzFBK2TsmR0r8GoM5t658k3kJypRYedxnGA2Xm4fTLNkZJzg3F8PjupjfJcJm8
 B0WBI33bFGyy0ZG1+cx9yGq4Kyq29Y3DgSwW0n67NuV/6zvq1mgeJjYxy2fWo+nTn9RI
 rN2nW2qs9Q6OnWU6W4WzQc24ZKV0TUijktCOOjkXiXz9TXrYgnaNfHaDM4oX0crtqXWu
 tn/A==
X-Gm-Message-State: AOAM5317wlukkhFMBhHCK/2/Vt+7gx4mn7IYmJ6BwOpqtMGFWcKYnMru
 YQ3JJOagZ9KsLZ1CwyCFNaISEuyVO8UzVs7WwvhRf7k567JEAUgWIBLTpCFtJ5uymRLOH8Sxt23
 KUXtFNzDv/+WUm2o=
X-Received: by 2002:a05:600c:350d:: with SMTP id
 h13mr9293082wmq.38.1630500563700; 
 Wed, 01 Sep 2021 05:49:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNJ5uz34j4m5Q7M8sdORPN8kwKaK8P/ytSNBKAMxLuKp6r++eLnLS1/ALb/hJK+TXaz3Sy9w==
X-Received: by 2002:a05:600c:350d:: with SMTP id
 h13mr9293065wmq.38.1630500563544; 
 Wed, 01 Sep 2021 05:49:23 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 m3sm26961978wrg.45.2021.09.01.05.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 05:49:23 -0700 (PDT)
Subject: Re: [PATCH for-6.2 v3 05/12] job: @force parameter for
 job_cancel_sync{,_all}()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-6-mreitz@redhat.com>
 <efd845f6-e62a-88a1-2ef7-0960714ba63d@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <b42ad82f-7292-96b8-775f-5422a9df78eb@redhat.com>
Date: Wed, 1 Sep 2021 14:49:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <efd845f6-e62a-88a1-2ef7-0960714ba63d@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.029,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.09.21 12:20, Vladimir Sementsov-Ogievskiy wrote:
> 06.08.2021 12:38, Max Reitz wrote:
>> Callers should be able to specify whether they want job_cancel_sync() to
>> force-cancel the job or not.
>>
>> In fact, almost all invocations do not care about consistency of the
>> result and just want the job to terminate as soon as possible, so they
>> should pass force=true.  The replication block driver is the exception.
>>
>> This changes some iotest outputs, because quitting qemu while a mirror
>> job is active will now lead to it being cancelled instead of completed,
>> which is what we want.  (Cancelling a READY mirror job with force=false
>> may take an indefinite amount of time, which we do not want when
>> quitting.  If users want consistent results, they must have all jobs be
>> done before they quit qemu.)
>>
>> Buglink:https://gitlab.com/qemu-project/qemu/-/issues/462
>> Signed-off-by: Max Reitz<mreitz@redhat.com>
>> ---
>>   include/qemu/job.h                    | 10 ++---
>>   block/replication.c                   |  4 +-
>>   blockdev.c                            |  4 +-
>>   job.c                                 | 20 +++++++--
>>   qemu-nbd.c                            |  2 +-
>>   softmmu/runstate.c                    |  2 +-
>>   storage-daemon/qemu-storage-daemon.c  |  2 +-
>>   tests/unit/test-block-iothread.c      |  2 +-
>>   tests/unit/test-blockjob.c            |  2 +-
>>   tests/qemu-iotests/109.out            | 60 +++++++++++----------------
>>   tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
>>   11 files changed, 55 insertions(+), 55 deletions(-)
>>
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index 41162ed494..5e8edbc2c8 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -506,19 +506,19 @@ void job_user_cancel(Job *job, bool force, 
>> Error **errp);
>>     /**
>>    * Synchronously cancel the @job.  The completion callback is called
>> - * before the function returns.  The job may actually complete
>> - * instead of canceling itself; the circumstances under which this
>> - * happens depend on the kind of job that is active.
>> + * before the function returns.  If @force is false, the job may
>> + * actually complete instead of canceling itself; the circumstances
>> + * under which this happens depend on the kind of job that is active.
>>    *
>>    * Returns the return value from the job if the job actually completed
>>    * during the call, or -ECANCELED if it was canceled.
>>    *
>>    * Callers must hold the AioContext lock of job->aio_context.
>>    */
>> -int job_cancel_sync(Job *job);
>> +int job_cancel_sync(Job *job, bool force);
>>     /** Synchronously cancels all jobs using job_cancel_sync(). */
>> -void job_cancel_sync_all(void);
>> +void job_cancel_sync_all(bool force);
>
> I think it would be better to keep job_cancel_sync_all(void) prototype 
> and just change its behavior to do force-cancel. Anyway, this patch 
> always pass true to it. And it would be strange to do soft-cancel-all, 
> keeping in mind that soft cancelling only make sense for mirror in 
> ready state.

Actually, yes, that’s true.  I’ll drop the parameter.

Hanna


