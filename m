Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A069622825C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 16:37:18 +0200 (CEST)
Received: from localhost ([::1]:38264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxtOP-0006UG-4i
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 10:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jxtMz-0004wh-A1
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:35:49 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33621
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jxtMs-0005jK-MU
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595342141;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Zxcdpy9SVwWaeIuPg11SUn4PcrcBl2DI2STLMLXqvgk=;
 b=io5ango3Iz5gNQxSQSh0eqXXC172pCOgerUex0KTahd8/aIUH5OHRT/QW0OGRkCB3f+33d
 eKnU8WMs59q3slWYciuMWeDLjhmWlGc0SbaTli2/EDK0gzz5OhYlMvAuVaMqcoNHup5d2O
 dlnHP3qLfb6nK5iFIUpHwTl+t32Y0Zo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-nHj1nXRKPAGpzk6E3gvDgg-1; Tue, 21 Jul 2020 10:35:39 -0400
X-MC-Unique: nHj1nXRKPAGpzk6E3gvDgg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 812AD91276
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 14:35:38 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9762C6FEE9;
 Tue, 21 Jul 2020 14:35:25 +0000 (UTC)
Date: Tue, 21 Jul 2020 15:35:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Subject: Re: [PATCH v5 02/10] object: qom module support
Message-ID: <20200721143522.GK843362@redhat.com>
References: <20200624131045.14512-1-kraxel@redhat.com>
 <20200624131045.14512-3-kraxel@redhat.com>
 <7himeimfnc.fsf@turbo.dinechin.lan>
MIME-Version: 1.0
In-Reply-To: <7himeimfnc.fsf@turbo.dinechin.lan>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 10:17:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 20, 2020 at 04:20:55PM +0200, Christophe de Dinechin wrote:
> 
> On 2020-06-24 at 15:10 CEST, Gerd Hoffmann wrote...
> > Little helper function to load modules on demand.  In most cases adding
> > module loading support for devices and other objects is just
> > s/object_class_by_name/module_object_class_by_name/ in the right spot.
> >
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  include/qom/object.h | 12 ++++++++++++
> >  qom/object.c         | 14 ++++++++++++++
> >  2 files changed, 26 insertions(+)
> >
> > diff --git a/include/qom/object.h b/include/qom/object.h
> > index 94a61ccc3fe8..51f188137f1f 100644
> > --- a/include/qom/object.h
> > +++ b/include/qom/object.h
> > @@ -994,6 +994,18 @@ bool object_class_is_abstract(ObjectClass *klass);
> >   */
> >  ObjectClass *object_class_by_name(const char *typename);
> >
> > +/**
> > + * module_object_class_by_name:
> > + * @typename: The QOM typename to obtain the class for.
> > + *
> > + * For objects which might be provided by a module.  Behaves like
> > + * object_class_by_name, but additionally tries to load the module
> > + * needed in case the class is not available.
> > + *
> > + * Returns: The class for @typename or %NULL if not found.
> > + */
> > +ObjectClass *module_object_class_by_name(const char *typename);
> > +
> >  void object_class_foreach(void (*fn)(ObjectClass *klass, void *opaque),
> >                            const char *implements_type, bool include_abstract,
> >                            void *opaque);
> > diff --git a/qom/object.c b/qom/object.c
> > index 6ece96bc2bfc..34daaf1280f5 100644
> > --- a/qom/object.c
> > +++ b/qom/object.c
> > @@ -985,6 +985,20 @@ ObjectClass *object_class_by_name(const char *typename)
> >      return type->class;
> >  }
> >
> > +ObjectClass *module_object_class_by_name(const char *typename)
> > +{
> > +    ObjectClass *oc;
> > +
> > +    oc = object_class_by_name(typename);
> > +#ifdef CONFIG_MODULES
> > +    if (!oc) {
> > +        module_load_qom_one(typename);
> > +        oc = object_class_by_name(typename);
> > +    }
> > +#endif
> 
> I'm wondering if there is any reason to only trigger the module load when
> you don't find the object class. You could simply call module_load_qom_one
> under #ifdef CONFIG_MODULES.
> 
> Performance wise, I don't think this makes much of a difference, and it
> simplifies the logical flow IMO.

I wouldn't make that assumption about performance - module_load_qom_one()
does alot of work, and there are places where object / class creation is
performance critical. We might not happen to trigger them now with the
current set of modules, but we can easily do so in future.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


