Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DB96A0345
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 08:25:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV5yC-0001mV-6y; Thu, 23 Feb 2023 02:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pV5y7-0001mE-Bx
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 02:24:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pV5y4-0008IH-Bf
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 02:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677137079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kp2GFXqjbgd/jzjPOEmoirpcH8zRH2QPvGhy8vD4+3w=;
 b=Q0VCGx82Q11n1EJZhTLxdwOeKV9EtI9GBMiVYnkXDlPpMkCyOa4bN9iyzEDAA9eMe18fJO
 BJqci2yx7GV5shbOlDClsqNK/FJXa5uSr8z6xFUcVBsZhdHdG541jNDfZf39GlJ8KvwLx9
 DAVfecOq/DI/ToeTUHXr3vjpZo7tgrU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-8oyqZzMVNdm27REn1sLC-g-1; Thu, 23 Feb 2023 02:24:35 -0500
X-MC-Unique: 8oyqZzMVNdm27REn1sLC-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37E3285D060;
 Thu, 23 Feb 2023 07:24:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB4542026D4B;
 Thu, 23 Feb 2023 07:24:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C0B7721E6A1F; Thu, 23 Feb 2023 08:24:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Eric Blake
 <eblake@redhat.com>,  Het Gala <het.gala@nutanix.com>
Subject: Re: [PATCH] qapi: allow unions to contain further unions
References: <20230214184404.1865237-1-berrange@redhat.com>
Date: Thu, 23 Feb 2023 08:24:33 +0100
In-Reply-To: <20230214184404.1865237-1-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 14 Feb 2023 18:44:04
 +0000")
Message-ID: <87o7pkg7ym.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> This extends the QAPI schema validation to permit unions inside unions,
> provided the checks for clashing fields pass.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>
> This patch comes out of the discussion on Het's migration series
> starting at this patch:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02111.html
>
> Markus had described his desired improved architecture
>
>   https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02719.html
>
> but I don't think I have enough knowledge of the QAPI code to attempt
> to fuse the handling of structs/unions as mentioned. This patch does
> what looks to be the bare minimum to permit unions in unions, while
> keeping validation checks for clashing fields.
>
> I've not tested beyond the unit tests, but if this is acceptable
> from Markus' POV, I'd expect Het to insert this patch at the
> start of his migration series and thus test it more fully.
>
>  scripts/qapi/schema.py                        |  6 +--
>  .../union-invalid-union-subfield.err          |  2 +
>  .../union-invalid-union-subfield.json         | 27 +++++++++++++
>  .../union-invalid-union-subfield.out          |  0
>  .../union-invalid-union-subtype.err           |  2 +
>  .../union-invalid-union-subtype.json          | 26 +++++++++++++
>  .../union-invalid-union-subtype.out           |  0
>  tests/qapi-schema/union-union-branch.err      |  0
>  tests/qapi-schema/union-union-branch.json     | 26 +++++++++++++
>  tests/qapi-schema/union-union-branch.out      | 38 +++++++++++++++++++
>  10 files changed, 124 insertions(+), 3 deletions(-)
>  create mode 100644 tests/qapi-schema/union-invalid-union-subfield.err
>  create mode 100644 tests/qapi-schema/union-invalid-union-subfield.json
>  create mode 100644 tests/qapi-schema/union-invalid-union-subfield.out
>  create mode 100644 tests/qapi-schema/union-invalid-union-subtype.err
>  create mode 100644 tests/qapi-schema/union-invalid-union-subtype.json
>  create mode 100644 tests/qapi-schema/union-invalid-union-subtype.out
>  create mode 100644 tests/qapi-schema/union-union-branch.err
>  create mode 100644 tests/qapi-schema/union-union-branch.json
>  create mode 100644 tests/qapi-schema/union-union-branch.out
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index cd8661125c..062c6bbb00 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -465,9 +465,10 @@ def check(self, schema):
>      # on behalf of info, which is not necessarily self.info
>      def check_clash(self, info, seen):
>          assert self._checked
> -        assert not self.variants       # not implemented
>          for m in self.members:
>              m.check_clash(info, seen)
> +        if self.variants:
> +            self.variants.check_clash(info, seen)

