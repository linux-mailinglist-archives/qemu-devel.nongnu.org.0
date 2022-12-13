Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0770364B539
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:35:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p54U8-0000EE-0r; Tue, 13 Dec 2022 07:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1p54U5-0000Cz-Sp
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:34:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1p54U4-0005cX-0C
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:34:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670934846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8WvYzu3gzZiTKPxX+Kvp5C2SMDi7OUv8uTosXq+iN8=;
 b=PJWZYU6VSeZUYVYOSccVMDDLwW0tj0EHdjCCahKfyCvLHQs6pPyshn7ThG7UksXSu1cj3C
 4Leifn4G0lnSX+yRnzaT0r5YEEVxRMfzCjvCmntdHdezVvmg/BcZnnLy4dgbkaG1ozXQ5m
 pdCpF1BSUcoFgbJwFmzH490ByuIWRfs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-329-xOA6L78lM6qeEgsHvpLFfA-1; Tue, 13 Dec 2022 07:34:05 -0500
X-MC-Unique: xOA6L78lM6qeEgsHvpLFfA-1
Received: by mail-ed1-f71.google.com with SMTP id
 e14-20020a056402190e00b0047005d4c3e9so2884686edz.2
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 04:34:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z8WvYzu3gzZiTKPxX+Kvp5C2SMDi7OUv8uTosXq+iN8=;
 b=c0hgGbXJL3Xyt6hmi6WChTDNUeKJkc7/69bHLM9egfEAaJ4Tdti/HIUdnZ4+yz9QCL
 64eQndCMJaCQoB1PEPtymOUMg7JZg7zGZgHdGbXQHD3fQRdcmZVsXG3hpkq+2iuaT794
 IfpQ5CaK3cH8StQsPpPslxCdt5j3WKvAEj+8jyvP11BbLbbvWDWA4Cx3Rt4U+YcAgnY9
 eeatOOhOBIqeADD6mjOwizDMDbpordBjeF68R0Xtsrat/wwEXjxPMHJqtEc/bzfKQcba
 w4uOM9cLTlx2YXIBI9af6YsjmXBR/PO16zGKGf6+GFVPd8VPiyl3uMyZr30leK4LIB8K
 gmFA==
X-Gm-Message-State: ANoB5pnGY3I2+NPt5pRDn7B3wLLJSsvJqHybh1g3FvvFMwqLMojBbO4E
 0TCZ4yQgFA5aM0wzi11b6IDr4jdlc42wzUlaLJJSjBS3rH6yrr5bGI0fghM36zzsTiloBJXb/oM
 atuYhKZ3ZncjDY1w=
X-Received: by 2002:a17:907:88cd:b0:7c1:932c:96d7 with SMTP id
 rq13-20020a17090788cd00b007c1932c96d7mr1214795ejc.58.1670934843075; 
 Tue, 13 Dec 2022 04:34:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4p/RxvCm0YkEOqNVE8kZIJscmDfiwBGaIXAOZWoGYgLvFKSKdx1XZg4yN54m0RQNuqqFW8Ww==
X-Received: by 2002:a17:907:88cd:b0:7c1:932c:96d7 with SMTP id
 rq13-20020a17090788cd00b007c1932c96d7mr1214772ejc.58.1670934842854; 
 Tue, 13 Dec 2022 04:34:02 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 c2-20020a17090618a200b0078ddb518a90sm4417633ejf.223.2022.12.13.04.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 04:34:02 -0800 (PST)
Date: Tue, 13 Dec 2022 13:34:01 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha
 <ani@anisinha.ca>
Subject: Re: [PATCH-for-8.0] hw/acpi: Rename tco.c -> ich9_tco.c
Message-ID: <20221213133401.44eb82d8@imammedo.users.ipa.redhat.com>
In-Reply-To: <20221212105115.2113-1-philmd@linaro.org>
References: <20221212105115.2113-1-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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

