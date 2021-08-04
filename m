Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F033DFCDB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:29:23 +0200 (CEST)
Received: from localhost ([::1]:46132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCHD-0000n0-0E
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCBe-0004pN-Iy
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:23:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCBZ-0003DV-Uz
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628065413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x4gjTzKYjYFyGSqZCdvJ63hjXf7t36NZpZgqSfw40mc=;
 b=Ib7qPurt57q/NjTMcCfNoRP0+N5qBvm/ImbpQSOwVFDtabs7YZsNxLjmtchleI0AaOjjiN
 QG4lPp4wjk8V+Sjba3T+jVciC2wJCQazpF6A3av1PY/Vr2NgfzZ3gDsP3AOmbO957cKqrv
 SDLdwdKiDqkvcziz8pMN+/WTbfFNym8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-lADqO-LiOsmTMttOuBIAow-1; Wed, 04 Aug 2021 04:23:31 -0400
X-MC-Unique: lADqO-LiOsmTMttOuBIAow-1
Received: by mail-pj1-f69.google.com with SMTP id
 n4-20020a17090ac684b0290177656cfbc7so1815653pjt.7
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x4gjTzKYjYFyGSqZCdvJ63hjXf7t36NZpZgqSfw40mc=;
 b=iHvagr8kX+yvGLnloUf+EkOnd0vAY+RomAvN7IusIpl1e37yUPY4W2aXj3eU6AdSoh
 PL0wQ/a1rb/KYnI+fdyjCzAO1unepZQ8xzVP89qt09tkge6FWkKKxQ481D6tJBl+TXFF
 +RVM1fFxrC1EOoS6IUGHUdcYSfH4N5xkWIRjaWrpvpYYH4qKf30cJ/CLo3OSLqhRMzDW
 FFTOVKVM9/fTg4xMCVhEBzMyvKOoDxFYrH4ebPN4BABSJrnmowaV2Aa0ABx9xmnUzObP
 E4D9PB945aWDxxwVdWuh6NBwBciwQeMZ0qhzSG9mcCoPoiamAjeVBpoB1UufMBv0ByiG
 w5Ag==
X-Gm-Message-State: AOAM530Cfe25hpIBfC4WIKye4DcCe3lMZeK+9up68+9fFdQ2Ei2Kj1Ds
 UjzNmq0RuUCk1GcWaYDjuxYAWGBZjRRR6v9Uf4idesR1YvwXPUqNs1Z932vJieCylsRfgBXE0Db
 wf11tRIXrrhq1d27ogPxNck7ftpVdQVQ=
X-Received: by 2002:a63:1155:: with SMTP id 21mr700380pgr.346.1628065410222;
 Wed, 04 Aug 2021 01:23:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlqDt5Pn9g/mJdfYLHsHC9Hf/0wDUeiUe2D0boJ5bqw36r3CukFTlF6HJw/3JTXKGJ3Ew3bvMPi+tY+EG6uWU=
X-Received: by 2002:a63:1155:: with SMTP id 21mr700363pgr.346.1628065410026;
 Wed, 04 Aug 2021 01:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-8-marcandre.lureau@redhat.com>
 <87lf5ismpj.fsf@dusky.pond.sub.org>
In-Reply-To: <87lf5ismpj.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 4 Aug 2021 12:23:18 +0400
Message-ID: <CAMxuvawWbZmdXMQ3Muci6hOh2iuu4b5t=G9V_1-Mn=0jhTLZUA@mail.gmail.com>
Subject: Re: [PATCH v6 07/11] qapi: replace if condition list with dict
 {'all': [...]}
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006f91ab05c8b78435"
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

--0000000000006f91ab05c8b78435
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 3, 2021 at 5:05 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Replace the simple list sugar form with a recursive structure that will
> > accept other operators in the following commits (all, any or not).
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  scripts/qapi/common.py                        | 23 +++++--
> >  scripts/qapi/expr.py                          | 52 ++++++++++------
> >  scripts/qapi/schema.py                        |  2 +-
> >  tests/qapi-schema/bad-if-empty-list.json      |  2 +-
> >  tests/qapi-schema/bad-if-list.json            |  2 +-
> >  tests/qapi-schema/bad-if.err                  |  3 +-
> >  tests/qapi-schema/doc-good.json               |  3 +-
> >  tests/qapi-schema/doc-good.out                | 13 ++--
> >  tests/qapi-schema/doc-good.txt                |  6 ++
> >  tests/qapi-schema/enum-if-invalid.err         |  3 +-
> >  tests/qapi-schema/features-if-invalid.err     |  2 +-
> >  tests/qapi-schema/qapi-schema-test.json       | 25 ++++----
> >  tests/qapi-schema/qapi-schema-test.out        | 62 +++++++++----------
> >  .../qapi-schema/struct-member-if-invalid.err  |  2 +-
> >  .../qapi-schema/union-branch-if-invalid.json  |  2 +-
> >  15 files changed, 119 insertions(+), 83 deletions(-)
> >
> > diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> > index 5181a0f167..51463510c9 100644
> > --- a/scripts/qapi/common.py
> > +++ b/scripts/qapi/common.py
> > @@ -13,7 +13,8 @@
> >
> >  import re
> >  from typing import (
> > -    List,
> > +    Any,
> > +    Dict,
> >      Match,
> >      Optional,
> >      Union,
> > @@ -199,16 +200,28 @@ def guardend(name: str) -> str:
> >                   name=3Dc_fname(name).upper())
> >
> >
> > -def cgen_ifcond(ifcond: Union[str, List[str]]) -> str:
> > +def docgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
>
> Uh, why do you swap cgen_ifcond() and docgen_ifcond()?  Accident?
>

Yes, fixed


> >      if not ifcond:
> >          return ''
> > -    return '(' + ') && ('.join(ifcond) + ')'
> > +    if isinstance(ifcond, str):
> > +        return ifcond
> >
> > +    oper, operands =3D next(iter(ifcond.items()))
> > +    oper =3D {'all': ' and '}[oper]
> > +    operands =3D [docgen_ifcond(o) for o in operands]
> > +    return '(' + oper.join(operands) + ')'
>
> What a nice review speedbump you buried here...
>
> The whole block boils down to the much less exciting
>
>        operands =3D [docgen_ifcond(o) for o in ifcond['all']]
>        return '(' + ' and '.join(operands) + ')'
>
> Peeking ahead, I understand that you did it this way here so you can
> extend it trivially there.  Matter of taste; what counts is the final
> result and minimizing reviewer WTFs/minute along the way.
>
> Since the WTFs/minute is a done deed now, what remains is the final
> result, which I expect to review shortly.  But please try a bit harder
> to be boring next time ;)
>

