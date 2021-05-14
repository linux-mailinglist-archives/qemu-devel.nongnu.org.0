Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B31381157
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 22:03:49 +0200 (CEST)
Received: from localhost ([::1]:58392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhe2G-0004yd-J8
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 16:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhe12-0004Hq-J2
 for qemu-devel@nongnu.org; Fri, 14 May 2021 16:02:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhe0x-00019c-Vg
 for qemu-devel@nongnu.org; Fri, 14 May 2021 16:02:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621022546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bm/Hp51OcmXGB1P4wJfx6sURa+EZOSi/xz+Sc+zpR/g=;
 b=Oc/N5jMVS1N97Dz+mDgSKrQq4O1HR6N7p75S40K932InylQmjInNvicDX5aRX9WXHgI3bf
 b/f/8isAI51zmmzV98X7NYzirDCDz6SHn93Co0bi6r9pmjJWR+foEWZDF3sZhRJJzjW0Ax
 n+HvojXBXKIazHA5esUyUpkCn+io8ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-eYHRFJIZMpOOR4zRSKodUw-1; Fri, 14 May 2021 16:02:24 -0400
X-MC-Unique: eYHRFJIZMpOOR4zRSKodUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D05E1083E8F;
 Fri, 14 May 2021 20:02:23 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D338961156;
 Fri, 14 May 2021 20:02:21 +0000 (UTC)
Subject: Re: [PATCH v3 10/15] qemu_iotests: extent QMP socket timeout when
 using valgrind
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-11-eesposit@redhat.com>
 <a7353583-27d2-762f-34b3-a4bda861057b@redhat.com>
 <f265d653-e9a3-fe26-ab9a-2a8554b5a8fa@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <c9d0ac91-4d22-a041-c2ca-bfe227fe57ad@redhat.com>
Date: Fri, 14 May 2021 16:02:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f265d653-e9a3-fe26-ab9a-2a8554b5a8fa@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 4:16 AM, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 13/05/2021 20:47, John Snow wrote:
>> On 4/14/21 1:03 PM, Emanuele Giuseppe Esposito wrote:
>>> As with gdbserver, valgrind delays the test execution, so
>>> the default QMP socket timeout timeout too soon.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   python/qemu/machine.py        | 2 +-
>>>   tests/qemu-iotests/iotests.py | 4 ++--
>>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>>> index d6142271c2..dce96e1858 100644
>>> --- a/python/qemu/machine.py
>>> +++ b/python/qemu/machine.py
>>> @@ -410,7 +410,7 @@ def _launch(self) -> None:
>>>                                          shell=False,
>>>                                          close_fds=False)
>>> -        if 'gdbserver' in self._wrapper:
>>> +        if 'gdbserver' in self._wrapper or 'valgrind' in self._wrapper:
>>
>> This approaches me suggesting that we just change __init__ to accept a 
>> parameter that lets the caller decide what kind of timeout(s) they 
>> find acceptable. They know more about what they're trying to run than 
>> we do.
>>
>> Certainly after launch occurs, the user is free to just grab the qmp 
>> object and tinker around with the timeouts, but that does not allow us 
>> to change the timeout(s) for accept itself.
>>
>> D'oh.
>>
>> (Spilled milk: It was probably a mistake to make the default launch 
>> behavior here have a timeout of 15 seconds. That logic likely belongs 
>> to the iotests implementation. The default here probably ought to 
>> indeed be "wait forever".)
>>
>> In the here and now ... would it be acceptable to change the launch() 
>> method to add a timeout parameter? It's still a little awkward, 
>> because conceptually it's a timeout for just QMP and not for the 
>> actual duration of the entire launch process.
>>
>> But, I guess, it's *closer* to the truth.
>>
>> If you wanted to route it that way, I take back what I said about not 
>> wanting to pass around variables to event loop hooks.
>>
>> If we defined the timeout as something that applies exclusively to the 
>> launching process, then it'd be appropriate to route that to the 
>> launch-related functions ... and subclasses would have to be adjusted 
>> to be made aware that they're expected to operate within those 
>> parameters, which is good.
>>
>> Sorry for my waffling back and forth on this. Let me know what the 
>> actual requirements are if you figure out which timeouts you need / 
>> don't need and I'll give you some review priority.
> 
> Uhm.. I am getting a little bit confused on what to do too :)
> 

SORRY, I hit send too quickly and then change my mind. I've handed you a 
giant bag of my own confusion. Very unfair of me!

> So the current plan I have for _qmp_timer is:
> 
> - As Max suggested, move it in __init__ and check there for the wrapper 
> contents. If we need to block forever (gdb, valgrind), we set it to 
> None. Otherwise to 15 seconds. I think setting it always to None is not 
> ideal, because if you are testing something that deadlocks (see my 
> attempts to remove/add locks in QEMU multiqueue) and the socket is set 
> to block forever, you don't know if the test is super slow or it just 
> deadlocked.
> 

I agree with your concern on rational defaults, let's focus on that briefly:

Let's have QEMUMachine default to *no timeouts* moving forward, and have 
the timeouts be *opt-in*. This keeps the Machine class somewhat pure and 
free of opinions. The separation of mechanism and policy.

Next, instead of modifying hundreds of tests to opt-in to the timeout, 
let's modify the VM class in iotests.py to opt-in to that timeout, 
restoring the current "safe" behavior of iotests.

The above items can happen in a single commit, preserving behavior in 
the bisect.

Finally, we can add a non-private property that individual tests can 
re-override to opt BACK out of the default.

Something as simple as:

vm.qmp_timeout = None

would be just fine.

> Well, one can argue that in both cases this is not the expected 
> behavior, but I think having an upper bound on each QMP command 
> execution would be good.
> 
> - pass _qmp_timer directly to self._qmp.accept() in _post launch, 
> leaving _launch() intact. I think this makes sense because as you also 
> mentioned, changing _post_launch() into taking a parameter requires 
> changing also all subclasses and pass values around.
> 

Sounds OK. If we do change the defaults back to "No Timeout" in a way 
that allows an override by an opinionated class, we'll already have the 
public property, though, so a parameter might not be needed.

(Yes, this is the THIRD time I've changed my mind in 48 hours.)

> Any opinion on this is very welcome.
> 

Brave words!

My last thought here is that I still don't like the idea of QEMUMachine 
class changing its timeout behavior based on the introspection of 
wrapper args.

It feels much more like the case that a caller who is knowingly wrapping 
it with a program that delays its execution should change its parameters 
accordingly based on what the caller knows about what they're trying to 
accomplish.

Does that make the code too messy? I understand you probably want to 
ensure that adding a GDB wrapper is painless and simple, so it might not 
be great to always ask a caller to remember to set some timeout value to 
use it.

I figure that the right place to do this, though, is wherever the 
boilerplate code gets written that knows how to set up the right gdb 
args and so on, and not in machine.py. It sounds like iotests.py code to 
me, maybe in the VM class.

> Spoiler alert I haven't tested these changes yet, but I am positive that 
> there shouldn't be any problem. (Last famous words)
> 
> Emanuele
> 
> 
Clear as mud?

--js