Note for later: the .check_clash() methods are responsible for rejecting
clashing members, with an error message of the form "X collides with Y".

Fine print 1: members clash when their names both map to the same C
name.  For instance, 'a-b' collides with 'a_b'.

Fine print 2: the special case of identical keys in a single JSON-ish
object is already rejected by the parser, with an error message of the
form "duplicate key 'KEY'".

>=20=20
>      def connect_doc(self, doc=3DNone):
>          super().connect_doc(doc)
> @@ -652,8 +653,7 @@ def check(self, schema, seen):
>                          self.info,
>                          "branch '%s' is not a value of %s"
>                          % (v.name, self.tag_member.type.describe()))
> -                if (not isinstance(v.type, QAPISchemaObjectType)
> -                        or v.type.variants):
> +                if not isinstance(v.type, QAPISchemaObjectType):
>                      raise QAPISemError(
>                          self.info,
>                          "%s cannot use %s"

This lifts the restriction; an object type's variant type may now have
variants.  Could affect any code that deals with object type members.

Best case: the code just works.

Okay case: the code asserts there are no variants.  This patch needs to
make it work instead.  One known instance: check_clash() above.  I
looked for more, and there are a few "no variants" assertions, but they
are all unrelated.

Worst case: the code doesn't work.  This patch needs to make it work.
No known instances.

Two complementary ways to convince ourselves everything works:
systematic code inspection, systematic tests.

The former looks at every place where we do something with object type
members.  I may try that later.

For systematic tests, we need to understand what can go wrong, and what
needs to work.  I tried to work out a detailed argument, but it didn't
come together.  Best I can do is to simply propose that the additional
variant members of a union's branch may clash with the union's common
members, but not with any other branch's members, and that's all.

We need to test the clash is rejected (negative test), and we need to
test the non-clash works (positive test).

Additionally, we should at least inspect the code generated for the
positive test.

> diff --git a/tests/qapi-schema/union-invalid-union-subfield.err b/tests/q=
api-schema/union-invalid-union-subfield.err
> new file mode 100644
> index 0000000000..d3a2e31aff
> --- /dev/null
> +++ b/tests/qapi-schema/union-invalid-union-subfield.err
> @@ -0,0 +1,2 @@
> +union-invalid-union-subfield.json: In union 'TestUnion':
> +union-invalid-union-subfield.json:22: member 'teeth' of type 'TestTypeFi=
sh' collides with base member 'teeth'
> diff --git a/tests/qapi-schema/union-invalid-union-subfield.json b/tests/=
qapi-schema/union-invalid-union-subfield.json
> new file mode 100644
> index 0000000000..235f76d7da
> --- /dev/null
> +++ b/tests/qapi-schema/union-invalid-union-subfield.json
> @@ -0,0 +1,27 @@

This is the negative test I asked for above.  Good.

We commonly start with a comment on what is being tested.  Suggest

   # Clash between common member and union variant's variant member
   # Base's member 'teeth' clashes with TestTypeFish's

> +{ 'enum': 'TestEnum',
> +  'data': [ 'animals', 'plants' ] }
> +
> +{ 'enum': 'TestAnimals',
> +  'data': [ 'fish', 'birds'] }
> +
> +{ 'struct': 'TestTypeFish',
> +  'data': { 'scales': 'int', 'teeth': 'int' } }
> +
> +{ 'struct': 'TestTypeBirds',
> +  'data': { 'feathers': 'int' } }
> +
> +{ 'union': 'TestTypeAnimals',
> +  'base': { 'atype': 'TestAnimals' },
> +  'discriminator': 'atype',
> +  'data': { 'fish': 'TestTypeFish',
> +            'birds': 'TestTypeBirds' } }
> +
> +{ 'struct': 'TestTypePlants',
> +  'data': { 'integer': 'int' } }
> +
> +{ 'union': 'TestUnion',
> +  'base': { 'type': 'TestEnum',
> +	    'teeth': 'int' },

Indentation is off.

> +  'discriminator': 'type',
> +  'data': { 'animals': 'TestTypeAnimals',
> +            'plants': 'TestTypePlants' } }
> diff --git a/tests/qapi-schema/union-invalid-union-subfield.out b/tests/q=
api-schema/union-invalid-union-subfield.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/union-invalid-union-subtype.err b/tests/qa=
pi-schema/union-invalid-union-subtype.err
> new file mode 100644
> index 0000000000..7b8679c08f
> --- /dev/null
> +++ b/tests/qapi-schema/union-invalid-union-subtype.err
> @@ -0,0 +1,2 @@
> +union-invalid-union-subtype.json: In union 'TestUnion':
> +union-invalid-union-subtype.json:22: base member 'type' collides with ba=
se member 'type'

The error message is crap.  See below.

> diff --git a/tests/qapi-schema/union-invalid-union-subtype.json b/tests/q=
api-schema/union-invalid-union-subtype.json
> new file mode 100644
> index 0000000000..59ca4b0385
> --- /dev/null
> +++ b/tests/qapi-schema/union-invalid-union-subtype.json
> @@ -0,0 +1,26 @@

Suggest

   # Clash between common member and union variant's common member
   # Base's member 'type' clashes with TestTypeA's

> +{ 'enum': 'TestEnum',
> +  'data': [ 'value-a', 'value-b' ] }
> +
> +{ 'enum': 'TestEnumA',
> +  'data': [ 'value-a1', 'value-a2' ] }
> +
> +{ 'struct': 'TestTypeA1',
> +  'data': { 'integer': 'int' } }
> +
> +{ 'struct': 'TestTypeA2',
> +  'data': { 'integer': 'int' } }
> +
> +{ 'union': 'TestTypeA',
> +  'base': { 'type': 'TestEnumA' },
> +  'discriminator': 'type',
> +  'data': { 'value-a1': 'TestTypeA1',
> +            'value-a2': 'TestTypeA2' } }
> +
> +{ 'struct': 'TestTypeB',
> +  'data': { 'integer': 'int' } }
> +
> +{ 'union': 'TestUnion',
> +  'base': { 'type': 'TestEnum' },
> +  'discriminator': 'type',
> +  'data': { 'value-a': 'TestTypeA',
> +            'value-b': 'TestTypeB' } }

This new test is structurally similar to existing test
union-clash-member.  Synopsis:

  { 'enum': 'TestEnum',                     { 'enum': 'TestEnum',
    'data': [ 'value-a', 'value-b' ] }        'data': [ 'value1', 'value2' =
] }

                                            { 'struct': 'Base',
                                              'data': { 'enum1': 'TestEnum',
                                              '*name': 'str' } }

  { 'enum': 'TestEnumA',
    'data': [ 'value-a1', 'value-a2' ] }

  { 'struct': 'TestTypeA1',
    'data': { 'integer': 'int' } }

  { 'struct': 'TestTypeA2',
    'data': { 'integer': 'int' } }

  { 'union': 'TestTypeA',                   { 'struct': 'Branch1',
    'base': { 'type': 'TestEnumA' },          'data': { 'name': 'str' } }
    'discriminator': 'type',
    'data': { 'value-a1': 'TestTypeA1',
              'value-a2': 'TestTypeA2' } }

  { 'struct': 'TestTypeB',                  { 'struct': 'Branch2',
    'data': { 'integer': 'int' } }            'data': { 'value': 'int' } }

  { 'union': 'TestUnion',                   { 'union': 'TestUnion',
    'base': { 'type': 'TestEnum' },           'base': 'Base',
    'discriminator': 'type',                  'discriminator': 'enum1',
    'data': { 'value-a': 'TestTypeA',         'data': { 'value1': 'Branch1',
              'value-b': 'TestTypeB' } }                'value2': 'Branch2'=
 } }

Differences:

* Names and scalar types, which shouldn't matter.

* Base is inline vs. explicit type; shouldn't matter.

* First branch is a union vs. a struct.  Since the error is about a
  common union member, this shouldn't matter, either.  But it does: the
  error message is much worse, namely

    base member 'type' collides with base member 'type'

  vs.

    member 'name' of type 'Branch1' collides with member 'name' of type 'Ba=
se'

Something's off here.

> diff --git a/tests/qapi-schema/union-invalid-union-subtype.out b/tests/qa=
pi-schema/union-invalid-union-subtype.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/union-union-branch.err b/tests/qapi-schema=
/union-union-branch.err
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/union-union-branch.json b/tests/qapi-schem=
a/union-union-branch.json
> new file mode 100644
> index 0000000000..d3d7ce57c6
> --- /dev/null
> +++ b/tests/qapi-schema/union-union-branch.json
> @@ -0,0 +1,26 @@
> +{ 'enum': 'TestEnum',
> +  'data': [ 'value-a', 'value-b' ] }
> +
> +{ 'enum': 'TestEnumA',
> +  'data': [ 'value-a1', 'value-a2' ] }
> +
> +{ 'struct': 'TestTypeA1',
> +  'data': { 'integer': 'int' } }
> +
> +{ 'struct': 'TestTypeA2',
> +  'data': { 'integer': 'int' } }
> +
> +{ 'union': 'TestTypeA',
> +  'base': { 'type-a': 'TestEnumA' },
> +  'discriminator': 'type-a',
> +  'data': { 'value-a1': 'TestTypeA1',
> +            'value-a2': 'TestTypeA2' } }
> +
> +{ 'struct': 'TestTypeB',
> +  'data': { 'integer': 'int' } }
> +
> +{ 'union': 'TestUnion',
> +  'base': { 'type': 'TestEnum' },
> +  'discriminator': 'type',
> +  'data': { 'value-a': 'TestTypeA',
> +            'value-b': 'TestTypeB' } }

This is union-invalid-union-subtype.json with the clash fixed by
renaming TestTypeA's member 'type' to 'type-a'.

We have three non-clashing members called 'integer':

1. TestUnion branch value-a branch value-a1 common member

2. TestUnion branch value-a branch value-a2 common member

3. TestUnion branch value-b common member

They all map to the same member on the wire.  This is the positive test
I asked for above.  Good.

Except it needs to go into tests/qapi-schema/qapi-schema-test.json, so
we actually generate code and compile it.  Let me explain.

All the test schemas are fed to test-qapi.py, which tests the QAPI
generator's frontend.

qapi-schema-test.json and doc-good.json we additionally feed to
qapi-gen.py.  The code generated for the former gets compiled into a
number of unit tests.  To find them, use

    $ git-grep -l '#include.*test-qapi-'=20

Would you mind extending them so the code is actually exercised?

> diff --git a/tests/qapi-schema/union-union-branch.out b/tests/qapi-schema=
/union-union-branch.out
> new file mode 100644
> index 0000000000..d0c37495c2
> --- /dev/null
> +++ b/tests/qapi-schema/union-union-branch.out
> @@ -0,0 +1,38 @@
> +module ./builtin
> +object q_empty
> +enum QType
> +    prefix QTYPE
> +    member none
> +    member qnull
> +    member qnum
> +    member qstring
> +    member qdict
> +    member qlist
> +    member qbool
> +module union-union-branch.json
> +enum TestEnum
> +    member value-a
> +    member value-b
> +enum TestEnumA
> +    member value-a1
> +    member value-a2
> +object TestTypeA1
> +    member integer: int optional=3DFalse
> +object TestTypeA2
> +    member integer: int optional=3DFalse
> +object q_obj_TestTypeA-base
> +    member type-a: TestEnumA optional=3DFalse
> +object TestTypeA
> +    base q_obj_TestTypeA-base
> +    tag type-a
> +    case value-a1: TestTypeA1
> +    case value-a2: TestTypeA2
> +object TestTypeB
> +    member integer: int optional=3DFalse
> +object q_obj_TestUnion-base
> +    member type: TestEnum optional=3DFalse
> +object TestUnion
> +    base q_obj_TestUnion-base
> +    tag type
> +    case value-a: TestTypeA
> +    case value-b: TestTypeB


