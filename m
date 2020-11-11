Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4135D2AF012
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 12:54:19 +0100 (CET)
Received: from localhost ([::1]:59526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcohe-0003Zk-Cn
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 06:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kcogJ-0002qS-Ii
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:52:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kcogH-00015M-It
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605095572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvJ9UYVvBMHYxNHGV0226G7aL46gPddTWiB7UVbafGk=;
 b=B2wJugf4LkMdp6xpV4UTQX5y8XO2IGqKeSlRzYyLSfn6VJrXnSbhtTimogSU+4ZSnohI+N
 KBuHf5grHAJOPMK/tpn/xF9oevIKbdOTD4YztK0txJudAviRHbit9AFfNXKnvLVUdTKlR9
 /Ju/FWkiy30Gh0IVLLVBzPPZaPBa904=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-3fOYmwW_N5u5YkqQFMTROQ-1; Wed, 11 Nov 2020 06:52:50 -0500
X-MC-Unique: 3fOYmwW_N5u5YkqQFMTROQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2162E8015AD;
 Wed, 11 Nov 2020 11:52:49 +0000 (UTC)
Received: from localhost (unknown [10.40.208.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F5C9100239F;
 Wed, 11 Nov 2020 11:52:43 +0000 (UTC)
Date: Wed, 11 Nov 2020 12:52:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 07/10] hw/i386/acpi-build: Fix maybe-uninitialized
 error when ACPI hotplug off
Message-ID: <20201111125242.17d16055@redhat.com>
In-Reply-To: <20201110192316.26397-8-alex.bennee@linaro.org>
References: <20201110192316.26397-1-alex.bennee@linaro.org>
 <20201110192316.26397-8-alex.bennee@linaro.org>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 19:23:13 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> GCC 9.3.0 thinks that 'method' can be left uninitialized. This code
> is already in the "if (bsel || pcihp_bridge_en)" block statement,
> but it isn't smart enough to figure it out.
>=20
> Restrict the code to be used only in the "if (bsel || pcihp_bridge_en)"
> block statement to fix (on Ubuntu):
>=20
>   ../hw/i386/acpi-build.c: In function 'build_append_pci_bus_devices':
>   ../hw/i386/acpi-build.c:496:9: error: 'method' may be used uninitialize=
d
>   in this function [-Werror=3Dmaybe-uninitialized]
>     496 |         aml_append(parent_scope, method);
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>=20
> Fixes: df4008c9c59 ("piix4: don't reserve hw resources when hotplug is of=
f globally")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Message-Id: <20201108204535.2319870-4-philmd@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 41 +++++++++++++++++++----------------------
>  1 file changed, 19 insertions(+), 22 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4f66642d88..1f5c211245 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -465,34 +465,31 @@ static void build_append_pci_bus_devices(Aml *paren=
t_scope, PCIBus *bus,
>       */
>      if (bsel || pcihp_bridge_en) {
>          method =3D aml_method("PCNT", 0, AML_NOTSERIALIZED);
> -    }
> -    /* If bus supports hotplug select it and notify about local events *=
/
> -    if (bsel) {
> -        uint64_t bsel_val =3D qnum_get_uint(qobject_to(QNum, bsel));
> =20
> -        aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")=
));
> -        aml_append(method,
> -            aml_call2("DVNT", aml_name("PCIU"), aml_int(1) /* Device Che=
ck */)
> -        );
> -        aml_append(method,
> -            aml_call2("DVNT", aml_name("PCID"), aml_int(3)/* Eject Reque=
st */)
> -        );
> -    }
> +        /* If bus supports hotplug select it and notify about local even=
ts */
> +        if (bsel) {
> +            uint64_t bsel_val =3D qnum_get_uint(qobject_to(QNum, bsel));
> =20
> -    /* Notify about child bus events in any case */
> -    if (pcihp_bridge_en) {
> -        QLIST_FOREACH(sec, &bus->child, sibling) {
> -            int32_t devfn =3D sec->parent_dev->devfn;
> +            aml_append(method, aml_store(aml_int(bsel_val), aml_name("BN=
UM")));
> +            aml_append(method, aml_call2("DVNT", aml_name("PCIU"),
> +                                         aml_int(1))); /* Device Check *=
/
> +            aml_append(method, aml_call2("DVNT", aml_name("PCID"),
> +                                         aml_int(3))); /* Eject Request =
*/
> +        }
> =20
> -            if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
> -                continue;
> -            }
> +        /* Notify about child bus events in any case */
> +        if (pcihp_bridge_en) {
> +            QLIST_FOREACH(sec, &bus->child, sibling) {
> +                int32_t devfn =3D sec->parent_dev->devfn;
> +
> +                if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
> +                    continue;
> +                }
> =20
> -            aml_append(method, aml_name("^S%.02X.PCNT", devfn));
> +                aml_append(method, aml_name("^S%.02X.PCNT", devfn));
> +            }
>          }
> -    }
> =20
> -    if (bsel || pcihp_bridge_en) {
>          aml_append(parent_scope, method);
>      }
>      qobject_unref(bsel);


