Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAC140AA14
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 11:02:13 +0200 (CEST)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ4KS-0003Dd-Jn
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 05:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ4IQ-0002KW-Sv
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:00:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ4IO-0005T5-6l
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631610002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ro+XLWZx3PBStRRCnh4RLzzSNyKsddiaDPP8jVNISX0=;
 b=R3ysWug1BBz0CsmMk+Zs74h+I0nTKG03sqFHqJj+YrPrc5jcz4zHTrkl7qQJlzBa/IHCVT
 Pwp/FezKW3Qx6a50te+24lJkPMCAs1FsZ+u+HUQl1VOVrxTSqvqYiUWmWciPVXoNBoDrQz
 iaSRsN/3+RcqZYKlowmdgoEg3Nm4+KI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-LgE373qHOjqU4cWhECfhBg-1; Tue, 14 Sep 2021 05:00:00 -0400
X-MC-Unique: LgE373qHOjqU4cWhECfhBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40FBD802C94
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 08:59:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E23745D9DC;
 Tue, 14 Sep 2021 08:59:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5A941113865F; Tue, 14 Sep 2021 10:59:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-7-kwolf@redhat.com>
 <878s09d8pe.fsf@dusky.pond.sub.org> <YTt0G1cs+BweXOMD@redhat.com>
Date: Tue, 14 Sep 2021 10:59:57 +0200
In-Reply-To: <YTt0G1cs+BweXOMD@redhat.com> (Kevin Wolf's message of "Fri, 10
 Sep 2021 17:04:59 +0200")
Message-ID: <87bl4vedma.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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

> Am 06.09.2021 um 17:28 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> > +    /* Can still specify the real member name with alias support */
>> > +    v =3D visitor_input_test_init(data, "{ 'foo': 42 }");
>> > +    visit_type_AliasStruct1(v, NULL, &tmp, &error_abort);
>> > +    g_assert_cmpint(tmp->foo, =3D=3D, 42);
>> > +    qapi_free_AliasStruct1(tmp);
>> > +
>> > +    /* The alias is a working alternative */
>> > +    v =3D visitor_input_test_init(data, "{ 'bar': 42 }");
>> > +    visit_type_AliasStruct1(v, NULL, &tmp, &error_abort);
>> > +    g_assert_cmpint(tmp->foo, =3D=3D, 42);
>> > +    qapi_free_AliasStruct1(tmp);
>> > +
>> > +    /* But you can't use both at the same time */
>> > +    v =3D visitor_input_test_init(data, "{ 'foo': 5, 'bar': 42 }");
>> > +    visit_type_AliasStruct1(v, NULL, &tmp, &err);
>> > +    error_free_or_abort(&err);
>>=20
>> I double-checked this reports "Value for parameter foo was already given
>> through an alias", as it should.
>>=20
>> Pointing to what exactly is giving values to foo already would be nice.
>> In this case, 'foo' is obvious, but 'bar' is not.  This is not a demand.
>
> We have the name, so we could print it, but it could be in a different
> StackObject. I'm not sure if we have a good way to identify a parent
> StackObject, and without it the message could be very confusing.

All we have is full_name_so(), which can describe members / aliases in
any StackObject currently on qiv->stack, i.e. in the current object, the
object that contains it, and so forth up to the root object.

> If you have a good idea what the message should look like, I can make an
> attempt.

Of course, users don't want to know about alias chains, they want to
know what part of their input makes things explode.  The answer to that
question could be like "'a.b.c' clashes with 'c'" (too terse, but you
get the idea).

Perhaps users then want to know *why* it clashes.  To answer that
question, we'd have to present the complete alias chain.  I'm not sure
this is worth the trouble.

>> > +    /* You can't use more than one option at the same time */
>> > +    v =3D visitor_input_test_init(data, "{ 'foo': 42, 'nested': { 'fo=
o': 42 } }");
>> > +    visit_type_AliasStruct3(v, NULL, &tmp, &err);
>> > +    error_free_or_abort(&err);
>>=20
>> "Parameter 'foo' is unexpected".  Say what?  It *is* expected, it just
>> clashes with 'nested.foo'.
>>=20
>> I figure this is what happens:
>>=20
>> * visit_type_AliasStruct3()
>>=20
>>   - visit_start_struct()
>>=20
>>   - visit_type_AliasStruct3_members()
>>=20
>>     =E2=80=A2 visit_type_AliasStruct1() for member @nested.
>>=20
>>       This consumes consumes input nested.foo.
>>=20
>>   - visit_check_struct()
>>=20
>>     Error: input foo has not been consumed.
>>=20
>> Any ideas on how to report this error more clearly?
>
> It's a result of the logic that wildcard aliases are silently ignored
> when they aren't needed. The reason why I included this is that it would
> allow you to have two members with the same name in the object
> containing the alias and in the aliased object without conflicting as
> long as both are given.

*brain cramp*

Example?

> Never skipping wildcard aliases makes the code simpler and results in
> the expected error message here. So I'll do that for v4.

Trusting your judgement.

> Note that parsing something like '--chardev type=3Dsocket,addr.type=3Duni=
x,
> path=3D/tmp/sock,id=3Dc' now depends on the order in the generated code. =
If
> the top level 'type' weren't parsed and removed from the input first,
> visiting 'addr.type' would now detect a conflict. For union types, we
> know that 'type' is always parsed first, so it's not a problem, but in
> the general case you need to be careful with the order.

Uff!  I think I'd like to understand this better.  No need to delay v4
for that.

Can't yet say whether we need to spell out the limitation in commit
message and/or documentation.

>> > +
>> > +    v =3D visitor_input_test_init(data, "{ 'tag': 'eins', 'foo': 6, '=
bar': 9 }");
>> > +    visit_type_AliasFlatUnion(v, NULL, &tmp, &err);
>> > +    error_free_or_abort(&err);
>>=20
>> "Value for parameter foo was already given through an alias".  Good,
>> except I'm getting a feeling "already" may be confusing.  It's "already"
>> only in the sense that we already got the value via alias, which is an
>> implementation detail.  It may or may not be given already in the
>> input.  Here it's not: 'bar' follows 'foo'.
>>=20
>> What about "is also given through an alias"?
>
> Sounds good.
>
>> Positive tests look good to me, except they neglect to use any of the
>> types using the alias features in QMP.  I think we need something like
>> the appended incremental patch.
>
> I'm squashing it in.

Thanks!


