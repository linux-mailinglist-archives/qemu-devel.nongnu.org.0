Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35B73DFCC3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:26:02 +0200 (CEST)
Received: from localhost ([::1]:34396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCDx-0001DE-Vf
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCBR-00046y-QU
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:23:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCBN-00033p-5C
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:23:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628065400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SZPwbbP8poxAsdY63lnKpxsinDGG2o7suB5/MC5OtDE=;
 b=V7be1J0hELHHQWwmCCUCPSY98xU6t/9wbhMKWkYkM/ES6qyTUZ0krf6QMOlAL0LwZGqAhj
 woRGLBr0asiVbfrbwXUtf//iC80eATsYjZ5glqW6E7WFK2w6Tpf3Yj19bkEnoXY5L77bx3
 FAUq2Jgb53H7yoQnXEOMK2LjvKhu5O0=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-VACbtCXLP4KlVsj4pddfxA-1; Wed, 04 Aug 2021 04:23:14 -0400
X-MC-Unique: VACbtCXLP4KlVsj4pddfxA-1
Received: by mail-pl1-f197.google.com with SMTP id
 j5-20020a170902da85b029012c4287ea54so1547351plx.22
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SZPwbbP8poxAsdY63lnKpxsinDGG2o7suB5/MC5OtDE=;
 b=uVvuobFjxxftMRm3CUGHp5wpbHVWR16eEkWteNqQBqSaRel5UIao0e4hmkDxHc0MRT
 GqK5ElErsT3DW013W4bn0ePXivAkGtz7yFmznNamfN9jbsntXK/z2Pgb6wDIqzjRKSXb
 zZstX0CELHtEzA2QECR56BeAjzT0GcsZPMBU3UBe4NY851xoJhH0k8B+rIZ5Y3f5X3qa
 hC1vVJfHMem83EVishmoiW4NMP0v6JINdCI+viobIGxmWSU9sQY5N1W64N0HLJZK2RhC
 5Pt3nJtOHhK7i2OzpJI0XaZ43sRuBE29ghMJlZ5KJ87BkHVrNmD1A3/JIRb4fdFpbG9M
 i9lg==
X-Gm-Message-State: AOAM531esG+sIORSqGOFC9bVChVFZ4sdqCi4TlZg7xsMfattsbe+HCzv
 GHWNGc+nENC7f6tk6BO70Ov91zlidDujDtkhrEP6B9aIsFXkpCmCwwvL2TJ33UTCVThdXZuAhau
 3HTtun0tSGFY3nfLK4is8ddr0nmGB7SE=
X-Received: by 2002:a17:90a:e558:: with SMTP id
 ei24mr26214415pjb.97.1628065393360; 
 Wed, 04 Aug 2021 01:23:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNT3GzZnk0nA62dFnGbyUud8wzAc0HgGnsa2WUZTIvYAMV0w5wSAQo1PiVtNfxKksVctgj09taVUvqziQ6Ywg=
X-Received: by 2002:a17:90a:e558:: with SMTP id
 ei24mr26214398pjb.97.1628065393187; 
 Wed, 04 Aug 2021 01:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-6-marcandre.lureau@redhat.com>
 <87pmuvoqek.fsf@dusky.pond.sub.org>
In-Reply-To: <87pmuvoqek.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 4 Aug 2021 12:23:01 +0400
Message-ID: <CAMxuvawMFPLxFcndyJ9YdFBJFr-9c0deFN3BvnOyceEae21quQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/11] qapi: introduce QAPISchemaIfCond.cgen()
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006eb58505c8b78375"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006eb58505c8b78375
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Aug 2, 2021 at 6:46 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Instead of building prepocessor conditions from a list of string, use
> > the result generated from QAPISchemaIfCond.cgen() and hide the
> > implementation details.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Please mention that the patch changes generated code.  See below for
> details.
>

I'll add

    Note: this patch introduces a minor regression, generating a redundant
    pair of parenthesis. This is fixed in a later patch in this
    series ("qapi: replace if condition list with dict [..]")


