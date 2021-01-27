Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F70A306537
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 21:33:38 +0100 (CET)
Received: from localhost ([::1]:40166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4rVR-00057m-FP
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 15:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4rTi-0004Uh-Ni
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4rTe-00037J-1j
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611779502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3UAauUDv4dig9zA71EFiy+ZCych6fLjTpzDWVaxj/1Q=;
 b=VqTzmiiB6VStAhYhxi4/uaE8RxLOJfkPvl6XowXKLRUBdATySVnvIalw5zbF4IfjQE50f+
 ad/u2X2/ZV3POE3Nz9oqg9tp5Vnl0Aq7dQj2+VpLNfxcMyYn/MW3wiFotJXS70K5xtTJx5
 9fFkIcHxigzLFVxvwuDBR9k72wPJALc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-SzXyFUckOTSKT0oEqKyyMg-1; Wed, 27 Jan 2021 15:31:40 -0500
X-MC-Unique: SzXyFUckOTSKT0oEqKyyMg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46F30107ACF7
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 20:31:39 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B9A610016F7;
 Wed, 27 Jan 2021 20:31:38 +0000 (UTC)
Date: Wed, 27 Jan 2021 21:31:36 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/6] qapi: Add interfaces for alias support to Visitor
Message-ID: <20210127203136.GE6090@merkur.fritz.box>
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-2-kwolf@redhat.com>
 <87czxqr19m.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87czxqr19m.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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

Am 27.01.2021 um 13:51 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > This adds functions to the Visitor interface that can be used to define
> > aliases and alias scopes.
> >
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  include/qapi/visitor-impl.h | 12 ++++++++++++
> >  include/qapi/visitor.h      | 37 +++++++++++++++++++++++++++++++++++++
> >  qapi/qapi-visit-core.c      | 21 +++++++++++++++++++++
> >  3 files changed, 70 insertions(+)
> >
> > diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
> > index 7362c043be..e30da2599c 100644
> > --- a/include/qapi/visitor-impl.h
> > +++ b/include/qapi/visitor-impl.h
> > @@ -113,6 +113,18 @@ struct Visitor
> >         The core takes care of the return type in the public interface. */
> >      void (*optional)(Visitor *v, const char *name, bool *present);
> >  
> > +    /*
> > +     * Optional; intended for input visitors. If not given, aliases are
> > +     * ignored.
> > +     */
> > +    void (*define_alias)(Visitor *v, const char *alias, const char **source);
> > +
> > +    /* Must be set if define_alias is set */
> > +    void (*start_alias_scope)(Visitor *v);
> > +
> > +    /* Must be set if define_alias is set */
> > +    void (*end_alias_scope)(Visitor *v);
> > +
> >      /* Must be set */
> >      VisitorType type;
> >  
> > diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
> > index ebc19ede7f..9bdc0ee03d 100644
> > --- a/include/qapi/visitor.h
> > +++ b/include/qapi/visitor.h
> > @@ -459,6 +459,43 @@ void visit_end_alternate(Visitor *v, void **obj);
> >   */
> >  bool visit_optional(Visitor *v, const char *name, bool *present);
> >  
> > +/*
> > + * Defines a new alias rule.
> > + *
> > + * If @alias is non-NULL, the member named @alias in the external
> > + * representation of the current struct is defined as an alias for the
> 
> Terminology: the big comment uses "object".  See also the FIXME in
> visit_start_struct()'s contract.

Ok. Maybe the FIXME should be resolved to avoid this kind of problem.

> > + * member described by @source.
> > + *
> > + * If @alias is NULL, all members of the struct described by @source are
> > + * considered to have alias members with the same key in the current
> > + * struct.
> 
> Define "the current struct".  I believe it's the object being visited.

Yes.

> What happens if we're currently visiting something other than an object,
> i.e. the root of a tree, or a list?

Then you (= the generated code) shouldn't call the function. Aliases
only make sense for objects (because everything else doesn't have keys).

If you call it anyway, it depends on how you visit the elements of the
list. Currently, I think they are always visited with a NULL name. In
this case the alias should just never apply, but it looks like
propagate_aliases() might actually crash because it doesn't check for
NULL names.

We don't have such callers and I don't think we want to have them, so
I'm not sure if we want to fix anything, and if we do, if the fix should
be tolerating and effectively ignoring such alias definitions or if we
should explicitly assert that the name is non-NULL.

> > + *
> > + * @source is a NULL-terminated array of names that describe the path to
> > + * a member, starting from the currently visited struct.
> 
> I'm afraid "describe the path to a member" is too vague.  How?
> 
> I figure this is what you have in mind:
> 
>     cur = the currently visited object
>     for s in source:
>         cur = the member of cur denoted by s
> 
> When @cur is indeed an object, then "the member denoted by @s" makes
> sense: you must pass a name when visiting object members, and whatever
> is visited with name @s is the member denoted by @s.
> 
> "Must pass a name" is documented in the big comment:
> 
>  * The @name parameter of visit_type_FOO() describes the relation
>  * between this QAPI value and its parent container.  When visiting
>  * the root of a tree, @name is ignored; when visiting a member of an
>  * object, @name is the key associated with the value; when visiting a
>  * member of a list, @name is NULL; and when visiting the member of an
>  * alternate, @name should equal the name used for visiting the
>  * alternate.
> 
> But what if @cur is a list?  I guess that makes no sense.  Say so
> explicitly, please.

Yes, everything but the last element in the path must be an object.

Kevin


