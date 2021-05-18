Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4484B387B49
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:38:19 +0200 (CEST)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0rS-0006UF-BR
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj0g3-0006wC-Ov
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:26:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj0g1-0000WT-SI
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621347989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ws9NUB0FwBt5mnVPKNSnBkbp+hiVlXhZumklxKWiFFc=;
 b=Vg5je0hb8orRKEieP09jSrFSSjG1V8lnvYeYOoHJQLfBJe1r1CRl7MSmtAnd4XZUYFEMMB
 IrOpPa1t2Rq/yFcueOwesHqG8hTC3XW51y4ndb/dyEiksz0oPHRorML/8O9nD2ibEhVOap
 uP7rJotZoLPbZTFFTSSyt0Zok7Y1OkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-5UmS7OaANxiVvL5UQY-KbQ-1; Tue, 18 May 2021 10:26:25 -0400
X-MC-Unique: 5UmS7OaANxiVvL5UQY-KbQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF5211854E25;
 Tue, 18 May 2021 14:26:24 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5ECD60C04;
 Tue, 18 May 2021 14:26:23 +0000 (UTC)
Subject: Re: [PATCH v3 10/15] qemu_iotests: extent QMP socket timeout when
 using valgrind
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-11-eesposit@redhat.com>
 <a7353583-27d2-762f-34b3-a4bda861057b@redhat.com>
 <f265d653-e9a3-fe26-ab9a-2a8554b5a8fa@redhat.com>
 <c9d0ac91-4d22-a041-c2ca-bfe227fe57ad@redhat.com>
 <37fc7122-2bf3-a3a4-30cb-014ef8391f2e@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <7004fc54-d456-32f6-1c35-4cce1de00a6e@redhat.com>
Date: Tue, 18 May 2021 10:26:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <37fc7122-2bf3-a3a4-30cb-014ef8391f2e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 9:58 AM, Emanuele Giuseppe Esposito wrote:
> 
>>> So the current plan I have for _qmp_timer is:
>>>
>>> - As Max suggested, move it in __init__ and check there for the 
>>> wrapper contents. If we need to block forever (gdb, valgrind), we set 
>>> it to None. Otherwise to 15 seconds. I think setting it always to 
>>> None is not ideal, because if you are testing something that 
>>> deadlocks (see my attempts to remove/add locks in QEMU multiqueue) 
>>> and the socket is set to block forever, you don't know if the test is 
>>> super slow or it just deadlocked.
>>>
>>
>> I agree with your concern on rational defaults, let's focus on that 
>> briefly:
>>
>> Let's have QEMUMachine default to *no timeouts* moving forward, and 
>> have the timeouts be *opt-in*. This keeps the Machine class somewhat 
>> pure and free of opinions. The separation of mechanism and policy.
>>
>> Next, instead of modifying hundreds of tests to opt-in to the timeout, 
>> let's modify the VM class in iotests.py to opt-in to that timeout, 
>> restoring the current "safe" behavior of iotests.
>>
>> The above items can happen in a single commit, preserving behavior in 
>> the bisect.
>>
>> Finally, we can add a non-private property that individual tests can 
>> re-override to opt BACK out of the default.
>>
>> Something as simple as:
>>
>> vm.qmp_timeout = None
>>
>> would be just fine.
>>
> 
> I applied these suggested changes, will send v4 and we'll see what comes 
> out of it.
> 
>>> Well, one can argue that in both cases this is not the expected 
>>> behavior, but I think having an upper bound on each QMP command 
>>> execution would be good.
>>>
>>> - pass _qmp_timer directly to self._qmp.accept() in _post launch, 
>>> leaving _launch() intact. I think this makes sense because as you 
>>> also mentioned, changing _post_launch() into taking a parameter 
>>> requires changing also all subclasses and pass values around.
>>>
>>
>> Sounds OK. If we do change the defaults back to "No Timeout" in a way 
>> that allows an override by an opinionated class, we'll already have 
>> the public property, though, so a parameter might not be needed.
>>
>> (Yes, this is the THIRD time I've changed my mind in 48 hours.)
>>
>>> Any opinion on this is very welcome.
>>>
>>
>> Brave words!
>>
>> My last thought here is that I still don't like the idea of 
>> QEMUMachine class changing its timeout behavior based on the 
>> introspection of wrapper args.
>>
>> It feels much more like the case that a caller who is knowingly 
>> wrapping it with a program that delays its execution should change its 
>> parameters accordingly based on what the caller knows about what 
>> they're trying to accomplish.
>>
>> Does that make the code too messy? I understand you probably want to 
>> ensure that adding a GDB wrapper is painless and simple, so it might 
>> not be great to always ask a caller to remember to set some timeout 
>> value to use it.
>>
> I am not sure I follow you here, where do you want to move this logic? 
> Can you please elaborate more, I did not understand what you mean.
> 
> I understand that tweaking the timers in iotests.py with checks like
> 
> if not (qemu_gdb or qemu_valgrind):
>      normal timer
> 
> may not be the most beautiful piece of code, but as you said it keeps 
> things as simple as they can.
> 

What I mean is that of the two patterns:

caller.py:
     vm = machine(..., wrapper_args=['gdb', ...])

machine.py:
     def __init__(...):
         if 'gdb' in wrapper_args:
             self.timer = None

vs this one:

caller.py:
     vm = machine(..., wrapper_args=['gdb', ...], timer=None)

machine.py:
     def __init__(...):
         ... # No introspection of wrapper_args


I prefer the second. I would assume it's possible to localize the logic 
that creates a GDB-wrapped machine alongside the knowledge that it needs 
the timeout turned off *outside* of the machine class.

I could be *very wrong* about that assumption though. The reason I 
prefer the second pattern is because it avoids having to deal with what 
happens when a caller specifies both a timeout and a gdb-wrapper. In the 
second case, the caller explicitly requested the timeout to be None, so 
anything that occurs afterwards is the fault of the caller, not machine.py.

To me, that's "simpler". (I could be wrong, I don't have a great overall 
view of your series, just the bits that I have seen that touch machine.py.)

--js

>> I figure that the right place to do this, though, is wherever the 
>> boilerplate code gets written that knows how to set up the right gdb 
>> args and so on, and not in machine.py. It sounds like iotests.py code 
>> to me, maybe in the VM class.
> 
> After the changes suggested on qmp_timeout, iotests.py already contains 
> the only code to perform the setup right for gdb and valgrind, and 
> machine.py is not touched (except for qmp_timeout). iotests.py will 
> essentially contain a couple of ifs like the one above, changing the 
> timer when gdb and valgring are *not* needed.
> 
> Emanuele
> 


