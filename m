Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5306BE8D6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 13:08:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd8sl-0002wG-7j; Fri, 17 Mar 2023 08:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pd8sj-0002w8-K8
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:08:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pd8sh-000594-2Z
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:08:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679054902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/ehvwgcDMlRDkSWsUVdvKJlyMi8kOlRIqXW8DFbky4=;
 b=Z/6cbsAjJR88mclQg/hdlmADfJjRVfsP94w2/OpNZZydXNhQAG04qM+4etj5EPkErrDv4m
 E7I2Dtj15oP/yCHzClEi6sARn+9GEE1DXqy28bwZsQs2oSamHRuftJDvfMSXRtWoIgwGLj
 NsBCL0sUsmiprdjulQDq4RBYsLQFZCQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-kuJ-NP3zPOyz15YOwKslgw-1; Fri, 17 Mar 2023 08:08:19 -0400
X-MC-Unique: kuJ-NP3zPOyz15YOwKslgw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE4CF85A5A3;
 Fri, 17 Mar 2023 12:08:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 559E840D1C7;
 Fri, 17 Mar 2023 12:08:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 55DC221E6806; Fri, 17 Mar 2023 13:08:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Het Gala <het.gala@nutanix.com>
Subject: Re: [PATCH v2 1/3] qapi: improve specificity of type/member
 descriptions
References: <20230223134027.2294640-1-berrange@redhat.com>
 <20230223134027.2294640-2-berrange@redhat.com>
Date: Fri, 17 Mar 2023 13:08:17 +0100
In-Reply-To: <20230223134027.2294640-2-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Thu, 23 Feb 2023 13:40:25
 +0000")
Message-ID: <87r0tninri.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

> When describing member types always include the context of the
> containing type. Although this is often redundant, in some cases
> it will help to reduce ambiguity.

Unfortunately, it can also be confusing, as we shall see below.

> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  scripts/qapi/schema.py                               | 5 ++---
>  tests/qapi-schema/alternate-any.err                  | 2 +-
>  tests/qapi-schema/alternate-conflict-bool-string.err | 2 +-
>  tests/qapi-schema/alternate-conflict-dict.err        | 2 +-
>  tests/qapi-schema/alternate-conflict-enum-bool.err   | 2 +-
>  tests/qapi-schema/alternate-conflict-enum-int.err    | 2 +-
>  tests/qapi-schema/alternate-conflict-lists.err       | 2 +-
>  tests/qapi-schema/alternate-conflict-num-string.err  | 2 +-
>  tests/qapi-schema/alternate-conflict-string.err      | 2 +-
>  tests/qapi-schema/alternate-nested.err               | 2 +-
>  tests/qapi-schema/alternate-unknown.err              | 2 +-
>  tests/qapi-schema/args-member-unknown.err            | 2 +-
>  tests/qapi-schema/enum-clash-member.err              | 2 +-
>  tests/qapi-schema/features-duplicate-name.err        | 2 +-
>  tests/qapi-schema/struct-base-clash-deep.err         | 2 +-
>  tests/qapi-schema/struct-base-clash.err              | 2 +-
>  tests/qapi-schema/struct-member-name-clash.err       | 2 +-
>  tests/qapi-schema/union-bad-base.err                 | 2 +-
>  tests/qapi-schema/union-int-branch.err               | 2 +-
>  tests/qapi-schema/union-unknown.err                  | 2 +-
>  20 files changed, 21 insertions(+), 22 deletions(-)
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index cd8661125c..6c481ab0c0 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -713,9 +713,8 @@ def describe(self, info):
>                  role =3D 'base ' + role
>              else:
>                  assert False
> -        elif defined_in !=3D info.defn_name:
> -            return "%s '%s' of type '%s'" % (role, self.name, defined_in)
> -        return "%s '%s'" % (role, self.name)
> +
> +        return "%s '%s' of type '%s'" % (role, self.name, defined_in)
>=20=20
>=20=20
>  class QAPISchemaEnumMember(QAPISchemaMember):
> diff --git a/tests/qapi-schema/alternate-any.err b/tests/qapi-schema/alte=
rnate-any.err
> index baeb3f66d1..6c12358a88 100644
> --- a/tests/qapi-schema/alternate-any.err
> +++ b/tests/qapi-schema/alternate-any.err
> @@ -1,2 +1,2 @@
>  alternate-any.json: In alternate 'Alt':
> -alternate-any.json:2: branch 'one' cannot use built-in type 'any'
> +alternate-any.json:2: branch 'one' of type 'Alt' cannot use built-in typ=
e 'any'

