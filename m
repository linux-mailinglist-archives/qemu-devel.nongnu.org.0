Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226333144CD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:23:08 +0100 (CET)
Received: from localhost ([::1]:53358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Go6-0002eP-Tx
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l9D8k-0005rj-GO
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:28:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l9D8X-0006tD-W6
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612816071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ULhwcZUadh65t56AFLb8UXY3A3xnvKu5viAD5TGnZ5s=;
 b=R9/q4w3vKeObqya0XaUBAZ36Cc7hVs3sr66I4j/34Zr6MIGgmtp5npSOY84CNEA6Ja2W78
 DmGKMp+UTtTxivcrRNZadRqdYZs1OK0mXqgaorDKiS2tBMFvAfqBkKKuArs4SNBAVguRRb
 OpNTlGn6ZW2a6T2pQdTjxn7siE3dHlo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-AxvvgpSLP3y-YczaYzBVvw-1; Mon, 08 Feb 2021 15:27:49 -0500
X-MC-Unique: AxvvgpSLP3y-YczaYzBVvw-1
Received: by mail-qv1-f71.google.com with SMTP id dj13so11475494qvb.20
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 12:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ULhwcZUadh65t56AFLb8UXY3A3xnvKu5viAD5TGnZ5s=;
 b=e76PVJq5o89B2wZdISVHuHMAaaSKcQCULLOTvaciPCah/CimS9XMuRtvp/nVBUUtd3
 jRaUfLqzNvTvvykY1FdAfTJ0l1LES21WtWGtGMJonEj+TItkcsIJZpgn1J0NubVhi078
 ZDbCYlCDw1t6kHpBcnFrK5Wq77V2asecjBdiIoYr105J1SctDdXtmDmvmxtShO0PtTEk
 9NpteFGKV1f5vaSNGFNUvqkp2Hyf7VMMB+2ZWCc+0l+tc0x3xvHttC5daC96yTM7sAjT
 RCwTCNqgNuosQZIKoUIA2V6IDRZMdd+6uXSbNgjompNNmhTlCIx5LkjP/oI369Lg0pvF
 UuNQ==
X-Gm-Message-State: AOAM532A5LbpqFCqedEyNySzdrScVWGvZ6bbeGDAy3HTx/uhILPMQway
 ZKcViyLFPKmcqgJMJuIkHFx1Gbx8nzLT/NoSzV1AgJs6omPm4N6GeRYe0ud0d0kcodCAL7nvZrc
 v0bkeFtDh7X7hcl8=
X-Received: by 2002:a05:622a:552:: with SMTP id
 m18mr17085563qtx.207.1612816069141; 
 Mon, 08 Feb 2021 12:27:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0r9Z7ZtHWkwpkeRa/KBixjfaCRInnxGp2YR/ymAYBxMfrfLKnhD4dLb83rxiEeYUucRogIQ==
X-Received: by 2002:a05:622a:552:: with SMTP id
 m18mr17085535qtx.207.1612816068816; 
 Mon, 08 Feb 2021 12:27:48 -0800 (PST)
Received: from [192.168.1.108] ([177.194.2.130])
 by smtp.gmail.com with ESMTPSA id r4sm17442244qkf.112.2021.02.08.12.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 12:27:48 -0800 (PST)
Subject: Re: [PATCH v4 02/10] iotests/297: Rewrite in Python and extend reach
To: Max Reitz <mreitz@redhat.com>
References: <20210115174315.30949-1-mreitz@redhat.com>
 <20210115174315.30949-3-mreitz@redhat.com>
 <CAKJDGDbf=bWEuR-LkOJNN5t9EDYR7kqcb-6DDBskX-aPntjhzg@mail.gmail.com>
 <d035e1e5-ac49-0410-743e-1c04134d9a65@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Message-ID: <76c9768b-9fbd-15e8-f318-6b792ca8ce0b@redhat.com>
Date: Mon, 8 Feb 2021 17:27:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d035e1e5-ac49-0410-743e-1c04134d9a65@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/18/21 7:09 AM, Max Reitz wrote:
> On 15.01.21 20:27, Willian Rampazzo wrote:
>> On Fri, Jan 15, 2021 at 2:43 PM Max Reitz <mreitz@redhat.com> wrote:
>>>
>>> Instead of checking iotests.py only, check all Python files in the
>>> qemu-iotests/ directory.  Of course, most of them do not pass, so there
>>> is an extensive skip list for now.  (The only files that do pass are
>>> 209, 254, 283, and iotests.py.)
>>>
>>> (Alternatively, we could have the opposite, i.e. an explicit list of
>>> files that we do want to check, but I think it is better to check files
>>> by default.)
>>>
>>> Unless started in debug mode (./check -d), the output has no information
>>> on which files are tested, so we will not have a problem e.g. with
>>> backports, where some files may be missing when compared to upstream.
>>>
>>> Besides the technical rewrite, some more things are changed:
>>>
>>> - For the pylint invocation, PYTHONPATH is adjusted.  This mirrors
>>>    setting MYPYPATH for mypy.
>>>
>>> - Also, MYPYPATH is now derived from PYTHONPATH, so that we include
>>>    paths set by the environment.  Maybe at some point we want to let the
>>>    check script add '../../python/' to PYTHONPATH so that iotests.py 
>>> does
>>>    not need to do that.
>>>
>>> - Passing --notes=FIXME,XXX to pylint suppresses warnings for TODO
>>>    comments.  TODO is fine, we do not need 297 to complain about such
>>>    comments.
>>>
>>> - The "Success" line from mypy's output is suppressed, because (A) it
>>>    does not add useful information, and (B) it would leak information
>>>    about the files having been tested to the reference output, which we
>>>    decidedly do not want.
>>>
>>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   tests/qemu-iotests/297     | 110 +++++++++++++++++++++++++++++--------
>>>   tests/qemu-iotests/297.out |   5 +-
>>>   2 files changed, 90 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
>>> index 5c5420712b..fa9e2cac78 100755
>>> --- a/tests/qemu-iotests/297
>>> +++ b/tests/qemu-iotests/297
>>> @@ -1,4 +1,4 @@
>>> -#!/usr/bin/env bash
>>> +#!/usr/bin/env python3
>>>   #
>>>   # Copyright (C) 2020 Red Hat, Inc.
>>>   #
>>> @@ -15,30 +15,96 @@
>>>   # You should have received a copy of the GNU General Public License
>>>   # along with this program.  If not, see 
>>> <http://www.gnu.org/licenses/>.
>>>
>>> -seq=$(basename $0)
>>> -echo "QA output created by $seq"
>>> +import os
>>> +import re
>>> +import shutil
>>> +import subprocess
>>> +import sys
>>>
>>> -status=1       # failure is the default!
>>> +import iotests
>>>
>>> -# get standard environment
>>> -. ./common.rc
>>>
>>> -if ! type -p "pylint-3" > /dev/null; then
>>> -    _notrun "pylint-3 not found"
>>> -fi
>>> -if ! type -p "mypy" > /dev/null; then
>>> -    _notrun "mypy not found"
>>> -fi
>>> +# TODO: Empty this list!
>>> +SKIP_FILES = (
>>> +    '030', '040', '041', '044', '045', '055', '056', '057', '065', 
>>> '093',
>>> +    '096', '118', '124', '129', '132', '136', '139', '147', '148', 
>>> '149',
>>> +    '151', '152', '155', '163', '165', '169', '194', '196', '199', 
>>> '202',
>>> +    '203', '205', '206', '207', '208', '210', '211', '212', '213', 
>>> '216',
>>> +    '218', '219', '222', '224', '228', '234', '235', '236', '237', 
>>> '238',
>>> +    '240', '242', '245', '246', '248', '255', '256', '257', '258', 
>>> '260',
>>> +    '262', '264', '266', '274', '277', '280', '281', '295', '296', 
>>> '298',
>>> +    '299', '300', '302', '303', '304', '307',
>>> +    'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
>>> +)
>>>
>>> -pylint-3 --score=n iotests.py
>>>
>>> -MYPYPATH=../../python/ mypy --warn-unused-configs 
>>> --disallow-subclassing-any \
>>> -    --disallow-any-generics --disallow-incomplete-defs \
>>> -    --disallow-untyped-decorators --no-implicit-optional \
>>> -    --warn-redundant-casts --warn-unused-ignores \
>>> -    --no-implicit-reexport iotests.py
>>> +def is_python_file(filename):
>>> +    if not os.path.isfile(filename):
>>> +        return False
>>>
>>> -# success, all done
>>> -echo "*** done"
>>> -rm -f $seq.full
>>> -status=0
>>> +    if filename.endswith('.py'):
>>> +        return True
>>> +
>>> +    with open(filename) as f:
>>> +        try:
>>> +            first_line = f.readline()
>>> +            return re.match('^#!.*python', first_line) is not None
>>> +        except UnicodeDecodeError:  # Ignore binary files
>>> +            return False
>>> +
>>> +
>>> +def run_linters():
>>> +    files = [filename for filename in (set(os.listdir('.')) - 
>>> set(SKIP_FILES))
>>> +             if is_python_file(filename)]
>>> +
>>> +    iotests.logger.debug('Files to be checked:')
>>> +    iotests.logger.debug(', '.join(sorted(files)))
>>> +
>>> +    print('=== pylint ===')
>>> +    sys.stdout.flush()
>>> +
>>> +    # Todo notes are fine, but fixme's or xxx's should probably just be
>>> +    # fixed (in tests, at least)
>>> +    env = os.environ.copy()
>>> +    try:
>>> +        env['PYTHONPATH'] += ':../../python/'
>>
>> Do you have any objection to using os.path.dirname and os.path.join
>> here? This would make the code more pythonic.
> 
> Intuitively, I felt a bit uneasy about os.path.join here, because it 
> would make it look like this was platform-independent, when it is not: 
> The colon as a PATH separator is probably more platform-dependent than 
> the slashes.
> 
> So turns out there is os.pathsep, which yields a colon on e.g. Linux and 
> a semicolon on e.g. Windows.
> 
> I wondered if
> 
>    env['PYTHONPATH'] = os.pathsep.join(sys.path)
> 
> wouldn’t be the most simple solution, but seems like mypy doesn’t like 
> that very much for the MYPYPATH.  Too bad.
> 
> Guess the try-except block will have to remain, then.
> (Just with os.pathsep instead of a colon, and with 
> os.path.join(os.path.dirname(__file__), ...).)
> 
> Max
> 

Sorry to take so long to answer, I was on vacation. I see v5 was already 
merged. I took a look at it and the developed solution looks good, 
thanks for all your effort here.


