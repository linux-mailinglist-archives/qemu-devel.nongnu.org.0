Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2628C6A6DE3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:09:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXN7N-0007zZ-LI; Wed, 01 Mar 2023 09:07:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXN7G-0007mj-AZ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:07:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXN7E-0005tm-Ty
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:07:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677679652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2eU6CUJmsaj+DRHhWhs2AoNFyx1lPX7SG8r6IebtsJY=;
 b=ErT1hSkm2yIxf0EdM000JvcHrU38vtZhRG1FvemQwCP1ic1RdKod9TZ5W7NislpfxHCuMQ
 D9gEKOERbj1RSi+M4hdN4gk7sksbrKtu5267VrmYmEfAxZ5mhKeHCrxqn9cr2gVPdjficO
 EQm5hbKKsi+2VR4tAvPpDIfnscgDNko=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-wkaP1HmRMZqTbzwD2ERPsw-1; Wed, 01 Mar 2023 09:07:21 -0500
X-MC-Unique: wkaP1HmRMZqTbzwD2ERPsw-1
Received: by mail-wr1-f72.google.com with SMTP id
 m15-20020adfa3cf000000b002be0eb97f4fso2568138wrb.8
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 06:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677679635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2eU6CUJmsaj+DRHhWhs2AoNFyx1lPX7SG8r6IebtsJY=;
 b=7Qh/AE/Ofz7oGaJBxqsX5t/9Y3Y3DgUtsAzdmKhPyMouyxiGk4VhZs0jtdzKrohHxu
 qirUtiOsMRUKoHmHH9qADPviQlc3EASW3vmpvR/6G90fhKdDWyJwHOeXmU7RTLwY3kBz
 tKDjuLnCnKkyDrPGzQjZuW/yjOCUqM/CtmzPAFgtCJcT3oCDYmcx7CkkHYx6ebeUFAZ7
 el6T54bPoWqEv3UkxtAeLZNknqr+6jOBEFmQwYw0Qn2mSmPYey7Ep1ygebOCa2OGSJJw
 hYC/KAjOvvfXl7LCnaFo35wfGV6JFGPuIKsIldKaKW3Rh+e1PpgnuINfdQ73d3lZT8j6
 AfPQ==
X-Gm-Message-State: AO0yUKXr41X0d90GvG4J3P805nahdr7Cf7cs2QqUObD1cO/FNdCNGbdC
 1YXNgYuR6NioJcqBwTYbEf9OvXveYXmQFFXCdW0kBrdAc6/k3K2LngrT8AK59QaWKo4BUUX9fyx
 TxZxNMPiVDtBTKic=
X-Received: by 2002:a5d:5092:0:b0:2c9:97f8:2604 with SMTP id
 a18-20020a5d5092000000b002c997f82604mr4466677wrt.14.1677679635152; 
 Wed, 01 Mar 2023 06:07:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/7QWgYk6B6Zh/n6bpl7/tc/4aGqmoeXwzO1Sistf6H6RrO7H6ypRehSAEaAwiLgA1/TEzR5A==
X-Received: by 2002:a5d:5092:0:b0:2c9:97f8:2604 with SMTP id
 a18-20020a5d5092000000b002c997f82604mr4466652wrt.14.1677679634801; 
 Wed, 01 Mar 2023 06:07:14 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 a2-20020adfdd02000000b002c3f03d8851sm13000492wrm.16.2023.03.01.06.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 06:07:14 -0800 (PST)
Date: Wed, 1 Mar 2023 15:07:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Aurelien
 Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 03/19] hw/acpi: Set QDev properties using QDev API
Message-ID: <20230301150713.48d4ef36@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230203180914.49112-4-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
 <20230203180914.49112-4-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri,  3 Feb 2023 19:08:58 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/acpi/cpu_hotplug.c | 7 +++----
>  hw/acpi/ich9.c        | 4 ++--
>  hw/acpi/piix4.c       | 4 ++--
>  3 files changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> index b8c9081738..5bc5f435f4 100644
> --- a/hw/acpi/cpu_hotplug.c
> +++ b/hw/acpi/cpu_hotplug.c
> @@ -10,6 +10,7 @@
>   * See the COPYING file in the top-level directory.
>   */
>  #include "qemu/osdep.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/acpi/cpu_hotplug.h"
>  #include "qapi/error.h"
>  #include "hw/core/cpu.h"
> @@ -41,8 +42,7 @@ static void cpu_status_write(void *opaque, hwaddr addr,=
 uint64_t data,
>       */
>      if (addr =3D=3D 0 && data =3D=3D 0) {
>          AcpiCpuHotplug *gpe =3D opaque;
> -        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legac=
y",
> -                                 false, &error_abort);
> +        qdev_prop_set_bit(gpe->parent, "cpu-hotplug-legacy", false);
>      }
>  }
> =20
> @@ -66,8 +66,7 @@ static void acpi_set_cpu_present_bit(AcpiCpuHotplug *gp=
e, CPUState *cpu)
> =20
>      cpu_id =3D k->get_arch_id(cpu);
>      if ((cpu_id / 8) >=3D ACPI_GPE_PROC_LEN) {
> -        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legac=
y",
> -                                 false, &error_abort);
> +        qdev_prop_set_bit(gpe->parent, "cpu-hotplug-legacy", false);
>          return;
>      }
> =20
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 6c9a737479..9759119b32 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -30,6 +30,7 @@
>  #include "hw/pci/pci.h"
>  #include "migration/vmstate.h"
>  #include "qemu/timer.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/core/cpu.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> @@ -197,8 +198,7 @@ static bool vmstate_test_use_cpuhp(void *opaque)
>  static int vmstate_cpuhp_pre_load(void *opaque)
>  {
>      ICH9LPCPMRegs *s =3D opaque;
> -    Object *obj =3D OBJECT(s->gpe.parent);
> -    object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_ab=
ort);
> +    qdev_prop_set_bit(s->gpe.parent, "cpu-hotplug-legacy", false);
>      return 0;
>  }
> =20
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 3a61d89f92..9a86d506de 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -206,8 +206,8 @@ static bool vmstate_test_use_cpuhp(void *opaque)
> =20
>  static int vmstate_cpuhp_pre_load(void *opaque)
>  {
> -    Object *obj =3D OBJECT(opaque);
> -    object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_ab=
ort);
> +    PIIX4PMState *s =3D opaque;

In other series you were aiming for type safety converting Object to Device=
State
and here you do opposite of that

> +    qdev_prop_set_bit(DEVICE(s), "cpu-hotplug-legacy", false);
if you have to, just use DEVICE(opaque) here and drop above pointer casting.

>      return 0;
>  }
> =20


