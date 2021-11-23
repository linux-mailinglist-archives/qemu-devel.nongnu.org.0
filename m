Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD5345A36A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 14:02:21 +0100 (CET)
Received: from localhost ([::1]:48444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpVRE-0007yW-EM
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 08:02:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpVPc-00073A-04
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:00:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpVPZ-0004zr-W0
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:00:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637672435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2/bVFRzKQPnP/77/0m0Tkba6ODusotNfKLr8MleqCrs=;
 b=fbB1qSbQyqTnylsm/XJHc0Z7snGErg4f/3zN5EAFENSss31GvF1tFdQUVCAP3q1jL/mQcx
 D5dWJpuQPM8P6DUhNDKwsO5eiKjUfioRM/qH6jhlIrY+LvcpXfW0vHmCZr2ir+FER1MqlA
 2Yg/SFPlQGP9xB0//fg49zTvtEtMeAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-5eIb0kLXM7yjzivLiPQkGg-1; Tue, 23 Nov 2021 08:00:32 -0500
X-MC-Unique: 5eIb0kLXM7yjzivLiPQkGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD2B51B18BCE
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 13:00:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF5C426FD2;
 Tue, 23 Nov 2021 13:00:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5723D11380A7; Tue, 23 Nov 2021 14:00:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH 08/12] qapi: Create qom-config:... type for classes
References: <20211103173002.209906-1-kwolf@redhat.com>
 <20211103173002.209906-9-kwolf@redhat.com>
Date: Tue, 23 Nov 2021 14:00:09 +0100
In-Reply-To: <20211103173002.209906-9-kwolf@redhat.com> (Kevin Wolf's message
 of "Wed, 3 Nov 2021 18:29:58 +0100")
Message-ID: <87v90j6n8m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> For every class that has a 'config' definition, a corresponding
> 'qom-config:$QOM_TYPE' type is automatically created that contains the
> configuration for the class and all of its parent classes.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

I assume $QOM_TYPE stands for the class's name.

What kind of type does this define?  Peeking at the code below... looks
like it's a struct type.

I wonder how it's related to the the type we already use or create for
the the class's 'config' member.  Which is either the name of a struct
or union type to use, or a dictionary that tells us what struct type to
create.  Let's see below.

> ---
>  scripts/qapi/schema.py | 60 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 50 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index ebf69341d7..79db42b810 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -761,6 +761,13 @@ def connect_doc(self, doc):
>              for f in self.features:
>                  doc.connect_feature(f)
>  
> +    def clone(self):
> +        features = [QAPISchemaFeature(f.name, f.info, f.ifcond)
> +                    for f in self.features]
> +        return QAPISchemaObjectTypeMember(
> +            self.name, self.info, self._type_name, self.optional,
> +            self.ifcond, features)
> +

A copy that's somewhere between shallow and deep.  Reserving judgement.

>  
>  class QAPISchemaVariant(QAPISchemaObjectTypeMember):
>      role = 'branch'
> @@ -783,17 +790,11 @@ def __init__(self, name, info, doc, ifcond, features, parent,
>          self._config_type_name = config_type
>          self.config_type = None
>          self.config_boxed = config_boxed
> +        self.full_config_type = None
>  
> -    def check(self, schema):
> -        super().check(schema)
> -
> -        if self._parent_name:
> -            self.parent = schema.lookup_entity(self._parent_name,
> -                                               QAPISchemaClass)
> -            if not self.parent:
> -                raise QAPISemError(
> -                    self.info,
> -                    "Unknown parent class '%s'" % self._parent_name)
> +    def get_qom_config_type(self, schema):
> +        if self.full_config_type:
> +            return self.full_config_type
>  
>          if self._config_type_name:
>              self.config_type = schema.resolve_type(
> @@ -809,6 +810,40 @@ def check(self, schema):
>                      "class 'config' can take %s only with 'boxed': true"
>                      % self.config_type.describe())
>  
> +            # FIXME That's a bit ugly
> +            self.config_type.check(schema)
> +            members = [m.clone() for m in self.config_type.members]
> +        else:
> +            members = []

Have you considered defaulting ._config_type_name to 'q_empty'?

> +
> +        if self._parent_name:
> +            self.parent = schema.lookup_entity(self._parent_name,
> +                                               QAPISchemaClass)
> +            if not self.parent:
> +                raise QAPISemError(
> +                    self.info,
> +                    "Unknown parent class '%s'" % self._parent_name)
> +
> +            self.parent.get_qom_config_type(schema)
> +            members += [m.clone() for m in self.parent.config_type.members]

@members is the list of common members of the class's and all its
parents' 'config' types.

Any variant members of 'config' types get silently ignored.  Should we
reject them instead?

> +
> +        self.full_config_type = QAPISchemaObjectType(
> +            f"qom-config:{self.name}", self.info, None, self._ifcond,
> +            self.features, None, members, None)

The "full config type" inherits conditional and features from the class.
Its (common) members are the members of the class's and all its parents'
'config' types.

Could we use the parent's full config type as the base type here?

Do we need the non-full config type (the type named by or implicitly
defined by the 'config' member') for anything other than a source of
local members for the full config type?

> +
> +        return self.full_config_type
> +
> +    def check(self, schema):
> +        super().check(schema)
> +        assert self.full_config_type

New constraint: must call .get_qom_config_type() before .check().

This side effect makes me unsure sure about the "get" in the name.
Let's worry about that later.

> +
> +    def connect_doc(self, doc=None):
> +        super().connect_doc(doc)
> +        doc = doc or self.doc
> +        if doc:
> +            if self.config_type and self.config_type.is_implicit():
> +                self.config_type.connect_doc(doc)

Brain cramp.

> +
>      def visit(self, visitor):
>          super().visit(visitor)
>          visitor.visit_class(self)
> @@ -1236,6 +1271,11 @@ def _def_exprs(self, exprs):
>              else:
>                  assert False
>  
> +        classes = [c for c in self._entity_list
> +                   if isinstance(c,QAPISchemaClass)]
> +        for c in classes:
> +            self._def_entity(c.get_qom_config_type(self))
> +

Either use a generator expression

           classes = (c for c in self._entity_list if ... )
           for c in classes:

Or do it the old-fashioned way

           for ent in self._entity_list:
               if isinstance(ent, QAPISchemaClass):

>      def check(self):
>          for ent in self._entity_list:
>              ent.check(self)


