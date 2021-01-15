Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332472F7820
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 12:59:48 +0100 (CET)
Received: from localhost ([::1]:34526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Nlb-0004Aw-13
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 06:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0Njb-00032i-8i
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 06:57:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0NjZ-000850-6F
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 06:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610711860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k0zSp/N3tYU3Mys6L33neFMiC73EZ/6anGxXrsbyoZM=;
 b=Xj+wjjB2mPSluOXFbdwhepWl5KpXxxTFsTmb1JAJ1lhetTQxQ/S1EuKE5rJqofyNhhHiZK
 FYhOQRKjQwPFao2cI9teYJdnVSnQgg7RUO/t6ptSVqr2dVYj5NkWXbm2JxFlAJCHbm7i4e
 oDpiAmiyRm/jPVnWtUyC68POR50lKj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-DpdNMNj3PaO-ElrfV-4rgw-1; Fri, 15 Jan 2021 06:57:36 -0500
X-MC-Unique: DpdNMNj3PaO-ElrfV-4rgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2C721927800;
 Fri, 15 Jan 2021 11:57:35 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-144.ams2.redhat.com
 [10.36.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DCD16E71E;
 Fri, 15 Jan 2021 11:57:34 +0000 (UTC)
Subject: Re: [PATCH v3 02/10] iotests/297: Rewrite in Python and extend reach
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-3-mreitz@redhat.com>
 <a6000188-ec04-e681-3e59-4e2e7be44574@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <8c975a86-516e-bdcb-7bc8-9f90dc71eba2@redhat.com>
Date: Fri, 15 Jan 2021 12:57:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a6000188-ec04-e681-3e59-4e2e7be44574@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.01.21 12:13, Vladimir Sementsov-Ogievskiy wrote:
> 14.01.2021 20:02, Max Reitz wrote:
>> Instead of checking iotests.py only, check all Python files in the
>> qemu-iotests/ directory.  Of course, most of them do not pass, so there
>> is an extensive skip list for now.  (The only files that do pass are
>> 209, 254, 283, and iotests.py.)
>>
>> (Alternatively, we could have the opposite, i.e. an explicit list of
>> files that we do want to check, but I think it is better to check files
>> by default.)
>>
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
>> - Passing --notes=FIXME,XXX to pylint suppresses warnings for TODO
>>    comments.  TODO is fine, we do not need 297 to complain about such
>>    comments.
>>
>> - The "Success" line from mypy's output is suppressed, because (A) it
>>    does not add useful information, and (B) it would leak information
>>    about the files having been tested to the reference output, which we
>>    decidedly do not want.
>>
>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/297     | 109 +++++++++++++++++++++++++++++--------
>>   tests/qemu-iotests/297.out |   5 +-
>>   2 files changed, 89 insertions(+), 25 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
>> index 5c5420712b..bfa26d280b 100755
>> --- a/tests/qemu-iotests/297
>> +++ b/tests/qemu-iotests/297
>> @@ -1,4 +1,4 @@
>> -#!/usr/bin/env bash
>> +#!/usr/bin/env python3
>>   #
>>   # Copyright (C) 2020 Red Hat, Inc.
>>   #
>> @@ -15,30 +15,95 @@
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
>> +        except UnicodeDecodeError: # Ignore binary files
> 
> PEP8 asks for two spaces before inline comment

Wow.  I really hate PEP8.

>> +            return False
>> +
> 
> and two empty lines here
> 
> (good ALE vim plugin runs flake8, mypy and pylint asynchronously for me 
> and shows these things)

I’d like to argue that that isn’t good, but I need to quench my anger. 
Perhaps one day I can quench it sufficiently to install ALE myself.

>> +def run_linters():
>> +    files = [filename for filename in (set(os.listdir('.')) - 
>> set(SKIP_FILES))
>> +             if is_python_file(filename)]
>> +
>> +    iotests.logger.debug('Files to be checked:')
>> +    iotests.logger.debug(', '.join(sorted(files)))
> 
> O, good.
> 
>> +
>> +    print('=== pylint ===')
>> +    sys.stdout.flush()
> 
> Should not hurt.. But why? Should be flushed anyway as print will put a 
> '\n'.. And why you care about it at all?

When pylint fails, I can see its result above the '=== pylint ===' line, 
even though its output is on stdout.  I suspect the Python output indeed 
isn’t flushed on \n.

(Test it by dropping the flush(), and then also e.g. 041 from the ignore 
list.  Perhaps you get a different result, but for me, the errors appear 
above the '=== pylint ===' line.)

>> +
>> +    # Todo notes are fine, but fixme's or xxx's should probably just be
>> +    # fixed (in tests, at least)
>> +    env = os.environ
>> +    try:
>> +        env['PYTHONPATH'] += ':../../python/'
>> +    except KeyError:
>> +        env['PYTHONPATH'] = '../../python/'
>> +    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', 
>> *files),
>> +                   env=env, check=False)
> 
> as I understand, you don't need env argument, as os.environ is inherited 
> by default.

Yes, but os.environ['PYTHONPATH'] doesn’t include ../../python/, which 
is why I copy it.

On second though, I don’t copy it.  I think the “env = os.environ” line 
should be “env = os.environ.copy()”, actually, or I’ll modify 297’s own 
PYTHONPATH.

>> +
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
>> +                           text=True)
> 
> Can you really use "text" ? We require python 3.6 (in check), but text 
> comes from 3.7..

Oh well.  My fault for just reading the current docs.

> It may break some test environments. I think we need old good 
> universal_newlines=True which is the same.

Good enough for me.

> With s/text/universal_newlines/:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks!  I’ll clean up the PEP8 violations, make the “env = os.environ” 
line an “env = os.environ.copy()”, and use universal_newlines here.

Max


