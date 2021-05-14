Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108F3804F9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 10:18:00 +0200 (CEST)
Received: from localhost ([::1]:46174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhT1D-0006rN-IP
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 04:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lhSzq-0004n3-O1
 for qemu-devel@nongnu.org; Fri, 14 May 2021 04:16:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lhSzo-00037P-Qy
 for qemu-devel@nongnu.org; Fri, 14 May 2021 04:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620980192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WPZSc6rrcoH7xWpxolUqYwV3gz939slePnRLHuNH5cI=;
 b=KywbZs0gOH1IgjgDx+zVhWHqLDQQN5F9q2vAIDQ3EAQ41E1r3pvuzqJstxvM30qzwatQ+F
 AGphXVpmxwJtdGPM8ihyIOIxAeMl+GPOSvfQTnQAkgwYUIEv0dRcEYK4/ly0X4Y8Z/6fJs
 4b2uAIZw+6lyTmXcLaBGsS4u9yrIusQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-Ns_zamAAO-in37mvmvLVbg-1; Fri, 14 May 2021 04:16:30 -0400
X-MC-Unique: Ns_zamAAO-in37mvmvLVbg-1
Received: by mail-ed1-f69.google.com with SMTP id
 g17-20020aa7dd910000b029038843570b67so15989883edv.9
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 01:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WPZSc6rrcoH7xWpxolUqYwV3gz939slePnRLHuNH5cI=;
 b=EF8ZrISzNC43ZrnI801XYzr3Kv8L/Ka7ahVc7n6zJTDg2w0O2w4GqALhE6LzaZSm98
 nanqlzvBfZEhCpxkIWj80AIUGmNK8Di9740hx0S9yRkaMm/QoPWlFeij9gdgDVrMe3gk
 y2j9fajI6wVZIT4md/0PoUM3BU2dymsYU6U+ily++4RxMGA4YConZ0Y9ovko+c+JOPS5
 h9JazUlfXZuWIKxXphz5TZp47JXYDL/biNeSF5JOEFqmSDFSuH28Fp5ZEDf6wvlHoTWZ
 IuFT2nfvmh5LlOJhVvksl3X7hjq0kqxtuXoG2XU+24hdEUaEy9XMnAb4rOnDI8KPWH4m
 oEKQ==
X-Gm-Message-State: AOAM531vT2NUdDTQ3KjUwLIcgYxQtXGRPJrXGCeoeMYX6/bXlUsbYhGe
 gyFHFJRBnLwQcKTd7HAkYwgPoMtZaTKl33aBAdynvEzqQwK+E8pmd0w8Ufb2GcRlL+zCoBDJbAB
 k323ZwLvyGq1yalllQqqokK/XBdX9zFaaBVh5HjGIqVwn+ini1B+u6UEd9M+eqcBeI5U=
X-Received: by 2002:aa7:d543:: with SMTP id u3mr55442359edr.26.1620980189021; 
 Fri, 14 May 2021 01:16:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyYIOFIQqU8+UOlUbH4V1/BHwBK5yunLtt3mUfwN0ignIW/eQg829yFk5jgH/U773vmhZKFw==
X-Received: by 2002:aa7:d543:: with SMTP id u3mr55442332edr.26.1620980188829; 
 Fri, 14 May 2021 01:16:28 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 u11sm4044914edr.13.2021.05.14.01.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 01:16:28 -0700 (PDT)
Subject: Re: [PATCH v3 10/15] qemu_iotests: extent QMP socket timeout when
 using valgrind
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-11-eesposit@redhat.com>
 <a7353583-27d2-762f-34b3-a4bda861057b@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <f265d653-e9a3-fe26-ab9a-2a8554b5a8fa@redhat.com>
Date: Fri, 14 May 2021 10:16:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a7353583-27d2-762f-34b3-a4bda861057b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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



On 13/05/2021 20:47, John Snow wrote:
> On 4/14/21 1:03 PM, Emanuele Giuseppe Esposito wrote:
>> As with gdbserver, valgrind delays the test execution, so
>> the default QMP socket timeout timeout too soon.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   python/qemu/machine.py        | 2 +-
>>   tests/qemu-iotests/iotests.py | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>> index d6142271c2..dce96e1858 100644
>> --- a/python/qemu/machine.py
>> +++ b/python/qemu/machine.py
>> @@ -410,7 +410,7 @@ def _launch(self) -> None:
>>                                          shell=False,
>>                                          close_fds=False)
>> -        if 'gdbserver' in self._wrapper:
>> +        if 'gdbserver' in self._wrapper or 'valgrind' in self._wrapper:
> 
> This approaches me suggesting that we just change __init__ to accept a 
> parameter that lets the caller decide what kind of timeout(s) they find 
> acceptable. They know more about what they're trying to run than we do.
> 
> Certainly after launch occurs, the user is free to just grab the qmp 
> object and tinker around with the timeouts, but that does not allow us 
> to change the timeout(s) for accept itself.
> 
> D'oh.
> 
> (Spilled milk: It was probably a mistake to make the default launch 
> behavior here have a timeout of 15 seconds. That logic likely belongs to 
> the iotests implementation. The default here probably ought to indeed be 
> "wait forever".)
> 
> In the here and now ... would it be acceptable to change the launch() 
> method to add a timeout parameter? It's still a little awkward, because 
> conceptually it's a timeout for just QMP and not for the actual duration 
> of the entire launch process.
> 
> But, I guess, it's *closer* to the truth.
> 
> If you wanted to route it that way, I take back what I said about not 
> wanting to pass around variables to event loop hooks.
> 
> If we defined the timeout as something that applies exclusively to the 
> launching process, then it'd be appropriate to route that to the 
> launch-related functions ... and subclasses would have to be adjusted to 
> be made aware that they're expected to operate within those parameters, 
> which is good.
> 
> Sorry for my waffling back and forth on this. Let me know what the 
> actual requirements are if you figure out which timeouts you need / 
> don't need and I'll give you some review priority.

