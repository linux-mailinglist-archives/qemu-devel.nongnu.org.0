Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F23372424
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 03:07:40 +0200 (CEST)
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldjXG-0000TM-Uv
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 21:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ldjRc-0006eo-7o
 for qemu-devel@nongnu.org; Mon, 03 May 2021 21:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ldjRY-0007Xu-3D
 for qemu-devel@nongnu.org; Mon, 03 May 2021 21:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620090102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=teB5NGw0+4l4Dpy+IpNRh7O/cWYQJwXLj97hiuxJQLE=;
 b=i8ldzDSIEAVYlwrnOkW6ViTZf5FydIbnCpVYhVfItBDsfqA0SqhlODtWIkpQ/oNs2JXlLf
 Pm9yxV8W/12ZWiEGLsUlrBW6qC1j5vyByHOPXgs1bVNBobiqyE9YZHnPEG1CXXf1TuIGU7
 r4Zcr1PcbPcPb4ZDx+5+Y+hiEK/N/iM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-iKXVCBxtO1ix4TZqXcT2xQ-1; Mon, 03 May 2021 21:01:39 -0400
X-MC-Unique: iKXVCBxtO1ix4TZqXcT2xQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ADDF10066E8;
 Tue,  4 May 2021 01:01:38 +0000 (UTC)
Received: from [10.10.116.36] (ovpn-116-36.rdu2.redhat.com [10.10.116.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 455985C22A;
 Tue,  4 May 2021 01:01:37 +0000 (UTC)
Subject: Re: [PATCH 10/22] qapi/parser: Fix typing of token membership tests
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-11-jsnow@redhat.com>
 <87v98a7q23.fsf@dusky.pond.sub.org>
 <78cf87ce-ce02-d9d6-0922-84a328b6b9da@redhat.com>
 <87k0oo6wkp.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <3b8af56e-4322-4729-05c9-27e62f7e86a6@redhat.com>
Date: Mon, 3 May 2021 21:01:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87k0oo6wkp.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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

On 4/27/21 3:00 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 4/25/21 3:59 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> When the token can be None, we can't use 'x in "abc"' style membership
>>>> tests to group types of tokens together, because 'None in "abc"' is a
>>>> TypeError.
>>>>
>>>> Easy enough to fix, if not a little ugly.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>    scripts/qapi/parser.py | 5 +++--
>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>>>> index 7f3c009f64b..16fd36f8391 100644
>>>> --- a/scripts/qapi/parser.py
>>>> +++ b/scripts/qapi/parser.py
>>>> @@ -272,7 +272,7 @@ def get_values(self):
>>>>            if self.tok == ']':
>>>>                self.accept()
>>>>                return expr
>>>> -        if self.tok not in "{['tf":
>>>> +        if self.tok is None or self.tok not in "{['tf":
>>>>                raise QAPIParseError(
>>>>                    self, "expected '{', '[', ']', string, or boolean")
>>>>            while True:
>>>> @@ -294,7 +294,8 @@ def get_expr(self, nested):
>>>>            elif self.tok == '[':
>>>>                self.accept()
>>>>                expr = self.get_values()
>>>> -        elif self.tok in "'tf":
>>>> +        elif self.tok and self.tok in "'tf":
>>>> +            assert isinstance(self.val, (str, bool))
>>>>                expr = self.val
>>>>                self.accept()
>>>>            else:
>>>
>>> How can self.tok be None?
>>>
>>> I suspect this is an artifact of PATCH 04.  Before, self.tok is
>>> initialized to the first token, then set to subsequent tokens (all str)
>>> in turn.  After, it's initialized to None, then set to tokens in turn.
>>>
>>
>> Actually, it's set to None to represent EOF. See here:
>>
>>               elif self.tok == '\n':
>> 	        if self.cursor == len(self.src):
>>                       self.tok = None
>>                       return
> 
> Alright, then this is actually a bug fix:
> 
>      $ echo -n "{'key': " | python3 scripts/qapi-gen.py /dev/stdin
>      Traceback (most recent call last):
>        File "scripts/qapi-gen.py", line 19, in <module>
>          sys.exit(main.main())
>        File "/work/armbru/qemu/scripts/qapi/main.py", line 93, in main
>          generate(args.schema,
>        File "/work/armbru/qemu/scripts/qapi/main.py", line 50, in generate
>          schema = QAPISchema(schema_file)
>        File "/work/armbru/qemu/scripts/qapi/schema.py", line 852, in __init__
>          parser = QAPISchemaParser(fname)
>        File "/work/armbru/qemu/scripts/qapi/parser.py", line 59, in __init__
>          self._parse()
>        File "/work/armbru/qemu/scripts/qapi/parser.py", line 81, in _parse
>          expr = self.get_expr(False)
>        File "/work/armbru/qemu/scripts/qapi/parser.py", line 293, in get_expr
>          expr = self.get_members()
>        File "/work/armbru/qemu/scripts/qapi/parser.py", line 260, in get_members
>          expr[key] = self.get_expr(True)
>        File "/work/armbru/qemu/scripts/qapi/parser.py", line 297, in get_expr
>          elif self.tok in "'tf":
>      TypeError: 'in <string>' requires string as left operand, not NoneType
> 
> Likewise, the other hunk:
> 
>      $ echo -n "{'key': [" | python3 scripts/qapi-gen.py /dev/stdin
>      Traceback (most recent call last):
>        File "scripts/qapi-gen.py", line 19, in <module>
>          sys.exit(main.main())
>        File "/work/armbru/qemu/scripts/qapi/main.py", line 89, in main
>          generate(args.schema,
>        File "/work/armbru/qemu/scripts/qapi/main.py", line 51, in generate
>          schema = QAPISchema(schema_file)
>        File "/work/armbru/qemu/scripts/qapi/schema.py", line 860, in __init__
>          parser = QAPISchemaParser(fname)
>        File "/work/armbru/qemu/scripts/qapi/parser.py", line 71, in __init__
>          expr = self.get_expr(False)
>        File "/work/armbru/qemu/scripts/qapi/parser.py", line 270, in get_expr
>          expr = self.get_members()
>        File "/work/armbru/qemu/scripts/qapi/parser.py", line 238, in get_members
>          expr[key] = self.get_expr(True)
>        File "/work/armbru/qemu/scripts/qapi/parser.py", line 273, in get_expr
>          expr = self.get_values()
>        File "/work/armbru/qemu/scripts/qapi/parser.py", line 253, in get_values
>          if self.tok not in "{['tf":
>      TypeError: 'in <string>' requires string as left operand, not NoneType
> 
> Please add test cases.  I recommend adding them in a separate patch, so
> this one's diff shows clearly what's being fixed.
> 

Can't, again: because it's a crash, the test runner explodes.

Two choices, because I won't finish respinning this tonight:

(1) Amend the test runner to print generic exceptions using str(err), 
without the stack trace -- so we can check for crashes using the diffs 
-- again in its own commit.

(2) Just squish the tests and error messages into this commit like I did 
for the other crash fix I checked in.

I'd normally leap for #1, but you seem to have some affinity for 
allowing unpredictable things to explode very violently, so I am not sure.

--js


