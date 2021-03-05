Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC832F004
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:28:29 +0100 (CET)
Received: from localhost ([::1]:60394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDJU-0005sK-8I
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lIDGw-0003oA-A8
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:25:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lIDGt-0001Ek-Bv
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614961546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mx6lYqEAWksj1hovDtnEfeJJAWtpwuuPZGBNAYjDM9I=;
 b=hZmI7ptOFvopGrpQB12Yr9H5jJQGqScuviiok6MZK3jaWH2IAalDs24L3QzIkhs3uq5rMq
 AC9q6q4aNXe9Cf4d654KCaIdHh5tCniq0KQam3mtU+7WjRW4j4P03xnPHWwueXs92tFUQN
 BXHIs/rk/+wTf8VVqd++zm+/Sto8Yfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-ARGsxKsYP5eCJj-ua9MhRQ-1; Fri, 05 Mar 2021 11:25:44 -0500
X-MC-Unique: ARGsxKsYP5eCJj-ua9MhRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A364E108BD06;
 Fri,  5 Mar 2021 16:25:43 +0000 (UTC)
Received: from [10.10.117.80] (ovpn-117-80.rdu2.redhat.com [10.10.117.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2A6F19C66;
 Fri,  5 Mar 2021 16:25:42 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] simplebench: bench_one(): add slow_limit argument
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
 <20210304101738.20248-2-vsementsov@virtuozzo.com>
 <ec82b01e-30f5-564a-a88a-b83f9a9d9d02@redhat.com>
 <06561d9c-0011-c698-41a8-235cc061f4a6@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <81277a70-3af1-19b4-1ee0-70715aab1891@redhat.com>
Date: Fri, 5 Mar 2021 11:25:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <06561d9c-0011-c698-41a8-235cc061f4a6@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 4:03 AM, Vladimir Sementsov-Ogievskiy wrote:
> 05.03.2021 04:22, John Snow wrote:
>> On 3/4/21 5:17 AM, Vladimir Sementsov-Ogievskiy wrote:
>>> Sometimes one of cells in a testing table runs too slow. And we really
>>> don't want to wait so long. Limit number of runs in this case.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   scripts/simplebench/simplebench.py | 29 +++++++++++++++++++++++++----
>>>   1 file changed, 25 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/scripts/simplebench/simplebench.py 
>>> b/scripts/simplebench/simplebench.py
>>> index f61513af90..b153cae274 100644
>>> --- a/scripts/simplebench/simplebench.py
>>> +++ b/scripts/simplebench/simplebench.py
>>> @@ -19,9 +19,11 @@
>>>   #
>>>   import statistics
>>> +import time
>>> -def bench_one(test_func, test_env, test_case, count=5, 
>>> initial_run=True):
>>> +def bench_one(test_func, test_env, test_case, count=5, 
>>> initial_run=True,
>>> +              slow_limit=100):
>>>       """Benchmark one test-case
>>>       test_func   -- benchmarking function with prototype
>>> @@ -36,6 +38,8 @@ def bench_one(test_func, test_env, test_case, 
>>> count=5, initial_run=True):
>>>       test_case   -- test case - opaque second argument for test_func
>>>       count       -- how many times to call test_func, to calculate 
>>> average
>>>       initial_run -- do initial run of test_func, which don't get 
>>> into result
>>> +    slow_limit  -- reduce test runs to 2, if current run exceedes 
>>> the limit
>>> +                   (in seconds)
>>
>> s/exceedes/exceeds, and you need to mention that if the initial run 
>> exceeds the limit, it will change the behavior to count that result.
>>
>> It is also possible (conceivably) that the initial run exceeds the 
>> limit, but subsequent runs don't, so it might be hard to predict how 
>> many tests it'll actually run.
>>
>> If you're OK with that behavior, maybe:
>>
>> "Consider a test run 'slow' once it exceeds this limit, in seconds.
>>   Stop early once there are two 'slow' runs, including the initial run.
>>   Slow initial runs will be included in the results."
>>
>> Lastly, this will change existing behavior -- do we care? Should it 
>> default to None instead? Should we be able to pass None or 0 to 
>> disable this behavior?
> 
> For sure I don't care about changing the behavior. Consider simplebench 
> in a version 0.0.1 :). Maybe, I should make a comment somewhere, but 
> nobody will read it anyway.
> 

Yep, it's yours anyway. Just thought I'd mention it. It's probably the 
case that you're the only person who actually uses this at the moment.

> The aim of the patch is to minimize waiting for too long cells of the 
> table, which are obviously too much longer then the others. Probably the 
> logic should be improved a bit about ignoring or using initial-run result..
> Like this:
> 
> If both initial and first run are slow, count both and stop here.
> Otherwise, stop at first slow normal run and don't count initial run.
> 
> Or may be even
> 
> If both initial and first run are slow, count both and stop here.
> Otherwise, behave the common way.
> 

My opinion is that you can do whatever you'd like (you're the maintainer 
here!) but it'd be nice if the docstring was accurate. If changing the 
behavior makes it easier to write a good docstring, that's fine too. Go 
with whatever is most useful to you.

--js

>>
>>>       Returns dict with the following fields:
>>>           'runs':     list of test_func results
>>> @@ -47,17 +51,34 @@ def bench_one(test_func, test_env, test_case, 
>>> count=5, initial_run=True):
>>>           'n-failed': number of failed runs (exists only if at least 
>>> one run
>>>                       failed)
>>>       """
>>> +    runs = []
>>> +    i = 0
>>>       if initial_run:
>>> +        t = time.time()
>>> +
>>>           print('  #initial run:')
>>> -        print('   ', test_func(test_env, test_case))
>>> +        res = test_func(test_env, test_case)
>>> +        print('   ', res)
>>> +
>>> +        if time.time() - t > slow_limit:
>>> +            print('    - initial run is too slow, so it counts')
>>> +            runs.append(res)
>>> +            i = 1
>>> +
>>> +    for i in range(i, count):
>>> +        t = time.time()
>>> -    runs = []
>>> -    for i in range(count):
>>>           print('  #run {}'.format(i+1))
>>>           res = test_func(test_env, test_case)
>>>           print('   ', res)
>>>           runs.append(res)
>>> +        if time.time() - t > slow_limit and len(runs) >= 2:
>>> +            print('    - run is too slow, and we have enough runs, 
>>> stop here')
>>> +            break
>>> +
>>> +    count = len(runs)
>>> +
>>>       result = {'runs': runs}
>>>       succeeded = [r for r in runs if ('seconds' in r or 'iops' in r)]
>>>
>>
> 
> 


