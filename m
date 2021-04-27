Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2391C36BF9C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 09:03:29 +0200 (CEST)
Received: from localhost ([::1]:42964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbHkl-000618-My
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 03:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbHiE-00051e-9Y
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:00:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbHiB-0007DD-CJ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:00:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619506843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qg8pSljpvgW+5bNYGUCceoVrzZ/JTTX4OrcUAURuzWA=;
 b=WApDK/ZoY7fVkI7Ic+RTppqST9Eez9vQyd6CVQ23Wua9ryR6L7KhNwr9ZOu8h5zREPv48k
 N7W/xiwKPDyVwWieE5U3kgbQ+HVe63yJ4rSIHIwr2L55r21mxhfUfBitDZ36IZUQc+m5LP
 laSmETyRp/+z3csj2to/glPpwPoeIpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-THUPjjYmOgulkI0wxEW5Kg-1; Tue, 27 Apr 2021 03:00:40 -0400
X-MC-Unique: THUPjjYmOgulkI0wxEW5Kg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3B7D9F936;
 Tue, 27 Apr 2021 07:00:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 871A95D9C0;
 Tue, 27 Apr 2021 07:00:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 10A46113525D; Tue, 27 Apr 2021 09:00:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 10/22] qapi/parser: Fix typing of token membership tests
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-11-jsnow@redhat.com>
 <87v98a7q23.fsf@dusky.pond.sub.org>
 <78cf87ce-ce02-d9d6-0922-84a328b6b9da@redhat.com>
Date: Tue, 27 Apr 2021 09:00:38 +0200
In-Reply-To: <78cf87ce-ce02-d9d6-0922-84a328b6b9da@redhat.com> (John Snow's
 message of "Mon, 26 Apr 2021 13:51:34 -0400")
Message-ID: <87k0oo6wkp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

> On 4/25/21 3:59 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> When the token can be None, we can't use 'x in "abc"' style membership
>>> tests to group types of tokens together, because 'None in "abc"' is a
>>> TypeError.
>>>
>>> Easy enough to fix, if not a little ugly.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/parser.py | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>>> index 7f3c009f64b..16fd36f8391 100644
>>> --- a/scripts/qapi/parser.py
>>> +++ b/scripts/qapi/parser.py
>>> @@ -272,7 +272,7 @@ def get_values(self):
>>>           if self.tok == ']':
>>>               self.accept()
>>>               return expr
>>> -        if self.tok not in "{['tf":
>>> +        if self.tok is None or self.tok not in "{['tf":
>>>               raise QAPIParseError(
>>>                   self, "expected '{', '[', ']', string, or boolean")
>>>           while True:
>>> @@ -294,7 +294,8 @@ def get_expr(self, nested):
>>>           elif self.tok == '[':
>>>               self.accept()
>>>               expr = self.get_values()
>>> -        elif self.tok in "'tf":
>>> +        elif self.tok and self.tok in "'tf":
>>> +            assert isinstance(self.val, (str, bool))
>>>               expr = self.val
>>>               self.accept()
>>>           else:
>> 
>> How can self.tok be None?
>> 
>> I suspect this is an artifact of PATCH 04.  Before, self.tok is
>> initialized to the first token, then set to subsequent tokens (all str)
>> in turn.  After, it's initialized to None, then set to tokens in turn.
>> 
>
> Actually, it's set to None to represent EOF. See here:
>
>              elif self.tok == '\n':
> 	        if self.cursor == len(self.src):
>                      self.tok = None
>                      return

Alright, then this is actually a bug fix:

    $ echo -n "{'key': " | python3 scripts/qapi-gen.py /dev/stdin
    Traceback (most recent call last):
      File "scripts/qapi-gen.py", line 19, in <module>
        sys.exit(main.main())
      File "/work/armbru/qemu/scripts/qapi/main.py", line 93, in main
        generate(args.schema,
      File "/work/armbru/qemu/scripts/qapi/main.py", line 50, in generate
        schema = QAPISchema(schema_file)
      File "/work/armbru/qemu/scripts/qapi/schema.py", line 852, in __init__
        parser = QAPISchemaParser(fname)
      File "/work/armbru/qemu/scripts/qapi/parser.py", line 59, in __init__
        self._parse()
      File "/work/armbru/qemu/scripts/qapi/parser.py", line 81, in _parse
        expr = self.get_expr(False)
      File "/work/armbru/qemu/scripts/qapi/parser.py", line 293, in get_expr
        expr = self.get_members()
      File "/work/armbru/qemu/scripts/qapi/parser.py", line 260, in get_members
        expr[key] = self.get_expr(True)
      File "/work/armbru/qemu/scripts/qapi/parser.py", line 297, in get_expr
        elif self.tok in "'tf":
    TypeError: 'in <string>' requires string as left operand, not NoneType

Likewise, the other hunk:

    $ echo -n "{'key': [" | python3 scripts/qapi-gen.py /dev/stdin
    Traceback (most recent call last):
      File "scripts/qapi-gen.py", line 19, in <module>
        sys.exit(main.main())
      File "/work/armbru/qemu/scripts/qapi/main.py", line 89, in main
        generate(args.schema,
      File "/work/armbru/qemu/scripts/qapi/main.py", line 51, in generate
        schema = QAPISchema(schema_file)
      File "/work/armbru/qemu/scripts/qapi/schema.py", line 860, in __init__
        parser = QAPISchemaParser(fname)
      File "/work/armbru/qemu/scripts/qapi/parser.py", line 71, in __init__
        expr = self.get_expr(False)
      File "/work/armbru/qemu/scripts/qapi/parser.py", line 270, in get_expr
        expr = self.get_members()
      File "/work/armbru/qemu/scripts/qapi/parser.py", line 238, in get_members
        expr[key] = self.get_expr(True)
      File "/work/armbru/qemu/scripts/qapi/parser.py", line 273, in get_expr
        expr = self.get_values()
      File "/work/armbru/qemu/scripts/qapi/parser.py", line 253, in get_values
        if self.tok not in "{['tf":
    TypeError: 'in <string>' requires string as left operand, not NoneType

Please add test cases.  I recommend adding them in a separate patch, so
this one's diff shows clearly what's being fixed.

There's a similar one in accept(), but it's safe:

            self.tok = self.src[self.cursor]
            ...
            elif self.tok in '{}:,[]':
                return

Regarding "if not a little ugly": instead of

    self.tok is None or self.tok not in "{['tf"

we could use

    self.tok not in tuple("{['tf")

> A more pythonic idiom would be to create a lexer class that behaves as 
> an iterator, yielding Token class objects, and eventually, raising 
> StopIteration.
>
> (Not suggesting I do that now. I have thought about it though, yes.)

Yes, let's resist the temptation to improve things into too many
directions at once.

Aside: using exceptions for perfectly unexceptional things like loop
termination is in questionable taste, but we gotta go with the Python
flow.


