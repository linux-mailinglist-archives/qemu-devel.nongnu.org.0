Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498C331DC17
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 16:25:26 +0100 (CET)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCOhg-0006OE-Pg
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 10:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCOgD-0005pV-KD
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:23:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCOgA-0002eg-At
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613575428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gsw1rSCJAKStTH56q6E5Pi5Sc57Jes+Pi9xiD8ure3k=;
 b=HJa7GPm6ClwRyVJ+SEkQ1CsvvZCQ+P4UV1Q9HSagCEe+Js88GqeAmWTTrb5ewv+4X0uF3L
 TgfyHMh4hBj9ydSzvcn7oGl/o8i++Jt9pr3wrkw73PDfe+Ljm8HN8w8u/3QIJjpF0zYw9I
 40oLzu9u1QGgXuajDU31K+6E2XBuP+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-Cb8bBOySMTW8DvNJGMKo6A-1; Wed, 17 Feb 2021 10:23:46 -0500
X-MC-Unique: Cb8bBOySMTW8DvNJGMKo6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADF10192AB78
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:23:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EB765D9C2;
 Wed, 17 Feb 2021 15:23:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E787B113860F; Wed, 17 Feb 2021 16:23:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 5/6] qapi: Add support for aliases
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-6-kwolf@redhat.com>
Date: Wed, 17 Feb 2021 16:23:43 +0100
In-Reply-To: <20210211183118.422036-6-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 11 Feb 2021 19:31:17 +0100")
Message-ID: <87ft1ura4g.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Kevin Wolf <kwolf@redhat.com> writes:

> Introduce alias definitions for object types (structs and unions). This
> allows using the same QAPI type and visitor for many syntax variations
> that exist in the external representation, like between QMP and the
> command line. It also provides a new tool for evolving the schema while
> maintaining backwards compatibility during a deprecation period.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
[...]
> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index 22e62df901..e370485f6e 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -26,6 +26,7 @@ from .common import (
>  from .gen import QAPISchemaModularCVisitor, ifcontext
>  from .schema import (
>      QAPISchema,
> +    QAPISchemaAlias,
>      QAPISchemaEnumMember,
>      QAPISchemaEnumType,
>      QAPISchemaFeature,
> @@ -60,7 +61,8 @@ bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp);
>  def gen_visit_object_members(name: str,
>                               base: Optional[QAPISchemaObjectType],
>                               members: List[QAPISchemaObjectTypeMember],
> -                             variants: Optional[QAPISchemaVariants]) -> str:
> +                             variants: Optional[QAPISchemaVariants],
> +                             aliases: List[QAPISchemaAlias]) -> str:
>      ret = mcgen('''
>  
>  bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
> @@ -68,6 +70,24 @@ bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
>  ''',
>                  c_name=c_name(name))
>  
> +    if aliases:
> +        ret += mcgen('''
> +    visit_start_alias_scope(v);
> +''')
> +
> +    for a in aliases:
> +        if a.name:
> +            name = '"%s"' % a.name
> +        else:
> +            name = "NULL"
> +
> +        source = ", ".join('"%s"' % x for x in a.source)
> +
> +        ret += mcgen('''
> +    visit_define_alias(v, %(name)s, (const char * []) { %(source)s, NULL });
> +''',
> +                     name=name, source=source)
> +
>      if base:
>          ret += mcgen('''
>      if (!visit_type_%(c_type)s_members(v, (%(c_type)s *)obj, errp)) {
> @@ -133,6 +153,11 @@ bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
>      }
>  ''')
>  
> +    if aliases:
> +        ret += mcgen('''
> +    visit_end_alias_scope(v);
> +''')
> +
>      ret += mcgen('''
>      return true;
>  }

The visit_type_FOO_members() are primarily helpers for the
visit_type_FOO().  But they also get called

* by visit_type_BAR_members() when

  - struct or union BAR has 'base': 'FOO'
  - union or alternate BAR a variant 'FOO'

* by qmp_marshal_CMD() when

  - CMD has 'boxed': true, 'data': 'FOO'

Have you considered these cases?

How's the test coverage?

> @@ -361,14 +386,15 @@ class QAPISchemaGenVisitVisitor(QAPISchemaModularCVisitor):
>                            features: List[QAPISchemaFeature],
>                            base: Optional[QAPISchemaObjectType],
>                            members: List[QAPISchemaObjectTypeMember],
> -                          variants: Optional[QAPISchemaVariants]) -> None:
> +                          variants: Optional[QAPISchemaVariants],
> +                          aliases: List[QAPISchemaAlias]) -> None:
>          # Nothing to do for the special empty builtin
>          if name == 'q_empty':
>              return
>          with ifcontext(ifcond, self._genh, self._genc):
>              self._genh.add(gen_visit_members_decl(name))
> -            self._genc.add(gen_visit_object_members(name, base,
> -                                                    members, variants))
> +            self._genc.add(gen_visit_object_members(
> +                name, base, members, variants, aliases))
>              # TODO Worth changing the visitor signature, so we could
>              # directly use rather than repeat type.is_implicit()?
>              if not name.startswith('q_'):
[...]


