Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD924B1575
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:44:25 +0100 (CET)
Received: from localhost ([::1]:32798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIEQZ-0000CA-US
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:44:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nID5C-0000pr-LQ
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:18:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nID59-0002aA-5L
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644513489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W3sBZNFm76jQ1dTisqOX8WemqTArR4A+Eq/qML62Ik4=;
 b=c6hLxlLYpw+ZIZq+q0Fr2YElohAuv2Affln685d2VyTiR+vk88dYwQQvt3Ulb513+ECkgo
 fUqdAlDHpz15QA//AifFYfGtNGmLkIQLx/1m996SP+Y7h3QG0D00s8+P9RJeihxQcOmrS5
 iMCbvOylWgiLxgzjTi+s3w2yhCobUPk=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-ZmXrYVXFOR6LxlaZ1D0XmA-1; Thu, 10 Feb 2022 12:18:08 -0500
X-MC-Unique: ZmXrYVXFOR6LxlaZ1D0XmA-1
Received: by mail-ua1-f69.google.com with SMTP id
 w9-20020ab02809000000b0033c8f596fb4so3168600uap.8
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 09:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W3sBZNFm76jQ1dTisqOX8WemqTArR4A+Eq/qML62Ik4=;
 b=WoPEEPeWsITQndT/ZyDd3KIDoDvNSVrXIHENp+yRRJkPDX0smwYmWz2pcYjVQMcPyl
 nwRQASNELgbtya9292mP36IYQr2/hHDQz4ElHAmMtzOUQyl8PXJawaRiay15bih49cxO
 wsbPmRKWnwS0R416xdBczl3PJ2Y2ltkSKUZ89L3iq5S4mMKNEVLBakxdJr91CYuwFau+
 jAu/Pv8yYM8R1PzBiB88CFwKIXstfF86aAoWcwrv4Axo5QxhHeieAiVF9F4aTIMb34iC
 2ck4Qo0xkuLEWoI7p7AYtwFsL55RMMMX5Ma8LgE7TjHBK+8FtyZ/9hH+9pJ8NnQztVSw
 4VFw==
X-Gm-Message-State: AOAM532hCljGEtfU0pHVVPIQQNa9INSw1GUs3xK5Wo3Zhf73BWuj6X3s
 JU1HQhKGkxdXCnoyoLWpN/aCb4QjYptBgntLbIBn6D5eR0d2qw9evyHiKokafplyf8DKcolKDpN
 yL6TqGq/4PfTT+q7qKpuh9yVyIkeUnKE=
X-Received: by 2002:a05:6122:17a9:: with SMTP id
 o41mr3177468vkf.1.1644513483423; 
 Thu, 10 Feb 2022 09:18:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxz6edYayo19BmUqJ2oqwhbl3LwjRNsNpEglYAbCkxPUdZIjTnjKLkzn0cKU4RI/P8+8yw39O3A/gCtPPlOs78=
X-Received: by 2002:a05:6122:17a9:: with SMTP id
 o41mr3177459vkf.1.1644513483065; 
 Thu, 10 Feb 2022 09:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20220204225230.2114135-1-jsnow@redhat.com>
 <87leyibtqz.fsf@pond.sub.org>
In-Reply-To: <87leyibtqz.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 10 Feb 2022 12:17:52 -0500
Message-ID: <CAFn=p-YSAe7Q+usWEv4b7UciYjm5iso9LH-pd-VbDoV196PfvQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/qapi: minor delinting
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 10:56 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > Just cleaning up some cobwebs.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  scripts/qapi/commands.py | 2 +-
> >  scripts/qapi/events.py   | 6 +++---
> >  scripts/qapi/types.py    | 6 +++++-
> >  scripts/qapi/visit.py    | 6 +++++-
> >  4 files changed, 14 insertions(+), 6 deletions(-)
> >
> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> > index 869d799ed2..38ca38a7b9 100644
> > --- a/scripts/qapi/commands.py
> > +++ b/scripts/qapi/commands.py
> > @@ -25,8 +25,8 @@
> >      QAPIGenC,
> >      QAPISchemaModularCVisitor,
> >      build_params,
> > -    ifcontext,
> >      gen_special_features,
> > +    ifcontext,
> >  )
> >  from .schema import (
> >      QAPISchema,
> > diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> > index 27b44c49f5..8edf43d8da 100644
> > --- a/scripts/qapi/events.py
> > +++ b/scripts/qapi/events.py
> > @@ -109,15 +109,15 @@ def gen_event_send(name: str,
> >          if not boxed:
> >              ret += gen_param_var(arg_type)
> >
> > -    for f in features:
> > -        if f.is_special():
> > +    for feat in features:
> > +        if feat.is_special():
> >              ret += mcgen('''
> >
> >      if (compat_policy.%(feat)s_output == COMPAT_POLICY_OUTPUT_HIDE) {
> >          return;
> >      }
> >  ''',
> > -                         feat=f.name)
> > +                         feat=feat.name)
> >
> >      ret += mcgen('''
> >
>
> Meh.  Expressive variable names are good when there's something useful
> to express.  But what's the added value in such a simple, obvious loop?
>
> Besides:
>
>     $ git-grep 'for . in' scripts/qapi | wc -l
>     42
>     $ git-grep -E 'for [A-Za-z0-9]{2,} in' scripts/qapi | wc -l
>     31
>
> > diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> > index 3013329c24..477d027001 100644
> > --- a/scripts/qapi/types.py
> > +++ b/scripts/qapi/types.py
> > @@ -16,7 +16,11 @@
> >  from typing import List, Optional
> >
> >  from .common import c_enum_const, c_name, mcgen
> > -from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontext
> > +from .gen import (
> > +    QAPISchemaModularCVisitor,
> > +    gen_special_features,
> > +    ifcontext,
> > +)
> >  from .schema import (
> >      QAPISchema,
> >      QAPISchemaEnumMember,
> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> > index e13bbe4292..380fa197f5 100644
> > --- a/scripts/qapi/visit.py
> > +++ b/scripts/qapi/visit.py
> > @@ -21,7 +21,11 @@
> >      indent,
> >      mcgen,
> >  )
> > -from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontext
> > +from .gen import (
> > +    QAPISchemaModularCVisitor,
> > +    gen_special_features,
> > +    ifcontext,
> > +)
> >  from .schema import (
> >      QAPISchema,
> >      QAPISchemaEnumMember,
>
> Everything else, gladly
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

The problem with whitelisting single-letter variable names is that
it's done on a per-name basis, like allowing "x, y, z" or "i, j, k". I
could whitelist "f", "m", etc but there's no way to whitelist "for f
in features" or "for m im members" ... So admittedly, I just stuck
with the default, even though it's a little annoying. It's what I use
for python/, and I had previously used it for ./scripts/qapi/, so I
was just carrying on.

In general: I like the idea of forbidding single-letter variable names
because I prefer things to be more verbose than terse as a habit. In
practice: yeah, it's hard to strictly defend any one change as
obviously superior. I preferred "for feature in features", which you
did not like because the plural wasn't distinct enough (fair!), so I
started using "for feat in features" as a compromise.

If on third thought you don't like any of this, we can change course,
but then maybe we should also undo the other changes we already
checked in. (At this point, I feel like it's maybe less churn to
continue on the path I have been, but... you're the boss here.)

--js


