Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0F03D5916
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:02:33 +0200 (CEST)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7zJY-0004Ii-9C
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7zH3-0002h0-T8
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:59:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7zH1-0001BN-8C
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627300793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xjN1WvYXBLyC7AFDEmZBxnjdX7q3fssD+gcjxqrfhc=;
 b=DV2WThktvgHA9Eft9yenwjpFlZDHdr2I9D2OmEO23OGfFILdD3Qt63nGJuQqdljK3YsDln
 FeZAdtFK3f1OqliJOGCHNfxEbLspx+zorC83BRHWr6bzwyWz0yzrqG8XRe8uePKmzZBOBl
 JUjHNF9BDl+2tTTgo+t1odavFKaqasQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-SiH5PYStP02EttNvxfypVA-1; Mon, 26 Jul 2021 07:59:52 -0400
X-MC-Unique: SiH5PYStP02EttNvxfypVA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adfc3cd0000b02901531b0b7c89so4115079wrg.23
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 04:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4xjN1WvYXBLyC7AFDEmZBxnjdX7q3fssD+gcjxqrfhc=;
 b=sq7bqNTZ+YTRG1MZMayMlkZVfwg/6XT9t+QWCt6VzIlPHu8xjOh/JApwbtMCGbEpgR
 umTrDxndkiq0D5HRKZMIZbnhT4FnjB3lJTdpIPrUrFFBqyTU5yAbeXHq/pVeoprsWiez
 DXxLS/StQjnXbqrrErrM+PZ1MzWxA7pI91SdZR+dWfl4YsL8Weswud+uk4e+kFLU1lkT
 PMUCiF59gYYDFNxiroJ3sdTTohZ7AyZi3QS9NNe0v/6k2ndk3Ip3pZgxQL1YhsC077vf
 jGv8PBtxXJ4s/vy2ClHDXHCZGMU8zUPTlKBhYk21FTD4xgg9JPrBQJWwSKbu4RwCDOy4
 LllA==
X-Gm-Message-State: AOAM533EBUstK9MIqQ+9XCS6vGBzuXZBApTEjQy0s3w5sZLgbwizXkJ3
 6pi9o25e3VgXtYhFS8kpJVCea4mmZhED9h9gVnid2ecuznGYWiKjv0EOeQADjdeqVIsXhqmfKOd
 RE0bJEAVNcaE61h0=
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr3288549wrm.327.1627300791396; 
 Mon, 26 Jul 2021 04:59:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8NQhEqeyViz2IS1GV36Q5zDeNZqOyja8//uGROIjHhtRCxFtVWuL9P2jQRsTCbeswXg3cxQ==
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr3288530wrm.327.1627300791154; 
 Mon, 26 Jul 2021 04:59:51 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id g3sm42319917wru.95.2021.07.26.04.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 04:59:50 -0700 (PDT)
Date: Mon, 26 Jul 2021 13:59:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/acpi: some cosmetic improvements to existing code
Message-ID: <20210726135949.6e55593b@redhat.com>
In-Reply-To: <20210721141610.139310-1-ani@anisinha.ca>
References: <20210721141610.139310-1-ani@anisinha.ca>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Jul 2021 19:46:10 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> All existing code using acpi_get_i386_pci_host() checks for a non-null
> return from this function call. This change brings the same check to
> acpi_pcihp_disable_root_bus() function. Also adds a comment describing
> why we unconditionally pass a truth value to the last argument when calling
> acpi_pcihp_reset() from ich9 platform.
> 
> Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/acpi/ich9.c  | 1 +
>  hw/acpi/pcihp.c | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 778e27b659..58d8430eb9 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -281,6 +281,7 @@ static void pm_reset(void *opaque)
>      pm->smi_en_wmask = ~0;
>  
>      if (pm->use_acpi_hotplug_bridge) {
> +        /* on root PCIE bus, we always use native or SHPC based hotplug */
I had an impression that root bus doesn't support hotplug at all,
and to have hotplug there one should attach a root-port to root bus at
start up time.

>          acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
>      }
>  
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index f4d706e47d..856c6e1b47 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -136,6 +136,11 @@ static void acpi_pcihp_disable_root_bus(void)
>          return;
>      }
>  
> +    if (!host) {
> +        root_hp_disabled = true;
> +        return;
> +    }
It should be a separate patch,
when this could return NULL?
If it should never be null then assert here would be better.
 
> +
>      bus = PCI_HOST_BRIDGE(host)->bus;
>      if (bus) {
>          /* setting the hotplug handler to NULL makes the bus non-hotpluggable */


