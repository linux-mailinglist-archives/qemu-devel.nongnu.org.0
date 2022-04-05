Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C74F3F6E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 23:04:01 +0200 (CEST)
Received: from localhost ([::1]:35262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbqLI-0003Yh-CA
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 17:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nbqKC-0002q3-HE
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 17:02:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nbqK8-0004dy-9C
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 17:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649192566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lgj76FHpZJhVmMhlBHpatHW7S9h6YUv6a6AzS3oJ1gY=;
 b=bR8ncXW6SNh+6ficy9alDNRlOWDn90fhnk5LdZwYs8EgNpdhWb8Oszo++BPMd7mULRNR2D
 EbnoZSZBxZchISoWHzBaOq4EFVBFWQehTMhZ5aXgR4J5yKeJiGVpghphmzszpiSwE5weER
 j/zuvcI9eCQNTsA4Z2zkzoatGLxGY1Y=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-PKYj9aCqPzWJ2cCRr0chag-1; Tue, 05 Apr 2022 17:02:45 -0400
X-MC-Unique: PKYj9aCqPzWJ2cCRr0chag-1
Received: by mail-il1-f199.google.com with SMTP id
 m3-20020a056e02158300b002b6e3d1f97cso384741ilu.19
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 14:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=lgj76FHpZJhVmMhlBHpatHW7S9h6YUv6a6AzS3oJ1gY=;
 b=VSoFrl/cTjMF+oHz6PQwvjTNEhwoFtJ/j6xBpLokMxa5hp0bU8yfMOXCS5A+nAIFan
 JFbnRNMdjUP7YB3I5qQ4VSW/Vm/c4dA8nnek/w5FSGZ5ilXXGjE1iH1M2cG0J5LgA+8E
 TH0VPd/X4SsUHmET7gX/6IqwqqquUrS013kUSDhfwl006kd9KzPgtHw4PCfqKGaixb6q
 1+59aGQFoiDQUQ1aSkacMyVyaALQmudbPv+Iv6bRz/QeCMJb9DVjXfRksfmrbTDaLCza
 LDLhnDGfooFCkWMnFzmE8msffuygdhMMZdOF0qqgzoVbr4Dl9d/42su9CDqFRJdYNi5U
 ZeWA==
X-Gm-Message-State: AOAM531hWNnHHiBHmiGmwTbLfPSgF3wgK1J0ZqmG3lmujSR1zUqPwLcY
 un32XlbwKhoCLj88Dls1WhxlzYkQo2s0wYyh6KHJ46/1jp7cwwYBcAplQ1LKJCoeq7bT3qIEq2M
 LgdMcqBo9iFwLXEs=
X-Received: by 2002:a05:6602:2f01:b0:5ec:f99a:93a1 with SMTP id
 q1-20020a0566022f0100b005ecf99a93a1mr2598819iow.109.1649192564678; 
 Tue, 05 Apr 2022 14:02:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4u36tM3VGJNVnYjB6Wbw1cih/Q/KlJ6R7Yag+PxxhafmrxfdpxtH6C6F/KcD83dsGWEi6tQ==
X-Received: by 2002:a05:6602:2f01:b0:5ec:f99a:93a1 with SMTP id
 q1-20020a0566022f0100b005ecf99a93a1mr2598804iow.109.1649192564404; 
 Tue, 05 Apr 2022 14:02:44 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 y12-20020a056602164c00b00645cdfb42dasm9444002iow.30.2022.04.05.14.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:02:44 -0700 (PDT)
Date: Tue, 5 Apr 2022 15:02:42 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] acpi: Bodge acpi_index migration
Message-ID: <20220405150242.517e9bdb.alex.williamson@redhat.com>
In-Reply-To: <20220405190658.65187-1-dgilbert@redhat.com>
References: <20220405190658.65187-1-dgilbert@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org, peterx@redhat.com, leobras@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  5 Apr 2022 20:06:58 +0100
"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The 'acpi_index' field is a statically configured field, which for
> some reason is migrated; this never makes much sense because it's
> command line static.
> 
> However, on piix4 it's conditional, and the condition/test function
> ends up having the wrong pointer passed to it (it gets a PIIX4PMState
> not the AcpiPciHpState it was expecting, because VMSTATE_PCI_HOTPLUG
> is a macro and not another struct).  This means the field is randomly
> loaded/saved based on a random pointer.  In 6.x this random pointer
> randomly seems to get 0 for everyone (!); in 7.0rc it's getting junk
> and trying to load a field that the source didn't send.

FWIW, after some hunting and pecking, 6.2 (64bit):

(gdb) p &((struct AcpiPciHpState *)0)->acpi_index
$1 = (uint32_t *) 0xc04

(gdb) p &((struct PIIX4PMState *)0)->ar.tmr.io.addr
$2 = (hwaddr *) 0xc00

f53faa70bb63:

(gdb) p &((struct AcpiPciHpState *)0)->acpi_index
$1 = (uint32_t *) 0xc04

(gdb) p &((struct PIIX4PMState *)0)->io_gpe.coalesced.tqh_circ.tql_prev
$2 = (struct QTailQLink **) 0xc00

So yeah, it seems 0xc04 will always be part of a pointer on current
mainline.  I can't really speak to the ACPIPMTimer MemoryRegion in the
PIIX4PMState, maybe if there's a hwaddr it's always 32bit and the upper
dword is reliably zero?  Thanks,

Alex

>  The migration
> stream gets out of line and hits the section footer.
> 
> The bodge is on piix4 never to load the field:
>   a) Most 6.x builds never send it, so most of the time the migration
>     will work.
>   b) We can backport this fix to 6.x to remove the boobytrap.
>   c) It should never have made a difference anyway since the acpi-index
>     is command line configured and should be correct on the destination
>     anyway
>   d) ich9 is still sending/receiving this (unconditionally all the time)
>     but due to (c) should never notice.  We could follow up to make it
>     skip.
> 
> It worries me just when (a) actually happens.
> 
> Fixes: b32bd76 ("pci: introduce acpi-index property for PCI device")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/932
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/acpi/acpi-pci-hotplug-stub.c |  4 ----
>  hw/acpi/pcihp.c                 |  6 ------
>  hw/acpi/piix4.c                 | 11 ++++++++++-
>  include/hw/acpi/pcihp.h         |  2 --
>  4 files changed, 10 insertions(+), 13 deletions(-)
> 
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
> index cc37fa3416..48aeedd5f0 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -267,6 +267,15 @@ static bool piix4_vmstate_need_smbus(void *opaque, int version_id)
>      return pm_smbus_vmstate_needed();
>  }
>  
> +/*
> + * This is a fudge to turn off the acpi_index field, whose
> + * test was always broken on piix4.
> + */
> +static bool vmstate_test_never(void *opaque, int version_id)
> +{
> +    return false;
> +}
> +
>  /* qemu-kvm 1.2 uses version 3 but advertised as 2
>   * To support incoming qemu-kvm 1.2 migration, change version_id
>   * and minimum_version_id to 2 below (which breaks migration from
> @@ -297,7 +306,7 @@ static const VMStateDescription vmstate_acpi = {
>              struct AcpiPciHpPciStatus),
>          VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,
>                              vmstate_test_use_acpi_hotplug_bridge,
> -                            vmstate_acpi_pcihp_use_acpi_index),
> +                            vmstate_test_never),
>          VMSTATE_END_OF_LIST()
>      },
>      .subsections = (const VMStateDescription*[]) {
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


