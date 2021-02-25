Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082683257E1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 21:45:20 +0100 (CET)
Received: from localhost ([::1]:44778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFNVe-00056y-IJ
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 15:45:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lFNUO-0004WO-RL
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:44:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lFNUL-00045U-HF
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614285835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/K81gw4n1GI/PJ/2681CqL71MDsgjSArbKzGxUqihiQ=;
 b=GhcZHK3BUJUSu4gdR3tbH+5/2QeSsxK1p2mWD8ivVs25RRNjFBe3688UxwCfd9soj3ze/I
 0XwzE//hDgpa5FQOcvBS8qaLa1VFG8jF8WM+xERIm6RVimOFMCRciSbpCbinyCLoZGUAvm
 nTqdxN+nNtVo0o5jRDX1SkFNU7upmgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-wTFhRvxCOoKOdiyqTQw15g-1; Thu, 25 Feb 2021 15:43:53 -0500
X-MC-Unique: wTFhRvxCOoKOdiyqTQw15g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A510801976;
 Thu, 25 Feb 2021 20:43:52 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DCF160D07;
 Thu, 25 Feb 2021 20:43:51 +0000 (UTC)
Subject: Re: [PATCH v3 03/16] qapi/expr.py: constrain incoming expression types
To: Markus Armbruster <armbru@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-4-jsnow@redhat.com>
 <8735xl7pit.fsf@dusky.pond.sub.org>
 <14af160f-7a06-7b9e-a770-13c1fef86ae4@redhat.com>
 <87o8g8s6n9.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <5630d887-3fb8-d46d-a047-aa02c51b6f26@redhat.com>
Date: Thu, 25 Feb 2021 15:43:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87o8g8s6n9.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 6:56 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 2/24/21 5:01 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> mypy does not know the types of values stored in Dicts that masquerade
>>>> as objects. Help the type checker out by constraining the type.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>>>> ---
>>>>    scripts/qapi/expr.py | 25 ++++++++++++++++++++++---
>>>>    1 file changed, 22 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>>>> index 5694c501fa3..783282b53ce 100644
>>>> --- a/scripts/qapi/expr.py
>>>> +++ b/scripts/qapi/expr.py
>>>> @@ -15,9 +15,17 @@
>>>>    # See the COPYING file in the top-level directory.
>>>>    
>>>>    import re
>>>> +from typing import MutableMapping, Optional
>>>>    
>>>>    from .common import c_name
>>>>    from .error import QAPISemError
>>>> +from .parser import QAPIDoc
>>>> +from .source import QAPISourceInfo
>>>> +
>>>> +
>>>> +# Expressions in their raw form are JSON-like structures with arbitrary forms.
>>>> +# Minimally, their top-level form must be a mapping of strings to values.
>>>> +Expression = MutableMapping[str, object]
>>>
>>> MutableMapping, fancy.  It's only ever dict.  Why abstract from that?
> 
> OrderedDict, actually.  MutableMapping is misleading, because it doesn't
> specify "orderedness".
> 

Yeah, I am realizing that Dict helps imply that constraint on 3.6+ but 
that MutableMapping doesn't.

I am worried about how hard it's gonna hurt when I remember why I wanted 
MutableMapping.

 >:|

For now, I'll go back to Dict.

>> I don't know! I referenced this in the cover letter. I cannot remember
>> the reason anymore. It had R-Bs on it so I left it alone.
>>
>> There are some differences, but I no longer remember why I thought they
>> applied. Maybe some of my more exploratory work wanted it. Dunno.
> 
> Happens.  It's a long patch queue you're trying to flush.
> 
>>> The use of object is again owed to mypy's inability to do recursive
>>> types.  What we really have here is something like
>>>
>>>      Expression = Union[bool, str, dict[str, Expression], list[Expression]]
>>>
>>> with the root further constrained to the Union's dict branch.  Spell
>>> that out in a bit more detail, like you did in introspect.py?
>>>
>>
>> Terminology problem?
>>
>> I am using "Expression" to mean very specifically a top-level object as
>> returned from parser.py, which *must* be an Object, so it *must* be a
>> mapping of str => yaddayadda.
> 
> Aha!
> 
> We'll talk some more about naming of type aliases in review of PATCH 08.
> 
>> The type as I intended it is Expression = Dict[str, yaddayadda]
>>
>> where yaddayadda is
>> Union[int, str, bool, List[yaddayadda], Dict[str, yaddayadda]]
> 
> Yes.
> 
> As qapi-code-gen.txt explains, we have two layers of syntax:
> 
> * The bottom layer is (heavily bastardized) JSON.  qapi-code-gen.txt
>    specifies it by listing the differences to RFC 8259.  parser.py parses
>    it into abstract syntax trees.
> 

Aside: A new realization about a deviation from JSON: objects are 
inherently unordered collections.

> * The upper layer recognizes the abstract syntax trees that are valid as
>    QAPI schema.  qapi-code-gen.txt specifies it with a context-free
>    grammar.  expr.py checks the ASTs against that grammar.  It also
>    expands shorthand forms into longhand.
> 
> Detail not documented in qapi-code-gen.txt: parser.py rejects non-object
> at the top-level, so expr.py doesn't have to.
> 

Yep.

>> expr.py is what validates the yaddayadda, so there's no point in trying
>> to type it further, I think.
> 
> If mypy could do recursive types, typing it further would be a
> no-brainer: just state what is.
> 
> Since it can't, we need to stop typing / start cheating at some point.
> Where exactly is not obvious.  Your idea is at least as good as mine.
> 
>> Probably worth a better comment.
> 
> Yes :)
> 

