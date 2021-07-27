Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8302B3D7A09
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 17:42:04 +0200 (CEST)
Received: from localhost ([::1]:34142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8PDX-0007ZV-Iv
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 11:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m8PCO-0005IF-TT
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:40:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m8PCL-0005gD-TI
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627400449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5VOsEtD6JJRJMWE3IgRcrCjhwnWpVc1C/jV69AlOzHI=;
 b=SLXLB+R09ramXhuVXOY7ycbI3iorgPAfKwByBQSR1XQh/w7hggyuGCbL1oSNuYLNSpxpZI
 CZEB9yaVaNbI4NpNqFPuUHldxp0ef10JudBkCq2Jz+kNubRutkMwrEygt26Ed/zWEAUB9q
 e0gPKpAc9PtF3B8/gt+vXx8G3wSFVFg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-Ms0zBBc6MdKMsNU1hWtKpA-1; Tue, 27 Jul 2021 11:40:48 -0400
X-MC-Unique: Ms0zBBc6MdKMsNU1hWtKpA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so811344wml.5
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 08:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5VOsEtD6JJRJMWE3IgRcrCjhwnWpVc1C/jV69AlOzHI=;
 b=NG3i1CNIAhK+rOYegSb1cL1TEvDr6mc+wtf2KvFAi4ZsepeczEsV4bqj+6UX7z29SX
 YJa9VVDmBvgJ+lin7yQNThJzlxuAAKyoSlB7ZCkha98+5z9L06eGgasiTYaOCySIHYoa
 0MoVhj/0S0jAzb1Euy308obZyaYTiUpsAE2VAskkJCgt6LF1sOtxmvRS8jxN2CDqWXo3
 P+aLyrZHwyQNJzmeqVsUtXxf5tj4F9vnew+CPpSTk4UCbLjstsKQsuJdU5rkkkQEvAHL
 T+uoHWVcF8uulduyendNcjThBZ2hYLx0MupdJ3JScp4Gq3iYAL8L9Ly4v0ehWCKk198e
 lq6A==
X-Gm-Message-State: AOAM530pwvSfSLoPMw0xcydIiEt2M3TyKJ85Ko/hdzPZeTp/D3ivqXFJ
 qBu8DCi5N8hdlhZNZFwsglbv2vt9708X2jMnoQqFIzmiSJloL0ahD3zFT04bPF/bhlQ5nTj26PR
 T0pCSE4jSsO+h/9U=
X-Received: by 2002:a5d:45c5:: with SMTP id b5mr2683805wrs.32.1627400446923;
 Tue, 27 Jul 2021 08:40:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylZuqWGOSkoNmXpALZwxRoSWpT7ZfaBIXyQ+BpRAWL3kUwqb3ZdkeHRnWE/lHEnY3BsBKqHQ==
X-Received: by 2002:a5d:45c5:: with SMTP id b5mr2683779wrs.32.1627400446566;
 Tue, 27 Jul 2021 08:40:46 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 w185sm3427553wmb.11.2021.07.27.08.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 08:40:46 -0700 (PDT)
Subject: Re: [PATCH for-6.1? v2 6/7] mirror: Check job_is_cancelled() earlier
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-7-mreitz@redhat.com>
 <be900ee5-f9c4-cee6-e3c6-66aeb0a0d89f@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <3771f388-52e0-50e3-29cb-2d173d314cfc@redhat.com>
Date: Tue, 27 Jul 2021 17:40:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <be900ee5-f9c4-cee6-e3c6-66aeb0a0d89f@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.07.21 15:13, Vladimir Sementsov-Ogievskiy wrote:
> 26.07.2021 17:46, Max Reitz wrote:
>> We must check whether the job is force-cancelled early in our main loop,
>> most importantly before any `continue` statement.  For example, we used
>> to have `continue`s before our current checking location that are
>> triggered by `mirror_flush()` failing.  So, if `mirror_flush()` kept
>> failing, force-cancelling the job would not terminate it.
>>
>> A job being force-cancelled should be treated the same as the job having
>> failed, so put the check in the same place where we check `s->ret < 0`.
>>
>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/mirror.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/block/mirror.c b/block/mirror.c
>> index 72e02fa34e..46d1a1e5a2 100644
>> --- a/block/mirror.c
>> +++ b/block/mirror.c
>> @@ -993,7 +993,7 @@ static int coroutine_fn mirror_run(Job *job, 
>> Error **errp)
>>               mirror_wait_for_any_operation(s, true);
>>           }
>>   -        if (s->ret < 0) {
>> +        if (s->ret < 0 || job_is_cancelled(&s->common.job)) {
>>               ret = s->ret;
>>               goto immediate_exit;
>>           }
>> @@ -1078,8 +1078,6 @@ static int coroutine_fn mirror_run(Job *job, 
>> Error **errp)
>>               break;
>>           }
>>   -        ret = 0;
>> -
>
> That's just a cleanup, that statement is useless pre-patch, yes?

I think it was intended for if we left this loop via the 
job_is_cancelled() condition below.  Since it’s removed, this statement 
seems meaningless, so I removed it along with the `break`.

Max

>
>>           if (job_is_ready(&s->common.job) && !should_complete) {
>>               delay_ns = (s->in_flight == 0 &&
>>                           cnt == 0 ? BLOCK_JOB_SLICE_TIME : 0);
>> @@ -1087,9 +1085,6 @@ static int coroutine_fn mirror_run(Job *job, 
>> Error **errp)
>>           trace_mirror_before_sleep(s, cnt, 
>> job_is_ready(&s->common.job),
>>                                     delay_ns);
>>           job_sleep_ns(&s->common.job, delay_ns);
>> -        if (job_is_cancelled(&s->common.job)) {
>> -            break;
>> -        }
>>           s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
>>       }
>>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>


