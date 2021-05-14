Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA8A38110B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:42:09 +0200 (CEST)
Received: from localhost ([::1]:44148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhdhI-0002Yd-MB
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhdby-0008J9-33
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:36:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhdbu-0001KD-G1
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621020993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TjBnVnfdz+BsCqfJMo8DmtppmjOuzb3DxElGEBhW8ZE=;
 b=Hb2GXPLd8u6ntwWgtrTNL8xkvFQ1vXEtWAj8GLpJldc6NrGZ2KBkhKQs+x45W69VDv4URI
 5Jl/GggPKr/dztJ6I1O+RvnFg306rUp6MxxsVO/1qJpfYKXx/0AMeJmTTjF7cilWosM6fj
 Zujy8Mc2GwXyabNlC/EnthwzMArHm8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-OM6wQTjTMUuaoW9jlSc3Ig-1; Fri, 14 May 2021 15:36:31 -0400
X-MC-Unique: OM6wQTjTMUuaoW9jlSc3Ig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 335871007476;
 Fri, 14 May 2021 19:36:30 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C9D019D9B;
 Fri, 14 May 2021 19:36:22 +0000 (UTC)
Subject: Re: [PATCH 0/3] tests/acceptance: Handle tests with "cpu" tag
To: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20210224212654.1146167-1-wainersm@redhat.com>
 <20210309185237.GB2155904@amachine.somewhere>
 <d2825a6a-fcc1-7037-a574-5c0cc8ffb879@redhat.com>
 <c834302f-b379-0509-f3b9-afb873072dda@redhat.com>
 <20210407200137.53fshmvqjbvrnpk6@habkost.net>
 <0b2a4372-2881-dad1-0aa5-defe685a4c64@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <1b0a9948-6442-a3a8-a106-113f3aee860d@redhat.com>
Date: Fri, 14 May 2021 15:36:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0b2a4372-2881-dad1-0aa5-defe685a4c64@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru, Cleber Rosa <crosa@redhat.com>, pbonzini@redhat.com,
 philmd@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 10:53 AM, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 4/7/21 5:01 PM, Eduardo Habkost wrote:
>> On Tue, Mar 23, 2021 at 05:01:09PM -0400, John Snow wrote:
>>> On 3/17/21 3:16 PM, Wainer dos Santos Moschetta wrote:
>>>> Added John and Eduardo,
>>>>
>>>> On 3/9/21 3:52 PM, Cleber Rosa wrote:
>>>>> On Wed, Feb 24, 2021 at 06:26:51PM -0300, Wainer dos Santos
>>>>> Moschetta wrote:
>>>>>> Currently the acceptance tests tagged with "machine" have the "-M 
>>>>>> TYPE"
>>>>>> automatically added to the list of arguments of the QEMUMachine 
>>>>>> object.
>>>>>> In other words, that option is passed to the launched QEMU. On this
>>>>>> series it is implemented the same feature but instead for tests 
>>>>>> marked
>>>>>> with "cpu".
>>>>>>
>>>>> Good!
>>>>>
>>>>>> There is a caveat, however, in case the test needs additional
>>>>>> arguments to
>>>>>> the CPU type they cannot be passed via tag, because the tags
>>>>>> parser split
>>>>>> values by comma. For example, in
>>>>>> tests/acceptance/x86_cpu_model_versions.py,
>>>>>> there are cases where:
>>>>>>
>>>>>>     * -cpu is set to
>>>>>> "Cascadelake-Server,x-force-features=on,check=off,enforce=off"
>>>>>>     * if it was tagged like
>>>>>> "cpu:Cascadelake-Server,x-force-features=on,check=off,enforce=off"
>>>>>>       then the parser would break it into 4 tags
>>>>>> ("cpu:Cascadelake-Server",
>>>>>>       "x-force-features=on", "check=off", "enforce=off")
>>>>>>     * resulting on "-cpu Cascadelake-Server" and the remaining
>>>>>> arguments are ignored.
>>>>>>
>>>>>> For the example above, one should tag it (or not at all) as
>>>>>> "cpu:Cascadelake-Server"
>>>>>> AND self.vm.add_args('-cpu',
>>>>>> "Cascadelake-Server,x-force-features=on,check=off,enforce=off"),
>>>>>> and that results on something like:
>>>>>>
>>>>>>     "qemu-system-x86_64 (...) -cpu Cascadelake-Server -cpu
>>>>>> Cascadelake-Server,x-force-features=on,check=off,enforce=off".
>>>>>>
>>>>> There are clearly two problems here:
>>>>>
>>>>> 1) the tag is meant to be succinct, so that it can be used by users
>>>>>      selecting which tests to run.  At the same time, it's a waste
>>>>>      to throw away the other information or keep it duplicate or
>>>>>      incosistent.
>>>>>
>>>>> 2) QEMUMachine doesn't keep track of command line arguments
>>>>>      (add_args() makes it pretty clear what's doing).  But, on this 
>>>>> type
>>>>>      of use case, a "set_args()" is desirable, in which case it would
>>>>>      overwrite the existing arguments for a given command line option.
>>>> I like the idea of a "set_args()" to QEMUMachine as you describe above
>>>> but it needs further discussion because I can see at least one corner
>>>> case; for example, one can set the machine type as either -machine or
>>>> -M, then what key it should be searched-and-replaced (if any) on the
>>>> list of args?
>>>>
>>>> Unlike your suggestion, I thought on implement the method to deal 
>>>> with a
>>>> single argument at time, as:
>>>>
>>>>       def set_arg(self, arg: Union[str, list], value: str) -> None:
>>>>           """
>>>>           Set the value of an argument from the list of extra arguments
>>>> to be
>>>>           given to the QEMU binary. If the argument does not exist then
>>>> it is
>>>>           added to the list.
>>>>
>>>>           If the ``arg`` parameter is a list then it will search and
>>>> replace all
>>>>           occurencies (if any). Otherwise a new argument is added 
>>>> and it is
>>>>           used the first value of the ``arg`` list.
>>>>           """
>>>>           pass
>>>>
>>>> Does it sound good to you?
>>>>
>>>> Thanks!
>>>>
>>>> Wainer
>>>>
>>> A little hokey, but I suppose that's true of our CLI interface in 
>>> general.
>>>
>>> I'd prefer not get into the business of building a "config" inside the
>>> python module if we can help it right now, but if "setting" 
>>> individual args
>>> is something you truly need to do, I won't stand in the way.
>>>
>>> Do what's least-gross.
>> I don't have any specific suggestions on how the API should look
>> like, but I'm having trouble understanding the documentation
>> above.
>>
>> I don't know what "it will search and replace all occurrences"
>> means.  Occurrences of what?
>>
>> I don't understand what "it is used the first value of the `arg`
>> list" means, either.  I understand you are going to use the first
>> value of the list, but you don't say what you are going to do
>> with it.
> 
> 
> The documentation was indeed confusing but, please, disregard it. Based 
> on John's comments on this thread I decided to not introduce yet another 
> specialized function to QEMUMachine class. Instead I added the "args" 
> property so that users will have access to QEMUMachine._args to change 
> it whatever they like. You will find that implemented on the v2 of this 
> series:
> 
> '[PATCH v2 0/7] tests/acceptance: Handle tests with "cpu" tag'
> 
> Thanks!
> 
> - Wainer
> 
> 
>>

It would truly be very cool if we had a QEMUMachineConfig class that we 
could build out properly.

In the hypothetical perfect future world where we have a json-based 
config file format that mapped perfectly to QMP commands, we could 
create a class that represents loading and representing such a format, 
and allow callers to change values at runtime, like:

config.machine = q35

but this treads so absurdly close to what libvirt already does that I am 
hesitant to work on it without addressing some of the core 
organizational problems with our CLI first.

A frequent source of anguish is how we treat multiple or repeating 
values on the CLI, which we do not treat consistently. Many options use 
their own parsers and consistent behavior at the API level here requires 
a lot of special-casing.

Trying to enumerate the cases like -m/-machine and other conflicting 
things like -drive/-blockdev and so on seems difficult to get right and 
manage correctly. Smarter move is not to try, I think.

For now, it's sadly likely best that the caller simply reaches in and 
fiddles with the args according to its whims like Wainer has suggested. 
Caller knows best.

If you are seeing lots of repeated boilerplate though, feel free to add 
helper functions outside of the class for various test-users to use. 
Document their behavior rigorously.

thanks!
--js


