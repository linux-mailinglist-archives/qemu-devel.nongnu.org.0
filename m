Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9D3DDB76
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 16:48:02 +0200 (CEST)
Received: from localhost ([::1]:39224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAZEX-0000Bk-28
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 10:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAZDZ-0007wv-Ml
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 10:47:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAZDV-0000bj-Fe
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 10:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627915616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PsUAoM8eWQe/9SyKvx4/SYpeD+W+asG+HJWvPY8wEgg=;
 b=Ny7Wjvao8jznoFOlGsy5GVA6uhiuy8yqP501sF7qeZ9YKmxfoJCHOQrUt9f76QOEnZ73tc
 8tKrRV4AxG4noKaXNZavQSHyO5UgwP6Y1r7Zc5lh3rNhpXrIiSsEHmGKQQWdc84+I6PZ0/
 QMQNh6T55YTJzfhhly0s/C1FZTNw+2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-HhTQu99xNtGKUU7L3JqcTQ-1; Mon, 02 Aug 2021 10:46:53 -0400
X-MC-Unique: HhTQu99xNtGKUU7L3JqcTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C81BCCC622
 for <qemu-devel@nongnu.org>; Mon,  2 Aug 2021 14:46:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D57F5D9D3;
 Mon,  2 Aug 2021 14:46:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B44E711380A0; Mon,  2 Aug 2021 16:46:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v6 05/11] qapi: introduce QAPISchemaIfCond.cgen()
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-6-marcandre.lureau@redhat.com>
Date: Mon, 02 Aug 2021 16:46:43 +0200
In-Reply-To: <20210618102507.3761128-6-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Fri, 18 Jun 2021 14:25:01 +0400")
Message-ID: <87pmuvoqek.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Eric Blake <eblake@redhat.com>, jsnow@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Instead of building prepocessor conditions from a list of string, use
> the result generated from QAPISchemaIfCond.cgen() and hide the
> implementation details.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Please mention that the patch changes generated code.  See below for
details.

> ---
>  scripts/qapi/common.py     | 35 ++++++++++++++++++++++-------------
>  scripts/qapi/gen.py        |  4 ++--
>  scripts/qapi/introspect.py |  4 ++--
>  scripts/qapi/schema.py     |  5 ++++-
>  scripts/qapi/types.py      | 20 ++++++++++----------
>  scripts/qapi/visit.py      | 12 ++++++------
>  6 files changed, 46 insertions(+), 34 deletions(-)
>
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 6ad1eeb61d..ba9fe14e4b 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -12,7 +12,12 @@
>  # See the COPYING file in the top-level directory.
> =20
>  import re
> -from typing import Match, Optional, Sequence
> +from typing import (
> +    List,
> +    Match,
> +    Optional,
> +    Union,
> +)
> =20
> =20
>  #: Magic string that gets removed along with all space to its right.
> @@ -194,22 +199,26 @@ def guardend(name: str) -> str:
>                   name=3Dc_fname(name).upper())
> =20
> =20
> -def gen_if(ifcond: Sequence[str]) -> str:
> -    ret =3D ''
> -    for ifc in ifcond:
> -        ret +=3D mcgen('''
> +def cgen_ifcond(ifcond: Union[str, List[str]]) -> str:
> +    if not ifcond:
> +        return ''
> +    return '(' + ') && ('.join(ifcond) + ')'
> +
> +
> +def gen_if(cond: str) -> str:
> +    if not cond:
> +        return ''
> +    return mcgen('''
>  #if %(cond)s
> -''', cond=3Difc)
> -    return ret
> +''', cond=3Dcond)
> =20
> =20
> -def gen_endif(ifcond: Sequence[str]) -> str:
> -    ret =3D ''
> -    for ifc in reversed(ifcond):
> -        ret +=3D mcgen('''
> +def gen_endif(cond: str) -> str:
> +    if not cond:
> +        return ''
> +    return mcgen('''
>  #endif /* %(cond)s */
> -''', cond=3Difc)
> -    return ret
> +''', cond=3Dcond)
> =20
> =20

This patch does three things:

(1) Change gen_if(), gen_endif() to always generate a single #if,
    #endif.  This enables:

(2) Factor cgen_ifcond() out of gen_if() and gen_endif()

(3) Lift the call of cgen_ifcond() into into gen_if()'s, gen_endif()'s
    callers.

I'd split the patch.  This is *not* a demand.

The motivation for (3) is unclear.  Is it so gen_if() doesn't depend on
QAPISchemaIfCond?

Step (1) affects the generated code.  When @ifcond is [COND1, COND2, ...],
gen_if()'s value changes from

    #if COND1
    #if COND2
    ...

to

    #if (COND1) && (COND2)

