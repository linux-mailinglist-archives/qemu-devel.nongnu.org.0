Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6512D9A28
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:42:08 +0100 (CET)
Received: from localhost ([::1]:34652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kop39-0003Js-H4
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1koogw-0004QL-58
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:19:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1koogt-0005fd-2u
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607955545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YMflOukFeyw2kTFEqCSCasXQYESma7y7P+MHaOvOYEM=;
 b=QboAYibwnMvWcXxbtrlA2uBmZfrp3OjwULGckwAEu3RY9m2kjQV8zVZUNcoKRNoz34M59f
 IOSEi0kLWgtKgNu+mBXfTCTQ9WZ8sFqbbgzFPwz6Md4ZHMM19VOeatW5DMoSMgGPBG1/qM
 D+QdLmKIlrUP4cYfQ7QdzFj3Dh1J56U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-J2awQjXNOLGZZdaSttSTWw-1; Mon, 14 Dec 2020 09:19:03 -0500
X-MC-Unique: J2awQjXNOLGZZdaSttSTWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5E3159;
 Mon, 14 Dec 2020 14:19:02 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C8A61002388;
 Mon, 14 Dec 2020 14:18:56 +0000 (UTC)
Date: Mon, 14 Dec 2020 15:18:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 14/32] qdev: Move UUID property to
 qdev-properties-system.c
Message-ID: <20201214151854.0bb5af1e@redhat.com>
In-Reply-To: <20201211220529.2290218-15-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-15-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On Fri, 11 Dec 2020 17:05:11 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Only softmmu code uses DEFINE_PROP_UUID, and it currently depends
> on error_set_from_qdev_prop_error().  Move it to
> qdev-properties-system.c to get out of our way when refactoring
> the qdev property system.
>=20
> We can eventually move it back to the core property system later,
> after removing usage of error_set_from_qdev_prop_error().
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> This is a new patch added in series v2
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  hw/core/qdev-properties-system.c | 57 ++++++++++++++++++++++++++++++++
>  hw/core/qdev-properties.c        | 57 --------------------------------
>  2 files changed, 57 insertions(+), 57 deletions(-)
>=20
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-s=
ystem.c
> index 5796ed2619..7a9a1d6404 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -21,6 +21,7 @@
>  #include "qemu/ctype.h"
>  #include "qemu/cutils.h"
>  #include "qemu/units.h"
> +#include "qemu/uuid.h"
>  #include "qemu/error-report.h"
>  #include "qdev-prop-internal.h"
> =20
> @@ -1106,3 +1107,59 @@ const PropertyInfo qdev_prop_pcie_link_width =3D {
>      .set =3D set_prop_pcielinkwidth,
>      .set_default_value =3D qdev_propinfo_set_default_value_enum,
>  };
> +
> +/* --- UUID --- */
> +
> +static void get_uuid(Object *obj, Visitor *v, const char *name, void *op=
aque,
> +                     Error **errp)
> +{
> +    Property *prop =3D opaque;
> +    QemuUUID *uuid =3D qdev_get_prop_ptr(obj, prop);
> +    char buffer[UUID_FMT_LEN + 1];
> +    char *p =3D buffer;
> +
> +    qemu_uuid_unparse(uuid, buffer);
> +
> +    visit_type_str(v, name, &p, errp);
> +}
> +
> +#define UUID_VALUE_AUTO        "auto"
> +
> +static void set_uuid(Object *obj, Visitor *v, const char *name, void *op=
aque,
> +                    Error **errp)
> +{
> +    DeviceState *dev =3D DEVICE(obj);
> +    Property *prop =3D opaque;
> +    QemuUUID *uuid =3D qdev_get_prop_ptr(obj, prop);
> +    char *str;
> +
> +    if (dev->realized) {
> +        qdev_prop_set_after_realize(dev, name, errp);
> +        return;
> +    }
> +
> +    if (!visit_type_str(v, name, &str, errp)) {
> +        return;
> +    }
> +
> +    if (!strcmp(str, UUID_VALUE_AUTO)) {
> +        qemu_uuid_generate(uuid);
> +    } else if (qemu_uuid_parse(str, uuid) < 0) {
> +        error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
> +    }
> +    g_free(str);
> +}
> +
> +static void set_default_uuid_auto(ObjectProperty *op, const Property *pr=
op)
> +{
> +    object_property_set_default_str(op, UUID_VALUE_AUTO);
> +}
> +
> +const PropertyInfo qdev_prop_uuid =3D {
> +    .name  =3D "str",
> +    .description =3D "UUID (aka GUID) or \"" UUID_VALUE_AUTO
> +        "\" for random value (default)",
> +    .get   =3D get_uuid,
> +    .set   =3D set_uuid,
> +    .set_default_value =3D set_default_uuid_auto,
> +};
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 765e916c23..a2eaa43831 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -6,7 +6,6 @@
>  #include "qemu/ctype.h"
>  #include "qemu/error-report.h"
>  #include "qapi/visitor.h"
> -#include "qemu/uuid.h"
>  #include "qemu/units.h"
>  #include "qemu/cutils.h"
>  #include "qdev-prop-internal.h"
> @@ -544,62 +543,6 @@ const PropertyInfo qdev_prop_size32 =3D {
>      .set_default_value =3D qdev_propinfo_set_default_value_uint,
>  };
> =20
> -/* --- UUID --- */
> -
> -static void get_uuid(Object *obj, Visitor *v, const char *name, void *op=
aque,
> -                     Error **errp)
> -{
> -    Property *prop =3D opaque;
> -    QemuUUID *uuid =3D qdev_get_prop_ptr(obj, prop);
> -    char buffer[UUID_FMT_LEN + 1];
> -    char *p =3D buffer;
> -
> -    qemu_uuid_unparse(uuid, buffer);
> -
> -    visit_type_str(v, name, &p, errp);
> -}
> -
> -#define UUID_VALUE_AUTO        "auto"
> -
> -static void set_uuid(Object *obj, Visitor *v, const char *name, void *op=
aque,
> -                    Error **errp)
> -{
> -    DeviceState *dev =3D DEVICE(obj);
> -    Property *prop =3D opaque;
> -    QemuUUID *uuid =3D qdev_get_prop_ptr(obj, prop);
> -    char *str;
> -
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
> -    if (!visit_type_str(v, name, &str, errp)) {
> -        return;
> -    }
> -
> -    if (!strcmp(str, UUID_VALUE_AUTO)) {
> -        qemu_uuid_generate(uuid);
> -    } else if (qemu_uuid_parse(str, uuid) < 0) {
> -        error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
> -    }
> -    g_free(str);
> -}
> -
> -static void set_default_uuid_auto(ObjectProperty *op, const Property *pr=
op)
> -{
> -    object_property_set_default_str(op, UUID_VALUE_AUTO);
> -}
> -
> -const PropertyInfo qdev_prop_uuid =3D {
> -    .name  =3D "str",
> -    .description =3D "UUID (aka GUID) or \"" UUID_VALUE_AUTO
> -        "\" for random value (default)",
> -    .get   =3D get_uuid,
> -    .set   =3D set_uuid,
> -    .set_default_value =3D set_default_uuid_auto,
> -};
> -
>  /* --- support for array properties --- */
> =20
>  /* Used as an opaque for the object properties we add for each


