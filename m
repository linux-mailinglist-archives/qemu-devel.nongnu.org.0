Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD1736CABC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 20:00:29 +0200 (CEST)
Received: from localhost ([::1]:45094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbS0a-0004LQ-TF
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 14:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbRz7-0002zO-9l
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:58:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbRz3-00088n-LJ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619546332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBG2rW0L/kQ57uKBI+aqs937gaMVnXQm4Q6x9oBPxL0=;
 b=RymEc6j4l4mr1rFvTnr1CtraGf6HOrT5pF+G1l+UtOu6WDhmH9KgaKCW/mtkjZsMeakn6U
 w/jvBn+H4qjZx9s3ejUIpRX6j3JTvYPnIxbiJuT/6OIEbltin84RLCni8C4UfHWREy0BLy
 MC/FdgHKvZq+MaimBCobozLIwqxZVlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-N9RW1aEIOVysW-RkvC755Q-1; Tue, 27 Apr 2021 13:58:50 -0400
X-MC-Unique: N9RW1aEIOVysW-RkvC755Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 795B7107ACFA;
 Tue, 27 Apr 2021 17:58:49 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F0355E1A4;
 Tue, 27 Apr 2021 17:58:39 +0000 (UTC)
Subject: Re: [PATCH 01/22] qapi/parser: Don't try to handle file errors
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-2-jsnow@redhat.com>
 <87czuldmwb.fsf@dusky.pond.sub.org>
 <4d378146-9623-82e9-3906-53954ebba2f5@redhat.com>
 <87wnsnvnyc.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <1df92443-b8e0-a6e4-e0af-fb562a3579f1@redhat.com>
Date: Tue, 27 Apr 2021 13:58:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87wnsnvnyc.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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

On 4/27/21 9:47 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 4/23/21 11:46 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> The short-ish version of what motivates this patch is:
>>>>
>>>> - The parser initializer does not possess adequate context to write a
>>>>     good error message -- It tries to determine the caller's semantic
>>>>     context.
>>>
>>> I'm not sure I get what you're trying to say here.
>>>
>>
>> I mean: this __init__ method does not *know* who is calling it or why.
>> Of course, *we* do, because the code base is finite and nobody else but
>> us is calling into it.
>>
>> I mean to point out that the initializer has to do extra work (Just a
>> little) to determine what the calling context is and raise an error
>> accordingly.
>>
>> Example: If we have a parent info context, we raise an error in the
>> context of the caller. If we don't, we have to create a new presumed
>> context (using the weird None SourceInfo object).
> 
> I guess you mean
> 
>              raise QAPISemError(incl_info or QAPISourceInfo(None, None, None),
> 
> I can't see other instances of messing with context.
> 

Yes, and the string construction that follows, too. It's all about 
trying to understand who our caller is and raising an error appropriate 
for them on their behalf.

>> So I just mean to say:
>>
>> "Let the caller, who unambiguously always has the exactly correct
>> context worry about what the error message ought to be."
>>
>>>> - We don't want to allow QAPISourceInfo(None, None, None) to exist.
>>>> - Errors made using such an object are currently incorrect.
>>>> - It's not technically a semantic error if we cannot open the schema
>>>> - There are various typing constraints that make mixing these two cases
>>>>     undesirable for a single special case.
>>>
>>> These I understand.
>>>
>>>> - The current open block in parser's initializer will leak file
>>>>     pointers, because it isn't using a with statement.
>>>
>>> Uh, isn't the value returned by open() reference-counted?  @fp is the
>>> only reference...
>>>
>>
>> Yeah, eventually. O:-)
>>
>> Whenever the GC runs. OK, it's not really an apocalypse error, but it
>> felt strange to rewrite a try/except and then write it using bad hygiene
>> on purpose in the name of a more isolated commit.
> 
> I agree use of with is an improvement (it's idiomatic).  We shouldn't
> call it a leak fix, though.
> 

OK. I'll reword it.

>>>> Here's the details in why this got written the way it did, and why a few
>>>> disparate issues are rolled into one commit. (They're hard to fix
>>>> separately without writing really weird stuff that'd be harder to
>>>> review.)
>>>>
>>>> The error message string here is incorrect:
>>>>
>>>>> python3 qapi-gen.py 'fake.json'
>>>> qapi-gen.py: qapi-gen.py: can't read schema file 'fake.json': No such file or directory
>>>
>>> Regressed in commit 52a474180a "qapi-gen: Separate arg-parsing from
>>> generation" (v5.2.0).
>>>
>>
>> Mea Culpa. Didn't realize it wasn't tested, and I didn't realize at the
>> time that the two kinds of errors here were treated differently.
> 
> Our tests cover the schema language, not qapi-gen's CLI language.  The
> gap feels tolerable.
> 
>>> Before commit c615550df3 "qapi: Improve source file read error handling"
>>> (v4.2.0), it was differently bad (uncaught exception).
>>>
>>> Commit c615550df3 explains why the funny QAPISourceInfo exists:
>>>
>>>       Reporting open or read failure for the main schema file needs a
>>>       QAPISourceInfo representing "no source".  Make QAPISourceInfo cope
>>>       with fname=None.
>>>
>>
>> I am apparently not the first or the last person to dream of wanting a
>> QAPISourceInfo that represents "Actually, there's no source location!"
>>
>>> The commit turned QAPISourceInfo into the equivalent of a disjoint union
>>> of
>>>
>>> 1. A position in a source file (.fname is a str)
>>>
>>> 2. "Not in any source file" (.fname is None)
>>>
>>> This is somewhat similar to struct Location in C, which has
>>>
>>> 1. LOC_FILE: a position in a source file
>>>
>>> 2. LOC_CMDLINE: a range of command line arguments
>>>
>>> 3. LOC_NONE: no location information
>>>
>>> Abstracting locations this way lets error_report() do the right thing
>>> whether its complaining about the command line, a monitor command, or a
>>> configuration file read with -readconfig.
>>>
>>> Your patch demonstrates that qapi-gen has much less need for abstracting
>>> sources: we use 2. "Not in any source file" only for reading the main
>>> schema file.
>>>
>>
>> Yes. I got the impression that you didn't want to pursue more abstract
>> QSI constructs based on earlier work, so going the other way and
>> *removing* them seemed like the faster way to achieve a clean type
>> system here.
>>
>>>> In pursuing it, we find that QAPISourceInfo has a special accommodation
>>>> for when there's no filename.
>>>
>>> Yes:
>>>
>>>       def loc(self) -> str:
>>> -->     if self.fname is None:
>>> -->         return sys.argv[0]
>>>           ret = self.fname
>>>           if self.line is not None:
>>>               ret += ':%d' % self.line
>>>           return ret
>>>
>>>>                                 Meanwhile, we intend to type info.fname as
>>>> str; something we always have.
>>>
>>> Do you mean "as non-optional str"?
>>>
>>
>> Yeah. I typed it originally as `str`, but the analyzer missed that we
>> check the field to see if it's None, which is misleading.
>>
>>>> To remove this, we need to not have a "fake" QAPISourceInfo object. We
>>>
>>> We may well want to, but I doubt we *need* to.  There are almost
>>> certainly other ways to fix the bug.  I don't see a need to explore
>>> them, though.
>>>
>>
>> Either we build out the fake QSI into a proper subtype, or we remove it
>> -- those are the two obvious options. Building it out is almost
>> certainly more work than this patch.
>>
>>>> also don't want to explicitly begin accommodating QAPISourceInfo being
>>>> None, because we actually want to eventually prove that this can never
>>>> happen -- We don't want to confuse "The file isn't open yet" with "This
>>>> error stems from a definition that wasn't defined in any file".
>>>
>>> Yes, encoding both "poisoned source info not to be used with actual
>>> errors" and "'fake' source info not pointing to a source file" as None
>>> would be a mistake.
>>>
>>
>> :)
>>
>>>> (An earlier series tried to create an official dummy object, but it was
>>>> tough to prove in review that it worked correctly without creating new
>>>> regressions. This patch avoids trying to re-litigate that discussion.
>>>>
>>>> We would like to first prove that we never raise QAPISemError for any
>>>> built-in object before we relent and add "special" info objects. We
>>>> aren't ready to do that yet, so crashing is preferred.)
>>>>
>>>> So, how to solve this mess?
>>>>
>>>> Here's one way: Don't try to handle errors at a level with "mixed"
>>>> semantic levels; i.e. don't try to handle inclusion errors (should
>>>> report a source line where the include was triggered) with command line
>>>> errors (where we specified a file we couldn't read).
>>>>
>>>> Simply remove the error handling from the initializer of the
>>>> parser. Pythonic! Now it's the caller's job to figure out what to do
>>>> about it. Handle the error in QAPISchemaParser._include() instead, where
>>>> we do have the correct semantic context to not need to play games with
>>>> the error message generation.
>>>>
>>>> Next, to re-gain a nice error at the top level, add a new try/except
>>>> into qapi/main.generate(). Now the error looks sensible:
>>>
>>> Missing "again" after "sensible" ;-P
>>>
>>
>> okayokayokayfine
>>
>>>>
>>>>> python3 qapi-gen.py 'fake.json'
>>>> qapi-gen.py: can't read schema file 'fake.json': No such file or directory
>>>>
>>>> Lastly, with this usage gone, we can remove the special type violation
>>>> from QAPISourceInfo, and all is well with the world.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>    scripts/qapi/main.py   |  8 +++++++-
>>>>    scripts/qapi/parser.py | 18 +++++++++---------
>>>>    scripts/qapi/source.py |  3 ---
>>>>    3 files changed, 16 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
>>>> index 703e7ed1ed5..70f8aa86f37 100644
>>>> --- a/scripts/qapi/main.py
>>>> +++ b/scripts/qapi/main.py
>>>> @@ -48,7 +48,13 @@ def generate(schema_file: str,
>>>>        """
>>>>        assert invalid_prefix_char(prefix) is None
>>>>    
>>>> -    schema = QAPISchema(schema_file)
>>>> +    try:
>>>> +        schema = QAPISchema(schema_file)
>>>> +    except OSError as err:
>>>> +        raise QAPIError(
>>>> +            f"can't read schema file '{schema_file}': {err.strerror}"
>>>> +        ) from err
>>>> +
>>>>        gen_types(schema, output_dir, prefix, builtins)
>>>>        gen_visit(schema, output_dir, prefix, builtins)
>>>>        gen_commands(schema, output_dir, prefix)
>>>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>>>> index ca5e8e18e00..b378fa33807 100644
>>>> --- a/scripts/qapi/parser.py
>>>> +++ b/scripts/qapi/parser.py
>>>> @@ -40,15 +40,9 @@ def __init__(self, fname, previously_included=None, incl_info=None):
>>>>            previously_included = previously_included or set()
>>>>            previously_included.add(os.path.abspath(fname))
>>>>    
>>>> -        try:
>>>> -            fp = open(fname, 'r', encoding='utf-8')
>>>> +        # Allow the caller to catch this error.
>>>
>>> "this error"?  I understand what you mean now, but I'm not sure I will
>>> in three months, when I won't have the context I have now.
>>>
>>
>> Yep, OK.
>>
>> # May raise OSError, allow the caller to handle it.
> 
> Okay.
> 
>>>> +        with open(fname, 'r', encoding='utf-8') as fp:
>>>>                self.src = fp.read()
>>>> -        except IOError as e:
>>>> -            raise QAPISemError(incl_info or QAPISourceInfo(None, None, None),
>>>> -                               "can't read %s file '%s': %s"
>>>> -                               % ("include" if incl_info else "schema",
>>>> -                                  fname,
>>>> -                                  e.strerror))
>>>>    
>>>>            if self.src == '' or self.src[-1] != '\n':
>>>>                self.src += '\n'
>>>> @@ -129,7 +123,13 @@ def _include(self, include, info, incl_fname, previously_included):
>>>>            if incl_abs_fname in previously_included:
>>>>                return None
>>>>    
>>>> -        return QAPISchemaParser(incl_fname, previously_included, info)
>>>> +        try:
>>>> +            return QAPISchemaParser(incl_fname, previously_included, info)
>>>> +        except OSError as err:
>>>> +            raise QAPISemError(
>>>> +                info,
>>>> +                f"can't read include file '{incl_fname}': {err.strerror}"
>>>> +            ) from err
>>>>    
>>>>        def _check_pragma_list_of_str(self, name, value, info):
>>>>            if (not isinstance(value, list)
>>>
>>> Before the patch, only IOError from open() and .read() get converted to
>>> QAPISemError, and therefore caught by main().
>>>
>>> The patch widen this to anywhere in QAPISchemaParser.__init__().  Hmm.
>>>
>>
>> "Changed in version 3.3: EnvironmentError, IOError, WindowsError,
>> socket.error, select.error and mmap.error have been merged into OSError,
>> and the constructor may return a subclass."
>>
>>   >>> OSError == IOError
>> True
>>
>> (No, I didn't know this before I wrote it. I just intentionally wanted
>> to catch everything that open() might return, which I had simply assumed
>> was not fully captured by IOError. Better to leave it as OSError now to
>> avoid misleading anyone into thinking it's more narrow than it really is.)
> 
> Good to know.
> 
> However, I was talking about the code covered by try ... except OSError
> (or IOError, or whatever).  Before the patch, it's just open() and
> .read().  Afterwards it's all of .__init__().
> 

Apologies, I misread.

> Could anything else in .__init__() possibly raise OSError?  Probably
> not, but it's not trivially obvious.  Which makes me go "hmm."
> 
> "Hmm" isn't "no", it's just "hmm".
> 

Yeah, it is rather broad. That is one of the perils of doing *so much* 
at init() time, in my opinion.

We don't make any other syscalls in the parser though, so it should be 
fine. The docstring patch later documents the errors we expect to see 
here, so it becomes a visible part of the interface.

>>>> diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
>>>> index 03b6ede0828..1ade864d7b9 100644
>>>> --- a/scripts/qapi/source.py
>>>> +++ b/scripts/qapi/source.py
>>>> @@ -10,7 +10,6 @@
>>>>    # See the COPYING file in the top-level directory.
>>>>    
>>>>    import copy
>>>> -import sys
>>>>    from typing import List, Optional, TypeVar
>>>>    
>>>>    
>>>> @@ -53,8 +52,6 @@ def next_line(self: T) -> T:
>>>>            return info
>>>>    
>>>>        def loc(self) -> str:
>>>> -        if self.fname is None:
>>>> -            return sys.argv[0]
>>>>            ret = self.fname
>>>>            if self.line is not None:
>>>>                ret += ':%d' % self.line
>>>
>>> tests/qapi-schema/test-qapi.py also needs an update.  Before the patch:
>>>
>>>       $ PYTHONPATH=scripts python3 tests/qapi-schema/test-qapi.py nonexistent
>>>       tests/qapi-schema/test-qapi.py: can't read schema file 'nonexistent.json': No such file or directory
>>>
>>> After:
>>>
>>>       Traceback (most recent call last):
>>>         File "tests/qapi-schema/test-qapi.py", line 207, in <module>
>>>           main(sys.argv)
>>>         File "tests/qapi-schema/test-qapi.py", line 201, in main
>>>           status |= test_and_diff(test_name, dir_name, args.update)
>>>         File "tests/qapi-schema/test-qapi.py", line 129, in test_and_diff
>>>           test_frontend(os.path.join(dir_name, test_name + '.json'))
>>>         File "tests/qapi-schema/test-qapi.py", line 109, in test_frontend
>>>           schema = QAPISchema(fname)
>>>         File "/work/armbru/qemu/scripts/qapi/schema.py", line 852, in __init__
>>>           parser = QAPISchemaParser(fname)
>>>         File "/work/armbru/qemu/scripts/qapi/parser.py", line 44, in __init__
>>>           with open(fname, 'r', encoding='utf-8') as fp:
>>>       FileNotFoundError: [Errno 2] No such file or directory: 'nonexistent.json'
>>>
>>
>> Probably something that should be added to the actual battery of tests
>> somehow, yeah? I can't prevent regressions in invocations that don't get
>> run O:-)
> 
> I can, by reviewing patches ;-P
> 
> You're welcome to contribute automated tests covering qapi-gen and
> test-qapi invocations.  I never bothered automating this, and I wouldn't
> bother now.
> 

Yep, I am going to add a not-found test thanks to Paolo's help.


