Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8EE3058B1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 11:44:14 +0100 (CET)
Received: from localhost ([::1]:37424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4iJ3-0007KC-Mv
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 05:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4iHM-0006aY-9u
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:42:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4iHJ-0005Xm-Rg
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:42:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611744145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+rvM1s0QCaP/ttYaXl9RPhiVl8ipF1zz32hAit3krg=;
 b=F8MQwdDKTl5uDehVIR31hqF00uAA8CMNdtm9C8YT2cIQ/++1pVCGingCtKqtB+9dPgyTSk
 wJCAU6otaj18TR24h6cwOZKKP5wY9qaFSI5Ye+1udhMAmgvByQWjxOiI0j0408/YXnCzds
 J5ZQQR6AU1bJaa645loLeEdSNCXgPX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-kzGP4UDhNAmyG8C1e230rQ-1; Wed, 27 Jan 2021 05:42:22 -0500
X-MC-Unique: kzGP4UDhNAmyG8C1e230rQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08617107ACE8;
 Wed, 27 Jan 2021 10:42:21 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-48.ams2.redhat.com
 [10.36.114.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 204FA60C05;
 Wed, 27 Jan 2021 10:42:17 +0000 (UTC)
Subject: Re: [PATCH v5 02/10] iotests/297: Rewrite in Python and extend reach
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
References: <20210118105720.14824-1-mreitz@redhat.com>
 <20210118105720.14824-3-mreitz@redhat.com>
 <9fc8e6b5-bac8-6fa5-6e10-7440c7e70b37@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <4d48e168-24b3-e025-f293-563c485a6419@redhat.com>
Date: Wed, 27 Jan 2021 11:42:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <9fc8e6b5-bac8-6fa5-6e10-7440c7e70b37@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.01.21 22:28, John Snow wrote:
> On 1/18/21 5:57 AM, Max Reitz wrote:
>> Instead of checking iotests.py only, check all Python files in the
>> qemu-iotests/ directory.  Of course, most of them do not pass, so there
>> is an extensive skip list for now.  (The only files that do pass are
>> 209, 254, 283, and iotests.py.)
>>
> 
> Chiming in to say that I tried to tackle this before; I wrote some 
> preliminary cleanups and sent to the list as an "WIP RFC" or something 
> like that in earlyish 2020. I paid attention to qed.py and the other 
> non-numerical files.
> 
> Maybe badly rotted by now, I don't know.
> 
>> (Alternatively, we could have the opposite, i.e. an explicit list of
>> files that we do want to check, but I think it is better to check files
>> by default.)
>>
> 
> I agree. Stop the bleeding first and worry about the rest after.
> 
>> Unless started in debug mode (./check -d), the output has no information
>> on which files are tested, so we will not have a problem e.g. with
>> backports, where some files may be missing when compared to upstream.
>>
>> Besides the technical rewrite, some more things are changed:
>>
>> - For the pylint invocation, PYTHONPATH is adjusted.  This mirrors
>>    setting MYPYPATH for mypy.
>>
>> - Also, MYPYPATH is now derived from PYTHONPATH, so that we include
>>    paths set by the environment.  Maybe at some point we want to let the
>>    check script add '../../python/' to PYTHONPATH so that iotests.py does
>>    not need to do that.
>>
> 
> Does this solve an observed problem, or is it preventative? I ran into 
> trouble once by pointing mypy to my system python libraries; it seemed 
> to have a check that explicitly warned me against such tricks.

Yes, that happens when you derive it from sys.path.  (Which I tried at 
one point, and then ran into that exact problem.)

PYTHONPATH generally doesn’t include the system libraries, though, 
generally it shouldn’t even be set for the iotests.  So the only thing 
that’s put in there is ../../python/, and we need that in MYPYPATH, too.

(As I wrote, perhaps in the future the check script will add 
../../python/, so we don’t need to do that anywhere in the iotests, and 
then it makes more sense why MYPYPATH should just be $PYTHONPATH.)

> I guess for now, if it works, it works. :o)
> 
>> - Passing --notes=FIXME,XXX to pylint suppresses warnings for TODO
>>    comments.  TODO is fine, we do not need 297 to complain about such
>>    comments.
>>
> 
> Agreed. You can also edit pylintrc to choose which keywords trigger the 
> check -- "TODO" is probably fine, but "FIXME" is maybe a shade worse. 
> Season to taste.

Yes, definitely a matter of taste.  I kind of like pylint to complain 
about TODO when I’m running it explicitly, so, well.

>> - The "Success" line from mypy's output is suppressed, because (A) it
>>    does not add useful information, and (B) it would leak information
>>    about the files having been tested to the reference output, which we
>>    decidedly do not want.
>>
>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/297     | 112 +++++++++++++++++++++++++++++--------
>>   tests/qemu-iotests/297.out |   5 +-
>>   2 files changed, 92 insertions(+), 25 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
>> index 5c5420712b..e3db3e061e 100755
>> --- a/tests/qemu-iotests/297
>> +++ b/tests/qemu-iotests/297
>> @@ -1,4 +1,4 @@
>> -#!/usr/bin/env bash
>> +#!/usr/bin/env python3
>>   #
>>   # Copyright (C) 2020 Red Hat, Inc.
> 
> You could bump it up, if you wanted.

Do I, though? :)

