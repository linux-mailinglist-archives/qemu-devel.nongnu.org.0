Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48937401D96
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:31:12 +0200 (CEST)
Received: from localhost ([::1]:52620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGaV-0004ce-CH
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNGYI-00035r-Ip
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:28:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNGYF-0007m4-RR
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630942130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=61LJs4n97KAzoLCuPNIB9OV2fpe/lnDoiQzncKvT6VM=;
 b=DTvcaTrZ5tX5x6bFXztoZGwBL/VkRwnEqLaYQ0syN2SqfVvOuR+kBNhv9fCy1PmVXX9lX3
 uO8DkhbO6SiLb+Y0MF4KoQrz7k6iyHs35GZiuSoAm31lkqjK/HrKIkbT30vpCubnGJQ84P
 eE5oBTtmKUQ+TZiX/VI3w5Bx6VgcdJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-cjSpyewfO12mgJm-H7G3EA-1; Mon, 06 Sep 2021 11:28:47 -0400
X-MC-Unique: cjSpyewfO12mgJm-H7G3EA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02063107ACE4
 for <qemu-devel@nongnu.org>; Mon,  6 Sep 2021 15:28:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BD4160861;
 Mon,  6 Sep 2021 15:28:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1AF231138606; Mon,  6 Sep 2021 17:28:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-7-kwolf@redhat.com>
Date: Mon, 06 Sep 2021 17:28:45 +0200
In-Reply-To: <20210812161131.92017-7-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 12 Aug 2021 18:11:31 +0200")
Message-ID: <878s09d8pe.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

[...]

> diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qo=
bject-input-visitor.c
> index e41b91a2a6..f2891b6f5d 100644
> --- a/tests/unit/test-qobject-input-visitor.c
> +++ b/tests/unit/test-qobject-input-visitor.c
> @@ -952,6 +952,214 @@ static void test_visitor_in_list_union_number(TestI=
nputVisitorData *data,
>      g_string_free(gstr_list, true);
>  }
> =20
> +static void test_visitor_in_alias_struct_local(TestInputVisitorData *dat=
a,
> +                                               const void *unused)
> +{
> +    AliasStruct1 *tmp =3D NULL;
> +    Error *err =3D NULL;
> +    Visitor *v;
> +

Context: the schema makes 'bar' an alias for 'foo'.

> +    /* Can still specify the real member name with alias support */
> +    v =3D visitor_input_test_init(data, "{ 'foo': 42 }");
> +    visit_type_AliasStruct1(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->foo, =3D=3D, 42);
> +    qapi_free_AliasStruct1(tmp);
> +
> +    /* The alias is a working alternative */
> +    v =3D visitor_input_test_init(data, "{ 'bar': 42 }");
> +    visit_type_AliasStruct1(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->foo, =3D=3D, 42);
> +    qapi_free_AliasStruct1(tmp);
> +
> +    /* But you can't use both at the same time */
> +    v =3D visitor_input_test_init(data, "{ 'foo': 5, 'bar': 42 }");
> +    visit_type_AliasStruct1(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

I double-checked this reports "Value for parameter foo was already given
through an alias", as it should.

Pointing to what exactly is giving values to foo already would be nice.
In this case, 'foo' is obvious, but 'bar' is not.  This is not a demand.

> +}
> +
> +static void test_visitor_in_alias_struct_nested(TestInputVisitorData *da=
ta,
> +                                                const void *unused)
> +{
> +    AliasStruct2 *tmp =3D NULL;
> +    Error *err =3D NULL;
> +    Visitor *v;
> +

Context: the schema makes 'bar' and 'nested.bar' aliases for
'nested.foo'.

> +    /* Can still specify the real member names with alias support */
> +    v =3D visitor_input_test_init(data, "{ 'nested': { 'foo': 42 } }");
> +    visit_type_AliasStruct2(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->nested->foo, =3D=3D, 42);
> +    qapi_free_AliasStruct2(tmp);
> +
> +    /* The inner alias is a working alternative */
> +    v =3D visitor_input_test_init(data, "{ 'nested': { 'bar': 42 } }");
> +    visit_type_AliasStruct2(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->nested->foo, =3D=3D, 42);
> +    qapi_free_AliasStruct2(tmp);
> +
> +    /* So is the outer alias */
> +    v =3D visitor_input_test_init(data, "{ 'bar': 42 }");
> +    visit_type_AliasStruct2(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->nested->foo, =3D=3D, 42);
> +    qapi_free_AliasStruct2(tmp);
> +
> +    /* You can't use more than one option at the same time */
> +    v =3D visitor_input_test_init(data, "{ 'bar': 5, 'nested': { 'foo': =
42 } }");
> +    visit_type_AliasStruct2(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

"Value for parameter nested.foo was already given through an alias".
Good.

> +
> +    v =3D visitor_input_test_init(data, "{ 'bar': 5, 'nested': { 'bar': =
42 } }");
> +    visit_type_AliasStruct2(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

Likewise.

> +
> +    v =3D visitor_input_test_init(data, "{ 'nested': { 'foo': 42, 'bar':=
 42 } }");
> +    visit_type_AliasStruct2(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

Likewise.

> +
> +    v =3D visitor_input_test_init(data, "{ 'bar': 5, "
> +                                      "  'nested': { 'foo': 42, 'bar': 4=
2 } }");
> +    visit_type_AliasStruct2(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

Likewise.

In the second of these four cases, none of the things giving values to
nested.foo is obvious.  Still not a demand.

> +}
> +
> +static void test_visitor_in_alias_wildcard(TestInputVisitorData *data,
> +                                           const void *unused)
> +{
> +    AliasStruct3 *tmp =3D NULL;
> +    Error *err =3D NULL;
> +    Visitor *v;
> +

Context: the schema makes 'foo', 'bar', and 'nested.bar' aliases for
'nested.foo', using a wildcard alias for the former two.

> +    /* Can still specify the real member names with alias support */
> +    v =3D visitor_input_test_init(data, "{ 'nested': { 'foo': 42 } }");
> +    visit_type_AliasStruct3(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->nested->foo, =3D=3D, 42);
> +    qapi_free_AliasStruct3(tmp);
> +
> +    /* The wildcard alias makes it work on the top level */
> +    v =3D visitor_input_test_init(data, "{ 'foo': 42 }");
> +    visit_type_AliasStruct3(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->nested->foo, =3D=3D, 42);
> +    qapi_free_AliasStruct3(tmp);
> +
> +    /* It makes the inner alias available, too */
> +    v =3D visitor_input_test_init(data, "{ 'bar': 42 }");
> +    visit_type_AliasStruct3(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->nested->foo, =3D=3D, 42);
> +    qapi_free_AliasStruct3(tmp);
> +
> +    /* You can't use more than one option at the same time */
> +    v =3D visitor_input_test_init(data, "{ 'foo': 42, 'nested': { 'foo':=
 42 } }");
> +    visit_type_AliasStruct3(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

"Parameter 'foo' is unexpected".  Say what?  It *is* expected, it just
clashes with 'nested.foo'.

I figure this is what happens:

* visit_type_AliasStruct3()

  - visit_start_struct()

  - visit_type_AliasStruct3_members()

    =E2=80=A2 visit_type_AliasStruct1() for member @nested.

      This consumes consumes input nested.foo.

  - visit_check_struct()

    Error: input foo has not been consumed.

Any ideas on how to report this error more clearly?

> +
> +    v =3D visitor_input_test_init(data, "{ 'bar': 42, 'nested': { 'foo':=
 42 } }");
> +    visit_type_AliasStruct3(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

"Value for parameter nested.foo was already given through an alias".
Good (but I have no idea how we avoid the bad error reporting in this
case).

> +
> +    v =3D visitor_input_test_init(data, "{ 'foo': 42, 'nested': { 'bar':=
 42 } }");
> +    visit_type_AliasStruct3(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

"Parameter 'foo' is unexpected"

> +
> +    v =3D visitor_input_test_init(data, "{ 'bar': 42, 'nested': { 'bar':=
 42 } }");
> +    visit_type_AliasStruct3(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

"Parameter 'bar' is unexpected"

> +
> +    v =3D visitor_input_test_init(data, "{ 'foo': 42, 'bar': 42 }");
> +    visit_type_AliasStruct3(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

"Parameter 'foo' is unexpected"

> +}
> +
> +static void test_visitor_in_alias_flat_union(TestInputVisitorData *data,
> +                                             const void *unused)
> +{
> +    AliasFlatUnion *tmp =3D NULL;
> +    Error *err =3D NULL;
> +    Visitor *v;
> +

Context: the schema makes 'variant' an alias for 'tag', and 'bar' an
alias for 'foo'.

> +    /* Can still specify the real member name with alias support */
> +    v =3D visitor_input_test_init(data, "{ 'tag': 'drei' }");
> +    visit_type_AliasFlatUnion(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->tag, =3D=3D, FEATURE_ENUM1_DREI);
> +    qapi_free_AliasFlatUnion(tmp);
> +
> +    /* Use alias for a base member (the discriminator even) */
> +    v =3D visitor_input_test_init(data, "{ 'variant': 'zwei' }");
> +    visit_type_AliasFlatUnion(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->tag, =3D=3D, FEATURE_ENUM1_ZWEI);
> +    qapi_free_AliasFlatUnion(tmp);
> +
> +    /* Use alias for a variant member */
> +    v =3D visitor_input_test_init(data, "{ 'tag': 'eins', 'bar': 42 }");
> +    visit_type_AliasFlatUnion(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->tag, =3D=3D, FEATURE_ENUM1_EINS);
> +    g_assert_cmpint(tmp->u.eins.foo, =3D=3D, 42);
> +    qapi_free_AliasFlatUnion(tmp);
> +
> +    /* Both together */
> +    v =3D visitor_input_test_init(data, "{ 'variant': 'eins', 'bar': 42 =
}");
> +    visit_type_AliasFlatUnion(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->tag, =3D=3D, FEATURE_ENUM1_EINS);
> +    g_assert_cmpint(tmp->u.eins.foo, =3D=3D, 42);
> +    qapi_free_AliasFlatUnion(tmp);
> +
> +    /* You can't use more than one option at the same time for each alia=
s */
> +    v =3D visitor_input_test_init(data, "{ 'variant': 'zwei', 'tag': 'dr=
ei' }");
> +    visit_type_AliasFlatUnion(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

"Value for parameter tag was already given through an alias".  Good.

> +
> +    v =3D visitor_input_test_init(data, "{ 'tag': 'eins', 'foo': 6, 'bar=
': 9 }");
> +    visit_type_AliasFlatUnion(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

"Value for parameter foo was already given through an alias".  Good,
except I'm getting a feeling "already" may be confusing.  It's "already"
only in the sense that we already got the value via alias, which is an
implementation detail.  It may or may not be given already in the
input.  Here it's not: 'bar' follows 'foo'.

What about "is also given through an alias"?

> +}
> +
> +static void test_visitor_in_alias_simple_union(TestInputVisitorData *dat=
a,
> +                                               const void *unused)
> +{
> +    AliasSimpleUnion *tmp =3D NULL;
> +    Error *err =3D NULL;
> +    Visitor *v;
> +

Context: the schema makes 'foo' and 'bar' aliases for 'data.foo' and
'data.bar' (using wildcard alias), 'tag' an alias for 'type', and
'data.bar' an alias for 'data.foo'.

> +    /* Can still specify the real member name with alias support */
> +    v =3D visitor_input_test_init(data, "{ 'type': 'eins', "
> +                                      "  'data': { 'foo': 42 } }");
> +    visit_type_AliasSimpleUnion(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->type, =3D=3D, ALIAS_SIMPLE_UNION_KIND_EINS);
> +    g_assert_cmpint(tmp->u.eins.data->foo, =3D=3D, 42);
> +    qapi_free_AliasSimpleUnion(tmp);
> +
> +    /* 'type' can be aliased */
> +    v =3D visitor_input_test_init(data, "{ 'tag': 'eins', "
> +                                      "  'data': { 'foo': 42 } }");
> +    visit_type_AliasSimpleUnion(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->type, =3D=3D, ALIAS_SIMPLE_UNION_KIND_EINS);
> +    g_assert_cmpint(tmp->u.eins.data->foo, =3D=3D, 42);
> +    qapi_free_AliasSimpleUnion(tmp);
> +
> +    /* The wildcard alias makes it work on the top level */
> +    v =3D visitor_input_test_init(data, "{ 'type': 'eins', 'foo': 42 }")=
;
> +    visit_type_AliasSimpleUnion(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->type, =3D=3D, ALIAS_SIMPLE_UNION_KIND_EINS);
> +    g_assert_cmpint(tmp->u.eins.data->foo, =3D=3D, 42);
> +    qapi_free_AliasSimpleUnion(tmp);
> +
> +    /* It makes the inner alias available, too */
> +    v =3D visitor_input_test_init(data, "{ 'type': 'eins', 'bar': 42 }")=
;
> +    visit_type_AliasSimpleUnion(v, NULL, &tmp, &error_abort);
> +    g_assert_cmpint(tmp->type, =3D=3D, ALIAS_SIMPLE_UNION_KIND_EINS);
> +    g_assert_cmpint(tmp->u.eins.data->foo, =3D=3D, 42);
> +    qapi_free_AliasSimpleUnion(tmp);
> +
> +    /* You can't use more than one option at the same time for each alia=
s */
> +    v =3D visitor_input_test_init(data, "{ 'type': 'eins', 'tag': 'eins'=
 }");
> +    visit_type_AliasSimpleUnion(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

"Value for parameter type was already given through an alias".  Good,
except "parameter type" is confusing.  Make it "parameter 'type'".

> +
> +    v =3D visitor_input_test_init(data, "{ 'type': 'eins', "
> +                                      "  'bar': 123, "
> +                                      "  'data': { 'foo': 312 } }");
> +    visit_type_AliasSimpleUnion(v, NULL, &tmp, &err);
> +    error_free_or_abort(&err);

"Value for parameter data.foo was already given through an alias".
Good.

> +}
> +
>  static void input_visitor_test_add(const char *testpath,
>                                     const void *user_data,
>                                     void (*test_func)(TestInputVisitorDat=
a *data,
> @@ -1350,6 +1558,16 @@ int main(int argc, char **argv)
>                             NULL, test_visitor_in_list_union_string);
>      input_visitor_test_add("/visitor/input/list_union/number",
>                             NULL, test_visitor_in_list_union_number);
> +    input_visitor_test_add("/visitor/input/alias/struct-local",
> +                           NULL, test_visitor_in_alias_struct_local);
> +    input_visitor_test_add("/visitor/input/alias/struct-nested",
> +                           NULL, test_visitor_in_alias_struct_nested);
> +    input_visitor_test_add("/visitor/input/alias/wildcard",
> +                           NULL, test_visitor_in_alias_wildcard);
> +    input_visitor_test_add("/visitor/input/alias/flat-union",
> +                           NULL, test_visitor_in_alias_flat_union);
> +    input_visitor_test_add("/visitor/input/alias/simple-union",
> +                           NULL, test_visitor_in_alias_simple_union);
>      input_visitor_test_add("/visitor/input/fail/struct",
>                             NULL, test_visitor_in_fail_struct);
>      input_visitor_test_add("/visitor/input/fail/struct-nested",

[Negative tests snipped, I checked them in review of PATCH 5, they're
fine]

> diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.buil=
d
> index b8de58116a..f937de1c35 100644
> --- a/tests/qapi-schema/meson.build
> +++ b/tests/qapi-schema/meson.build
> @@ -3,6 +3,22 @@ test_env.set('PYTHONPATH', meson.source_root() / 'script=
s')
>  test_env.set('PYTHONIOENCODING', 'utf-8')
> =20
>  schemas =3D [
> +  'alias-bad-type.json',
> +  'aliases-bad-type.json',
> +  'alias-missing-source.json',
> +  'alias-name-bad-type.json',
> +  'alias-name-conflict.json',
> +  'alias-recursive.json',
> +  'alias-source-bad-type.json',
> +  'alias-source-elem-bad-type.json',
> +  'alias-source-empty.json',
> +  'alias-source-inexistent.json',
> +  'alias-source-inexistent-variants.json',
> +  'alias-source-non-object-path.json',
> +  'alias-source-non-object-wildcard.json',
> +  'alias-source-optional-wildcard.json',
> +  'alias-source-optional-wildcard-indirect.json',
> +  'alias-unknown-key.json',
>    'alternate-any.json',
>    'alternate-array.json',
>    'alternate-base.json',
> diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/=
qapi-schema-test.json
> index 84b9d41f15..c5e81a883c 100644
> --- a/tests/qapi-schema/qapi-schema-test.json
> +++ b/tests/qapi-schema/qapi-schema-test.json
> @@ -336,3 +336,29 @@
> =20
>  { 'event': 'TEST_EVENT_FEATURES1',
>    'features': [ 'deprecated' ] }
> +
> +# test  'aliases'
> +
> +{ 'struct': 'AliasStruct0',
> +  'data': { 'foo': 'int' },
> +  'aliases': [] }
> +{ 'struct': 'AliasStruct1',
> +  'data': { 'foo': 'int' },
> +  'aliases': [ { 'name': 'bar', 'source': ['foo'] } ] }
> +{ 'struct': 'AliasStruct2',
> +  'data': { 'nested': 'AliasStruct1' },
> +  'aliases': [ { 'name': 'bar', 'source': ['nested', 'foo'] } ] }
> +{ 'struct': 'AliasStruct3',
> +  'data': { 'nested': 'AliasStruct1' },
> +  'aliases': [ { 'source': ['nested'] } ] }
> +
> +{ 'union': 'AliasFlatUnion',
> +  'base': { 'tag': 'FeatureEnum1' },
> +  'discriminator': 'tag',
> +  'data': { 'eins': 'FeatureStruct1' },
> +  'aliases': [ { 'name': 'variant', 'source': ['tag'] },
> +               { 'name': 'bar', 'source': ['foo'] } ] }
> +{ 'union': 'AliasSimpleUnion',
> +  'data': { 'eins': 'AliasStruct1' },
> +  'aliases': [ { 'source': ['data'] },
> +               { 'name': 'tag', 'source': ['type'] } ] }
> diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/q=
api-schema-test.out
> index e0b8a5f0b6..f6b8a98b7c 100644
> --- a/tests/qapi-schema/qapi-schema-test.out
> +++ b/tests/qapi-schema/qapi-schema-test.out
> @@ -445,6 +445,37 @@ event TEST_EVENT_FEATURES0 FeatureStruct1
>  event TEST_EVENT_FEATURES1 None
>      boxed=3DFalse
>      feature deprecated
> +object AliasStruct0
> +    member foo: int optional=3DFalse
> +object AliasStruct1
> +    member foo: int optional=3DFalse
> +    alias bar -> foo
> +object AliasStruct2
> +    member nested: AliasStruct1 optional=3DFalse
> +    alias bar -> nested.foo
> +object AliasStruct3
> +    member nested: AliasStruct1 optional=3DFalse
> +    alias * -> nested.*
> +object q_obj_AliasFlatUnion-base
> +    member tag: FeatureEnum1 optional=3DFalse
> +object AliasFlatUnion
> +    base q_obj_AliasFlatUnion-base
> +    alias variant -> tag
> +    alias bar -> foo
> +    tag tag
> +    case eins: FeatureStruct1
> +    case zwei: q_empty
> +    case drei: q_empty
> +object q_obj_AliasStruct1-wrapper
> +    member data: AliasStruct1 optional=3DFalse
> +enum AliasSimpleUnionKind
> +    member eins
> +object AliasSimpleUnion
> +    member type: AliasSimpleUnionKind optional=3DFalse
> +    alias * -> data.*
> +    alias tag -> type
> +    tag type
> +    case eins: q_obj_AliasStruct1-wrapper
>  module include/sub-module.json
>  include sub-sub-module.json
>  object SecondArrayRef

Positive tests look good to me, except they neglect to use any of the
types using the alias features in QMP.  I think we need something like
the appended incremental patch.

Oh, with that, backing out the hunk

  -        members =3D seen.values()
  +        members =3D list(seen.values())

as described in review of PATCH 5 actually fails "make check"!

The generated test-qapi-introspect.c doesn't show aliases.  Here's
AliasStruct1:

     /* "63" =3D AliasStruct1 */
     QLIT_QDICT(((QLitDictEntry[]) {
         { "members", QLIT_QLIST(((QLitObject[]) {
             QLIT_QDICT(((QLitDictEntry[]) {
                 { "name", QLIT_QSTR("foo"), },
                 { "type", QLIT_QSTR("int"), },
                 {}
             })),
             {}
         })), },
         { "meta-type", QLIT_QSTR("object"), },
         { "name", QLIT_QSTR("63"), },
         {}
     })),

Not a peep about member 'bar'.

We need to address this for use case "compatible schema evolution", so
that management applications can detect presence of the new interface.

Actual use of aliases for this purpose requires coordination with
libvirt developers, of course.

How could introspection show aliases?  We can't simply add an entry for
"bar" to "members", because that would show two mandatory members "foo"
and "bar", which is wrong.

If we add "aliases" next to "members", aliases remain invisible for
older management applications.  I don't have better ideas.

Let's have a closer look at "compatible schema evolution".  We want to
move / rename a member, and use aliases to support both the new and the
old name for compatibility.  We want to be able to deprecate the old
name.

Example 1: move 'foo' to 'bar'

    Two ways:

    1. Replace member 'foo' by 'bar', then add alias 'foo'

       Old management applications can't see the alias.  To them, it
       looks like 'foo' vanished without replacement, which is a
       compatibility break.  May well cause trouble.

    2. Add alias 'bar'

       Old management applications can't see the alias.  If we deprecate
       'foo', they see that.  Unlikely to cause trouble, I think.  If we
       remove 'foo', compatibility break, but that's intentional.

    Always use way 2.  Documentation should spell that out.

Example 2: move 'nested.foo' to 'bar'

    Due to the way aliases work, we need to make 'bar' the alias, like

        'aliases': [ { 'name': 'bar', 'source': ['nested', 'foo'] } ] }

    This is way 2. again.  Fine.

Example 1: move 'bar' to 'nested.foo'

    Due to the way aliases work, we need to replace 'bar' by
    'nested.foo', then add alias 'bar'.

    Here, we can only use problematic way 1.  Better ideas than
    "document the limitation?"


diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 1b0b7d99df..907468b157 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -76,6 +76,16 @@ void qmp_test_command_cond_features3(Error **errp)
 {
 }
=20
+void qmp_test_aliases0(bool has_as0, AliasStruct0 *as0,
+                       bool has_as1, AliasStruct1 *as1,
+                       bool has_as2, AliasStruct2 *as2,
+                       bool has_as3, AliasStruct3 *as3,
+                       bool has_afu, AliasFlatUnion *afu,
+                       bool has_asu, AliasSimpleUnion *asu,
+                       Error **errp)
+{
+}
+
 UserDefTwo *qmp_user_def_cmd2(UserDefOne *ud1a,
                               bool has_udb1, UserDefOne *ud1b,
                               Error **errp)
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qa=
pi-schema-test.json
index c5e81a883c..4d3a5039b4 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -362,3 +362,11 @@
   'data': { 'eins': 'AliasStruct1' },
   'aliases': [ { 'source': ['data'] },
                { 'name': 'tag', 'source': ['type'] } ] }
+
+{ 'command': 'test-aliases0',
+  'data': { '*as0': 'AliasStruct0',
+            '*as1': 'AliasStruct1',
+            '*as2': 'AliasStruct2',
+            '*as3': 'AliasStruct3',
+            '*afu': 'AliasFlatUnion',
+            '*asu': 'AliasSimpleUnion' } }


