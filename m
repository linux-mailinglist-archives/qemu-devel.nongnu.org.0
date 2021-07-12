Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2193D3C4619
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 10:44:59 +0200 (CEST)
Received: from localhost ([::1]:37714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2rYg-0005K0-4n
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 04:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m2rWz-0003W6-GI
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m2rWx-0000gq-Sy
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626079391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=guLQN9zniTTATcpVODCOFo7xtukYYl4QQRN+8HefTqs=;
 b=L6Jh5IMavGE5BnbqWy9jqiOfS+ayPeTtHx6BW+gfjVpQpDxv6pseG//28nqLf4LekYEzl9
 0OLhMkMI0929nv4t7M3iTR6pYjJIFZ/LRtWtjBzcxEYH6xc7lCWshQ/kYpU+W4BDdO4voX
 WFbFBKScvwDiQUVfAdgX9ot3v07nwwc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-rAq0EKixO3iugC9TAJDvng-1; Mon, 12 Jul 2021 04:43:10 -0400
X-MC-Unique: rAq0EKixO3iugC9TAJDvng-1
Received: by mail-ed1-f71.google.com with SMTP id
 o8-20020aa7dd480000b02903954c05c938so9571082edw.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 01:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=guLQN9zniTTATcpVODCOFo7xtukYYl4QQRN+8HefTqs=;
 b=OQR/NwHujqoe4saSQzkNrcgAGPZDkY3VtDweB52KJAM655U1G9kfMXhVtZaCKPRJg4
 v+zUHuAPVMfX1VrQQetkmOGxXNnYJL/aSM74ItNsoVy5ieuWfSZQnB7uiESBy/NQvTPe
 QXSkuZfGcDdJVAgI21srsfQLct3j2ScRd3O34iKAOpx4g+17YwH5YUEs9Dv8MAYCG7fc
 JOLPBFLMZigtuV1OeqqU0Fk4RLAoSxU2CT//lTAgXBXzEdCykDFWNHPvBoaA/Y94mFv/
 25K79sBl2Jb+xgtBjpjo6VO2QTcYUIjBxmQQrHLh21vruKIMQTkFtmcDhEzo52fDTPJg
 Cvbw==
X-Gm-Message-State: AOAM530IRxJTq1Ru1kx+ah6uPWtXdqEAsuQJp978hN2C1inVmaZopcjQ
 Kzy5Q5QtgJm/hqwzhogFaL14xdbVnQoOwCJnZm/J0ocTf9fJ7MwzyoR8eHdkunY7bvX9rvlAqFn
 /r+dV1BfGN1Oa8TBZQK62orS5Ry6FIHRu5UUvxqqU/Om9n4AwIf0l2fz2DUNo2D5uKss=
X-Received: by 2002:aa7:c801:: with SMTP id a1mr36316992edt.293.1626079388840; 
 Mon, 12 Jul 2021 01:43:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhS7P3O9BEXyYEAGng2fngHdaiVqsISNoeL4VFk69BdEoz4z6hbYzFcwb60cCcYLpduRIeHg==
X-Received: by 2002:aa7:c801:: with SMTP id a1mr36316972edt.293.1626079388625; 
 Mon, 12 Jul 2021 01:43:08 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 j1sm7487521edl.80.2021.07.12.01.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 01:43:08 -0700 (PDT)
Subject: Re: [RFC PATCH 2/6] job: _locked functions and public job_lock/unlock
 for next patch
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <20210707165813.55361-3-eesposit@redhat.com>
 <YObYaIAatXp9g41G@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <1df55204-89ea-6e5b-e698-d985e85702a4@redhat.com>
Date: Mon, 12 Jul 2021 10:43:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YObYaIAatXp9g41G@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.631,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/07/2021 12:50, Stefan Hajnoczi wrote:
> On Wed, Jul 07, 2021 at 06:58:09PM +0200, Emanuele Giuseppe Esposito wrote:
>> diff --git a/job.c b/job.c
>> index 872bbebb01..96fb8e9730 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -32,6 +32,10 @@
>>   #include "trace/trace-root.h"
>>   #include "qapi/qapi-events-job.h"
>>   
>> +/* job_mutex protexts the jobs list, but also the job operations. */
>> +static QemuMutex job_mutex;
> 
> It's unclear what protecting "job operations" means. I would prefer a
> fine-grained per-job lock that protects the job's fields instead of a
> global lock with an unclear scope.

As I wrote in the cover letter, I wanted to try to keep things as simple 
as possible with a global lock. It is possible to try and have a per-job 
lock, but I don't know how complex will that be then.
I will try and see what I can do.

Maybe "job_mutex protexts the jobs list, but also makes the job API 
thread-safe"?

> 
>> +
>> +/* Protected by job_mutex */
>>   static QLIST_HEAD(, Job) jobs = QLIST_HEAD_INITIALIZER(jobs);
>>   
>>   /* Job State Transition Table */
>> @@ -64,27 +68,22 @@ bool JobVerbTable[JOB_VERB__MAX][JOB_STATUS__MAX] = {
>>   /* Transactional group of jobs */
>>   struct JobTxn {
>>   
>> -    /* Is this txn being cancelled? */
>> +    /* Is this txn being cancelled? Atomic.*/
>>       bool aborting;
> 
> The comment says atomic but this field is not accessed using atomic
> operations (at least at this point in the patch series)?

Yes sorry I messed up the hunks in one-two patches. These comments were 
supposed to be on patch 4 "job.h: categorize job fields". Even though 
that might also not be ideal, since that patch just introduces the 
comments, without applying the locking/protection yet.
On the other side, if I merge everything together in patch 5, it will be 
even harder to read.

Emanuele
> 
>>   
>> -    /* List of jobs */
>> +    /* List of jobs. Protected by job_mutex. */
>>       QLIST_HEAD(, Job) jobs;
>>   
>> -    /* Reference count */
>> +    /* Reference count. Atomic. */
>>       int refcnt;
> 
> Same.
> 


