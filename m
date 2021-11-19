Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78211456F69
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 14:14:58 +0100 (CET)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo3jE-0003Aj-UL
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 08:14:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo3f6-0000Rl-MN
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:10:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo3f1-0004YC-KT
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637327434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gAV7FeQ7TGPcOGMYpI3GRLm/eN/3h9EXSJqfAMVcjUg=;
 b=K3XuqMibx2gjsyJCKxAla/y5EobmhuImCBqjASd1RQFz+03bidlHe7gw+PtLF/wGswccbn
 RjykSUM2nAt9tXe6biPcuvioBuDGxEVI0GkVtZd2M2C6K3nbn/OtSgLXVaS+52st/akTPr
 6SZdRMPC+yJJq2Al7Y7sHoFBDtQS1Rs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-lr-5qzzCNHad03w3cMnNHQ-1; Fri, 19 Nov 2021 08:10:32 -0500
X-MC-Unique: lr-5qzzCNHad03w3cMnNHQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F3AE804141
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 13:10:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2307960CA1;
 Fri, 19 Nov 2021 13:10:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7F0D711380A7; Fri, 19 Nov 2021 14:10:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2 v2] qom/object: Ignore global properties with
 empty name
References: <20211119122911.365036-1-philmd@redhat.com>
Date: Fri, 19 Nov 2021 14:10:26 +0100
In-Reply-To: <20211119122911.365036-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 19 Nov 2021 13:29:11
 +0100")
Message-ID: <87fsrsmgu5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> When using -global, properties might have empty name/value.
>
> This fixes this legitimate use case:
>
>   $ qemu-system-x86_64 -global driver=3Disa-fdc
>   qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
>   string_input_visitor_new: Assertion `str' failed.
>   Aborted (core dumped)
>
>   (gdb) bt
>   #4  0x5f6b8d5 in string_input_visitor_new (str=3D0x0) at qapi/string-in=
put-visitor.c:394
>   #5  0x5dd0f8d in object_property_parse (obj=3D0x6f33400, name=3D0x0, st=
ring=3D0x0, errp=3D0x7ffc9c8) at qom/object.c:1641
>   #6  0x5dce131 in object_apply_global_props (obj=3D0x6f33400, props=3D0x=
6737360, errp=3D0x6611760 <error_fatal>) at qom/object.c:411
>   #7  0x5dc5ee2 in qdev_prop_set_globals (dev=3D0x6f33400) at hw/core/qde=
v-properties.c:790
>   #8  0x5dc89e8 in device_post_init (obj=3D0x6f33400) at hw/core/qdev.c:6=
97
>   #9  0x5dce02b in object_post_init_with_type (obj=3D0x6f33400, ti=3D0x67=
2bd20) at qom/object.c:383
>   #10 0x5dce059 in object_post_init_with_type (obj=3D0x6f33400, ti=3D0x66=
e9090) at qom/object.c:387
>   #11 0x5dce059 in object_post_init_with_type (obj=3D0x6f33400, ti=3D0x66=
df730) at qom/object.c:387
>   #12 0x5dce566 in object_initialize_with_type (obj=3D0x6f33400, size=3D8=
48, type=3D0x66df730) at qom/object.c:519
>   #13 0x5dcec78 in object_new_with_type (type=3D0x66df730) at qom/object.=
c:733
>   #14 0x5dceccf in object_new (typename=3D0x60fcf81 "isa-fdc") at qom/obj=
ect.c:748
>   #15 0x5dc75fe in qdev_new (name=3D0x60fcf81 "isa-fdc") at hw/core/qdev.=
c:153
>   #16 0x59eec58 in isa_new (name=3D0x60fcf81 "isa-fdc") at hw/isa/isa-bus=
.c:166
>   #17 0x5bd3607 in pc_superio_init (isa_bus=3D0x66b42e0, create_fdctrl=3D=
true, no_vmport=3Dfalse) at hw/i386/pc.c:1026
>   (gdb) fr 6
>   #6  0x5dce131 in object_apply_global_props (obj=3D0x6f33400, props=3D0x=
6737360, errp=3D0x6611760 <error_fatal>) at qom/object.c:411
>   411             if (!object_property_parse(obj, p->property, p->value, =
&err)) {
>   (gdb) p *p
>   $1 =3D {driver =3D 0x6738250 "isa-fdc", property =3D 0x0, value =3D 0x0=
, used =3D true, optional =3D false}
>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: s/55555555// for readability
> ---
>  qom/object.c | 3 +++
>  1 file changed, 3 insertions(+)
>
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

Not a complete fix:

    $ qemu-system-x86_64 --global property=3Dprop
    qemu-system-x86_64: warning: global (null).prop has invalid class name

    $ qemu-system-x86_64 --global value=3Dval
    qemu-system-x86_64: warning: global (null).(null) has invalid class nam=
e

Glibc's printf() formats null pointers as "(null)", but some other
systems crash.

I think you should patch qemu_global_option() to require all three
parameters in the QemuOpts case.