Redundant with the "In alternate" context line.  I don't like it, but if
that was all I don't like, I'd be willing to accept it to get PATCH 3
over the hump.

> diff --git a/tests/qapi-schema/alternate-conflict-bool-string.err b/tests=
/qapi-schema/alternate-conflict-bool-string.err
> index 59ff5efa87..d7fd625632 100644
> --- a/tests/qapi-schema/alternate-conflict-bool-string.err
> +++ b/tests/qapi-schema/alternate-conflict-bool-string.err
> @@ -1,2 +1,2 @@
>  alternate-conflict-bool-string.json: In alternate 'Alt':
> -alternate-conflict-bool-string.json:2: branch 'two' can't be distinguish=
ed from 'one'
> +alternate-conflict-bool-string.json:2: branch 'two' of type 'Alt' can't =
be distinguished from 'one'
> diff --git a/tests/qapi-schema/alternate-conflict-dict.err b/tests/qapi-s=
chema/alternate-conflict-dict.err
> index d4970284ba..05174ab4f1 100644
> --- a/tests/qapi-schema/alternate-conflict-dict.err
> +++ b/tests/qapi-schema/alternate-conflict-dict.err
> @@ -1,2 +1,2 @@
>  alternate-conflict-dict.json: In alternate 'Alt':
> -alternate-conflict-dict.json:6: branch 'two' can't be distinguished from=
 'one'
> +alternate-conflict-dict.json:6: branch 'two' of type 'Alt' can't be dist=
inguished from 'one'
> diff --git a/tests/qapi-schema/alternate-conflict-enum-bool.err b/tests/q=
api-schema/alternate-conflict-enum-bool.err
> index 5f35855274..02ed66b0bf 100644
> --- a/tests/qapi-schema/alternate-conflict-enum-bool.err
> +++ b/tests/qapi-schema/alternate-conflict-enum-bool.err
> @@ -1,2 +1,2 @@
>  alternate-conflict-enum-bool.json: In alternate 'Alt':
> -alternate-conflict-enum-bool.json:4: branch 'two' can't be distinguished=
 from 'one'
> +alternate-conflict-enum-bool.json:4: branch 'two' of type 'Alt' can't be=
 distinguished from 'one'
> diff --git a/tests/qapi-schema/alternate-conflict-enum-int.err b/tests/qa=
pi-schema/alternate-conflict-enum-int.err
> index 6a6d156664..1874558f49 100644
> --- a/tests/qapi-schema/alternate-conflict-enum-int.err
> +++ b/tests/qapi-schema/alternate-conflict-enum-int.err
> @@ -1,2 +1,2 @@
>  alternate-conflict-enum-int.json: In alternate 'Alt':
> -alternate-conflict-enum-int.json:4: branch 'two' can't be distinguished =
from 'one'
> +alternate-conflict-enum-int.json:4: branch 'two' of type 'Alt' can't be =
distinguished from 'one'
> diff --git a/tests/qapi-schema/alternate-conflict-lists.err b/tests/qapi-=
schema/alternate-conflict-lists.err
> index f3374ec1e7..de480dc86b 100644
> --- a/tests/qapi-schema/alternate-conflict-lists.err
> +++ b/tests/qapi-schema/alternate-conflict-lists.err
> @@ -1,2 +1,2 @@
>  alternate-conflict-lists.json: In alternate 'Alt':
> -alternate-conflict-lists.json:4: branch 'two' can't be distinguished fro=
m 'one'
> +alternate-conflict-lists.json:4: branch 'two' of type 'Alt' can't be dis=
tinguished from 'one'
> diff --git a/tests/qapi-schema/alternate-conflict-num-string.err b/tests/=
qapi-schema/alternate-conflict-num-string.err
> index 38c805ea1f..0d21ec590c 100644
> --- a/tests/qapi-schema/alternate-conflict-num-string.err
> +++ b/tests/qapi-schema/alternate-conflict-num-string.err
> @@ -1,2 +1,2 @@
>  alternate-conflict-num-string.json: In alternate 'Alt':
> -alternate-conflict-num-string.json:2: branch 'two' can't be distinguishe=
d from 'one'
> +alternate-conflict-num-string.json:2: branch 'two' of type 'Alt' can't b=
e distinguished from 'one'
> diff --git a/tests/qapi-schema/alternate-conflict-string.err b/tests/qapi=
-schema/alternate-conflict-string.err
> index 2fa08193db..97097cae97 100644
> --- a/tests/qapi-schema/alternate-conflict-string.err
> +++ b/tests/qapi-schema/alternate-conflict-string.err
> @@ -1,2 +1,2 @@
>  alternate-conflict-string.json: In alternate 'Alt':
> -alternate-conflict-string.json:2: branch 'two' can't be distinguished fr=
om 'one'
> +alternate-conflict-string.json:2: branch 'two' of type 'Alt' can't be di=
stinguished from 'one'
> diff --git a/tests/qapi-schema/alternate-nested.err b/tests/qapi-schema/a=
lternate-nested.err
> index 3ae9cd2f11..5603aa95e3 100644
> --- a/tests/qapi-schema/alternate-nested.err
> +++ b/tests/qapi-schema/alternate-nested.err
> @@ -1,2 +1,2 @@
>  alternate-nested.json: In alternate 'Alt2':
> -alternate-nested.json:4: branch 'nested' cannot use alternate type 'Alt1'
> +alternate-nested.json:4: branch 'nested' of type 'Alt2' cannot use alter=
nate type 'Alt1'
> diff --git a/tests/qapi-schema/alternate-unknown.err b/tests/qapi-schema/=
alternate-unknown.err
> index 17fec1cd17..befd207a76 100644
> --- a/tests/qapi-schema/alternate-unknown.err
> +++ b/tests/qapi-schema/alternate-unknown.err
> @@ -1,2 +1,2 @@
>  alternate-unknown.json: In alternate 'Alt':
> -alternate-unknown.json:2: branch 'unknown' uses unknown type 'MissingTyp=
e'
> +alternate-unknown.json:2: branch 'unknown' of type 'Alt' uses unknown ty=
pe 'MissingType'