Ah sorry, I didn't realize while splitting the patches


> >
> > -def docgen_ifcond(ifcond: Union[str, List[str]]) -> str:
> > +
> > +def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
> >      if not ifcond:
> >          return ''
> > -    return ' and '.join(ifcond)
> > +    if isinstance(ifcond, str):
> > +        return ifcond
>
> This is what gets rid of the redundant parenthesises in the common case
> "single condition string".
>
> > +
> > +    oper, operands =3D next(iter(ifcond.items()))
> > +    oper =3D {'all': '&&'}[oper]
> > +    operands =3D [cgen_ifcond(o) for o in operands]
> > +    return '(' + (') ' + oper + ' (').join(operands) + ')'
>
> This line is hard to read.  Easier, I think:
>
>        oper =3D {'all': ' && '}[oper]
>        operands =3D ['(' + cgen_ifcond(o) + ')' for o in operands]
>        return oper.join(operands)
>
> Neither your version nor mine gets rid of the redundant parenthesises in
> the (uncommon) case "complex condition expression".
> tests/test-qapi-introspect.c still has
>
>     #if (defined(TEST_IF_COND_1)) && (defined(TEST_IF_COND_2))
>                 QLIT_QSTR("feature1"),
>     #endif /* (defined(TEST_IF_COND_1)) && (defined(TEST_IF_COND_2)) */
>
> Mildly annoying.  I'm willing to leave this for later.
>

I see


> Code smell: cgen_ifcond() and docgen_ifcond() are almost identical.  Can
> also be left for later.
>

ok


