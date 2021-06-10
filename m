Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EA23A2988
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:41:29 +0200 (CEST)
Received: from localhost ([::1]:51778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrI7s-00079x-Ah
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lrHhm-0003BE-V8
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:14:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lrHhk-00007Y-H0
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623320067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxqdwj2iTqkvLqXKtHCjmI3At1dLJKIXho1NB2oTrko=;
 b=e+Y06zFHcxmIV0TAKYm9xaki7Xfe94Pr6bRPoLt5hZV+jdV/qmUBqa7N7XQi55UI3QOiZc
 MLOa2blhEIPvZUfMOXhb9izKnhyh4AeFduTziqy7XuoORexeoUrgX2VMH5i8zA3s1+8yfk
 Jo74uvrgw7lQrOe1RmBLAOg+mY4/3wg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-RwJLrITeOTCcQh8oeTog0Q-1; Thu, 10 Jun 2021 06:14:27 -0400
X-MC-Unique: RwJLrITeOTCcQh8oeTog0Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 n2-20020adfb7420000b029010e47b59f31so657609wre.9
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 03:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pxqdwj2iTqkvLqXKtHCjmI3At1dLJKIXho1NB2oTrko=;
 b=qshQ8zv2mTk9q8vYM9U6Lx4iPTGAYyR4pEFrCAMtc1SofEnT6Tpn1gm9+/gje9Rpou
 BXmAcDcyCXDg0JngJtalpd7bKGquMqPWOYTe8phkVkVQNTDWBdS4Gaq9FWc4qM+V/zTg
 iwZ7QocG6i+6kDiulq8SREbC+43gTU8hOhVt6xNXE/Y60YEUxCz6CcsnJpy/pLhsGYh6
 wK7pAyKpTi1u41NKnPdbuNQgbxEP9sPybm6717Z3pvDhNCDxUDd1hszZRvVglRWzuytr
 17uS8ReA6YHMRWLnm/1a9e4n7e/3DO3ojy5fD0p9t7t2CnDokDDRKCla4p1ynT+juMkw
 /jNw==
X-Gm-Message-State: AOAM530hfK2kw3+OJYIhDqNUgwLu9f9E77kWoIbW3DG6vbYwEvQlF+08
 +W5wNly4YL4pHNo0MElpAkKS+55CPIhRKFvtRvZn5tzU9EOzc20OoPCFB7TyQKnzarYROJYCN5b
 q9UCTT5yCqTkzcBayZy7346+s1Y4umgG45bwH5RDFkgnUSbfbFlSiaB98xLha9Ulq00k=
X-Received: by 2002:a1c:23d6:: with SMTP id j205mr14651709wmj.94.1623320065228; 
 Thu, 10 Jun 2021 03:14:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhmU3gL7aNSAttiPHZJpbBqa3L58mA+HUPFqSvdIH4rc6BpjkmUgBPNBImcrxXhZuNjMW5Yg==
X-Received: by 2002:a1c:23d6:: with SMTP id j205mr14651680wmj.94.1623320064854; 
 Thu, 10 Jun 2021 03:14:24 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 g10sm2941992wrq.12.2021.06.10.03.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 03:14:24 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210608073344.53637-1-eesposit@redhat.com>
 <20210608073344.53637-3-eesposit@redhat.com>
 <b466cc82-3905-acba-a2f8-e0b3cbbe2af1@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <ff0e4ff0-681c-2827-31cd-efc6b01360ef@redhat.com>
Date: Thu, 10 Jun 2021 12:14:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b466cc82-3905-acba-a2f8-e0b3cbbe2af1@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 09/06/2021 11:12, Vladimir Sementsov-Ogievskiy wrote:
> 08.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
>> As done in BlockCopyCallState, categorize BlockCopyTask
>> and BlockCopyState in IN, State and OUT fields.
>> This is just to understand which field has to be protected with a lock.
>>
>> .sleep_state is handled in the series "coroutine: new sleep/wake API"
>> and thus here left as TODO.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/block-copy.c | 47 ++++++++++++++++++++++++++++++----------------
>>   1 file changed, 31 insertions(+), 16 deletions(-)
>>
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index d58051288b..b3533a3003 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>> @@ -56,25 +56,33 @@ typedef struct BlockCopyCallState {
>>       QLIST_ENTRY(BlockCopyCallState) list;
>>       /* State */
> 
> Why previous @list field is not in the state? For sure it's not an IN 
> parameter and should be protected somehow.
> 
>> -    int ret;
>>       bool finished;
>> -    QemuCoSleep sleep;
>> -    bool cancelled;
>> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
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
>>       BlockCopyState *s;
>>       BlockCopyCallState *call_state;
>>       int64_t offset;
>> -    int64_t bytes;
>> -    BlockCopyMethod method;
>> -    QLIST_ENTRY(BlockCopyTask) list;
>> +    int64_t bytes; /* only re-set in task_shrink, before running the 
>> task */
>> +    BlockCopyMethod method; /* initialized in 
>> block_copy_dirty_clusters() */
> 
> hmm. to be precise method is initialized in block_copy_task_create.
> 
> And after block_copy_task_create finished, task is in the list and can 
> be read by parallel block_copy_dirty_clusters(). So, @bytes is part of 
> State, we must protect it..

So if I understand correctly, you refer to the fact that a parallel 
block_copy_dirty_clusters() can create another task and search with 
find_conflicting_task_locked(), or in general also block_copy_wait_one() 
can do the same in parallel, correct?

Here there is also another problem: if we add the task to the list and 
then shrink it in two different critical sections, we are going to have 
problems because in the meanwhile find_conflicting_tasks can be issued 
in parallel.

So, is there a reason why we don't want
QLIST_INSERT_HEAD(&s->tasks, task, list);
in block_copy_dirty_clusters()?

By doing that, I think we also spare @bytes from the critical section, 
since it is only read from that point onwards.

I am also trying to see if I can group some critical sections.

Btw I think we already talked about @bytes and it's not the first time 
we switch it from IN to STATE and vice-versa...
I mean, I agree with you but it starts to be confusing.


This also goes against your comment later in patch 4,
>> @@ -212,7 +222,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>>       bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
>>         /* region is dirty, so no existent tasks possible in it */
>> -    assert(!find_conflicting_task(s, offset, bytes));
>> +    assert(!find_conflicting_task_locked(s, offset, bytes));
>>         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
>>       s->in_flight_bytes += bytes;
>> @@ -248,16 +258,19 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
>>   
> 
> The function reads task->bytes not under mutex.. It's safe, as only that function is modifying the field, and it's called once. Still, let's make critical section a little bit wider, just for simplicity. I mean, simple QEMU_LOCK_GUARD() at start of function. 

Where if I understand correctly, it is not safe, because 
find_conflicting_tasks might search the non-updated task.

Thank you,
Emanuele


