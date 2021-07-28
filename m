Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9C63D8E7A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 15:05:46 +0200 (CEST)
Received: from localhost ([::1]:48908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8jFp-00031a-A4
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 09:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m8jDx-0002Jc-RS
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:03:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m8jDw-00017s-BI
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627477427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6QzOIzYnBrz/tRqyiqqTjvD619dxSjzwRwOkznfh93g=;
 b=cyFesG/zIJZbqjGsgQ7F2YMy7AM/+G0Ykxk1+RqSAlJ+TWGP2jZrMPXoR0ZUX8wnaPTVlS
 8bxsY0kJcz/31vq//EdXCoSrIfmuP4SjwhKaKT6rFmoRHwIoQOPuAZq9aVXszPcsI4GT7s
 bbeRVKIBg4mqkHav4aJiHH1XTviKMH8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-t0NkkHwVN1GGIHdM6T_Ntw-1; Wed, 28 Jul 2021 09:03:46 -0400
X-MC-Unique: t0NkkHwVN1GGIHdM6T_Ntw-1
Received: by mail-ej1-f69.google.com with SMTP id
 n9-20020a1709063789b02905854bda39fcso809916ejc.1
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 06:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6QzOIzYnBrz/tRqyiqqTjvD619dxSjzwRwOkznfh93g=;
 b=eD0Y3gub2GtCTpfRRdQ83f4ge5IDtCdBGSa0CuOIZCCvBdFD6PDfAeK8dwtLp6womb
 orkGx3rlvMo6W/qKiHBge1vtPVO8lGULrQcwBN3NdEVE04/PBWjqnm5eCK96snai+MbD
 C/R8p7RT4qVCh6m8qjIIizIq+drQBB8HMFvhgXzi3B7DDD4fbARZEv2WhaEsB5MVqx/J
 vj8eHMNEAOpFsn9XhG7ERLWx82zcKY93SlY1JixxA7xwpT14t+8GmWhxeIaELCEnYAkO
 Jd6iu09dMW3SuHuiFvCUK98digTYcTlyE9Cmlha09tjm+9TL3kO4cCkNsGKQBy8UnqtC
 Zs6g==
X-Gm-Message-State: AOAM531UdE2mXmkD6jLgG4WXYUzDqtqPNp1sINYM1FRggComULBMf546
 89m9vifzLzcSwXJD4c8ATyVlZ0oDoId84JGp1HzyYnnbBIaJt0Y8yaejLEkX032iWhjLWex3BKN
 RUak4z9gI62MnAlQ=
X-Received: by 2002:a05:6402:184b:: with SMTP id
 v11mr5390467edy.267.1627477424835; 
 Wed, 28 Jul 2021 06:03:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyp9vyBhKJMdf9B9H4imljhltqYyt0ElxqME3fGbFUfNDiNvS1dSsONMWcNOUt0xRGTer4R0Q==
X-Received: by 2002:a05:6402:184b:: with SMTP id
 v11mr5390457edy.267.1627477424704; 
 Wed, 28 Jul 2021 06:03:44 -0700 (PDT)
Received: from redhat.com ([2.55.154.10])
 by smtp.gmail.com with ESMTPSA id nd14sm1613278ejc.113.2021.07.28.06.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 06:03:44 -0700 (PDT)
Date: Wed, 28 Jul 2021 09:03:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
Message-ID: <20210728085437-mutt-send-email-mst@kernel.org>
References: <20210726165743.232073-1-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20210726165743.232073-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, jusual@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26, 2021 at 10:27:43PM +0530, Ani Sinha wrote:
> All existing code using acpi_get_i386_pci_host() checks for a non-null
> return value from this function call. Instead of returning early when the value
> returned is NULL, assert instead. Since there are only two possible host buses
> for i386 - q35 and i440fx, a null value return from the function does not make
> sense in most cases and is likely an error situation.

add "on i386"?

> Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")

This that seems inappropriate, this is not a bugfix.

> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>


Frankly I don't see this as a useful cleanup.
assert is generally a last resort thing.

> ---
>  hw/acpi/pcihp.c      |  8 ++++++++
>  hw/i386/acpi-build.c | 15 ++++++---------
>  2 files changed, 14 insertions(+), 9 deletions(-)
> 
> changelog:
> v1: initial patch
> v2: removed comment addition - that can be sent as a separate patch.
> v3: added assertion for null host values for all cases except one.
> 
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index f4d706e47d..054ee8cbc5 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -116,6 +116,12 @@ static void acpi_set_pci_info(void)
>      bsel_is_set = true;
>  
>      if (!host) {
> +        /*
> +         * This function can be eventually called from
> +         * qemu_devices_reset() -> acpi_pcihp_reset() even
> +         * for architectures other than i386. Hence, we need

why call out i386 here? well because currently host
is only non-null for q35 and i440fx which are both i386.
all the above is not a given and we won't remember to update
the comment if we change it. Generally graceful failure
is the default or should be.



> +         * to ignore null values for host here.
> +         */
>          return;
>      }
>  
> @@ -136,6 +142,8 @@ static void acpi_pcihp_disable_root_bus(void)
>          return;
>      }
>  
> +    assert(host);
> +
>      bus = PCI_HOST_BRIDGE(host)->bus;
>      if (bus) {
>          /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 17836149fe..83fb1d55c0 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -321,9 +321,7 @@ static void acpi_get_pci_holes(Range *hole, Range *hole64)
>  
>      pci_host = acpi_get_i386_pci_host();
>  
> -    if (!pci_host) {
> -        return;
> -    }
> +    assert(pci_host);
>  
>      range_set_bounds1(hole,
>                        object_property_get_uint(pci_host,
> @@ -1769,9 +1767,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>  
>          pci_host = acpi_get_i386_pci_host();
>  
> -        if (pci_host) {
> -            bus = PCI_HOST_BRIDGE(pci_host)->bus;
> -        }
> +        assert(pci_host);
> +
> +        bus = PCI_HOST_BRIDGE(pci_host)->bus;
>  
>          if (bus) {
>              Aml *scope = aml_scope("PCI0");
> @@ -2389,9 +2387,8 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>      QObject *o;
>  
>      pci_host = acpi_get_i386_pci_host();
> -    if (!pci_host) {
> -        return false;
> -    }
> +
> +    assert(pci_host);
>  
>      o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_BASE, NULL);
>      if (!o) {
> -- 
> 2.25.1


