Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6690A455E88
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:48:40 +0100 (CET)
Received: from localhost ([::1]:56368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mniiN-0004oA-I9
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:48:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mnigM-0002MB-9v; Thu, 18 Nov 2021 09:46:34 -0500
Received: from [2a00:1450:4864:20::136] (port=35662
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mnigK-0006F5-4V; Thu, 18 Nov 2021 09:46:34 -0500
Received: by mail-lf1-x136.google.com with SMTP id u3so27176717lfl.2;
 Thu, 18 Nov 2021 06:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i4ImNUWBVTPzUuDTwmiZeUqYQEgZpRtF3z5QGW+ZAp4=;
 b=SIzYQxkG+Jp1+YA689ua/sp8dQvufaslHYD/fULuC1jSNmIhkXUDx2Ovl0nYtwfGwT
 D7ulWcdHgxpAYu8hxo06LMnKZ6QHrTpdDN6qPxRBWwKGAsDUsFpMsO5Ax2X2hs76O5lZ
 8234hObPVJXTvmA2ou8wKOp+GuwCN2bdMXdzaMBDEYxSXBYouBHZZAvGHuNVMS8xL2YL
 PtM8TRxUogWwbWaGfyIjZLZESpY0dj7/dLBRdgnOmZi4QhGePGCBb68VfmjgJJubDGQZ
 zIOgbkG5psoIfnm3le9qfgcqTUR4uS+FFFMC+PzkkNmRJlOL/oEs5VpIbbRo6x6sWIV5
 r1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i4ImNUWBVTPzUuDTwmiZeUqYQEgZpRtF3z5QGW+ZAp4=;
 b=vWdBetpVFbNgyaI6EAFYj3t+OsWx/MdxU/dDAmmeAk6AL+4qr5AzBQoBftH9l3sVXQ
 FzFjrekbVLCq3hHhZa3ieYSiz+ptGq/hQ348WaupN89mnTsPYURtUfmlSp3s6IsvVESf
 wL0AaYZ6V+8FRBdY+MGoVRYLbTip/h8Yi+/2hht+8gadXjc6bvwWZO5ofumnleHtYbBR
 h3LQ01Zdr10V18HSPsuI5hOr8dmn3x65rjav5bORq0tw80hafkOjL62w6/7Jc+n5gRxj
 5cxjT6wvyjWwSphHnq3GVcOdS/TpYJsDAN+hjI/2knFWub0n/YvvlmziISERaKt8j3Uq
 WhpA==
X-Gm-Message-State: AOAM532YRzDCfeBwLQCCrgAmDW/YOJk8zAJPOXxd2e2Pw7c1l2caJ+FE
 bHn7sivbWHAdPm06BBBciRw=
X-Google-Smtp-Source: ABdhPJxhN90rIfRVTRA5XB3p+cENs2MMUrmqcDrD+JewnAP9kdvOXDGL+q1bZhCgyyLGjR5hOlQHhA==
X-Received: by 2002:a2e:b0ca:: with SMTP id g10mr16660937ljl.491.1637246788779; 
 Thu, 18 Nov 2021 06:46:28 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id x3sm5372lfq.238.2021.11.18.06.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:46:28 -0800 (PST)
Date: Thu, 18 Nov 2021 15:46:27 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 10/13] hw/arm/xlnx-zcu102: Replace drive_get_next() by
 drive_get()
Message-ID: <20211118144627.GO3586016@toto>
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-11-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117163409.3587705-11-armbru@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 05:34:06PM +0100, Markus Armbruster wrote:
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
> 
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
> 
> Machine "xlnx-zcu102" connects backends with drive_get_next() in
> several counting loops.  Change it to use drive_get() directly.  This
> makes the unit numbers explicit in the code.


Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/arm/xlnx-zcu102.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 3dc2b5e8ca..45eb19ab3b 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -169,7 +169,7 @@ static void xlnx_zcu102_init(MachineState *machine)
>      /* Create and plug in the SD cards */
>      for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
>          BusState *bus;
> -        DriveInfo *di = drive_get_next(IF_SD);
> +        DriveInfo *di = drive_get(IF_SD, 0, i);
>          BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
>          DeviceState *carddev;
>          char *bus_name;
> @@ -190,7 +190,7 @@ static void xlnx_zcu102_init(MachineState *machine)
>          BusState *spi_bus;
>          DeviceState *flash_dev;
>          qemu_irq cs_line;
> -        DriveInfo *dinfo = drive_get_next(IF_MTD);
> +        DriveInfo *dinfo = drive_get(IF_MTD, 0, i);
>          gchar *bus_name = g_strdup_printf("spi%d", i);
>  
>          spi_bus = qdev_get_child_bus(DEVICE(&s->soc), bus_name);
> @@ -212,7 +212,7 @@ static void xlnx_zcu102_init(MachineState *machine)
>          BusState *spi_bus;
>          DeviceState *flash_dev;
>          qemu_irq cs_line;
> -        DriveInfo *dinfo = drive_get_next(IF_MTD);
> +        DriveInfo *dinfo = drive_get(IF_MTD, 0, XLNX_ZYNQMP_NUM_SPIS + i);
>          int bus = i / XLNX_ZYNQMP_NUM_QSPI_BUS_CS;
>          gchar *bus_name = g_strdup_printf("qspi%d", bus);
>  
> -- 
> 2.31.1
> 

