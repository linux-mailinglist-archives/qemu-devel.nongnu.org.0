Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC1D3AE482
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:02:10 +0200 (CEST)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvEsj-0003a1-5y
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvEqY-0002DL-9w
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 03:59:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvEqV-0002QR-Hi
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 03:59:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624262388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MdESCzH/k1SMYfo4njeQZeiBRWhgYauPe7y5wmLhwnI=;
 b=SoNNnuhnT829GjJPF7jTQ1DfgFI6LqXziG+3qtK+pURUf4h6VOqwkTqYabpPfTp3r7l59j
 ThCf8R8N791jIiYkZkSfSlzH2RvJKkqhAcOyAwkKxOiPPUFlkc+Ne141r5W186KjoQTcWY
 Qvzt7oeeIW56ghSOcbq4xRj8BMvgrwc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-tfsd_cWsO_SfNwkeZHr6bQ-1; Mon, 21 Jun 2021 03:59:45 -0400
X-MC-Unique: tfsd_cWsO_SfNwkeZHr6bQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so8057233wrs.3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 00:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MdESCzH/k1SMYfo4njeQZeiBRWhgYauPe7y5wmLhwnI=;
 b=R0iElKEhCUSCbQSuyXmHdCEbgs3y/bZvkg2dLo1p9r/Ea+4CeBTfhaMeFRGJYyggA4
 Xj14Ai1QXJA+8/raW/fvtC5+QJbMXgy2n1p3FJ8VycyYFD9q+fngRHtPzCKWvGifkVcA
 W3/9XXzIOq6C64noZeTZpb+KNPNpYGO6a/Sw5A9gY/7S85vHGVWfT+rjjonBwzyV5kN1
 Es1V4ysPJ8HsSbY+e7G7KSoTl6JHNATH1nQJGn55x2WWSWO0eEWQ0cDf9q41+J9yxgAy
 ZdgyMGTvyGyGjXELrvVKTSsP3NuaapH0LTkQh9sel7GhRNNivA21x8FgkgOgMu4GSMRP
 iNug==
X-Gm-Message-State: AOAM531+r5KQpByPXZxzZMt6WpBE6ePapUkksU9nv7SwwhvWwPsvv5wT
 hkVwzUkuJR9RHDqB7HWotfyOHJcKMOH87aD9lDR06VMSm8p5/BDzwB7BQASeXN6WCtCmPDa8Pwk
 yVqpiEv5h+6Rb+vxcCPk9bEIc48PTeX3FO54GPa8zo74P5HDTEdGmTsXdcj7bdbIDBd8=
X-Received: by 2002:adf:ea86:: with SMTP id s6mr26843083wrm.75.1624262383912; 
 Mon, 21 Jun 2021 00:59:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyObFYS1d2ya9II7lgWsj1etwmdlGK07MG8oie4qHXUvhVHIXx9xhVNL1HEY2AEYeYZXlJE9Q==
X-Received: by 2002:adf:ea86:: with SMTP id s6mr26843055wrm.75.1624262383662; 
 Mon, 21 Jun 2021 00:59:43 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 v18sm17673183wrb.10.2021.06.21.00.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 00:59:43 -0700 (PDT)
Subject: Re: [PATCH v4 3/6] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-4-eesposit@redhat.com>
 <3ac5e749-2a8b-e2d2-f1a2-04452b4277a0@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <6e031269-3ecb-f2f2-9833-eef4073cf5e0@redhat.com>
