Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2305BBF0D
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 19:15:13 +0200 (CEST)
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZxst-0002ZF-Tb
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 13:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oZxqn-0000bs-Jx
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 13:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oZxqj-00021w-4M
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 13:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663521175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=keOtThUT5bB2hgn/Ghk4IIxky37Vw/zeA+Ncni2oFMo=;
 b=PkX9hiwtqzEUXqQEsVhupU1i4gxjB+ZCmfkORIpt7bKkMN6wS93Kl2EClzjSydbKeUW6qi
 PMXnv8SWCc3kxxZL4LRUhq91VlFHwKvVJz5YxcDuio0joa8fOHIbIlzDFCi63rvwO4X96I
 dRE19pA9DPlx1stY2EvzeghipuHTHXM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-FMRMGpQJN0qxB02JJIFEMg-1; Sun, 18 Sep 2022 13:12:53 -0400
X-MC-Unique: FMRMGpQJN0qxB02JJIFEMg-1
Received: by mail-qv1-f71.google.com with SMTP id
 dw19-20020a0562140a1300b004a8eee124b4so18374895qvb.21
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 10:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=keOtThUT5bB2hgn/Ghk4IIxky37Vw/zeA+Ncni2oFMo=;
 b=6XR6ec5747JS9mE1/osnw3lnXqTT4a+zDNSdknuQrxaDtzaRWtr4Hwn5wS/M7o9l0P
 ip68YETK6ELmjvET4rqyE8GpwZbP28AEnU+49r5RMRrQHi0P/FX0wjUAdcCk3S/ehwHm
 owwUROd6g+gCN73qpUCCQ39ynGrMoq7e0K1INO8YKGaygjcE7oFtS8Nq2a1v90HUHoBZ
 eq8r1Bcvu1WcVM7A9UI7RUEX1ZgAHUs0TRhgMJtzT8cuSH8qEYdKBEh4zdBwSUx9d8wZ
 iaQTYobvkFsjO/DAM9BKDfCF9DRxjBo4/DFlMal1CYDhllOMnoIp6y8DeU57qR+h8GPR
 n2MA==
X-Gm-Message-State: ACrzQf0RhTYL+NidJtbQvBJW3ZVSRVQHRblOHl0p/w5rPYctWG9nT3BV
 /bdV4guYrHFR6tl7M5UPoLxJcSbNUZT8+1Mvv4FU9YdtZ8TwVzuKbXdjuswbnydpqgxywlRTnZ4
 AjpkXcSl39YbNB+Y=
X-Received: by 2002:a05:620a:40c1:b0:6ce:a11a:7279 with SMTP id
 g1-20020a05620a40c100b006cea11a7279mr10647158qko.703.1663521173359; 
 Sun, 18 Sep 2022 10:12:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4hYiwV2GWg5fTmAuGzWp5w2ikh+Y5uyzTvfxfHDZYlgj2j9L8brgOcrM/7eKXI40+EudFNUA==
X-Received: by 2002:a05:620a:40c1:b0:6ce:a11a:7279 with SMTP id
 g1-20020a05620a40c100b006cea11a7279mr10647143qko.703.1663521173155; 
 Sun, 18 Sep 2022 10:12:53 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac87d83000000b0035a7070e909sm9599868qtd.38.2022.09.18.10.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 10:12:52 -0700 (PDT)
Message-ID: <508253cf-3134-06ba-b5e6-9f2e594cc9ed@redhat.com>
Date: Sun, 18 Sep 2022 19:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11 18/21] job.c: enable job lock/unlock and remove
 Aiocontext locks
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220826132104.3678958-1-eesposit@redhat.com>
 <20220826132104.3678958-19-eesposit@redhat.com>
 <09759123-8ed4-9c6e-2086-7f65af921a13@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <09759123-8ed4-9c6e-2086-7f65af921a13@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.657, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 15/09/2022 um 16:52 schrieb Vladimir Sementsov-Ogievskiy:
> On 8/26/22 16:21, Emanuele Giuseppe Esposito wrote:
>> Change the job_{lock/unlock} and macros to use job_mutex.
>>
>> Now that they are not nop anymore, remove the aiocontext
>> to avoid deadlocks.
>>
>> Therefore:
>> - when possible, remove completely the aiocontext lock/unlock pair
>> - if it is used by some other function too, reduce the locking
>>    section as much as possible, leaving the job API outside.
>> - change AIO_WAIT_WHILE in AIO_WAIT_WHILE_UNLOCKED, since we
>>    are not using the aiocontext lock anymore
>>
>> The only functions that still need the aiocontext lock are the JobDriver
>> callbacks, already documented in job.h. Reduce the locking section to
>> only cover the callback invocation and document the functions that
>> take the AioContext lock, to avoid taking it twice.
>>
>> Also remove real_job_{lock/unlock}, as they are replaced by the
>> public functions.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
> 
> [..]
> 
>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -911,7 +911,6 @@ static void run_block_job(BlockJob *job, Error
>> **errp)
>>       AioContext *aio_context = block_job_get_aio_context(job);
>>       int ret = 0;
>>   -    aio_context_acquire(aio_context);
>>       job_lock();
>>       job_ref_locked(&job->job);
>>       do {
> 
> aio_poll() call here, doesn't require aio_context to be acquired?

On the contrary I think, if you see in AIO_WAIT_WHILE we explicitly
release it because we don't want to allow something else to run with the
aiocontext acquired.

> 
>> @@ -936,7 +935,6 @@ static void run_block_job(BlockJob *job, Error
>> **errp)
>>       }
>>       job_unref_locked(&job->job);
>>       job_unlock();
>> -    aio_context_release(aio_context);
>>         /* publish completion progress only when success */
>>       if (!ret) {
> 
> [..]
> 
> In replication_stop, we call job_cancel_sync() inside
> aio_context_acquire - aio_context_release section. Should it be fixed?

I don't think it breaks anything. The question is: what is the
aiocontext there protecting? Do we need it? I have no idea.
> 
> Another question, sometimes you move job_start out of
> aio-context-acquire critical section, sometimes not. As I understand,
> it's of for job_start to be called both with acquired aio-context or not
> acquired?
> 
Same as above, job_start does not need the aiocontext to be taken
(otherwise job_lock would be useless).

> 
> Otherwise looks good to me!
> 

Thank you,
Emanuele


