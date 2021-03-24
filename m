Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBD63482EF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:35:27 +0100 (CET)
Received: from localhost ([::1]:33112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPADu-0001HT-A6
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lP9qn-0000xX-Nk
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:11:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lP9ql-0001LM-NB
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616616690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6LXkDKXt4XFTfQTBKVtxWtCiaZGDAVCFztPiEL6exk=;
 b=Bps5eh9Fel0nHoF7HX+6k76zskPwbNFxsTHlVoONtgdsWnSsCbtTxJEVZXdpKCvbv6X+wR
 Qle3ATxZPhpd2GYNKx0vBbt13iSxBMobGjA1k1IcZbV0cRFhottbXDhGoZ+6RHu+6NhiNX
 AlXlBi0uD42Ywjr7pX/g7K///WqKPVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-3tbTzQ4SOQGM_ohDSsKaRw-1; Wed, 24 Mar 2021 16:11:27 -0400
X-MC-Unique: 3tbTzQ4SOQGM_ohDSsKaRw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7432C101F7D2;
 Wed, 24 Mar 2021 20:11:26 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D27196F7EF;
 Wed, 24 Mar 2021 20:11:21 +0000 (UTC)
Subject: Re: [PATCH 10/28] qapi: Rework name checking in preparation of
 stricter checking
To: Markus Armbruster <armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-11-armbru@redhat.com>
 <bc06289e-87f9-3f44-a004-07c2f6327264@redhat.com>
 <87v99hf60v.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <128c8d73-e16c-cc74-4ab8-b7ef7818e0fc@redhat.com>
Date: Wed, 24 Mar 2021 16:11:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87v99hf60v.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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

On 3/24/21 1:57 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 3/23/21 5:40 AM, Markus Armbruster wrote:
>>> Naming rules differ for the various kinds of names.  To prepare
>>> enforcing them, define functions to check them: check_name_upper(),
>>> check_name_lower(), and check_name_camel().  For now, these merely
>>> wrap around check_name_str(), but that will change shortly.  Replace
>>> the other uses of check_name_str() by appropriate uses of the
>>> wrappers.  No change in behavior just yet.
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>    scripts/qapi/expr.py | 51 +++++++++++++++++++++++++++++++-------------
>>>    1 file changed, 36 insertions(+), 15 deletions(-)
>>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>>> index e00467636c..30285fe334 100644
>>> --- a/scripts/qapi/expr.py
>>> +++ b/scripts/qapi/expr.py
>>> @@ -21,11 +21,12 @@
>>>    from .error import QAPISemError
>>>      
>>> -# Names must be letters, numbers, -, and _.  They must start with letter,
>>> -# except for downstream extensions which must start with __RFQDN_.
>>> -# Dots are only valid in the downstream extension prefix.
>>> -valid_name = re.compile(r'^(__[a-zA-Z0-9.-]+_)?'
>>> -                        '[a-zA-Z][a-zA-Z0-9_-]*$')
>>> +# Names consist of letters, digits, -, and _, starting with a letter.
>>> +# An experimental name is prefixed with x-.  A name of a downstream
>>> +# extension is prefixed with __RFQDN_.  The latter prefix goes first.
>>> +valid_name = re.compile(r'(__[a-z0-9.-]+_)?'
>>> +                        r'(x-)?'
>>> +                        r'([a-z][a-z0-9_-]*)$', re.IGNORECASE)
>>>      
>>>    def check_name_is_str(name, info, source):
>>> @@ -37,16 +38,38 @@ def check_name_str(name, info, source,
>>>                       permit_upper=False):
>>>        # Reserve the entire 'q_' namespace for c_name(), and for 'q_empty'
>>>        # and 'q_obj_*' implicit type names.
>>> -    if not valid_name.match(name) or \
>>> -       c_name(name, False).startswith('q_'):
>>> +    match = valid_name.match(name)
>>> +    if not match or c_name(name, False).startswith('q_'):
>>>            raise QAPISemError(info, "%s has an invalid name" % source)
>>>        if not permit_upper and name.lower() != name:
>>>            raise QAPISemError(
>>>                info, "%s uses uppercase in name" % source)
>>> +    return match.group(3)
>>> +
>>> +
>>> +def check_name_upper(name, info, source):
>>> +    stem = check_name_str(name, info, source, permit_upper=True)
>>> +    # TODO reject '[a-z-]' in @stem
>>> +
>>
>> Creates (presumably) temporary errors in flake8 for the dead
>> assignment here and below.
> 
> All gone by the end of the series.
> 
> "make check" and checkpatch were content.  Anything else you'd like me
> to run?
> 

Eventually it'll be part of CI, with targets to run locally.

I never expected the process to take this long, so I did not invest my 
time in developing an interim solution.

I use a hastily written script to do my own testing, which I run for 
every commit that touches QAPI:

#!/usr/bin/env bash
set -e

if [[ -f qapi/.flake8 ]]; then
     echo "flake8 --config=qapi/.flake8 qapi/"
     flake8 --config=qapi/.flake8 qapi/
fi
if [[ -f qapi/pylintrc ]]; then
     echo "pylint --rcfile=qapi/pylintrc qapi/"
     pylint --rcfile=qapi/pylintrc qapi/
fi
if [[ -f qapi/mypy.ini ]]; then
     echo "mypy --config-file=qapi/mypy.ini qapi/"
     mypy --config-file=qapi/mypy.ini qapi/
fi

if [[ -f qapi/.isort.cfg ]]; then
     pushd qapi
     echo "isort -c ."
     isort -c .
     popd
fi

pushd ../bin/git
make -j9
make check-qapi-schema
popd