Redundant the same way in all of the test cases so far.

> diff --git a/tests/qapi-schema/args-member-unknown.err b/tests/qapi-schem=
a/args-member-unknown.err
> index 96b6e5d289..b24c2ae572 100644
> --- a/tests/qapi-schema/args-member-unknown.err
> +++ b/tests/qapi-schema/args-member-unknown.err
> @@ -1,2 +1,2 @@
>  args-member-unknown.json: In command 'oops':
> -args-member-unknown.json:2: parameter 'member' uses unknown type 'NoSuch=
Type'
> +args-member-unknown.json:2: parameter 'member' of type 'oops-arg' uses u=
nknown type 'NoSuchType'

This is args-member-unknown.json:

   # we reject data if it does not contain a known type
   { 'command': 'oops', 'data': { 'member': 'NoSuchType' } }

There is no type 'oops-arg'.  Confusing.

'oops-arg' is in fact the argument type implicitly defined by
{ 'member': 'NoSuchType' }.

> diff --git a/tests/qapi-schema/enum-clash-member.err b/tests/qapi-schema/=
enum-clash-member.err
> index e4eb102ae2..0ede36d68e 100644
> --- a/tests/qapi-schema/enum-clash-member.err
> +++ b/tests/qapi-schema/enum-clash-member.err
> @@ -1,2 +1,2 @@
>  enum-clash-member.json: In enum 'MyEnum':
> -enum-clash-member.json:3: value 'one_two' collides with value 'one-two'
> +enum-clash-member.json:3: value 'one_two' of type 'MyEnum' collides with=
 value 'one-two' of type 'MyEnum'
> diff --git a/tests/qapi-schema/features-duplicate-name.err b/tests/qapi-s=
chema/features-duplicate-name.err
> index 0adbee6b0a..ffd124f5b0 100644
> --- a/tests/qapi-schema/features-duplicate-name.err
> +++ b/tests/qapi-schema/features-duplicate-name.err
> @@ -1,2 +1,2 @@
>  features-duplicate-name.json: In struct 'FeatureStruct0':
> -features-duplicate-name.json:1: feature 'foo' collides with feature 'foo'
> +features-duplicate-name.json:1: feature 'foo' of type 'FeatureStruct0' c=
ollides with feature 'foo' of type 'FeatureStruct0'
> diff --git a/tests/qapi-schema/struct-base-clash-deep.err b/tests/qapi-sc=
hema/struct-base-clash-deep.err
> index 79879681d9..632f78b6c0 100644
> --- a/tests/qapi-schema/struct-base-clash-deep.err
> +++ b/tests/qapi-schema/struct-base-clash-deep.err
> @@ -1,2 +1,2 @@
>  struct-base-clash-deep.json: In struct 'Sub':
> -struct-base-clash-deep.json:10: member 'name' collides with member 'name=
' of type 'Base'
> +struct-base-clash-deep.json:10: member 'name' of type 'Sub' collides wit=
h member 'name' of type 'Base'
> diff --git a/tests/qapi-schema/struct-base-clash.err b/tests/qapi-schema/=
struct-base-clash.err
> index 46473947e6..1d54079c16 100644
> --- a/tests/qapi-schema/struct-base-clash.err
> +++ b/tests/qapi-schema/struct-base-clash.err
> @@ -1,2 +1,2 @@
>  struct-base-clash.json: In struct 'Sub':
> -struct-base-clash.json:5: member 'name' collides with member 'name' of t=
ype 'Base'
> +struct-base-clash.json:5: member 'name' of type 'Sub' collides with memb=
er 'name' of type 'Base'
> diff --git a/tests/qapi-schema/struct-member-name-clash.err b/tests/qapi-=
schema/struct-member-name-clash.err
> index 7e53a605d2..ebf66cd5b8 100644
> --- a/tests/qapi-schema/struct-member-name-clash.err
> +++ b/tests/qapi-schema/struct-member-name-clash.err
> @@ -1,2 +1,2 @@
>  struct-member-name-clash.json: In struct 'Oops':
> -struct-member-name-clash.json:5: member 'a_b' collides with member 'a-b'
> +struct-member-name-clash.json:5: member 'a_b' of type 'Oops' collides wi=
th member 'a-b' of type 'Oops'

