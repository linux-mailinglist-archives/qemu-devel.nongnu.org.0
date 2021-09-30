Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D072B41D733
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 12:07:26 +0200 (CEST)
Received: from localhost ([::1]:41202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVsyK-0004Mb-Tx
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 06:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVsvc-0002bp-2L
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 06:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVsvX-0001QJ-8c
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 06:04:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632996269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=83O1NbwQ0WxHSvPCqeQcnyILAgBOBe8iflQ5rD6Em6A=;
 b=HCn1ZwwcuWS3d5iO1JS77uaniumol5dvFvTperOfA07gxHb0LduhtpTWZm1YyWe94fXt04
 JPnoBfjKvUCQJ5GwqjZH/tk+4E8oIidXJaKwE0tWGVdqJUy6lCEM0rOhYBwsa8QOaxryz/
 F/AVBNXHL++XpTdZ+iwJ8g9FYB/JuPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-cGjkV-HZNFOkAQAXz0jD-g-1; Thu, 30 Sep 2021 06:04:25 -0400
X-MC-Unique: cGjkV-HZNFOkAQAXz0jD-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E161D1090E67;
 Thu, 30 Sep 2021 10:04:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 760D719729;
 Thu, 30 Sep 2021 10:04:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 069AF113865F; Thu, 30 Sep 2021 12:04:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 3/6] qapi/parser: add type hint annotations (QAPIDoc)
References: <20210520225710.168356-1-jsnow@redhat.com>
 <20210520225710.168356-4-jsnow@redhat.com>
 <87o8943brt.fsf@dusky.pond.sub.org>
 <CAFn=p-Y4uqnLEvemPkTwYAdnFfoPLojyjRsWbD2zsEBpfvpqhQ@mail.gmail.com>
