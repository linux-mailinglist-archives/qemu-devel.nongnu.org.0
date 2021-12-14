Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4CD473FF0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 10:55:40 +0100 (CET)
Received: from localhost ([::1]:48264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx4X5-0000rg-Ag
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 04:55:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mx4V8-00009m-1G
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 04:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mx4V4-0006az-DI
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 04:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639475612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/EmaSiaCNHG0X8/g/WD+kmfclgJ6oYs70QpHdQMcQlw=;
 b=QaGNAresv5G8scG+iNNWsiFBW3l2QAjehoSwbtijUP1JiQwecAaAEGsuh6Ica/GfpPi1Vw
 1ajaC6Q7jloYPxXHowUzumcveUrzjTUgQtlIDeijJIwigzuigu1DShL67MP4L4Sq4QZ+8T
 0Qqkb3nkTtg++wTE0ThSoqEmGJXCQuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-2a9UxgjlNRu-Bx2m3XjyAA-1; Tue, 14 Dec 2021 04:53:26 -0500
X-MC-Unique: 2a9UxgjlNRu-Bx2m3XjyAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6805910247A7
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 09:53:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 604B310016F4;
 Tue, 14 Dec 2021 09:52:58 +0000 (UTC)
Date: Tue, 14 Dec 2021 10:52:56 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH 02/12] qom: Create object_configure()
Message-ID: <YbhpeGHYRX8ZNUBd@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <20211103173002.209906-3-kwolf@redhat.com>
 <8735nm6gkw.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <8735nm6gkw.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 23.11.2021 um 16:23 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > This renames object_set_properties_from_qdict() to object_configure()
> > and removes the QDict parameter from it: With visit_next_struct_member()
> > it can set all properties without looking at the keys of the QDict.
> >
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  qom/object_interfaces.c | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> > index 3b61c195c5..f9f5608194 100644
> > --- a/qom/object_interfaces.c
> > +++ b/qom/object_interfaces.c
> > @@ -42,16 +42,15 @@ bool user_creatable_can_be_deleted(UserCreatable *uc)
> >      }
> >  }
> >  
> > -static void object_set_properties_from_qdict(Object *obj, const QDict *qdict,
> > -                                             Visitor *v, Error **errp)
> > +static void object_configure(Object *obj, Visitor *v, Error **errp)
> >  {
> > -    const QDictEntry *e;
> > +    const char *key;
> >  
> >      if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
> >          return;
> >      }
> > -    for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
> > -        if (!object_property_set(obj, e->key, v, errp)) {
> > +    while ((key = visit_next_struct_member(v))) {
> > +        if (!object_property_set(obj, key, v, errp)) {
> >              goto out;
> >          }
> >      }
> > @@ -69,7 +68,7 @@ void object_set_properties_from_keyval(Object *obj, const QDict *qdict,
> >      } else {
> >          v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
> >      }
> > -    object_set_properties_from_qdict(obj, qdict, v, errp);
> > +    object_configure(obj, v, errp);
> >      visit_free(v);
> >  }
> >  
> > @@ -108,7 +107,7 @@ Object *user_creatable_add_type(const char *type, const char *id,
> >  
> >      assert(qdict);
> 
> This is the only remaining use of parameter @qdict.  Let's drop it.

Indeed, very good. I've never liked this interface that needs a QDict in
addition to the visitor.

> >      obj = object_new(type);
> > -    object_set_properties_from_qdict(obj, qdict, v, &local_err);
> > +    object_configure(obj, v, &local_err);
> >      if (local_err) {
> >          goto out;
> >      }
> 
> Brief recap how configuration data flows trough QMP object-add to QOM:
> 
> * QMP object-add is fully typed: union ObjectOptions.  QMP core parses
>   input via QDict to ObjectOptions (JSON parser + QObject input
>   visitor), and passes that to qmp_object_add().
> 
> * qmp_object_add() passes it on to user_creatable_add_qapi().
> 
>   Aside: getting rid of the wrapper would be as easy as renaming
>   user_creatable_add_qapi() to qmp_object_add().
> 
> * user_creatable_add_qapi() converts right back to QDict (QObject output
>   visitor).  It extracts the non-properties "qom-type" and "id", and
>   passes the properties (wrapped in a QObject input visitor) to
>   user_creatable_add_type().
> 
> * user_creatable_add_type() feeds the properties to object_configure(),
>   formerly object_set_properties_from_qdict().
> 
> Your patch simplifies one detail of the last step.  Small
> simplifications are welcome, too.
> 
> The visitor ping-pong remains: input -> output -> input.
> 
> We play visitor ping-pong because we reduce the problem "for each member
> of ObjectOptions: set property" to the solved problem "set properties
> for an input visitor".
> 
> Straight solution of the problem: a QOM property output visitor.

I'm not sure how that should work? You can't drive a visit from both
sides and QOM properties already take an input visitor. The only way I
see to make this work is converting to QObjects and creating input
visitors internally in the QOM property output visitor, which would kind
of defeat the purpose.

What could in theory be done is passing a Visitor to qmp_object_add()
instead of ObjectOptions (in the long run, we probably don't want a big
union of all existing QOM types anyway). But if directly pass this on to
QOM, we lose all of the QAPI validation, which we don't want either.

Kevin