More test cases where it's redundant.

> diff --git a/tests/qapi-schema/union-bad-base.err b/tests/qapi-schema/uni=
on-bad-base.err
> index 42b2ed1dda..9f92b35a07 100644
> --- a/tests/qapi-schema/union-bad-base.err
> +++ b/tests/qapi-schema/union-bad-base.err
> @@ -1,2 +1,2 @@
>  union-bad-base.json: In union 'TestUnion':
> -union-bad-base.json:8: member 'string' of type 'TestTypeA' collides with=
 base member 'string'
> +union-bad-base.json:8: member 'string' of type 'TestTypeA' collides with=
 base member 'string' of type 'TestUnion-base'

This is union-bad-base.json:

  # we allow anonymous base, but enforce no duplicate keys
  { 'enum': 'TestEnum',
    'data': [ 'value1', 'value2' ] }
  { 'struct': 'TestTypeA',
    'data': { 'string': 'str' } }
  { 'struct': 'TestTypeB',
    'data': { 'integer': 'int' } }
  { 'union': 'TestUnion',
    'base': { 'enum1': 'TestEnum', 'string': 'str' },
    'discriminator': 'enum1',
    'data': { 'value1': 'TestTypeA',
              'value2': 'TestTypeB' } }

There is no type 'TestUnion-base'.  Confusing.

'TestUnion-base' is in fact the base type implicitly defined by
{ 'enum1': 'TestEnum', 'string': 'str' }.

> diff --git a/tests/qapi-schema/union-int-branch.err b/tests/qapi-schema/u=
nion-int-branch.err
> index 8fdc81edd1..302e3976e0 100644
> --- a/tests/qapi-schema/union-int-branch.err
> +++ b/tests/qapi-schema/union-int-branch.err
> @@ -1,2 +1,2 @@
>  union-int-branch.json: In union 'TestUnion':
> -union-int-branch.json:8: branch 'value1' cannot use built-in type 'int'
> +union-int-branch.json:8: branch 'value1' of type 'TestUnion' cannot use =
built-in type 'int'
> diff --git a/tests/qapi-schema/union-unknown.err b/tests/qapi-schema/unio=
n-unknown.err
> index dad79beae0..e60ab9421a 100644
> --- a/tests/qapi-schema/union-unknown.err
> +++ b/tests/qapi-schema/union-unknown.err
> @@ -1,2 +1,2 @@
>  union-unknown.json: In union 'Union':
> -union-unknown.json:3: branch 'unknown' uses unknown type 'MissingType'
> +union-unknown.json:3: branch 'unknown' of type 'Union' uses unknown type=
 'MissingType'

Redundant again in these two.

No test case demonstrates the commit message's claim "in some cases it
will help to reduce ambiguity".  PATCH 3 adds one:
union-invalid-union-subfield.  It also adds another confusing one:
union-invalid-union-subtype.


Let's have a closer look at QAPISchemaMember.describe() before the patch:

    def describe(self, info):
        role =3D self.role

@role is 'member' when self is a QAPISchemaMember, 'value' when it's a
QAPISchemaEnumMember, 'feature' when it's a QAPISchemaFeature, and
'branch' when it's a QAPISchemaVariant.

        defined_in =3D self.defined_in