Example: in tests/test-qapi-introspect.c

    @@ -259,11 +257,9 @@ const QLitObject test_qmp_schema_qlit =3D
         QLIT_QDICT(((QLitDictEntry[]) {
             { "arg-type", QLIT_QSTR("1"), },
             { "features", QLIT_QLIST(((QLitObject[]) {
    -#if defined(TEST_IF_COND_1)
    -#if defined(TEST_IF_COND_2)
    +#if (defined(TEST_IF_COND_1)) && (defined(TEST_IF_COND_2))
                 QLIT_QSTR("feature1"),
    -#endif /* defined(TEST_IF_COND_2) */
    -#endif /* defined(TEST_IF_COND_1) */
    +#endif /* (defined(TEST_IF_COND_1)) && (defined(TEST_IF_COND_2)) */
                 {}
             })), },
             { "meta-type", QLIT_QSTR("command"), },

The common case: when it's just [COND], the value changes from

    #if COND

to

    #if (COND)

which is a bit ugly.

Example: in qapi-types-block-export.c

    @@ -76,7 +76,7 @@ const QEnumLookup FuseExportAllowOther_l
         .size =3D FUSE_EXPORT_ALLOW_OTHER__MAX
     };

    -#if defined(CONFIG_FUSE)
    +#if (defined(CONFIG_FUSE))
     void qapi_free_BlockExportOptionsFuse(BlockExportOptionsFuse *obj)
     {
         Visitor *v;
    @@ -89,7 +89,7 @@ void qapi_free_BlockExportOptionsFuse(Bl
         visit_type_BlockExportOptionsFuse(v, NULL, &obj, NULL);
         visit_free(v);
     }
    -#endif /* defined(CONFIG_FUSE) */
    +#endif /* (defined(CONFIG_FUSE)) */

     void qapi_free_NbdServerAddOptions(NbdServerAddOptions *obj)
     {

Avoiding the redundant pair of parenthesis takes another special case.
Let's do it.

>  def must_match(pattern: str, string: str) -> Match[str]:
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 1c5b190276..51a597a025 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str,=
 after: str) -> str:
>      if added[0] =3D=3D '\n':
>          out +=3D '\n'
>          added =3D added[1:]
> -    out +=3D gen_if(ifcond.ifcond)
> +    out +=3D gen_if(ifcond.cgen())
>      out +=3D added
> -    out +=3D gen_endif(ifcond.ifcond)
> +    out +=3D gen_endif(ifcond.cgen())
>      return out
> =20
> =20

> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 77a8c33ad4..474b08fd4d 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -124,10 +124,10 @@ def indent(level: int) -> str:
>          if obj.comment:
>              ret +=3D indent(level) + f"/* {obj.comment} */\n"
>          if obj.ifcond:
> -            ret +=3D gen_if(obj.ifcond.ifcond)
> +            ret +=3D gen_if(obj.ifcond.cgen())
>          ret +=3D _tree_to_qlit(obj.value, level)
>          if obj.ifcond:
> -            ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)
> +            ret +=3D '\n' + gen_endif(obj.ifcond.cgen())
>          return ret
> =20
>      ret =3D ''
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index c35fa3bf51..70120f0dcc 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -19,7 +19,7 @@
>  import re
>  from typing import Optional
> =20
> -from .common import POINTER_SUFFIX, c_name
> +from .common import POINTER_SUFFIX, c_name, cgen_ifcond
>  from .error import QAPIError, QAPISemError, QAPISourceError
>  from .expr import check_exprs
>  from .parser import QAPISchemaParser
> @@ -29,6 +29,9 @@ class QAPISchemaIfCond:
>      def __init__(self, ifcond=3DNone):
>          self.ifcond =3D ifcond or []
> =20
> +    def cgen(self):
> +        return cgen_ifcond(self.ifcond)
> +

As far as I can tell, this is only ever used like

       gen_if(obj.ifcond.cgen())

and

       gen_endif(obj.ifcond.cgen())

Wouldn't

       obj.ifcond.gen_if()

and

       obj.ifcond.gen_endif()

be neater?

Not a demand, since we can get there on top if we want to.

>      def is_present(self):
>          return bool(self.ifcond)
> =20
> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> index 3673cf0f49..db9ff95bd1 100644
> --- a/scripts/qapi/types.py
> +++ b/scripts/qapi/types.py
> @@ -51,13 +51,13 @@ def gen_enum_lookup(name: str,
>  ''',
>                  c_name=3Dc_name(name))
>      for memb in members:
> -        ret +=3D gen_if(memb.ifcond.ifcond)
> +        ret +=3D gen_if(memb.ifcond.cgen())
>          index =3D c_enum_const(name, memb.name, prefix)
>          ret +=3D mcgen('''
>          [%(index)s] =3D "%(name)s",
>  ''',
>                       index=3Dindex, name=3Dmemb.name)
> -        ret +=3D gen_endif(memb.ifcond.ifcond)
> +        ret +=3D gen_endif(memb.ifcond.cgen())
> =20
>      ret +=3D mcgen('''
>      },
> @@ -81,12 +81,12 @@ def gen_enum(name: str,
>                  c_name=3Dc_name(name))
> =20
>      for memb in enum_members:
> -        ret +=3D gen_if(memb.ifcond.ifcond)
> +        ret +=3D gen_if(memb.ifcond.cgen())
>          ret +=3D mcgen('''
>      %(c_enum)s,
>  ''',
>                       c_enum=3Dc_enum_const(name, memb.name, prefix))
> -        ret +=3D gen_endif(memb.ifcond.ifcond)
> +        ret +=3D gen_endif(memb.ifcond.cgen())
> =20
>      ret +=3D mcgen('''
>  } %(c_name)s;
> @@ -126,7 +126,7 @@ def gen_array(name: str, element_type: QAPISchemaType=
) -> str:
>  def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str=
:
>      ret =3D ''
>      for memb in members:
> -        ret +=3D gen_if(memb.ifcond.ifcond)
> +        ret +=3D gen_if(memb.ifcond.cgen())
>          if memb.optional:
>              ret +=3D mcgen('''
>      bool has_%(c_name)s;
> @@ -136,7 +136,7 @@ def gen_struct_members(members: List[QAPISchemaObject=
TypeMember]) -> str:
>      %(c_type)s %(c_name)s;
>  ''',
>                       c_type=3Dmemb.type.c_type(), c_name=3Dc_name(memb.n=
ame))
> -        ret +=3D gen_endif(memb.ifcond.ifcond)
> +        ret +=3D gen_endif(memb.ifcond.cgen())
>      return ret
> =20
> =20
> @@ -159,7 +159,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond,
>      ret +=3D mcgen('''
> =20
>  ''')
> -    ret +=3D gen_if(ifcond.ifcond)
> +    ret +=3D gen_if(ifcond.cgen())
>      ret +=3D mcgen('''
>  struct %(c_name)s {
>  ''',
> @@ -193,7 +193,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond,
>      ret +=3D mcgen('''
>  };
>  ''')
> -    ret +=3D gen_endif(ifcond.ifcond)
> +    ret +=3D gen_endif(ifcond.cgen())
> =20
>      return ret
> =20
> @@ -220,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) -> s=
tr:
>      for var in variants.variants:
>          if var.type.name =3D=3D 'q_empty':
>              continue
> -        ret +=3D gen_if(var.ifcond.ifcond)
> +        ret +=3D gen_if(var.ifcond.cgen())
>          ret +=3D mcgen('''
>          %(c_type)s %(c_name)s;
>  ''',
>                       c_type=3Dvar.type.c_unboxed_type(),
>                       c_name=3Dc_name(var.name))
> -        ret +=3D gen_endif(var.ifcond.ifcond)
> +        ret +=3D gen_endif(var.ifcond.cgen())
> =20
>      ret +=3D mcgen('''
>      } u;
> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index 67721b2470..56ea516399 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -79,7 +79,7 @@ def gen_visit_object_members(name: str,
> =20
>      for memb in members:
>          deprecated =3D 'deprecated' in [f.name for f in memb.features]
> -        ret +=3D gen_if(memb.ifcond.ifcond)
> +        ret +=3D gen_if(memb.ifcond.cgen())
>          if memb.optional:
>              ret +=3D mcgen('''
>      if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
> @@ -112,7 +112,7 @@ def gen_visit_object_members(name: str,
>              ret +=3D mcgen('''
>      }
>  ''')
> -        ret +=3D gen_endif(memb.ifcond.ifcond)
> +        ret +=3D gen_endif(memb.ifcond.cgen())
> =20
>      if variants:
>          tag_member =3D variants.tag_member
> @@ -126,7 +126,7 @@ def gen_visit_object_members(name: str,
>          for var in variants.variants:
>              case_str =3D c_enum_const(tag_member.type.name, var.name,
>                                      tag_member.type.prefix)
> -            ret +=3D gen_if(var.ifcond.ifcond)
> +            ret +=3D gen_if(var.ifcond.cgen())
>              if var.type.name =3D=3D 'q_empty':
>                  # valid variant and nothing to do
>                  ret +=3D mcgen('''
> @@ -142,7 +142,7 @@ def gen_visit_object_members(name: str,
>                               case=3Dcase_str,
>                               c_type=3Dvar.type.c_name(), c_name=3Dc_name=
(var.name))
> =20
> -            ret +=3D gen_endif(var.ifcond.ifcond)
> +            ret +=3D gen_endif(var.ifcond.cgen())
>          ret +=3D mcgen('''
>      default:
>          abort();
> @@ -228,7 +228,7 @@ def gen_visit_alternate(name: str, variants: QAPISche=
maVariants) -> str:
>                  c_name=3Dc_name(name))
> =20
>      for var in variants.variants:
> -        ret +=3D gen_if(var.ifcond.ifcond)
> +        ret +=3D gen_if(var.ifcond.cgen())
>          ret +=3D mcgen('''
>      case %(case)s:
>  ''',
> @@ -254,7 +254,7 @@ def gen_visit_alternate(name: str, variants: QAPISche=
maVariants) -> str:
>          ret +=3D mcgen('''
>          break;
>  ''')
> -        ret +=3D gen_endif(var.ifcond.ifcond)
> +        ret +=3D gen_endif(var.ifcond.cgen())
> =20
>      ret +=3D mcgen('''
>      case QTYPE_NONE:


