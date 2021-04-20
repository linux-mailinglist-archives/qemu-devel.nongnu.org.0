Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A342A365076
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 04:48:51 +0200 (CEST)
Received: from localhost ([::1]:38562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYgRW-0003K2-OU
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 22:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lYgQb-0002tg-8U
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 22:47:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lYgQY-00088y-IG
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 22:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618886869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yH0v5prcLAiciyfFVU5tgKN5D39opUng6+/XefeASM=;
 b=O7x7AQiqvj0mc18dMJTq63Md2P1fEB/qsaluXNHmCbNAPIVJph3D6mNVRzOzMXj7vSuXUq
 ngJMRrUgi3kzq3B0XTKkJslBU+9gP7Hp1JcWpCfIWu6X6y7ip/GVuaOqkGe/wbT2vO7IFi
 4tlPj5Fgc5kquYM07WDJ18vZZpfN+FQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-naq1PM_5PTOsOewoCjbvkg-1; Mon, 19 Apr 2021 22:47:47 -0400
X-MC-Unique: naq1PM_5PTOsOewoCjbvkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EC1919251A1
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 02:47:46 +0000 (UTC)
Received: from [10.10.118.219] (ovpn-118-219.rdu2.redhat.com [10.10.118.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4977C5D72E;
 Tue, 20 Apr 2021 02:47:42 +0000 (UTC)
Subject: Re: [PATCH RFC 0/7] RFC: Asynchronous QMP Draft
From: John Snow <jsnow@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210413155553.2660523-1-jsnow@redhat.com>
 <YHaN5JPvjK2Wq6su@stefanha-x1.localdomain>
 <79eb174a-8e08-aac8-6a0c-e0c7b03eb782@redhat.com>
 <YHgMy+Yc5nRDVlGM@stefanha-x1.localdomain>
 <19a736c7-aced-39d3-e1fb-c0dd5031b2ff@redhat.com>
Message-ID: <44f4952a-8d4f-1fab-1f0a-9093bb352d57@redhat.com>
Date: Mon, 19 Apr 2021 22:47:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <19a736c7-aced-39d3-e1fb-c0dd5031b2ff@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: armbru@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 10:26 PM, John Snow wrote:
> On 4/15/21 5:52 AM, Stefan Hajnoczi wrote:
>> Yeah, it seems very nice for allowing multiple event listeners that
>> don't steal each other's events. I like it.
>>
>> qmp.event_listener() could take a sequence of QMP event names to trigger
>> on. If the sequence is empty then all QMP events will be reported.
> 
> I made something like this:
> 
> 
> # Example 1
> with qmp.listener('STOP') as listener:
>      await qmp.execute('stop')
>      await listener.get()
> 
> 
> # Example 2
> with qmp.listener('JOB_STATUS_CHANGE') as listener:
>      await qmp.execute('blockdev-create', ...)
>      async for event in listener:
>          if event['data']['status'] == 'concluded':
>              break
>      await qmp.execute('job-dismiss', ...)
> 
> 
> # Example 3 - all events
> with qmp.listener() as events:
>      async for event in events:
>          print(f"got '{event['event']}' event!")
> 
> 
> # Example 4 - several events on one listener
> job_events = (
>      'JOB_STATUS_CHANGE', 'BLOCK_JOB_COMPLETED', 'BLOCK_JOB_CANCELLED',
>      'BLOCK_JOB_ERROR', 'BLOCK_JOB_READY', 'BLOCK_JOB_PENDING'
> )
> with qmp.listener(job_events) as events:
>      ...
> 
> 
> There is a *post-filtering* syntax available to EventListener.get(). It 
> will filter events out using a very simplistic syntax.
> 
> 
> # Example 5 -- a short-hand form of Example 2.
> with qmp.listener('JOB_STATUS_CHANGE') as job_events:
>      await qmp.execute('blockdev-create', ...)
>      await job_events.get(status='concluded')
>      await qmp.execute('job-dismiss', ...)
> 
> 
> 
> A shortcoming with this interface is that it's easy to create a listener 
> that hears multiple events, but it's not easy to create *several 
> listeners*. I am not sure what syntax will be the nicest for this, but I 
> tried by allowing the manual creation of listeners:
> 
> 
> # Example 6
> listener1 = EventListener('JOB_STATUS_CHANGE')
> listener2 = EventListener(job_events)
> 
> # Note the use of listen() instead of listener()
> with qmp.listen(listener1, listener2) as (ev1, ev2):
>      # listeners are now active.
>      ...
> # listeners are now inactive.
> # The context manager clears any stale events in the listener(s).
> 
> 
> I thought this might be nicer than trying to extend the listener syntax:
> 
> with qmp.listeners(
>      'JOB_STATUS_CHANGE',
>      (job_events)
> ) as (
>      listener1,
>      listener2,
> ):
>      ...
> 
> especially because it might get confusing when trying to separate "one 
> listener with multiple events" vs "several listeners with one event 
> each, and it makes things a little ambiguous:
> 
> with qmp.listeners('STOP') as (stop_events,):
>      ...
> 
> And this isn't any prettier, and also likely to confuse:
> 
> with qmp.listeners('STOP', 'RESUME') as (stops, resumes):
>      ...
> 
> because it's only so very subtly different from this:
> 
> with qmp.listeners(('STOP', 'RESUME')) as (runstate_events,):
>      ...
> 
> This also doesn't begin to address one of the worst headaches of writing 
> iotests where transactions are involved: accidentally eating events 
> meant for other jobs.
> 
> I prototyped something where it's possible to create an EventListener 
> with an optional pre-filter, but it's a little bulky:
> 
> 
> # Example 7
> listener = EventListener('JOB_STATUS_CHANGE',
>                           lambda e: e['data']['id'] == 'job0')
> 
> with qmp.listen(listener):
>      await qmp.execute('blockdev-create', arguments={'job-id': 'job0'})
>      await listener.get(status='created')
>      ...
> 
> 
> Some thoughts on this:
> - Pre-filters are powerful, but involve a lot of boilerplate.
> - Accepting two kinds of parameters, name(s) and filter both, makes it 
> even trickier to write concise context blocks; especially with multiple 
> jobs.
> 
> 
> Here's a final example of something you may very well want to do in 
> iotest code:
> 
> 
> # Example 8
> 
> def job_filter(job_id: str) -> EventFilter:
>      def filter(event: Message) -> bool:
>          return event.get('data', {}).get('id') == job_id
>      return filter
> 
> listener1 = EventListener('JOB_STATUS_CHANGE', job_filter('job0'))
> listener2 = EventListener('JOB_STATUS_CHANGE', job_filter('job1'))
> 
> with qmp.listen(listener1, listener2) as (job0, job1):
>      await asyncio.gather(
>          qmp.execute('blockdev-create', arguments={'job-id': 'job0'}),
>          qmp.execute('blockdev-create', arguments={'job-id': 'job1'}),
>          job0.get(status='concluded'),
>          job1.get(status='concluded')
>      )
> 
> (Note: gather isn't required here. You could write the execute and get 
> statements individually and in whichever order you wanted, as long as 
> the execute statement for a given job appears prior to the corresponding 
> wait!)
> 
> The difficulty I have here is extending that backwards to the "create 
> listener on the fly" syntax, for the reasons stated above with making it 
> ambiguous as to whether we're creating one or two listeners, etc. Trying 
> to minimize boilerplate while leaving the interfaces generic and 
> powerful is tough.
> 
> I'm still playing around with different options and solutions, but your 
> feedback/input is welcome.
> 
> --js


Oh, though of course, the moment I sent this, I realized there is 
actually a somewhat nicer way to do this in non-test code that doesn't 
care about ordering, but still wouldn't work for QMP transactions; but 
it's nice to look at:

# Example 9 -- Multiple jobs without a transaction:

async def blockdev_create(qmp, job_id: str, options: Dict[str, Any]):
     with qmp.listener('JOB_STATUS_CHANGE') as listener:
         await qmp.execute('blockdev-create', arguments={
             'job-id': job_id,
             'options': options,
         })
         await listener.get(id=job_id, status='concluded')
         await qmp.execute('job-dismiss', arguments={'id': job_id})
         await listener.get(id=job_id, status='null')

await asyncio.gather(
     blockdev_create(qmp, 'job2', {...}),
     blockdev_create(qmp, 'job3', {...}),
)

It won't work for transactions because we spawn multiple IDs with a 
single command in a single context. You could remedy it by creating 
multiple listeners and just being very careful to always use just one 
per each job, but that's likely prone to failure and hard to catch on 
reviews, etc.

--js


