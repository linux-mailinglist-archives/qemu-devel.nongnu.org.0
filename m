Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BA3316847
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 14:49:44 +0100 (CET)
Received: from localhost ([::1]:60158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9psF-0005jy-Ge
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 08:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9pqh-00051U-KF
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:48:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9pqa-0001YU-TE
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612964880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NA/EbQu9ywS5JZqu+P/APGawjWgAG8GQAaowk9g+hNU=;
 b=jMnuhS4D6F9ASVjdWSYdfrGWY1JEOHboN/OSMTMCqiwynezkXas0+pwsMUwjmrOZLE0N1R
 2+XSy//P3tNAJSDYos39aOl5rC0PqxhIfCzoBS5sUZs5QlgplczFLWbhoqeOsEGCI3V4ZS
 ezGytKtjIZCNE+fRKmaPCWoX1rbemhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-mOdYZGQTOYqFSP73q5AttQ-1; Wed, 10 Feb 2021 08:47:58 -0500
X-MC-Unique: mOdYZGQTOYqFSP73q5AttQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DD76803F5D
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 13:47:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 348041A7C1;
 Wed, 10 Feb 2021 13:47:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A7142113865F; Wed, 10 Feb 2021 14:47:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 5/6] qapi: Add support for aliases
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-6-kwolf@redhat.com>
 <8735y45ljy.fsf@dusky.pond.sub.org>
 <20210210122628.GA5144@merkur.fritz.box>
Date: Wed, 10 Feb 2021 14:47:55 +0100
In-Reply-To: <20210210122628.GA5144@merkur.fritz.box> (Kevin Wolf's message of
 "Wed, 10 Feb 2021 13:26:28 +0100")
