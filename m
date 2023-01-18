Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9668671ACB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:36:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6iq-0004oN-Ip; Wed, 18 Jan 2023 06:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pI6iO-0004Ys-2v
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:35:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pI6iM-0007Yf-BZ
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674041684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNXhjmEs/oJtA31CqFYKIT5SGaKPkn/sjhkD4+g6BFc=;
 b=c/w2YA1BqnmoBSZSYP+lzXvjI20lldvUbXJyuqMhy3YlS8gMRfMNT7bL5782Q7ezyDduP3
 wTp6Unyg4h13GYx88H5evEwMtYzKvwhQPw+PXErUwtkI+vjCSqZEBUVi1VE3w/N6GTGk8r
 vbQoKqoCfOgH9nFUQ2f6apGa275Sr+o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-416-cpbOBJpXNKqRCAltX4i-Bg-1; Wed, 18 Jan 2023 06:34:43 -0500
X-MC-Unique: cpbOBJpXNKqRCAltX4i-Bg-1
Received: by mail-ej1-f69.google.com with SMTP id
 qf20-20020a1709077f1400b0086ec9755517so6958591ejc.15
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 03:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iNXhjmEs/oJtA31CqFYKIT5SGaKPkn/sjhkD4+g6BFc=;
 b=FqjP1QfbL4ayIRv02PNZBM4cgu7aeMKVQ0vp4zP1AiUQx5YPeCpQQ3+y5VYQVLpELM
 DZ9q/YweFIDcggd5WJe3u/ZevLhbCAvn80FUocSrVbfeBTbmxtSu0Xy+RU4dg+yAp0Z1
 kPEdnofvLnCkeLKxR4YdKy3kRo8y2TgVC4xZdsn7oh+reUxJBbgxt9/Mn9iGHCtBKSZI
 VcufrIepiXeNONLYPHwkln+zxf5RQzhXiZk7tbq0LwITfZoAU6b39Q9KleMHlVy50zp4
 6a+qAxqKCBW1CCNz9dhWrAfqt0n+xMEuTO3st7ZyGzXzoJ+RhJw2I++RJ3sWu48idg0T
 R54A==
X-Gm-Message-State: AFqh2krzBpRHYig4ySexl7Wz0MoSNbx0w6Y/tnfpFnpDWL8DmZy097oe
 eRFKOLV8muA6uKYWW9CEf2ZWervz4nHyjetu0QDn3EfpC5eS5wKNHedIP9JjsE+TBhoUFQa2zqu
 4W8J3PUnHJX906zg=
X-Received: by 2002:a17:906:781:b0:871:8297:7576 with SMTP id
 l1-20020a170906078100b0087182977576mr6137855ejc.26.1674041681972; 
 Wed, 18 Jan 2023 03:34:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXskbg3tLY+bxFZkIBgOa/wCYUSOcrA3+w4f8EKzKci3ThYoMdrhG8NZbLzOTzTI/u8aeJCBhg==
X-Received: by 2002:a17:906:781:b0:871:8297:7576 with SMTP id
 l1-20020a170906078100b0087182977576mr6137823ejc.26.1674041681612; 
 Wed, 18 Jan 2023 03:34:41 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 d9-20020a1709063ec900b007bd9e683639sm14419256ejj.130.2023.01.18.03.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 03:34:40 -0800 (PST)
Date: Wed, 18 Jan 2023 12:34:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH v3 6/7] hw/isa/isa-bus: Turn isa_build_aml() into
 qbus_build_aml()
Message-ID: <20230118123439.6e5c9e80@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230116152908.147275-7-shentey@gmail.com>
References: <20230116152908.147275-1-shentey@gmail.com>
 <20230116152908.147275-7-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 16 Jan 2023 16:29:07 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> Frees isa-bus.c from implicit ACPI dependency.
