Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690BF31DD37
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 17:22:10 +0100 (CET)
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCPab-0001dL-1D
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 11:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lCPWF-0007nq-Mi
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:17:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lCPWB-00021g-7D
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613578652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EVnYxInZ1d7JNrKYcjZlbyPZY5CbmtiVJUd9AkFor8M=;
 b=YtUb+3UiI4pa7Hf8xX465dE44hHWO3q4zAGaoxfDhfhawpnQZeRRww8RLswOVcdSZHElcj
 L1liyrKqEid1zV7B+g4DLd1vAsIabIHZirYjSROPbhQHZVWRi3IbNzosGmWYmgHMiCcOZt
 +b1MX5v8SII/fFBRnYiiq05BCs/CbXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-xR3vfoQpMG66Poja6N1vkg-1; Wed, 17 Feb 2021 11:17:29 -0500
X-MC-Unique: xR3vfoQpMG66Poja6N1vkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 202D18710E0
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 16:17:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-218.ams2.redhat.com [10.36.113.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36A6860D06;
 Wed, 17 Feb 2021 16:17:27 +0000 (UTC)
Date: Wed, 17 Feb 2021 17:17:25 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 5/6] qapi: Add support for aliases
Message-ID: <20210217161725.GB5662@merkur.fritz.box>
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-6-kwolf@redhat.com>
 <87ft1ura4g.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87ft1ura4g.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.02.2021 um 16:23 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Introduce alias definitions for object types (structs and unions). This
> > allows using the same QAPI type and visitor for many syntax variations
> > that exist in the external representation, like between QMP and the
> > command line. It also provides a new tool for evolving the schema while
> > maintaining backwards compatibility during a deprecation period.
> >
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> [...]
> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> > index 22e62df901..e370485f6e 100644
> > --- a/scripts/qapi/visit.py
> > +++ b/scripts/qapi/visit.py
> > @@ -26,6 +26,7 @@ from .common import (
> >  from .gen import QAPISchemaModularCVisitor, ifcontext
> >  from .schema import (
> >      QAPISchema,
> > +    QAPISchemaAlias,
> >      QAPISchemaEnumMember,
> >      QAPISchemaEnumType,
> >      QAPISchemaFeature,
> > @@ -60,7 +61,8 @@ bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp);
> >  def gen_visit_object_members(name: str,
> >                               base: Optional[QAPISchemaObjectType],
> >                               members: List[QAPISchemaObjectTypeMember],
> > -                             variants: Optional[QAPISchemaVariants]) -> str:
> > +                             variants: Optional[QAPISchemaVariants],
> > +                             aliases: List[QAPISchemaAlias]) -> str:
> >      ret = mcgen('''
> >  
> >  bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
> > @@ -68,6 +70,24 @@ bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
> >  ''',
> >                  c_name=c_name(name))
> >  
> > +    if aliases:
> > +        ret += mcgen('''
> > +    visit_start_alias_scope(v);
> > +''')
> > +
> > +    for a in aliases:
> > +        if a.name:
> > +            name = '"%s"' % a.name
> > +        else:
> > +            name = "NULL"
> > +
> > +        source = ", ".join('"%s"' % x for x in a.source)
> > +
> > +        ret += mcgen('''
> > +    visit_define_alias(v, %(name)s, (const char * []) { %(source)s, NULL });
> > +''',
> > +                     name=name, source=source)
> > +
> >      if base:
> >          ret += mcgen('''
> >      if (!visit_type_%(c_type)s_members(v, (%(c_type)s *)obj, errp)) {
> > @@ -133,6 +153,11 @@ bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
> >      }
> >  ''')
> >  
> > +    if aliases:
> > +        ret += mcgen('''
> > +    visit_end_alias_scope(v);
> > +''')
> > +
> >      ret += mcgen('''
> >      return true;
> >  }
> 
> The visit_type_FOO_members() are primarily helpers for the
> visit_type_FOO().  But they also get called
> 
> * by visit_type_BAR_members() when
> 
>   - struct or union BAR has 'base': 'FOO'
>   - union or alternate BAR a variant 'FOO'
> 
> * by qmp_marshal_CMD() when
> 
>   - CMD has 'boxed': true, 'data': 'FOO'
> 
> Have you considered these cases?
> 
> How's the test coverage?

What is the difference between these cases? The visiting should work the
same, no matter from where it was started.

I did consider the struct base/union variant case and this is why I
introduced visit_start/end_alias_scope so that aliases wouldn't leak to
the outer level.

Now that I'm trying to think of a test case, this probably only protects
against weird corner cases: The input object is the same anyway, so I
guess the only way for this to make a difference is when the base struct
defines an alias for a member that it doesn't even have (so the alias
would remain unused when applied to the base struct independently), but
that exists in the struct in which it is embedded.

I hope adding a test case that checks that this is an error should be
easy. Would the right place be tests/test-qobject-input-visitor.c?

Can you think of any other specific differences that need to be tested?

Kevin