Message-ID: <87pn18vxtg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 10.02.2021 um 10:17 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > Introduce alias definitions for object types (structs and unions). This
>> > allows using the same QAPI type and visitor for many syntax variations
>> > that exist in the external representation, like between QMP and the
>> > command line. It also provides a new tool for evolving the schema while
>> > maintaining backwards compatibility during a deprecation period.
>> >
>> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> > ---
>> >  docs/devel/qapi-code-gen.txt           | 37 +++++++++++++++++++++++---
>> >  docs/sphinx/qapidoc.py                 |  2 +-
>> >  scripts/qapi/expr.py                   | 34 +++++++++++++++++++++--
>> >  scripts/qapi/schema.py                 | 27 +++++++++++++++----
>> >  scripts/qapi/types.py                  |  4 ++-
>> >  scripts/qapi/visit.py                  | 33 ++++++++++++++++++++---
>> >  tests/qapi-schema/test-qapi.py         |  7 ++++-
>> >  tests/qapi-schema/double-type.err      |  2 +-
>> >  tests/qapi-schema/unknown-expr-key.err |  2 +-
>> >  9 files changed, 130 insertions(+), 18 deletions(-)
>> >
>> > diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
>> > index 6906a06ad2..6da14d5275 100644
>> > --- a/docs/devel/qapi-code-gen.txt
>> > +++ b/docs/devel/qapi-code-gen.txt
>> > @@ -231,7 +231,8 @@ Syntax:
>> >                 'data': MEMBERS,
>> >                 '*base': STRING,
>> >                 '*if': COND,
>> > -               '*features': FEATURES }
>> > +               '*features': FEATURES,
>> > +               '*aliases': ALIASES }
>> >      MEMBERS = { MEMBER, ... }
>> >      MEMBER = STRING : TYPE-REF
>> >             | STRING : { 'type': TYPE-REF,
>> 
>> Missing: a forward reference, like we have for 'if' and 'features'.
>> Here's the obvious one:
>> 
>>    The optional 'if' member specifies a conditional.  See "Configuring
>>    the schema" below for more on this.
>> 
>>    The optional 'features' member specifies features.  See "Features"
>>    below for more on this.
>> 
>>   +The optional 'aliases' member specifies aliases.  See "Aliases" below
>>   +for more on this.
>> 
>> > @@ -286,13 +287,15 @@ Syntax:
>> >      UNION = { 'union': STRING,
>> >                'data': BRANCHES,
>> >                '*if': COND,
>> > -              '*features': FEATURES }
>> > +              '*features': FEATURES,
>> > +              '*aliases': ALIASES }
>> >            | { 'union': STRING,
>> >                'data': BRANCHES,
>> >                'base': ( MEMBERS | STRING ),
>> >                'discriminator': STRING,
>> >                '*if': COND,
>> > -              '*features': FEATURES }
>> > +              '*features': FEATURES,
>> > +              '*aliases': ALIASES }
>> >      BRANCHES = { BRANCH, ... }
>> >      BRANCH = STRING : TYPE-REF
>> >             | STRING : { 'type': TYPE-REF, '*if': COND }
>> 
>> Likewise.
>> 
>> > @@ -837,6 +840,34 @@ shows a conditional entity only when the condition is satisfied in
>> >  this particular build.
>> >  
>> >  
>> > +=== Aliases ===
>> > +
>> > +Object types, including structs and unions, can contain alias
>> > +definitions.
>> > +
>> > +Aliases define alternative member names that may be used in the
>> > +external representation to provide a value for a member in the same
>> > +object or in a nested object.
>> 
>> "or one if its sub-objects"?  Not sure which is better.
>
> "nested object" feels a little clearer to me, but not that it's a big
> difference. If you feel "sub-object" is better, I can use that.
>
>> > +
>> > +Syntax:
>> > +    ALIAS = { '*alias': STRING,
>> > +              'source': [ STRING, ... ] }
>> 
>> You used non-terminal ALIASES above.  Please define it here.
>> 
>> I have doubts about the name 'alias'.  The alias is the complete thing,
>> and 'alias' is just one property of the complete thing.  I think 'name'
>> would be better.  Further evidence: below, you write "If 'alias' is
>> present" and "If 'alias' is not present".  I think both read better with
>> 'name' instead of 'alias'.
>
> Works for me.
>
>> > +
>> > +'source' is a list of member names representing the path to an object
>> > +member, starting from the type where the alias definition is
>> > +specified.
>> 
>> May 'source' be empty?  More on that below.
>
> No. Empty 'source' isn't the path to any object member, so it doesn't
> meet the requirement. If you prefer, we can explicitly specify a
> "non-empty list".

I think it's best to be tediously explicit here.