> >
> >
> >  def gen_if(cond: str) -> str:
> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> > index 496f7e0333..3ee66c5f62 100644
> > --- a/scripts/qapi/expr.py
> > +++ b/scripts/qapi/expr.py
> > @@ -259,14 +259,12 @@ def check_flags(expr: _JSONObject, info:
> QAPISourceInfo) -> None:
> >
> >  def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) ->
> None:
> >      """
> > -    Normalize and validate the ``if`` member of an object.
> > +    Validate the ``if`` member of an object.
> >
> > -    The ``if`` member may be either a ``str`` or a ``List[str]``.
> > -    A ``str`` value will be normalized to ``List[str]``.
> > +    The ``if`` member may be either a ``str`` or a dict.
> >
> >      :forms:
> > -      :sugared: ``Union[str, List[str]]``
> > -      :canonical: ``List[str]``
> > +      :canonical: ``Union[str, dict]``
>
> Does this :forms: thing make sense without any :sugared:?  John, you
> added (invented?) it in commit a48653638fa, but no explanation made it
> into the tree.
>
> >
> >      :param expr: The expression containing the ``if`` member to
> validate.
> >      :param info: QAPI schema source file information.
> > @@ -275,31 +273,45 @@ def check_if(expr: _JSONObject, info:
> QAPISourceInfo, source: str) -> None:
> >      :raise QAPISemError:
> >          When the "if" member fails validation, or when there are no
> >          non-empty conditions.
> > -    :return: None, ``expr`` is normalized in-place as needed.
> > +    :return: None
> >      """
>
> Looks like there's a bit more going on than the commit message made me
> expect.
>
> >      ifcond =3D expr.get('if')
> >      if ifcond is None:
> >          return
> >
> > -    if isinstance(ifcond, list):
> > -        if not ifcond:
> > -            raise QAPISemError(
> > -                info, "'if' condition [] of %s is useless" % source)
> > -    else:
> > -        # Normalize to a list
> > -        ifcond =3D expr['if'] =3D [ifcond]
> > +    def _check_if(cond: Union[str, object]) -> None:
> > +        if isinstance(cond, str):
> > +            if not cond.strip():
> > +                raise QAPISemError(
> > +                    info,
> > +                    "'if' condition '%s' of %s makes no sense"
> > +                    % (cond, source))
> > +            return
> >
> > -    for elt in ifcond:
> > -        if not isinstance(elt, str):
> > +        if not isinstance(cond, dict):
> >              raise QAPISemError(
> >                  info,
> > -                "'if' condition of %s must be a string or a list of
> strings"
> > -                % source)
> > -        if not elt.strip():
> > +                "'if' condition of %s must be a string or a dict" %
> source)
> > +        if len(cond) !=3D 1:
> >              raise QAPISemError(
> >                  info,
> > -                "'if' condition '%s' of %s makes no sense"
> > -                % (elt, source))
> > +                "'if' condition dict of %s must have one key: "
> > +                "'all'" % source)
> > +        check_keys(cond, info, "'if' condition", [],
> > +                   ["all"])
> > +
> > +        oper, operands =3D next(iter(cond.items()))
> > +        if not operands:
> > +            raise QAPISemError(
> > +                info, "'if' condition [] of %s is useless" % source)
> > +
> > +        if oper in ("all") and not isinstance(operands, list):
> > +            raise QAPISemError(
> > +                info, "'%s' condition of %s must be a list" % (oper,
> source))
> > +        for operand in operands:
> > +            _check_if(operand)
> > +
> > +    _check_if(ifcond)
>
> Putting the function's helper in the middle of the function reminds me
> of Mark Twain's "The Awful German Language":
>
>     "The trunks being now ready, he DE- after kissing his mother and
>     sisters, and once more pressing to his bosom his adored Gretchen,
>     who, dressed in simple white muslin, with a single tuberose in the
>     ample folds of her rich brown hair, had tottered feebly down the
>     stairs, still pale from the terror and excitement of the past
>     evening, but longing to lay her poor aching head yet once again upon
>     the breast of him whom she loved more dearly than life itself,
>     PARTED."
>
> I find it hard to read.
>
>
Matter of taste, I guess. I'll let you fix it up to your preference as
follow up if you don't mind.


> >
> >
> >  def normalize_members(members: object) -> None:
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index 30d6a01ad1..d2fbdbe583 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -32,7 +32,7 @@
> >
> >  class QAPISchemaIfCond:
> >      def __init__(self, ifcond=3DNone):
> > -        self.ifcond =3D ifcond or []
> > +        self.ifcond =3D ifcond or {}
> >
> >      def cgen(self):
> >          return cgen_ifcond(self.ifcond)
> > diff --git a/tests/qapi-schema/bad-if-empty-list.json
> b/tests/qapi-schema/bad-if-empty-list.json
> > index 94f2eb8670..b62b5671df 100644
> > --- a/tests/qapi-schema/bad-if-empty-list.json
> > +++ b/tests/qapi-schema/bad-if-empty-list.json
> > @@ -1,3 +1,3 @@
> >  # check empty 'if' list
> >  { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
> > -  'if': [] }
> > +  'if': { 'all': [] } }
> > diff --git a/tests/qapi-schema/bad-if-list.json
> b/tests/qapi-schema/bad-if-list.json
> > index ea3d95bb6b..1fefef16a7 100644
> > --- a/tests/qapi-schema/bad-if-list.json
> > +++ b/tests/qapi-schema/bad-if-list.json
> > @@ -1,3 +1,3 @@
> >  # check invalid 'if' content
> >  { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
> > -  'if': ['foo', ' '] }
> > +  'if': { 'all': ['foo', ' '] } }
> > diff --git a/tests/qapi-schema/bad-if.err b/tests/qapi-schema/bad-if.er=
r
> > index f83dee65da..8278c49368 100644
> > --- a/tests/qapi-schema/bad-if.err
> > +++ b/tests/qapi-schema/bad-if.err
> > @@ -1,2 +1,3 @@
> >  bad-if.json: In struct 'TestIfStruct':
> > -bad-if.json:2: 'if' condition of struct must be a string or a list of
> strings
> > +bad-if.json:2: 'if' condition has unknown key 'value'
> > +Valid keys are 'all'.
>
> "keys are" is awkward when there's just one.  Okay since there soon will
> be more.
>
>
right

