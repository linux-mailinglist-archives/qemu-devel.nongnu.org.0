Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D7F47078E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 18:42:55 +0100 (CET)
Received: from localhost ([::1]:49148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvjv4-0007oc-Hx
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 12:42:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvjtY-000700-BR
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:41:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvjtU-0005Jy-0e
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639158074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SZWoKqVzc74H6IDkqLnvA9OxmFM3MuKPq4I0N8hYKpc=;
 b=fs2bm06ngG4ABJaVj/zO2A2OE0+bV5M3IcvXpJGheI7Vxk2o3HDgZGXRj5frY945au+dVh
 rOeImCHVXS/EFZN7r9bEu9oqR/8BHYgYqbLRwTb4TkHrnxSFsMFxZTY93NUYIuQ8vEDJom
 QCVGFs34nZdOeRGdaLoHKatFfFM50YM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-RLGiTjJqOnKEGTpmEN5pHw-1; Fri, 10 Dec 2021 12:41:09 -0500
X-MC-Unique: RLGiTjJqOnKEGTpmEN5pHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 326A1801B35
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 17:41:08 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 857B95DF37;
 Fri, 10 Dec 2021 17:41:06 +0000 (UTC)
Date: Fri, 10 Dec 2021 18:41:04 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH 08/12] qapi: Create qom-config:... type for classes
Message-ID: <YbORMJ+t3nTa6/k9@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <20211103173002.209906-9-kwolf@redhat.com>
 <87v90j6n8m.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87v90j6n8m.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 eblake@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.11.2021 um 14:00 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > For every class that has a 'config' definition, a corresponding
> > 'qom-config:$QOM_TYPE' type is automatically created that contains the
> > configuration for the class and all of its parent classes.
> >
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> 
> I assume $QOM_TYPE stands for the class's name.
> 
> What kind of type does this define?  Peeking at the code below... looks
> like it's a struct type.
> 
> I wonder how it's related to the the type we already use or create for
> the the class's 'config' member.  Which is either the name of a struct
> or union type to use, or a dictionary that tells us what struct type to
> create.  Let's see below.

The members of 'config' (i.e. the local configuration options of the
class) are a subset of the member of this new type (i.e. the
configuration options of this class and all of its parent classes).

The new type is really just needed internally in the generated QAPI code
so that the full input can be stored in a C struct temporarily. All of
the manually written code only uses the 'config' type.

