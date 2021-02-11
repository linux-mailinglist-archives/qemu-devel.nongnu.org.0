Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D94319005
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 17:32:33 +0100 (CET)
Received: from localhost ([::1]:58050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAEtM-0007i8-1Z
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 11:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAEon-0006Tj-MA
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:27:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAEol-0007oU-8p
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613060866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eIH4z25EYakssI4zwrHa6wGftzUvYPw+K2xwavG7oIs=;
 b=T9TBAtivutKnZBwJxwEHMNWiN8harwCbAdEiNWO/8DKyO8c0ZmC4s7Uk4gWjLj2PxMINq7
 8AHDSZxsNxTxYz4G26A5Ss2be0NRssiC24ZajMU5B9sG/EFpJUQYcSuR7xLaKTGhmDwbwK
 DF5Nah7M6efwLI9TocKBFtDUI5XioAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-3LQvjyQmNbCkEdLA8n00JQ-1; Thu, 11 Feb 2021 11:27:44 -0500
X-MC-Unique: 3LQvjyQmNbCkEdLA8n00JQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DE191934101
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 16:27:43 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-82.ams2.redhat.com [10.36.113.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59070E146;
 Thu, 11 Feb 2021 16:27:42 +0000 (UTC)
Date: Thu, 11 Feb 2021 17:27:40 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/6] qapi: Remember alias definitions in
 qobject-input-visitor
Message-ID: <20210211162740.GA5327@merkur.fritz.box>
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-3-kwolf@redhat.com>
 <87sg65pff8.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87sg65pff8.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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

Am 09.02.2021 um 13:57 hat Markus Armbruster geschrieben:
> Let me look at the actual code now Kevin reduced my confusion about the
> interface and the data structures.
> 
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > This makes qobject-input-visitor remember the currently valid aliases in
> > each StackObject. It doesn't actually allow using the aliases yet.
> >
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  qapi/qobject-input-visitor.c | 115 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 115 insertions(+)

> > @@ -203,6 +229,38 @@ static const char *qobject_input_get_keyval(QObjectInputVisitor *qiv,
> >      return qstring_get_str(qstr);
> >  }
> >  
> > +/*
> > + * Propagates aliases from the parent StackObject @src to its direct
> > + * child StackObject @dst, which is representing the child struct @name.
> 
> @name must equal dst->name, I think.  Drop the parameter?
> 
> > + *
> > + * Every alias whose source path begins with @name and which still
> > + * applies in @dst (i.e. it is either a wildcard alias or has at least
> > + * one more source path element) is propagated to @dst with the first
> 
> I'm not sure I get the parenthesis.  Perhaps the code will enlighten me.
> 
> > + * element (i.e. @name) removed from the source path.
> > + */
> > +static void propagate_aliases(StackObject *dst, StackObject *src,
> > +                              const char *name)
> > +{
> > +    InputVisitorAlias *a;
> > +
> > +    QSLIST_FOREACH(a, &src->aliases, next) {
> > +        if (!a->src[0] || strcmp(a->src[0], name)) {
> > +            continue;
> > +        }
> 
> We only look at the aliases that apply to @dst or below.  They do only
> when ->src[0] equals dst->name.  Makes sense.
> 
> > +        if (a->src[1] || !a->alias) {
> 
> If a->src[1], the alias applies below @dst, not to @dst.  To get it to
> the place where it applies, we first need to propagate to @dst.
> 
> Else, the alias applies to @dst.  If !a->alias, we're looking at a
> wildcard alias, i.e. all members of the object described by @dst are
> aliased.  Why do we need to propagate only wildcard aliases to @dst?

If it's not a wildcard alias and a->src[1] == NULL, then the alias
referred to @dst's name inside @src. It's not valid inside @dst any
more.

This is what the parenthesis above tried to tell you.

I've added another comment in the code to explain this case more
explicitly.

> > +            InputVisitorAlias *alias = g_new(InputVisitorAlias, 1);
> > +
> > +            *alias = (InputVisitorAlias) {
> > +                .alias      = a->alias,
> > +                .alias_so   = a->alias_so,
> > +                .src        = &a->src[1],
> > +            };
> > +
> > +            QSLIST_INSERT_HEAD(&dst->aliases, alias, next);
> > +        }
> > +    }
> > +}
> > +
> >  static const QListEntry *qobject_input_push(QObjectInputVisitor *qiv,
> >                                              const char *name,
> >                                              QObject *obj, void *qapi)
> > @@ -226,6 +284,9 @@ static const QListEntry *qobject_input_push(QObjectInputVisitor *qiv,
> >              g_hash_table_insert(h, (void *)qdict_entry_key(entry), NULL);
> >          }
> >          tos->h = h;
> > +        if (!QSLIST_EMPTY(&qiv->stack)) {
> > +            propagate_aliases(tos, QSLIST_FIRST(&qiv->stack), name);
> > +        }
> 
> What if QSLIST_EMPTY(&qiv->stack) and tos->aliases contains aliases that
> apply deeper?

tos->aliases doesn't contain any aliases, we only created it a few lines
above.

We would normally propagate aliases from the parent StackObject (which
is QSLIST_FIRST(&qiv->stack)), but if there is no parent StackObject,
then there can't be aliases to be inherited from the parent either.

Kevin