Test case bad-if.json is meant to cover "value of key 'if' has an
> invalid JSON type".  Before the patch, str and list are valid, and the
> test uses (invalid) dict.  Afterwards, str and dict are, and the test
> still uses (now valid) dict.  In other words, it now tests something
> else entirely.
>
> I think this test should be updated to something like
>
>     'if': [ 'defined(TEST_IF_STRUCT)' ]
>
> and a new test added to cover invalid dict key.
>

ok, and I added some tests to cover new error paths.


> > diff --git a/tests/qapi-schema/doc-good.json
> b/tests/qapi-schema/doc-good.json
> > index 423ea23e07..25b1053e8a 100644
> > --- a/tests/qapi-schema/doc-good.json
> > +++ b/tests/qapi-schema/doc-good.json
> > @@ -70,7 +70,8 @@
> >  # @base1:
> >  # the first member
> >  ##
> > -{ 'struct': 'Base', 'data': { 'base1': 'Enum' } }
> > +{ 'struct': 'Base', 'data': { 'base1': 'Enum' },
> > +  'if': { 'all': ['IFALL1', 'IFALL2'] } }
>
> We lack cover for this before your patch.  Thanks for fixing it.
>
> >
> >  ##
> >  # @Variant1:
> > diff --git a/tests/qapi-schema/doc-good.out
> b/tests/qapi-schema/doc-good.out
> > index 8f54ceff2e..689d084f3a 100644
> > --- a/tests/qapi-schema/doc-good.out
> > +++ b/tests/qapi-schema/doc-good.out
> > @@ -12,15 +12,16 @@ enum QType
> >  module doc-good.json
> >  enum Enum
> >      member one
> > -        if ['defined(IFONE)']
> > +        if defined(IFONE)
> >      member two
> > -    if ['defined(IFCOND)']
> > +    if defined(IFCOND)
> >      feature enum-feat
> >  object Base
> >      member base1: Enum optional=3DFalse
> > +    if OrderedDict([('all', ['IFALL1', 'IFALL2'])])
> >  object Variant1
> >      member var1: str optional=3DFalse
> > -        if ['defined(IFSTR)']
> > +        if defined(IFSTR)
> >          feature member-feat
> >      feature variant1-feat
> >  object Variant2
> > @@ -29,7 +30,7 @@ object Object
> >      tag base1
> >      case one: Variant1
> >      case two: Variant2
> > -        if ['IFTWO']
> > +        if IFTWO
> >      feature union-feat1
> >  object q_obj_Variant1-wrapper
> >      member data: Variant1 optional=3DFalse
> > @@ -38,13 +39,13 @@ object q_obj_Variant2-wrapper
> >  enum SugaredUnionKind
> >      member one
> >      member two
> > -        if ['IFTWO']
> > +        if IFTWO
> >  object SugaredUnion
> >      member type: SugaredUnionKind optional=3DFalse
> >      tag type
> >      case one: q_obj_Variant1-wrapper
> >      case two: q_obj_Variant2-wrapper
> > -        if ['IFTWO']
> > +        if IFTWO
> >      feature union-feat2
> >  alternate Alternate
> >      tag type
> > diff --git a/tests/qapi-schema/doc-good.txt
> b/tests/qapi-schema/doc-good.txt
> > index 726727af74..4490108cb7 100644
> > --- a/tests/qapi-schema/doc-good.txt
> > +++ b/tests/qapi-schema/doc-good.txt
> > @@ -76,6 +76,12 @@ Members
> >     the first member
> >
> >
> > +If
> > +~~
> > +
> > +"(IFALL1 and IFALL2)"
> > +
> > +
>
> The documentation generated for conditionals is poor before and after
> your work.  Observation, not demand.
>
> >  "Variant1" (Object)
> >  -------------------
> >
>
> [...]
>
>

