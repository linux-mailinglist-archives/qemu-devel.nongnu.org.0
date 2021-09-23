Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A6741655B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:48:13 +0200 (CEST)
Received: from localhost ([::1]:58648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTlU-0005dE-7o
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTTjI-000487-DU
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:45:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTTjE-0002zv-PS
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632422750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t+vvInffFjlaldKhrXHERPN49e+oaSTzndFJJka5at4=;
 b=OJgEd2guPihgsjGzWErq/ougOoCsR1ZbmdT1ezBOkK5O2D0onMaoCnCb4ktO+0/gDuVvgB
 +h6nC9tklJNXG6XA79zqcD3WuHn24JIVsnh6729sgWSRO0wTZKhrVBA7nsO3Hw/+2t/tLp
 cVFZkfGUoTrVeO/7w3TJJltChUvRNnw=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-5uZiPFkVOiK0HAApcFqgdQ-1; Thu, 23 Sep 2021 14:45:48 -0400
X-MC-Unique: 5uZiPFkVOiK0HAApcFqgdQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 i7-20020a9d6507000000b0051c10643794so3413855otl.22
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 11:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t+vvInffFjlaldKhrXHERPN49e+oaSTzndFJJka5at4=;
 b=oj3uXM4E3I0o9T55bi0rHNbWxuHy7Nmd4lz/iwnzl3UAeFyyh4m4MW+5o1Au36bHVi
 2ZniSyjDLFWhJZ5M+stR/zgBETD84QM1arrNt0L1vwH/mA+kPggMVjE/c4lAwKqvL0Qs
 ZHnOK3JAoXgVot43/boAdNpk8SpPhcXQ7iwanO7/mnspyceLguCTIPl3ezFHQtBXxMmI
 riaHPlWDptwmm1Q80zZ5iQZwYDq9o4l1jD1pF+9+RtFEYEq1xGIQKMvnjcfBKKY0PQFo
 QFY/GyzaSVl/RpcbyUwqpjRBEd8gK9u1ffFb2IGIGHdHHXZ1MyisfnBUX5degmJiJp4Q
 fu7w==
X-Gm-Message-State: AOAM5302JH5tXuuD17A0tFlDUJsbD8/lUFmfCF4a/Aq3KyLQ9tjvCJI/
 77V/VJUqefCQF0GsDqr1mYNhDeJpIEinRU7MVu9LSK0rljxY+4HShQ+dWIAFICRKdfsBBekIrrz
 6DbXaRjJDdpJGtIJjQ+t1YkhHCC4iXFQ=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr199234ots.252.1632422744998; 
 Thu, 23 Sep 2021 11:45:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx683kuNtwxiVcEkTEy4Fhl20tUPeDHtY0/gkf9VArVIJOsBO/mSMaR0W3PueIKGCPaunC5cEVgSRvBaV3KTJo=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr199214ots.252.1632422744814; 
 Thu, 23 Sep 2021 11:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210923182204.4187601-1-jsnow@redhat.com>
 <20210923182204.4187601-2-jsnow@redhat.com>
 <20210923183259.pbfbmrq3fnlxukr4@habkost.net>
In-Reply-To: <20210923183259.pbfbmrq3fnlxukr4@habkost.net>
From: John Snow <jsnow@redhat.com>
Date: Thu, 23 Sep 2021 14:45:34 -0400
Message-ID: <CAFn=p-Y2Gm26e9i6yUFUxnJYzYfKDSjr0ZmRavyxLLOe9LPekw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: remove non-reference uses of single backticks
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d40d1f05ccae09fd"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d40d1f05ccae09fd
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 2:33 PM Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, Sep 23, 2021 at 02:22:03PM -0400, John Snow wrote:
> > The single backtick markup in ReST is the "default role". Currently,
> > Sphinx's default role is called "content". Sphinx suggests you can use
> > the "Any" role instead to turn any single-backtick enclosed item into a
> > cross-reference.
> >
> > This is useful for things like autodoc for Python docstrings, where it's
> > often nicer to reference other types with `foo` instead of the more
> > laborious :py:meth:`foo`. It's also useful in multi-domain cases to
> > easily reference definitions from other Sphinx domains, such as
> > referencing C code definitions from outside of kerneldoc comments.
> >
> > Before we do that, though, we'll need to turn all existing usages of the
> > "content" role to inline verbatim markup wherever it does not correctly
> > resolve into a cross-refernece by using double backticks instead.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> Clear demonstration of the usefulness of patch 2/2 (these
> occurrences of `foo` wouldn't have been added if the default role
> was "any" because "any" errors out on invalid references).
>
> However, it looks like there are unrelated changes:
>
> [...]
> > diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> > index 24012534827..6b1230f2d7f 100644
> > --- a/docs/devel/migration.rst
> > +++ b/docs/devel/migration.rst
> > @@ -403,8 +403,8 @@ version_id.  And the function ``load_state_old()``
> (if present) is able to
> >  load state from minimum_version_id_old to minimum_version_id.  This
> >  function is deprecated and will be removed when no more users are left.
> >
> > -There are *_V* forms of many ``VMSTATE_`` macros to load fields for
> version dependent fields,
> > -e.g.
> > +There are *_V* forms of many ``VMSTATE_`` macros to load fields for
> > +version dependent fields, e.g.
>
> Unrelated?  Line wrapping change only.
>
> >
> >  .. code:: c
> >
> > @@ -819,9 +819,9 @@ Postcopy now works with hugetlbfs backed memory:
> >  Postcopy with shared memory
> >  ---------------------------
> >
> > -Postcopy migration with shared memory needs explicit support from the
> other
> > -processes that share memory and from QEMU. There are restrictions on
> the type of
> > -memory that userfault can support shared.
> > +Postcopy migration with shared memory needs explicit support from the
> > +other processes that share memory and from QEMU. There are restrictions
> > +on the type of memory that userfault can support shared.
>
> Unrelated?  Line wrapping change only.
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>  # if unrelated line
> wrapping changes are dropped
>
> --
> Eduardo
>
>
Apologies for that -- it's bad rebase confetti. Something got merged
automatically and it resulted in weird junk. Sorry for the noise.

--js

--000000000000d40d1f05ccae09fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 23, 2021 at 2:33 PM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Thu, Sep 23, 2021 at 02:22:03PM -0400, John Snow wrote:<br>
&gt; The single backtick markup in ReST is the &quot;default role&quot;. Cu=
rrently,<br>
&gt; Sphinx&#39;s default role is called &quot;content&quot;. Sphinx sugges=
ts you can use<br>
&gt; the &quot;Any&quot; role instead to turn any single-backtick enclosed =
item into a<br>
&gt; cross-reference.<br>
&gt; <br>
&gt; This is useful for things like autodoc for Python docstrings, where it=
&#39;s<br>
&gt; often nicer to reference other types with `foo` instead of the more<br=
>
&gt; laborious :py:meth:`foo`. It&#39;s also useful in multi-domain cases t=
o<br>
&gt; easily reference definitions from other Sphinx domains, such as<br>
&gt; referencing C code definitions from outside of kerneldoc comments.<br>
&gt; <br>
&gt; Before we do that, though, we&#39;ll need to turn all existing usages =
of the<br>
&gt; &quot;content&quot; role to inline verbatim markup wherever it does no=
t correctly<br>
&gt; resolve into a cross-refernece by using double backticks instead.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
Clear demonstration of the usefulness of patch 2/2 (these<br>
occurrences of `foo` wouldn&#39;t have been added if the default role<br>
was &quot;any&quot; because &quot;any&quot; errors out on invalid reference=
s).<br>
<br>
However, it looks like there are unrelated changes:<br>
<br>
[...]<br>
&gt; diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst<br>
&gt; index 24012534827..6b1230f2d7f 100644<br>
&gt; --- a/docs/devel/migration.rst<br>
&gt; +++ b/docs/devel/migration.rst<br>
&gt; @@ -403,8 +403,8 @@ version_id.=C2=A0 And the function ``load_state_ol=
d()`` (if present) is able to<br>
&gt;=C2=A0 load state from minimum_version_id_old to minimum_version_id.=C2=
=A0 This<br>
&gt;=C2=A0 function is deprecated and will be removed when no more users ar=
e left.<br>
&gt;=C2=A0 <br>
&gt; -There are *_V* forms of many ``VMSTATE_`` macros to load fields for v=
ersion dependent fields,<br>
&gt; -e.g.<br>
&gt; +There are *_V* forms of many ``VMSTATE_`` macros to load fields for<b=
r>
&gt; +version dependent fields, e.g.<br>
<br>
Unrelated?=C2=A0 Line wrapping change only.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 .. code:: c<br>
&gt;=C2=A0 <br>
&gt; @@ -819,9 +819,9 @@ Postcopy now works with hugetlbfs backed memory:<b=
r>
&gt;=C2=A0 Postcopy with shared memory<br>
&gt;=C2=A0 ---------------------------<br>
&gt;=C2=A0 <br>
&gt; -Postcopy migration with shared memory needs explicit support from the=
 other<br>
&gt; -processes that share memory and from QEMU. There are restrictions on =
the type of<br>
&gt; -memory that userfault can support shared.<br>
&gt; +Postcopy migration with shared memory needs explicit support from the=
<br>
&gt; +other processes that share memory and from QEMU. There are restrictio=
ns<br>
&gt; +on the type of memory that userfault can support shared.<br>
<br>
Unrelated?=C2=A0 Line wrapping change only.<br>
<br>
Reviewed-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" tar=
get=3D"_blank">ehabkost@redhat.com</a>&gt;=C2=A0 # if unrelated line wrappi=
ng changes are dropped<br>
<br>
-- <br>
Eduardo<br>
<br></blockquote><div><br></div><div>Apologies for that -- it&#39;s bad reb=
ase confetti. Something got merged automatically and it resulted in weird j=
unk. Sorry for the noise.</div><div><br></div><div>--js<br></div></div></di=
v>

--000000000000d40d1f05ccae09fd--


