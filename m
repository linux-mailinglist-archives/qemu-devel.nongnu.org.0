Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057FF4F6976
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 20:57:52 +0200 (CEST)
Received: from localhost ([::1]:59204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncAqk-0004BJ-NY
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 14:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ncApd-0003RD-O4
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ncApZ-00060T-Md
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649271396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6NnAZDbDB9Sv3xXZwE34DrNuSPQuxJL4Ss3Jr7OcSno=;
 b=JQgCv3XJkzRi7sGT8XJUe///x/w7S9TBuaqsl65T6k3bUOYw/qzyhXbIGSDm76ai8meX3x
 1CFMmpjAIoyl6hL5bw3PeR/psMvFpioJwD8vQPx3m8f05p88hnL5EqTL28f6g/5cZ760/U
 L8CQrz7+HkHHgjprGzVAHC1R6LmPAN0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-e4EHeXCFOFKr0uZqccohAg-1; Wed, 06 Apr 2022 14:56:33 -0400
X-MC-Unique: e4EHeXCFOFKr0uZqccohAg-1
Received: by mail-wm1-f69.google.com with SMTP id
 a16-20020a05600c349000b0038e6392a346so1712521wmq.4
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 11:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6NnAZDbDB9Sv3xXZwE34DrNuSPQuxJL4Ss3Jr7OcSno=;
 b=WGGPRtUYK5lCBmg3zjQ5KaBKx1snNrwiENV6V+tAhZ/iza3YddM3r4bLmIvJmilbww
 X24hkzHnguRQwdzJMzDRlimXW3GtTUHBwjJP3bb48ahgWmiNxvzekBioy/12V7bpTJsM
 vbZ0a1DaH2sYslV+4rbKEAQeR/GYVNxcY3J3SSb99wXyNuWPMQ6aP3QX167khz3NWBbd
 7hqcvPnZ/FagdmcL31WtLr51k+vM/KGZb6TkW4mhIjfYtjR5+9dpLBg4FKy1b7qUf49q
 NObKtT3EggoF8LbGu9KrchSRic7l6yublT6FLGoe4NHOAcIwxlFr8IuNAPQ20qfD/ya8
 FMCA==
X-Gm-Message-State: AOAM531DWlbuog1dvTn7t8pWtErNBitArZxjVT7Qznnf1wAVau95T6kX
 iIiVOXK0Z99WrPViy+47IFQvWgjztoW67Odicu48UsIzSKJDdEMrrqI9AGvsnBo00n7zqtWVP0o
 1iKxsg6avSoK2Kbo=
X-Received: by 2002:adf:f4cd:0:b0:206:1216:c9bd with SMTP id
 h13-20020adff4cd000000b002061216c9bdmr7615013wrp.22.1649271392143; 
 Wed, 06 Apr 2022 11:56:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycaBtg9Eo5/vILyAHjI0Bk5Zol+c98MkKR/5r6RHzZ5olprM3WjZqclSfysIJB4NACR9AIVg==
X-Received: by 2002:adf:f4cd:0:b0:206:1216:c9bd with SMTP id
 h13-20020adff4cd000000b002061216c9bdmr7614991wrp.22.1649271391890; 
 Wed, 06 Apr 2022 11:56:31 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q187-20020a1c43c4000000b0038e70f4f42dsm5488627wma.47.2022.04.06.11.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:56:31 -0700 (PDT)
Date: Wed, 6 Apr 2022 19:56:29 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] acpi: fix acpi_index migration
Message-ID: <Yk3iXZfSsX5Np3AJ@work-vm>
References: <20220406184059.1055102-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220406184059.1055102-1-imammedo@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, alex.williamson@redhat.com,
 leobras@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Igor Mammedov (imammedo@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> vmstate_acpi_pcihp_use_acpi_index() was expecting AcpiPciHpState
> as state but it actually received PIIX4PMState, because
> VMSTATE_PCI_HOTPLUG is a macro and not another struct.
> So it ended up accessing random pointer, which resulted
> in 'false' return value and acpi_index field wasn't ever
> sent.
> 
> However in 7.0 that pointer de-references to value > 0, and
> destination QEMU starts to expect the field which isn't
> sent in migratioon stream from older QEMU (6.2 and older).
> As result migration fails with:
>   qemu-system-x86_64: Missing section footer for 0000:00:01.3/piix4_pm
>   qemu-system-x86_64: load of migration failed: Invalid argument
> 
> In addition with QEMU-6.2, destination due to not expected
> state, also never expects the acpi_index field in migration
> stream.
> 
> Q35 is not affected as it always sends/expects the field as
> long as acpi based PCI hotplug is enabled.
> 
> Fix issue by introducing compat knob to never send/expect
> acpi_index in migration stream for 6.2 and older PC machine
> types and always send it for 7.0 and newer PC machine types.
> 
> Diagnosed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Fixes: b32bd76 ("pci: introduce acpi-index property for PCI device")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/932
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/hw/acpi/pcihp.h         |  2 --
>  hw/acpi/acpi-pci-hotplug-stub.c |  4 ----
>  hw/acpi/pcihp.c                 |  6 ------
>  hw/acpi/piix4.c                 | 15 ++++++++++++++-
>  hw/core/machine.c               |  4 +++-
>  5 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index af1a169fc3..7e268c2c9c 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -73,8 +73,6 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
>  
>  extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
>  
> -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id);
> -
>  #define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp, test_acpi_index) \
>          VMSTATE_UINT32_TEST(pcihp.hotplug_select, state, \
>                              test_pcihp), \
> diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
> index 734e4c5986..a43f6dafc9 100644
> --- a/hw/acpi/acpi-pci-hotplug-stub.c
> +++ b/hw/acpi/acpi-pci-hotplug-stub.c
> @@ -41,7 +41,3 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
>      return;
>  }
>  
> -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
> -{
> -    return false;
> -}
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 6351bd3424..bf65bbea49 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -554,12 +554,6 @@ void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
>                                     OBJ_PROP_FLAG_READ);
>  }
>  
> -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
> -{
> -     AcpiPciHpState *s = opaque;
> -     return s->acpi_index;
> -}
> -
>  const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>      .name = "acpi_pcihp_pci_status",
>      .version_id = 1,
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index cc37fa3416..fe5625d07a 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -82,6 +82,7 @@ struct PIIX4PMState {
>      AcpiPciHpState acpi_pci_hotplug;
>      bool use_acpi_hotplug_bridge;
>      bool use_acpi_root_pci_hotplug;
> +    bool not_migrate_acpi_index;
>  
>      uint8_t disable_s3;
>      uint8_t disable_s4;
> @@ -267,6 +268,16 @@ static bool piix4_vmstate_need_smbus(void *opaque, int version_id)
>      return pm_smbus_vmstate_needed();
>  }
>  
> +/*
> + * This is a fudge to turn off the acpi_index field,
> + * whose test was always broken on piix4 with 6.2 and older machine types.
> + */
> +static bool vmstate_test_migrate_acpi_index(void *opaque, int version_id)
> +{
> +    PIIX4PMState *s = PIIX4_PM(opaque);
> +    return s->use_acpi_hotplug_bridge && !s->not_migrate_acpi_index;
> +}
> +
>  /* qemu-kvm 1.2 uses version 3 but advertised as 2
>   * To support incoming qemu-kvm 1.2 migration, change version_id
>   * and minimum_version_id to 2 below (which breaks migration from
> @@ -297,7 +308,7 @@ static const VMStateDescription vmstate_acpi = {
>              struct AcpiPciHpPciStatus),
>          VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,
>                              vmstate_test_use_acpi_hotplug_bridge,
> -                            vmstate_acpi_pcihp_use_acpi_index),
> +                            vmstate_test_migrate_acpi_index),
>          VMSTATE_END_OF_LIST()
>      },
>      .subsections = (const VMStateDescription*[]) {
> @@ -652,6 +663,8 @@ static Property piix4_pm_properties[] = {
>      DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
>                       acpi_memory_hotplug.is_enabled, true),
>      DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, false),
> +    DEFINE_PROP_BOOL("x-not-migrate-acpi-index", PIIX4PMState,
> +                      not_migrate_acpi_index, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d856485cb4..1e23fdc14b 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,7 +37,9 @@
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-pci.h"
>  
> -GlobalProperty hw_compat_6_2[] = {};
> +GlobalProperty hw_compat_6_2[] = {
> +    { "PIIX4_PM", "x-not-migrate-acpi-index", "on"},
> +};
>  const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
>  
>  GlobalProperty hw_compat_6_1[] = {
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