Date: Thu, 30 Sep 2021 12:04:22 +0200
In-Reply-To: <CAFn=p-Y4uqnLEvemPkTwYAdnFfoPLojyjRsWbD2zsEBpfvpqhQ@mail.gmail.com>
 (John Snow's message of "Tue, 28 Sep 2021 19:25:29 -0400")
Message-ID: <87bl4aqt09.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Tue, Sep 7, 2021 at 6:44 AM Markus Armbruster <armbru@redhat.com> wrote:
>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > Annotations do not change runtime behavior.
>> >
>> > This commit adds mostly annotations, but uses a TYPE_CHECKING runtime
>> > check to conditionally import dependencies, which only triggers during
>> > runs of mypy.
>>
>> Please add a reference to
>> https://mypy.readthedocs.io/en/latest/runtime_troubles.html#import-cycles
>>
>>
> OK.
>
>
>> > Signed-off-by: John Snow <jsnow@redhat.com>
>> >
>> > ---
>> >
>> > TopLevelExpr, an idea from previous drafts, makes a return here in order
>> > to give a semantic meaning to check_expr(). The type is intended to be
>> > used more in forthcoming commits (pt5c), but I opted to include it now
>> > instead of creating yet-another Dict[str, object] type hint that I would
>> > forget to change later.
>> >
>> > Signed-off-by: John Snow <jsnow@redhat.com>
>> > ---
>> >  scripts/qapi/parser.py | 77 ++++++++++++++++++++++++++----------------
>> >  1 file changed, 48 insertions(+), 29 deletions(-)
>> >
>> > diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>> > index 3ddde318376..b1e2fa5c577 100644
>> > --- a/scripts/qapi/parser.py
>> > +++ b/scripts/qapi/parser.py
>> > @@ -18,6 +18,7 @@
>> >  import os
>> >  import re
>> >  from typing import (
>> > +    TYPE_CHECKING,
>> >      Dict,
>> >      List,
>> >      Optional,
>> > @@ -30,6 +31,15 @@
>> >  from .source import QAPISourceInfo
>> >
>> >
>> > +if TYPE_CHECKING:
>> > +    # pylint: disable=cyclic-import
>> > +    # TODO: Remove cycle. [schema -> expr -> parser -> schema]
>>
>
> WRT this todo: you mentioned that you'd prefer having some idea or plan for
> how to eliminate the cycle in order to let this band-aid fly. How about
> adding a 'doc' member to e.g. QAPISchemaFeature and doing the connection
> entirely inside of schema.py, and dropping connect_member() and
> connect_feature()?
>
> Would that be serviceable?

I guess it would.  One way to find out.

>> > +    from .schema import QAPISchemaFeature, QAPISchemaMember
>> > +
>> > +
>> > +#: Represents a single Top Level QAPI schema expression.
>> > +TopLevelExpr = Dict[str, object]
>>
>> Related: _ExprValue below, and _JSONObject in expr.py.  The latter's
>> comment gives the best rationale (except I don't get "the purpose of
>> this module is to interrogate that type").
>>
>>
> in expr.py, the purpose of that module (expr) is explicitly to interrogate
> (check, validate) the shape of arbitrary JSON objects. I am saying that a
> more strict definition specifically here in expr.py is not necessary
> because the entire purpose of expr.py is to, at runtime, verify the shape
> of any such variables that might be annotated that way. I am drawing some
> distinction to introspect.py, where we're generating that data ourselves --
> the stronger types are more viable there, because we know what they are
> already.

Let me try to write a clearer comment:

    # Deserialized JSON objects as returned by the parser.
    # This is a actually Dict[str, _JSONValue], where _JSONValue is
    # Union[bool, str, List[Self], Dict[str, Self]].  Since mypy lacks
    # recursive types, we can't define _JSONValue, and use object
    # instead.  Sad.
    _JSONObject = Dict[str, object]

> (again, sorry about mypy's lack of recursive typing, I hate it too, I
> promise)

We got to play the hand we've been dealt.

>> I think we'd like to have
>>
>> * A recursive type for JSON value (in our bastardized version of JSON)
>>
>>   This is Union of bool, str, List[Self], Dict[str, Self].  It's what
>>   .get_expr() returns.
>>
>>   Since mypy can't do recursive, we approximate with _ExprValue.
>>
>> * A recursive type for JSON object
>>
>>   This is the Dict branch of the above.  It's what check_keys() &
>>   friends take as argument.
>>
>>   We approximate with _JSONObject.
>>
>>   Same for the List branch would make sense if we had a use for the
>>   type.
>>
>> * A recursive type for TOP-LEVEL-EXPR
>>
>>   Actually the same type as the previous one, to be used only for the
>>   schema's top-level expressions.  It's the elements of
>>   QAPISchemaParser.exprs[], and what check_exprs() takes as argument.
>>
>>   We approximate with TopLevelExpr, but so far use it only for
>>   check_exprs().
>>
>>   Doesn't really improve type checking, but may serve as documentation.
>>
>>
> That's the intended effect here -- to help highlight which functions
> operate on those top-level expressions, and which might be invoked in more
> arbitrary cases.
> Consider also a hypothetical TOP-LEVEL-EXPR that is actually a bona-fide
> object with additional metadata, too. In these cases, the type really will
> be different.
>
>
>> Shouldn't these types be all defined in one place, namely right here?
>> Bonus: we need to explain the mypy sadness just once then.
>>
>> Shouldn't their names be more systematic?  _ExprValue, _JSONObject and
>> TopLevelExpr hardly suggest any relation...
>>
>>
> I drop _JSONObject in pt5c, it was a stop-gap. For the rest, I'll see about
> a more rigorous consolidation now that we're this far in.
>
> pt5c was intended as a "cleanup" step that did some of that consolidation
> of nearly-redundant types; but I wanted all of parser.py under the mypy gun
> *first*.
> Will you take a raincheck here and we'll focus on the consolidation in the
> next series? I agree it's worth doing.

Works for me.

> (I can add a 'FIXME' that will 100% need to be fixed before I move
> scripts/qapi under python/qemu/qapi -- the linter config there prohibits
> them, so you can be sure I can't ignore it.)

Makes sense.


