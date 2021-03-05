Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2096A32EFD0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:15:41 +0100 (CET)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lID75-000456-LO
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lID4u-0002w1-NJ
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:13:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lID4s-0003j9-1x
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614960799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mO4m0H6T65SLUVthyjpWSTKtkO1Ba8Y537tRJkamON4=;
 b=UFvH8u5yV2Wo3x8v4Nj8EY00qA7tUhJp/pBt5nWrIJm/Uo5yI0Aehkmfa0fSmGJGzuBdKf
 6E1lT7O0WO3QtGrSkaiMW1v73OarqZZu43+HhP/K2uPPBDHQcnFbhfEgXqDAbCKxjfrlo+
 u1RPlKpPfRw2fCb4yO3nj73iHes9wQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-QFNfVWhfN5qfBAndy7DAkQ-1; Fri, 05 Mar 2021 11:13:17 -0500
X-MC-Unique: QFNfVWhfN5qfBAndy7DAkQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91DAE108BD07;
 Fri,  5 Mar 2021 16:13:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFF5B10023B2;
 Fri,  5 Mar 2021 16:13:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 368701132C12; Fri,  5 Mar 2021 17:13:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [Qemu-devel] [PATCH] monitor: increase amount of data for
 monitor to read
References: <20190610105906.28524-1-dplotnikov@virtuozzo.com>
 <87lfxfy67u.fsf@dusky.pond.sub.org> <20190710163610.GG2682@work-vm>
 <31dd78ba-bd64-2ed6-3c8f-eed4e904d14c@virtuozzo.com>
 <02668cd8-7c1c-6bae-edcb-1123ae026983@virtuozzo.com>
 <87ft19zo66.fsf@dusky.pond.sub.org>
 <405eb948-cab6-869a-80eb-cca4c99f110d@virtuozzo.com>
