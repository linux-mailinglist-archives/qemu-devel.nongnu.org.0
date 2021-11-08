Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9554C448054
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 14:36:02 +0100 (CET)
Received: from localhost ([::1]:55556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk4ob-0007fe-Ai
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 08:36:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mk4m1-0000ss-2z
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:33:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mk4lx-0008Fn-JA
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636378384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wb/G5YPQGP/bRgj4YsLsKwpWJtmnPEPWmRwW/qngfAU=;
 b=hZq2LeXWBUNNP7qV1OzkPrpUsZv5T+w6Rvr4A5e4qWTW65E8+uVRsqY/7R4Kq+NEzDfFFs
 nhe4LB+ztiINILe1RgrthB3TjQag53atFC24wVXhLQbsBJuWR9TgkEN02gwbJE5GiPqBo8
 1uR6lOQPZrvDrvPdr0H5I0Fv8hWU3NI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-z3duGqvGPLqrMRavypkXxw-1; Mon, 08 Nov 2021 08:33:02 -0500
X-MC-Unique: z3duGqvGPLqrMRavypkXxw-1
Received: by mail-ed1-f71.google.com with SMTP id
 r25-20020a05640216d900b003dca3501ab4so14822092edx.15
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 05:33:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wb/G5YPQGP/bRgj4YsLsKwpWJtmnPEPWmRwW/qngfAU=;
 b=gYVVER9DCO79BsOyTyFZVI6Oe6xgy9ewcYf0sB2l4eFNBAuEKojCUXOuehGwQevKRw
 JkLktynojQyp9t4Juc9Ht6riWROLpIxij808e+01bSZteffwrlG0mdseq2EKSP5/2D1e
 1S4t4npaGpvITVjz46xIZTtW+eDwjvqJgyuK4YqpkobXJpmwn+DKTT/2J0sJ7idllMTd
 iEUy0/XwFat3dN/6YMAtdjibZ/bvBMYcRl+Hhd7URSkNnnow7XZTy0rtCz5gZeHc17Wt
 NV9xiGWjubd7qijiRLWoY9Uni+hSX1qYGO/+eIZwl1UzS/WQtsb4a27vxiqgy1gLAWqX
 Rnxg==
X-Gm-Message-State: AOAM532Uyzd++rON8UPlXOr5ZOTO8uSa0R3/SChIqRpo42G1Wac0p6N0
 NnmikxxET1m3xBZaJFV/ml3uZo3R+mV8d3zoqlV3bxK+EyFE3My50U/gsuDBYWIJUetmiZT4Cg7
 9XnR1jxf7LiZPnwI=
X-Received: by 2002:a05:6402:4381:: with SMTP id
 o1mr45757219edc.301.1636378381414; 
 Mon, 08 Nov 2021 05:33:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyALzQIwoIehAg+tGhBXgvVGAIsIGpTNasxUf1yh0h92r5BgzrjrwHRZFcK/eryx+3RBFykiA==
X-Received: by 2002:a05:6402:4381:: with SMTP id
 o1mr45757186edc.301.1636378381182; 
 Mon, 08 Nov 2021 05:33:01 -0800 (PST)
Received: from redhat.com ([2.55.155.32])
 by smtp.gmail.com with ESMTPSA id d4sm9477733edk.78.2021.11.08.05.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 05:33:00 -0800 (PST)
Date: Mon, 8 Nov 2021 08:32:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
Message-ID: <20211108083200-mutt-send-email-mst@kernel.org>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <20211108130934.59B48748F52@zero.eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 08, 2021 at 02:05:42PM +0100, BALATON Zoltan wrote:
> When using ACPI on big endian machine (such as ppc/pegasos2 which has
> a VT8231 south bridge with ACPI) writes to ACPI registers come out
> byte swapped. This may be caused by a bug in memory subsystem but
> until that is fixed setting the ACPI memory regions to native endian
> makes it usable for big endian machines. This fixes ACPI shutdown with
> pegasos2 when using the board firmware for now.
> This could be reverted when the memory layer is fixed.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>


Paolo, could you weight in on whether we can fix it properly
in the memory core? I suspect it's not a good idea to switch
to native without adding a bunch of byteswaps all
over the place ...

> ---
>  hw/acpi/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 1e004d0078..543e4a7875 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -461,7 +461,7 @@ static const MemoryRegionOps acpi_pm_evt_ops = {
>      .impl.min_access_size = 2,
>      .valid.min_access_size = 1,
>      .valid.max_access_size = 2,
> -    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
>  void acpi_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
> @@ -531,7 +531,7 @@ static const MemoryRegionOps acpi_pm_tmr_ops = {
>      .impl.min_access_size = 4,
>      .valid.min_access_size = 1,
>      .valid.max_access_size = 4,
> -    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
>  void acpi_pm_tmr_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
> @@ -608,7 +608,7 @@ static const MemoryRegionOps acpi_pm_cnt_ops = {
>      .impl.min_access_size = 2,
>      .valid.min_access_size = 1,
>      .valid.max_access_size = 2,
> -    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
>  void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
> -- 
> 2.30.2


