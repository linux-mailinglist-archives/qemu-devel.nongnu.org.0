Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7E348940
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:40:45 +0100 (CET)
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJfb-0002ss-05
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPJKD-00048d-C6
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:18:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPJK8-00074C-8S
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:18:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616653106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9zOfGTHmTAQpOjLfpx7QrWhkciSVGG0M5wzS1ffINBU=;
 b=JwfnsRF5LdcALgd4TsgsmB71VR55V7eA/L9BjicGE4FmVbUDyEI0wT2+AppYphnR3IOSjN
 8vhEew484we7nzQKhyE7MNVb0G/JOULBVU3b+2Z1UsXhXTNqqniC+8ur9Euo/s67XR+uBi
 X5H/O+QWmJIXRUniLjD3PZuI7zv4YTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-ptx9aMnmOIqSdG_1HH0cNA-1; Thu, 25 Mar 2021 02:18:24 -0400
X-MC-Unique: ptx9aMnmOIqSdG_1HH0cNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E249E612A9;
 Thu, 25 Mar 2021 06:18:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE7437094D;
 Thu, 25 Mar 2021 06:18:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 83CC011327E1; Thu, 25 Mar 2021 07:18:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 10/28] qapi: Rework name checking in preparation of
 stricter checking
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-11-armbru@redhat.com>
 <bc06289e-87f9-3f44-a004-07c2f6327264@redhat.com>
 <87v99hf60v.fsf@dusky.pond.sub.org>
 <128c8d73-e16c-cc74-4ab8-b7ef7818e0fc@redhat.com>
Date: Thu, 25 Mar 2021 07:18:17 +0100
In-Reply-To: <128c8d73-e16c-cc74-4ab8-b7ef7818e0fc@redhat.com> (John Snow's
 message of "Wed, 24 Mar 2021 16:11:20 -0400")
Message-ID: <87im5fah92.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

John Snow <jsnow@redhat.com> writes:

> On 3/24/21 1:57 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> On 3/23/21 5:40 AM, Markus Armbruster wrote:
>>>> Naming rules differ for the various kinds of names.  To prepare
>>>> enforcing them, define functions to check them: check_name_upper(),
>>>> check_name_lower(), and check_name_camel().  For now, these merely
>>>> wrap around check_name_str(), but that will change shortly.  Replace
>>>> the other uses of check_name_str() by appropriate uses of the
>>>> wrappers.  No change in behavior just yet.
>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>> ---
>>>>    scripts/qapi/expr.py | 51 +++++++++++++++++++++++++++++++-------------
>>>>    1 file changed, 36 insertions(+), 15 deletions(-)
>>>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>>>> index e00467636c..30285fe334 100644
>>>> --- a/scripts/qapi/expr.py
>>>> +++ b/scripts/qapi/expr.py
>>>> @@ -21,11 +21,12 @@
>>>>    from .error import QAPISemError
>>>>      -# Names must be letters, numbers, -, and _.  They must start
>>>> with letter,
>>>> -# except for downstream extensions which must start with __RFQDN_.
>>>> -# Dots are only valid in the downstream extension prefix.
>>>> -valid_name = re.compile(r'^(__[a-zA-Z0-9.-]+_)?'
>>>> -                        '[a-zA-Z][a-zA-Z0-9_-]*$')
>>>> +# Names consist of letters, digits, -, and _, starting with a letter.
>>>> +# An experimental name is prefixed with x-.  A name of a downstream
>>>> +# extension is prefixed with __RFQDN_.  The latter prefix goes first.
>>>> +valid_name = re.compile(r'(__[a-z0-9.-]+_)?'
>>>> +                        r'(x-)?'
>>>> +                        r'([a-z][a-z0-9_-]*)$', re.IGNORECASE)
>>>>         def check_name_is_str(name, info, source):
>>>> @@ -37,16 +38,38 @@ def check_name_str(name, info, source,
>>>>                       permit_upper=False):
>>>>        # Reserve the entire 'q_' namespace for c_name(), and for 'q_empty'
>>>>        # and 'q_obj_*' implicit type names.
>>>> -    if not valid_name.match(name) or \
>>>> -       c_name(name, False).startswith('q_'):
>>>> +    match = valid_name.match(name)
>>>> +    if not match or c_name(name, False).startswith('q_'):
>>>>            raise QAPISemError(info, "%s has an invalid name" % source)
>>>>        if not permit_upper and name.lower() != name:
>>>>            raise QAPISemError(
>>>>                info, "%s uses uppercase in name" % source)
>>>> +    return match.group(3)
>>>> +
>>>> +
>>>> +def check_name_upper(name, info, source):
>>>> +    stem = check_name_str(name, info, source, permit_upper=True)
>>>> +    # TODO reject '[a-z-]' in @stem
>>>> +
>>>
>>> Creates (presumably) temporary errors in flake8 for the dead
>>> assignment here and below.
>> 
>> All gone by the end of the series.
>> 
>> "make check" and checkpatch were content.  Anything else you'd like me
>> to run?
>
> Eventually it'll be part of CI, with targets to run locally.
>
> I never expected the process to take this long, so I did not invest my
> time in developing an interim solution.
>
> I use a hastily written script to do my own testing, which I run for
> every commit that touches QAPI:
>
> #!/usr/bin/env bash
> set -e
>
> if [[ -f qapi/.flake8 ]]; then
>     echo "flake8 --config=qapi/.flake8 qapi/"
>     flake8 --config=qapi/.flake8 qapi/
> fi
> if [[ -f qapi/pylintrc ]]; then
>     echo "pylint --rcfile=qapi/pylintrc qapi/"
>     pylint --rcfile=qapi/pylintrc qapi/
> fi
> if [[ -f qapi/mypy.ini ]]; then
>     echo "mypy --config-file=qapi/mypy.ini qapi/"
>     mypy --config-file=qapi/mypy.ini qapi/
> fi
>
> if [[ -f qapi/.isort.cfg ]]; then
>     pushd qapi
>     echo "isort -c ."
>     isort -c .
>     popd
> fi
>
> pushd ../bin/git
> make -j9
> make check-qapi-schema
> popd

Thanks for sharing this!

Apropos qapi-gen testing scripts.  I have scripts to show me how the
generated code changes along the way in a branch.  They evolved over a
long time, and try to cope with changes in the tree that are hardly
relevant anymore.  By now, they could quite possibly make Frankenstein
recoil in horror.

As a secondary purpose, the scripts show me how output of pycodestyle-3
and pylint change.  This would be uninteresting if the code in master
was clean against a useful configuration of these tools.  Your work has
been making it less interesting.


