Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83832371767
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:03:51 +0200 (CEST)
Received: from localhost ([::1]:38722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lda6v-0005z1-Nz
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lda60-0005Ov-3p
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:02:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lda5x-0000MN-JW
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620054168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJgbiGtwe1HWbwc5Z4JRDlMFQYvaZCb0Rs/RpjHi1WU=;
 b=Jp+GoBfE4H4OciInFDDLzHhgUtGNhU0m4IgQhmDyTMh/PJiyuEtukIokcRbx8efMwdI0tB
 E/+YnO9CJffpwLmZ2CEqgcZLaUrxShSgjMcHYNCiVEKlrqe3REM9WnCE/XBE7fRde884z/
 Yml6yLYw0Sq8qHHDaTipiqBVtm+aBSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-K5lTziejOkWrFM2xQuF7Yw-1; Mon, 03 May 2021 11:02:45 -0400
X-MC-Unique: K5lTziejOkWrFM2xQuF7Yw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B10701966322;
 Mon,  3 May 2021 15:02:44 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-107.ams2.redhat.com
 [10.36.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E1872BFE9;
 Mon,  3 May 2021 15:02:42 +0000 (UTC)
Subject: Re: [PATCH v3 05/15] qemu-iotests: delay QMP socket timers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-6-eesposit@redhat.com>
 <df1df43e-cfdc-ddeb-f7c1-f9399f252b35@redhat.com>
 <bb2c8f3c-f1cf-6213-b67d-7b1ff2102992@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d652828c-a5c9-8f61-84b8-0f1d8a679911@redhat.com>
Date: Mon, 3 May 2021 17:02:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bb2c8f3c-f1cf-6213-b67d-7b1ff2102992@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.04.21 23:03, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 30/04/2021 13:59, Max Reitz wrote:
>> On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
>>> Attaching a gdbserver implies that the qmp socket
>>> should wait indefinitely for an answer from QEMU.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   python/qemu/machine.py        |  3 +++
>>>   tests/qemu-iotests/iotests.py | 10 +++++++++-
>>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>>> index 12752142c9..d6142271c2 100644
>>> --- a/python/qemu/machine.py
>>> +++ b/python/qemu/machine.py
>>> @@ -409,6 +409,9 @@ def _launch(self) -> None:
>>>                                          stderr=subprocess.STDOUT,
>>>                                          shell=False,
>>>                                          close_fds=False)
>>> +
>>> +        if 'gdbserver' in self._wrapper:
>>> +            self._qmp_timer = None
>>
>> Why doesn’t __init__() evaluate this?  This here doesn’t feel like the 
>> right place for it.  If we want to evaluate it here, self._qmp_timer 
>> shouldn’t exist, and instead the timeout should be a _post_launch() 
>> parameter.  (Which I would have nothing against, by the way.)
> 
> Uhm.. I got another comment in a previous version where for the "event" 
> callbacks it was better a property than passing around a parameter. 
> Which I honestly agree.

I think that comment was in the sense of providing a default value, 
which can be expressed by having a property that is set in __init__.

I don’t have anything against making this a property, but I also don’t 
have anything against making it a _post_launch() parameter.  I could 
even live with both, i.e. set _qmp_timer to 15 in __init__, then have a 
_post_launch parameter, and pass either self._qmp_timer or None if 
self._wrapper includes 'gdbserver'.

What I do mind is that I don’t understand why the property is modified 
here.  The value of self._qmp_timer is supposed to be 15 by default and 
None if self._wrapper includes 'gdbserver'.  It should thus be changed 
to None the moment self._wrapper is made to include 'gdbserver'. 
Because self._wrapper is set only in __init__, this should happen in 
__init__.

> What should __init__() do? The check here is to see if the invocation 
> has gdb (and a couple of patches ahead also valgrind), to remove the timer.
> If I understand what you mean, you want something like
> def __init__(self, timer):

Oh, no.  We can optionally do that perhaps later, but what I meant is 
just to put this in __init__() (without adding any parameters to it):

self._qmp_timer = 15.0 if 'gdbserver' not in self._wrapper else None

I think self._qmp_timer should always reflect what timeout we are going 
to use when a VM is launched.  So if the conditions influencing the 
timeout change, it should be updated immediately to reflect this.  The 
only condition we have right now is the content of self._wrapper, which 
is only set in __init__, so self._qmp_timer should be set once in 
__init__ and not changed afterwards.

That sounds academic, but imagine what would happen if we had a 
set_qmp_timer() method: The timout could be adjusted, but launch() would 
just ignore it and update the property, even though the conditions 
influencing the timout didn’t change between set_qmp_timer() and launch().

Or if we had a get_qmp_timer(); a caller would read a timeout of 15.0 
before launch(), even though the timeout is going to be None.

Therefore, I think a property should not be updated just before it is 
read, but instead when any condition that’s supposed to influence its 
value changes.


I suggested making it a parameter because updating a property when 
reading it sounds like it should be a parameter instead.  I.e., one 
would say

def __init__():
     self._qmp_timeout_default = 15.0

def post_launch(qmp_timeout):
     self._qmp.accept(qmp_timeout)

def launch(self):
     ...
     qmp_timeout = None if 'gdbserver' in self._wrapper \
                        else self._qmp_timout_default
     self.post_launch(qmp_timeout)


Which is basically the structure your patch has, which gave me the idea.

[...]

>>>           self._post_launch()
>>>       def _early_cleanup(self) -> None:
>>> diff --git a/tests/qemu-iotests/iotests.py 
>>> b/tests/qemu-iotests/iotests.py
>>> index 05d0dc0751..380527245e 100644
>>> --- a/tests/qemu-iotests/iotests.py
>>> +++ b/tests/qemu-iotests/iotests.py

[...]

>>> @@ -684,6 +687,11 @@ def qmp_to_opts(self, obj):
>>>               output_list += [key + '=' + obj[key]]
>>>           return ','.join(output_list)
>>> +    def get_qmp_events(self, wait: bool = False) -> List[QMPMessage]:
>>> +        if qemu_gdb:
>>> +            wait = 0.0

[...]

>>
>> Second, I don’t understand this.  If the caller wants to block waiting 
>> on an event, then that should have nothing to do with whether we have 
>> gdb running or not.  As far as I understand, setting wait to 0.0 is 
>> the same as wait = False, i.e. we don’t block and just return None 
>> immediately if there is no pending event.
> 
> You're right, this might not be needed here. The problem I had was that 
> calling gdb and pausing at a breakpoint or something for a while would 
> make the QMP socket timeout, thus aborting the whole test. In order to 
> avoid that, I need to stop or delay timers.
> 
> I can't remember why I added this check here. At some point I am sure 
> the test was failing because of socket timeout expiration, but I cannot 
> reproduce the problem when commenting out this check above in 
> get_qmp_events. The other check in patch 3 should be enough.

Hm, ok.  I’d guessed that you intended the wait=0.0 or wait=False to 
mean that we get an infinite timeout (i.e., no timeout), but that’s 
exactly why I didn’t get it.  wait=0.0 doesn’t give an infinite timeout, 
but instead basically times out immediately.

Max


