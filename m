Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2880387A09
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:33:06 +0200 (CEST)
Received: from localhost ([::1]:60366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizqL-0004r8-Sk
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lizYd-0005jj-Sd
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:14:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lizYY-0007Mw-Gi
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621343681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZD5uG0Fq6sI0AhS3NAnRDSW0jEyJ4qn1l8Ho2dxL4Q=;
 b=H13bvP/I2CU7R/a9mT/UedYz0D7a4vB9kx/Fv/7vrv8ebpKoIG2a0N1ynKWijZVjomrMeD
 dyG8PmW7slEHFjWptmistTEfgHd9+dx8Oq31OFMGlYfqtOozLLoVhj1Ctc4W0wsiiXmlQ6
 lnGyxPLgSB7j1kIKU99ZO4Sf4ot/I9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-4yu8JQA1NjuZG1tw3D0sSQ-1; Tue, 18 May 2021 09:14:21 -0400
X-MC-Unique: 4yu8JQA1NjuZG1tw3D0sSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F1DA18BA284;
 Tue, 18 May 2021 13:14:08 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04E766C8D4;
 Tue, 18 May 2021 13:14:01 +0000 (UTC)
Subject: Re: [PATCH v2 01/21] qapi/parser: Don't try to handle file errors
To: Markus Armbruster <armbru@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
 <20210511220601.2110055-2-jsnow@redhat.com>
 <87wnrw5r2q.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <55aacc2d-75c7-c925-4b65-a1e3f0046d3b@redhat.com>
Date: Tue, 18 May 2021 09:14:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87wnrw5r2q.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 5:28 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Remove the try/except block that handles file-opening errors in
>> QAPISchemaParser.__init__() and add one each to
>> QAPISchemaParser._include() and QAPISchema.__init__() respectively.
>>
>>
>> The short-ish version of what motivates this patch is:
>>
>> - It's hard to write a good error message in the init method,
>>    because we need to determine the context of our caller to do so.
>>    It's easier to just let the caller write the message.
> 
> I kind of disagree, but that's okay; it's your commit message :)
> 

I can nix the paragraph if you want, the primary purpose was to explain 
to you what I was thinking anyway, and you already know ;)

>> - We don't want to allow QAPISourceInfo(None, None, None) to exist.
>> - Errors made using such an object are currently incorrect.
>> - It's not technically a semantic error if we cannot open the schema
>> - There are various typing constraints that make mixing these two cases
>>    undesirable for a single special case.
>>
>> Other considerations:
>>
>> - open() is moved to a 'with' block to ensure file pointers are
>>    cleaned up deterministically.
> 
> Improvement over v1's leak claim.  Sold!
> 
>> - Python 3.3 deprecated IOError and made it a synonym for OSError.
>>    Avoid the misleading perception these exception handlers are
>>    narrower than they really are.
>> - Not all QAPIError objects have an 'info' field, so remove that stanza
>>    from test-qapi. Don't bother to replace the early exit on purpose
>>    so that we can test its output in the next commit.
> 
> To which hunk exactly does the last item refer?
> 

Sigh, "Early return", not *exit* -- and I'm referring to the test-qapi hunk.

> My best guess is the last one.  Its rationale is actually "drop code
> handling the variant of QAPISourceInfo being removed in this patch".
> 

That too ... I just meant to say "It doesn't need to be replaced"

> QAPIError not having .info don't actually exist before this patch.
> 
> I'm afraid I don't get the second sentence.
>  >>
>>
>> The long version:
>>
>> The error message string here is incorrect (since 52a474180a):
> 
> I think this reads slightly better:
> 
>    The error message here is incorrect (since commit 52a474180a):

