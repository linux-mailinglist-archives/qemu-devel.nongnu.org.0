Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556412DAF07
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:36:52 +0100 (CET)
Received: from localhost ([::1]:55224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBRb-0005WU-AP
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBOd-00039h-0M
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:33:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBOY-0005hl-PW
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608042818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0fLe/JmXLw+t8cWHjGk0IWhJ5uKv8GymNiHB6nxBnmQ=;
 b=I+2971M4MetGXpLh7/9fAAqM4DTlG76wZ5LxYzGwxGQb9BJstJRsot6No7HETjYE+VFMBL
 XSa6efC3tQ4+WJNvszLr7ycmrddxAvsDtA3RbsIeSxF60DMbcZhgBx+0LzwB0IAFmuImg7
 +MvHq85d7PaggRePNDsQ4uUBH/xOw6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-MwJ8I2K6PrqYu0xlsWwklA-1; Tue, 15 Dec 2020 09:33:35 -0500
X-MC-Unique: MwJ8I2K6PrqYu0xlsWwklA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 813C6800D53;
 Tue, 15 Dec 2020 14:33:34 +0000 (UTC)
Received: from localhost (ovpn-113-127.ams2.redhat.com [10.36.113.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE8A2100164C;
 Tue, 15 Dec 2020 14:33:28 +0000 (UTC)
Date: Tue, 15 Dec 2020 15:33:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 26/32] qdev: Separate generic and device-specific
 property registration
Message-ID: <20201215153327.29f1664a@redhat.com>
In-Reply-To: <20201211220529.2290218-27-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-27-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 17:05:23 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> qdev_class_add_property() and qdev_property_add_static() will
> have code that's specific for device types.
>=20
> object_class_property_add_field_static() and
> object_property_add_field() will be generic and part of the QOM
> field property API.  Note that the new functions have a `name`
> parameter because the plan is to eventually get rid of the
> Property.name field.
>=20
> The declarations for the new functions are being added to
> qdev-properties-internal.h, but they will be moved to a QOM
> header later.
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v2 -> v3:
> * Re-added array-based array registration function, named
>   as object_class_add_field_properties()
> * Renamed object_class_property_add_field() to
>   object_class_property_add_field_static(), to indicate that
>   the function expect the Property argument to have static life
>   time.
> * Keep all new functions as internal API by now,
>   until we decide what's going to be the preferred API for
>   registering class field properties.
>=20
> Changes v1 -> v2:
> * Patch redone after changes in previous patches in the series
> * Rename new functions to object*_property_add_field()
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  hw/core/qdev-prop-internal.h | 42 ++++++++++++++++++++++++++++++++++++
>  hw/core/qdev-properties.c    | 37 ++++++++++++++++++++++++-------
>  2 files changed, 71 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/core/qdev-prop-internal.h b/hw/core/qdev-prop-internal.h
> index d7b77844fe..6f17ddf271 100644
> --- a/hw/core/qdev-prop-internal.h
> +++ b/hw/core/qdev-prop-internal.h
> @@ -25,4 +25,46 @@ void qdev_propinfo_get_int32(Object *obj, Visitor *v, =
const char *name,
>  void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
>                                void *opaque, Error **errp);
> =20
> +/**
> + * object_property_add_field: Add a field property to an object instance
> + * @obj: object instance
> + * @name: property name
> + * @prop: property definition
> + *
> + * This function should not be used in new code.  Please add class prope=
rties
> + * instead, using object_class_add_field().
> + */
> +ObjectProperty *
> +object_property_add_field(Object *obj, const char *name,
> +                          Property *prop);
> +
> +/**
> + * object_class_property_add_field_static: Add a field property to objec=
t class
> + * @oc: object class
> + * @name: property name
> + * @prop: property definition
> + *
> + * Add a field property to an object class.  A field property is
> + * a property that will change a field at a specific offset of the
> + * object instance struct.
> + *
> + * *@prop must have static life time.
> + */
> +ObjectProperty *
> +object_class_property_add_field_static(ObjectClass *oc, const char *name=
,
> +                                       Property *prop);
> +
> +/**
> + * object_class_add_field_properties: Add field properties from array to=
 a class
> + * @oc: object class
> + * @props: array of property definitions
> + *
> + * Register an array of field properties to a class, using
> + * object_class_property_add_field_static() for each array element.
> + *
> + * The array at @props must end with DEFINE_PROP_END_OF_LIST(), and
> + * must have static life time.
> + */
> +void object_class_add_field_properties(ObjectClass *oc, Property *props)=
;
since it uses object_class_property_add_field_static() may be add _static s=
uffix here as well?

> +
>  #endif
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index fcda0c8f4b..8436b60ec4 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -835,20 +835,21 @@ const PropertyInfo qdev_prop_link =3D {
>      .create =3D create_link_property,
>  };
> =20
> -void qdev_property_add_static(DeviceState *dev, Property *prop)
> +ObjectProperty *
> +object_property_add_field(Object *obj, const char *name,
> +                          Property *prop)
>  {
> -    Object *obj =3D OBJECT(dev);
>      ObjectProperty *op;
> =20
>      assert(!prop->info->create);
> =20
> -    op =3D object_property_add(obj, prop->name, prop->info->name,
> +    op =3D object_property_add(obj, name, prop->info->name,
>                               field_prop_getter(prop->info),
>                               field_prop_setter(prop->info),
>                               prop->info->release,
>                               prop);
> =20
> -    object_property_set_description(obj, prop->name,
> +    object_property_set_description(obj, name,
>                                      prop->info->description);
> =20
>      if (prop->set_default) {
> @@ -857,12 +858,14 @@ void qdev_property_add_static(DeviceState *dev, Pro=
perty *prop)
>              op->init(obj, op);
>          }
>      }
> +
> +    return op;
>  }
> =20
> -static void qdev_class_add_property(DeviceClass *klass, const char *name=
,
> -                                    Property *prop)
> +ObjectProperty *
> +object_class_property_add_field_static(ObjectClass *oc, const char *name=
,
> +                                       Property *prop)
>  {
> -    ObjectClass *oc =3D OBJECT_CLASS(klass);
>      ObjectProperty *op;
> =20
>      if (prop->info->create) {
> @@ -882,6 +885,22 @@ static void qdev_class_add_property(DeviceClass *kla=
ss, const char *name,
>          object_class_property_set_description(oc, name,
>                                                prop->info->description);
>      }
> +    return op;
> +}
> +
> +void object_class_add_field_properties(ObjectClass *oc, Property *props)
> +{
> +    Property *prop;
> +
> +    for (prop =3D props; prop && prop->name; prop++) {
> +        object_class_property_add_field_static(oc, prop->name, prop);
> +    }
> +}
> +
> +
> +void qdev_property_add_static(DeviceState *dev, Property *prop)
> +{
> +    object_property_add_field(OBJECT(dev), prop->name, prop);
>  }
> =20
>  /**
> @@ -932,13 +951,15 @@ static void qdev_class_add_legacy_property(DeviceCl=
ass *dc, Property *prop)
> =20
>  void device_class_set_props(DeviceClass *dc, Property *props)
>  {
> +    ObjectClass *oc =3D OBJECT_CLASS(dc);
>      Property *prop;
> =20
>      dc->props_ =3D props;
>      for (prop =3D props; prop && prop->name; prop++) {
>          qdev_class_add_legacy_property(dc, prop);
> -        qdev_class_add_property(dc, prop->name, prop);
>      }
> +
> +    object_class_add_field_properties(oc, props);
>  }
> =20
>  void qdev_alias_all_properties(DeviceState *target, Object *source)