On Mon, 12 Dec 2022 11:51:15 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> tco.c contains the ICH9 implementation of its "total cost
> of ownership". Rename it accordingly to emphasis this is
> a part of the ICH9 model.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Based-on: <20221207231205.1106381-1-shentey@gmail.com>
>           "Clean up dependencies of ACPI controllers"
> ---
>  MAINTAINERS                           | 4 ++--
>  hw/acpi/ich9.c                        | 2 +-
>  hw/acpi/{tco.c =3D> ich9_tco.c}         | 2 +-
>  hw/acpi/meson.build                   | 2 +-
>  include/hw/acpi/ich9.h                | 2 +-
>  include/hw/acpi/{tco.h =3D> ich9_tco.h} | 2 +-
>  tests/qtest/tco-test.c                | 2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)
>  rename hw/acpi/{tco.c =3D> ich9_tco.c} (99%)
>  rename include/hw/acpi/{tco.h =3D> ich9_tco.h} (97%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6966490c94..35bde4a97e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1644,8 +1644,8 @@ F: hw/isa/piix3.c
>  F: hw/isa/lpc_ich9.c
>  F: hw/i2c/smbus_ich9.c
>  F: hw/acpi/piix4.c
> -F: hw/acpi/ich9.c
> -F: include/hw/acpi/ich9.h
> +F: hw/acpi/ich9*.c
> +F: include/hw/acpi/ich9*.h
>  F: include/hw/southbridge/piix.h
>  F: hw/misc/sga.c
>  F: hw/isa/apm.c
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index bd9bbade70..b10afa372a 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -34,7 +34,7 @@
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
>  #include "hw/acpi/acpi.h"
> -#include "hw/acpi/tco.h"
> +#include "hw/acpi/ich9_tco.h"
> =20
>  #include "hw/i386/ich9.h"
>  #include "hw/mem/pc-dimm.h"
> diff --git a/hw/acpi/tco.c b/hw/acpi/ich9_tco.c
> similarity index 99%
> rename from hw/acpi/tco.c
> rename to hw/acpi/ich9_tco.c
> index 4783721e4e..b68348707b 100644
> --- a/hw/acpi/tco.c
> +++ b/hw/acpi/ich9_tco.c
> @@ -12,7 +12,7 @@
>  #include "hw/i386/ich9.h"
>  #include "migration/vmstate.h"
> =20
> -#include "hw/acpi/tco.h"
> +#include "hw/acpi/ich9_tco.h"
>  #include "trace.h"
> =20
>  enum {
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index cfae2f58f6..30054a8cdc 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -22,7 +22,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('=
piix4.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug=
-stub.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
> -acpi_ss.add(when: 'CONFIG_ACPI_ICH9', if_true: files('ich9.c', 'tco.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_ICH9', if_true: files('ich9.c', 'ich9_tco=
.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
>  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: fil=
es('ipmi-stub.c'))
>  acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index 7ca92843c6..d41866a229 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -27,7 +27,7 @@
>  #include "hw/acpi/pcihp.h"
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/acpi_dev_interface.h"
> -#include "hw/acpi/tco.h"
> +#include "hw/acpi/ich9_tco.h"
> =20
>  #define ACPI_PCIHP_ADDR_ICH9 0x0cc0
> =20
> diff --git a/include/hw/acpi/tco.h b/include/hw/acpi/ich9_tco.h
> similarity index 97%
> rename from include/hw/acpi/tco.h
> rename to include/hw/acpi/ich9_tco.h
> index a1e0da8213..c4393caee0 100644
> --- a/include/hw/acpi/tco.h
> +++ b/include/hw/acpi/ich9_tco.h
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU ICH9 TCO emulation
> + * QEMU ICH9 TCO emulation (total cost of ownership)
>   *
>   * Copyright (c) 2015 Paulo Alcantara <pcacjr@zytor.com>
>   *
> diff --git a/tests/qtest/tco-test.c b/tests/qtest/tco-test.c
> index 254f735370..d7b61ccfa5 100644
> --- a/tests/qtest/tco-test.c
> +++ b/tests/qtest/tco-test.c
> @@ -16,7 +16,7 @@
>  #include "hw/pci/pci_regs.h"
>  #include "hw/i386/ich9.h"
>  #include "hw/acpi/ich9.h"
> -#include "hw/acpi/tco.h"
> +#include "hw/acpi/ich9_tco.h"
> =20
>  #define RCBA_BASE_ADDR    0xfed1c000
>  #define PM_IO_BASE_ADDR   0xb000