--0000000000006f91ab05c8b78435
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 5:05 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">ar=
mbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_bl=
ank">marcandre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Replace the simple list sugar form with a recursive structure that wil=
l<br>
&gt; accept other operators in the following commits (all, any or not).<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/common.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +++++--<br>
&gt;=C2=A0 scripts/qapi/expr.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 52 ++++++++++------<br>
&gt;=C2=A0 scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-empty-list.json=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if-list.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/bad-if.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt;=C2=A0 tests/qapi-schema/doc-good.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +-<br>
&gt;=C2=A0 tests/qapi-schema/doc-good.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 13 ++--<br>
&gt;=C2=A0 tests/qapi-schema/doc-good.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++<br>
&gt;=C2=A0 tests/qapi-schema/enum-if-invalid.err=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 3 +-<br>
&gt;=C2=A0 tests/qapi-schema/features-if-invalid.err=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.json=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 25 ++++----<br>
&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.out=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 62 +++++++++----------<br>
&gt;=C2=A0 .../qapi-schema/struct-member-if-invalid.err=C2=A0 |=C2=A0 2 +-<=
br>
&gt;=C2=A0 .../qapi-schema/union-branch-if-invalid.json=C2=A0 |=C2=A0 2 +-<=
br>
&gt;=C2=A0 15 files changed, 119 insertions(+), 83 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py<br>
&gt; index 5181a0f167..51463510c9 100644<br>
&gt; --- a/scripts/qapi/common.py<br>
&gt; +++ b/scripts/qapi/common.py<br>
&gt; @@ -13,7 +13,8 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 import re<br>
&gt;=C2=A0 from typing import (<br>
&gt; -=C2=A0 =C2=A0 List,<br>
&gt; +=C2=A0 =C2=A0 Any,<br>
&gt; +=C2=A0 =C2=A0 Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Match,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Union,<br>
&gt; @@ -199,16 +200,28 @@ def guardend(name: str) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0na=
me=3Dc_fname(name).upper())<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -def cgen_ifcond(ifcond: Union[str, List[str]]) -&gt; str:<br>
&gt; +def docgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -&gt; str:<br>
<br>
Uh, why do you swap cgen_ifcond() and docgen_ifcond()?=C2=A0 Accident?<br><=
/blockquote><div><br></div><div>Yes, fixed</div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if not ifcond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 return &#39;(&#39; + &#39;) &amp;&amp; (&#39;.join(ifco=
nd) + &#39;)&#39;<br>
&gt; +=C2=A0 =C2=A0 if isinstance(ifcond, str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ifcond<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 oper, operands =3D next(iter(ifcond.items()))<br>
&gt; +=C2=A0 =C2=A0 oper =3D {&#39;all&#39;: &#39; and &#39;}[oper]<br>
&gt; +=C2=A0 =C2=A0 operands =3D [docgen_ifcond(o) for o in operands]<br>
&gt; +=C2=A0 =C2=A0 return &#39;(&#39; + oper.join(operands) + &#39;)&#39;<=
br>
<br>
What a nice review speedbump you buried here...<br>
<br>
The whole block boils down to the much less exciting<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0operands =3D [docgen_ifcond(o) for o in ifcond[&=
#39;all&#39;]]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;(&#39; + &#39; and &#39;.join(operan=
ds) + &#39;)&#39;<br>
<br>
Peeking ahead, I understand that you did it this way here so you can<br>
extend it trivially there.=C2=A0 Matter of taste; what counts is the final<=
br>
result and minimizing reviewer WTFs/minute along the way.<br>
<br>
Since the WTFs/minute is a done deed now, what remains is the final<br>
result, which I expect to review shortly.=C2=A0 But please try a bit harder=
<br>
to be boring next time ;)<br></blockquote><div><br></div><div>Ah sorry, I d=
idn&#39;t realize while splitting the patches</div><div> <br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 <br>
&gt; -def docgen_ifcond(ifcond: Union[str, List[str]]) -&gt; str:<br>
&gt; +<br>
&gt; +def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if not ifcond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 return &#39; and &#39;.join(ifcond)<br>
&gt; +=C2=A0 =C2=A0 if isinstance(ifcond, str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ifcond<br>
<br>
This is what gets rid of the redundant parenthesises in the common case<br>
&quot;single condition string&quot;.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 oper, operands =3D next(iter(ifcond.items()))<br>
&gt; +=C2=A0 =C2=A0 oper =3D {&#39;all&#39;: &#39;&amp;&amp;&#39;}[oper]<br=
>
&gt; +=C2=A0 =C2=A0 operands =3D [cgen_ifcond(o) for o in operands]<br>
&gt; +=C2=A0 =C2=A0 return &#39;(&#39; + (&#39;) &#39; + oper + &#39; (&#39=
;).join(operands) + &#39;)&#39;<br>
<br>
This line is hard to read.=C2=A0 Easier, I think:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0oper =3D {&#39;all&#39;: &#39; &amp;&amp; &#39;}=
[oper]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0operands =3D [&#39;(&#39; + cgen_ifcond(o) + &#3=
9;)&#39; for o in operands]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0return oper.join(operands)<br>
<br>
Neither your version nor mine gets rid of the redundant parenthesises in<br=
>
the (uncommon) case &quot;complex condition expression&quot;.<br>
tests/test-qapi-introspect.c still has<br>
<br>
=C2=A0 =C2=A0 #if (defined(TEST_IF_COND_1)) &amp;&amp; (defined(TEST_IF_CON=
D_2))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QLIT_QSTR(&quot;fea=
ture1&quot;),<br>
=C2=A0 =C2=A0 #endif /* (defined(TEST_IF_COND_1)) &amp;&amp; (defined(TEST_=
IF_COND_2)) */<br>
<br>
Mildly annoying.=C2=A0 I&#39;m willing to leave this for later.<br></blockq=
uote><div><br></div><div>I see</div><div> <br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Code smell: cgen_ifcond() and docgen_ifcond() are almost identical.=C2=A0 C=
an<br>
also be left for later.<br></blockquote><div><br></div><div>ok</div><div> <=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def gen_if(cond: str) -&gt; str:<br>
&gt; diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py<br>
&gt; index 496f7e0333..3ee66c5f62 100644<br>
&gt; --- a/scripts/qapi/expr.py<br>
&gt; +++ b/scripts/qapi/expr.py<br>
&gt; @@ -259,14 +259,12 @@ def check_flags(expr: _JSONObject, info: QAPISou=
rceInfo) -&gt; None:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def check_if(expr: _JSONObject, info: QAPISourceInfo, source: st=
r) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 Normalize and validate the ``if`` member of an object.<=
br>
&gt; +=C2=A0 =C2=A0 Validate the ``if`` member of an object.<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 The ``if`` member may be either a ``str`` or a ``List[s=
tr]``.<br>
&gt; -=C2=A0 =C2=A0 A ``str`` value will be normalized to ``List[str]``.<br=
>
&gt; +=C2=A0 =C2=A0 The ``if`` member may be either a ``str`` or a dict.<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 :forms:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 :sugared: ``Union[str, List[str]]``<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 :canonical: ``List[str]``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 :canonical: ``Union[str, dict]``<br>
<br>
Does this :forms: thing make sense without any :sugared:?=C2=A0 John, you<b=
r>
added (invented?) it in commit a48653638fa, but no explanation made it<br>
into the tree.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 :param expr: The expression containing the ``if`` =
member to validate.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 :param info: QAPI schema source file information.<=
br>
&gt; @@ -275,31 +273,45 @@ def check_if(expr: _JSONObject, info: QAPISource=
Info, source: str) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 :raise QAPISemError:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 When the &quot;if&quot; member fails=
 validation, or when there are no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 non-empty conditions.<br>
