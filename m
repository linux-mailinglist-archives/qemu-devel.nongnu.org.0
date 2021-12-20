Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A7E47B1AE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:55:57 +0100 (CET)
Received: from localhost ([::1]:49812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLx6-0003rP-3B
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:55:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mzKiO-0003Qz-Kd
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:36:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mzKiL-0006OM-Q8
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640014596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1SILxtgX+HiL6og1gyjd7sx/4qrXaqBVzGZASruGNU=;
 b=AxzbxGpcDdeulPL5f1iCZV6UffXWgFpH17Avd2F7V6WmjyE0BjFhM7WYaSl5BarFbSd22S
 5Wb7ZM67b/fcZRlCzl1O819HsFLLOvu8QGVRPsDJSo7HtzPnXx74JeIhTDPcMl/iFumeYz
 9JRpZZna1YejnI21YiuKkjiU/RwECqc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-feUNE-xEOKKt8ZUSCUmaQw-1; Mon, 20 Dec 2021 05:15:49 -0500
X-MC-Unique: feUNE-xEOKKt8ZUSCUmaQw-1
Received: by mail-ed1-f69.google.com with SMTP id
 i5-20020a05640242c500b003f84839a8c3so2529481edc.6
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 02:15:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K1SILxtgX+HiL6og1gyjd7sx/4qrXaqBVzGZASruGNU=;
 b=YbA7zVeOhWuHazTwh/UPLmzcnFz1SvQEIw80x367Ra+m6lJktpL/6FV1cs/dzDl0rl
 m5XT4yyi3A+7sO0UmxFHv7pozP3FwhDx+xHwPkeNIoq06v9vxUujcB1CDhyItFanVVyL
 +OC+GLBzftZpBqdD1qMwqD9S0wXRoW5orbD6Kzd4Y4weTy+emyWYT8K+MrGYBfCdcuMC
 zb6ijTpeRPnEJBoj61ovVMDEPceAmvHnu8C2mVbKS4HglD/g9ePzk04AIQNCgrhN5nY2
 ngmSBH+XwhK28qYWEv0jV7Zq831ZlyHDEdXh884bEICvECaRkXiCnZQJ5lER0NJuEs2S
 tSjA==
X-Gm-Message-State: AOAM530bjfjpn91evPWxs1an6cwoeUEOIWqp8S1HgnC4zTSkv69+4FXr
 j25qELAcM/xzD852xCExPBQaIHUa4OVfwMWHFDCf28rAPlxiyuNuvK/7EMq4cEn734eqN2Zq+61
 4N0HM3K0Tsvupztk=
X-Received: by 2002:a17:907:98d2:: with SMTP id
 kd18mr12234148ejc.252.1639995348624; 
 Mon, 20 Dec 2021 02:15:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtCGcCHUJZNOXSl+2vOfFrdR3OZOCcSBqfgoiprtym3qxsnsgdliKSo2YisZ+vVo3fiEg6XA==
X-Received: by 2002:a17:907:98d2:: with SMTP id
 kd18mr12234061ejc.252.1639995347127; 
 Mon, 20 Dec 2021 02:15:47 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id u14sm5846025edv.92.2021.12.20.02.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 02:15:46 -0800 (PST)
Message-ID: <6d87edaf-c937-2240-e5b5-c95444e07ad3@redhat.com>
Date: Mon, 20 Dec 2021 11:15:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 03/14] job.h: define locked functions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-4-eesposit@redhat.com>
 <Ybtt591Fe+PgDCFm@stefanha-x1.localdomain>
 <d218179d-26fc-04c3-1009-747106faf116@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <d218179d-26fc-04c3-1009-747106faf116@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 16/12/2021 18:11, Vladimir Sementsov-Ogievskiy wrote:
> 16.12.2021 19:48, Stefan Hajnoczi wrote:
>> On Thu, Nov 04, 2021 at 10:53:23AM -0400, Emanuele Giuseppe Esposito 
>> wrote:
>>>   /** Returns whether the job is ready to be completed. */
>>>   bool job_is_ready(Job *job);
>>> +/** Same as job_is_ready(), but assumes job_lock is held. */
>>> +bool job_is_ready_locked(Job *job);
>>
>> What I see here is that some functions assume job_lock is held but don't
>> have _locked in their name (job_ref()), some assume job_lock is held and
>> have _locked in their name (job_is_ready_locked()), and some assume
>> job_lock is not held (job_is_ready()).
>>
>> That means when _locked is not in the name I don't know whether this
>> function requires job_lock or will deadlock if called under job_lock.
>>
>> Two ways to it obvious:
>>
>> 1. Always have _locked in the name if the function requires job_lock.
>>     Functions without _locked must not be called under job_lock.
>>
>> 2. Don't change the name but use the type system instead:
>>
>>     /*
>>      * Define a unique type so the compiler warns us. It's just a pointer
>>      * so it can be efficiently passed by value.
>>      */
>>     typedef struct { Job *job; } LockedJob;
>>
>>     LockedJob job_lock(Job *job);
>>     Job *job_unlock(LockedJob job);
>>
>>     Now the compiler catches mistakes:
>>
>>     bool job_is_completed(LockedJob job);
>>     bool job_is_ready(Job *job);
>>
>>     Job *j;
>>     LockedJob l;
>>     job_is_completed(j) -> compiler error
>>     job_is_completed(l) -> ok
>>     job_is_ready(j) -> ok
>>     job_is_ready(l) -> compiler error
>>
>>     This approach assumes per-Job locks but a similar API is possible
>>     with a global job_mutex too. There just needs to be a function to
>>     turn Job * into LockedJob and LockedJob back into Job*.
>>
>>     This is slightly exotic. It's not an approach I've seen used in C, so
>>     it's not idiomatic and people might find it unfamiliar.
> 
> Oh yes. If we need something, I'd prefer function renaming.

Ok, I will go with option 1.

> 
>>
>> These are just ideas. If you want to keep it the way it is, that's okay
>> too (although a little confusing).
>>
>>> diff --git a/job.c b/job.c
>>> index 0e4dacf028..e393c1222f 100644
>>> --- a/job.c
>>> +++ b/job.c
>>> @@ -242,7 +242,8 @@ bool job_cancel_requested(Job *job)
>>>       return job->cancelled;
>>>   }
>>> -bool job_is_ready(Job *job)
>>> +/* Called with job_mutex held. */
>>
>> This information should go with the doc comments (and it's already there
>> in job.h!). There is no rule on where to put doc comments but in this
>> case you already added them to job.h, so they are not needed here in
>> job.c. Leaving them could confuse other people into adding doc comments
>> into job.c instead of job.h.
>>

Yes, in general I will leave the comment for static functions in job.c 
and make sure the public ones are only documented in job.h.

Thank you,
Emanuele


