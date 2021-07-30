Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896273DB907
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 15:06:30 +0200 (CEST)
Received: from localhost ([::1]:40674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9SDd-0006zk-5C
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 09:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m9SCE-0006C1-CH
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:05:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m9SC9-0002oH-J1
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627650294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSJS92fy9dOmxStkcczZJsJzcp8BU/AsLktNYfOQdZg=;
 b=JWwxt2fQ484kyGqAp+NZxEyMYwzPWSCmzlkLO3E10JRmAfOhmUT6yP/eFBcMcBw1/Plbvy
 mTbwsebsr1wUucc6XAYHr/SNoDZ/VaVPcE2YCV49zJhgbqyM36uJIQho20ZtR4+DL/O2ld
 hnrIynPJKukcJ3wQAM+8AfW8PAOAnLo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-WTzmn2eOMMaKCH56QF0RAw-1; Fri, 30 Jul 2021 09:04:53 -0400
X-MC-Unique: WTzmn2eOMMaKCH56QF0RAw-1
Received: by mail-wr1-f71.google.com with SMTP id
 p2-20020a5d48c20000b0290150e4a5e7e0so3179467wrs.13
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vSJS92fy9dOmxStkcczZJsJzcp8BU/AsLktNYfOQdZg=;
 b=kMfm1zYZc8O7I6faNV0zSM/CEm0oJhUyRF8mPz5ScP9F1rZPn6wDA1Buog2/+Me7Oz
 EN82iJBRwy211OeZsnrgZb11eKiDKhSN0PEPlQRLQARtob7gqlVXUx9Te85UMyHoqSCE
 WPD4G9mxCcv4Rr9+VTu+xxL80fHlYsYt1qcXUzrH316z2Df4qWBjkrKBgUAAsBhBv35H
 uZmUv1aWUVH/qtAI+LrQvokVKpMIvvvFuIbszdAUWxaZ+CXWFP8uf6Otc8vSgWiMvuVF
 viUJ7ppAGFxhWlL7b8xxbPMBhKAtOo9YvK4m0OW9ujU0sbbYHX5ITATcTsOAYk8ps3HR
 UT7Q==
X-Gm-Message-State: AOAM531vU8WT1/uJgKdCgiWYUmxgxe2aMIBeUsGupnceNvrj7LPUaI/s
 kfB//QwAR40s4uvDHtNJCOS1ME5cut0DE9Ea2EUKIPUpbctpe5Y9sRGVa57g183KoD36cyXcK7O
 OOSNgmn2zZQD7Wx0=
X-Received: by 2002:a7b:c944:: with SMTP id i4mr2912975wml.23.1627650292516;
 Fri, 30 Jul 2021 06:04:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAXOH+tzQLJaEsHChVkQAykn0yGdpen9H8RR82WvsjIbf6dzrlXE1Bq0xjcKN7nfkyxZ3ekg==
X-Received: by 2002:a7b:c944:: with SMTP id i4mr2912950wml.23.1627650292275;
 Fri, 30 Jul 2021 06:04:52 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id h14sm1708592wrp.55.2021.07.30.06.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:04:51 -0700 (PDT)
Date: Fri, 30 Jul 2021 15:04:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/5] docs/specs/acpi_pci_hotplug: Convert to rST
Message-ID: <20210730150450.164f29d0@redhat.com>
In-Reply-To: <20210727170414.3368-4-peter.maydell@linaro.org>
References: <20210727170414.3368-1-peter.maydell@linaro.org>
 <20210727170414.3368-4-peter.maydell@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>, jusual@redhat.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Jul 2021 18:04:12 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> Convert the PCI hotplug spec document to rST.

Julia,

This doc doesn't describe ACPI PCI hotplug we have now,
Care to update it?

