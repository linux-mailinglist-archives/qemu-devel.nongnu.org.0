Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F67732ECCD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:12:30 +0100 (CET)
Received: from localhost ([::1]:35912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBBr-0001Pu-29
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIBAK-0000fA-6T
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:10:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIBAH-0006Qf-JD
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614953447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gN6kRWpWFeCO839BhMiJD/f7e3/puIHQ60QYHdHx2U8=;
 b=VwzNUP/vMo6tgY8rrfBZit0JTQtGrjjjnJnrkBc92dNCi0AM37i2LUNS/uB/Bm0In7t8A/
 pkHq2/GGEEFm/rNa0sqrskmSvx90m9PYH6tlA6O5wOCYqKuw/FVYLoBA58Mrr/o7hSL5Xs
 xE4JVabtbqgLehdbU/ko5y4oIjGxP4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-dS61KvkYPMKHuJoLD8BPdQ-1; Fri, 05 Mar 2021 09:10:45 -0500
X-MC-Unique: dS61KvkYPMKHuJoLD8BPdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E9841019624;
 Fri,  5 Mar 2021 14:10:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DBAA19CAD;
 Fri,  5 Mar 2021 14:10:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7748E1132C12; Fri,  5 Mar 2021 15:10:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [Qemu-devel] [PATCH] monitor: increase amount of data for
 monitor to read
References: <20190610105906.28524-1-dplotnikov@virtuozzo.com>
 <87lfxfy67u.fsf@dusky.pond.sub.org> <20190710163610.GG2682@work-vm>
 <31dd78ba-bd64-2ed6-3c8f-eed4e904d14c@virtuozzo.com>
 <02668cd8-7c1c-6bae-edcb-1123ae026983@virtuozzo.com>
Date: Fri, 05 Mar 2021 15:10:41 +0100
In-Reply-To: <02668cd8-7c1c-6bae-edcb-1123ae026983@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 2 Mar 2021 20:06:04 +0300")
Message-ID: <87ft19zo66.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: den@virtuozzo.com, Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 24.11.2020 18:44, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>> 
>> This patch isn't outdated, it applies on master with a little conflict atomic_mb_read -> qatomic_mb_read
>> 
>> We have new series "[PATCH v2 0/2] Increase amount of data for monitor to read", but I do think that we've started from wrong point. And actually we should start from this old patch.
>> 
>> 10.07.2019 19:36, Dr. David Alan Gilbert wrote:
>>> * Markus Armbruster (armbru@redhat.com) wrote:
>>>> Did this fall through the cracks?
>>>>
>>>> Denis Plotnikov <dplotnikov@virtuozzo.com> writes:
>>>>
>>>>> Right now QMP and HMP monitors read 1 byte at a time from the socket, which
>>>>> is very inefficient. With 100+ VMs on the host this easily reasults in
>>>>> a lot of unnecessary system calls and CPU usage in the system.
>>>>
>>>> Yes, reading one byte at a time is awful.  But QMP is control plane; I
>>>> didn't expect it to impact system performance.  How are you using QMP?
>>>> Just curious, not actually opposed to improving QMP efficiency.
>>>>
>>>>> This patch changes the amount of data to read to 4096 bytes, which matches
>>>>> buffer size on the channel level. Fortunately, monitor protocol is
>>>>> synchronous right now thus we should not face side effects in reality.
>>>>>
>>>>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>>>>> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
>>>>> ---
>>>>>   include/monitor/monitor.h | 2 +-
>>>>>   monitor.c                 | 2 +-
>>>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
>>>>> index c1b40a9cac..afa1ed34a4 100644
>>>>> --- a/include/monitor/monitor.h
>>>>> +++ b/include/monitor/monitor.h
>>>>> @@ -14,7 +14,7 @@ extern __thread Monitor *cur_mon;
>>>>>   #define MONITOR_USE_CONTROL   0x04
>>>>>   #define MONITOR_USE_PRETTY    0x08
>>>>> -#define QMP_REQ_QUEUE_LEN_MAX 8
>>>>> +#define QMP_REQ_QUEUE_LEN_MAX 4096
>>>>
>>>> This looks suspicious.  It's a request count, not a byte count.  Can you
>>>> explain what led you to change it this way?
>> 
>> I can explain, because that was my idea:
>> 
>> It's a hack to not overflow the queue. With just the second hunk we overflow it and assertion fails.

I can't see offhand how that happens.  Got a reproducer for me?

>> So, I decided that if we allow to read up to 4096, we will not add more than 4096 commands simultaneously. And that works..

Uff!

>> Still, now I don't think it's enough: who guarantee that we will not read new commands when queue is half-full?
>> 
>> I think, that we just need two limits: QUEUE_SOFT_LEN an QUEUE_HARD_LEN (suggest better names). So, when QUEUE_SOFT_LEN is reached we do suspend the monitor (like when queue is full currently). And in monitor_can_read() we allow to read (QUEUE_HARD_LEN - QUEUE_SOFT_LEN). In this way queue will never overflow the QUEUE_HARD_LEN.

I'm not sure I understand.  Maybe I will once I understand the queue
overflow.  Or revised patches.

>> 
>> Also, what is the minimum character length of the command? I just decided that better safe than sorry, considering one character as possible full command. What is the smallest command which parser will parse? Is it {} ? Or may be {"execute":""} ? We can use this knowledge, to understand how many commands we should be prepared to accept, when we allow N characters in monitor_can_read(). So, 4096 is probably too much for QMP_REQ_QUEUE_LEN_MAX.

I'm supicious of solutions that tie the request queue length to the read
buffer size.  Maybe my suspicions will dissipate once I understand the
queue overflow.

Now let me answer your question.

The queue is fed by handle_qmp_command().

It gets called by the JSON parser for each complete JSON value and for
each parse error.

When the JSON value is a JSON object with an 'exec-oob' key and no
'execute' key, handle_qmp_command() bypasses the queue.

Anything else goes into the queue.

The shortest JSON values are 0, 1, ..., 9.  A sequence of them needs to
be separated by whitespace.  N characters of input can therefore produce
up to ceil(N/2) JSON values.

Input that makes the parser report one error per input character exists:
"}}}}}" produces one parse error for each '}'.  I believe every parse
error should consume at least one input character, but we'd have to
double-check before we rely on it.

>> 
>>>>
>>>>>   bool monitor_cur_is_qmp(void);
>>>>> diff --git a/monitor.c b/monitor.c
>>>>> index 4807bbe811..a08e020b61 100644
>>>>> --- a/monitor.c
>>>>> +++ b/monitor.c
>>>>> @@ -4097,7 +4097,7 @@ static int monitor_can_read(void *opaque)
>>>>>   {
>>>>>       Monitor *mon = opaque;
>>>>> -    return !atomic_mb_read(&mon->suspend_cnt);
>>>>> +    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>>>>>   }
>>>>>   /*
>>>>
>>>> The ramifications are not obvious to me.  I think I need to (re-)examine
>>>> how QMP reads input, with special consideration to its OOB feature.
>>>
>>> Yeh that was the bit that worried me; I also wondered what happens with
>>> monitor_suspend and things like fd passing; enough to make it
>>> non-obvious to me.
>>>
>> 
>> OK, I don't have answers..
>> 
>> Markus, David, could you please help? Or, what to do? We of course don't have enough expertise to prove that patch will not break any feature in the whole monitor subsystem.
>> 
>> I can say that it just works, and we live with it for years (and our customers too), and tests pass. Still, I don't think that we use OOB feature. I remember some problems with it, when RHEL version which we were based on included some OOB feature patches, but not some appropriate fixes.. But it was long ago.
>> 
>> If nobody can say that patch is wrong, maybe, we can just apply it? We'll have the whole release cycle to catch any bugs and revert the commit at any time. In this way we only have a question about QMP_REQ_QUEUE_LEN_MAX, which is quite simple.
>> 
>
>
> ping here, as a replacement for "[PATCH v3 0/5] Increase amount of data for monitor to read"
>
> If no better idea, I'll make what I propose above (with two limits) at some good moment :)

Digest what I wrote above, then tell me how you'd like to proceed.


