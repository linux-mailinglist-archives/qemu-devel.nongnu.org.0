Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D035FA19
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 19:52:05 +0200 (CEST)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWjgK-0007pA-IN
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 13:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWjf7-0007OW-BF
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWjf4-0005UV-BM
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618422644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gUUedMsrWeBUNjEB7Ps0Np+hqp2HsQukzVcX53wosQY=;
 b=KMy472ty59tLRdph0KSGvLByUW27Bxs2SDxVmn2KKdWWuSEgASr1vtK25bKho0M6EkrjW8
 8oBPvvvETJw9k+LsgBJPjjjJdjJstYRliW3FfgUOcZqKB4FUgvfvLM3YhJzsAWsRxykQx+
 bxTtbzD24mWmjDpvfqXM3ssIEbbGJos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-5w3Ic4J_Pf-m7ybbJi0P1g-1; Wed, 14 Apr 2021 13:50:42 -0400
X-MC-Unique: 5w3Ic4J_Pf-m7ybbJi0P1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D69701020C20
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 17:50:41 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A76635C232;
 Wed, 14 Apr 2021 17:50:37 +0000 (UTC)
Subject: Re: [PATCH RFC 6/7] qmp_protocol: add QMP client implementation
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210413155553.2660523-1-jsnow@redhat.com>
 <20210413155553.2660523-7-jsnow@redhat.com>
 <YHaBQOYfMSuXoMAj@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <6d3a5cf8-838c-bdda-2050-d6d681aec5ea@redhat.com>
Date: Wed, 14 Apr 2021 13:50:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YHaBQOYfMSuXoMAj@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 4/14/21 1:44 AM, Stefan Hajnoczi wrote:
> On Tue, Apr 13, 2021 at 11:55:52AM -0400, John Snow wrote:
>> +    async def _execute(self, msg: Message) -> object:
>> +        """
>> +        The same as `execute_msg()`, but without safety mechanisms.
>> +
>> +        Does not assign an execution ID and does not check that the form
>> +        of the message being sent is valid.
>> +
>> +        This method *Requires* an 'id' parameter to be set on the
>> +        message, it will not set one for you like `execute()` or
>> +        `execute_msg()`.
>> +
>> +        Do not use "__aqmp#00000" style IDs, use something else to avoid
>> +        potential clashes. If this ID clashes with an ID presently
>> +        in-use or otherwise clashes with the auto-generated IDs, the
>> +        response routing mechanisms in _on_message may very well fail
>> +        loudly enough to cause the entire loop to crash.
>> +
>> +        The ID should be a str; or at least something JSON
>> +        serializable. It *must* be hashable.
>> +        """
>> +        exec_id = cast(str, msg['id'])
>> +        self.logger.debug("Execute(%s): '%s'", exec_id,
>> +                          msg.get('execute', msg.get('exec-oob')))
>> +
>> +        queue: asyncio.Queue[Message] = asyncio.Queue(maxsize=1)
>> +        task = create_task(self._bh_execute(msg, queue))
> 
> We're already in a coroutine, can we await queue.get() ourselves instead
> of creating a new task?
> 
> I guess this is done in order to use Task.cancel() in _bh_disconnect()
> but it seems simpler to use queue both for success and cancellation.
> Fewer tasks are easier to reason about.
> 

...queues do not have a cancellation signal :( :( :( :(

There's no way to "cancel" a queue:
https://docs.python.org/3/library/asyncio-queue.html#queue

You *could* craft a special message and inject an exception into the 
queue to notify the reader that the message will never arrive, but it 
feels like working against the intended mechanism of that primitive. It 
really feels like it wants to be wrapped in a *task*.

An earlier draft used an approach where it crafted a special "mailbox" 
object, comprised of message, event, and error fields. The waiter sets 
up a mailbox and then blocks on the event. Upon being notified of an 
event, the caller checks to see if the message OR the error field was 
filled.

I wound up removing it, because I felt it added too much custom 
machinery/terminology and instead went with Tasks and a queue with a 
depth of one.

Both feel like they are working against the intended mechanisms to a 
degree. I am open to suggestions here!

(It's also worth noting that iotests will want the ability to separate 
the queueing of a message and the waiting for that message. The current 
design only allows for send-and-wait, and not separate send-then-wait 
semantics. Tasks do provide a rather convenient handle if I want to 
split that mechanism out.)

All of the above options are a little hacky to me. Any thoughts or 
preferences?

--js