Uhm.. I am getting a little bit confused on what to do too :)

So the current plan I have for _qmp_timer is:

- As Max suggested, move it in __init__ and check there for the wrapper 
contents. If we need to block forever (gdb, valgrind), we set it to 
None. Otherwise to 15 seconds. I think setting it always to None is not 
ideal, because if you are testing something that deadlocks (see my 
attempts to remove/add locks in QEMU multiqueue) and the socket is set 
to block forever, you don't know if the test is super slow or it just 
deadlocked.

Well, one can argue that in both cases this is not the expected 
behavior, but I think having an upper bound on each QMP command 
execution would be good.

- pass _qmp_timer directly to self._qmp.accept() in _post launch, 
leaving _launch() intact. I think this makes sense because as you also 
mentioned, changing _post_launch() into taking a parameter requires 
changing also all subclasses and pass values around.

Any opinion on this is very welcome.

Spoiler alert I haven't tested these changes yet, but I am positive that 
there shouldn't be any problem. (Last famous words)

Emanuele


> 
> If you attack this series again, can you please split out the python/* 
> patches into its own little series and CC me?
> 
> --js
> 
>>               self._qmp_timer = None
>>           self._post_launch()
>> diff --git a/tests/qemu-iotests/iotests.py 
>> b/tests/qemu-iotests/iotests.py
>> index a2e8604674..94597433fa 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -489,7 +489,7 @@ def log(msg: Msg,
>>   class Timeout:
>>       def __init__(self, seconds, errmsg="Timeout"):
>> -        if qemu_gdb:
>> +        if qemu_gdb or qemu_valgrind:
>>               self.seconds = 3000
>>           else:
>>               self.seconds = seconds
>> @@ -700,7 +700,7 @@ def qmp_to_opts(self, obj):
>>           return ','.join(output_list)
>>       def get_qmp_events(self, wait: bool = False) -> List[QMPMessage]:
>> -        if qemu_gdb:
>> +        if qemu_gdb or qemu_valgrind:
>>               wait = 0.0
>>           return super().get_qmp_events(wait=wait)
>>
> 


