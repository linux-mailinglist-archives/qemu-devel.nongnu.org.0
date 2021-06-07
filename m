Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F0C39E0D6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 17:42:08 +0200 (CEST)
Received: from localhost ([::1]:44518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHOB-0000HX-Di
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 11:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqHN0-0007s3-Lv
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:40:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqHMv-0006V7-J4
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623080447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2ciIlzwd/DNYWastHy9pPq89lqifCkn+DAPOudyBcg=;
 b=SPo6rKHgmADNJcMC3EpKoULCuTziG3uzVi1sFWvw+UTBjgXllN9taxau25ODvxdo+7iurS
 HBMPWBwFv+z9QKTTh5D26vZBiVsePPIqXbUBTR7gQKJWp7bhAaR6IVHsKkaI819/zDCbVf
 3YgQOFw3AihJydSBvah9HsL4Hmjh+yk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-xJuPMO7fMuiuX8ks45Au-w-1; Mon, 07 Jun 2021 11:40:43 -0400
X-MC-Unique: xJuPMO7fMuiuX8ks45Au-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80E531922025;
 Mon,  7 Jun 2021 15:40:42 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48D73100164C;
 Mon,  7 Jun 2021 15:40:40 +0000 (UTC)
Subject: Re: [PATCH RFC 2/3] iotests: split 'linters.py' off from 297
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210604163907.1511224-1-jsnow@redhat.com>
 <20210604163907.1511224-3-jsnow@redhat.com>
 <ba007a36-6e8f-29da-16a3-92f1599602c2@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <6bafcf85-07fe-e82c-1026-038c4b3f7f39@redhat.com>
Date: Mon, 7 Jun 2021 11:40:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ba007a36-6e8f-29da-16a3-92f1599602c2@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/5/21 10:27 AM, Vladimir Sementsov-Ogievskiy wrote:
> 04.06.2021 19:39, John Snow wrote:
>> Refactor the core function of the linting configuration out of 297 and
>> into a new file called linters.py.
>>
>> Now, linters.py represents an invocation of the linting scripts that
>> more resembles a "normal" execution of pylint/mypy, like you'd expect to
>> use if 'qemu' was a bona-fide package you obtained from PyPI.
>>
>> 297, by contrast, now represents the iotests-specific configuration bits
>> you need to get it to function correctly as a part of iotests, and with
>> 'qemu' as a namespace package that isn't "installed" to the current
>> environment, but just lives elsewhere in our source tree.
>>
>> By doing this, we will able to run the same linting configuration from
>> the Python CI tests without calling iotest logging functions or messing
>> around with PYTHONPATH / MYPYPATH.
>>
>> iotest 297 continues to operate in a standalone fashion for now --
>> presumably, it's convenient for block maintainers and contributors to
>> run in this manner.
>>
>> See the following commit for how this is used from the Python 
>> packaging side.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>>
>> ---
>>
>> - It's a big glob of a patch. Sorry. I can work it into smaller pieces
>>    if the idea is well received.
> 
> If at least split movement from other refactoring, would be good
> 

Sure. Refactor first and then move seems like the way to go here. I'll 
do that.

>>
>> - I change the invocations of mypy/pylint to "python3 -m pylint" and
>>    "python3 -m mypy" respectively, which causes these linters to use the
>>    virtual environment's preferred version. This forces the test to 
>> use the
>>    test environments curated by the CI jobs.
>>
>> - If you have installed Fedora's pylint package that provides
>>    "pylint-3", the above trick will still work correctly.
>>
>> - Checking for "pylint-3" specifically in 297 was left
>>    alone. Theoretically, this check could be broadened to simply look for
>>    the presence of a 'pylint' module to allow it to be more permissive.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   tests/qemu-iotests/297        |  88 ++++-------------------
>>   tests/qemu-iotests/linters.py | 130 ++++++++++++++++++++++++++++++++++
>>   2 files changed, 143 insertions(+), 75 deletions(-)
>>   create mode 100644 tests/qemu-iotests/linters.py
>>
>> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
>> index 433b732336..5c753279fc 100755
>> --- a/tests/qemu-iotests/297
>> +++ b/tests/qemu-iotests/297
>> @@ -17,98 +17,36 @@
>>   # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>   import os
>> -import re
>>   import shutil
> 
> [..]
> 
>> -    # fixed (in tests, at least)
>>       env = os.environ.copy()
>> -    qemu_module_path = os.path.join(os.path.dirname(__file__),
>> -                                    '..', '..', 'python')
>> +    qemu_module_path = os.path.join(
>> +        os.path.dirname(__file__),
>> +        '..', '..', 'python'
>> +    )
> 
> Hmm, you made 3 lines from 2 :) ... If rename to python_path it will fit 
> into one line. I'm not sure that it's better.
> 

I'll try it. I don't expect these args to change often so I don't insist 
on the args-as-code-block thing here.

>> +
>>       try:
>>           env['PYTHONPATH'] += os.pathsep + qemu_module_path
>>       except KeyError:
>>           env['PYTHONPATH'] = qemu_module_path
>> -    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', 
>> *files),
>> -                   env=env, check=False)
>> -    print('=== mypy ===')
>> -    sys.stdout.flush()
>> -
>> -    # We have to call mypy separately for each file.  Otherwise, it
>> -    # will interpret all given files as belonging together (i.e., they
>> -    # may not both define the same classes, etc.; most notably, they
>> -    # must not both define the __main__ module).
>>       env['MYPYPATH'] = env['PYTHONPATH']
>> -    for filename in files:
>> -        p = subprocess.run(('mypy',
>> -                            '--warn-unused-configs',
>> -                            '--disallow-subclassing-any',
>> -                            '--disallow-any-generics',
>> -                            '--disallow-incomplete-defs',
>> -                            '--disallow-untyped-decorators',
>> -                            '--no-implicit-optional',
>> -                            '--warn-redundant-casts',
>> -                            '--warn-unused-ignores',
>> -                            '--no-implicit-reexport',
>> -                            '--namespace-packages',
>> -                            filename),
>> -                           env=env,
>> -                           check=False,
>> -                           stdout=subprocess.PIPE,
>> -                           stderr=subprocess.STDOUT,
>> -                           universal_newlines=True)
>> -        if p.returncode != 0:
>> -            print(p.stdout)
>> +    for linter in ('pylint-3', 'mypy'):
>> +        if shutil.which(linter) is None:
>> +            iotests.notrun(f'{linter} not found')
>> +    iotests.script_main(lambda: linters.run_linters(files, env=env))
> 
> Why to use lambda, and not just pass main to script_main?
> 

No strong reason, just a messy draft. I can clean it up as you suggest.

> Or, may be, use iotests.script_initialize() at top, and keep the whole 
> script at top indentation level?

That works too, but it's more churn.

---

I need to look into the mypy invocation and see if I can't figure out a 
way for it to work for everything at once instead of needing to run one 
at a time. Maybe that's something to worry about later, though.

Eventually, the custom linter invocation here should be stored in more 
traditional configuration files (pylintrc, mypy.ini) as much as is possible.

The environment hacking stuff will need to remain here as long as 
iotests does not run in a virtual environment, however. I'd like to 
eventually change that, too.

--js


