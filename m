Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956D56E5FEA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 13:35:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pojb7-0002RE-VW; Tue, 18 Apr 2023 07:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pojav-0002PQ-SW
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:33:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pojau-0000qt-1Z
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681817634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ab8zvJnsTpBbpPUEwqL1m/47JdsDBwLNPmgh3GBq2e8=;
 b=C7SHE7u9En8VBv9YQNe6AmdhuNyDhm0ez3+bQHZU/w7T+xvzTlciglzOa3eqRuW7qL2SbD
 PkJHmRLGn87vL9qg6gpV7nIJAWDJ6pEXUcHzyrZ25swglOp53nr8pv1IVJ34C/jvzC8cji
 snA7+TfyaZDGOgOCmXNatfrzpZDgwfI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-38qP7sPSNDKlUTQuhjodXA-1; Tue, 18 Apr 2023 07:33:52 -0400
X-MC-Unique: 38qP7sPSNDKlUTQuhjodXA-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1a681ad22c8so8645125ad.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 04:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681817632; x=1684409632;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ab8zvJnsTpBbpPUEwqL1m/47JdsDBwLNPmgh3GBq2e8=;
 b=HdxjVrVrR8Pi0r1UNjRbxCMHOw4qn6uGzhh4VZiUQnLdgJV5p6jCat051pW3UF1uhK
 ZLovZum9wpXbiZIQ7pBo6GL5QbMyBBNJk1n4usEYkefwHiLadSOJoJsUlvDpawqKUmFI
 4MqnaviEBTaLa4gYxPJ0i4dAzm2n4KpMMpRZpwaCOrWou7d/kqcvwNImFDjuHCb8/L81
 6Wnsa/EE/ehQNdpJVqOdYq34aY7X8QsPafkCrsE1MYbAYjuJCgFt+hCohiGfwwhn34Bf
 z8DFNB/pp3+IVhq1Xy32NHVyTb/TyEHfOu5pdVx/LByUMBt/M73dQbrKqbapfaoncUO3
 Zsvw==
X-Gm-Message-State: AAQBX9flMye/aHNdJHQftaPk/VUUWhRar51LhonQ56OMui/Q85+Z3CkW
 wA7VUIVXFjw0EiuxrsbilU8s1WjJi5ogu12oO1lbKqMg6khbQ3vlKaoAxfZUs4anjsNvz+D/fz9
 n0PhCGDYLd7e3d8Q=
X-Received: by 2002:a17:902:f693:b0:1a2:8924:224a with SMTP id
 l19-20020a170902f69300b001a28924224amr2483030plg.25.1681817631823; 
 Tue, 18 Apr 2023 04:33:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350YFIYADAlGPdlT5jn6MffVUVTb54t/V07qsNNnk/iiRcTZ4ZU4awT407exKcUIo0ic9q5SuLg==
X-Received: by 2002:a17:902:f693:b0:1a2:8924:224a with SMTP id
 l19-20020a170902f69300b001a28924224amr2483008plg.25.1681817631489; 
 Tue, 18 Apr 2023 04:33:51 -0700 (PDT)
Received: from fc37-ani ([115.96.78.53]) by smtp.googlemail.com with ESMTPSA id
 jb21-20020a170903259500b001a67efce4dbsm6685057plb.12.2023.04.18.04.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 04:33:51 -0700 (PDT)
Date: Tue, 18 Apr 2023 17:03:45 +0530 (IST)
From: Ani Sinha <anisinha@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
cc: qemu-devel@nongnu.org, kchamart@redhat.com, 
 Gerd Hoffmann <kraxel@redhat.com>, mst@redhat.com, jusual@redhat.com
Subject: Re: [PATCH v4] acpi: pcihp: allow repeating hot-unplug requests
In-Reply-To: <20230418090449.2155757-1-imammedo@redhat.com>
Message-ID: <2650767a-16e2-a622-3606-1033e8e85d16@redhat.com>
References: <20230418090449.2155757-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On Tue, 18 Apr 2023, Igor Mammedov wrote:

> with Q35 using ACPI PCI hotplug by default, user's request to unplug
> device is ignored when it's issued before guest OS has been booted.
> And any additional attempt to request device hot-unplug afterwards
> results in following error:
>
>   "Device XYZ is already in the process of unplug"
>
> arguably it can be considered as a regression introduced by [2],
> before which it was possible to issue unplug request multiple
> times.
>
> Accept new uplug requests after timeout (1ms). This brings ACPI PCI
> hotplug on par with native PCIe unplug behavior [1] and allows user
> to repeat unplug requests at propper times.
> Set expire timeout to arbitrary 1msec so user won't be able to
> flood guest with SCI interrupts by calling device_del in tight loop.
>
> PS:
> ACPI spec doesn't mandate what OSPM can do with GPEx.status
> bits set before it's booted => it's impl. depended.
> Status bits may be retained (I tested with one Windows version)
> or cleared (Linux since 2.6 kernel times) during guest's ACPI
> subsystem initialization.
> Clearing status bits (though not wrong per se) hides the unplug
> event from guest, and it's upto user to repeat device_del later
> when guest is able to handle unplug requests.
>
> 1) 18416c62e3 ("pcie: expire pending delete")
> 2)
> Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> CC: mst@redhat.com
> CC: anisinha@redhat.com
> CC: jusual@redhat.com
> CC: kraxel@redhat.com
> ---
> v4:
>  * massage commit message some more (Kashyap Chamarthy <kchamart@redhat.com>)
>  * pickup Gerd's ACK
> ---
>  hw/acpi/pcihp.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index dcfb779a7a..cdd6f775a1 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -357,6 +357,16 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>       * acpi_pcihp_eject_slot() when the operation is completed.
>       */
>      pdev->qdev.pending_deleted_event = true;
> +    /* if unplug was requested before OSPM is initialized,
> +     * linux kernel will clear GPE0.sts[] bits during boot, which effectively
> +     * hides unplug event. And than followup qmp_device_del() calls remain
> +     * blocked by above flag permanently.
> +     * Unblock qmp_device_del() by setting expire limit, so user can
> +     * repeat unplug request later when OSPM has been booted.
> +     */
> +    pdev->qdev.pending_deleted_expires_ms =
> +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL); /* 1 msec */
> +
>      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>  }
> --
> 2.39.1
>
>


