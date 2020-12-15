Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01FB2DAEFF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:33:15 +0100 (CET)
Received: from localhost ([::1]:45062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBO5-0001Hu-DQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBHL-0003BD-L2
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:26:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBHJ-0003GR-PW
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:26:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608042372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmOCg7oRaepCkFbjHBWY53tEpf8qtXTi/NS4wG+dciY=;
 b=CJskXy3rZRC+lKYhlkRJe/gvqkyFAnOdYVmsTO14FNrRqHmFdkYLAb/K0IjhpcZavqdNhI
 A0M7TXiPeHmHKj+1gmtqHLudEdzSn/DntE1xFvDi6gT/mfA9lfGHRzm44izVLop4m+qPmf
 QyWF784bD29swZIKFA3EylIR2LkeZpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-c8U-f1OTMce9ZGWHpBXDlw-1; Tue, 15 Dec 2020 09:26:11 -0500
X-MC-Unique: c8U-f1OTMce9ZGWHpBXDlw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CF97107ACE4;
 Tue, 15 Dec 2020 14:26:10 +0000 (UTC)
Received: from localhost (ovpn-113-127.ams2.redhat.com [10.36.113.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E810119C44;
 Tue, 15 Dec 2020 14:26:00 +0000 (UTC)
Date: Tue, 15 Dec 2020 15:25:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 25/32] qdev: Make qdev_class_add_property() more
 flexible
Message-ID: <20201215152559.5126667d@redhat.com>
In-Reply-To: <20201214182810.GN1289986@habkost.net>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-26-ehabkost@redhat.com>
 <20201214160059.001c303e@redhat.com>
 <20201214182810.GN1289986@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 13:28:10 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Mon, Dec 14, 2020 at 04:00:59PM +0100, Igor Mammedov wrote:
> > On Fri, 11 Dec 2020 17:05:22 -0500
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> >  =20
> > > Support Property.set_default and PropertyInfo.description even if
> > > PropertyInfo.create is set.
> > >=20
> > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > ---
> > > Changes v1 -> v2:
> > > * Patch redone after changes in the previous patches in the
> > >   series
> > > ---
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> > > Cc: Eduardo Habkost <ehabkost@redhat.com>
> > > Cc: qemu-devel@nongnu.org
> > > ---
> > >  hw/core/qdev-properties.c | 17 +++++++++--------
> > >  1 file changed, 9 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> > > index 3bb05e7d0d..fcda0c8f4b 100644
> > > --- a/hw/core/qdev-properties.c
> > > +++ b/hw/core/qdev-properties.c
> > > @@ -863,24 +863,25 @@ static void qdev_class_add_property(DeviceClass=
 *klass, const char *name,
> > >                                      Property *prop)
> > >  {
> > >      ObjectClass *oc =3D OBJECT_CLASS(klass);
> > > +    ObjectProperty *op;
> > > =20
> > >      if (prop->info->create) {
> > > -        prop->info->create(oc, name, prop);
> > > +        op =3D prop->info->create(oc, name, prop);
> > >      } else {
> > > -        ObjectProperty *op;
> > > -
> > >          op =3D object_class_property_add(oc,
> > >                                         name, prop->info->name,
> > >                                         field_prop_getter(prop->info)=
,
> > >                                         field_prop_setter(prop->info)=
,
> > >                                         prop->info->release,
> > >                                         prop);
> > > -        if (prop->set_default) {
> > > -            prop->info->set_default_value(op, prop);
> > > -        }
> > >      }
> > > -    object_class_property_set_description(oc, name,
> > > -                                          prop->info->description);
> > > +    if (prop->set_default) {
> > > +        prop->info->set_default_value(op, prop);
> > > +    } =20
> >  =20
> > > +    if (prop->info->description) { =20
> > before that, null description wasn't allow, why relax rule now? =20
>=20
> NULL description was already allowed before, because
> object_class_property_set_description(..., NULL) works.
>=20
> This means the conditional I've added above is completely
> unnecessary.  I will fix this in the next version.  Thanks!

ok, either way

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

>=20
> >  =20
> > > +        object_class_property_set_description(oc, name,
> > > +                                              prop->info->descriptio=
n);
> > > +    }
> > >  }
> > > =20
> > >  /** =20
> >  =20
>=20