> ---
>  ...i_pci_hotplug.txt => acpi_pci_hotplug.rst} | 37 ++++++++++---------
>  docs/specs/index.rst                          |  1 +
>  2 files changed, 21 insertions(+), 17 deletions(-)
>  rename docs/specs/{acpi_pci_hotplug.txt => acpi_pci_hotplug.rst} (51%)
> 
> diff --git a/docs/specs/acpi_pci_hotplug.txt b/docs/specs/acpi_pci_hotplug.rst
> similarity index 51%
> rename from docs/specs/acpi_pci_hotplug.txt
> rename to docs/specs/acpi_pci_hotplug.rst
> index a839434f313..685bc5c322f 100644
> --- a/docs/specs/acpi_pci_hotplug.txt
> +++ b/docs/specs/acpi_pci_hotplug.rst
> @@ -1,45 +1,48 @@
>  QEMU<->ACPI BIOS PCI hotplug interface
> ---------------------------------------
> +======================================
>  
>  QEMU supports PCI hotplug via ACPI, for PCI bus 0. This document
>  describes the interface between QEMU and the ACPI BIOS.
>  
> -ACPI GPE block (IO ports 0xafe0-0xafe3, byte access):
> ------------------------------------------
> +ACPI GPE block (IO ports 0xafe0-0xafe3, byte access)
> +----------------------------------------------------
>  
>  Generic ACPI GPE block. Bit 1 (GPE.1) used to notify PCI hotplug/eject
>  event to ACPI BIOS, via SCI interrupt.
>  
> -PCI slot injection notification pending (IO port 0xae00-0xae03, 4-byte access):
> ----------------------------------------------------------------
> +PCI slot injection notification pending (IO port 0xae00-0xae03, 4-byte access)
> +------------------------------------------------------------------------------
> +
>  Slot injection notification pending. One bit per slot.
>  
>  Read by ACPI BIOS GPE.1 handler to notify OS of injection
>  events.  Read-only.
>  
> -PCI slot removal notification (IO port 0xae04-0xae07, 4-byte access):
> ------------------------------------------------------
> +PCI slot removal notification (IO port 0xae04-0xae07, 4-byte access)
> +--------------------------------------------------------------------
> +
>  Slot removal notification pending. One bit per slot.
>  
>  Read by ACPI BIOS GPE.1 handler to notify OS of removal
>  events.  Read-only.
>  
> -PCI device eject (IO port 0xae08-0xae0b, 4-byte access):
> -----------------------------------------
> +PCI device eject (IO port 0xae08-0xae0b, 4-byte access)
> +-------------------------------------------------------
>  
>  Write: Used by ACPI BIOS _EJ0 method to request device removal.
>  One bit per slot.
>  
>  Read: Hotplug features register.  Used by platform to identify features
>  available.  Current base feature set (no bits set):
> - - Read-only "up" register @0xae00, 4-byte access, bit per slot
> - - Read-only "down" register @0xae04, 4-byte access, bit per slot
> - - Read/write "eject" register @0xae08, 4-byte access,
> -   write: bit per slot eject, read: hotplug feature set
> - - Read-only hotplug capable register @0xae0c, 4-byte access, bit per slot
>  
> -PCI removability status (IO port 0xae0c-0xae0f, 4-byte access):
> ------------------------------------------------
> +- Read-only "up" register @0xae00, 4-byte access, bit per slot
> +- Read-only "down" register @0xae04, 4-byte access, bit per slot
> +- Read/write "eject" register @0xae08, 4-byte access,
> +  write: bit per slot eject, read: hotplug feature set
> +- Read-only hotplug capable register @0xae0c, 4-byte access, bit per slot
> +
> +PCI removability status (IO port 0xae0c-0xae0f, 4-byte access)
> +--------------------------------------------------------------
>  Used by ACPI BIOS _RMV method to indicate removability status to OS. One
> -bit per slot.  Read-only
> +bit per slot.  Read-only.
> diff --git a/docs/specs/index.rst b/docs/specs/index.rst
> index 17cc7868b91..8296fb19b72 100644
> --- a/docs/specs/index.rst
> +++ b/docs/specs/index.rst
> @@ -15,3 +15,4 @@ guest hardware that is specific to QEMU.
>     acpi_hest_ghes
>     acpi_cpu_hotplug
>     acpi_mem_hotplug
> +   acpi_pci_hotplug


