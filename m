Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1788F36BFFC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 09:18:11 +0200 (CEST)
Received: from localhost ([::1]:33918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbHz0-00069D-46
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 03:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbHwR-0004nv-RE
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:15:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbHwQ-00073R-0E
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619507729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wyNvWj0G20C9NEJvhstHott1UUpwlbd/aWttfjSUHqo=;
 b=DJWioaIJL2UI/Rp9AiGVzdusEnF7EHKNcgcNP2m3A7GDt9JUyUFZS37H7mFh2+p+B+c2G7
 4byAc5/0zS501oojlcdCB7P4q8FkihxpdGBCcCY9SOrQ/437zf21q1QZG3rFYhFSJVqTtu
 aazbf/EMpqeFomAGMlvLUOTY/r8IjCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-X3A8dvKEPEGfnlWFKzmEKw-1; Tue, 27 Apr 2021 03:15:25 -0400
X-MC-Unique: X3A8dvKEPEGfnlWFKzmEKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79C5F801AB6;
 Tue, 27 Apr 2021 07:15:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 242CB76C1D;
 Tue, 27 Apr 2021 07:15:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A3469113525D; Tue, 27 Apr 2021 09:15:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 11/22] qapi/parser: Rework _check_pragma_list_of_str as
 a TypeGuard
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-12-jsnow@redhat.com>
 <871ray7dfd.fsf@dusky.pond.sub.org>
 <83aa318c-1a54-35a2-2cec-8d4503392c2f@redhat.com>
Date: Tue, 27 Apr 2021 09:15:22 +0200
In-Reply-To: <83aa318c-1a54-35a2-2cec-8d4503392c2f@redhat.com> (John Snow's
 message of "Mon, 26 Apr 2021 19:48:10 -0400")
Message-ID: <87czug6vw5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 4/25/21 8:32 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> TypeGuards wont exist in Python proper until 3.10. Ah well. We can hack
>>> up our own by declaring this function to return the type we claim it
>>> checks for and using this to safely downcast object -> List[str].
>>>
>>> In so doing, I bring this function in-line under _pragma so it can use
>>> the 'info' object in its closure. Having done this, _pragma also now
>>> no longer needs to take a 'self' parameter, so drop it.
>>>
>>> Rename it to just _check(), to help us out with the line-length -- and
>>> now that it's contained within _pragma, it is contextually easier to see
>>> how it's used anyway -- especially with types.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>
>>> ---
>>>
>>> I left (name, value) as args to avoid creating a fully magic "macro",
>>> though, I thought this was too weird:
>>>
>>>      info.pragma.foobar = _check()
>>>
>>> and it looked more reasonable as:
>>>
>>>      info.pragma.foobar = _check(name, value)
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/parser.py | 26 +++++++++++++-------------
>>>   1 file changed, 13 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>>> index 16fd36f8391..d02a134aae9 100644
>>> --- a/scripts/qapi/parser.py
>>> +++ b/scripts/qapi/parser.py
>>> @@ -17,6 +17,7 @@
>>>   from collections import OrderedDict
>>>   import os
>>>   import re
>>> +from typing import List
>>>   
>>>   from .common import match_nofail
>>>   from .error import QAPISemError, QAPISourceError
>>> @@ -151,28 +152,27 @@ def _include(include, info, incl_fname, previously_included):
>>>               ) from err
>>>   
>>>       @staticmethod
>>> -    def _check_pragma_list_of_str(name, value, info):
>>> -        if (not isinstance(value, list)
>>> -                or any([not isinstance(elt, str) for elt in value])):
>>> -            raise QAPISemError(
>>> -                info,
>>> -                "pragma %s must be a list of strings" % name)
>>> +    def _pragma(name, value, info):
>>> +
>>> +        def _check(name, value) -> List[str]:
>>> +            if (not isinstance(value, list) or
>>> +                    any([not isinstance(elt, str) for elt in value])):
>>> +                raise QAPISemError(
>>> +                    info,
>>> +                    "pragma %s must be a list of strings" % name)
>>> +            return value
>>>   
>>> -    def _pragma(self, name, value, info):
>>>           if name == 'doc-required':
>>>               if not isinstance(value, bool):
>>>                   raise QAPISemError(info,
>>>                                      "pragma 'doc-required' must be boolean")
>>>               info.pragma.doc_required = value
>>>           elif name == 'command-name-exceptions':
>>> -            self._check_pragma_list_of_str(name, value, info)
>>> -            info.pragma.command_name_exceptions = value
>>> +            info.pragma.command_name_exceptions = _check(name, value)
>>>           elif name == 'command-returns-exceptions':
>>> -            self._check_pragma_list_of_str(name, value, info)
>>> -            info.pragma.command_returns_exceptions = value
>>> +            info.pragma.command_returns_exceptions = _check(name, value)
>>>           elif name == 'member-name-exceptions':
>>> -            self._check_pragma_list_of_str(name, value, info)
>>> -            info.pragma.member_name_exceptions = value
>>> +            info.pragma.member_name_exceptions = _check(name, value)
>>>           else:
>>>               raise QAPISemError(info, "unknown pragma '%s'" % name)
>> 
>> While I appreciate the terseness, I'm not sure I like the generic name
>> _check() for checking one of two special cases, namely "list of string".
>> The other case being "boolean".  We could acquire more cases later.
>> 
>
> Yeah, sorry, just trying to make the line fit ...

I understand!

> The important thing is that we need to make sure this routine returns 
> some known type. It's just that the block down here has very long lines.
>
> Recommendations?

Moving the helper into _pragma() lets us drop shorten its name.  Still
too long to fit the line:

            info.pragma.command_returns_exceptions = check_list_str(name, value)

We could break the line in the argument list:

            info.pragma.command_returns_exceptions = check_list_str(name,
                                                                    value)

or

            info.pragma.command_returns_exceptions = check_list_str(
                                                            name, value)

Not exactly pretty.

We could shorten the assignment's target:

            pragma.command_returns_exceptions = check_list_str(name, value)

with

        pragma.info = pragma

before the conditional.  I'm not too fond of creating aliases, but this
one looks decent to me.  What do you think?


