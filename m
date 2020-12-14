Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71B2D9F0E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:31:15 +0100 (CET)
Received: from localhost ([::1]:40300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koscr-000549-Sv
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kosa9-0003S1-F4
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:28:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kosa4-00061O-Dm
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607970499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KizA/iBWX42gg97FYqTJfpqnkL8ATjTBN5zq+DWT9cI=;
 b=IonkyN7ZgEbgzMYvL6RKSHxfMzNCZlZZW+D2Dw5+t2FYayuaMjdSlRUn0TCiZwH7U70Laa
 +pdBJwjThhMZdZ4L4a5EruyME70Otu3pMGEf/1qtAYuOI5/q8fvnOCke3E+CQ1aChSzMsn
 yjT9PxPfvokyqgym72p5t2GWpB47yqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-zQzahIjxMKK8f5ljAPFLtA-1; Mon, 14 Dec 2020 13:28:17 -0500
X-MC-Unique: zQzahIjxMKK8f5ljAPFLtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4200C801817;
 Mon, 14 Dec 2020 18:28:16 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3357E6267D;
 Mon, 14 Dec 2020 18:28:12 +0000 (UTC)
Date: Mon, 14 Dec 2020 13:28:10 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 25/32] qdev: Make qdev_class_add_property() more
 flexible
Message-ID: <20201214182810.GN1289986@habkost.net>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-26-ehabkost@redhat.com>
 <20201214160059.001c303e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214160059.001c303e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 04:00:59PM +0100, Igor Mammedov wrote:
> On Fri, 11 Dec 2020 17:05:22 -0500
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > Support Property.set_default and PropertyInfo.description even if
> > PropertyInfo.create is set.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > Changes v1 -> v2:
> > * Patch redone after changes in the previous patches in the
> >   series
> > ---
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: "Daniel P. Berrangé" <berrange@redhat.com>
> > Cc: Eduardo Habkost <ehabkost@redhat.com>
> > Cc: qemu-devel@nongnu.org
> > ---
> >  hw/core/qdev-properties.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> > index 3bb05e7d0d..fcda0c8f4b 100644
> > --- a/hw/core/qdev-properties.c
> > +++ b/hw/core/qdev-properties.c
> > @@ -863,24 +863,25 @@ static void qdev_class_add_property(DeviceClass *klass, const char *name,
> >                                      Property *prop)
> >  {
> >      ObjectClass *oc = OBJECT_CLASS(klass);
> > +    ObjectProperty *op;
> >  
> >      if (prop->info->create) {
> > -        prop->info->create(oc, name, prop);
> > +        op = prop->info->create(oc, name, prop);
> >      } else {
> > -        ObjectProperty *op;
> > -
> >          op = object_class_property_add(oc,
> >                                         name, prop->info->name,
> >                                         field_prop_getter(prop->info),
> >                                         field_prop_setter(prop->info),
> >                                         prop->info->release,
> >                                         prop);
> > -        if (prop->set_default) {
> > -            prop->info->set_default_value(op, prop);
> > -        }
> >      }
> > -    object_class_property_set_description(oc, name,
> > -                                          prop->info->description);
> > +    if (prop->set_default) {
> > +        prop->info->set_default_value(op, prop);
> > +    }
> 
> > +    if (prop->info->description) {
> before that, null description wasn't allow, why relax rule now?

NULL description was already allowed before, because
object_class_property_set_description(..., NULL) works.

This means the conditional I've added above is completely
unnecessary.  I will fix this in the next version.  Thanks!

> 
> > +        object_class_property_set_description(oc, name,
> > +                                              prop->info->description);
> > +    }
> >  }
> >  
> >  /**
> 

-- 
Eduardo


