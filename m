Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490F43DFF3C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 12:14:07 +0200 (CEST)
Received: from localhost ([::1]:52656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDuY-0006pS-B1
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 06:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBDtU-00061V-Vz
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 06:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBDtS-0008PM-39
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 06:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628071976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fOdFeFR2ixOn8ORHx0CFLBXkpQbPgJoWqM/q8jnly0A=;
 b=KJnwb79WTt3UrhkGTPnzGD8+IA5r8za8FlDt7Vq4LmwQOLH2DqOqCP1pPKRm822oPHIPfC
 de2SaCEAQedTmCHH++bHd+rLndX+wZ+5fQgpNcYpXs6ggeuULihoX/rNdOa9TO/w7y5O6L
 9SojsSnltF0twBj64KFnmfG6Vkd4o9A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-UUyQ1GFvPfqopCFnKv8NfQ-1; Wed, 04 Aug 2021 06:12:55 -0400
X-MC-Unique: UUyQ1GFvPfqopCFnKv8NfQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f20-20020a1c6a140000b029025b066428ebso582830wmc.5
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 03:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fOdFeFR2ixOn8ORHx0CFLBXkpQbPgJoWqM/q8jnly0A=;
 b=TXw4wLRlpQWRX5CU9/CNy/C2wYTIbpdw/brGVMhxqWR/Xci5Z/14EjZFJry767NGkD
 bhFJ1Ebk6pONYuxV6CFohal7jfyd17XG9Iu46zOsTOWrMVPiB7m1Kp7SquCQRAZyIZIW
 ZIAyQsGIuqftkdToOfnJlUQDbf+h1qW59o7WoRI04ByGl6YDMzmlCgCFVZ4N2vCnNKGv
 Jpul6ZeOUV2XWJu3Hvt7sPEiNa1RH4Q1kvl7LpVGX+X4Lq9lipHy7La1NreoQNRwL9MZ
 0UvyFsuUJncmSn9BlH5mOrEOyhRdhelDOAPjAXSnXr1b7g8B/vN0xWUAsj09617oZeRf
 f7+A==
X-Gm-Message-State: AOAM531dwlsQUsEYzhe+NZFSeCuRa+GLhsnqkCIdozHbvs4dNrmTOkLj
 mpwPDsCAhmMjSKWHHg4qnq697oq20+Zhk9st4YDAi4Ejc8eHqeGZxj1bbN4nB9jJEHge0JYA+ZD
 5qkXpIQjUi4ljHR0=
X-Received: by 2002:a5d:4312:: with SMTP id h18mr28612597wrq.170.1628071974063; 
 Wed, 04 Aug 2021 03:12:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm5TPRaJIcSQcqfUie3lcWLHxZQqtzSzRAJo8nY9Yr/Ej8iiCjJPXVOrzjbPKXc4IkDuBS8A==
X-Received: by 2002:a5d:4312:: with SMTP id h18mr28612562wrq.170.1628071973738; 
 Wed, 04 Aug 2021 03:12:53 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 k1sm2064669wrz.61.2021.08.04.03.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 03:12:53 -0700 (PDT)
Subject: Re: [PATCH for-6.1? v2 6/7] mirror: Check job_is_cancelled() earlier
To: Kevin Wolf <kwolf@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-7-mreitz@redhat.com> <YQlT4rO9OoykGl/b@redhat.com>
 <cbf2f3c8-6e7a-b277-f90a-483699828b6f@redhat.com>
 <YQpihpmOeswUGSlh@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a8d7fe17-0959-eb6f-4205-f319827a3d92@redhat.com>
Date: Wed, 4 Aug 2021 12:12:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQpihpmOeswUGSlh@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.08.21 11:48, Kevin Wolf wrote:
> Am 04.08.2021 um 10:25 hat Max Reitz geschrieben:
>> On 03.08.21 16:34, Kevin Wolf wrote:
>>> Am 26.07.2021 um 16:46 hat Max Reitz geschrieben:
>>>> We must check whether the job is force-cancelled early in our main loop,
>>>> most importantly before any `continue` statement.  For example, we used
>>>> to have `continue`s before our current checking location that are
>>>> triggered by `mirror_flush()` failing.  So, if `mirror_flush()` kept
>>>> failing, force-cancelling the job would not terminate it.
>>>>
>>>> A job being force-cancelled should be treated the same as the job having
>>>> failed, so put the check in the same place where we check `s->ret < 0`.
>>>>
>>>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
>>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>>> ---
>>>>    block/mirror.c | 7 +------
>>>>    1 file changed, 1 insertion(+), 6 deletions(-)
>>>>
>>>> diff --git a/block/mirror.c b/block/mirror.c
>>>> index 72e02fa34e..46d1a1e5a2 100644
>>>> --- a/block/mirror.c
>>>> +++ b/block/mirror.c
>>>> @@ -993,7 +993,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>>>>                mirror_wait_for_any_operation(s, true);
>>>>            }
>>>> -        if (s->ret < 0) {
>>>> +        if (s->ret < 0 || job_is_cancelled(&s->common.job)) {
>>>>                ret = s->ret;
>>>>                goto immediate_exit;
>>>>            }
>>>> @@ -1078,8 +1078,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>>>>                break;
>>>>            }
>>>> -        ret = 0;
>>>> -
>>>>            if (job_is_ready(&s->common.job) && !should_complete) {
>>>>                delay_ns = (s->in_flight == 0 &&
>>>>                            cnt == 0 ? BLOCK_JOB_SLICE_TIME : 0);
>>>> @@ -1087,9 +1085,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>>>>            trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
>>>>                                      delay_ns);
>>>>            job_sleep_ns(&s->common.job, delay_ns);
>>>> -        if (job_is_cancelled(&s->common.job)) {
>>>> -            break;
>>>> -        }
>>> I think it was intentional that the check is here because it means
>>> skipping the job_sleep_ns() and instead cancelling immediately, and we
>>> probably still want that. Between your check above and here, the
>>> coroutine can yield, so cancellation could have been newly requested.
>> I’m afraid I don’t quite understand.
> Hm, I don't either. Somehow I thought job_sleep_ns() was after the
> check, while quoting the exact hunk that shows that it comes before
> it...
>
> I'm still not sure if sleeping before exiting is really useful, but it
> seems we never cared about that.

Jobs that are (force-)cancelled cannot yield or sleep anyway 
(job_sleep_ns(), job_yield(), and job_pause_point() will all return 
immediately when called on a cancelled job).

So I thought you meant that a job can only be cancelled while it is 
yielding, so we should prefer to put the is_cancelled check after a 
yield point (like job_pause_point()) than before it.

But I mean, if you’re happy, I’ll be happy, too. :)

Max


