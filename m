Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D4382B1D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:33:44 +0200 (CEST)
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libVI-0001L4-1j
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1libHC-0004v7-NL
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:19:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1libH8-0005PG-Ey
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rkhTdDIIvzDHPRoYg9ulZ0nzSkW3ZjnZayJit5uGsQY=;
 b=cD5QBAjDm3h3ACEiTaZQ8GnBY3O23Y/SUPdYQaoZLxppTg+6VpahAzdvT9W6ZcOgxw7sIq
 poXVrEtu/yA71TNhUCbTJVvzDmkynQwXMINL++MSmz8XxpygH3f5OleU267IRh1DTWkuf4
 2ngzLMRU4qXnPYlJHZu9nXCXXVGbtkg=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-gxozejJ8MS-9ItaZi6MVtw-1; Mon, 17 May 2021 07:19:02 -0400
X-MC-Unique: gxozejJ8MS-9ItaZi6MVtw-1
Received: by mail-pj1-f71.google.com with SMTP id
 u13-20020a17090a3fcdb0290155c6507e67so4756357pjm.6
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rkhTdDIIvzDHPRoYg9ulZ0nzSkW3ZjnZayJit5uGsQY=;
 b=AmoGoAuWm992gr6pf9Seq22fPxwr+/u8lQy9S3HBuFSa1ILtVuwUDsP8n0X/Lefi62
 9pQ24wEkzmwzpCX8nSNyqqxzaK+wEcHSOwrVlN4oPg7rvTzpiH4YpsfUw5hK7FTf77/L
 mrhaMWaIaXFh/akNWiw4uuRdshmnlRs6c+Y1Kv56vmX73GnCP2EkILS8sypZkCG52u4d
 5ROxW9sc5PAqh2Wos/3QGkjT1Qsb3uHalGvW0cn9FOZYT5hCOvZeLCKE8MewfbaXZdhl
 lGt+DZxk1LGEDffF3Tx6RXtN3guTw5NP5Wq9CmzI7QrPgCT2TusuNK/W0s3F4yaASWyo
 lFuw==
X-Gm-Message-State: AOAM531ZmYZLS1no6t8Yi8h+y48QI6xSSqttpP4WUZLmRaFjgGi2XvyF
 PccqfL3Z2IH+nHu2ghn4x/vWXI8Ya93ycOgLPnyarSWhZI4RuItlI7jzOGOxl35CHF7Ydi51wiA
 AbOirzwTOWO5ERLDXyMol7/uNYGFVVPg=
X-Received: by 2002:a17:902:ee8b:b029:ef:ab33:b835 with SMTP id
 a11-20020a170902ee8bb02900efab33b835mr20240219pld.27.1621250340794; 
 Mon, 17 May 2021 04:19:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym6vUaID/vbdn3Wk98pv93ec2TcN3o8t8WjsZQWJiPhpYnd+IOU/EDYJcaxYKPNfHQXsyYKwtjUwizkD0O7k4=
X-Received: by 2002:a17:902:ee8b:b029:ef:ab33:b835 with SMTP id
 a11-20020a170902ee8bb02900efab33b835mr20240200pld.27.1621250340508; Mon, 17
 May 2021 04:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-7-marcandre.lureau@redhat.com>
 <ba1046ca-3d92-40c2-e1e5-58ba0ac9baaf@redhat.com>
In-Reply-To: <ba1046ca-3d92-40c2-e1e5-58ba0ac9baaf@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 17 May 2021 15:18:49 +0400
Message-ID: <CAMxuvax5Csa01V_WZE3QLCrhuWYh79KgZsfLTNcidXEPTe79Gg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] qapi: normalize 'if' condition to IfPredicate tree
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a36cdd05c284c2a7"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Armbruster,
 Markus" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a36cdd05c284c2a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 13, 2021 at 3:47 AM John Snow <jsnow@redhat.com> wrote:

> On 4/29/21 9:40 AM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Modify check_if() to build an IfPredicate tree (the schema
> > documentation is updated in a following patch).
> >
>
> I'm wondering if check_if() is the right place to do this. It's
> certainly convenient, but we don't build any other domain-specific types
> here at all -- that all happens in schema.py.
>

Ok, I moved the conversion to schema.py, like other _make_foo() there


>
> Before this patch, the return value from expr.py is conceivably
> something you'd get "exactly as-is" from a JSON parser. This patch would
> end that, and collapses the waveform.
>
> I think we should build a function that turns the raw (or slightly
> normalized) 'ifcond' AST into the IfPredicate object like we do for
> other structures, like Members, Features, etc.
>
>
There is now a _make_if() to convert the raw json to SchemaIfCond.

I'd also like the documentation changes to eventually be squashed
> directly into this patch if it changes syntax, but keeping it separate
> during review makes sense.
>
> Tentatively, I think the expanded "IF" syntax makes sense.
>
> 'if': 'COND'
> 'if': ['COND']
> 'if': { 'any': ['COND'] }
>

Actually, a simple list is short form for { 'all': [] }


