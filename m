Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD55C321E94
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:57:01 +0100 (CET)
Received: from localhost ([::1]:51112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFS8-0008TR-PK
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lEFIF-0007hY-FE
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:46:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lEFIC-0001q6-4g
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614016003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ap6wVunjnHQO5CinJJgI7vpNWx2oOiKw2tFNPevDbBQ=;
 b=hktoStxsYtrUntRoNr2igTcCuInFkkkhEbKLWbzp1SAclnmEoiZnGvDKNq6MHDLf7xC+TB
 DDrTspxmCwGlb5ecER1nUOR3Wp0GquQBq8UPSPX5dbTFdN3C3ctjuK9OIpHrSQyMx28ZY2
 KzBqZ8gnCQziAaW6MtGOFBvviyMPFyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-MITzUUf3Oqye6SI3VLeV4w-1; Mon, 22 Feb 2021 12:46:41 -0500
X-MC-Unique: MITzUUf3Oqye6SI3VLeV4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFE62C291;
 Mon, 22 Feb 2021 17:46:37 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CA0B5D6B1;
 Mon, 22 Feb 2021 17:46:23 +0000 (UTC)
Date: Mon, 22 Feb 2021 18:46:20 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 11/11] softmmu/vl: Exit gracefully when accelerator
 is not supported
Message-ID: <20210222184620.57119057.cohuck@redhat.com>
In-Reply-To: <20210219173847.2054123-12-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-12-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 18:38:47 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Before configuring an accelerator, check it is valid for
> the current machine. Doing so we can return a simple error
> message instead of criptic one.

s/criptic/cryptic/

>=20
> Before:
>=20
>   $ qemu-system-arm -M raspi2b -enable-kvm
>   qemu-system-arm: /build/qemu-ETIdrs/qemu-4.2/exec.c:865: cpu_address_sp=
ace_init: Assertion `asidx =3D=3D 0 || !kvm_enabled()' failed.
>   Aborted
>=20
>   $ qemu-system-aarch64 -M xlnx-zcu102 -enable-kvm -smp 6
>   qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Inva=
lid argument
>=20
> After:
>=20
>   $ qemu-system-arm -M raspi2b -enable-kvm
>   qemu-system-aarch64: invalid accelerator 'kvm' for machine raspi2b
>=20
>   $ qemu-system-aarch64 -M xlnx-zcu102 -enable-kvm -smp 6
>   qemu-system-aarch64: -accel kvm: invalid accelerator 'kvm' for machine =
xlnx-zcu102
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  softmmu/vl.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index b219ce1f357..f2c4074310b 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2133,6 +2133,7 @@ static int do_configure_accelerator(void *opaque, Q=
emuOpts *opts, Error **errp)
>      const char *acc =3D qemu_opt_get(opts, "accel");
>      AccelClass *ac =3D accel_find(acc);
>      AccelState *accel;
> +    MachineClass *mc;
>      int ret;
>      bool qtest_with_kvm;
> =20
> @@ -2145,6 +2146,12 @@ static int do_configure_accelerator(void *opaque, =
QemuOpts *opts, Error **errp)
>          }
>          return 0;
>      }
> +    mc =3D MACHINE_GET_CLASS(current_machine);
> +    if (!qtest_chrdev && !machine_class_valid_for_accelerator(mc, ac->na=
me)) {

Shouldn't qtest be already allowed in any case in the checking function?

> +        *p_init_failed =3D true;
> +        error_report("invalid accelerator '%s' for machine %s", acc, mc-=
>name);
> +        return 0;
> +    }
>      accel =3D ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
>      object_apply_compat_props(OBJECT(accel));
>      qemu_opt_foreach(opts, accelerator_set_property,


