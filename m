Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E85E34E5AF
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 12:46:42 +0200 (CEST)
Received: from localhost ([::1]:42682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRBtR-0001fz-NE
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 06:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRBrb-00019Q-FQ
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:44:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRBrZ-00032h-GD
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617101084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lLp2FgdWmHGSTaf8gTtEwFCDIUA+oMqno4aKRqm/08=;
 b=fwwlFuADT2xCUTBlBkL74XD3WMdPjLsog8zKqyemV646+LydGCw47tj3qPt5smy4N1ybpJ
 mgsCmKM/0bFSG3BKl6023rEuOC70zePzapoemkDdEbGfiEGhxb0zGfGBGNsEarR3gVbJnN
 UrWMn88osX9XockaYADzXC+Tsl9Miqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-PrM17omhMyeOFbIpV0BjAw-1; Tue, 30 Mar 2021 06:44:42 -0400
X-MC-Unique: PrM17omhMyeOFbIpV0BjAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 942361966323;
 Tue, 30 Mar 2021 10:44:41 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-220.ams2.redhat.com
 [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 821E219CB2;
 Tue, 30 Mar 2021 10:44:39 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] qemu-iotests: let "check" spawn an arbitrary test
 command
From: Max Reitz <mreitz@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210326142359.431127-1-pbonzini@redhat.com>
 <20210326142359.431127-5-pbonzini@redhat.com>
 <57668708-22b3-f21f-e737-62bbe425f763@redhat.com>
 <51523e26-a184-9434-cb60-277c7b3c67d6@redhat.com>
Message-ID: <62c3d8c9-86d4-0fa1-1b43-881a84c852eb@redhat.com>
Date: Tue, 30 Mar 2021 12:44:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <51523e26-a184-9434-cb60-277c7b3c67d6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.03.21 12:38, Max Reitz wrote:
> On 26.03.21 16:05, Max Reitz wrote:
>> On 26.03.21 15:23, Paolo Bonzini wrote:
>>> Right now there is no easy way for "check" to print a reproducer 
>>> command.
>>> Because such a reproducer command line would be huge, we can instead 
>>> teach
>>> check to start a command of our choice.  This can be for example a 
>>> Python
>>> unit test with arguments to only run a specific subtest.
>>>
>>> Move the trailing empty line to print_env(), since it always looks 
>>> better
>>> and one caller was not adding it.
>>>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> Tested-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Message-Id: <20210323181928.311862-5-pbonzini@redhat.com>
>>> ---
>>>   tests/qemu-iotests/check         | 18 +++++++++++++++++-
>>>   tests/qemu-iotests/testenv.py    |  3 ++-
>>>   tests/qemu-iotests/testrunner.py |  1 -
>>>   3 files changed, 19 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
>>> index d1c87ceaf1..df9fd733ff 100755
>>> --- a/tests/qemu-iotests/check
>>> +++ b/tests/qemu-iotests/check
>>> @@ -19,6 +19,9 @@
>>>   import os
>>>   import sys
>>>   import argparse
>>> +import shutil
>>> +from pathlib import Path
>>> +
>>>   from findtests import TestFinder
>>>   from testenv import TestEnv
>>>   from testrunner import TestRunner
>>> @@ -101,7 +104,7 @@ def make_argparser() -> argparse.ArgumentParser:
>>>                          'rerun failed ./check command, starting from 
>>> the '
>>>                          'middle of the process.')
>>>       g_sel.add_argument('tests', metavar='TEST_FILES', nargs='*',
>>> -                       help='tests to run')
>>> +                       help='tests to run, or "--" followed by a 
>>> command')
>>>       return p
>>> @@ -114,6 +117,19 @@ if __name__ == '__main__':
>>>                     imgopts=args.imgopts, misalign=args.misalign,
>>>                     debug=args.debug, valgrind=args.valgrind)
>>> +    if len(sys.argv) > 1 and sys.argv[-len(args.tests)-1] == '--':
>>> +        if not args.tests:
>>> +            sys.exit("missing command after '--'")
>>> +        cmd = args.tests
>>> +        env.print_env()
>>> +        exec_path = Path(shutil.which(cmd[0]))
>>
>> 297 says:
>>
>> check:125: error: Argument 1 to "Path" has incompatible type 
>> "Optional[str]"; expected "Union[str, _PathLike[str]]"
>> Found 1 error in 1 file (checked 1 source file)
>>
>> Normally I’d assert this away, but actually I think the returned value 
>> should be checked and we should print an error if it’s None.  (Seems 
>> like shutil.which() doesn’t raise an exception if there is no such 
>> command, it just returns None.)
>>
>> Max
>>
>>> +        if exec_path is None:
>>> +            sys.exit('command not found: ' + cmd[0])
> 
> Oh, I see, the intent to print an error is actually there.  The problem 
> is just that Path(None) throws an exception, so we must check 
> shutil.which()’s return value.
> 
> I’ll squash this in if you don’t mind:
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index df9fd733ff..e2230f5612 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -122,9 +122,10 @@ if __name__ == '__main__':
>               sys.exit("missing command after '--'")
>           cmd = args.tests
>           env.print_env()
> -        exec_path = Path(shutil.which(cmd[0]))
> -        if exec_path is None:
> +        exec_pathstr = shutil.which(cmd[0])
> +        if exec_pathstr is None:
>               sys.exit('command not found: ' + cmd[0])
> +        exec_path = Path(exec_pathstr)
>           cmd[0] = exec_path.resolve()
>           full_env = env.prepare_subprocess(cmd)
>           os.chdir(Path(exec_path).parent)
> 
>>> +        cmd[0] = exec_path.resolve()
>>> +        full_env = env.prepare_subprocess(cmd)
>>> +        os.chdir(Path(exec_path).parent)

Oh, and this Path() does nothing, I presume, so I’m going to replace it 
with just “exec_path”.

Max

>>> +        os.execve(cmd[0], cmd, full_env)
>>> +
>>>       testfinder = TestFinder(test_dir=env.source_iotests)
>>>       groups = args.groups.split(',') if args.groups else None
>>> diff --git a/tests/qemu-iotests/testenv.py 
>>> b/tests/qemu-iotests/testenv.py
>>> index fca3a609e0..cd0e39b789 100644
>>> --- a/tests/qemu-iotests/testenv.py
>>> +++ b/tests/qemu-iotests/testenv.py
>>> @@ -284,7 +284,8 @@ def print_env(self) -> None:
>>>   PLATFORM      -- {platform}
>>>   TEST_DIR      -- {TEST_DIR}
>>>   SOCK_DIR      -- {SOCK_DIR}
>>> -SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
>>> +SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
>>> +"""
>>>           args = collections.defaultdict(str, self.get_env())
>>> diff --git a/tests/qemu-iotests/testrunner.py 
>>> b/tests/qemu-iotests/testrunner.py
>>> index 519924dc81..2f56ac545d 100644
>>> --- a/tests/qemu-iotests/testrunner.py
>>> +++ b/tests/qemu-iotests/testrunner.py
>>> @@ -316,7 +316,6 @@ def run_tests(self, tests: List[str]) -> bool:
>>>           if not self.makecheck:
>>>               self.env.print_env()
>>> -            print()
>>>           test_field_width = max(len(os.path.basename(t)) for t in 
>>> tests) + 2
>>>
>>
> 


