Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCEE2D9A4F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:50:58 +0100 (CET)
Received: from localhost ([::1]:56566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopBh-0004J4-B8
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1koouI-0003eP-Vg
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:33:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1koouG-0007Fw-7a
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607956374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bca3wLnj2aqWSMjp5vqIixP76xbjUGDiq1qBySWKoy4=;
 b=StCgIacPUBALOJ4Yxr+NY0Kg52JP29dK1Hf0KHN1ZYbC2lfK4nblM8rZzV+3AF9ZtzTIoO
 Hz3aB9psMCV6UkIhxj962vQIGzlt8QuQF6MzR71+an9NUv49EftdXhjdurq4k/FBemQZqN
 0i0Evd+ke4XgZMCebOYuzjpUFI3NAaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-8nmfbqs-Mb24fCP8yXM3iw-1; Mon, 14 Dec 2020 09:32:52 -0500
X-MC-Unique: 8nmfbqs-Mb24fCP8yXM3iw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF9E2800D55;
 Mon, 14 Dec 2020 14:32:51 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F49D5D6AB;
 Mon, 14 Dec 2020 14:32:45 +0000 (UTC)
Date: Mon, 14 Dec 2020 15:32:44 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 16/32] qdev: Reuse DEFINE_PROP in all DEFINE_PROP_*
 macros
Message-ID: <20201214153244.0645c451@redhat.com>
In-Reply-To: <20201211220529.2290218-17-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-17-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On Fri, 11 Dec 2020 17:05:13 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Instead of duplicating the code that sets name, info, offset,
> and does type checking, make DEFINE_PROP accept a variable number
> of arguments and reuse it in all DEFINE_PROP_* macros.
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Changes v1 -> v2:
> * Redone after UUID property was moved
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  include/hw/qdev-properties-system.h |  19 ++---
>  include/hw/qdev-properties.h        | 114 ++++++++++------------------
>  2 files changed, 46 insertions(+), 87 deletions(-)
>=20
> diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-proper=
ties-system.h
> index 29529dc999..0ac327ae60 100644
> --- a/include/hw/qdev-properties-system.h
> +++ b/include/hw/qdev-properties-system.h
> @@ -63,22 +63,15 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
>      DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_pcie_link_width, \
>                          PCIExpLinkWidth)
> =20
> -#define DEFINE_PROP_UUID(_name, _state, _field) {                  \
> -        .name      =3D (_name),                                      \
> -        .info      =3D &qdev_prop_uuid,                              \
> -        .offset    =3D offsetof(_state, _field)                      \
> -            + type_check(QemuUUID, typeof_field(_state, _field)),  \
> -        .set_default =3D true,                                       \
> -        }
> +#define DEFINE_PROP_UUID(_name, _state, _field) \
> +    DEFINE_PROP(_name, _state, _field, qdev_prop_uuid, QemuUUID, \
> +                .set_default =3D true)
> +
>  #define DEFINE_PROP_AUDIODEV(_n, _s, _f) \
>      DEFINE_PROP(_n, _s, _f, qdev_prop_audiodev, QEMUSoundCard)
> =20
> -#define DEFINE_PROP_UUID_NODEFAULT(_name, _state, _field) {        \
> -        .name      =3D (_name),                                      \
> -        .info      =3D &qdev_prop_uuid,                              \
> -        .offset    =3D offsetof(_state, _field)                      \
> -            + type_check(QemuUUID, typeof_field(_state, _field)),  \
> -        }
> +#define DEFINE_PROP_UUID_NODEFAULT(_name, _state, _field) \
> +    DEFINE_PROP(_name, _state, _field, qdev_prop_uuid, QemuUUID)
> =20
> =20
>  #endif
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index d35d4aae84..1b58e4f922 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -61,73 +61,46 @@ extern const PropertyInfo qdev_prop_size32;
>  extern const PropertyInfo qdev_prop_arraylen;
>  extern const PropertyInfo qdev_prop_link;
> =20
> -#define DEFINE_PROP(_name, _state, _field, _prop, _type) { \
> +#define DEFINE_PROP(_name, _state, _field, _prop, _type, ...) {  \
>          .name      =3D (_name),                                    \
>          .info      =3D &(_prop),                                   \
>          .offset    =3D offsetof(_state, _field)                    \
>              + type_check(_type, typeof_field(_state, _field)),   \
> +        __VA_ARGS__                                              \
>          }
> =20
> -#define DEFINE_PROP_SIGNED(_name, _state, _field, _defval, _prop, _type)=
 { \
> -        .name      =3D (_name),                                         =
  \
> -        .info      =3D &(_prop),                                        =
  \
> -        .offset    =3D offsetof(_state, _field)                         =
  \
> -            + type_check(_type,typeof_field(_state, _field)),           =
\
> -        .set_default =3D true,                                          =
  \
> -        .defval.i  =3D (_type)_defval,                                  =
  \
> -        }
> +#define DEFINE_PROP_SIGNED(_name, _state, _field, _defval, _prop, _type)=
 \
