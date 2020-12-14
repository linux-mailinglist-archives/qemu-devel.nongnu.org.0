Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD5E2D9A55
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:55:58 +0100 (CET)
Received: from localhost ([::1]:40520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopGX-000157-Fl
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kop73-0000jq-Fq
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kop6x-0000V2-Gg
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607957160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U8vfVzdnL8BW97DZ4u9XTqZRLdeKVBToEKgCYhlyCdM=;
 b=JLs9/AmLysrJa4puJX5uVZcUfITEhTMzIr7J6FGsjwojAxY1pqWqnjHcAz6o2fwB7z9Bl4
 QDD0UjVFRZkTFWoG81S7j1rjX2P6eDYvPIF/7P5yZDi6TkW+xswwQHmsNFqkY9eDVoR9jC
 xW7gZ8khi5mYKG/ypoJehw7ymLvTkrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-8x9DoiZoMEyZ5PeiL_LzqQ-1; Mon, 14 Dec 2020 09:45:58 -0500
X-MC-Unique: 8x9DoiZoMEyZ5PeiL_LzqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A59BC107AD3F;
 Mon, 14 Dec 2020 14:45:57 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A87A70481;
 Mon, 14 Dec 2020 14:45:50 +0000 (UTC)
Date: Mon, 14 Dec 2020 15:45:49 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 19/32] qdev: Avoid using prop->name unnecessarily
Message-ID: <20201214154549.4b6eb6ea@redhat.com>
In-Reply-To: <20201211220529.2290218-20-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-20-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 Stefan Berger <stefanb@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 17:05:16 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> We already get the property name as argument to the property
> getter and setters, we don't need to use prop->name.  This will
> make it easier to remove the Property.name field in the future.
>=20
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> This is a new patch added in series v2
> ---
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  backends/tpm/tpm_util.c          |  2 +-
>  hw/core/qdev-properties-system.c | 14 +++++++-------
>  hw/core/qdev-properties.c        |  4 ++--
>  3 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
> index 3973105658..a5d997e7dc 100644
> --- a/backends/tpm/tpm_util.c
> +++ b/backends/tpm/tpm_util.c
> @@ -63,7 +63,7 @@ static void set_tpm(Object *obj, Visitor *v, const char=
 *name, void *opaque,
>      s =3D qemu_find_tpm_be(str);
>      if (s =3D=3D NULL) {
>          error_setg(errp, "Property '%s.%s' can't find value '%s'",
> -                   object_get_typename(obj), prop->name, str);
> +                   object_get_typename(obj), name, str);
>      } else if (tpm_backend_init(s, TPM_IF(obj), errp) =3D=3D 0) {
>          *be =3D s; /* weak reference, avoid cyclic ref */
>      }
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-s=
ystem.c
> index 9cf9bcb39d..42529c3b65 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -141,7 +141,7 @@ static void set_drive_helper(Object *obj, Visitor *v,=
 const char *name,
>      }
>      if (!blk) {
>          error_setg(errp, "Property '%s.%s' can't find value '%s'",
> -                   object_get_typename(OBJECT(dev)), prop->name, str);
> +                   object_get_typename(OBJECT(dev)), name, str);
>          goto fail;
>      }
>      if (blk_attach_dev(blk, dev) < 0) {
> @@ -262,10 +262,10 @@ static void set_chr(Object *obj, Visitor *v, const =
char *name, void *opaque,
>      s =3D qemu_chr_find(str);
>      if (s =3D=3D NULL) {
>          error_setg(errp, "Property '%s.%s' can't find value '%s'",
> -                   object_get_typename(obj), prop->name, str);
> +                   object_get_typename(obj), name, str);
>      } else if (!qemu_chr_fe_init(be, s, errp)) {
>          error_prepend(errp, "Property '%s.%s' can't take value '%s': ",
> -                      object_get_typename(obj), prop->name, str);
> +                      object_get_typename(obj), name, str);
>      }
>      g_free(str);
>  }
> @@ -966,7 +966,7 @@ static void get_prop_pcielinkspeed(Object *obj, Visit=
or *v, const char *name,
>          abort();
>      }
> =20
> -    visit_type_enum(v, prop->name, &speed, prop->info->enum_table, errp)=
;
> +    visit_type_enum(v, name, &speed, prop->info->enum_table, errp);
>  }
> =20
>  static void set_prop_pcielinkspeed(Object *obj, Visitor *v, const char *=
name,
> @@ -982,7 +982,7 @@ static void set_prop_pcielinkspeed(Object *obj, Visit=
or *v, const char *name,
>          return;
>      }
> =20
> -    if (!visit_type_enum(v, prop->name, &speed, prop->info->enum_table,
> +    if (!visit_type_enum(v, name, &speed, prop->info->enum_table,
>                           errp)) {
>          return;
>      }
> @@ -1051,7 +1051,7 @@ static void get_prop_pcielinkwidth(Object *obj, Vis=
itor *v, const char *name,
>          abort();
>      }
> =20
> -    visit_type_enum(v, prop->name, &width, prop->info->enum_table, errp)=
;
> +    visit_type_enum(v, name, &width, prop->info->enum_table, errp);
>  }
> =20
>  static void set_prop_pcielinkwidth(Object *obj, Visitor *v, const char *=
name,
> @@ -1067,7 +1067,7 @@ static void set_prop_pcielinkwidth(Object *obj, Vis=
itor *v, const char *name,
>          return;
>      }
> =20
> -    if (!visit_type_enum(v, prop->name, &width, prop->info->enum_table,
> +    if (!visit_type_enum(v, name, &width, prop->info->enum_table,
>                           errp)) {
>          return;
>      }
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 7495798a66..50734a1cd4 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -50,7 +50,7 @@ void qdev_propinfo_get_enum(Object *obj, Visitor *v, co=
nst char *name,
>      Property *prop =3D opaque;
>      int *ptr =3D qdev_get_prop_ptr(obj, prop);
> =20
> -    visit_type_enum(v, prop->name, ptr, prop->info->enum_table, errp);
> +    visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
>  }
> =20
>  void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
> @@ -65,7 +65,7 @@ void qdev_propinfo_set_enum(Object *obj, Visitor *v, co=
nst char *name,
>          return;
>      }
> =20
> -    visit_type_enum(v, prop->name, ptr, prop->info->enum_table, errp);
> +    visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
>  }
> =20
>  void qdev_propinfo_set_default_value_enum(ObjectProperty *op,