This is the name of the thing where this QAPISchemaMember is defined.
When object type T inherits member M from B, it's B's name, not T's.

        assert defined_in

        if defined_in.startswith('q_obj_'):

It's a member of an implicitly defined object type.

Special treatment to avoid exposing the made-up names of implicitly
defined object types to the user:

            # See QAPISchema._make_implicit_object_type() - reverse the
            # mapping there to create a nice human-readable description
            defined_in =3D defined_in[6:]
            if defined_in.endswith('-arg'):
                # Implicit type created for a command's dict 'data'

Defined in a command's implicit argument type (you get that when the
value of 'data' is { ... }).

                assert role =3D=3D 'member'
                role =3D 'parameter'

@defined_in already got adjusted to the command name.  Adjust role.

            elif defined_in.endswith('-base'):
                # Implicit type created for a union's dict 'base'

Defined in a union's implicit base type (you get that when the value of
'base' is { ... }).

                role =3D 'base ' + role

@defined_in already got adjusted to the union name.  Adjust role.

            else:
                assert False

Explodes when we add another kind of implicitly defined object type and
forget to cover it here.

        elif defined_in !=3D info.defn_name:

Not a member of an implicit object type, and @defined_in is not in the
context line "FILE: In META 'NAME':" printed by
QAPISourceInfo.__str__(), typically via.  QAPISourceError.__str__() from
main()'s exception handler for QAPIError.

Use format "ROLE 'MEMBER-NAME' of type 'DEFINED-IN'":

            return "%s '%s' of type '%s'" % (role, self.name, defined_in)

Either a member of an implicit object type, or @defined_in is in the
context line.

Description is "ROLE 'MEMBER-NAME':

        return "%s '%s'" % (role, self.name)

The patch ditches the second format, exposing @defined_in to the user
even when it's the name of an implicitly defined object type.

Before we discuss how to avoid that, let's take a step back and examine
the problem we're trying to solve.


PATCH 3 permits union branches to be unions.  It adds test case
union-invalid-union-subtype.json:

    # Clash between common member and union variant's common member
    # Base's member 'type' clashes with TestTypeA's

    { 'enum': 'TestEnum',
      'data': [ 'value-a', 'value-b' ] }

    { 'enum': 'TestEnumA',
      'data': [ 'value-a1', 'value-a2' ] }

    { 'struct': 'TestTypeA1',
      'data': { 'integer': 'int' } }

    { 'struct': 'TestTypeA2',
      'data': { 'integer': 'int' } }

    { 'union': 'TestTypeA',
      'base': { 'type': 'TestEnumA' },
      'discriminator': 'type',
      'data': { 'value-a1': 'TestTypeA1',
                'value-a2': 'TestTypeA2' } }

    { 'struct': 'TestTypeB',
      'data': { 'integer': 'int' } }

    { 'union': 'TestUnion',
      'base': { 'type': 'TestEnum' },
      'discriminator': 'type',
      'data': { 'value-a': 'TestTypeA',
                'value-b': 'TestTypeB' } }

Without this patch, the clash is reported like this:

    union-invalid-union-subtype.json: In union 'TestUnion':
    union-invalid-union-subtype.json:25: base member 'type' collides with b=
ase member 'type'

Crap.

Comes from QAPISchemaMember.check_clash():

            raise QAPISemError(
                info,
                "%s collides with %s"
                % (self.describe(info), seen[cname].describe(info)))

@self is member 'type' of TestTypeA's base, and seen[cname] is member
'type' of TestUnion's base.

What we'd like to see instead is something like "base member 'type' of
type 'TestTypeA' collides with base member 'type'".

Here's my attempt to get us this message:

    def describe(self, info):
        role =3D self.role
        meta =3D 'type'
        defined_in =3D self.defined_in
        assert defined_in

        if defined_in.startswith('q_obj_'):
            # See QAPISchema._make_implicit_object_type() - reverse the
            # mapping there to create a nice human-readable description
            defined_in =3D defined_in[6:]
            if defined_in.endswith('-arg'):
                # Implicit type created for a command's dict 'data'
                assert role =3D=3D 'member'
                role =3D 'parameter'
                meta =3D 'command'
                defined_in =3D defined_in[:-4]
            elif defined_in.endswith('-base'):
                # Implicit type created for a union's dict 'base'
                role =3D 'base ' + role
                defined_in =3D defined_in[:-5]
            else:
                assert False

        if defined_in !=3D info.defn_name:
            return "%s '%s' of %s '%s'" % (role, self.name, meta, defined_i=
n)
        return "%s '%s'" % (role, self.name)

No change to output of existing tests.


