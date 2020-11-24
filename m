Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CC02C2A06
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 15:47:05 +0100 (CET)
Received: from localhost ([::1]:44688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khZay-0005MW-UR
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 09:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khZZ9-0004pF-MP
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:45:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khZZ2-0003J9-Q5
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:45:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606229103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VD6x7o8RfLkzSAq1pt0K4sbGBGls7d8uldWhjItQ8Sc=;
 b=EV3TiM/NubKUbkYs/WYI6RplObB5TCw58JPurIiJjcQROTJu/6C4pJmoLT7H5dWepV9SJD
 bGHOrDUziK+uLnrIvR99/uwDsnoFmN8OzEmu0jO+0UcLnxSRfCDW9Awd2KUOX6dZk9dMIR
 xDyUu2DZtXfW6qkqJOE2vOD3S7siiYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-b5ppLIxIOL6XIeWASfv0nw-1; Tue, 24 Nov 2020 09:44:59 -0500
X-MC-Unique: b5ppLIxIOL6XIeWASfv0nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B68BAC7425
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 14:44:58 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F2D060C62;
 Tue, 24 Nov 2020 14:44:48 +0000 (UTC)
Date: Tue, 24 Nov 2020 09:44:47 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 11/19] qom: field_prop_set_default_value() helper
Message-ID: <20201124144447.GM2271382@habkost.net>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
 <20201123194818.2773508-12-ehabkost@redhat.com>
 <87tutfnkjg.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87tutfnkjg.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 10:58:27AM +0100, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > Move code that sets the property default value to a separate
> > function, to reduce duplication and make refactoring easier.
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > This is a new patch added in v3 of this series.
> > Hopefully, this will make the series easier to review.
> >
> > The field_prop_set_default_value() was added in v2 at
> > "qom: Use qlit to represent property defaults".
> > ---
> >  qom/field-property.c | 24 ++++++++++++++++--------
> >  1 file changed, 16 insertions(+), 8 deletions(-)
> >
> > diff --git a/qom/field-property.c b/qom/field-property.c
> > index cb729626ce..6a0df7c6ea 100644
> > --- a/qom/field-property.c
> > +++ b/qom/field-property.c
> > @@ -62,6 +62,17 @@ static void static_prop_release_dynamic_prop(Object *obj, const char *name,
> >      g_free(prop);
> >  }
> >  
> > +static void field_prop_set_default_value(ObjectProperty *op,
> > +                                         Property *prop)
> > +{
> > +    if (!prop->set_default) {
> > +        return;
> > +    }
> > +
> > +    assert(prop->info->set_default_value);
> > +    prop->info->set_default_value(op, prop);
> > +}
> > +
> >  ObjectProperty *
> >  object_property_add_field(Object *obj, const char *name,
> >                            Property *prop,
> > @@ -83,11 +94,9 @@ object_property_add_field(Object *obj, const char *name,
> >      object_property_set_description(obj, name,
> >                                      newprop->info->description);
> >  
> > -    if (newprop->set_default) {
> > -        newprop->info->set_default_value(op, newprop);
> > -        if (op->init) {
> > -            op->init(obj, op);
> > -        }
> > +    field_prop_set_default_value(op, newprop);
> > +    if (op->init) {
> > +        op->init(obj, op);
> >      }
> 
> op->init() is now called even when !newprop->set_default.  Why is that
> okay?

op->init() will be NULL if object_property_set_default() was not
called.

It's subtle, and worth mentioning in the commit message.  I think
we should encapsulate op->init() behind a
object_property_reset_to_default_value() function.

> 
> >  
> >      op->allow_set = allow_set;
> > @@ -113,9 +122,8 @@ object_class_property_add_field_static(ObjectClass *oc, const char *name,
> >                                         prop->info->release,
> >                                         prop);
> >      }
> > -    if (prop->set_default) {
> > -        prop->info->set_default_value(op, prop);
> > -    }
> > +
> > +    field_prop_set_default_value(op, prop);
> >      if (prop->info->description) {
> >          object_class_property_set_description(oc, name,
> >                                                prop->info->description);

-- 
Eduardo