>>   #
>> @@ -15,30 +15,98 @@
>>   # You should have received a copy of the GNU General Public License
>>   # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> -seq=$(basename $0)
>> -echo "QA output created by $seq"
>> +import os
>> +import re
>> +import shutil
>> +import subprocess
>> +import sys
>> -status=1    # failure is the default!
>> +import iotests
>> -# get standard environment
>> -. ./common.rc
>> -if ! type -p "pylint-3" > /dev/null; then
>> -    _notrun "pylint-3 not found"
>> -fi
>> -if ! type -p "mypy" > /dev/null; then
>> -    _notrun "mypy not found"
>> -fi
>> +# TODO: Empty this list!
>> +SKIP_FILES = (
>> +    '030', '040', '041', '044', '045', '055', '056', '057', '065', 
>> '093',
>> +    '096', '118', '124', '129', '132', '136', '139', '147', '148', 
>> '149',
>> +    '151', '152', '155', '163', '165', '169', '194', '196', '199', 
>> '202',
>> +    '203', '205', '206', '207', '208', '210', '211', '212', '213', 
>> '216',
>> +    '218', '219', '222', '224', '228', '234', '235', '236', '237', 
>> '238',
>> +    '240', '242', '245', '246', '248', '255', '256', '257', '258', 
>> '260',
>> +    '262', '264', '266', '274', '277', '280', '281', '295', '296', 
>> '298',
>> +    '299', '300', '302', '303', '304', '307',
>> +    'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
>> +)
>> -pylint-3 --score=n iotests.py
>> -MYPYPATH=../../python/ mypy --warn-unused-configs 
>> --disallow-subclassing-any \
>> -    --disallow-any-generics --disallow-incomplete-defs \
>> -    --disallow-untyped-decorators --no-implicit-optional \
>> -    --warn-redundant-casts --warn-unused-ignores \
>> -    --no-implicit-reexport iotests.py
>> +def is_python_file(filename):
>> +    if not os.path.isfile(filename):
>> +        return False
>> -# success, all done
>> -echo "*** done"
>> -rm -f $seq.full
>> -status=0
>> +    if filename.endswith('.py'):
>> +        return True
>> +
>> +    with open(filename) as f:
>> +        try:
>> +            first_line = f.readline()
>> +            return re.match('^#!.*python', first_line) is not None
>> +        except UnicodeDecodeError:  # Ignore binary files
>> +            return False
>> +
>> +
> 
> 
>> +def run_linters():
>> +    files = [filename for filename in (set(os.listdir('.')) - 
>> set(SKIP_FILES))
>> +             if is_python_file(filename)]
>> +
>> +    iotests.logger.debug('Files to be checked:')
>> +    iotests.logger.debug(', '.join(sorted(files)))
>> +
>> +    print('=== pylint ===')
>> +    sys.stdout.flush()
>> +
>> +    # Todo notes are fine, but fixme's or xxx's should probably just be
>> +    # fixed (in tests, at least)
>> +    env = os.environ.copy()
>> +    qemu_module_path = os.path.join(os.path.dirname(__file__),
>> +                                    '..', '..', 'python')
>> +    try:
>> +        env['PYTHONPATH'] += os.pathsep + qemu_module_path
>> +    except KeyError:
>> +        env['PYTHONPATH'] = qemu_module_path
>> +    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', 
>> *files),
>> +                   env=env, check=False)
>> +
> 
> Is there a reason to use 'pylint-3' here? I realize that this is not 
> something you are introducing, but it jogged the question loose for me.
> 
> 'pylint-3' is, I believe, a fedora-ism. The pip package for pylint 
> installs only a 'pylint' script. It might be better to just use it 
> without the suffix.
> 
> If we are concerned about accidentally invoking a python 2 version of 
> pylint that might be installed on a system, I'd then recommend doing 
> something like this:
> 
> 'python3 -m pylint [...]'

Sounds reasonable to me (can’t find pylint-3 on Arch, for example).  As 
a follow-up, that is, because I’m afraid I’ve already put this series in 
a pull request...

Max

>> +    print('=== mypy ===')
>> +    sys.stdout.flush()
>> +
>> +    # We have to call mypy separately for each file.  Otherwise, it
>> +    # will interpret all given files as belonging together (i.e., they
>> +    # may not both define the same classes, etc.; most notably, they
>> +    # must not both define the __main__ module).
>> +    env['MYPYPATH'] = env['PYTHONPATH']
>> +    for filename in files:
>> +        p = subprocess.run(('mypy',
>> +                            '--warn-unused-configs',
>> +                            '--disallow-subclassing-any',
>> +                            '--disallow-any-generics',
>> +                            '--disallow-incomplete-defs',
>> +                            '--disallow-untyped-decorators',
>> +                            '--no-implicit-optional',
>> +                            '--warn-redundant-casts',
>> +                            '--warn-unused-ignores',
>> +                            '--no-implicit-reexport',
>> +                            filename),
>> +                           env=env,
>> +                           check=False,
>> +                           stdout=subprocess.PIPE,
>> +                           stderr=subprocess.STDOUT,
>> +                           universal_newlines=True)
>> +
>> +        if p.returncode != 0:
>> +            print(p.stdout)
>> +
>> +
>> +for linter in ('pylint-3', 'mypy'):
>> +    if shutil.which(linter) is None:
>> +        iotests.notrun(f'{linter} not found')
>> +
>> +iotests.script_main(run_linters)
>> diff --git a/tests/qemu-iotests/297.out b/tests/qemu-iotests/297.out
>> index 6acc843649..f2e1314d10 100644
>> --- a/tests/qemu-iotests/297.out
>> +++ b/tests/qemu-iotests/297.out
>> @@ -1,3 +1,2 @@
>> -QA output created by 297
>> -Success: no issues found in 1 source file
>> -*** done
>> +=== pylint ===
>> +=== mypy ===
>>
> 
> Reviewed-by: John Snow <jsnow@redhat.com>