>> "where the definition is specified" feels a bit awkward, and "path"
>> slightly hand-wavy.  Let me try induction:
>> 
>>    'source' is a list of member names.  The first name is resolved in
>>    the same object.  Each subsequent member is resolved in the object
>>    named by the preceding member.
>> 
>> Differently awkward, I guess.
>
> Now you've left out what the purpose of it is. I think I'll combine your
> version with my first part ("'source' is a list of member names
> representing the path to an object member").
>
>> >              It may refer to another alias name.  It is allowed to use
>> > +a path that doesn't necessarily match an existing member in every
>> > +variant or even at all; in this case, the alias remains unused.
>> 
>> Aha!  Knowing this would've saved me some trouble in reviewing code.
>> 
>> I wrote on PATCH 1:
>> 
>>     I think updating the big comment in visitor.h for aliases would help.
>>     Let's postpone it until I've seen the rest of the series.
>> 
>> We can cover unused aliases right there.  Whether they also need to go
>> into contracts we'll see.
>
> Ok. I assume updating that big comment is still postponed because you
> saw the series, but didn't actually review all of it yet?

Writing documentation before I understand the code is probably not a
good use of my time, and my reviewer's time, too.  Getting there.

If you want to try, go right ahead.

>> What if only a *prefix* of 'source' matches?  E.g.
>> 
>>     'source': ['eins', 'zwei', 'drei']
>> 
>> and we have an object-valued member 'eins' (match), which has a member
>> 'zwei' (match), which is *not* an object.  Is that an error?  Is it
>> caught?
>
> This feels like a realistic case to me when 'eins' is a union type where
> some variants contain an object 'zwei' with a member 'drei' and others
> have 'zwei' as a non-object member.
>
> In this case, we want the alias not to match in the non-object 'zwei'
> case, but we do want it to match in another variant. So it is
> intentionally not an error.
>
> The QAPI generator could try to prove that there is at least one variant
> where the alias would actually be applied, but just leaving it unused
> when it doesn't match anywhere seemed good enough to me.

I see.

A typo can get your alias silently ignored.  A bit of a trap.  Testing
should catch this, of course.

Consider adding a comment in the QAPI generator along the lines "could
check this, but not sure it's worth our while", and a short note in
qapi-code-gen.txt to warn users about the trap.

>> > +
>> > +If 'alias' is present, then the single member referred to by 'source'
>> > +is made accessible with the name given in 'alias' in the type where
>> > +the alias definition is specified.
>> 
>> 'source' may not be empty here.  Correct?
>> 
>> If yes, please spell it out.
>
> Yes. Does spelling it out more explicitly in the description of 'source'
> suffice?

I think so, yes.

>> Double-checking I got it...  Say we have
>> 
>>     'alias': 'foo',
>>     'source': ['bar', 'baz']
>> 
>> where 'bar' is an object with a member 'baz'.
>> 
>> Then input "foo": FOOVAL gets interpreted like "bar": {"baz": FOOVAL}.
>> 
>> If input also contains "bar", we merge.  Duplicates are an error.
>> 
>> This is the case even when 'baz' is an object.  If you want to alias
>> member 'foo' of 'baz', you have to say
>> 
>>     'alias': 'foo',
>>     'source': ['bar', 'baz', 'foo']
>> 
>> Correct?
>
> Correct.
>
>> > +
>> > +If 'alias' is not present, then all members in the object referred to
>> > +by 'source' are made accessible in the type where the alias definition
>> > +is specified with the same name as they have in 'source'.
>> 
>> 'source' may not be empty here, either.  Correct?
>> 
>> If yes, please spell it out, and make sure the code catches it.
>
> Yes, as above. It's checked in check_aliases():
>
>         if not a['source']:
>             raise QAPISemError(info, "'source' must not be empty")
>
>> What if it resolve to a non-object?  Is that an error?  Is it caught?
>
> Same as above, it just doesn't match.
>
>> Continuing the double-checking...  Say we have
>> 
>>     # alias missing
>>     'source': ['gnu']
>> 
>> where 'gnu' is an object with a member 'gnat'.
>> 
>> Input "gnat": GNATVAL gets interpreted like "gnu": {"gnat": GNATVAL}.
>> 
>> Correct?
>
> Yes.
>
>> The document could use examples.  Feel free to steal mine.
>> 
>> I think we should talk about 'alias' first, and only then about
>> 'source'.  It matches their order in the schema, and also matches how I
>> think about aliases, namely "this name actually means that".  Here,
>> "this name" is 'alias', and "that" is 'source'.
>> 
>> > +
>> > +
>> 
>> Don't get deceived by my comments; this is a pretty good start.
>> 
>> I wish I had studied this part before PATCH 1.
>> 
>> >  === Documentation comments ===
>> >  
>> >  A multi-line comment that starts and ends with a '##' line is a
>> 
>> I intend to look at the remainder shortly.
>
> Ok. I'll prepare for a context switch to actually be able to address
> your comments on the other patches and to figure out what I had already
> addressed in my branch during your last review attempt.

I intend to look at the remainder of PATCH 5 this afternoon.

> I thought I had done a better than average job on documenting the code
> (at least compare to my other patches), but doesn't seem so...

Writing excellent documentation for code you just wrote is *hard*!  I
think yours was pretty good, actually.