> +    DEFINE_PROP(_name, _state, _field, _prop, _type,                    =
 \
> +                .set_default =3D true,                                  =
   \
> +                .defval.i    =3D (_type)_defval)
> =20
> -#define DEFINE_PROP_SIGNED_NODEFAULT(_name, _state, _field, _prop, _type=
) { \
> -        .name      =3D (_name),                                         =
  \
> -        .info      =3D &(_prop),                                        =
  \
> -        .offset    =3D offsetof(_state, _field)                         =
  \
> -            + type_check(_type, typeof_field(_state, _field)),          =
\
> -        }
> +#define DEFINE_PROP_SIGNED_NODEFAULT(_name, _state, _field, _prop, _type=
) \
> +    DEFINE_PROP(_name, _state, _field, _prop, _type)
> =20
> -#define DEFINE_PROP_BIT(_name, _state, _field, _bit, _defval) {  \
> -        .name      =3D (_name),                                    \
> -        .info      =3D &(qdev_prop_bit),                           \
> -        .bitnr    =3D (_bit),                                      \
> -        .offset    =3D offsetof(_state, _field)                    \
> -            + type_check(uint32_t,typeof_field(_state, _field)), \
> -        .set_default =3D true,                                     \
> -        .defval.u  =3D (bool)_defval,                              \
> -        }
> +#define DEFINE_PROP_BIT(_name, _state, _field, _bit, _defval)   \
> +    DEFINE_PROP(_name, _state, _field, qdev_prop_bit, uint32_t, \
> +                .bitnr       =3D (_bit),                          \
> +                .set_default =3D true,                            \
> +                .defval.u    =3D (bool)_defval)
> =20
> -#define DEFINE_PROP_UNSIGNED(_name, _state, _field, _defval, _prop, _typ=
e) { \
> -        .name      =3D (_name),                                         =
  \
> -        .info      =3D &(_prop),                                        =
  \
> -        .offset    =3D offsetof(_state, _field)                         =
  \
> -            + type_check(_type, typeof_field(_state, _field)),          =
\
> -        .set_default =3D true,                                          =
  \
> -        .defval.u  =3D (_type)_defval,                                  =
  \
> -        }
> +#define DEFINE_PROP_UNSIGNED(_name, _state, _field, _defval, _prop, _typ=
e) \
> +    DEFINE_PROP(_name, _state, _field, _prop, _type,                    =
   \
> +                .set_default =3D true,                                  =
     \
> +                .defval.u  =3D (_type)_defval)
> =20
> -#define DEFINE_PROP_UNSIGNED_NODEFAULT(_name, _state, _field, _prop, _ty=
pe) { \
> -        .name      =3D (_name),                                         =
  \
> -        .info      =3D &(_prop),                                        =
  \
> -        .offset    =3D offsetof(_state, _field)                         =
  \
> -            + type_check(_type, typeof_field(_state, _field)),          =
\
> -        }
> +#define DEFINE_PROP_UNSIGNED_NODEFAULT(_name, _state, _field, _prop, _ty=
pe) \
> +    DEFINE_PROP(_name, _state, _field, _prop, _type)
> =20
> -#define DEFINE_PROP_BIT64(_name, _state, _field, _bit, _defval) {       =
\
> -        .name      =3D (_name),                                         =
  \
