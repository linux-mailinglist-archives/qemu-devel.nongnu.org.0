Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CE2DAF40
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:45:29 +0100 (CET)
Received: from localhost ([::1]:53308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBZw-0007rk-Ip
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBXM-00067g-8P
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:42:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBXK-0000Pz-IU
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608043363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tI78NRd5g9+ue6UNhUf/+xmxagsbOtGMH3ofCSLYcbE=;
 b=JMezzw8w67D08MWh+hAYfzm1HqMQ6Efna/y4ICg4oD7jlt4Aw4ii2a2o15ZryjNr5dFlDG
 FAegOAX0JrCwhowerWhLbsUgLVz8jd0HjIcfAHRkNuSu05Vpb4+7U/fR1CJWyzdjQuSQCt
 j0lLyT0F65p1IPgIAjcu+hJgk3w2avo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-4KyddcdDPjKqHdtXMvKRHQ-1; Tue, 15 Dec 2020 09:42:34 -0500
X-MC-Unique: 4KyddcdDPjKqHdtXMvKRHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6D01802B60;
 Tue, 15 Dec 2020 14:42:32 +0000 (UTC)
Received: from localhost (ovpn-113-127.ams2.redhat.com [10.36.113.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 775E65D9E3;
 Tue, 15 Dec 2020 14:42:27 +0000 (UTC)
Date: Tue, 15 Dec 2020 15:42:26 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 22/32] qdev: Wrap getters and setters in separate
 helpers
Message-ID: <20201215154226.1237c00c@redhat.com>
In-Reply-To: <20201211220529.2290218-23-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-23-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 17:05:19 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> We'll add extra code to the qdev property getters and setters, so
> add wrapper functions where additional actions can be performed.
>=20
> The new functions have a "field_prop_" prefix instead of "qdev_"
> because the code will eventually be moved outside
> qdev-properties.c, to common QOM code.
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Changes v1 -> v2:
> * Redone after changes in previous patches in the series
> * Renamed functions from static_prop_* to field_prop_*
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  hw/core/qdev-properties.c | 44 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 40 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index c68a20695d..b924f13d58 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -44,6 +44,40 @@ void *qdev_get_prop_ptr(Object *obj, Property *prop)
>      return ptr;
>  }
> =20
> +static void field_prop_get(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    Property *prop =3D opaque;
> +    return prop->info->get(obj, v, name, opaque, errp);
> +}
> +
> +/**
> + * field_prop_getter: Return getter function to be used for property
> + *
> + * Return value can be NULL if @info has no getter function.
> + */
> +static ObjectPropertyAccessor *field_prop_getter(const PropertyInfo *inf=
o)
> +{
> +    return info->get ? field_prop_get : NULL;
> +}
> +
> +static void field_prop_set(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    Property *prop =3D opaque;
> +    return prop->info->set(obj, v, name, opaque, errp);
> +}
> +
> +/**
> + * field_prop_setter: Return setter function to be used for property
> + *
> + * Return value can be NULL if @info has not setter function.
> + */
> +static ObjectPropertyAccessor *field_prop_setter(const PropertyInfo *inf=
o)
> +{
> +    return info->set ? field_prop_set : NULL;
> +}
> +
>  void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
>                              void *opaque, Error **errp)
>  {
> @@ -630,8 +664,8 @@ static void set_prop_arraylen(Object *obj, Visitor *v=
, const char *name,
>          assert(qdev_get_prop_ptr(obj, &arrayprop->prop) =3D=3D eltptr);
>          object_property_add(obj, propname,
>                              arrayprop->prop.info->name,
> -                            arrayprop->prop.info->get,
> -                            arrayprop->prop.info->set,
> +                            field_prop_getter(arrayprop->prop.info),
> +                            field_prop_setter(arrayprop->prop.info),
>                              array_element_release,
>                              arrayprop);
>      }
> @@ -873,7 +907,8 @@ void qdev_property_add_static(DeviceState *dev, Prope=
rty *prop)
>      assert(!prop->info->create);
> =20
>      op =3D object_property_add(obj, prop->name, prop->info->name,
> -                             prop->info->get, prop->info->set,
> +                             field_prop_getter(prop->info),
> +                             field_prop_setter(prop->info),
>                               prop->info->release,
>                               prop);
> =20
> @@ -900,7 +935,8 @@ static void qdev_class_add_property(DeviceClass *klas=
s, const char *name,
> =20
>          op =3D object_class_property_add(oc,
>                                         name, prop->info->name,
> -                                       prop->info->get, prop->info->set,
> +                                       field_prop_getter(prop->info),
> +                                       field_prop_setter(prop->info),
>                                         prop->info->release,
>                                         prop);
>          if (prop->set_default) {


