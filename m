Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD843498A4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:52:36 +0100 (CET)
Received: from localhost ([::1]:38520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPU9r-0005qb-66
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPU6D-0004lj-V6
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPU69-0003yd-Dt
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616694522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Aw3ED6+VQFXgiFtkj3E2Go0lIR4C6L8scVXcT+jxKY=;
 b=VFx9C6xoAuoRF+VOgeIXa5dM2s5c4HutWHitWhLo3HqrUxM7LGc6+DAbNU/pQVnmtwFfSp
 UDBqwN6UV0M1R8CrdQbAtbFAw7vl4P7FnTvM02ao5K2FLt3kLvzsD4mUW5qvyo5bT5uj6O
 rYT1xYessG9L9j09JKSIwd/zlhPlzao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-L5vV0l0ZPoKoabss1Da_gQ-1; Thu, 25 Mar 2021 13:48:40 -0400
X-MC-Unique: L5vV0l0ZPoKoabss1Da_gQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0531A81A281;
 Thu, 25 Mar 2021 17:48:39 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CC065D9D0;
 Thu, 25 Mar 2021 17:48:34 +0000 (UTC)
Subject: Re: [PATCH 10/28] qapi: Rework name checking in preparation of
 stricter checking
To: Markus Armbruster <armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-11-armbru@redhat.com>
 <bc06289e-87f9-3f44-a004-07c2f6327264@redhat.com>
 <87v99hf60v.fsf@dusky.pond.sub.org>
 <128c8d73-e16c-cc74-4ab8-b7ef7818e0fc@redhat.com>
 <87im5fah92.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <6b74a262-10c1-a857-00dd-736d29eec23f@redhat.com>
Date: Thu, 25 Mar 2021 13:48:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87im5fah92.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: michael.roth@amd.com, qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 2:18 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 3/24/21 1:57 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> On 3/23/21 5:40 AM, Markus Armbruster wrote:
>>>>> Naming rules differ for the various kinds of names.  To prepare
>>>>> enforcing them, define functions to check them: check_name_upper(),
>>>>> check_name_lower(), and check_name_camel().  For now, these merely
>>>>> wrap around check_name_str(), but that will change shortly.  Replace
>>>>> the other uses of check_name_str() by appropriate uses of the
>>>>> wrappers.  No change in behavior just yet.
>>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>>> ---
>>>>>     scripts/qapi/expr.py | 51 +++++++++++++++++++++++++++++++-------------
>>>>>     1 file changed, 36 insertions(+), 15 deletions(-)
>>>>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>>>>> index e00467636c..30285fe334 100644
>>>>> --- a/scripts/qapi/expr.py
>>>>> +++ b/scripts/qapi/expr.py
>>>>> @@ -21,11 +21,12 @@
>>>>>     from .error import QAPISemError
>>>>>       -# Names must be letters, numbers, -, and _.  They must start
>>>>> with letter,
>>>>> -# except for downstream extensions which must start with __RFQDN_.
>>>>> -# Dots are only valid in the downstream extension prefix.
>>>>> -valid_name = re.compile(r'^(__[a-zA-Z0-9.-]+_)?'
>>>>> -                        '[a-zA-Z][a-zA-Z0-9_-]*$')
>>>>> +# Names consist of letters, digits, -, and _, starting with a letter.
>>>>> +# An experimental name is prefixed with x-.  A name of a downstream
>>>>> +# extension is prefixed with __RFQDN_.  The latter prefix goes first.
>>>>> +valid_name = re.compile(r'(__[a-z0-9.-]+_)?'
>>>>> +                        r'(x-)?'
>>>>> +                        r'([a-z][a-z0-9_-]*)$', re.IGNORECASE)
>>>>>          def check_name_is_str(name, info, source):
>>>>> @@ -37,16 +38,38 @@ def check_name_str(name, info, source,
>>>>>                        permit_upper=False):
>>>>>         # Reserve the entire 'q_' namespace for c_name(), and for 'q_empty'
>>>>>         # and 'q_obj_*' implicit type names.
>>>>> -    if not valid_name.match(name) or \
>>>>> -       c_name(name, False).startswith('q_'):
>>>>> +    match = valid_name.match(name)
>>>>> +    if not match or c_name(name, False).startswith('q_'):
>>>>>             raise QAPISemError(info, "%s has an invalid name" % source)
>>>>>         if not permit_upper and name.lower() != name:
>>>>>             raise QAPISemError(
>>>>>                 info, "%s uses uppercase in name" % source)
>>>>> +    return match.group(3)
>>>>> +
>>>>> +
>>>>> +def check_name_upper(name, info, source):
>>>>> +    stem = check_name_str(name, info, source, permit_upper=True)
>>>>> +    # TODO reject '[a-z-]' in @stem
>>>>> +
>>>>
>>>> Creates (presumably) temporary errors in flake8 for the dead
>>>> assignment here and below.
>>>
>>> All gone by the end of the series.
>>>
>>> "make check" and checkpatch were content.  Anything else you'd like me
>>> to run?
>>
>> Eventually it'll be part of CI, with targets to run locally.
>>
>> I never expected the process to take this long, so I did not invest my
>> time in developing an interim solution.
>>
>> I use a hastily written script to do my own testing, which I run for
>> every commit that touches QAPI:
>>
>> #!/usr/bin/env bash
>> set -e
>>
>> if [[ -f qapi/.flake8 ]]; then
>>      echo "flake8 --config=qapi/.flake8 qapi/"
>>      flake8 --config=qapi/.flake8 qapi/
>> fi
>> if [[ -f qapi/pylintrc ]]; then
>>      echo "pylint --rcfile=qapi/pylintrc qapi/"
>>      pylint --rcfile=qapi/pylintrc qapi/
>> fi
>> if [[ -f qapi/mypy.ini ]]; then
>>      echo "mypy --config-file=qapi/mypy.ini qapi/"
>>      mypy --config-file=qapi/mypy.ini qapi/
>> fi
>>
>> if [[ -f qapi/.isort.cfg ]]; then
>>      pushd qapi
>>      echo "isort -c ."
>>      isort -c .
>>      popd
>> fi
>>
>> pushd ../bin/git
>> make -j9
>> make check-qapi-schema
>> popd
> 
> Thanks for sharing this!
> 

My intent, eventually, was to get scripts/qapi under python/qemu/qapi; 
under which there is a testing framework thing I have been debating on 
and off with Cleber for a while that does (basically) the same thing as 
what my hasty script does, but more integrated with Python ecosystem.

It'll do a few things:

(1) Gets these checks on CI
(2) Allows developers to manually run the checks locally
(3) Allows developers to manually run the checks locally using a 
pre-determined set of pinned linter versions to guarantee synchronicity 
with CI

cd python/qemu && "make check" would do more or less the same as the 
hacky script above, "make venv-check" would create a virtual environment 
with precisely the right packages and then run the same.

I have been stalled there for a while, and I missed freeze deadline from 
illness. Anguish. For now, the dumb script in my scripts directory does 
the lifting I need it to, using packages I have selected in my local 
environment that just-so-happen to pass.

> Apropos qapi-gen testing scripts.  I have scripts to show me how the
> generated code changes along the way in a branch.  They evolved over a
> long time, and try to cope with changes in the tree that are hardly
> relevant anymore.  By now, they could quite possibly make Frankenstein
> recoil in horror.
> 

Are they in the tree? Largely if the generated code changes it's 
invisible to me, but I rely heavily on the unit tests. I guess maybe if 
they are not in a state to upstream it might not be worth the hassle to 
clean them, but I don't know.

> As a secondary purpose, the scripts show me how output of pycodestyle-3
> and pylint change.  This would be uninteresting if the code in master
> was clean against a useful configuration of these tools.  Your work has
> been making it less interesting.
> 

--js