> Seems fine. I want to play around a little bit with a JsonSchema for it
> though to make sure that it's something I can provide good IntelliSense
> tooltips for in e.g. vscode. (A bit of a pipe-dream side project, I
> admit, but if you'll humor me I'd like the chance to give it a shot.
> Some constructs are simply easier to type and validate than others.)
>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Tested-by: John Snow <jsnow@redhat.com>
>
> > ---
> >   tests/unit/test-qmp-cmds.c                    |  1 +
> >   scripts/qapi/expr.py                          | 62 ++++++++++++++----=
-
> >   scripts/qapi/schema.py                        | 13 +---
> >   tests/qapi-schema/bad-if.err                  |  3 +-
> >   tests/qapi-schema/doc-good.out                | 12 ++--
> >   tests/qapi-schema/enum-if-invalid.err         |  3 +-
> >   tests/qapi-schema/features-if-invalid.err     |  2 +-
> >   tests/qapi-schema/qapi-schema-test.json       | 20 +++---
> >   tests/qapi-schema/qapi-schema-test.out        | 59 ++++++++++--------
> >   .../qapi-schema/struct-member-if-invalid.err  |  2 +-
> >   10 files changed, 106 insertions(+), 71 deletions(-)
> >
> > diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
> > index 1b0b7d99df..83efa39720 100644
> > --- a/tests/unit/test-qmp-cmds.c
> > +++ b/tests/unit/test-qmp-cmds.c
> > @@ -51,6 +51,7 @@ FeatureStruct1 *qmp_test_features0(bool has_fs0,
> FeatureStruct0 *fs0,
> >                                      bool has_cfs1, CondFeatureStruct1
> *cfs1,
> >                                      bool has_cfs2, CondFeatureStruct2
> *cfs2,
> >                                      bool has_cfs3, CondFeatureStruct3
> *cfs3,
> > +                                   bool has_cfs4, CondFeatureStruct4
> *cfs4,
> >                                      Error **errp)
> >   {
> >       return g_new0(FeatureStruct1, 1);
> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> > index 496f7e0333..0a97a6f020 100644
> > --- a/scripts/qapi/expr.py
> > +++ b/scripts/qapi/expr.py
> > @@ -42,7 +42,14 @@
> >       cast,
> >   )
> >
> > -from .common import c_name
> > +from .common import (
> > +    IfAll,
> > +    IfAny,
> > +    IfNot,
> > +    IfOption,
> > +    IfPredicate,
> > +    c_name,
> > +)
> >   from .error import QAPISemError
> >   from .parser import QAPIDoc
> >   from .source import QAPISourceInfo
> > @@ -261,6 +268,10 @@ def check_if(expr: _JSONObject, info:
> QAPISourceInfo, source: str) -> None:
> >       """
> >       Normalize and validate the ``if`` member of an object.
> >
> > +    The ``if`` field may be either a ``str``, a ``List[str]`` or a dic=
t.
> > +    A ``str`` element or a ``List[str]`` will be normalized to
> > +    ``IfAll([str])``.
> > +
> >       The ``if`` member may be either a ``str`` or a ``List[str]``.
> >       A ``str`` value will be normalized to ``List[str]``.
> >
> > @@ -281,25 +292,44 @@ def check_if(expr: _JSONObject, info:
> QAPISourceInfo, source: str) -> None:
> >       if ifcond is None:
> >           return
> >
> > -    if isinstance(ifcond, list):
> > -        if not ifcond:
> > -            raise QAPISemError(
> > -                info, "'if' condition [] of %s is useless" % source)
> > -    else:
> > -        # Normalize to a list
> > -        ifcond =3D expr['if'] =3D [ifcond]
> > -
> > -    for elt in ifcond:
> > -        if not isinstance(elt, str):
> > +    def normalize(cond: Union[str, List[str], object]) -> IfPredicate:
> > +        if isinstance(cond, str):
> > +            if not cond.strip():
> > +                raise QAPISemError(
> > +                    info,
> > +                    "'if' condition '%s' of %s makes no sense"
> > +                    % (cond, source))
> > +            return IfOption(cond)
> > +        if isinstance(cond, list):
> > +            cond =3D {"all": cond}
> > +        if not isinstance(cond, dict):
> >               raise QAPISemError(
> >                   info,
> > -                "'if' condition of %s must be a string or a list of
> strings"
> > -                % source)
> > -        if not elt.strip():
> > +                "'if' condition of %s must be a string, "
> > +                "a list of strings or a dict" % source)
> > +        if len(cond) !=3D 1:
> >               raise QAPISemError(
> >                   info,
> > -                "'if' condition '%s' of %s makes no sense"
> > -                % (elt, source))
> > +                "'if' condition dict of %s must have one key: "
> > +                "'all', 'any' or 'not'" % source)
> > +        check_keys(cond, info, "'if' condition", [],
> > +                   ["all", "any", "not"])
> > +        oper, operands =3D next(iter(cond.items()))
> > +        if oper =3D=3D "not":
> > +            return IfNot(normalize(operands))
> > +        if not operands:
> > +            raise QAPISemError(
> > +                info, "'if' condition [] of %s is useless" % source)
> > +        if not isinstance(operands, list):
> > +            raise QAPISemError(
> > +                info, "'%s' condition of %s must be a list" % (oper,
> source))
> > +        operands =3D [normalize(o) for o in operands]
> > +        return IfAll(operands) if oper =3D=3D "all" else IfAny(operand=
s)
> > +
> > +    ifcond =3D expr.get('if')
> > +    if ifcond is None:
> > +        return
> > +    expr['if'] =3D normalize(ifcond)
> >
> >
> >   def normalize_members(members: object) -> None:
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index 366a53ab64..61664a4c5e 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -19,22 +19,15 @@
> >   import re
> >   from typing import Optional
> >
> > -from .common import (
> > -    POINTER_SUFFIX,
> > -    IfAll,
> > -    IfOption,
> > -    c_name,
> > -    mcgen,
> > -)
> > +from .common import POINTER_SUFFIX, c_name, mcgen
> >   from .error import QAPISemError, QAPISourceError
> >   from .expr import check_exprs
> >   from .parser import QAPISchemaParser
> >
> >
> >   class QAPISchemaIfCond:
> > -    def __init__(self, ifcond=3DNone):
> > -        pred_list =3D [IfOption(opt) for opt in ifcond or []]
> > -        self.pred =3D IfAll(pred_list)
> > +    def __init__(self, pred=3DNone):
> > +        self.pred =3D pred
> >
> >       def gen_doc(self):
> >           if self.pred:
> > diff --git a/tests/qapi-schema/bad-if.err b/tests/qapi-schema/bad-if.er=
r
> > index f83dee65da..454fbae387 100644
> > --- a/tests/qapi-schema/bad-if.err
> > +++ b/tests/qapi-schema/bad-if.err
> > @@ -1,2 +1,3 @@
> >   bad-if.json: In struct 'TestIfStruct':
> > -bad-if.json:2: 'if' condition of struct must be a string or a list of
> strings
> > +bad-if.json:2: 'if' condition has unknown key 'value'
> > +Valid keys are 'all', 'any', 'not'.
> > diff --git a/tests/qapi-schema/doc-good.out
> b/tests/qapi-schema/doc-good.out
> > index 6bf996f539..ca7e53f3b5 100644
> > --- a/tests/qapi-schema/doc-good.out
> > +++ b/tests/qapi-schema/doc-good.out
> > @@ -12,15 +12,15 @@ enum QType
> >   module doc-good.json
> >   enum Enum
> >       member one
> > -        if IfAll(['defined(IFONE)'])
> > +        if 'defined(IFONE)'
> >       member two
> > -    if IfAll(['defined(IFCOND)'])
> > +    if 'defined(IFCOND)'
> >       feature enum-feat
> >   object Base
> >       member base1: Enum optional=3DFalse
> >   object Variant1
> >       member var1: str optional=3DFalse
> > -        if IfAll(['defined(IFSTR)'])
> > +        if 'defined(IFSTR)'
> >           feature member-feat
> >       feature variant1-feat
> >   object Variant2
> > @@ -29,7 +29,7 @@ object Object
> >       tag base1
> >       case one: Variant1
> >       case two: Variant2
> > -        if IfAll(['IFTWO'])
> > +        if 'IFTWO'
> >       feature union-feat1
> >   object q_obj_Variant1-wrapper
> >       member data: Variant1 optional=3DFalse
> > @@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper
> >   enum SugaredUnionKind
> >       member one
> >       member two
> > -        if IfAll(['IFTWO'])
> > +        if 'IFTWO'
> >   object SugaredUnion
> >       member type: SugaredUnionKind optional=3DFalse
> >       tag type
> >       case one: q_obj_Variant1-wrapper
> >       case two: q_obj_Variant2-wrapper
> > -        if IfAll(['IFTWO'])
> > +        if 'IFTWO'
> >       feature union-feat2
> >   alternate Alternate
> >       tag type
> > diff --git a/tests/qapi-schema/enum-if-invalid.err
> b/tests/qapi-schema/enum-if-invalid.err
> > index 0556dc967b..3bb84075a9 100644
> > --- a/tests/qapi-schema/enum-if-invalid.err
> > +++ b/tests/qapi-schema/enum-if-invalid.err
> > @@ -1,2 +1,3 @@
> >   enum-if-invalid.json: In enum 'TestIfEnum':
> > -enum-if-invalid.json:2: 'if' condition of 'data' member 'bar' must be =
a
> string or a list of strings
> > +enum-if-invalid.json:2: 'if' condition has unknown key 'val'
> > +Valid keys are 'all', 'any', 'not'.
> > diff --git a/tests/qapi-schema/features-if-invalid.err
> b/tests/qapi-schema/features-if-invalid.err
> > index f63b89535e..724a810086 100644
> > --- a/tests/qapi-schema/features-if-invalid.err
> > +++ b/tests/qapi-schema/features-if-invalid.err
> > @@ -1,2 +1,2 @@
> >   features-if-invalid.json: In struct 'Stru':
> > -features-if-invalid.json:2: 'if' condition of 'features' member 'f'
> must be a string or a list of strings
> > +features-if-invalid.json:2: 'if' condition of 'features' member 'f'
> must be a string, a list of strings or a dict
> > diff --git a/tests/qapi-schema/qapi-schema-test.json
> b/tests/qapi-schema/qapi-schema-test.json
> > index 84b9d41f15..2d5e480b44 100644
> > --- a/tests/qapi-schema/qapi-schema-test.json
> > +++ b/tests/qapi-schema/qapi-schema-test.json
> > @@ -231,8 +231,8 @@
> >
> >   { 'union': 'TestIfUnion', 'data':
> >     { 'foo': 'TestStruct',
> > -    'bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} },
> > -  'if': 'defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)' }
> > +    'union-bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} =
},
> > +  'if': ['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'] }
> >
> >   { 'command': 'test-if-union-cmd',
> >     'data': { 'union-cmd-arg': 'TestIfUnion' },
> > @@ -241,11 +241,10 @@
> >   { 'alternate': 'TestIfAlternate', 'data':
> >     { 'foo': 'int',
> >       'bar': { 'type': 'TestStruct', 'if': 'defined(TEST_IF_ALT_BAR)'} =
},
> > -  'if': 'defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)' }
> > +  'if': {'all': ['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'] } =
}
> >
> > -{ 'command': 'test-if-alternate-cmd',
> > -  'data': { 'alt-cmd-arg': 'TestIfAlternate' },
> > -  'if': 'defined(TEST_IF_ALT)' }
> > +{ 'command': 'test-if-alternate-cmd', 'data': { 'alt-cmd-arg':
> 'TestIfAlternate' },
> > +  'if': {'all': ['defined(TEST_IF_ALT)', {'not':
> 'defined(TEST_IF_NOT_ALT)'}] } }
> >
> >   { 'command': 'test-if-cmd',
> >     'data': {
> > @@ -259,7 +258,7 @@
> >   { 'event': 'TEST_IF_EVENT', 'data':
> >     { 'foo': 'TestIfStruct',
> >       'bar': { 'type': ['TestIfEnum'], 'if': 'defined(TEST_IF_EVT_BAR)'
> } },
> > -  'if': 'defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)' }
> > +  'if': ['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'] }
> >
> >   # test 'features'
> >
> > @@ -290,6 +289,10 @@
> >     'data': { 'foo': 'int' },
> >     'features': [ { 'name': 'feature1', 'if': [
> 'defined(TEST_IF_COND_1)',
> >
>  'defined(TEST_IF_COND_2)'] } ] }
> > +{ 'struct': 'CondFeatureStruct4',
> > +  'data': { 'foo': 'int' },
> > +  'features': [ { 'name': 'feature1', 'if': {'any':
> ['defined(TEST_IF_COND_1)',
> > +
>  'defined(TEST_IF_COND_2)'] } } ] }
> >
> >   { 'enum': 'FeatureEnum1',
> >     'data': [ 'eins', 'zwei', 'drei' ],
> > @@ -313,7 +316,8 @@
> >               '*fs4': 'FeatureStruct4',
> >               '*cfs1': 'CondFeatureStruct1',
> >               '*cfs2': 'CondFeatureStruct2',
> > -            '*cfs3': 'CondFeatureStruct3' },
> > +            '*cfs3': 'CondFeatureStruct3',
> > +            '*cfs4': 'CondFeatureStruct4' },
> >     'returns': 'FeatureStruct1',
> >     'features': [] }
> >
> > diff --git a/tests/qapi-schema/qapi-schema-test.out
> b/tests/qapi-schema/qapi-schema-test.out
> > index c2d303aa18..f859bf648d 100644
> > --- a/tests/qapi-schema/qapi-schema-test.out
> > +++ b/tests/qapi-schema/qapi-schema-test.out
> > @@ -298,49 +298,49 @@ command __org.qemu_x-command
> q_obj___org.qemu_x-command-arg -> __org.qemu_x-Unio
> >   object TestIfStruct
> >       member foo: int optional=3DFalse
> >       member bar: int optional=3DFalse
> > -        if IfAll(['defined(TEST_IF_STRUCT_BAR)'])
> > -    if IfAll(['defined(TEST_IF_STRUCT)'])
> > +        if 'defined(TEST_IF_STRUCT_BAR)'
> > +    if 'defined(TEST_IF_STRUCT)'
> >   enum TestIfEnum
> >       member foo
> >       member bar
> > -        if IfAll(['defined(TEST_IF_ENUM_BAR)'])
> > -    if IfAll(['defined(TEST_IF_ENUM)'])
> > +        if 'defined(TEST_IF_ENUM_BAR)'
> > +    if 'defined(TEST_IF_ENUM)'
> >   object q_obj_TestStruct-wrapper
> >       member data: TestStruct optional=3DFalse
> >   enum TestIfUnionKind
> >       member foo
> > -    member bar
> > -        if IfAll(['defined(TEST_IF_UNION_BAR)'])
> > -    if IfAll(['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)'])
> > +    member union-bar
> > +        if 'defined(TEST_IF_UNION_BAR)'
> > +    if IfAll(['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'])
> >   object TestIfUnion
> >       member type: TestIfUnionKind optional=3DFalse
> >       tag type
> >       case foo: q_obj_TestStruct-wrapper
> > -    case bar: q_obj_str-wrapper
> > -        if IfAll(['defined(TEST_IF_UNION_BAR)'])
> > -    if IfAll(['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)'])
> > +    case union-bar: q_obj_str-wrapper
> > +        if 'defined(TEST_IF_UNION_BAR)'
> > +    if IfAll(['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'])
> >   object q_obj_test-if-union-cmd-arg
> >       member union-cmd-arg: TestIfUnion optional=3DFalse
> > -    if IfAll(['defined(TEST_IF_UNION)'])
> > +    if 'defined(TEST_IF_UNION)'
> >   command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> > -    if IfAll(['defined(TEST_IF_UNION)'])
> > +    if 'defined(TEST_IF_UNION)'
> >   alternate TestIfAlternate
> >       tag type
> >       case foo: int
> >       case bar: TestStruct
> > -        if IfAll(['defined(TEST_IF_ALT_BAR)'])
> > -    if IfAll(['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)'])
> > +        if 'defined(TEST_IF_ALT_BAR)'
> > +    if IfAll(['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'])
> >   object q_obj_test-if-alternate-cmd-arg
> >       member alt-cmd-arg: TestIfAlternate optional=3DFalse
> > -    if IfAll(['defined(TEST_IF_ALT)'])
> > +    if IfAll(['defined(TEST_IF_ALT)',
> IfNot('defined(TEST_IF_NOT_ALT)')])
> >   command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> > -    if IfAll(['defined(TEST_IF_ALT)'])
> > +    if IfAll(['defined(TEST_IF_ALT)',
> IfNot('defined(TEST_IF_NOT_ALT)')])
> >   object q_obj_test-if-cmd-arg
> >       member foo: TestIfStruct optional=3DFalse
> >       member bar: TestIfEnum optional=3DFalse
> > -        if IfAll(['defined(TEST_IF_CMD_BAR)'])
> > +        if 'defined(TEST_IF_CMD_BAR)'
> >       if IfAll(['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])
> >   command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> > @@ -348,15 +348,15 @@ command test-if-cmd q_obj_test-if-cmd-arg ->
> UserDefThree
> >   command test-cmd-return-def-three None -> UserDefThree
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> >   array TestIfEnumList TestIfEnum
> > -    if IfAll(['defined(TEST_IF_ENUM)'])
> > +    if 'defined(TEST_IF_ENUM)'
> >   object q_obj_TEST_IF_EVENT-arg
> >       member foo: TestIfStruct optional=3DFalse
> >       member bar: TestIfEnumList optional=3DFalse
> > -        if IfAll(['defined(TEST_IF_EVT_BAR)'])
> > -    if IfAll(['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)'])
> > +        if 'defined(TEST_IF_EVT_BAR)'
> > +    if IfAll(['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'])
> >   event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
> >       boxed=3DFalse
> > -    if IfAll(['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)'])
> > +    if IfAll(['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'])
> >   object FeatureStruct0
> >       member foo: int optional=3DFalse
> >   object FeatureStruct1
> > @@ -379,17 +379,21 @@ object FeatureStruct4
> >   object CondFeatureStruct1
> >       member foo: int optional=3DFalse
> >       feature feature1
> > -        if IfAll(['defined(TEST_IF_FEATURE_1)'])
> > +        if 'defined(TEST_IF_FEATURE_1)'
> >   object CondFeatureStruct2
> >       member foo: int optional=3DFalse
> >       feature feature1
> > -        if IfAll(['defined(TEST_IF_FEATURE_1)'])
> > +        if 'defined(TEST_IF_FEATURE_1)'
> >       feature feature2
> > -        if IfAll(['defined(TEST_IF_FEATURE_2)'])
> > +        if 'defined(TEST_IF_FEATURE_2)'
> >   object CondFeatureStruct3
> >       member foo: int optional=3DFalse
> >       feature feature1
> >           if IfAll(['defined(TEST_IF_COND_1)',
> 'defined(TEST_IF_COND_2)'])
> > +object CondFeatureStruct4
> > +    member foo: int optional=3DFalse
> > +    feature feature1
> > +        if IfAny(['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'=
])
> >   enum FeatureEnum1
> >       member eins
> >       member zwei
> > @@ -417,6 +421,7 @@ object q_obj_test-features0-arg
> >       member cfs1: CondFeatureStruct1 optional=3DTrue
> >       member cfs2: CondFeatureStruct2 optional=3DTrue
> >       member cfs3: CondFeatureStruct3 optional=3DTrue
> > +    member cfs4: CondFeatureStruct4 optional=3DTrue
> >   command test-features0 q_obj_test-features0-arg -> FeatureStruct1
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> >   command test-command-features1 None -> None
> > @@ -429,13 +434,13 @@ command test-command-features3 None -> None
> >   command test-command-cond-features1 None -> None
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> >       feature feature1
> > -        if IfAll(['defined(TEST_IF_FEATURE_1)'])
> > +        if 'defined(TEST_IF_FEATURE_1)'
> >   command test-command-cond-features2 None -> None
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> >       feature feature1
> > -        if IfAll(['defined(TEST_IF_FEATURE_1)'])
> > +        if 'defined(TEST_IF_FEATURE_1)'
> >       feature feature2
> > -        if IfAll(['defined(TEST_IF_FEATURE_2)'])
> > +        if 'defined(TEST_IF_FEATURE_2)'
> >   command test-command-cond-features3 None -> None
> >       gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse
> preconfig=3DFalse
> >       feature feature1
> > diff --git a/tests/qapi-schema/struct-member-if-invalid.err
> b/tests/qapi-schema/struct-member-if-invalid.err
> > index 42e7fdae3c..c18157c1f9 100644
> > --- a/tests/qapi-schema/struct-member-if-invalid.err
> > +++ b/tests/qapi-schema/struct-member-if-invalid.err
> > @@ -1,2 +1,2 @@
> >   struct-member-if-invalid.json: In struct 'Stru':
> > -struct-member-if-invalid.json:2: 'if' condition of 'data' member
> 'member' must be a string or a list of strings
> > +struct-member-if-invalid.json:2: 'if' condition of 'data' member
> 'member' must be a string, a list of strings or a dict
> >
>
>

--000000000000a36cdd05c284c2a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 13, 2021 at 3:47 AM Joh=
n Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 4/29/21 9:40 AM, <a href=3D"mailto:marcandre.lureau@redhat.com" ta=
rget=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Modify check_if() to build an IfPredicate tree (the schema<br>
&gt; documentation is updated in a following patch).<br>
&gt; <br>
<br>
I&#39;m wondering if check_if() is the right place to do this. It&#39;s <br=
>
certainly convenient, but we don&#39;t build any other domain-specific type=
s <br>
here at all -- that all happens in schema.py.<br></blockquote><div><br></di=
v><div>Ok, I moved the conversion to schema.py, like other _make_foo() ther=
e<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
Before this patch, the return value from expr.py is conceivably <br>
something you&#39;d get &quot;exactly as-is&quot; from a JSON parser. This =
patch would <br>
end that, and collapses the waveform.<br>
<br>
I think we should build a function that turns the raw (or slightly <br>
normalized) &#39;ifcond&#39; AST into the IfPredicate object like we do for=
 <br>
other structures, like Members, Features, etc.<br>
<br></blockquote><div><br></div><div>There is now a _make_if() to convert t=
he raw json to SchemaIfCond.<br></div><div> <br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
I&#39;d also like the documentation changes to eventually be squashed <br>
directly into this patch if it changes syntax, but keeping it separate <br>
during review makes sense.<br>
<br>
Tentatively, I think the expanded &quot;IF&quot; syntax makes sense.<br>
<br>
&#39;if&#39;: &#39;COND&#39;<br>
&#39;if&#39;: [&#39;COND&#39;]<br>
&#39;if&#39;: { &#39;any&#39;: [&#39;COND&#39;] }<br></blockquote><div><br>=
</div><div>Actually, a simple list is short form for { &#39;all&#39;: [] }<=
br></div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Seems fine. I want to play around a little bit with a JsonSchema for it <br=
>
though to make sure that it&#39;s something I can provide good IntelliSense=
 <br>
tooltips for in e.g. vscode. (A bit of a pipe-dream side project, I <br>
admit, but if you&#39;ll humor me I&#39;d like the chance to give it a shot=
. <br>
Some constructs are simply easier to type and validate than others.)<br>
<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
<br>
Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_bla=
nk">jsnow@redhat.com</a>&gt;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/unit/test-qmp-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0scripts/qapi/expr.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 62 ++++++++++++++---=
--<br>
&gt;=C2=A0 =C2=A0scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +---<br>
&gt;=C2=A0 =C2=A0tests/qapi-schema/bad-if.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt;=C2=A0 =C2=A0tests/qapi-schema/doc-good.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++--<br>
&gt;=C2=A0 =C2=A0tests/qapi-schema/enum-if-invalid.err=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 +-<br>
&gt;=C2=A0 =C2=A0tests/qapi-schema/features-if-invalid.err=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0tests/qapi-schema/qapi-schema-test.json=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 20 +++---<br>
&gt;=C2=A0 =C2=A0tests/qapi-schema/qapi-schema-test.out=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 59 ++++++++++--------<br>
&gt;=C2=A0 =C2=A0.../qapi-schema/struct-member-if-invalid.err=C2=A0 |=C2=A0=
 2 +-<br>
&gt;=C2=A0 =C2=A010 files changed, 106 insertions(+), 71 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c<b=
r>
&gt; index 1b0b7d99df..83efa39720 100644<br>
&gt; --- a/tests/unit/test-qmp-cmds.c<br>
&gt; +++ b/tests/unit/test-qmp-cmds.c<br>
&gt; @@ -51,6 +51,7 @@ FeatureStruct1 *qmp_test_features0(bool has_fs0, Fea=
tureStruct0 *fs0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool has_cfs=
1, CondFeatureStruct1 *cfs1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool has_cfs=
2, CondFeatureStruct2 *cfs2,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool has_cfs=
3, CondFeatureStruct3 *cfs3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool has_cfs4, Cond=
FeatureStruct4 *cfs4,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp=
)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return g_new0(FeatureStruct1, 1);<br>
&gt; diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py<br>
&gt; index 496f7e0333..0a97a6f020 100644<br>
&gt; --- a/scripts/qapi/expr.py<br>
&gt; +++ b/scripts/qapi/expr.py<br>
&gt; @@ -42,7 +42,14 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cast,<br>
&gt;=C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -from .common import c_name<br>
&gt; +from .common import (<br>
&gt; +=C2=A0 =C2=A0 IfAll,<br>
&gt; +=C2=A0 =C2=A0 IfAny,<br>
&gt; +=C2=A0 =C2=A0 IfNot,<br>
&gt; +=C2=A0 =C2=A0 IfOption,<br>
&gt; +=C2=A0 =C2=A0 IfPredicate,<br>
&gt; +=C2=A0 =C2=A0 c_name,<br>
&gt; +)<br>
&gt;=C2=A0 =C2=A0from .error import QAPISemError<br>
&gt;=C2=A0 =C2=A0from .parser import QAPIDoc<br>
&gt;=C2=A0 =C2=A0from .source import QAPISourceInfo<br>
&gt; @@ -261,6 +268,10 @@ def check_if(expr: _JSONObject, info: QAPISourceI=
nfo, source: str) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Normalize and validate the ``if`` member of =
an object.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 The ``if`` field may be either a ``str``, a ``List[str]=
`` or a dict.<br>
&gt; +=C2=A0 =C2=A0 A ``str`` element or a ``List[str]`` will be normalized=
 to<br>
&gt; +=C2=A0 =C2=A0 ``IfAll([str])``.<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The ``if`` member may be either a ``str`` or=
 a ``List[str]``.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0A ``str`` value will be normalized to ``List=
[str]``.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -281,25 +292,44 @@ def check_if(expr: _JSONObject, info: QAPISource=
Info, source: str) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ifcond is None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 if isinstance(ifcond, list):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info, &quot;&=
#39;if&#39; condition [] of %s is useless&quot; % source)<br>
&gt; -=C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Normalize to a list<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr[&#39;if&#39;] =3D [ifcond=
]<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 for elt in ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(elt, str):<br>
&gt; +=C2=A0 =C2=A0 def normalize(cond: Union[str, List[str], object]) -&gt=
; IfPredicate:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(cond, str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cond.strip():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISem=
Error(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 info,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;&#39;if&#39; condition &#39;%s&#39; of %s makes no sense&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 % (cond, source))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return IfOption(cond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(cond, list):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cond =3D {&quot;all&quot;: =
cond}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(cond, dict):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise QAPISemErr=
or(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
fo,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;if=
&#39; condition of %s must be a string or a list of strings&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % source)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not elt.strip():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;if=
&#39; condition of %s must be a string, &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a list =
of strings or a dict&quot; % source)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(cond) !=3D 1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise QAPISemErr=
or(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
fo,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;if=
&#39; condition &#39;%s&#39; of %s makes no sense&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % (elt, sourc=
e))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;if=
&#39; condition dict of %s must have one key: &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;al=
l&#39;, &#39;any&#39; or &#39;not&#39;&quot; % source)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_keys(cond, info, &quot;&#39;if&#39;=
 condition&quot;, [],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
[&quot;all&quot;, &quot;any&quot;, &quot;not&quot;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oper, operands =3D next(iter(cond.items()=
))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if oper =3D=3D &quot;not&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return IfNot(normalize(oper=
ands))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not operands:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info, &quot;&=
#39;if&#39; condition [] of %s is useless&quot; % source)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(operands, list):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info, &quot;&=
#39;%s&#39; condition of %s must be a list&quot; % (oper, source))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 operands =3D [normalize(o) for o in opera=
nds]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return IfAll(operands) if oper =3D=3D &qu=
ot;all&quot; else IfAny(operands)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 if ifcond is None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +=C2=A0 =C2=A0 expr[&#39;if&#39;] =3D normalize(ifcond)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0def normalize_members(members: object) -&gt; None:<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index 366a53ab64..61664a4c5e 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -19,22 +19,15 @@<br>
&gt;=C2=A0 =C2=A0import re<br>
&gt;=C2=A0 =C2=A0from typing import Optional<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -from .common import (<br>
&gt; -=C2=A0 =C2=A0 POINTER_SUFFIX,<br>
&gt; -=C2=A0 =C2=A0 IfAll,<br>
&gt; -=C2=A0 =C2=A0 IfOption,<br>
&gt; -=C2=A0 =C2=A0 c_name,<br>
&gt; -=C2=A0 =C2=A0 mcgen,<br>
&gt; -)<br>
&gt; +from .common import POINTER_SUFFIX, c_name, mcgen<br>
&gt;=C2=A0 =C2=A0from .error import QAPISemError, QAPISourceError<br>
&gt;=C2=A0 =C2=A0from .expr import check_exprs<br>
&gt;=C2=A0 =C2=A0from .parser import QAPISchemaParser<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0class QAPISchemaIfCond:<br>
&gt; -=C2=A0 =C2=A0 def __init__(self, ifcond=3DNone):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pred_list =3D [IfOption(opt) for opt in i=
fcond or []]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pred =3D IfAll(pred_list)<br>
&gt; +=C2=A0 =C2=A0 def __init__(self, pred=3DNone):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pred =3D pred<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def gen_doc(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.pred:<br>
&gt; diff --git a/tests/qapi-schema/bad-if.err b/tests/qapi-schema/bad-if.e=
rr<br>
&gt; index f83dee65da..454fbae387 100644<br>
&gt; --- a/tests/qapi-schema/bad-if.err<br>
&gt; +++ b/tests/qapi-schema/bad-if.err<br>
&gt; @@ -1,2 +1,3 @@<br>
&gt;=C2=A0 =C2=A0bad-if.json: In struct &#39;TestIfStruct&#39;:<br>
&gt; -bad-if.json:2: &#39;if&#39; condition of struct must be a string or a=
 list of strings<br>
&gt; +bad-if.json:2: &#39;if&#39; condition has unknown key &#39;value&#39;=
<br>
&gt; +Valid keys are &#39;all&#39;, &#39;any&#39;, &#39;not&#39;.<br>
&gt; diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-go=
od.out<br>
&gt; index 6bf996f539..ca7e53f3b5 100644<br>
&gt; --- a/tests/qapi-schema/doc-good.out<br>
&gt; +++ b/tests/qapi-schema/doc-good.out<br>
&gt; @@ -12,15 +12,15 @@ enum QType<br>
&gt;=C2=A0 =C2=A0module doc-good.json<br>
&gt;=C2=A0 =C2=A0enum Enum<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member one<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(IFONE)&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(IFONE)&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member two<br>
&gt; -=C2=A0 =C2=A0 if IfAll([&#39;defined(IFCOND)&#39;])<br>
&gt; +=C2=A0 =C2=A0 if &#39;defined(IFCOND)&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature enum-feat<br>
&gt;=C2=A0 =C2=A0object Base<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member base1: Enum optional=3DFalse<br>
&gt;=C2=A0 =C2=A0object Variant1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member var1: str optional=3DFalse<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(IFSTR)&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(IFSTR)&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0feature member-feat<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature variant1-feat<br>
&gt;=C2=A0 =C2=A0object Variant2<br>
&gt; @@ -29,7 +29,7 @@ object Object<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tag base1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case one: Variant1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case two: Variant2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;IFTWO&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;IFTWO&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature union-feat1<br>
&gt;=C2=A0 =C2=A0object q_obj_Variant1-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member data: Variant1 optional=3DFalse<br>
&gt; @@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper<br>
&gt;=C2=A0 =C2=A0enum SugaredUnionKind<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member one<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member two<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;IFTWO&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;IFTWO&#39;<br>
&gt;=C2=A0 =C2=A0object SugaredUnion<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member type: SugaredUnionKind optional=3DFal=
se<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tag type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case one: q_obj_Variant1-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case two: q_obj_Variant2-wrapper<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;IFTWO&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;IFTWO&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature union-feat2<br>
&gt;=C2=A0 =C2=A0alternate Alternate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tag type<br>
&gt; diff --git a/tests/qapi-schema/enum-if-invalid.err b/tests/qapi-schema=
/enum-if-invalid.err<br>
&gt; index 0556dc967b..3bb84075a9 100644<br>
&gt; --- a/tests/qapi-schema/enum-if-invalid.err<br>
&gt; +++ b/tests/qapi-schema/enum-if-invalid.err<br>
&gt; @@ -1,2 +1,3 @@<br>
&gt;=C2=A0 =C2=A0enum-if-invalid.json: In enum &#39;TestIfEnum&#39;:<br>
&gt; -enum-if-invalid.json:2: &#39;if&#39; condition of &#39;data&#39; memb=
er &#39;bar&#39; must be a string or a list of strings<br>
&gt; +enum-if-invalid.json:2: &#39;if&#39; condition has unknown key &#39;v=
al&#39;<br>
&gt; +Valid keys are &#39;all&#39;, &#39;any&#39;, &#39;not&#39;.<br>
&gt; diff --git a/tests/qapi-schema/features-if-invalid.err b/tests/qapi-sc=
hema/features-if-invalid.err<br>
&gt; index f63b89535e..724a810086 100644<br>
&gt; --- a/tests/qapi-schema/features-if-invalid.err<br>
&gt; +++ b/tests/qapi-schema/features-if-invalid.err<br>
&gt; @@ -1,2 +1,2 @@<br>
&gt;=C2=A0 =C2=A0features-if-invalid.json: In struct &#39;Stru&#39;:<br>
&gt; -features-if-invalid.json:2: &#39;if&#39; condition of &#39;features&#=
39; member &#39;f&#39; must be a string or a list of strings<br>
&gt; +features-if-invalid.json:2: &#39;if&#39; condition of &#39;features&#=
39; member &#39;f&#39; must be a string, a list of strings or a dict<br>
&gt; diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-sche=
ma/qapi-schema-test.json<br>
&gt; index 84b9d41f15..2d5e480b44 100644<br>
&gt; --- a/tests/qapi-schema/qapi-schema-test.json<br>
&gt; +++ b/tests/qapi-schema/qapi-schema-test.json<br>
&gt; @@ -231,8 +231,8 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0{ &#39;union&#39;: &#39;TestIfUnion&#39;, &#39;data&#39;:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0{ &#39;foo&#39;: &#39;TestStruct&#39;,<br>
&gt; -=C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&#39;: &#39;str&#39;, &#39;if=
&#39;: &#39;defined(TEST_IF_UNION_BAR)&#39;} },<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TEST_IF_UNION) &amp;&amp; defined(T=
EST_IF_STRUCT)&#39; }<br>
&gt; +=C2=A0 =C2=A0 &#39;union-bar&#39;: { &#39;type&#39;: &#39;str&#39;, &=
#39;if&#39;: &#39;defined(TEST_IF_UNION_BAR)&#39;} },<br>
&gt; +=C2=A0 &#39;if&#39;: [&#39;defined(TEST_IF_UNION)&#39;, &#39;defined(=
TEST_IF_STRUCT)&#39;] }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0{ &#39;command&#39;: &#39;test-if-union-cmd&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;data&#39;: { &#39;union-cmd-arg&#39;: &#39;Tes=
tIfUnion&#39; },<br>
&gt; @@ -241,11 +241,10 @@<br>
&gt;=C2=A0 =C2=A0{ &#39;alternate&#39;: &#39;TestIfAlternate&#39;, &#39;dat=
a&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0{ &#39;foo&#39;: &#39;int&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bar&#39;: { &#39;type&#39;: &#39;TestSt=
ruct&#39;, &#39;if&#39;: &#39;defined(TEST_IF_ALT_BAR)&#39;} },<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TEST_IF_ALT) &amp;&amp; defined(TES=
T_IF_STRUCT)&#39; }<br>
&gt; +=C2=A0 &#39;if&#39;: {&#39;all&#39;: [&#39;defined(TEST_IF_ALT)&#39;,=
 &#39;defined(TEST_IF_STRUCT)&#39;] } }<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -{ &#39;command&#39;: &#39;test-if-alternate-cmd&#39;,<br>
&gt; -=C2=A0 &#39;data&#39;: { &#39;alt-cmd-arg&#39;: &#39;TestIfAlternate&=
#39; },<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TEST_IF_ALT)&#39; }<br>
&gt; +{ &#39;command&#39;: &#39;test-if-alternate-cmd&#39;, &#39;data&#39;:=
 { &#39;alt-cmd-arg&#39;: &#39;TestIfAlternate&#39; },<br>
&gt; +=C2=A0 &#39;if&#39;: {&#39;all&#39;: [&#39;defined(TEST_IF_ALT)&#39;,=
 {&#39;not&#39;: &#39;defined(TEST_IF_NOT_ALT)&#39;}] } }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0{ &#39;command&#39;: &#39;test-if-cmd&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;data&#39;: {<br>
&gt; @@ -259,7 +258,7 @@<br>
&gt;=C2=A0 =C2=A0{ &#39;event&#39;: &#39;TEST_IF_EVENT&#39;, &#39;data&#39;=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0{ &#39;foo&#39;: &#39;TestIfStruct&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bar&#39;: { &#39;type&#39;: [&#39;TestI=
fEnum&#39;], &#39;if&#39;: &#39;defined(TEST_IF_EVT_BAR)&#39; } },<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TEST_IF_EVT) &amp;&amp; defined(TES=
T_IF_STRUCT)&#39; }<br>
&gt; +=C2=A0 &#39;if&#39;: [&#39;defined(TEST_IF_EVT)&#39;, &#39;defined(TE=
ST_IF_STRUCT)&#39;] }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# test &#39;features&#39;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -290,6 +289,10 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;data&#39;: { &#39;foo&#39;: &#39;int&#39; },<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;features&#39;: [ { &#39;name&#39;: &#39;featur=
e1&#39;, &#39;if&#39;: [ &#39;defined(TEST_IF_COND_1)&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;defined(TEST_IF_COND_2)&#39;] } ] }<br>
&gt; +{ &#39;struct&#39;: &#39;CondFeatureStruct4&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: { &#39;foo&#39;: &#39;int&#39; },<br>
&gt; +=C2=A0 &#39;features&#39;: [ { &#39;name&#39;: &#39;feature1&#39;, &#=
39;if&#39;: {&#39;any&#39;: [&#39;defined(TEST_IF_COND_1)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;defined(TEST_IF_COND_2)&#=
39;] } } ] }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0{ &#39;enum&#39;: &#39;FeatureEnum1&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;data&#39;: [ &#39;eins&#39;, &#39;zwei&#39;, &=
#39;drei&#39; ],<br>
&gt; @@ -313,7 +316,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*fs4&#39;: =
&#39;FeatureStruct4&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*cfs1&#39;:=
 &#39;CondFeatureStruct1&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*cfs2&#39;:=
 &#39;CondFeatureStruct2&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*cfs3&#39;: &#39;CondF=
eatureStruct3&#39; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*cfs3&#39;: &#39;CondF=
eatureStruct3&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*cfs4&#39;: &#39;CondF=
eatureStruct4&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;returns&#39;: &#39;FeatureStruct1&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;features&#39;: [] }<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schem=
a/qapi-schema-test.out<br>
&gt; index c2d303aa18..f859bf648d 100644<br>
&gt; --- a/tests/qapi-schema/qapi-schema-test.out<br>
&gt; +++ b/tests/qapi-schema/qapi-schema-test.out<br>
&gt; @@ -298,49 +298,49 @@ command __org.qemu_x-command q_obj___org.qemu_x-=
command-arg -&gt; __org.qemu_x-Unio<br>
&gt;=C2=A0 =C2=A0object TestIfStruct<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member bar: int optional=3DFalse<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_STRUCT_BAR=
)&#39;])<br>
&gt; -=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_STRUCT)&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(TEST_IF_STRUCT_BAR)&#39;<=
br>
&gt; +=C2=A0 =C2=A0 if &#39;defined(TEST_IF_STRUCT)&#39;<br>
&gt;=C2=A0 =C2=A0enum TestIfEnum<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member bar<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ENUM_BAR)&=
#39;])<br>
&gt; -=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ENUM)&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(TEST_IF_ENUM_BAR)&#39;<br=
>
&gt; +=C2=A0 =C2=A0 if &#39;defined(TEST_IF_ENUM)&#39;<br>
&gt;=C2=A0 =C2=A0object q_obj_TestStruct-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member data: TestStruct optional=3DFalse<br>
&gt;=C2=A0 =C2=A0enum TestIfUnionKind<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo<br>
&gt; -=C2=A0 =C2=A0 member bar<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION_BAR)=
&#39;])<br>
&gt; -=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION) &amp;&amp; define=
d(TEST_IF_STRUCT)&#39;])<br>
&gt; +=C2=A0 =C2=A0 member union-bar<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(TEST_IF_UNION_BAR)&#39;<b=
r>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION)&#39;, &#39;define=
d(TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0object TestIfUnion<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member type: TestIfUnionKind optional=3DFals=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tag type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case foo: q_obj_TestStruct-wrapper<br>
&gt; -=C2=A0 =C2=A0 case bar: q_obj_str-wrapper<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION_BAR)=
&#39;])<br>
&gt; -=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION) &amp;&amp; define=
d(TEST_IF_STRUCT)&#39;])<br>
&gt; +=C2=A0 =C2=A0 case union-bar: q_obj_str-wrapper<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(TEST_IF_UNION_BAR)&#39;<b=
r>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION)&#39;, &#39;define=
d(TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0object q_obj_test-if-union-cmd-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member union-cmd-arg: TestIfUnion optional=
=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION)&#39;])<br>
&gt; +=C2=A0 =C2=A0 if &#39;defined(TEST_IF_UNION)&#39;<br>
&gt;=C2=A0 =C2=A0command test-if-union-cmd q_obj_test-if-union-cmd-arg -&gt=
; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_UNION)&#39;])<br>
&gt; +=C2=A0 =C2=A0 if &#39;defined(TEST_IF_UNION)&#39;<br>
&gt;=C2=A0 =C2=A0alternate TestIfAlternate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tag type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case foo: int<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case bar: TestStruct<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ALT_BAR)&#=
39;])<br>
&gt; -=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ALT) &amp;&amp; defined(=
TEST_IF_STRUCT)&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(TEST_IF_ALT_BAR)&#39;<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ALT)&#39;, &#39;defined(=
TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0object q_obj_test-if-alternate-cmd-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member alt-cmd-arg: TestIfAlternate optional=
=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ALT)&#39;])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ALT)&#39;, IfNot(&#39;de=
fined(TEST_IF_NOT_ALT)&#39;)])<br>
&gt;=C2=A0 =C2=A0command test-if-alternate-cmd q_obj_test-if-alternate-cmd-=
arg -&gt; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ALT)&#39;])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ALT)&#39;, IfNot(&#39;de=
fined(TEST_IF_NOT_ALT)&#39;)])<br>
&gt;=C2=A0 =C2=A0object q_obj_test-if-cmd-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: TestIfStruct optional=3DFalse<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member bar: TestIfEnum optional=3DFalse<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_CMD_BAR)&#=
39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(TEST_IF_CMD_BAR)&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if IfAll([&#39;defined(TEST_IF_CMD)&#39;, &#=
39;defined(TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0command test-if-cmd q_obj_test-if-cmd-arg -&gt; UserDefThr=
ee<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt; @@ -348,15 +348,15 @@ command test-if-cmd q_obj_test-if-cmd-arg -&gt; =
UserDefThree<br>
&gt;=C2=A0 =C2=A0command test-cmd-return-def-three None -&gt; UserDefThree<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt;=C2=A0 =C2=A0array TestIfEnumList TestIfEnum<br>
&gt; -=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_ENUM)&#39;])<br>
&gt; +=C2=A0 =C2=A0 if &#39;defined(TEST_IF_ENUM)&#39;<br>
&gt;=C2=A0 =C2=A0object q_obj_TEST_IF_EVENT-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: TestIfStruct optional=3DFalse<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member bar: TestIfEnumList optional=3DFalse<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_EVT_BAR)&#=
39;])<br>
&gt; -=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_EVT) &amp;&amp; defined(=
TEST_IF_STRUCT)&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(TEST_IF_EVT_BAR)&#39;<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_EVT)&#39;, &#39;defined(=
TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0boxed=3DFalse<br>
&gt; -=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_EVT) &amp;&amp; defined(=
TEST_IF_STRUCT)&#39;])<br>
&gt; +=C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_EVT)&#39;, &#39;defined(=
TEST_IF_STRUCT)&#39;])<br>
&gt;=C2=A0 =C2=A0object FeatureStruct0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0object FeatureStruct1<br>
&gt; @@ -379,17 +379,21 @@ object FeatureStruct4<br>
&gt;=C2=A0 =C2=A0object CondFeatureStruct1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_FEATURE_1)=
&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(TEST_IF_FEATURE_1)&#39;<b=
r>
&gt;=C2=A0 =C2=A0object CondFeatureStruct2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_FEATURE_1)=
&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(TEST_IF_FEATURE_1)&#39;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_FEATURE_2)=
&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(TEST_IF_FEATURE_2)&#39;<b=
r>
&gt;=C2=A0 =C2=A0object CondFeatureStruct3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member foo: int optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if IfAll([&#39;defined(TEST_IF=
_COND_1)&#39;, &#39;defined(TEST_IF_COND_2)&#39;])<br>
&gt; +object CondFeatureStruct4<br>
&gt; +=C2=A0 =C2=A0 member foo: int optional=3DFalse<br>
&gt; +=C2=A0 =C2=A0 feature feature1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAny([&#39;defined(TEST_IF_COND_1)&#3=
9;, &#39;defined(TEST_IF_COND_2)&#39;])<br>
&gt;=C2=A0 =C2=A0enum FeatureEnum1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member eins<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member zwei<br>
&gt; @@ -417,6 +421,7 @@ object q_obj_test-features0-arg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member cfs1: CondFeatureStruct1 optional=3DT=
rue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member cfs2: CondFeatureStruct2 optional=3DT=
rue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0member cfs3: CondFeatureStruct3 optional=3DT=
rue<br>
&gt; +=C2=A0 =C2=A0 member cfs4: CondFeatureStruct4 optional=3DTrue<br>
&gt;=C2=A0 =C2=A0command test-features0 q_obj_test-features0-arg -&gt; Feat=
ureStruct1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt;=C2=A0 =C2=A0command test-command-features1 None -&gt; None<br>
&gt; @@ -429,13 +434,13 @@ command test-command-features3 None -&gt; None<b=
r>
&gt;=C2=A0 =C2=A0command test-command-cond-features1 None -&gt; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_FEATURE_1)=
&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(TEST_IF_FEATURE_1)&#39;<b=
r>
&gt;=C2=A0 =C2=A0command test-command-cond-features2 None -&gt; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_FEATURE_1)=
&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(TEST_IF_FEATURE_1)&#39;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IfAll([&#39;defined(TEST_IF_FEATURE_2)=
&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;defined(TEST_IF_FEATURE_2)&#39;<b=
r>
&gt;=C2=A0 =C2=A0command test-command-cond-features3 None -&gt; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DF=
alse oob=3DFalse preconfig=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature feature1<br>
&gt; diff --git a/tests/qapi-schema/struct-member-if-invalid.err b/tests/qa=
pi-schema/struct-member-if-invalid.err<br>
&gt; index 42e7fdae3c..c18157c1f9 100644<br>
&gt; --- a/tests/qapi-schema/struct-member-if-invalid.err<br>
&gt; +++ b/tests/qapi-schema/struct-member-if-invalid.err<br>
&gt; @@ -1,2 +1,2 @@<br>
&gt;=C2=A0 =C2=A0struct-member-if-invalid.json: In struct &#39;Stru&#39;:<b=
r>
&gt; -struct-member-if-invalid.json:2: &#39;if&#39; condition of &#39;data&=
#39; member &#39;member&#39; must be a string or a list of strings<br>
&gt; +struct-member-if-invalid.json:2: &#39;if&#39; condition of &#39;data&=
#39; member &#39;member&#39; must be a string, a list of strings or a dict<=
br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000a36cdd05c284c2a7--