>=20
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/acpi_aml_interface.h |  3 +++
>  include/hw/isa/isa.h                 |  1 -
>  hw/acpi/acpi_interface.c             | 10 ++++++++++
>  hw/i386/acpi-microvm.c               |  3 ++-
>  hw/isa/isa-bus.c                     | 10 ----------
>  5 files changed, 15 insertions(+), 12 deletions(-)
>=20
> diff --git a/include/hw/acpi/acpi_aml_interface.h b/include/hw/acpi/acpi_=
aml_interface.h
> index 436da069d6..11748a8866 100644
> --- a/include/hw/acpi/acpi_aml_interface.h
> +++ b/include/hw/acpi/acpi_aml_interface.h
> @@ -3,6 +3,7 @@
> =20
>  #include "qom/object.h"
>  #include "hw/acpi/aml-build.h"
> +#include "hw/qdev-core.h"
> =20
>  #define TYPE_ACPI_DEV_AML_IF "acpi-dev-aml-interface"
>  typedef struct AcpiDevAmlIfClass AcpiDevAmlIfClass;
> @@ -46,4 +47,6 @@ static inline void call_dev_aml_func(DeviceState *dev, =
Aml *scope)
>      }
>  }
> =20
> +void qbus_build_aml(BusState *bus, Aml *scope);
> +
>  #endif
> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> index 6c8a8a92cb..25acd5c34c 100644
> --- a/include/hw/isa/isa.h
> +++ b/include/hw/isa/isa.h
> @@ -86,7 +86,6 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *bus,=
 Error **errp);
>  ISADevice *isa_create_simple(ISABus *bus, const char *name);
> =20
>  ISADevice *isa_vga_init(ISABus *bus);
> -void isa_build_aml(ISABus *bus, Aml *scope);
> =20
>  /**
>   * isa_register_ioport: Install an I/O port region on the ISA bus.
> diff --git a/hw/acpi/acpi_interface.c b/hw/acpi/acpi_interface.c
> index c668d361f6..8637ff18fc 100644
> --- a/hw/acpi/acpi_interface.c
> +++ b/hw/acpi/acpi_interface.c
> @@ -2,6 +2,7 @@
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/acpi/acpi_aml_interface.h"
>  #include "qemu/module.h"
> +#include "qemu/queue.h"
> =20
>  void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event)
>  {
> @@ -12,6 +13,15 @@ void acpi_send_event(DeviceState *dev, AcpiEventStatus=
Bits event)
>      }
>  }
> =20
> +void qbus_build_aml(BusState *bus, Aml *scope)
> +{
> +    BusChild *kid;
> +
> +    QTAILQ_FOREACH(kid, &bus->children, sibling) {
> +        call_dev_aml_func(DEVICE(kid->child), scope);
> +    }
> +}
> +
>  static void register_types(void)
>  {
>      static const TypeInfo acpi_dev_if_info =3D {
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index d8a444d06c..fec22d85c1 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -26,6 +26,7 @@
> =20
>  #include "exec/memory.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/acpi_aml_interface.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/acpi/generic_event_device.h"
> @@ -129,7 +130,7 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *li=
nker,
> =20
>      sb_scope =3D aml_scope("_SB");
>      fw_cfg_add_acpi_dsdt(sb_scope, x86ms->fw_cfg);
> -    isa_build_aml(ISA_BUS(isabus), sb_scope);
> +    qbus_build_aml(BUS(isabus), sb_scope);
>      build_ged_aml(sb_scope, GED_DEVICE, x86ms->acpi_dev,
>                    GED_MMIO_IRQ, AML_SYSTEM_MEMORY, GED_MMIO_BASE);
>      acpi_dsdt_add_power_button(sb_scope);
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 1bee1a47f1..f155b80010 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -24,7 +24,6 @@
>  #include "hw/sysbus.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/isa/isa.h"
> -#include "hw/acpi/acpi_aml_interface.h"
> =20
>  static ISABus *isabus;
> =20
> @@ -188,15 +187,6 @@ ISADevice *isa_vga_init(ISABus *bus)
>      }
>  }
> =20
> -void isa_build_aml(ISABus *bus, Aml *scope)
> -{
> -    BusChild *kid;
> -
> -    QTAILQ_FOREACH(kid, &bus->parent_obj.children, sibling) {
> -        call_dev_aml_func(DEVICE(kid->child), scope);
> -    }
> -}
> -
>  static void isabus_bridge_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);