OK (If I need to respin I'll change it?)

>>
>>> python3 qapi-gen.py 'fake.json'
>> qapi-gen.py: qapi-gen.py: can't read schema file 'fake.json': No such file or directory
>>
>> In pursuing it, we find that QAPISourceInfo has a special accommodation
>> for when there's no filename. Meanwhile, the intended typing of
>> QAPISourceInfo was (non-optional) 'str'.
> 
> Not sure about "intended".  When I wrote the code, I intended ".fname is
> str means it's a position that file; None means it's not in a file".  I
> didn't intend typing, because typing wasn't a concern back then.
> 
> Do you mean something like "we'd prefer to type .fname as (non-optional)
> str"?
> 

Really, I meant *I* intended that typing. I just have a habit of using 
"we" for F/OSS commit messages.

What I am really saying: When I typed this field, I didn't realize it 
could be None actually -- I see this as a way to fix the "intended 
typing" that I established however many commits ago.

>>
>> To remove this, I'd want to avoid having a "fake" QAPISourceInfo
>> object. We also don't want to explicitly begin accommodating
>> QAPISourceInfo itself being None, because we actually want to eventually
>> prove that this can never happen -- We don't want to confuse "The file
>> isn't open yet" with "This error stems from a definition that wasn't
>> defined in any file".
>>
>> (An earlier series tried to create a dummy info object, but it was tough
>> to prove in review that it worked correctly without creating new
>> regressions. This patch avoids that distraction. We would like to first
>> prove that we never raise QAPISemError for any built-in object before we
>> add "special" info objects. We aren't ready to do that yet.)
>>
>> So, which way out of the labyrinth?
>>
>> Here's one way: Don't try to handle errors at a level with "mixed"
>> semantic contexts; i.e. don't mix inclusion errors (should report a
>> source line where the include was triggered) and command line errors
>> (where we specified a file we couldn't read).
>>
>> Remove the error handling from the initializer of the parser. Pythonic!
>> Now it's the caller's job to figure out what to do about it. Handle the
>> error in QAPISchemaParser._include() instead, where we can write a
>> targeted error message where we are guaranteed to have an 'info' context
>> to report with.
>>
>> The root level error can similarly move to QAPISchema.__init__(), where
>> we know we'll never have an info context to report with, so we use a
>> more abstract error type.
>>
>> Now the error looks sensible again:
>>
>>> python3 qapi-gen.py 'fake.json'
>> qapi-gen.py: can't read schema file 'fake.json': No such file or directory
>>
>> With these error cases separated, QAPISourceInfo can be solidified as
>> never having placeholder arguments that violate our desired types. Clean
>> up test-qapi along similar lines.
>>
>> Fixes: 52a474180a
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/parser.py         | 18 +++++++++---------
>>   scripts/qapi/schema.py         | 11 +++++++++--
>>   scripts/qapi/source.py         |  3 ---
>>   tests/qapi-schema/test-qapi.py |  3 ---
>>   4 files changed, 18 insertions(+), 17 deletions(-)
>>
>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>> index ca5e8e18e00..a53b735e7de 100644
>> --- a/scripts/qapi/parser.py
>> +++ b/scripts/qapi/parser.py
>> @@ -40,15 +40,9 @@ def __init__(self, fname, previously_included=None, incl_info=None):
>>           previously_included = previously_included or set()
>>           previously_included.add(os.path.abspath(fname))
>>   
>> -        try:
>> -            fp = open(fname, 'r', encoding='utf-8')
>> +        # May raise OSError; allow the caller to handle it.
>> +        with open(fname, 'r', encoding='utf-8') as fp:
>>               self.src = fp.read()
>> -        except IOError as e:
>> -            raise QAPISemError(incl_info or QAPISourceInfo(None, None, None),
>> -                               "can't read %s file '%s': %s"
>> -                               % ("include" if incl_info else "schema",
>> -                                  fname,
>> -                                  e.strerror))
>>   
>>           if self.src == '' or self.src[-1] != '\n':
>>               self.src += '\n'
>> @@ -129,7 +123,13 @@ def _include(self, include, info, incl_fname, previously_included):
>>           if incl_abs_fname in previously_included:
>>               return None
>>   
>> -        return QAPISchemaParser(incl_fname, previously_included, info)
>> +        try:
>> +            return QAPISchemaParser(incl_fname, previously_included, info)
>> +        except OSError as err:
>> +            raise QAPISemError(
>> +                info,
>> +                f"can't read include file '{incl_fname}': {err.strerror}"
>> +            ) from err
>>   
>>       def _check_pragma_list_of_str(self, name, value, info):
>>           if (not isinstance(value, list)
>> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>> index 3a4172fb749..d1d27ff7ee8 100644
>> --- a/scripts/qapi/schema.py
>> +++ b/scripts/qapi/schema.py
>> @@ -20,7 +20,7 @@
>>   from typing import Optional
>>   
>>   from .common import POINTER_SUFFIX, c_name
>> -from .error import QAPISemError, QAPISourceError
>> +from .error import QAPIError, QAPISemError, QAPISourceError
>>   from .expr import check_exprs
>>   from .parser import QAPISchemaParser
>>   
>> @@ -849,7 +849,14 @@ def visit(self, visitor):
>>   class QAPISchema:
>>       def __init__(self, fname):
>>           self.fname = fname
>> -        parser = QAPISchemaParser(fname)
>> +
>> +        try:
>> +            parser = QAPISchemaParser(fname)
>> +        except OSError as err:
>> +            raise QAPIError(
>> +                f"can't read schema file '{fname}': {err.strerror}"
>> +            ) from err
>> +
>>           exprs = check_exprs(parser.exprs)
>>           self.docs = parser.docs
>>           self._entity_list = []
>> diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
>> index 03b6ede0828..1ade864d7b9 100644
>> --- a/scripts/qapi/source.py
>> +++ b/scripts/qapi/source.py
>> @@ -10,7 +10,6 @@
>>   # See the COPYING file in the top-level directory.
>>   
>>   import copy
>> -import sys
>>   from typing import List, Optional, TypeVar
>>   
>>   
>> @@ -53,8 +52,6 @@ def next_line(self: T) -> T:
>>           return info
>>   
>>       def loc(self) -> str:
>> -        if self.fname is None:
>> -            return sys.argv[0]
>>           ret = self.fname
>>           if self.line is not None:
>>               ret += ':%d' % self.line
>> diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
>> index e8db9d09d91..f1c4deb9a51 100755
>> --- a/tests/qapi-schema/test-qapi.py
>> +++ b/tests/qapi-schema/test-qapi.py
>> @@ -128,9 +128,6 @@ def test_and_diff(test_name, dir_name, update):
>>       try:
>>           test_frontend(os.path.join(dir_name, test_name + '.json'))
>>       except QAPIError as err:
>> -        if err.info.fname is None:
>> -            print("%s" % err, file=sys.stderr)
>> -            return 2
>>           errstr = str(err) + '\n'
>>           if dir_name:
>>               errstr = errstr.replace(dir_name + '/', '')
> 
> Patch looks good to me.
> 

Well, that's good ;)


