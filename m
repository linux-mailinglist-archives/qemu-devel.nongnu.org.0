Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065F036C0BA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:22:31 +0200 (CEST)
Received: from localhost ([::1]:46518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbIzF-0000Rk-Qp
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbIyL-0008TV-Ng
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:21:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbIyI-0006DD-Gw
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619511689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ihodvOni0ZJuJAIrfTdzV0gWYVQBHNk+IqHEbYKNFv8=;
 b=h8JJL1EWuDD+c8QXVrG9uLnHtc2svUhWru5WvZqxqufV1ROQuCdeJDgHOrOu2Lf6nenK6Z
 nfmFopYwZMllSQQ8nE2oLnfOaxlorBToreNkZqEok7C9k/YnVQQsrnMcd/XqWSKX5AVywP
 9DUMV5+J/v/4do0INm2C9vSN8hUVC6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-iesO0kiJPPW6udJWA0NgPQ-1; Tue, 27 Apr 2021 04:21:21 -0400
X-MC-Unique: iesO0kiJPPW6udJWA0NgPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E1598026BB;
 Tue, 27 Apr 2021 08:21:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD4B462A04;
 Tue, 27 Apr 2021 08:21:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3B210113525D; Tue, 27 Apr 2021 10:21:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 12/22] qapi/parser: add type hint annotations
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-13-jsnow@redhat.com>
 <87zgxm5yrp.fsf@dusky.pond.sub.org>
 <b19c350f-19f0-9f68-7531-d0a1db8e410e@redhat.com>
Date: Tue, 27 Apr 2021 10:21:20 +0200
In-Reply-To: <b19c350f-19f0-9f68-7531-d0a1db8e410e@redhat.com> (John Snow's
 message of "Mon, 26 Apr 2021 14:00:34 -0400")
Message-ID: <8735vc3zpb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 4/25/21 8:34 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> Annotations do not change runtime behavior.
>>> This commit *only* adds annotations.
>>>
>>> (Annotations for QAPIDoc are in a later commit.)
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/parser.py | 61 ++++++++++++++++++++++++++++--------------
>>>   1 file changed, 41 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>>> index d02a134aae9..f2b57d5642a 100644
>>> --- a/scripts/qapi/parser.py
>>> +++ b/scripts/qapi/parser.py
>>> @@ -17,16 +17,29 @@
>>>   from collections import OrderedDict
>>>   import os
>>>   import re
>>> -from typing import List
>>> +from typing import (
>>> +    Dict,
>>> +    List,
>>> +    Optional,
>>> +    Set,
>>> +    Union,
>>> +)
>>>   
>>>   from .common import match_nofail
>>>   from .error import QAPISemError, QAPISourceError
>>>   from .source import QAPISourceInfo
>>>   
>>>   
>>> +#: Represents a parsed JSON object; semantically: one QAPI schema expression.
>>> +Expression = Dict[str, object]
>> 
>> I believe you use this for what qapi-code-gen.txt calls a top-level
>> expression.  TopLevelExpression is rather long, but it's used just once,
>> and once more in RFC PATCH 13.  What do you think?
>> 
>
> Yeah, I left a comment on gitlab about this -- Sorry for splitting the 
> stream, I didn't expect you to reply on-list without at least clicking 
> the link ;)

I should have; sorry about that.  I need to avoid distractions to stay
productive, and web browsers are basically gatling guns firing
armor-piercing distraction rounds at me.

> You're right, this is TOP LEVEL EXPR. I actually do mean to start using 
> it in expr.py as well too, in what will become (I think) pt5c: 
> non-immediately-necessary parser cleanups.
>
> I can use TopLevelExpression as the type name if you'd like, but if you 
> have a suggestion for something shorter I am open to suggestions if 
> "Expression" is way too overloaded/confusing.

TopLevelExpr?  Matches qapi-code-gen.txt's grammar:

    SCHEMA = TOP-LEVEL-EXPR...

    TOP-LEVEL-EXPR = DIRECTIVE | DEFINITION

    DIRECTIVE = INCLUDE | PRAGMA
    DEFINITION = ENUM | STRUCT | UNION | ALTERNATE | COMMAND | EVENT

>>> +
>>> +# Return value alias for get_expr().
>>> +_ExprValue = Union[List[object], Dict[str, object], str, bool]
>> 
>> This is essentially a node in our pidgin-JSON parser's abstract syntax
>> tree.  Tree roots use the Dict branch of this Union.
>> 
>> See also my review of PATCH 06.
>> 
>
> OK, I skimmed that one for now but I'll get back to it.
>
>>> +
>>> +
>>>   class QAPIParseError(QAPISourceError):
>>>       """Error class for all QAPI schema parsing errors."""
>>> -    def __init__(self, parser, msg):
>>> +    def __init__(self, parser: 'QAPISchemaParser', msg: str):
>> 
>> Forward reference needs quotes.  Can't be helped.
>> 
>>>           col = 1
>>>           for ch in parser.src[parser.line_pos:parser.pos]:
>>>               if ch == '\t':
>>> @@ -38,7 +51,10 @@ def __init__(self, parser, msg):
>>>   
>>>   class QAPISchemaParser:
>>>   
>>> -    def __init__(self, fname, previously_included=None, incl_info=None):
>>> +    def __init__(self,
>>> +                 fname: str,
>>> +                 previously_included: Optional[Set[str]] = None,
>> 
>> This needs to be Optional[] because using the empty set as default
>> parameter value would be a dangerous trap.  Python's choice to evaluate
>> the default parameter value just once has always been iffy.  Stirring
>> static typing into the language makes it iffier.  Can't be helped.
>> 
>
> We could force it to accept a tuple and convert it into a set 
> internally. It's just that we seem to use it for sets now.

Another candidate: frozenset.

> Or ... in pt5c I float the idea of just passing the parent parser in, 
> and I reach up and grab the previously-included stuff directly.
>
>>> +                 incl_info: Optional[QAPISourceInfo] = None):
>>>           self._fname = fname
>>>           self._included = previously_included or set()
>>>           self._included.add(os.path.abspath(self._fname))
>>> @@ -46,20 +62,20 @@ def __init__(self, fname, previously_included=None, incl_info=None):
>>>   
>>>           # Lexer state (see `accept` for details):
>>>           self.info = QAPISourceInfo(self._fname, incl_info)
>>> -        self.tok = None
>>> +        self.tok: Optional[str] = None
>> 
>> Would
>> 
>>             self.tok: str
>> 
>> work?
>> 
>
> Not without modifications, because the Token being None is used to 
> represent EOF.

True.  I missed that, and thought we'd need None just as an initial
value here.

>>>           self.pos = 0
>>>           self.cursor = 0
>>> -        self.val = None
>>> +        self.val: Optional[Union[bool, str]] = None
>>>           self.line_pos = 0

[...]