&gt; -=C2=A0 =C2=A0 :return: None, ``expr`` is normalized in-place as neede=
d.<br>
&gt; +=C2=A0 =C2=A0 :return: None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
<br>
Looks like there&#39;s a bit more going on than the commit message made me<=
br>
expect.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ifcond is None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if isinstance(ifcond, list):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info, &quot;&=
#39;if&#39; condition [] of %s is useless&quot; % source)<br>
&gt; -=C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Normalize to a list<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr[&#39;if&#39;] =3D [ifcond=
]<br>
&gt; +=C2=A0 =C2=A0 def _check_if(cond: Union[str, object]) -&gt; None:<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 for elt in ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(elt, str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(cond, dict):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;if=
&#39; condition of %s must be a string or a list of strings&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % source)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not elt.strip():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;if=
&#39; condition of %s must be a string or a dict&quot; % source)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(cond) !=3D 1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;if=
&#39; condition &#39;%s&#39; of %s makes no sense&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % (elt, sourc=
e))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;if=
&#39; condition dict of %s must have one key: &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;al=
l&#39;&quot; % source)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_keys(cond, info, &quot;&#39;if&#39;=
 condition&quot;, [],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
[&quot;all&quot;])<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oper, operands =3D next(iter(cond.items()=
))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not operands:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info, &quot;&=
#39;if&#39; condition [] of %s is useless&quot; % source)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if oper in (&quot;all&quot;) and not isin=
stance(operands, list):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info, &quot;&=
#39;%s&#39; condition of %s must be a list&quot; % (oper, source))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for operand in operands:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _check_if(operand)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 _check_if(ifcond)<br>
<br>
Putting the function&#39;s helper in the middle of the function reminds me<=
br>
of Mark Twain&#39;s &quot;The Awful German Language&quot;:<br>
<br>
=C2=A0 =C2=A0 &quot;The trunks being now ready, he DE- after kissing his mo=
ther and<br>
=C2=A0 =C2=A0 sisters, and once more pressing to his bosom his adored Gretc=
hen,<br>
=C2=A0 =C2=A0 who, dressed in simple white muslin, with a single tuberose i=
n the<br>
=C2=A0 =C2=A0 ample folds of her rich brown hair, had tottered feebly down =
the<br>
=C2=A0 =C2=A0 stairs, still pale from the terror and excitement of the past=
<br>
=C2=A0 =C2=A0 evening, but longing to lay her poor aching head yet once aga=
in upon<br>
=C2=A0 =C2=A0 the breast of him whom she loved more dearly than life itself=
,<br>
=C2=A0 =C2=A0 PARTED.&quot;<br>
<br>
I find it hard to read.<br>
<br></blockquote><div><br></div><div>Matter of taste, I guess. I&#39;ll let=
 you fix it up to your preference as follow up if you don&#39;t mind.<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def normalize_members(members: object) -&gt; None:<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index 30d6a01ad1..d2fbdbe583 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -32,7 +32,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 class QAPISchemaIfCond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __init__(self, ifcond=3DNone):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or {}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def cgen(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cgen_ifcond(self.ifcond)<br>