> > ---
> >  scripts/qapi/common.py     | 35 ++++++++++++++++++++++-------------
> >  scripts/qapi/gen.py        |  4 ++--
> >  scripts/qapi/introspect.py |  4 ++--
> >  scripts/qapi/schema.py     |  5 ++++-
> >  scripts/qapi/types.py      | 20 ++++++++++----------
> >  scripts/qapi/visit.py      | 12 ++++++------
> >  6 files changed, 46 insertions(+), 34 deletions(-)
> >
> > diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> > index 6ad1eeb61d..ba9fe14e4b 100644
> > --- a/scripts/qapi/common.py
> > +++ b/scripts/qapi/common.py
> > @@ -12,7 +12,12 @@
> >  # See the COPYING file in the top-level directory.
> >
> >  import re
> > -from typing import Match, Optional, Sequence
> > +from typing import (
> > +    List,
> > +    Match,
> > +    Optional,
> > +    Union,
> > +)
> >
> >
> >  #: Magic string that gets removed along with all space to its right.
> > @@ -194,22 +199,26 @@ def guardend(name: str) -> str:
> >                   name=3Dc_fname(name).upper())
> >
> >
> > -def gen_if(ifcond: Sequence[str]) -> str:
> > -    ret =3D ''
> > -    for ifc in ifcond:
> > -        ret +=3D mcgen('''
> > +def cgen_ifcond(ifcond: Union[str, List[str]]) -> str:
> > +    if not ifcond:
> > +        return ''
> > +    return '(' + ') && ('.join(ifcond) + ')'
> > +
> > +
> > +def gen_if(cond: str) -> str:
> > +    if not cond:
> > +        return ''
> > +    return mcgen('''
> >  #if %(cond)s
> > -''', cond=3Difc)
> > -    return ret
> > +''', cond=3Dcond)
> >
> >
> > -def gen_endif(ifcond: Sequence[str]) -> str:
> > -    ret =3D ''
> > -    for ifc in reversed(ifcond):
> > -        ret +=3D mcgen('''
> > +def gen_endif(cond: str) -> str:
> > +    if not cond:
> > +        return ''
> > +    return mcgen('''
> >  #endif /* %(cond)s */
> > -''', cond=3Difc)
> > -    return ret
> > +''', cond=3Dcond)
> >
> >
>
> This patch does three things:
>
> (1) Change gen_if(), gen_endif() to always generate a single #if,
>     #endif.  This enables:
>
> (2) Factor cgen_ifcond() out of gen_if() and gen_endif()
>
> (3) Lift the call of cgen_ifcond() into into gen_if()'s, gen_endif()'s
>     callers.
>
> I'd split the patch.  This is *not* a demand.
>
> The motivation for (3) is unclear.  Is it so gen_if() doesn't depend on
> QAPISchemaIfCond?
>
> Step (1) affects the generated code.  When @ifcond is [COND1, COND2, ...]=
,
> gen_if()'s value changes from
>
>     #if COND1
>     #if COND2
>     ...
>
> to
>
>     #if (COND1) && (COND2)
>
> Example: in tests/test-qapi-introspect.c
>
>     @@ -259,11 +257,9 @@ const QLitObject test_qmp_schema_qlit =3D
>          QLIT_QDICT(((QLitDictEntry[]) {
>              { "arg-type", QLIT_QSTR("1"), },
>              { "features", QLIT_QLIST(((QLitObject[]) {
>     -#if defined(TEST_IF_COND_1)
>     -#if defined(TEST_IF_COND_2)
>     +#if (defined(TEST_IF_COND_1)) && (defined(TEST_IF_COND_2))
>                  QLIT_QSTR("feature1"),
>     -#endif /* defined(TEST_IF_COND_2) */
>     -#endif /* defined(TEST_IF_COND_1) */
>     +#endif /* (defined(TEST_IF_COND_1)) && (defined(TEST_IF_COND_2)) */
>                  {}
>              })), },
>              { "meta-type", QLIT_QSTR("command"), },
>
> The common case: when it's just [COND], the value changes from
>
>     #if COND
>
> to
>
>     #if (COND)
>
> which is a bit ugly.
>
> Example: in qapi-types-block-export.c
>
>     @@ -76,7 +76,7 @@ const QEnumLookup FuseExportAllowOther_l
>          .size =3D FUSE_EXPORT_ALLOW_OTHER__MAX
>      };
>
>     -#if defined(CONFIG_FUSE)
>     +#if (defined(CONFIG_FUSE))
>      void qapi_free_BlockExportOptionsFuse(BlockExportOptionsFuse *obj)
>      {
>          Visitor *v;
>     @@ -89,7 +89,7 @@ void qapi_free_BlockExportOptionsFuse(Bl
>          visit_type_BlockExportOptionsFuse(v, NULL, &obj, NULL);
>          visit_free(v);
>      }
>     -#endif /* defined(CONFIG_FUSE) */
>     +#endif /* (defined(CONFIG_FUSE)) */
>
>      void qapi_free_NbdServerAddOptions(NbdServerAddOptions *obj)
>      {
>
> Avoiding the redundant pair of parenthesis takes another special case.
> Let's do it.
>
> >  def must_match(pattern: str, string: str) -> Match[str]:
> > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> > index 1c5b190276..51a597a025 100644
> > --- a/scripts/qapi/gen.py
> > +++ b/scripts/qapi/gen.py
> > @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: QAPISchemaIfCond, before:
> str, after: str) -> str:
> >      if added[0] =3D=3D '\n':
> >          out +=3D '\n'
> >          added =3D added[1:]
> > -    out +=3D gen_if(ifcond.ifcond)
> > +    out +=3D gen_if(ifcond.cgen())
> >      out +=3D added
> > -    out +=3D gen_endif(ifcond.ifcond)
> > +    out +=3D gen_endif(ifcond.cgen())
> >      return out
> >
> >
>
> > diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> > index 77a8c33ad4..474b08fd4d 100644
> > --- a/scripts/qapi/introspect.py
> > +++ b/scripts/qapi/introspect.py
> > @@ -124,10 +124,10 @@ def indent(level: int) -> str:
> >          if obj.comment:
> >              ret +=3D indent(level) + f"/* {obj.comment} */\n"
> >          if obj.ifcond:
> > -            ret +=3D gen_if(obj.ifcond.ifcond)
> > +            ret +=3D gen_if(obj.ifcond.cgen())
> >          ret +=3D _tree_to_qlit(obj.value, level)
> >          if obj.ifcond:
> > -            ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)
> > +            ret +=3D '\n' + gen_endif(obj.ifcond.cgen())
> >          return ret
> >
> >      ret =3D ''
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index c35fa3bf51..70120f0dcc 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -19,7 +19,7 @@
> >  import re
> >  from typing import Optional
> >
> > -from .common import POINTER_SUFFIX, c_name
> > +from .common import POINTER_SUFFIX, c_name, cgen_ifcond
> >  from .error import QAPIError, QAPISemError, QAPISourceError
> >  from .expr import check_exprs
> >  from .parser import QAPISchemaParser
> > @@ -29,6 +29,9 @@ class QAPISchemaIfCond:
> >      def __init__(self, ifcond=3DNone):
> >          self.ifcond =3D ifcond or []
> >
> > +    def cgen(self):
> > +        return cgen_ifcond(self.ifcond)
> > +
>
> As far as I can tell, this is only ever used like
>
>        gen_if(obj.ifcond.cgen())
>
> and
>
>        gen_endif(obj.ifcond.cgen())
>
> Wouldn't
>
>        obj.ifcond.gen_if()
>
> and
>
>        obj.ifcond.gen_endif()
>
> be neater?
>

Yes


> Not a demand, since we can get there on top if we want to.
>
> >      def is_present(self):
> >          return bool(self.ifcond)
> >
> > diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> > index 3673cf0f49..db9ff95bd1 100644
> > --- a/scripts/qapi/types.py
> > +++ b/scripts/qapi/types.py
> > @@ -51,13 +51,13 @@ def gen_enum_lookup(name: str,
> >  ''',
> >                  c_name=3Dc_name(name))
> >      for memb in members:
> > -        ret +=3D gen_if(memb.ifcond.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.cgen())
> >          index =3D c_enum_const(name, memb.name, prefix)
> >          ret +=3D mcgen('''
> >          [%(index)s] =3D "%(name)s",
> >  ''',
> >                       index=3Dindex, name=3Dmemb.name)
> > -        ret +=3D gen_endif(memb.ifcond.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.cgen())
> >
> >      ret +=3D mcgen('''
> >      },
> > @@ -81,12 +81,12 @@ def gen_enum(name: str,
> >                  c_name=3Dc_name(name))
> >
> >      for memb in enum_members:
> > -        ret +=3D gen_if(memb.ifcond.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.cgen())
> >          ret +=3D mcgen('''
> >      %(c_enum)s,
> >  ''',
> >                       c_enum=3Dc_enum_const(name, memb.name, prefix))
> > -        ret +=3D gen_endif(memb.ifcond.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.cgen())
> >
> >      ret +=3D mcgen('''
> >  } %(c_name)s;
> > @@ -126,7 +126,7 @@ def gen_array(name: str, element_type:
> QAPISchemaType) -> str:
> >  def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) ->
> str:
> >      ret =3D ''
> >      for memb in members:
> > -        ret +=3D gen_if(memb.ifcond.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.cgen())
> >          if memb.optional:
> >              ret +=3D mcgen('''
> >      bool has_%(c_name)s;
> > @@ -136,7 +136,7 @@ def gen_struct_members(members:
> List[QAPISchemaObjectTypeMember]) -> str:
> >      %(c_type)s %(c_name)s;
> >  ''',
> >                       c_type=3Dmemb.type.c_type(), c_name=3Dc_name(memb=
.name
> ))
> > -        ret +=3D gen_endif(memb.ifcond.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.cgen())
> >      return ret
> >
> >
> > @@ -159,7 +159,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond,
> >      ret +=3D mcgen('''
> >
> >  ''')
> > -    ret +=3D gen_if(ifcond.ifcond)
> > +    ret +=3D gen_if(ifcond.cgen())
> >      ret +=3D mcgen('''
> >  struct %(c_name)s {
> >  ''',
> > @@ -193,7 +193,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond,
> >      ret +=3D mcgen('''
> >  };
> >  ''')
> > -    ret +=3D gen_endif(ifcond.ifcond)
> > +    ret +=3D gen_endif(ifcond.cgen())
> >
> >      return ret
> >
> > @@ -220,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) ->
> str:
> >      for var in variants.variants:
> >          if var.type.name =3D=3D 'q_empty':
> >              continue
> > -        ret +=3D gen_if(var.ifcond.ifcond)
> > +        ret +=3D gen_if(var.ifcond.cgen())
> >          ret +=3D mcgen('''
> >          %(c_type)s %(c_name)s;
> >  ''',
> >                       c_type=3Dvar.type.c_unboxed_type(),
> >                       c_name=3Dc_name(var.name))
> > -        ret +=3D gen_endif(var.ifcond.ifcond)
> > +        ret +=3D gen_endif(var.ifcond.cgen())
> >
> >      ret +=3D mcgen('''
> >      } u;
> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> > index 67721b2470..56ea516399 100644
> > --- a/scripts/qapi/visit.py
> > +++ b/scripts/qapi/visit.py
> > @@ -79,7 +79,7 @@ def gen_visit_object_members(name: str,
> >
> >      for memb in members:
> >          deprecated =3D 'deprecated' in [f.name for f in memb.features]
> > -        ret +=3D gen_if(memb.ifcond.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.cgen())
> >          if memb.optional:
> >              ret +=3D mcgen('''
> >      if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
> > @@ -112,7 +112,7 @@ def gen_visit_object_members(name: str,
> >              ret +=3D mcgen('''
> >      }
> >  ''')
> > -        ret +=3D gen_endif(memb.ifcond.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.cgen())
> >
> >      if variants:
> >          tag_member =3D variants.tag_member
> > @@ -126,7 +126,7 @@ def gen_visit_object_members(name: str,
> >          for var in variants.variants:
> >              case_str =3D c_enum_const(tag_member.type.name, var.name,
> >                                      tag_member.type.prefix)
> > -            ret +=3D gen_if(var.ifcond.ifcond)
> > +            ret +=3D gen_if(var.ifcond.cgen())
> >              if var.type.name =3D=3D 'q_empty':
> >                  # valid variant and nothing to do
> >                  ret +=3D mcgen('''
> > @@ -142,7 +142,7 @@ def gen_visit_object_members(name: str,
> >                               case=3Dcase_str,
> >                               c_type=3Dvar.type.c_name(), c_name=3Dc_na=
me(
> var.name))
> >
> > -            ret +=3D gen_endif(var.ifcond.ifcond)
> > +            ret +=3D gen_endif(var.ifcond.cgen())
> >          ret +=3D mcgen('''
> >      default:
> >          abort();
> > @@ -228,7 +228,7 @@ def gen_visit_alternate(name: str, variants:
> QAPISchemaVariants) -> str:
> >                  c_name=3Dc_name(name))
> >
> >      for var in variants.variants:
> > -        ret +=3D gen_if(var.ifcond.ifcond)
> > +        ret +=3D gen_if(var.ifcond.cgen())
> >          ret +=3D mcgen('''
> >      case %(case)s:
> >  ''',
> > @@ -254,7 +254,7 @@ def gen_visit_alternate(name: str, variants:
> QAPISchemaVariants) -> str:
> >          ret +=3D mcgen('''
> >          break;
> >  ''')
> > -        ret +=3D gen_endif(var.ifcond.ifcond)
> > +        ret +=3D gen_endif(var.ifcond.cgen())
> >
> >      ret +=3D mcgen('''
> >      case QTYPE_NONE:
>
>

--0000000000006eb58505c8b78375
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 6:46 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">ar=
mbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_bl=
ank">marcandre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Instead of building prepocessor conditions from a list of string, use<=
br>
&gt; the result generated from QAPISchemaIfCond.cgen() and hide the<br>
&gt; implementation details.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
<br>
Please mention that the patch changes generated code.=C2=A0 See below for<b=
r>
details.<br></blockquote><div><br></div><div>I&#39;ll add</div><div>=C2=A0 =
=C2=A0 <br>=C2=A0 =C2=A0 Note: this patch introduces a minor regression, ge=
nerating a redundant<br>=C2=A0 =C2=A0 pair of parenthesis. This is fixed in=
 a later patch in this<br>=C2=A0 =C2=A0 series (&quot;qapi: replace if cond=
ition list with dict [..]&quot;)</div><div><br> </div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/common.py=C2=A0 =C2=A0 =C2=A0| 35 +++++++++++++++++=
+++++-------------<br>
&gt;=C2=A0 scripts/qapi/gen.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br=
>
&gt;=C2=A0 scripts/qapi/introspect.py |=C2=A0 4 ++--<br>
&gt;=C2=A0 scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++++-<br>
&gt;=C2=A0 scripts/qapi/types.py=C2=A0 =C2=A0 =C2=A0 | 20 ++++++++++-------=
---<br>
&gt;=C2=A0 scripts/qapi/visit.py=C2=A0 =C2=A0 =C2=A0 | 12 ++++++------<br>
&gt;=C2=A0 6 files changed, 46 insertions(+), 34 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py<br>
&gt; index 6ad1eeb61d..ba9fe14e4b 100644<br>
&gt; --- a/scripts/qapi/common.py<br>
&gt; +++ b/scripts/qapi/common.py<br>
&gt; @@ -12,7 +12,12 @@<br>
&gt;=C2=A0 # See the COPYING file in the top-level directory.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 import re<br>
&gt; -from typing import Match, Optional, Sequence<br>
&gt; +from typing import (<br>
&gt; +=C2=A0 =C2=A0 List,<br>
&gt; +=C2=A0 =C2=A0 Match,<br>
&gt; +=C2=A0 =C2=A0 Optional,<br>
&gt; +=C2=A0 =C2=A0 Union,<br>
&gt; +)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #: Magic string that gets removed along with all space to its ri=
ght.<br>
&gt; @@ -194,22 +199,26 @@ def guardend(name: str) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0na=
me=3Dc_fname(name).upper())<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -def gen_if(ifcond: Sequence[str]) -&gt; str:<br>
&gt; -=C2=A0 =C2=A0 ret =3D &#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 for ifc in ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt; +def cgen_ifcond(ifcond: Union[str, List[str]]) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 if not ifcond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 return &#39;(&#39; + &#39;) &amp;&amp; (&#39;.join(ifco=
nd) + &#39;)&#39;<br>
&gt; +<br>
&gt; +<br>
&gt; +def gen_if(cond: str) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 if not cond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 return mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 #if %(cond)s<br>
&gt; -&#39;&#39;&#39;, cond=3Difc)<br>
&gt; -=C2=A0 =C2=A0 return ret<br>
&gt; +&#39;&#39;&#39;, cond=3Dcond)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -def gen_endif(ifcond: Sequence[str]) -&gt; str:<br>
&gt; -=C2=A0 =C2=A0 ret =3D &#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 for ifc in reversed(ifcond):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt; +def gen_endif(cond: str) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 if not cond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 return mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 #endif /* %(cond)s */<br>
&gt; -&#39;&#39;&#39;, cond=3Difc)<br>
&gt; -=C2=A0 =C2=A0 return ret<br>
&gt; +&#39;&#39;&#39;, cond=3Dcond)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
<br>
This patch does three things:<br>
<br>
(1) Change gen_if(), gen_endif() to always generate a single #if,<br>
=C2=A0 =C2=A0 #endif.=C2=A0 This enables:<br>
<br>
(2) Factor cgen_ifcond() out of gen_if() and gen_endif()<br>
<br>
(3) Lift the call of cgen_ifcond() into into gen_if()&#39;s, gen_endif()&#3=
9;s<br>
=C2=A0 =C2=A0 callers.<br>
<br>
I&#39;d split the patch.=C2=A0 This is *not* a demand.<br>
<br>
The motivation for (3) is unclear.=C2=A0 Is it so gen_if() doesn&#39;t depe=
nd on<br>
QAPISchemaIfCond?<br>
<br>
Step (1) affects the generated code.=C2=A0 When @ifcond is [COND1, COND2, .=
..],<br>
gen_if()&#39;s value changes from<br>
<br>
=C2=A0 =C2=A0 #if COND1<br>
=C2=A0 =C2=A0 #if COND2<br>
=C2=A0 =C2=A0 ...<br>
<br>
to<br>
<br>
=C2=A0 =C2=A0 #if (COND1) &amp;&amp; (COND2)<br>
<br>
Example: in tests/test-qapi-introspect.c<br>
<br>
=C2=A0 =C2=A0 @@ -259,11 +257,9 @@ const QLitObject test_qmp_schema_qlit =
=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QLIT_QDICT(((QLitDictEntry[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;arg-type&quot;, QLI=
T_QSTR(&quot;1&quot;), },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;features&quot;, QLI=
T_QLIST(((QLitObject[]) {<br>
=C2=A0 =C2=A0 -#if defined(TEST_IF_COND_1)<br>
=C2=A0 =C2=A0 -#if defined(TEST_IF_COND_2)<br>
=C2=A0 =C2=A0 +#if (defined(TEST_IF_COND_1)) &amp;&amp; (defined(TEST_IF_CO=
ND_2))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QLIT_QSTR(&qu=
ot;feature1&quot;),<br>
=C2=A0 =C2=A0 -#endif /* defined(TEST_IF_COND_2) */<br>
=C2=A0 =C2=A0 -#endif /* defined(TEST_IF_COND_1) */<br>
=C2=A0 =C2=A0 +#endif /* (defined(TEST_IF_COND_1)) &amp;&amp; (defined(TEST=
_IF_COND_2)) */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0})), },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;meta-type&quot;, QL=
IT_QSTR(&quot;command&quot;), },<br>
<br>
The common case: when it&#39;s just [COND], the value changes from<br>
<br>
=C2=A0 =C2=A0 #if COND<br>
<br>
to<br>
<br>
=C2=A0 =C2=A0 #if (COND)<br>
<br>
which is a bit ugly.<br>
<br>
Example: in qapi-types-block-export.c<br>
<br>
=C2=A0 =C2=A0 @@ -76,7 +76,7 @@ const QEnumLookup FuseExportAllowOther_l<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size =3D FUSE_EXPORT_ALLOW_OTHER__MAX<br=
>
=C2=A0 =C2=A0 =C2=A0};<br>
<br>
=C2=A0 =C2=A0 -#if defined(CONFIG_FUSE)<br>
=C2=A0 =C2=A0 +#if (defined(CONFIG_FUSE))<br>
=C2=A0 =C2=A0 =C2=A0void qapi_free_BlockExportOptionsFuse(BlockExportOption=
sFuse *obj)<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Visitor *v;<br>
=C2=A0 =C2=A0 @@ -89,7 +89,7 @@ void qapi_free_BlockExportOptionsFuse(Bl<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0visit_type_BlockExportOptionsFuse(v, NULL=
, &amp;obj, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0visit_free(v);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 -#endif /* defined(CONFIG_FUSE) */<br>
=C2=A0 =C2=A0 +#endif /* (defined(CONFIG_FUSE)) */<br>
<br>
=C2=A0 =C2=A0 =C2=A0void qapi_free_NbdServerAddOptions(NbdServerAddOptions =
*obj)<br>
=C2=A0 =C2=A0 =C2=A0{<br>
<br>
Avoiding the redundant pair of parenthesis takes another special case.<br>
Let&#39;s do it.<br>
<br>
&gt;=C2=A0 def must_match(pattern: str, string: str) -&gt; Match[str]:<br>
&gt; diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py<br>
&gt; index 1c5b190276..51a597a025 100644<br>
&gt; --- a/scripts/qapi/gen.py<br>
&gt; +++ b/scripts/qapi/gen.py<br>
&gt; @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: s=
tr, after: str) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if added[0] =3D=3D &#39;\n&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D &#39;\n&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 added =3D added[1:]<br>
&gt; -=C2=A0 =C2=A0 out +=3D gen_if(ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 out +=3D gen_if(ifcond.cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 out +=3D added<br>
&gt; -=C2=A0 =C2=A0 out +=3D gen_endif(ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 out +=3D gen_endif(ifcond.cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return out<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
<br>
&gt; diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py<b=
r>
&gt; index 77a8c33ad4..474b08fd4d 100644<br>
&gt; --- a/scripts/qapi/introspect.py<br>
&gt; +++ b/scripts/qapi/introspect.py<br>
&gt; @@ -124,10 +124,10 @@ def indent(level: int) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.comment:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D indent(level)=
 + f&quot;/* {obj.comment} */\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(obj.ifcond.=
ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(obj.ifcond.=
cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D _tree_to_qlit(obj.value, le=
vel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;\n&#39; + gen=
_endif(obj.ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;\n&#39; + gen=
_endif(obj.ifcond.cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D &#39;&#39;<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index c35fa3bf51..70120f0dcc 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -19,7 +19,7 @@<br>
&gt;=C2=A0 import re<br>
&gt;=C2=A0 from typing import Optional<br>
&gt;=C2=A0 <br>
&gt; -from .common import POINTER_SUFFIX, c_name<br>
&gt; +from .common import POINTER_SUFFIX, c_name, cgen_ifcond<br>
&gt;=C2=A0 from .error import QAPIError, QAPISemError, QAPISourceError<br>
&gt;=C2=A0 from .expr import check_exprs<br>
&gt;=C2=A0 from .parser import QAPISchemaParser<br>
&gt; @@ -29,6 +29,9 @@ class QAPISchemaIfCond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __init__(self, ifcond=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 def cgen(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cgen_ifcond(self.ifcond)<br>
&gt; +<br>
<br>
As far as I can tell, this is only ever used like<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_if(obj.ifcond.cgen())<br>
<br>
and<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_endif(obj.ifcond.cgen())<br>
<br>
Wouldn&#39;t<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0obj.ifcond.gen_if()<br>
<br>
and<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0obj.ifcond.gen_endif()<br>
<br>
be neater?<br></blockquote><div><br></div><div>Yes</div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Not a demand, since we can get there on top if we want to.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def is_present(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(self.ifcond)<br>
&gt;=C2=A0 <br>
&gt; diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py<br>
&gt; index 3673cf0f49..db9ff95bd1 100644<br>
&gt; --- a/scripts/qapi/types.py<br>
&gt; +++ b/scripts/qapi/types.py<br>
&gt; @@ -51,13 +51,13 @@ def gen_enum_lookup(name: str,<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_name=
=3Dc_name(name))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index =3D c_enum_const(name, <a href=
=3D"http://memb.name" rel=3D"noreferrer" target=3D"_blank">memb.name</a>, p=
refix)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [%(index)s] =3D &quot;%(name)s&quot;=
,<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0index=3Dindex, name=3D<a href=3D"http://memb.name" rel=3D"nore=
ferrer" target=3D"_blank">memb.name</a>)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.cgen())<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt; @@ -81,12 +81,12 @@ def gen_enum(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_name=
=3Dc_name(name))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in enum_members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 %(c_enum)s,<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0c_enum=3Dc_enum_const(name, <a href=3D"http://memb.name" rel=
=3D"noreferrer" target=3D"_blank">memb.name</a>, prefix))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.cgen())<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 } %(c_name)s;<br>
&gt; @@ -126,7 +126,7 @@ def gen_array(name: str, element_type: QAPISchemaT=
ype) -&gt; str:<br>
&gt;=C2=A0 def gen_struct_members(members: List[QAPISchemaObjectTypeMember]=
) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D &#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if memb.optional:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#=
39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool has_%(c_name)s;<br>
&gt; @@ -136,7 +136,7 @@ def gen_struct_members(members: List[QAPISchemaObj=
ectTypeMember]) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 %(c_type)s %(c_name)s;<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0c_type=3Dmemb.type.c_type(), c_name=3Dc_name(<a href=3D"http:/=
/memb.name" rel=3D"noreferrer" target=3D"_blank">memb.name</a>))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.cgen())<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; @@ -159,7 +159,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 &#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 ret +=3D gen_if(ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 ret +=3D gen_if(ifcond.cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 struct %(c_name)s {<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt; @@ -193,7 +193,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 &#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 ret +=3D gen_endif(ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 ret +=3D gen_endif(ifcond.cgen())<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt;=C2=A0 <br>
&gt; @@ -220,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) -=
&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for var in variants.variants:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://var.type.name" =
rel=3D"noreferrer" target=3D"_blank">var.type.name</a> =3D=3D &#39;q_empty&=
#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %(c_type)s %(c_name)s;<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0c_type=3Dvar.type.c_unboxed_type(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0c_name=3Dc_name(<a href=3D"http://var.name" rel=3D"noreferrer"=
 target=3D"_blank">var.name</a>))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond.cgen())<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } u;<br>
&gt; diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py<br>
&gt; index 67721b2470..56ea516399 100644<br>
&gt; --- a/scripts/qapi/visit.py<br>
&gt; +++ b/scripts/qapi/visit.py<br>
&gt; @@ -79,7 +79,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in members:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deprecated =3D &#39;deprecated&#39; =
in [<a href=3D"http://f.name" rel=3D"noreferrer" target=3D"_blank">f.name</=
a> for f in memb.features]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if memb.optional:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#=
39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (visit_optional(v, &quot;%(name)s&quot;, &amp;o=
bj-&gt;has_%(c_name)s)) {<br>
&gt; @@ -112,7 +112,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#=
39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 &#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.cgen())<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if variants:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member =3D variants.tag_member<b=
r>
&gt; @@ -126,7 +126,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for var in variants.variants:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case_str =3D c_enum_co=
nst(<a href=3D"http://tag_member.type.name" rel=3D"noreferrer" target=3D"_b=
lank">tag_member.type.name</a>, <a href=3D"http://var.name" rel=3D"noreferr=
er" target=3D"_blank">var.name</a>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member.t=
ype.prefix)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.=
ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.=
cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://v=
ar.type.name" rel=3D"noreferrer" target=3D"_blank">var.type.name</a> =3D=3D=
 &#39;q_empty&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # valid =
variant and nothing to do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D=
 mcgen(&#39;&#39;&#39;<br>
&gt; @@ -142,7 +142,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case=3Dcase_str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_type=3Dvar.type.c_name(), c_name=
=3Dc_name(<a href=3D"http://var.name" rel=3D"noreferrer" target=3D"_blank">=
var.name</a>))<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifco=
nd.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifco=
nd.cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt; @@ -228,7 +228,7 @@ def gen_visit_alternate(name: str, variants: QAPIS=
chemaVariants) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_name=
=3Dc_name(name))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 for var in variants.variants:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case %(case)s:<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt; @@ -254,7 +254,7 @@ def gen_visit_alternate(name: str, variants: QAPIS=
chemaVariants) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 &#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond.cgen())<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case QTYPE_NONE:<br>
<br>
</blockquote></div></div>

--0000000000006eb58505c8b78375--


