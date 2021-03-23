Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA87346AB3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:03:43 +0100 (CET)
Received: from localhost ([::1]:50396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOoBi-0005kk-Fz
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOo9d-00049m-9U
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOo9U-0003T9-GJ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616533280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XakvUcFkyCrtYJ8ICtNJMqgcozgcjINLv4gz7nUCBJc=;
 b=gDoQcvR2FgpP2j2OLFhB/G5bmgD3JTPbDYK+KFyhD2IWYmSDEoyqkg4pEncM7z2mWJIMGi
 bmW8IpaiEiYGYIBd7j0h9gBgwprtfw43f7K3aHTqbTDGOQ14ByoVrvbH2PdCDKdiR1HM6C
 6yfZjle9vI2Rb1jh5i8gEsw0mf4vJv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-F6QVd3ztNcurWd3pJq1m3w-1; Tue, 23 Mar 2021 17:01:16 -0400
X-MC-Unique: F6QVd3ztNcurWd3pJq1m3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6862157081;
 Tue, 23 Mar 2021 21:01:15 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C61A37DD;
 Tue, 23 Mar 2021 21:01:10 +0000 (UTC)
Subject: Re: [PATCH 0/3] tests/acceptance: Handle tests with "cpu" tag
To: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210224212654.1146167-1-wainersm@redhat.com>
 <20210309185237.GB2155904@amachine.somewhere>
 <d2825a6a-fcc1-7037-a574-5c0cc8ffb879@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <c834302f-b379-0509-f3b9-afb873072dda@redhat.com>
Date: Tue, 23 Mar 2021 17:01:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d2825a6a-fcc1-7037-a574-5c0cc8ffb879@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, philmd@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 3:16 PM, Wainer dos Santos Moschetta wrote:
> Added John and Eduardo,
> 
> On 3/9/21 3:52 PM, Cleber Rosa wrote:
>> On Wed, Feb 24, 2021 at 06:26:51PM -0300, Wainer dos Santos Moschetta 
>> wrote:
>>> Currently the acceptance tests tagged with "machine" have the "-M TYPE"
>>> automatically added to the list of arguments of the QEMUMachine object.
>>> In other words, that option is passed to the launched QEMU. On this
>>> series it is implemented the same feature but instead for tests marked
>>> with "cpu".
>>>
>> Good!
>>
>>> There is a caveat, however, in case the test needs additional 
>>> arguments to
>>> the CPU type they cannot be passed via tag, because the tags parser 
>>> split
>>> values by comma. For example, in 
>>> tests/acceptance/x86_cpu_model_versions.py,
>>> there are cases where:
>>>
>>>    * -cpu is set to 
>>> "Cascadelake-Server,x-force-features=on,check=off,enforce=off"
>>>    * if it was tagged like 
>>> "cpu:Cascadelake-Server,x-force-features=on,check=off,enforce=off"
>>>      then the parser would break it into 4 tags 
>>> ("cpu:Cascadelake-Server",
>>>      "x-force-features=on", "check=off", "enforce=off")
>>>    * resulting on "-cpu Cascadelake-Server" and the remaining 
>>> arguments are ignored.
>>>
>>> For the example above, one should tag it (or not at all) as 
>>> "cpu:Cascadelake-Server"
>>> AND self.vm.add_args('-cpu', 
>>> "Cascadelake-Server,x-force-features=on,check=off,enforce=off"),
>>> and that results on something like:
>>>
>>>    "qemu-system-x86_64 (...) -cpu Cascadelake-Server -cpu 
>>> Cascadelake-Server,x-force-features=on,check=off,enforce=off".
>>>
>> There are clearly two problems here:
>>
>> 1) the tag is meant to be succinct, so that it can be used by users
>>     selecting which tests to run.  At the same time, it's a waste
>>     to throw away the other information or keep it duplicate or
>>     incosistent.
>>
>> 2) QEMUMachine doesn't keep track of command line arguments
>>     (add_args() makes it pretty clear what's doing).  But, on this type
>>     of use case, a "set_args()" is desirable, in which case it would
>>     overwrite the existing arguments for a given command line option.
> 
> I like the idea of a "set_args()" to QEMUMachine as you describe above 
> but it needs further discussion because I can see at least one corner 
> case; for example, one can set the machine type as either -machine or 
> -M, then what key it should be searched-and-replaced (if any) on the 
> list of args?
> 
> Unlike your suggestion, I thought on implement the method to deal with a 
> single argument at time, as:
> 
>      def set_arg(self, arg: Union[str, list], value: str) -> None:
>          """
>          Set the value of an argument from the list of extra arguments 
> to be
>          given to the QEMU binary. If the argument does not exist then 
> it is
>          added to the list.
> 
>          If the ``arg`` parameter is a list then it will search and 
> replace all
>          occurencies (if any). Otherwise a new argument is added and it is
>          used the first value of the ``arg`` list.
>          """
>          pass
> 
> Does it sound good to you?
> 
> Thanks!
> 
> Wainer
> 

A little hokey, but I suppose that's true of our CLI interface in general.

I'd prefer not get into the business of building a "config" inside the 
python module if we can help it right now, but if "setting" individual 
args is something you truly need to do, I won't stand in the way.

Do what's least-gross.

--js

>>> QEMU is going to ignore the first -cpu argument. See the patch 0003 
>>> for a reference.
>>>
>> But this would still be creating a QEMU command line with multiple
>> '-cpu' arguments, right?  I understand this could be useful for
>> testing the behavior of the parameter parsing (if that's intended) but
>> it's bad practice to be generating incorrect command line in tests.
>>
>> Maybe just by tackling issue #2 this could be avoided.
>>
>> Cheers,
>> - Cleber.