Date: Fri, 05 Mar 2021 17:13:14 +0100
In-Reply-To: <405eb948-cab6-869a-80eb-cca4c99f110d@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 5 Mar 2021 17:47:57 +0300")
Message-ID: <87im65vasl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> 05.03.2021 17:10, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>> 
>>> 24.11.2020 18:44, Vladimir Sementsov-Ogievskiy wrote:
>>>> Hi all!
>>>>
>>>> This patch isn't outdated, it applies on master with a little conflict atomic_mb_read -> qatomic_mb_read
>>>>
>>>> We have new series "[PATCH v2 0/2] Increase amount of data for monitor to read", but I do think that we've started from wrong point. And actually we should start from this old patch.
>>>>
>>>> 10.07.2019 19:36, Dr. David Alan Gilbert wrote:
>>>>> * Markus Armbruster (armbru@redhat.com) wrote:
>>>>>> Did this fall through the cracks?
>>>>>>
>>>>>> Denis Plotnikov <dplotnikov@virtuozzo.com> writes:
>>>>>>
>>>>>>> Right now QMP and HMP monitors read 1 byte at a time from the socket, which
>>>>>>> is very inefficient. With 100+ VMs on the host this easily reasults in
>>>>>>> a lot of unnecessary system calls and CPU usage in the system.
>>>>>>
>>>>>> Yes, reading one byte at a time is awful.  But QMP is control plane; I
>>>>>> didn't expect it to impact system performance.  How are you using QMP?
>>>>>> Just curious, not actually opposed to improving QMP efficiency.
>>>>>>
>>>>>>> This patch changes the amount of data to read to 4096 bytes, which matches
>>>>>>> buffer size on the channel level. Fortunately, monitor protocol is
>>>>>>> synchronous right now thus we should not face side effects in reality.
>>>>>>>
>>>>>>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>>>>>>> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
>>>>>>> ---
>>>>>>>    include/monitor/monitor.h | 2 +-
>>>>>>>    monitor.c                 | 2 +-
>>>>>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
>>>>>>> index c1b40a9cac..afa1ed34a4 100644
>>>>>>> --- a/include/monitor/monitor.h
>>>>>>> +++ b/include/monitor/monitor.h
>>>>>>> @@ -14,7 +14,7 @@ extern __thread Monitor *cur_mon;
>>>>>>>    #define MONITOR_USE_CONTROL   0x04
>>>>>>>    #define MONITOR_USE_PRETTY    0x08
>>>>>>> -#define QMP_REQ_QUEUE_LEN_MAX 8
>>>>>>> +#define QMP_REQ_QUEUE_LEN_MAX 4096
>>>>>>
>>>>>> This looks suspicious.  It's a request count, not a byte count.  Can you
>>>>>> explain what led you to change it this way?
>>>>
>>>> I can explain, because that was my idea:
>>>>
>>>> It's a hack to not overflow the queue. With just the second hunk we overflow it and assertion fails.
>> 
>> I can't see offhand how that happens.  Got a reproducer for me?
>
> Yes:
>
>
> [root@kvm master]# echo '{'execute': 'qmp_capabilities'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}' | ./build/qemu-system-x86_64 -nodefaults -nographic -S -qmp stdio
> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 2, "major": 5}, "package": "v5.2.0-2359-g0b9242f339-dirty"}, "capabilities": ["oob"]}}
> qemu-system-x86_64: ../monitor/qmp.c:400: handle_qmp_command: Assertion `mon->qmp_requests->length < QMP_REQ_QUEUE_LEN_MAX' failed.
> Aborted (core dumped)
>
>
> [root@kvm master]# git diff
>
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index e94f532cf5..41679241b3 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -562,7 +562,7 @@ int monitor_can_read(void *opaque)
>   {
>       Monitor *mon = opaque;
>   
> -    return !qatomic_mb_read(&mon->suspend_cnt);
> +    return !qatomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>   }
>   
>   void monitor_list_append(Monitor *mon)

Hmmm...

We always parse the everything we read.

We suspend the monitor when the request queue is full, and resume it has
space.

When we read one character at a time, this suffices: when input is ready
while the monitor is not suspended, we read one character, feed it to
the parser, which produces at most one request.  This request surely
fits into the queue, because the queue is non-full (or else the monitor
would be suspended).

When we read a sane buffer, suspending the monitor doesn't suffice.  We
need to suspend parsing, too.  Feels feasible.

[...]
>>>>>>>    bool monitor_cur_is_qmp(void);
>>>>>>> diff --git a/monitor.c b/monitor.c
>>>>>>> index 4807bbe811..a08e020b61 100644
>>>>>>> --- a/monitor.c
>>>>>>> +++ b/monitor.c
>>>>>>> @@ -4097,7 +4097,7 @@ static int monitor_can_read(void *opaque)
>>>>>>>    {
>>>>>>>        Monitor *mon = opaque;
>>>>>>> -    return !atomic_mb_read(&mon->suspend_cnt);
>>>>>>> +    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>>>>>>>    }
>>>>>>>    /*
>>>>>>
>>>>>> The ramifications are not obvious to me.  I think I need to (re-)examine
>>>>>> how QMP reads input, with special consideration to its OOB feature.
>>>>>
>>>>> Yeh that was the bit that worried me; I also wondered what happens with
>>>>> monitor_suspend and things like fd passing; enough to make it
>>>>> non-obvious to me.
>>>>>
>>>>
>>>> OK, I don't have answers..
>>>>
>>>> Markus, David, could you please help? Or, what to do? We of course don't have enough expertise to prove that patch will not break any feature in the whole monitor subsystem.
>>>>
>>>> I can say that it just works, and we live with it for years (and our customers too), and tests pass. Still, I don't think that we use OOB feature. I remember some problems with it, when RHEL version which we were based on included some OOB feature patches, but not some appropriate fixes.. But it was long ago.
>>>>
>>>> If nobody can say that patch is wrong, maybe, we can just apply it? We'll have the whole release cycle to catch any bugs and revert the commit at any time. In this way we only have a question about QMP_REQ_QUEUE_LEN_MAX, which is quite simple.
>>>>
>>>
>>>
>>> ping here, as a replacement for "[PATCH v3 0/5] Increase amount of data for monitor to read"
>>>
>>> If no better idea, I'll make what I propose above (with two limits) at some good moment :)
>> 
>> Digest what I wrote above, then tell me how you'd like to proceed.
>> 
>
> Ohh. Honestly, now I don't have time to dig into monitor code and prove that everything is good. It's OK for me to postpone it for some future time.

I don't require *proof*.  I do need a bit more help than "this patch
works for us".

Weak correctness arguments can sometimes be offset by good tests.

One obvious testing gap is receiving many commands in a single batch.
The existing tests don't cover that, because they send one command after
the other.  Evicence: the crash discussed above.

How much effort you can contribute is of course entirely up to you.