> -        .info      =3D &(qdev_prop_bit64),                              =
  \
> -        .bitnr    =3D (_bit),                                           =
  \
> -        .offset    =3D offsetof(_state, _field)                         =
  \
> -            + type_check(uint64_t, typeof_field(_state, _field)),       =
\
> -        .set_default =3D true,                                          =
  \
> -        .defval.u  =3D (bool)_defval,                                   =
  \
> -        }
> +#define DEFINE_PROP_BIT64(_name, _state, _field, _bit, _defval)   \
> +    DEFINE_PROP(_name, _state, _field, qdev_prop_bit64, uint64_t, \
> +                .bitnr    =3D (_bit),                               \
> +                .set_default =3D true,                              \
> +                .defval.u  =3D (bool)_defval)
> =20
> -#define DEFINE_PROP_BOOL(_name, _state, _field, _defval) {       \
> -        .name      =3D (_name),                                    \
> -        .info      =3D &(qdev_prop_bool),                          \
> -        .offset    =3D offsetof(_state, _field)                    \
> -            + type_check(bool, typeof_field(_state, _field)),    \
> -        .set_default =3D true,                                     \
> -        .defval.u    =3D (bool)_defval,                            \
> -        }
> +#define DEFINE_PROP_BOOL(_name, _state, _field, _defval)     \
> +    DEFINE_PROP(_name, _state, _field, qdev_prop_bool, bool, \
> +                .set_default =3D true,                         \
> +                .defval.u    =3D (bool)_defval)
> =20
>  #define PROP_ARRAY_LEN_PREFIX "len-"
> =20
> @@ -155,26 +128,19 @@ extern const PropertyInfo qdev_prop_link;
>   * It is the responsibility of the device deinit code to free the
>   * @_arrayfield memory.
>   */
> -#define DEFINE_PROP_ARRAY(_name, _state, _field,                        =
\
> -                          _arrayfield, _arrayprop, _arraytype) {        =
\
> -        .name =3D (PROP_ARRAY_LEN_PREFIX _name),                        =
  \
> -        .info =3D &(qdev_prop_arraylen),                                =
  \
> -        .set_default =3D true,                                          =
  \
> -        .defval.u =3D 0,                                                =
  \
> -        .offset =3D offsetof(_state, _field)                            =
  \
> -            + type_check(uint32_t, typeof_field(_state, _field)),       =
\
> -        .arrayinfo =3D &(_arrayprop),                                   =
  \
> -        .arrayfieldsize =3D sizeof(_arraytype),                         =
  \
> -        .arrayoffset =3D offsetof(_state, _arrayfield),                 =
  \
> -        }
> +#define DEFINE_PROP_ARRAY(_name, _state, _field,               \
> +                          _arrayfield, _arrayprop, _arraytype) \
> +    DEFINE_PROP((PROP_ARRAY_LEN_PREFIX _name),                 \
> +                _state, _field, qdev_prop_arraylen, uint32_t,  \
> +                .set_default =3D true,                           \
> +                .defval.u =3D 0,                                 \
> +                .arrayinfo =3D &(_arrayprop),                    \
> +                .arrayfieldsize =3D sizeof(_arraytype),          \
> +                .arrayoffset =3D offsetof(_state, _arrayfield))
> =20
> -#define DEFINE_PROP_LINK(_name, _state, _field, _type, _ptr_type) {     =
\
> -        .name =3D (_name),                                              =
  \
> -        .info =3D &(qdev_prop_link),                                    =
  \
> -        .offset =3D offsetof(_state, _field)                            =
  \
> -            + type_check(_ptr_type, typeof_field(_state, _field)),      =
\
> -        .link_type  =3D _type,                                          =
  \
> -        }
> +#define DEFINE_PROP_LINK(_name, _state, _field, _type, _ptr_type)     \
> +    DEFINE_PROP(_name, _state, _field, qdev_prop_link, _ptr_type,     \
> +                .link_type  =3D _type)
> =20
>  #define DEFINE_PROP_UINT8(_n, _s, _f, _d)                       \
>      DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_uint8, uint8_t)


