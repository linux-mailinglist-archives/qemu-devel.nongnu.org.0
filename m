Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D0E2B43C7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:33:42 +0100 (CET)
Received: from localhost ([::1]:47184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedhV-00031C-Vj
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kedbi-0005g9-F4
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:27:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kedbf-0004Hf-49
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605529658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rD+QSWdz/YcBQKNyrzCE+3PGwmKzb1wHx9H4GDC3+jA=;
 b=ZxCGkhtMxbQ2AyuZoA/PjpZTDF/BO26vKvnBd3gUClMoNP7SeaRcQAsxCkSuQElEwKFPl9
 yXy7QRv+6AmvX25nJC8jafc3qpXcj8ka26+2LNrS6yfQygU8UAdHdrTcQx/9KNrK2oBfZd
 Dw9G129r1a3Sn6bzhE6WdflH4C4PaZc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-jaXTqkybNqOydJ5YmI53TA-1; Mon, 16 Nov 2020 07:27:36 -0500
X-MC-Unique: jaXTqkybNqOydJ5YmI53TA-1
Received: by mail-wr1-f71.google.com with SMTP id w6so11032331wrk.1
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=z+SfEpiFmIbt6MbpWwrAr3cNgWMkJV/bIDq7/MNEJSc=;
 b=rTdDj9f/MLAauWsIjQRA6rFzFiZC+4M1W9Tc8r6bWrl1HEEgVkv0O8AEzfuuHDfFqj
 RWR7POYBat60LdrDkmEjY1pweZotjon8tlxSbcg9c8piUhmCY9coFLYlbSqJoqiJ9slD
 KMk+i5MVS4r0O+46CzJPpkH/vgLpe9l/U/6PtyDB6fuWKxMmjoIet1J3b8CPYK5hD+Ro
 OACRnLmoNSa0p/PhAaedMXubrYK9RJV7rNetJrz5S91dtIcvVRY+Q9rBs0qWa0eBd78B
 rnDoQ7ffF49uBj1UvIVW5PKknXDFB4G7g84A47ODh8cxUmouTbLBw7D9q6q78EX1pNI7
 5knA==
X-Gm-Message-State: AOAM5302V14by2Ql4uJvm+nUb3vtYydb96ki8kmzDKM+r4DEw0+3Xfhr
 cQWojYlh4tOdELqsbywJYnWUr+kOySyPHtW6IKDVI/QXRP5uYes9p35Og0qgJU1Pl2vTorSQLZu
 H/U3jVIfTGDa0Qos=
X-Received: by 2002:a1c:66c4:: with SMTP id
 a187mr15223452wmc.186.1605529655251; 
 Mon, 16 Nov 2020 04:27:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxN8v5j9SJOveOFSTy8V/arZGd0XazKny0VszpsYWKeO87FaxQ1yFuYJ2FBANkABvwIjln5sA==
X-Received: by 2002:a1c:66c4:: with SMTP id
 a187mr15223435wmc.186.1605529655058; 
 Mon, 16 Nov 2020 04:27:35 -0800 (PST)
Received: from redhat.com ([147.161.8.56])
 by smtp.gmail.com with ESMTPSA id p12sm22364335wrw.28.2020.11.16.04.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:27:34 -0800 (PST)
Date: Mon, 16 Nov 2020 07:27:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL 7/9] hw/i386/acpi-build: Fix maybe-uninitialized error
 when ACPI hotplug off
Message-ID: <20201116072607-mutt-send-email-mst@kernel.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
 <20201116122417.28346-8-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201116122417.28346-8-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 12:24:15PM +0000, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> GCC 9.3.0 thinks that 'method' can be left uninitialized. This code
> is already in the "if (bsel || pcihp_bridge_en)" block statement,
> but it isn't smart enough to figure it out.
> 
> Restrict the code to be used only in the "if (bsel || pcihp_bridge_en)"
> block statement to fix (on Ubuntu):
> 
>   ../hw/i386/acpi-build.c: In function 'build_append_pci_bus_devices':
>   ../hw/i386/acpi-build.c:496:9: error: 'method' may be used uninitialized
>   in this function [-Werror=maybe-uninitialized]
>     496 |         aml_append(parent_scope, method);
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
> 
> Fixes: df4008c9c59 ("piix4: don't reserve hw resources when hotplug is off globally")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Message-Id: <20201108204535.2319870-4-philmd@redhat.com>
> Message-Id: <20201110192316.26397-8-alex.bennee@linaro.org>

BTW it's in my pull request alredy.
Not sure why you are merging it too ...

> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4f66642d88..1f5c211245 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -465,34 +465,31 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>       */
>      if (bsel || pcihp_bridge_en) {
>          method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
> -    }
> -    /* If bus supports hotplug select it and notify about local events */
> -    if (bsel) {
> -        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
>  
> -        aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
> -        aml_append(method,
> -            aml_call2("DVNT", aml_name("PCIU"), aml_int(1) /* Device Check */)
> -        );
> -        aml_append(method,
> -            aml_call2("DVNT", aml_name("PCID"), aml_int(3)/* Eject Request */)
> -        );
> -    }
> +        /* If bus supports hotplug select it and notify about local events */
> +        if (bsel) {
> +            uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
>  
> -    /* Notify about child bus events in any case */
> -    if (pcihp_bridge_en) {
> -        QLIST_FOREACH(sec, &bus->child, sibling) {
> -            int32_t devfn = sec->parent_dev->devfn;
> +            aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
> +            aml_append(method, aml_call2("DVNT", aml_name("PCIU"),
> +                                         aml_int(1))); /* Device Check */
> +            aml_append(method, aml_call2("DVNT", aml_name("PCID"),
> +                                         aml_int(3))); /* Eject Request */
> +        }
>  
> -            if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
> -                continue;
> -            }
> +        /* Notify about child bus events in any case */
> +        if (pcihp_bridge_en) {
> +            QLIST_FOREACH(sec, &bus->child, sibling) {
> +                int32_t devfn = sec->parent_dev->devfn;
> +
> +                if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
> +                    continue;
> +                }
>  
> -            aml_append(method, aml_name("^S%.02X.PCNT", devfn));
> +                aml_append(method, aml_name("^S%.02X.PCNT", devfn));
> +            }
>          }
> -    }
>  
> -    if (bsel || pcihp_bridge_en) {
>          aml_append(parent_scope, method);
>      }
>      qobject_unref(bsel);
> -- 
> 2.20.1


