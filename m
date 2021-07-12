Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA9B3C461F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 10:47:43 +0200 (CEST)
Received: from localhost ([::1]:44564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2rbK-0001fI-3Q
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 04:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m2rXF-0004GJ-LX
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:43:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m2rXE-0000sP-5d
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626079407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WAHUrFVzTLMnpKDxNmQRIVXlq9ve+ZmwblCMzKK3YQg=;
 b=d2JXd6r087u254CaxdPqd5J8PfDMDjuE64hm0e/pp5VCKroj5908o2jTm4Z2a8p9bWguUK
 xhlJw53pjeJwwcHIAyt0+BfCxJBuZxqD2cnS6xiZWtfNKveEs4KzB564+VxzH8345M+Il9
 PNOqUGR2EVtRIclEcpNas6YGbGioiD8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-1ioBRJfwNLKppZVv93sbqg-1; Mon, 12 Jul 2021 04:43:26 -0400
X-MC-Unique: 1ioBRJfwNLKppZVv93sbqg-1
Received: by mail-ed1-f69.google.com with SMTP id
 j25-20020aa7ca590000b029039c88110440so9530854edt.15
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 01:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WAHUrFVzTLMnpKDxNmQRIVXlq9ve+ZmwblCMzKK3YQg=;
 b=d9AsH5qxeBGaMGnAW1WQeWui4Api2mv92mdRC072rvsGzmZpXXqORKOWGiwe955ia7
 dYztGudu9+Cn5Q0ywktDe0Z1x2g/yX5vED2SDf/aQSl6Q5tvXUGomqTRboZ7qvOdp69I
 pT8aJBLXy9w/jvAX9XgMEeFMXCJ7FzU60UMsJK5gSwU4TXdlQ+I+dhaDXchTELWdY4fF
 JaRpC9d/YRylallZXeN/vyqeOA+G49ub5EUA3or7BnILJZvt0NcsxNmisMRe17jJGqsy
 X4gcUQp9sHrcMTZf0wU8HelVdZf5o1wBEdcB2cGXYgBJZu7gcxAS89x34uBdHjelSJOO
 4pcg==
X-Gm-Message-State: AOAM530O47WlwR8i9IAvelnU5SIU861t0PnaLbIVOm0+oZpx5UMSAqzy
 KsXKkMW9bshmhVGP9H90DQEuc1wy0PGHB+yyqCrgTmN8pnaUbVZl/boOb+vTfURvdLDqtjmUghG
 JlMubYQa89JHX74ZKU/x4mRUqPdR+//RG0UpQUuRgrL9gWMmqh2TNZqJ99/mWRZXT6oM=
X-Received: by 2002:a05:6402:1d4d:: with SMTP id
 dz13mr10227991edb.67.1626079405391; 
 Mon, 12 Jul 2021 01:43:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKE8UcqIZICxkHo13nsHBMal6EmFKvdkU2WzEUreuUYhgXEoNL5V8wcD6TY9rs/lZ7FYGljw==
X-Received: by 2002:a05:6402:1d4d:: with SMTP id
 dz13mr10227969edb.67.1626079405202; 
 Mon, 12 Jul 2021 01:43:25 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 qo6sm3725799ejb.122.2021.07.12.01.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 01:43:24 -0700 (PDT)
Subject: Re: [RFC PATCH 3/6] job: minor changes to simplify locking
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <20210707165813.55361-4-eesposit@redhat.com>
 <YObZhZoyfatz3etH@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <c7967045-ae8d-7ce0-e089-0e6dc840d1eb@redhat.com>
Date: Mon, 12 Jul 2021 10:43:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YObZhZoyfatz3etH@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.631, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/07/2021 12:55, Stefan Hajnoczi wrote:
> On Wed, Jul 07, 2021 at 06:58:10PM +0200, Emanuele Giuseppe Esposito wrote:
>> @@ -406,15 +410,18 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
>>               error_setg(errp, "Invalid job ID '%s'", job_id);
>>               return NULL;
>>           }
>> -        if (job_get(job_id)) {
>> -            error_setg(errp, "Job ID '%s' already in use", job_id);
>> -            return NULL;
>> -        }
>>       } else if (!(flags & JOB_INTERNAL)) {
>>           error_setg(errp, "An explicit job ID is required");
>>           return NULL;
>>       }
>>   
>> +    job_lock();
>> +    if (job_get(job_id)) {
>> +        error_setg(errp, "Job ID '%s' already in use", job_id);
>> +        job_unlock();
>> +        return NULL;
>> +    }
>> +
> 
> Where is the matching job_unlock() in the success case? Please consider
> lock guard macros like QEMU_LOCK_GUARD()/WITH_QEMU_LOCK_GUARD() to
> prevent common errors.
> 
Again this is a dumb mistake, the job_lock/unlock lines should go on 
patch 5, not here. Apologies.

I did not use QEMU_LOCK_GUARD()/WITH_QEMU_LOCK_GUARD() yet because I 
added some assertions to make sure I also didn't create nested locking 
situations. The final version will certainly use them.

Emanuele