> > ---
> >  scripts/qapi/schema.py | 60 +++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 50 insertions(+), 10 deletions(-)
> >
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index ebf69341d7..79db42b810 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -761,6 +761,13 @@ def connect_doc(self, doc):
> >              for f in self.features:
> >                  doc.connect_feature(f)
> >  
> > +    def clone(self):
> > +        features = [QAPISchemaFeature(f.name, f.info, f.ifcond)
> > +                    for f in self.features]
> > +        return QAPISchemaObjectTypeMember(
> > +            self.name, self.info, self._type_name, self.optional,
> > +            self.ifcond, features)
> > +
> 
> A copy that's somewhere between shallow and deep.  Reserving judgement.
> 
> >  
> >  class QAPISchemaVariant(QAPISchemaObjectTypeMember):
> >      role = 'branch'
> > @@ -783,17 +790,11 @@ def __init__(self, name, info, doc, ifcond, features, parent,
> >          self._config_type_name = config_type
> >          self.config_type = None
> >          self.config_boxed = config_boxed
> > +        self.full_config_type = None
> >  
> > -    def check(self, schema):
> > -        super().check(schema)
> > -
> > -        if self._parent_name:
> > -            self.parent = schema.lookup_entity(self._parent_name,
> > -                                               QAPISchemaClass)
> > -            if not self.parent:
> > -                raise QAPISemError(
> > -                    self.info,
> > -                    "Unknown parent class '%s'" % self._parent_name)
> > +    def get_qom_config_type(self, schema):
> > +        if self.full_config_type:
> > +            return self.full_config_type
> >  
> >          if self._config_type_name:
> >              self.config_type = schema.resolve_type(
> > @@ -809,6 +810,40 @@ def check(self, schema):
> >                      "class 'config' can take %s only with 'boxed': true"
> >                      % self.config_type.describe())
> >  
> > +            # FIXME That's a bit ugly
> > +            self.config_type.check(schema)
> > +            members = [m.clone() for m in self.config_type.members]
> > +        else:
> > +            members = []
> 
> Have you considered defaulting ._config_type_name to 'q_empty'?

No. Sounds like a minor simplification here because the if condition
would always become true and therefore the code can be unconditional.

The more important point to talk about in this context is the FIXME
comment. We need to define the right order in which things should be
done.

Before this series, we have a split into two phases: First process all
type definitions in the schema and create the objects representing them,
and then check whether all of the created objects are valid. Among
others, these two phases are needed because we allow definitions to
refer to types that are defined only later.

I'm trying to insert a third phase in the middle that creates new
implicit types based on the schema definitions.

The thing that makes trouble here is that .check() doesn't really only
check, but it's in fact the thing that finalises the initialisation of
object types. Before it, we don't have a member list, but we need it in
order to create the derived type. So I ended up calling .check() for
some types earlier than it should be called, basically intertwining
these two phases.

This can probably fail when .check() tries to access an implicit type
that hasn't been created yet. Not sure if this is a practically relevant
limitation, but mixing the phases this way is definitely ugly.

Any ideas how to solve this cleanly?

> > +
> > +        if self._parent_name:
> > +            self.parent = schema.lookup_entity(self._parent_name,
> > +                                               QAPISchemaClass)
> > +            if not self.parent:
> > +                raise QAPISemError(
> > +                    self.info,
> > +                    "Unknown parent class '%s'" % self._parent_name)
> > +
> > +            self.parent.get_qom_config_type(schema)
> > +            members += [m.clone() for m in self.parent.config_type.members]
> 
> @members is the list of common members of the class's and all its
> parents' 'config' types.
> 
> Any variant members of 'config' types get silently ignored.  Should we
> reject them instead?

We (try to) allow them for boxed 'config' types currently. I think this
was only because commands do the same, but I don't see any reason why
variants would be needed at all for 'config'. So we can just reject them
for both boxed and non-boxed configs.

> > +
> > +        self.full_config_type = QAPISchemaObjectType(
> > +            f"qom-config:{self.name}", self.info, None, self._ifcond,
> > +            self.features, None, members, None)
> 
> The "full config type" inherits conditional and features from the class.
> Its (common) members are the members of the class's and all its parents'
> 'config' types.
> 
> Could we use the parent's full config type as the base type here?

Hmm, good question. I guess that could work.

> Do we need the non-full config type (the type named by or implicitly
> defined by the 'config' member') for anything other than a source of
> local members for the full config type?

Yes, this is the practically relevant type in manually written C code.
The implementation of .instance_config in a QOM object has no use for
all the properties that are really meant for its parent class. It might
even commonly include the local config type in its runtime state, and
having options of the parent class duplicated both in the child class
and in the parent class would be a sure way to introduce bugs.

This is the reason why the non-full config type has a nice C type name
when using an explicit type for 'config', whereas the full config type
is a QAPI implementation detail that can have an ugly name in C without
bothering anyone.

> > +
> > +        return self.full_config_type
> > +
> > +    def check(self, schema):
> > +        super().check(schema)
> > +        assert self.full_config_type
> 
> New constraint: must call .get_qom_config_type() before .check().
> 
> This side effect makes me unsure sure about the "get" in the name.
> Let's worry about that later.

Aye, related to the (theoretical) three phases mentioned above.

> > +
> > +    def connect_doc(self, doc=None):
> > +        super().connect_doc(doc)
> > +        doc = doc or self.doc
> > +        if doc:
> > +            if self.config_type and self.config_type.is_implicit():
> > +                self.config_type.connect_doc(doc)
> 
> Brain cramp.

Apart from the attribute name for the config type, it's an exact copy
from QAPISchemaCommand.

Kevin