Date: Mon, 21 Jun 2021 09:59:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3ac5e749-2a8b-e2d2-f1a2-04452b4277a0@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19/06/2021 17:23, Vladimir Sementsov-Ogievskiy wrote:
> 14.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
>> As done in BlockCopyCallState, categorize BlockCopyTask
>> and BlockCopyState in IN, State and OUT fields.
>> This is just to understand which field has to be protected with a lock.
>>
>> .sleep_state is handled in the series "coroutine: new sleep/wake API"
>> and thus here left as TODO.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/block-copy.c | 49 +++++++++++++++++++++++++++++-----------------
>>   1 file changed, 31 insertions(+), 18 deletions(-)
>>
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index 3f26be8ddc..5ff7764e87 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>> @@ -52,29 +52,35 @@ typedef struct BlockCopyCallState {
>>       /* Coroutine where async block-copy is running */
>>       Coroutine *co;
>> -    /* To reference all call states from BlockCopyState */
>> -    QLIST_ENTRY(BlockCopyCallState) list;
>> -
>>       /* State */
>> -    int ret;
>>       bool finished;
>> -    QemuCoSleep sleep;
>> -    bool cancelled;
>> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
>> +
>> +    /* To reference all call states from BlockCopyState */
>> +    QLIST_ENTRY(BlockCopyCallState) list;
>>       /* OUT parameters */
>> +    bool cancelled;
>>       bool error_is_read;
>> +    int ret;
>>   } BlockCopyCallState;
>>   typedef struct BlockCopyTask {
>>       AioTask task;
>> +    /*
>> +     * IN parameters. Initialized in block_copy_task_create()
>> +     * and never changed.
>> +     */
> 
> That's just not true for method field :(

You're right, because it is modified later in the while loop of 
block_copy_dirty_clusters, but the task is already in the list.
Will move it to state field.

> 
>>       BlockCopyState *s;
>>       BlockCopyCallState *call_state;
>>       int64_t offset;
>> -    int64_t bytes;
>>       BlockCopyMethod method;
>> -    QLIST_ENTRY(BlockCopyTask) list;
>> +
>> +    /* State */
>>       CoQueue wait_queue; /* coroutines blocked on this task */
>> +    int64_t bytes;
>> +    QLIST_ENTRY(BlockCopyTask) list;
>>   } BlockCopyTask;
>>   static int64_t task_end(BlockCopyTask *task)
>> @@ -90,15 +96,25 @@ typedef struct BlockCopyState {
>>        */
>>       BdrvChild *source;
>>       BdrvChild *target;
>> -    BdrvDirtyBitmap *copy_bitmap;
>> +
>> +    /* State */
>>       int64_t in_flight_bytes;
>> -    int64_t cluster_size;
>>       BlockCopyMethod method;
>> -    int64_t max_transfer;
>> -    uint64_t len;
>>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all 
>> block-copy calls */
>>       QLIST_HEAD(, BlockCopyCallState) calls;
>> +    /* State fields that use a thread-safe API */
>> +    BdrvDirtyBitmap *copy_bitmap;
>> +    ProgressMeter *progress;
>> +    SharedResource *mem;
>> +    RateLimit rate_limit;
>> +    /*
>> +     * IN parameters. Initialized in block_copy_state_new()
>> +     * and never changed.
>> +     */
>> +    int64_t cluster_size;
>> +    int64_t max_transfer;
>> +    uint64_t len;
>>       BdrvRequestFlags write_flags;
>>       /*
>> @@ -114,14 +130,11 @@ typedef struct BlockCopyState {
>>        * In this case, block_copy() will query the source’s allocation 
>> status,
>>        * skip unallocated regions, clear them in the copy_bitmap, and 
>> invoke
>>        * block_copy_reset_unallocated() every time it does.
>> +     *
>> +     * This field is set in backup_run() before coroutines are run,
>> +     * therefore is an IN.
> 
> That's not true: it is modified from backup_run, when block-copy already 
> initialized, and block_copy() calls may be done from backup-top filter.
> 

Ok, I am not very familiar with the backup code, so I did not see it.
This means we need to protect this field too.

At this point, I think we can increase the granularity of the lock in 
block_copy_dirty_clusters:
instead of having in each while loop

block_copy_task_create(); // locks and releases internally
block_copy_block_status(); // no lock used, but uses skip_unallocated so 
it will need one
if()
	block_copy_task_shrink(); // locks and releases internally
if(s->skip_unallocated) // will need lock
	block_copy_task_end(); // locks and releases internally
	[..]
if()
	task->method = COPY_WRITE_ZEROS; // needs lock
[..]

we can just lock the while section and eventually create _locked() 
version of task_end and similar functions that are also used in 
non-locked code blocks.


Emanuele

>>        */
>>       bool skip_unallocated;
>> -
>> -    ProgressMeter *progress;
>> -
>> -    SharedResource *mem;
>> -
>> -    RateLimit rate_limit;
>>   } BlockCopyState;
>>   static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
>>
> 
> 


