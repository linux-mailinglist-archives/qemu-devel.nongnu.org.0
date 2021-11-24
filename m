Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933E345B6EB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:49:14 +0100 (CET)
Received: from localhost ([::1]:38212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnxp-0006Bj-Mj
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:49:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mpnvN-0003rx-Fk
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:46:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mpnvJ-0007In-Qo
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637743590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/N7NtGBMsHkhn1bLurz1TVeOeMMlygLS6qYaTC5SJI=;
 b=Bc3dAwpxrKnnnfvBBMMdUEPvdbItJ+8UkZcrubf8k0OCyr0CNVcvAOxMwpD0nGxDCjM0qF
 zqxDPBetAy8Y9HSAURIl/GdKvpLTvNG62jrMqyPR4RmT0Hbg2ZsTIqZt5qwC/ZKXp23O6/
 GjZhTrDh0lPZzQ5ylmShW4CN+wDSURw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-ddOybAkEO6WJl-cvqHtHiA-1; Wed, 24 Nov 2021 03:46:28 -0500
X-MC-Unique: ddOybAkEO6WJl-cvqHtHiA-1
Received: by mail-ed1-f72.google.com with SMTP id
 eg20-20020a056402289400b003eb56fcf6easo1569336edb.20
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 00:46:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2/N7NtGBMsHkhn1bLurz1TVeOeMMlygLS6qYaTC5SJI=;
 b=NPeYNBPzuJdYEk8AOrKDk4P5vtzhi3t1zk6b1TVVjNixHeN1oyNFb5J3/FM5QoWcYZ
 Am6dCzOmbNiBR7w5rOXSVuB9iBg/Av50O2+QTJ0vOmwbVEa67ydtAIK62mHz+iEIu94r
 Br7clihnstUeDpr/CYUwFVomV4g/CCHc9eE2ISDFRScuNWlspIglCq3CwahPaX9GVieG
 2TKgyYaH0QKhtLFgOQPlOpguliLWIZbYuPgevlGpds3sLwlTjjqAX3911b966RXh6fy5
 xukr42ltzwIyhHJg/QsMH2l1d4eUzANsxFJxHwOgMSm7SwPKs4m6I3t8hE2VrZgHQsqP
 0AXA==
X-Gm-Message-State: AOAM530NGmFzM8DmLBYsAq6ou+D10vxNeKUDPv6k7JYo77PwTEzEkTMF
 5/7wScmPn1L6POp0qM49s4n559ykbgU1rW0koRRl2rfWGFbFGNFkuv7yIzanWf3LUgSVb9O3Ane
 hGrARw/4p1YzCAgk=
X-Received: by 2002:a05:6402:4312:: with SMTP id
 m18mr21204656edc.273.1637743587564; 
 Wed, 24 Nov 2021 00:46:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJym4f5QFYycufycluM4LcyVbmBxLvFVRObhtEyWOX5VzRN+saxW7OeY86dhSBLhQMfHH3gnMg==
X-Received: by 2002:a05:6402:4312:: with SMTP id
 m18mr21204625edc.273.1637743587389; 
 Wed, 24 Nov 2021 00:46:27 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id gt18sm6546556ejc.88.2021.11.24.00.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 00:46:27 -0800 (PST)
Date: Wed, 24 Nov 2021 09:46:26 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2] qom/object: Ignore global properties with empty
 name
Message-ID: <20211124094626.6fb9c2cb@redhat.com>
In-Reply-To: <20211119113229.350338-1-philmd@redhat.com>
References: <20211119113229.350338-1-philmd@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Nov 2021 12:32:29 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> When using -global, properties might have empty name/value.
>=20
> This fixes this legitimate use case:
>=20
>   $ qemu-system-x86_64 -global driver=3Disa-fdc
>   qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
>   string_input_visitor_new: Assertion `str' failed.
>   Aborted (core dumped)

why ignore instead of printing error message and exiting?
it never worked before, and I don't see a reason to let QEMU startup fine
with nonsense CLI.

>=20
>   (gdb) bt
>   #4  0x0000555555f6b8d5 in string_input_visitor_new (str=3D0x0) at qapi/=
string-input-visitor.c:394
>   #5  0x0000555555dd0f8d in object_property_parse (obj=3D0x555556f33400, =
name=3D0x0, string=3D0x0, errp=3D0x7fffffffc9c8) at qom/object.c:1641
>   #6  0x0000555555dce131 in object_apply_global_props (obj=3D0x555556f334=
00, props=3D0x555556737360, errp=3D0x555556611760 <error_fatal>) at qom/obj=
ect.c:411
>   #7  0x0000555555dc5ee2 in qdev_prop_set_globals (dev=3D0x555556f33400) =
at hw/core/qdev-properties.c:790
>   #8  0x0000555555dc89e8 in device_post_init (obj=3D0x555556f33400) at hw=
/core/qdev.c:697
>   #9  0x0000555555dce02b in object_post_init_with_type (obj=3D0x555556f33=
400, ti=3D0x55555672bd20) at qom/object.c:383
>   #10 0x0000555555dce059 in object_post_init_with_type (obj=3D0x555556f33=
400, ti=3D0x5555566e9090) at qom/object.c:387
>   #11 0x0000555555dce059 in object_post_init_with_type (obj=3D0x555556f33=
400, ti=3D0x5555566df730) at qom/object.c:387
>   #12 0x0000555555dce566 in object_initialize_with_type (obj=3D0x555556f3=
3400, size=3D848, type=3D0x5555566df730) at qom/object.c:519
>   #13 0x0000555555dcec78 in object_new_with_type (type=3D0x5555566df730) =
at qom/object.c:733
>   #14 0x0000555555dceccf in object_new (typename=3D0x5555560fcf81 "isa-fd=
c") at qom/object.c:748
>   #15 0x0000555555dc75fe in qdev_new (name=3D0x5555560fcf81 "isa-fdc") at=
 hw/core/qdev.c:153
>   #16 0x00005555559eec58 in isa_new (name=3D0x5555560fcf81 "isa-fdc") at =
hw/isa/isa-bus.c:166
>   #17 0x0000555555bd3607 in pc_superio_init (isa_bus=3D0x5555566b42e0, cr=
eate_fdctrl=3Dtrue, no_vmport=3Dfalse) at hw/i386/pc.c:1026
>   (gdb) fr 6
>   #6  0x0000555555dce131 in object_apply_global_props (obj=3D0x555556f334=
00, props=3D0x555556737360, errp=3D0x555556611760 <error_fatal>) at qom/obj=
ect.c:411
>   411             if (!object_property_parse(obj, p->property, p->value, =
&err)) {
>   (gdb) p *p
>   $1 =3D {driver =3D 0x555556738250 "isa-fdc", property =3D 0x0, value =
=3D 0x0, used =3D true, optional =3D false}
>=20
> Reported-by: Thomas Huth <thuth@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  qom/object.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/qom/object.c b/qom/object.c
> index 4f0677cca9e..45fa8561df6 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -401,6 +401,9 @@ bool object_apply_global_props(Object *obj, const GPt=
rArray *props,
>          GlobalProperty *p =3D g_ptr_array_index(props, i);
>          Error *err =3D NULL;
> =20
> +        if (!p->property) {
> +            continue;
> +        }
>          if (object_dynamic_cast(obj, p->driver) =3D=3D NULL) {
>              continue;
>          }


