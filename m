Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A73847C171
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:25:56 +0100 (CET)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzg5T-0003s4-3V
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:25:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mzg3D-0002jC-JX
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 09:23:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mzg3B-0000YD-0s
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 09:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640096611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSKAMYh1vIvzBQHKt2EC0pCnwtnTDdg+y4hOj82V9GE=;
 b=cMhnCqKZiTiKh5c/U2diMfsRM1MSVtpg4tjKY0xRGxaY6nmJPPsESsK00NamwUGXZVZKmD
 7bZZS+tZl2vEgpwXtu47r6WA4E1CR41qdiqzsc0vUptRlHkhq0rrhHKkPTrUC0YRXZKNLf
 WXIcyoK8DhBgajSd4uFk5wtjsIL0BTM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-Hkh77vPHObC0Eg1rRB_RLA-1; Tue, 21 Dec 2021 09:23:30 -0500
X-MC-Unique: Hkh77vPHObC0Eg1rRB_RLA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y14-20020a056402440e00b003f81d896346so9650524eda.2
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 06:23:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hSKAMYh1vIvzBQHKt2EC0pCnwtnTDdg+y4hOj82V9GE=;
 b=GZA6GdLaVMREoeBl6ckmrYmihNpP0gU2eXvH58/h5sinNYyQxoRA7iOUUnH9oODdqp
 WC2ZFceDKSeBrXh39fYk+eXiefabVoh3rQnKYMBFJ+yzogGUuNehi7SXuYYm2RZXhX+6
 c/YZayPKcpDLndL6lovuEfsM0e98BSkCuFYlW1jzJMMqXKO1Nv1ctnDk8eq4LFiLmbKQ
 GkYY/v3we+ZLyExuHfaXOY1T9FUwjhB9LjW7SLJJ70KiniQtsV1fZUx/QOQbC4/Ba+nG
 v+TOy8dUHuYr6fEEtmW6n5Cpoz77JjVhwdDDeW/jLrmhpdzM59mIsoISjFjomjhIW/x/
 fpYQ==
X-Gm-Message-State: AOAM5321fQL3Fi2mSwiPxx17VhBjtwoLk3tL7VzwfWCDTsbhPEreUyjx
 41tA2AY6pLKLECYTBcWV40gimUOHy+ahhDmTVW84kQh7g21iZwGuvDqqa2uv/RkYmWAQ6vHzkNh
 P9nXRPY/eJVHO4eg=
X-Received: by 2002:aa7:dd56:: with SMTP id o22mr3516297edw.73.1640096609548; 
 Tue, 21 Dec 2021 06:23:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJs2Ry8oDvMOgtIAILYo8V7sGoLTFxHnj+mmjPR8K7uqXlRqD/S48S9Ch9YlZQ4D9M613LFQ==
X-Received: by 2002:aa7:dd56:: with SMTP id o22mr3516267edw.73.1640096609219; 
 Tue, 21 Dec 2021 06:23:29 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id b73sm6188014edf.37.2021.12.21.06.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 06:23:28 -0800 (PST)
Message-ID: <3d760568-080c-1aa5-9657-3b454d2b56a2@redhat.com>
Date: Tue, 21 Dec 2021 15:23:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 02/14] job.h: categorize fields in struct Job
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-3-eesposit@redhat.com>
 <YbtnmL/3+NAzP85e@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YbtnmL/3+NAzP85e@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 16/12/2021 17:21, Stefan Hajnoczi wrote:
> On Thu, Nov 04, 2021 at 10:53:22AM -0400, Emanuele Giuseppe Esposito wrote:
>> Categorize the fields in struct Job to understand which ones
>> need to be protected by the job mutex and which don't.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   include/qemu/job.h | 57 +++++++++++++++++++++++++++-------------------
>>   1 file changed, 34 insertions(+), 23 deletions(-)
>>
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index ccf7826426..f7036ac6b3 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -40,27 +40,52 @@ typedef struct JobTxn JobTxn;
>>    * Long-running operation.
>>    */
>>   typedef struct Job {
>> +
>> +    /* Fields set at initialization (job_create), and never modified */
>> +
>>       /** The ID of the job. May be NULL for internal jobs. */
>>       char *id;
>>   
>> -    /** The type of this job. */
>> +    /**
>> +     * The type of this job.
>> +     * All callbacks are called with job_mutex *not* held.
>> +     */
>>       const JobDriver *driver;
>>   
>> -    /** Reference count of the block job */
>> -    int refcnt;
>> -
>> -    /** Current state; See @JobStatus for details. */
>> -    JobStatus status;
>> -
>>       /** AioContext to run the job coroutine in */
>>       AioContext *aio_context;
> 
> "Fields set at initialization (job_create), and never modified" does not
> apply here. blockjob.c:child_job_set_aio_ctx() changes it at runtime.
> 

Right. aio_context can theoretically avoid also the job_mutex, if we 
make sure that all klass->set_aio_ctx() are under BQL (they are) and 
under drains (work in progress). For now I will protect it with job_lock().

Thank you,
Emanuele


