Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2844931E876
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 11:27:47 +0100 (CET)
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCgXC-0000Z3-5P
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 05:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCgWI-00006w-JY
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 05:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCgWG-0008Md-Im
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 05:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613644007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LLW89Jy+BVfpdLK/3y2RKDLyb3961SkAUDDucmIbLAA=;
 b=bLAIjrLEPVUHEEE4PhPEgYSiWhikOyJxpc8bSA0Bohv65cQ+Ac6vizvYuSgQ3xApdW9HVB
 eEDoLEMHTsd7VqReWdvPTDvWEiAe6Z+5znXlQextuKCLNTvTZ9oCjaQXkwp6uLyqLKuoeK
 c2IgqFR9rJUR/D4W6GgtIOamZyIu0J4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-G__HgqN6ML24ZwmP2easjA-1; Thu, 18 Feb 2021 05:26:45 -0500
X-MC-Unique: G__HgqN6ML24ZwmP2easjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E9B3107ACF4
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 10:26:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD8177046C;
 Thu, 18 Feb 2021 10:26:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2E547113860F; Thu, 18 Feb 2021 11:26:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 5/6] qapi: Add support for aliases
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-6-kwolf@redhat.com>
 <87ft1ura4g.fsf@dusky.pond.sub.org>
 <20210217161725.GB5662@merkur.fritz.box>
Date: Thu, 18 Feb 2021 11:26:42 +0100
In-Reply-To: <20210217161725.GB5662@merkur.fritz.box> (Kevin Wolf's message of
 "Wed, 17 Feb 2021 17:17:25 +0100")
Message-ID: <875z2pisd9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 17.02.2021 um 16:23 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > Introduce alias definitions for object types (structs and unions). This
>> > allows using the same QAPI type and visitor for many syntax variations
>> > that exist in the external representation, like between QMP and the
>> > command line. It also provides a new tool for evolving the schema while
>> > maintaining backwards compatibility during a deprecation period.
>> >
>> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> [...]
>> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
>> > index 22e62df901..e370485f6e 100644
>> > --- a/scripts/qapi/visit.py
>> > +++ b/scripts/qapi/visit.py
>> > @@ -26,6 +26,7 @@ from .common import (
>> >  from .gen import QAPISchemaModularCVisitor, ifcontext
>> >  from .schema import (
>> >      QAPISchema,
>> > +    QAPISchemaAlias,
>> >      QAPISchemaEnumMember,
>> >      QAPISchemaEnumType,
>> >      QAPISchemaFeature,
>> > @@ -60,7 +61,8 @@ bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp);
>> >  def gen_visit_object_members(name: str,
>> >                               base: Optional[QAPISchemaObjectType],
>> >                               members: List[QAPISchemaObjectTypeMember],
>> > -                             variants: Optional[QAPISchemaVariants]) -> str:
>> > +                             variants: Optional[QAPISchemaVariants],
>> > +                             aliases: List[QAPISchemaAlias]) -> str:
>> >      ret = mcgen('''
>> >  
>> >  bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
>> > @@ -68,6 +70,24 @@ bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
>> >  ''',
>> >                  c_name=c_name(name))
>> >  
>> > +    if aliases:
>> > +        ret += mcgen('''
>> > +    visit_start_alias_scope(v);
>> > +''')
>> > +
>> > +    for a in aliases:
>> > +        if a.name:
>> > +            name = '"%s"' % a.name
>> > +        else:
>> > +            name = "NULL"
>> > +
>> > +        source = ", ".join('"%s"' % x for x in a.source)
>> > +
>> > +        ret += mcgen('''
>> > +    visit_define_alias(v, %(name)s, (const char * []) { %(source)s, NULL });
>> > +''',
>> > +                     name=name, source=source)
>> > +
>> >      if base:
>> >          ret += mcgen('''
>> >      if (!visit_type_%(c_type)s_members(v, (%(c_type)s *)obj, errp)) {
>> > @@ -133,6 +153,11 @@ bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
>> >      }
>> >  ''')
>> >  
>> > +    if aliases:
>> > +        ret += mcgen('''
>> > +    visit_end_alias_scope(v);
>> > +''')
>> > +
>> >      ret += mcgen('''
>> >      return true;
>> >  }
>> 
>> The visit_type_FOO_members() are primarily helpers for the
>> visit_type_FOO().  But they also get called
>> 
>> * by visit_type_BAR_members() when
>> 
>>   - struct or union BAR has 'base': 'FOO'
>>   - union or alternate BAR a variant 'FOO'
>> 
>> * by qmp_marshal_CMD() when
>> 
>>   - CMD has 'boxed': true, 'data': 'FOO'
>> 
>> Have you considered these cases?
>> 
>> How's the test coverage?
>
> What is the difference between these cases? The visiting should work the
> same, no matter from where it was started.
>
> I did consider the struct base/union variant case and this is why I
> introduced visit_start/end_alias_scope so that aliases wouldn't leak to
> the outer level.

Good!

The qmp_marshal_CMD()'s code around visit_type_FOO_members() is fairly
close to visit_type_FOO()'s code: it avoids allocation and drops cases
that can't happen with the visitor at hand.  Can't see why aliases would
not work.

"Can't see why it would not work" is of course a sensible precondition
for testing, not an excuse for not testing.

> Now that I'm trying to think of a test case, this probably only protects
> against weird corner cases: The input object is the same anyway, so I
> guess the only way for this to make a difference is when the base struct
> defines an alias for a member that it doesn't even have (so the alias
> would remain unused when applied to the base struct independently), but
> that exists in the struct in which it is embedded.

It's best to strangle such weird corner cases in the crib, before they
can conspire with other weird corner cases to make a real mess.

> I hope adding a test case that checks that this is an error should be
> easy. Would the right place be tests/test-qobject-input-visitor.c?

Sounds good to me.

> Can you think of any other specific differences that need to be tested?

I think you nailed the negative tests.

The positive tests are limited to frontend tests now, i.e. put some
valid use into qapi-schema-test.json, then check the resulting
qapi-schema-test.out looks sane.  Covered there, I think:

* empty 'aliases' have no effect: AliasStruct0

  Aside: we could choose to outlaw instead.

* alias a struct member: AliasStruct1

* alias a member of a struct member: AliasStruct2

* alias all members of a struct member: AliasStruct3

* alias a member of a flat union variant: AliasFlatUnion

* alias all members of all simple union variants: AliasSimpleUnion

Missing, I think:

* alias a member of the base struct

* alias a member of a member of a struct member

I figure both are relatively uninteresting as front-end tests, but unit
tests (below) will need them.

Possibly:

* alias a member of a simple union variant

* alias all members of a simple union variant

Not sure how much these buy us over the other tests.  Perhaps we should
spend our limited time on killing simple unions instead (I hope aliases
will help us get there).

Aside: we could add aliases to alternates, for rewriting a non-object
variant into an object variant.  Not now, and later only if we find
sufficiently compelling uses.

Unit tests go further than frontend tests: they test the generated
code.  And the hand-written code, of course.

We should cover the various paths through
qobject_input_try_get_object().

I'd like us to cover its use in the various contexts, i.e. from all
kinds of callers of visit_type_BAR_members().  See above for a list.

I don't think we need to do the full test matrix.  The inner workings of
qobject_input_try_get_object() look independent enough from the contexts
to justify risking a short cut.  So, cover the paths, and also cover the
contexts, but don't cover the paths for each context.

What do you think?

Feel free to suggest more tests, or more shortcuts.


