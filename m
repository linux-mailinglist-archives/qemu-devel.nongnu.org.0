Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855CB2D9A50
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:53:41 +0100 (CET)
Received: from localhost ([::1]:34894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopEK-00078n-HQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kop5l-0007RK-Nc
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:44:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kop5i-0008WC-IJ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607957085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTJT/vaqbXB2ScRLzOcF6X/Y6G4FazqWyDAaC1Zyt0g=;
 b=HrOaX1YgxUpJ9KGx3RFX65uVSXGDmD6uiIR5MwdFodt3TzuHVIb7S/8pFRlcr5hXgUPUaK
 fo+17XFvzFd3s1iCY4S9BZjS2dZazYQ0mprE6b3csdzjz4BzmQX1+vuJjbzFZJ3CVxuHAG
 T6hzjLcHa9FYgcssW9rAsJ/MLq2KNDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-mmtBIeI7OVuzCa4zaXdFiw-1; Mon, 14 Dec 2020 09:44:44 -0500
X-MC-Unique: mmtBIeI7OVuzCa4zaXdFiw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE5FE1005504;
 Mon, 14 Dec 2020 14:44:42 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BC1C60BE2;
 Mon, 14 Dec 2020 14:44:32 +0000 (UTC)
Date: Mon, 14 Dec 2020 15:44:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 18/32] qdev: Get just property name at
 error_set_from_qdev_prop_error()
Message-ID: <20201214154430.71cd1e04@redhat.com>
In-Reply-To: <20201211220529.2290218-19-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-19-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 17:05:15 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Replace `Property *prop` parameter with `char *name`, to reduce
> dependency of getter and setter functions on the Property struct
> (which will be changed in following patches).
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> This is a new patch added in series v2
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  include/hw/qdev-properties.h     |  2 +-
>  hw/core/qdev-properties-system.c | 12 ++++++------
>  hw/core/qdev-properties.c        |  8 ++++----
>  hw/s390x/css.c                   |  2 +-
>  4 files changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 1b58e4f922..476737b9da 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -201,7 +201,7 @@ const GlobalProperty *qdev_find_global_prop(Object *o=
bj,
>  int qdev_prop_check_globals(void);
>  void qdev_prop_set_globals(DeviceState *dev);
>  void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
> -                                    Property *prop, const char *value);
> +                                    const char *name, const char *value)=
;
> =20
>  /**
>   * qdev_property_add_static:
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-s=
ystem.c
> index e2d523b27a..9cf9bcb39d 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -354,7 +354,7 @@ static void set_mac(Object *obj, Visitor *v, const ch=
ar *name, void *opaque,
>      return;
> =20
>  inval:
> -    error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
> +    error_set_from_qdev_prop_error(errp, EINVAL, obj, name, str);
>      g_free(str);
>  }
> =20
> @@ -442,7 +442,7 @@ static void set_netdev(Object *obj, Visitor *v, const=
 char *name,
>      peers_ptr->queues =3D queues;
> =20
>  out:
> -    error_set_from_qdev_prop_error(errp, err, obj, prop, str);
> +    error_set_from_qdev_prop_error(errp, err, obj, name, str);
>      g_free(str);
>  }
> =20
> @@ -494,7 +494,7 @@ static void set_audiodev(Object *obj, Visitor *v, con=
st char* name,
>      card->state =3D state;
> =20
>  out:
> -    error_set_from_qdev_prop_error(errp, err, obj, prop, str);
> +    error_set_from_qdev_prop_error(errp, err, obj, name, str);
>      g_free(str);
>  }
> =20
> @@ -792,7 +792,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, co=
nst char *name,
>      return;
> =20
>  invalid:
> -    error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
> +    error_set_from_qdev_prop_error(errp, EINVAL, obj, name, str);
>      g_free(str);
>  }
> =20
> @@ -916,7 +916,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor=
 *v, const char *name,
>      return;
> =20
>  inval:
> -    error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
> +    error_set_from_qdev_prop_error(errp, EINVAL, obj, name, str);
>      g_free(str);
>  }
> =20
> @@ -1146,7 +1146,7 @@ static void set_uuid(Object *obj, Visitor *v, const=
 char *name, void *opaque,
>      if (!strcmp(str, UUID_VALUE_AUTO)) {
>          qemu_uuid_generate(uuid);
>      } else if (qemu_uuid_parse(str, uuid) < 0) {
> -        error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
> +        error_set_from_qdev_prop_error(errp, EINVAL, obj, name, str);
>      }
>      g_free(str);
>  }
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index a2eaa43831..7495798a66 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -679,21 +679,21 @@ static Property *qdev_prop_find(DeviceState *dev, c=
onst char *name)
>  }
> =20
>  void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
> -                                    Property *prop, const char *value)
> +                                    const char *name, const char *value)
>  {
>      switch (ret) {
>      case -EEXIST:
>          error_setg(errp, "Property '%s.%s' can't take value '%s', it's i=
n use",
> -                  object_get_typename(obj), prop->name, value);
> +                  object_get_typename(obj), name, value);
>          break;
>      default:
>      case -EINVAL:
>          error_setg(errp, QERR_PROPERTY_VALUE_BAD,
> -                   object_get_typename(obj), prop->name, value);
> +                   object_get_typename(obj), name, value);
>          break;
>      case -ENOENT:
>          error_setg(errp, "Property '%s.%s' can't find value '%s'",
> -                  object_get_typename(obj), prop->name, value);
> +                  object_get_typename(obj), name, value);
>          break;
>      case 0:
>          break;
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index 38fd46b9a9..7a44320d12 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -2390,7 +2390,7 @@ static void set_css_devid(Object *obj, Visitor *v, =
const char *name,
> =20
>      num =3D sscanf(str, "%2x.%1x%n.%4x%n", &cssid, &ssid, &n1, &devid, &=
n2);
>      if (num !=3D 3 || (n2 - n1) !=3D 5 || strlen(str) !=3D n2) {
> -        error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
> +        error_set_from_qdev_prop_error(errp, EINVAL, obj, name, str);
>          goto out;
>      }
>      if ((cssid > MAX_CSSID) || (ssid > MAX_SSID)) {


