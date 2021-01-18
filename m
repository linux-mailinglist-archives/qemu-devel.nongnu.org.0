Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A302F9C32
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:11:11 +0100 (CET)
Received: from localhost ([::1]:53690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RV8-0008Vp-Ae
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1RTP-0007Eq-Jy
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:09:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1RTM-0002cs-F0
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610964559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tECtPI+tvRCsRvZZDSrrTa+R40PwK1owpFWaxNP7EQ0=;
 b=CXeRU5B7nTPvz/dKjfKIO6COA5XrTBwLmAz+7s0iQO+R8gtPi/o6hPIWrPaO2iW6nY4ajB
 kTHOYIE5+/nQaP55GH9YkwId2XlxYUQizVaMTxR5kNGk+CpdPYYMBxNMi3RYRYEulhK7Y1
 KmXRo7ozIz5SWLovEavnm+dZNgvd+30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-P_X_Zze3M-WfAKoG3r0wlw-1; Mon, 18 Jan 2021 05:09:15 -0500
X-MC-Unique: P_X_Zze3M-WfAKoG3r0wlw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2165C39387;
 Mon, 18 Jan 2021 10:09:14 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-253.ams2.redhat.com
 [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 866DA71C99;
 Mon, 18 Jan 2021 10:09:12 +0000 (UTC)
Subject: Re: [PATCH v4 02/10] iotests/297: Rewrite in Python and extend reach
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210115174315.30949-1-mreitz@redhat.com>
 <20210115174315.30949-3-mreitz@redhat.com>
 <CAKJDGDbf=bWEuR-LkOJNN5t9EDYR7kqcb-6DDBskX-aPntjhzg@mail.gmail.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d035e1e5-ac49-0410-743e-1c04134d9a65@redhat.com>
Date: Mon, 18 Jan 2021 11:09:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDbf=bWEuR-LkOJNN5t9EDYR7kqcb-6DDBskX-aPntjhzg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.01.21 20:27, Willian Rampazzo wrote:
> On Fri, Jan 15, 2021 at 2:43 PM Max Reitz <mreitz@redhat.com> wrote:
>>
>> Instead of checking iotests.py only, check all Python files in the
>> qemu-iotests/ directory.  Of course, most of them do not pass, so there
>> is an extensive skip list for now.  (The only files that do pass are
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
>> - For the pylint invocation, PYTHONPATH is adjusted.  This mirrors
>>    setting MYPYPATH for mypy.
>>
>> - Also, MYPYPATH is now derived from PYTHONPATH, so that we include
>>    paths set by the environment.  Maybe at some point we want to let the
>>    check script add '../../python/' to PYTHONPATH so that iotests.py does
>>    not need to do that.
>>
>> - Passing --notes=FIXME,XXX to pylint suppresses warnings for TODO
>>    comments.  TODO is fine, we do not need 297 to complain about such
>>    comments.
>>
>> - The "Success" line from mypy's output is suppressed, because (A) it
>>    does not add useful information, and (B) it would leak information
>>    about the files having been tested to the reference output, which we
>>    decidedly do not want.
>>
>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/297     | 110 +++++++++++++++++++++++++++++--------
>>   tests/qemu-iotests/297.out |   5 +-
>>   2 files changed, 90 insertions(+), 25 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
>> index 5c5420712b..fa9e2cac78 100755
>> --- a/tests/qemu-iotests/297
>> +++ b/tests/qemu-iotests/297
>> @@ -1,4 +1,4 @@
>> -#!/usr/bin/env bash
>> +#!/usr/bin/env python3
>>   #
>>   # Copyright (C) 2020 Red Hat, Inc.
>>   #
>> @@ -15,30 +15,96 @@
>>   # You should have received a copy of the GNU General Public License
>>   # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>
>> -seq=$(basename $0)
>> -echo "QA output created by $seq"
>> +import os
>> +import re
>> +import shutil
>> +import subprocess
>> +import sys
>>
>> -status=1       # failure is the default!
>> +import iotests
>>
>> -# get standard environment
>> -. ./common.rc
>>
>> -if ! type -p "pylint-3" > /dev/null; then
>> -    _notrun "pylint-3 not found"
>> -fi
>> -if ! type -p "mypy" > /dev/null; then
>> -    _notrun "mypy not found"
>> -fi
>> +# TODO: Empty this list!
>> +SKIP_FILES = (
>> +    '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
>> +    '096', '118', '124', '129', '132', '136', '139', '147', '148', '149',
>> +    '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
>> +    '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
>> +    '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
>> +    '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
>> +    '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
>> +    '299', '300', '302', '303', '304', '307',
>> +    'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
>> +)
>>
>> -pylint-3 --score=n iotests.py
>>
>> -MYPYPATH=../../python/ mypy --warn-unused-configs --disallow-subclassing-any \
>> -    --disallow-any-generics --disallow-incomplete-defs \
>> -    --disallow-untyped-decorators --no-implicit-optional \
>> -    --warn-redundant-casts --warn-unused-ignores \
>> -    --no-implicit-reexport iotests.py
>> +def is_python_file(filename):
>> +    if not os.path.isfile(filename):
>> +        return False
>>
>> -# success, all done
>> -echo "*** done"
>> -rm -f $seq.full
>> -status=0
>> +    if filename.endswith('.py'):
>> +        return True
>> +
>> +    with open(filename) as f:
>> +        try:
>> +            first_line = f.readline()
>> +            return re.match('^#!.*python', first_line) is not None
>> +        except UnicodeDecodeError:  # Ignore binary files
>> +            return False
>> +
>> +
>> +def run_linters():
>> +    files = [filename for filename in (set(os.listdir('.')) - set(SKIP_FILES))
>> +             if is_python_file(filename)]
>> +
>> +    iotests.logger.debug('Files to be checked:')
>> +    iotests.logger.debug(', '.join(sorted(files)))
>> +
>> +    print('=== pylint ===')
>> +    sys.stdout.flush()
>> +
>> +    # Todo notes are fine, but fixme's or xxx's should probably just be
>> +    # fixed (in tests, at least)
>> +    env = os.environ.copy()
>> +    try:
>> +        env['PYTHONPATH'] += ':../../python/'
> 
> Do you have any objection to using os.path.dirname and os.path.join
> here? This would make the code more pythonic.

Intuitively, I felt a bit uneasy about os.path.join here, because it 
would make it look like this was platform-independent, when it is not: 
The colon as a PATH separator is probably more platform-dependent than 
the slashes.

So turns out there is os.pathsep, which yields a colon on e.g. Linux and 
a semicolon on e.g. Windows.

I wondered if

   env['PYTHONPATH'] = os.pathsep.join(sys.path)

wouldn’t be the most simple solution, but seems like mypy doesn’t like 
that very much for the MYPYPATH.  Too bad.

Guess the try-except block will have to remain, then.
(Just with os.pathsep instead of a colon, and with 
os.path.join(os.path.dirname(__file__), ...).)

Max


