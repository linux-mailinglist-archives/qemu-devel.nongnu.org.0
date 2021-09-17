Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDD540F422
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 10:29:33 +0200 (CEST)
Received: from localhost ([::1]:46840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR9FU-0000PQ-MA
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 04:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mR9DC-0005mg-ES
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mR9D9-00018L-VD
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631867226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bz60E5TIyDZ2BW1IV0CdvvwziMWaSzYg8yhQIAEx2Zg=;
 b=afsQC2WSrbyZrk4pgF35677UQMHb0cZzbWe0BfG/fl7KsihcijVJZkHGsTPV1ty3o3WxRJ
 A2kXv/GggVXi9x43c++nSjuq4vyh51YByiGCnppp8Av2I7WBE2X8JE5N5Y+TtR7UUyTn8f
 gdceYMG/F8CwYBbD0QbmZgsqZR16d5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-jIOH8wG-MBeFfyMFW6MejA-1; Fri, 17 Sep 2021 04:27:02 -0400
X-MC-Unique: jIOH8wG-MBeFfyMFW6MejA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE7845127
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 08:27:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01AC65C1CF;
 Fri, 17 Sep 2021 08:26:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8AC47113865F; Fri, 17 Sep 2021 10:26:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-7-kwolf@redhat.com>
 <878s09d8pe.fsf@dusky.pond.sub.org> <YTt0G1cs+BweXOMD@redhat.com>
 <87bl4vedma.fsf@dusky.pond.sub.org> <YUB0BcZUwwwecrFl@redhat.com>
 <87k0jj8evk.fsf@dusky.pond.sub.org> <YUG71uATYCwpRyQH@redhat.com>
Date: Fri, 17 Sep 2021 10:26:56 +0200
In-Reply-To: <YUG71uATYCwpRyQH@redhat.com> (Kevin Wolf's message of "Wed, 15
 Sep 2021 11:24:38 +0200")
Message-ID: <8735q3y5db.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 14.09.2021 um 15:29 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>>=20
>> > Am 14.09.2021 um 10:59 hat Markus Armbruster geschrieben:
>> >> >> > +    /* You can't use more than one option at the same time */
>> >> >> > +    v =3D visitor_input_test_init(data, "{ 'foo': 42, 'nested':=
 { 'foo': 42 } }");
>> >> >> > +    visit_type_AliasStruct3(v, NULL, &tmp, &err);
>> >> >> > +    error_free_or_abort(&err);
>> >> >>=20
>> >> >> "Parameter 'foo' is unexpected".  Say what?  It *is* expected, it =
just
>> >> >> clashes with 'nested.foo'.
>> >> >>=20
>> >> >> I figure this is what happens:
>> >> >>=20
>> >> >> * visit_type_AliasStruct3()
>> >> >>=20
>> >> >>   - visit_start_struct()
>> >> >>=20
>> >> >>   - visit_type_AliasStruct3_members()
>> >> >>=20
>> >> >>     =E2=80=A2 visit_type_AliasStruct1() for member @nested.
>> >> >>=20
>> >> >>       This consumes consumes input nested.foo.
>> >> >>=20
>> >> >>   - visit_check_struct()
>> >> >>=20
>> >> >>     Error: input foo has not been consumed.
>> >> >>=20
>> >> >> Any ideas on how to report this error more clearly?
>> >> >
>> >> > It's a result of the logic that wildcard aliases are silently ignor=
ed
>> >> > when they aren't needed. The reason why I included this is that it =
would
>> >> > allow you to have two members with the same name in the object
>> >> > containing the alias and in the aliased object without conflicting =
as
>> >> > long as both are given.
>> >>=20
>> >> *brain cramp*
>> >>=20
>> >> Example?
>> >
>> > Let's use the real-world example I mentioned below:
>> >
>> > { 'union': 'ChardevBackend',
>> >   'data': { ...,
>> >             'socket': 'ChardevSocket',
>> >             ... },
>> >   'aliases': [ { 'source': ['data'] } ] }
>>=20
>> To pretend the simple union was flat, i.e. peel off its 'data', because
>> that nesting doesn't exist in the CLI you want to QAPIfy.
>>=20
>> >
>> > { 'struct': 'ChardevSocket',
>> >   'data': { 'addr': 'SocketAddressLegacy',
>> >             ... },
>> >   'base': 'ChardevCommon',
>> >   'aliases': [ { 'source': ['addr'] } ] }
>>=20
>> To unbox struct SocketAddressLegacy, i.e. peel off its 'addr', for the
>> same reason.
>>=20
>> >
>> > { 'union': 'SocketAddressLegacy',
>> >   'data': {
>> >     'inet': 'InetSocketAddress',
>> >     'unix': 'UnixSocketAddress',
>> >     'vsock': 'VsockSocketAddress',
>> >     'fd': 'String' },
>> >   'aliases': [
>> >     { 'source': ['data'] },
>>=20
>> To pretend the simple union was flat, i.e. peel off its 'data',
>>=20
>> >     { 'name': 'fd', 'source': ['data', 'str'] }
>>=20
>> To unbox struct String, i.e. peel off its 'data'.
>>=20
>> >   ] }
>>=20
>> Okay, I understand what you're trying to do.  However:
>>=20
>> > We have two simple unions there, and wildcard aliases all the way
>> > through, so that you can have things like "hostname" on the top level.
>> > However, two simple unions mean that "type" could refer to either
>> > ChardevBackend.type or to SocketAddressLegacy.type.
>>=20
>> Yup.  In ChardevBackend, we have both a (common) member @type, and a
>> chain of aliases that resolves @type to data.addr.data.type.
>>=20
>> > Even though strictly speaking 'type=3Dsocket' is ambiguous, you don't =
want
>> > to error out, but interpret it as a value for the outer one.
>>=20
>> I'm not sure.
>
> It's the only possible syntax for specifying ChardevBackend.type, so if
> you don't allow this, everything breaks down.
>
>> When exactly are collisions an error?  How exactly are non-erroneous
>> collisions resolved?  qapi-code-gen.rst needs to answer this.
>
> The strategy implemented in this version is: Collisions are generally an
> error, except for wildcard aliases conflicting with a non-wildcard-alias
> value. In this case the wildcard alias is ignored and the value is
> assumed to belong elsewhere.

Kinds of collisions:

                member          ordinary alias  wildcard alias
member          error[1]        error[2]        member wins[4]
ordinary alias                  error[3]        ordinary wins[4]
wildcard alias                                  ???[5]

[1] Test case duplicate-key demonstrates.

[2] Test case alias-name-conflict demonstrates.

[3] No test case, manual testing results in "alias 'a' collides with
    alias 'a'".

[4] Please confirm I got this right.

[5] No test case, manual testing results in no error.  What's the
    intended behavior?

> If it doesn't belong elsewhere in the end, it still sits in the QDict
> when qobject_input_check_struct() runs, so you get an error.
>
>> Back to the example.  If 'type' resolves to ChardevBackend's member, how
>> should I specify SocketAddressLegacy's member?  'addr.type'?
>>=20
>> Aside: existing -chardev infers SocketAddressLegacy's tag addr.type from
>> the presence of variant members, but that's a separate QAPIfication
>> problem.
>
> So does the new -chardev in its compatibility code, but if you want to
> specify it explicitly, addr.type is what you should use.
>
>> I figure aliases let me refer to these guys at any level I like:
>> 'data.addr.data.FOO', 'data.addr.FOO', 'addr.data.FOO', 'addr.FOO', or
>> just 'FOO'.  Except for 'type', where just 'type' means something else.
>> Bizarre...
>
> About as bizarre as shadowing variables in C. The more local one wins.

The part where member 'type' shadows alias 'type' is intentional, and
you're right, it's hardly bizarre, just risks confusion (so does
shadowing in C).

The part where intermediate aliases contaminate the external interface
is an artifact of how we provide the "final" alias.  The combination of
these unwanted artifacts with the shadowing feels bizarre to me.  Eye of
the beholder, etc., etc.

>> We actually require much less: for QMP chardev-add, we need
>> 'data.addr.data.FOO' and nothing else, and for CLI -chardev, we need
>> 'FOO' and nothing else (I think).  The unneeded ones become accidental
>> parts of the external interface.  If experience is any guide, we'll have
>> plenty of opportunity to regret such accidents :)
>>=20
>> Can we somehow restrict external interfaces to what we actually need?
>
> Not reasonably, I would say. Of course, you could try to cover all
> paths with aliases in the top level, but the top level really shouldn't
> have to know about the details of types deep inside some union variants.
>
> The solution for reducing the allowed options here is to work on
> introspection, mark 'data' deprecated everywhere and get rid of the
> simple union nonsense.

Accidental extension of QMP to enable QAPIfication elsewhere would be a
mistake.  Elsewhere right now: -chardev.

The knee-jerk short-term solution for QMP is to ignore aliases there
completely.  Without introspection, they can't be used seriously anyway.

Of course, we eventually want to use them for evolving QMP, e.g. to
flatten simple unions.  The knee-jerk solution sets up another obstacle.

The issue also exists in -chardev with a JSON argument.  We can apply
the knee-jerk solution to any JSON-based interface, not just to QMP.

The issue also exists in -chardev with a dotted keys argument.  There,
we definitely need the outermost alias (e.g. "host") for compatibility,
and we may want the member ("data.addr.data.host") for symmetry with
JSON.  I can't see an argument for exposing the intermediate aliases as
dotted keys, though.

I find the argument "for symmetry with JSON" quite weak.  But exposing
the member seems unlikely to create problems later on.

You argue that "the top level really shouldn't have to know about the
details of types deep inside some union variants."  That's a valid
argument about the QAPI schema language's support for abstraction.  But
the QAPI schema language is means, while the external interfaces are
ends.  They come first.  A nicer schema language is certainly desirable,
but the niceties shouldn't leak crap into the external interfaces.

Let me work through an example to ground this.  Consider chardev-add /
-chardev.  Structure of chardev-add's argument:

    id: str
    backend:
        type: enum ChardevBackendKind
        data: one of the following, selected by the value of @type:
        for socket:
            addr:
                type: enum SocketAddressType
                data: one of the following, selected by the value of @type:
                  for inet:
                  host: str
                  ...
          ...

In contrast, -chardev's argument is flat.  To QAPIfy it, we could use
aliases from the root into the object nest:

    from type to backend.type
    from host to backend.data.addr.data.host
    ...

We'd certainly design chardev-add's argument differently today, namely
with much less nesting.  Say we want to evolve to this structure:

    id: str
    type: enum ChardevBackendKind
    one of the following, selected by the value of @type:
    for socket:
    addr:
        type: enum SocketAddressType
        one of the following, selected by the value of @type:
        for inet:
        host: str
        ...
    ...

We obviously need to keep the old structure around for compatibility.
For that, we could use a *different* set of aliases:

    from type to backend.type
    from addr.host to backend.data.addr.data.host
    ...

What's the plan for supporting different uses wanting different aliases?
Throw all the aliases together and shake?  Then one interface's
requirements will contaminate other interfaces with unwanted aliases.
Getting one interface right is hard enough, having to reason about *all*
QAPI-based interfaces would set us up for failure.  And what if we run
into contradictory requirements?

Could we instead tag aliases somehow, pass a tag to the visitor, and
have it ignore aliases with a different tag?

Reminds me of the problem of generating multiple QMPs from a single
schema, e.g. one for qemu-system-FOO, and another one for
qemu-storage-daemon.  Inchoate idea: use tags for that somehow.  But I
digress.

I'm actually tempted to try how far we can get with just one level of
aliases, i.e. aliases that can only resolve to a member, not to another
alias.  I'd expect the code to become quite a bit simpler.

One of the main reasons why this work has such a rough time in review is
that thinking through possible effects make my head explode.  I sure
wish I had a stronger head.  Weaker effects are commonly easier to get,
though.

I apologize for this wall of text.  I've been thinking in writing again.

>> >> > Never skipping wildcard aliases makes the code simpler and results =
in
>> >> > the expected error message here. So I'll do that for v4.
>> >>=20
>> >> Trusting your judgement.
>> >>=20
>> >> > Note that parsing something like '--chardev type=3Dsocket,addr.type=
=3Dunix,
>> >> > path=3D/tmp/sock,id=3Dc' now depends on the order in the generated =
code. If
>> >> > the top level 'type' weren't parsed and removed from the input firs=
t,
>> >> > visiting 'addr.type' would now detect a conflict. For union types, =
we
>> >> > know that 'type' is always parsed first, so it's not a problem, but=
 in
>> >> > the general case you need to be careful with the order.
>> >>=20
>> >> Uff!  I think I'd like to understand this better.  No need to delay v=
4
>> >> for that.
>> >>=20
>> >> Can't yet say whether we need to spell out the limitation in commit
>> >> message and/or documentation.
>> >
>> > The point where we could error out is when parsing SocketAddressLegacy=
,
>> > because there can be two possible providers for "type".
>> >
>> > The idea in the current code of this series was that we'll just ignore
>> > wildcard aliases if we already have a value, because then the value mu=
st
>> > be meant for somewhere else. So it doesn't error out and leaves the
>> > value in the QDict for someone else to pick it up. If nobody picks it
>> > up, it's an error "'foo' is unexpected".
>> >
>> > If we change it and do error out when there are multiple possible valu=
es
>> > through wildcard aliases, then the only thing that makes it work is th=
at
>> > ChardevBackend.type is parsed first and is therefore not a possible
>> > value for SocketAddressLegacy.type any more.
>>=20
>> You wrote you're picking the alternative with the simpler code for v4.
>> Fine with me, as long as it's reasonably easy to explain, in
>> qapi-code-gen.rst.
>
> I think I've come to the conclusion that it's not easy enough to
> explain. As long as the parsing order should remain an implementation
> detail that schema authors shouldn't rely on, it's not possible at all.
>
> It's a pity because the code would have been simpler and it would
> probably have worked for the cases we're interested in. But it doesn't
> work in all hypothetical cases and we can't document the conditions for
> that without making people rely on the parsing order.

The order in which the visitors visit members is not really specified.
The examples in qapi-code-gen.rst show it's in source order, and the
order is quite unlikely to change.  So, making it official is not out of
the question.

However, depending on member order for anything feels iffy.  I'd like to
be able to shuffle them around without breaking anything.

Thoughts?


