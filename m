Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EB22D9A99
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:13:11 +0100 (CET)
Received: from localhost ([::1]:45874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopXC-000797-Ps
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kopVt-0006dx-EB
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:11:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kopVr-0003tr-BE
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607958706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yj+c0lOJF7ENNVlankWOtZ65z9BAD7KLXpFpV86d+HI=;
 b=D2FrcYUC2FSxhlIc1FM8v4pYeG8h4/MxOT8U10Mv7K23IOBTLBnYlQ5+JU6DyudRnDxOV9
 zkXu0pNGoxlVMspn4tDzac1ErWWf5rGBYjwc16g97e6fJSffHUA94D4IYpcSDYnWkR0P3k
 84YOw8xOuiyl7xsHyEMLM10V4tRMRb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-ymPZ8hUJOyaneB2H7ypsFg-1; Mon, 14 Dec 2020 10:11:44 -0500
X-MC-Unique: ymPZ8hUJOyaneB2H7ypsFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90031E7C4;
 Mon, 14 Dec 2020 15:11:43 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC79B10023AD;
 Mon, 14 Dec 2020 15:11:37 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:11:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 31/32] qdev: Avoid unnecessary DeviceState* variable
 at set_prop_arraylen()
Message-ID: <20201214161136.06baeb56@redhat.com>
In-Reply-To: <20201211220529.2290218-32-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-32-ehabkost@redhat.com>
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
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 17:05:28 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> We're just doing pointer math with the device pointer, we can
> simply use obj instead.
>=20
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  hw/core/qdev-properties.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 3d648b088d..9d25b49fc1 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -559,10 +559,9 @@ static void set_prop_arraylen(Object *obj, Visitor *=
v, const char *name,
>       * array-length field in the device struct, we have to create the
>       * array itself and dynamically add the corresponding properties.
>       */
> -    DeviceState *dev =3D DEVICE(obj);
>      Property *prop =3D opaque;
>      uint32_t *alenptr =3D object_field_prop_ptr(obj, prop);
> -    void **arrayptr =3D (void *)dev + prop->arrayoffset;
> +    void **arrayptr =3D (void *)obj + prop->arrayoffset;
>      void *eltptr;
>      const char *arrayname;
>      int i;
> @@ -602,7 +601,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v=
, const char *name,
>           * they get the right answer despite the array element not actua=
lly
>           * being inside the device struct.
>           */
> -        arrayprop->prop.offset =3D eltptr - (void *)dev;
> +        arrayprop->prop.offset =3D eltptr - (void *)obj;
>          assert(object_field_prop_ptr(obj, &arrayprop->prop) =3D=3D eltpt=
r);
>          object_property_add(obj, propname,
>                              arrayprop->prop.info->name,