I'll look at Patch 8 and then revisit, but I will attempt to make a 
better comment. I think there are bits of part 5 that makes it a bit 
more obvious, because I create a Real Type :tm: to pass each 
"Expression" as a whole over to to expr.py.

(This is just kind of an intermediate form and as such it's not 
necessarily something I gave tremendous thought to.)

>>> Hmm, there you used Any, not object.  I guess that's because mypy lets
>>> you get away with object here, but not there.  Correct?
>>>
>>
>> Yep. I can get away with the stricter type here because of how we use
>> it, so I did. That's an artifact of it not being recursive and how
>> expr.py's entire raison d'etre is using isinstance() checks to
>> effectively downcast for us everywhere already.
>>
>>> Also, PEP 8 comment line length.
>>>
>>
>> Augh.
>>
>> Is there a way to set emacs mode highlighting in Python such that it
>> highlights when I run past the 72-col margin, but only for comments?
>>
>> I have the general-purpose highlighter on for the 80-col margin.
> 
> Got a .emacs snippet for me?
> 

I use only these bits:

  ;; Reflow-width defaults to 72.
  '(fill-column 72)

  ;; Highlight past column 80
  '(whitespace-line-column 80)

  ;; Theme whitespace highlighting as such:
  '(whitespace-style '(face empty tabs lines-tail trailing))

  ;; Don't insert tabs for spaces
  '(indent-tabs-mode nil)

>> I'm not familiar with any setting like this for any of the linters or
>> pycharm right away either.
> 
> Hmm, ... okay, TIL from pycodestyle(1):
> 
>              --max-line-length=n  set maximum allowed line length (default: 79)
>              --max-doc-length=n   set maximum allowed doc line length and perform these
>                                   checks (unchecked if not set)
> 
> Let me know whether --max-doc-length=72 fits the bill.
> 

It does.

I'd need to send a fixup patch in order to enable it, but I am not 
thrilled with the idea of having to squabble with you over how to break 
lines that are just barely overlong.

Least annoying for me: I write a draft patch to get the flake8 baseline 
for local testing, you copy-edit the patch to your stylistic liking, 
I'll ACK the edits.

>>
>>>>    
>>>>    
>>>>    # Names must be letters, numbers, -, and _.  They must start with letter,
>>>> @@ -287,9 +295,20 @@ def check_event(expr, info):
>>>>    
>>>>    def check_exprs(exprs):
>>>>        for expr_elem in exprs:
>>>> -        expr = expr_elem['expr']
>>>> -        info = expr_elem['info']
>>>> -        doc = expr_elem.get('doc')
>>>> +        # Expression
>>>> +        assert isinstance(expr_elem['expr'], dict)
> 
> Must be an *ordered* mapping, actually.  It's only ever OrderedDict.
> 

Allegedly. Lawsuit pending appeal.

>>>> +        for key in expr_elem['expr'].keys():
>>>> +            assert isinstance(key, str)
>>>> +        expr: Expression = expr_elem['expr']
> 
> *Unchecked* way to tell the type checker (I think):
> 
>               expr = cast(Expression, expr_elem['expr']
> 
> I like checking in general, but is it worth the bother here?
> 

It all goes away in the first half of part 5, where I create an 
Expression object that has typed fields for its components, and mypy's 
static checker does the rest of the lifting.

Could do casts, yeah, but I suppose I liked the assert to let me know 
that the types I saw on the back of my eyelids were the real ones.

>>>
>>> You're fine with repeating exp_elem['expr'] here, and ...
>>>
>>>> +
>>>> +        # QAPISourceInfo
>>>> +        assert isinstance(expr_elem['info'], QAPISourceInfo)
>>>> +        info: QAPISourceInfo = expr_elem['info']
>>>
>>> ... expr_elem['info'] here, but ...
>>>
>>>> +
>>>> +        # Optional[QAPIDoc]
>>>> +        tmp = expr_elem.get('doc')
>>>> +        assert tmp is None or isinstance(tmp, QAPIDoc)
>>>> +        doc: Optional[QAPIDoc] = tmp
>>>
>>> ... you avoid repetition of expr_elem.get('doc') here.  Any particular
>>> reason?
>>>
>>
>> Because this looks like garbage written by a drunkard:
>>
>> assert expr_elem.get('doc') is None or isinstance(expr_elem.get('doc'),
>> QAPIDoc)
>> doc: Optional[QAPIDoc] = expr_elem.get('doc')
> 
> Unchecked way:
> 
>               doc = cast(Optional[QAPIDoc], expr_elem.get('doc'))
> 
>>>>    
>>>>            if 'include' in expr:
>>>>                continue

I'll see if I can clean it up a little. I will take your suggestion of 
casts to mean that you'd be okay with actually not checking the form at 
runtime.


