Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A8926FFDB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 16:30:17 +0200 (CEST)
Received: from localhost ([::1]:35846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJHOy-0007th-UN
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 10:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kJHM7-0005Th-8x
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 10:27:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33554
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kJHM4-0001wg-RR
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 10:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600439235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3T+5gNrcbPWykC9LndfK3pXZseVvk3vGtMBrwn6HcKo=;
 b=EIffLroAcROv8jw1Yqqs61ACEknz4cV3xVwfHZYubhzKdRwxyxUoDCiRqbect9vGKfirjB
 TYQ+jZ/A345Q+rUeWHVnTLcnnH0liiMN/oIADe8/Mo8yCZAE1TXQRM/fN4BTpYfDjwzDjc
 qneS9W0YI/os+/hioLgYIqndmYQ1x84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-jOkdxJTVNjCYwBv8akqsRw-1; Fri, 18 Sep 2020 10:27:11 -0400
X-MC-Unique: jOkdxJTVNjCYwBv8akqsRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9498D57038;
 Fri, 18 Sep 2020 14:27:09 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3A715D9D5;
 Fri, 18 Sep 2020 14:27:08 +0000 (UTC)
Subject: Re: [PATCH 16/37] qapi: establish mypy type-checking baseline
To: Markus Armbruster <armbru@redhat.com>
References: <20200915224027.2529813-1-jsnow@redhat.com>
 <20200915224027.2529813-17-jsnow@redhat.com>
 <874knvguzb.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <ccc530c6-4ad5-cf0b-09d0-65b14311a1ec@redhat.com>
Date: Fri, 18 Sep 2020 10:27:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <874knvguzb.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 03:47:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.869, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/20 7:55 AM, Markus Armbruster wrote:
> Ignorant question: why does this come after PATCH 13 "qapi/common.py:
> add notational type hints", but before all the other patches adding type
> hints?
> 
> John Snow <jsnow@redhat.com> writes:
> 
>> Fix two very minor issues, and then establish a mypy type-checking
>> baseline.
>>
>> Like pylint, this should be run from the folder above:
>>
>>   > mypy --config-file=qapi/mypy.ini qapi/
> 
> I get:
> 
>      $ mypy --config-file qapi/mypy.ini qapi
>      qapi/mypy.ini: [mypy]: Strict mode is not supported in configuration files: specify individual flags instead (see 'mypy -h' for the list of flags enabled in strict mode)
>      qapi/types.py:29: error: Need type annotation for 'objects_seen' (hint: "objects_seen: Set[<type>] = ...")
>      Found 1 error in 1 file (checked 18 source files)
> 
> Is this expected?
> 

Nope.

> In case it matters:
> 
>      $ mypy --version
>      mypy 0.761
> 

I am using mypy 0.782.

I will investigate to see if there is an *easy* win to allow older 
versions to work.

In the meantime, please consider trying this:

pip install --user mypy==0.782
~/.local/bin/mypy --config-file=qapi/mypy.ini qapi/

>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/doc.py    |  3 +-
>>   scripts/qapi/mypy.ini  | 65 ++++++++++++++++++++++++++++++++++++++++++
>>   scripts/qapi/schema.py |  3 +-
>>   3 files changed, 69 insertions(+), 2 deletions(-)
>>   create mode 100644 scripts/qapi/mypy.ini
>>
>> diff --git a/scripts/qapi/doc.py b/scripts/qapi/doc.py
>> index cbf7076ed9..70f7cdfaa6 100644
>> --- a/scripts/qapi/doc.py
>> +++ b/scripts/qapi/doc.py
>> @@ -5,7 +5,8 @@
>>   """This script produces the documentation of a qapi schema in texinfo format"""
>>   
>>   import re
>> -from .gen import QAPIGenDoc, QAPISchemaVisitor
>> +from .gen import QAPIGenDoc
>> +from .schema import QAPISchemaVisitor
> 
> Your mypy doesn't like such lazy imports?  Mine seems not to care.
> 

Yeah, it specifically complained that no such definition existed in that 
file.

>>   
>>   
>>   MSG_FMT = """
>> diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
>> new file mode 100644
>> index 0000000000..a0f2365a53
>> --- /dev/null
>> +++ b/scripts/qapi/mypy.ini
>> @@ -0,0 +1,65 @@
>> +[mypy]
>> +strict = True
>> +strict_optional = False
>> +disallow_untyped_calls = False
>> +python_version = 3.6
>> +
>> +[mypy-qapi.commands]
>> +disallow_untyped_defs = False
>> +disallow_incomplete_defs = False
>> +check_untyped_defs = False
>> +
>> +[mypy-qapi.doc]
>> +disallow_subclassing_any = False
>> +disallow_untyped_defs = False
>> +disallow_incomplete_defs = False
>> +
>> +[mypy-qapi.error]
>> +disallow_untyped_defs = False
>> +disallow_incomplete_defs = False
>> +check_untyped_defs = False
>> +
>> +[mypy-qapi.events]
>> +disallow_untyped_defs = False
>> +disallow_incomplete_defs = False
>> +check_untyped_defs = False
>> +
>> +[mypy-qapi.expr]
>> +disallow_untyped_defs = False
>> +disallow_incomplete_defs = False
>> +check_untyped_defs = False
>> +
>> +[mypy-qapi.gen]
>> +disallow_untyped_defs = False
>> +disallow_incomplete_defs = False
>> +check_untyped_defs = False
>> +
>> +[mypy-qapi.introspect]
>> +disallow_untyped_defs = False
>> +disallow_incomplete_defs = False
>> +check_untyped_defs = False
>> +
>> +[mypy-qapi.parser]
>> +disallow_untyped_defs = False
>> +disallow_incomplete_defs = False
>> +check_untyped_defs = False
>> +
>> +[mypy-qapi.schema]
>> +disallow_untyped_defs = False
>> +disallow_incomplete_defs = False
>> +check_untyped_defs = False
>> +
>> +[mypy-qapi.source]
>> +disallow_untyped_defs = False
>> +disallow_incomplete_defs = False
>> +check_untyped_defs = False
>> +
>> +[mypy-qapi.types]
>> +disallow_untyped_defs = False
>> +disallow_incomplete_defs = False
>> +check_untyped_defs = False
>> +
>> +[mypy-qapi.visit]
>> +disallow_untyped_defs = False
>> +disallow_incomplete_defs = False
>> +check_untyped_defs = False
> 
> Greek to me.  I'll learn in due time.
> 

I am using these options:

--strict, which is effectively -Wall.

--no-strict-optional, which disables type checking errors on conflict 
between Optional[T] and T. Namely, when you initialize a class field to 
None and set that variable after initialization, callers must be 
prepared to see if that field was None or not. We do that effectively 
nowhere.

As Python will surely explode in a noticeable way if we got an 
unexpected 'None', I am just suppressing these warnings "for now".

--allow-untyped-calls silences errors in files that have calls to 
functions in files I still have not typed. By the end of the series, 
this option goes away, because there's nothing untyped left.


For each untyped file, we are actually starting with all of the above 
options and then layering these options on top. Any egregious typing 
errors present in these "ignored" files will be spotted.

To get the bad files to pass, we only need three options:

allow untyped defs -- Simply permits us to have functions without 
annotations.

allow incomplete defs -- allows functions that are only partially typed.

check untyped defs = False -- Don't try to type check untyped definitions.

>> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>> index b4921b46c9..bb0cd717f1 100644
>> --- a/scripts/qapi/schema.py
>> +++ b/scripts/qapi/schema.py
>> @@ -17,6 +17,7 @@
>>   import os
>>   import re
>>   from collections import OrderedDict
>> +from typing import Optional
>>   
>>   from .common import c_name, POINTER_SUFFIX
>>   from .error import QAPIError, QAPISemError
>> @@ -25,7 +26,7 @@
>>   
>>   
>>   class QAPISchemaEntity:
>> -    meta = None
>> +    meta: Optional[str] = None
>>   
>>       def __init__(self, name, info, doc, ifcond=None, features=None):
>>           assert name is None or isinstance(name, str)