&gt; diff --git a/tests/qapi-schema/bad-if-empty-list.json b/tests/qapi-sch=
ema/bad-if-empty-list.json<br>
&gt; index 94f2eb8670..b62b5671df 100644<br>
&gt; --- a/tests/qapi-schema/bad-if-empty-list.json<br>
&gt; +++ b/tests/qapi-schema/bad-if-empty-list.json<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt;=C2=A0 # check empty &#39;if&#39; list<br>
&gt;=C2=A0 { &#39;struct&#39;: &#39;TestIfStruct&#39;, &#39;data&#39;: { &#=
39;foo&#39;: &#39;int&#39; },<br>
&gt; -=C2=A0 &#39;if&#39;: [] }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;all&#39;: [] } }<br>
&gt; diff --git a/tests/qapi-schema/bad-if-list.json b/tests/qapi-schema/ba=
d-if-list.json<br>
&gt; index ea3d95bb6b..1fefef16a7 100644<br>
&gt; --- a/tests/qapi-schema/bad-if-list.json<br>
&gt; +++ b/tests/qapi-schema/bad-if-list.json<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt;=C2=A0 # check invalid &#39;if&#39; content<br>
&gt;=C2=A0 { &#39;struct&#39;: &#39;TestIfStruct&#39;, &#39;data&#39;: { &#=
39;foo&#39;: &#39;int&#39; },<br>
&gt; -=C2=A0 &#39;if&#39;: [&#39;foo&#39;, &#39; &#39;] }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;all&#39;: [&#39;foo&#39;, &#39; &#39;] } =
}<br>
&gt; diff --git a/tests/qapi-schema/bad-if.err b/tests/qapi-schema/bad-if.e=
rr<br>
&gt; index f83dee65da..8278c49368 100644<br>
&gt; --- a/tests/qapi-schema/bad-if.err<br>
&gt; +++ b/tests/qapi-schema/bad-if.err<br>
&gt; @@ -1,2 +1,3 @@<br>
&gt;=C2=A0 bad-if.json: In struct &#39;TestIfStruct&#39;:<br>
&gt; -bad-if.json:2: &#39;if&#39; condition of struct must be a string or a=
 list of strings<br>
&gt; +bad-if.json:2: &#39;if&#39; condition has unknown key &#39;value&#39;=
<br>
&gt; +Valid keys are &#39;all&#39;.<br>
<br>
&quot;keys are&quot; is awkward when there&#39;s just one.=C2=A0 Okay since=
 there soon will<br>
be more.<br>
<br></blockquote><div><br></div><div>right</div><div> <br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
Test case bad-if.json is meant to cover &quot;value of key &#39;if&#39; has=
 an<br>
invalid JSON type&quot;.=C2=A0 Before the patch, str and list are valid, an=
d the<br>
test uses (invalid) dict.=C2=A0 Afterwards, str and dict are, and the test<=
br>
still uses (now valid) dict.=C2=A0 In other words, it now tests something<b=
r>
else entirely.<br>
<br>
I think this test should be updated to something like<br>
<br>
=C2=A0 =C2=A0 &#39;if&#39;: [ &#39;defined(TEST_IF_STRUCT)&#39; ]<br>
<br>
and a new test added to cover invalid dict key.<br></blockquote><div><br></=
div><div>ok, and I added some tests to cover new error paths.</div><div> <b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-g=
ood.json<br>
&gt; index 423ea23e07..25b1053e8a 100644<br>
&gt; --- a/tests/qapi-schema/doc-good.json<br>
&gt; +++ b/tests/qapi-schema/doc-good.json<br>
&gt; @@ -70,7 +70,8 @@<br>
&gt;=C2=A0 # @base1:<br>
&gt;=C2=A0 # the first member<br>
&gt;=C2=A0 ##<br>
&gt; -{ &#39;struct&#39;: &#39;Base&#39;, &#39;data&#39;: { &#39;base1&#39;=
: &#39;Enum&#39; } }<br>
&gt; +{ &#39;struct&#39;: &#39;Base&#39;, &#39;data&#39;: { &#39;base1&#39;=
: &#39;Enum&#39; },<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;all&#39;: [&#39;IFALL1&#39;, &#39;IFALL2&=
#39;] } }<br>
<br>
We lack cover for this before your patch.=C2=A0 Thanks for fixing it.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @Variant1:<br>
&gt; diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-go=
od.out<br>
&gt; index 8f54ceff2e..689d084f3a 100644<br>
&gt; --- a/tests/qapi-schema/doc-good.out<br>
&gt; +++ b/tests/qapi-schema/doc-good.out<br>
&gt; @@ -12,15 +12,16 @@ enum QType<br>
&gt;=C2=A0 module doc-good.json<br>
&gt;=C2=A0 enum Enum<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member one<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(IFONE)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if defined(IFONE)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member two<br>
&gt; -=C2=A0 =C2=A0 if [&#39;defined(IFCOND)&#39;]<br>
&gt; +=C2=A0 =C2=A0 if defined(IFCOND)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature enum-feat<br>
&gt;=C2=A0 object Base<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member base1: Enum optional=3DFalse<br>
&gt; +=C2=A0 =C2=A0 if OrderedDict([(&#39;all&#39;, [&#39;IFALL1&#39;, &#39=
;IFALL2&#39;])])<br>
&gt;=C2=A0 object Variant1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member var1: str optional=3DFalse<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;defined(IFSTR)&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if defined(IFSTR)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feature member-feat<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature variant1-feat<br>
&gt;=C2=A0 object Variant2<br>
&gt; @@ -29,7 +30,7 @@ object Object<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tag base1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case one: Variant1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case two: Variant2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;IFTWO&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IFTWO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature union-feat1<br>
&gt;=C2=A0 object q_obj_Variant1-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member data: Variant1 optional=3DFalse<br>
&gt; @@ -38,13 +39,13 @@ object q_obj_Variant2-wrapper<br>
&gt;=C2=A0 enum SugaredUnionKind<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member one<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member two<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;IFTWO&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IFTWO<br>
&gt;=C2=A0 object SugaredUnion<br>
&gt;=C2=A0 =C2=A0 =C2=A0 member type: SugaredUnionKind optional=3DFalse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tag type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case one: q_obj_Variant1-wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case two: q_obj_Variant2-wrapper<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [&#39;IFTWO&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if IFTWO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 feature union-feat2<br>
&gt;=C2=A0 alternate Alternate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tag type<br>
&gt; diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-go=
od.txt<br>
&gt; index 726727af74..4490108cb7 100644<br>
&gt; --- a/tests/qapi-schema/doc-good.txt<br>
&gt; +++ b/tests/qapi-schema/doc-good.txt<br>
&gt; @@ -76,6 +76,12 @@ Members<br>
&gt;=C2=A0 =C2=A0 =C2=A0the first member<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; +If<br>
&gt; +~~<br>
&gt; +<br>
&gt; +&quot;(IFALL1 and IFALL2)&quot;<br>
&gt; +<br>
&gt; +<br>
<br>
The documentation generated for conditionals is poor before and after<br>
your work.=C2=A0 Observation, not demand.<br>
<br>
&gt;=C2=A0 &quot;Variant1&quot; (Object)<br>
&gt;=C2=A0 -------------------<br>
&gt;=C2=A0 <br>
<br>
[...]<br>
<br>
</blockquote></div></div>

--0000000000006f91ab05c8b78435--


