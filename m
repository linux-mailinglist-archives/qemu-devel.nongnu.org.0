Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24EA4A9AC7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 15:16:00 +0100 (CET)
Received: from localhost ([::1]:50350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFzNV-0000l1-Ps
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 09:15:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFzA8-0005iE-EK
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 09:02:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFzA4-0004YW-Gu
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 09:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643983298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wr44KBhJZAlMzB2mYfUkvIx625L/JEnm/ilbcFSSFJ0=;
 b=gEml7aQQIX0Kuy/Uh7tziGzk24UIfYgeTTMG+uSIxmNhVlooLzlbZrbosscV2eC+KXHbro
 T9LDhTMaYKE0gfF6zxLdsDLny1zzDtoq1NMP51aZOJw51zPx3qBda7bSiOPUV8vbj9lCjQ
 XH4IWa4t+Eg9Lg+ucrnZe3KG5AAdB5w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-MVWrw_ooMc6ufWYStNnEBQ-1; Fri, 04 Feb 2022 09:01:37 -0500
X-MC-Unique: MVWrw_ooMc6ufWYStNnEBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 f7-20020a1cc907000000b0034b63f314ccso2419775wmb.6
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 06:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wr44KBhJZAlMzB2mYfUkvIx625L/JEnm/ilbcFSSFJ0=;
 b=ZXiQd70OyFurB9vjARal3mcUWo5r7NyXSlIYykxrCKsz/H2Qa3OLrY9wVl8slcH7Xt
 Ruc519qlWiaNuhFP4kDIdzwAjx1A3pGxD5Ja1ceRMLNq1PXC+DE9i98ZfeWbMh2WqsOq
 whJvmYbJuTlaT0i+UIaNMxOEPiICB8jM7A4n31gKsKE3G8z6aY6+DQlAbKEtPc7G6+3+
 CRjv6Fjk4W4EogbPDXj+DsHviVLTTXonMJv4EeKNa0LF0PUAwHDhDYoG8rsgPAecy++c
 tmkahUi9rQueVclFjAOvToSYnG1Y7g33ETFekOrPLjFmBQbUrtFrP0UXB40xDzYhF3+2
 vIpw==
X-Gm-Message-State: AOAM532gKAo8sjcIxQFkx1DxSmSLdm1w5DSgxe8wtjM7zUv9PfuRTamX
 6HelL5uPesikpVvj3d3gVKJDRKIDwrj+KyfLURIlg5Lb9pChaMjd64S1Pbfg1tNEr2PAnTwNoiQ
 IhKucP/jBydkAZM0=
X-Received: by 2002:a1c:4484:: with SMTP id r126mr1703975wma.26.1643983296353; 
 Fri, 04 Feb 2022 06:01:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4vxcDLw2avmIa/GSkgZ57y5FAFHMlJBeXuR9GY6/I+tq4UNNIvqt0ly336LScz55EktdR2w==
X-Received: by 2002:a1c:4484:: with SMTP id r126mr1703946wma.26.1643983296028; 
 Fri, 04 Feb 2022 06:01:36 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id o12sm2371993wry.115.2022.02.04.06.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 06:01:35 -0800 (PST)
Date: Fri, 4 Feb 2022 09:01:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v5 16/43] tests/acpi: Add update DSDT.viot
Message-ID: <20220204085953-mutt-send-email-mst@kernel.org>
References: <20220202141037.17352-1-Jonathan.Cameron@huawei.com>
 <20220202141037.17352-17-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220202141037.17352-17-Jonathan.Cameron@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 02, 2022 at 02:10:10PM +0000, Jonathan Cameron wrote:
> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> The consolidation of DSDT AML generation for PCI host bridges
> lead to some minor ordering changes and the addition of _ADR
> with a default of 0 for those case that didn't already have it.
> Only DSDT.viot test is affected.
> 
> Changes all similar to:
> 
> Scope (\_SB)
>      {
>        Device (PC30)
>        {
> -        Name (_UID, 0x30)  // _UID: Unique ID
>          Name (_BBN, 0x30)  // _BBN: BIOS Bus Number
>          Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
>          Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
> +        Name (_ADR, Zero)  // _ADR: Address
> +        Name (_UID, 0x30)  // _UID: Unique ID
>          Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
> 
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>

A bit worried about _ADR here.  It's probably fine as it should be
unused but in the past some changes like that confused windows guests
where they would lose e.g. a static ip config since from their
POV device address changed.

Igor, what do you think?

> ---
>  tests/data/acpi/q35/DSDT.viot               | Bin 9398 -> 9416 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  2 files changed, 1 deletion(-)
> 
> diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
> index 1c3b4da5cbe81ecab5e1ef50d383b561c5e0f55f..207ac5b9ae4c3a4bc0094c2242d1a1b08771b784 100644
> GIT binary patch
> delta 139
> zcmdnydBT&+CD<k8gbD)#<CBeCu5zLdVlnZ-PVv!A?xF$C#s(bmPELMY6KfQhxC}No
> z$Z0Y1qbM*kn0!E9nwKNq(Itq1BR<sAg-ZdbOrCM_F9mK?rG^HRr4><?3V@Yv4pmBI
> F0sxp4B{u*7
> 
> delta 143
> zcmX@%xy_TyCD<ion+gL1<MNGMu5zMYqA~HoPVv!Aj-mn1#s(bmp`I>WlVjy%CeC%7
> z+^Kj^(SX5#0jQdxl0g7Ptr1kM!sPw((lEse3<_8k8$uNeOjb|?Dc;<vXwM7)8)+to
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 08a8095432..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/q35/DSDT.viot",
> -- 
> 2.32.0


