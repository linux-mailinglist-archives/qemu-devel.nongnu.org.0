Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D41767B6B2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 17:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKiSf-0007dG-OE; Wed, 25 Jan 2023 11:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKiSa-0007cq-PK
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:17:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKiSX-0002Ee-Sg
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674663432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/j+ngRqyg5gTSPIwHilNzA3sWMLVPB+jSG1dHjpIw3g=;
 b=CfsrnnqIIPFkm388ZHUC0RN3kuJIyzNQ04/9JlpsZh2GLK2N41Zvnquxr/F/o4HSHkOaDB
 UF3zgrD5R0fkJwc4iundb+MbHS4xQuRcxRQEC/7fjUii1sNNME58EHSwUnF7aW7P4PmUnn
 8JQJxEaFX2q1D6SWloi2sXdAV9KFBtE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-46-mI_ao66YOeKC3Cx3CcrOMA-1; Wed, 25 Jan 2023 11:17:10 -0500
X-MC-Unique: mI_ao66YOeKC3Cx3CcrOMA-1
Received: by mail-ej1-f71.google.com with SMTP id
 og35-20020a1709071de300b00877faf0a4b4so2960039ejc.6
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 08:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/j+ngRqyg5gTSPIwHilNzA3sWMLVPB+jSG1dHjpIw3g=;
 b=dILGUS+b1l0VStK16xBPzwbr8xYaHnEMBtOTFg9X1TJsUU2HRUORdsS79ZFL+b3kT1
 o6X35eAsgwiR/dWpnLKHSgcI78Vz8YfCJm6wnPzQA4pDwL41dgt3XMbSszO/kC6eDkI5
 NVJ+bFdo4rJ82gUJ0WLoAxpqSXglmwkCqDRqlsSbI3Hj4n3BfHn7FTq6XqgyGcxJIEVJ
 sx1i/H1rBcN9x7PTtnvVdm9hgLi2o2/CokZbOTSGZ4GxqqaYzwuCZoC2DV/TU2877xUW
 05j6DZ6awNtL2UWud20bfySKgwP1H6g48SpK0baesi+7z8geDffy99kaa6m/NojPXJjk
 BRPQ==
X-Gm-Message-State: AO0yUKWtcvkAvAU+O2zuwTjwjSxiUQKNc8ihkSETvDPMZHm66Mqxd04o
 Z4JrzYTVMN90n1USt1ydqjqASHWV7RQKE4s7Di0Svys1E7x7MgorpytAGi2mcrZnMp1c2ohpe3K
 IxBAzgSKa2YAu7vI=
X-Received: by 2002:a50:d5de:0:b0:4a0:b64d:1c3f with SMTP id
 g30-20020a50d5de000000b004a0b64d1c3fmr644429edj.16.1674663429055; 
 Wed, 25 Jan 2023 08:17:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/8tT/H33i+EjcjH1dxJ5ryPxbhSRh/AUr9dww+L2kDecE5RbuCKQiKtQbwVrXn3L8qHhII5Q==
X-Received: by 2002:a50:d5de:0:b0:4a0:b64d:1c3f with SMTP id
 g30-20020a50d5de000000b004a0b64d1c3fmr644405edj.16.1674663428823; 
 Wed, 25 Jan 2023 08:17:08 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 en11-20020a056402528b00b0049fc459ef1fsm2481362edb.90.2023.01.25.08.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 08:17:08 -0800 (PST)
Date: Wed, 25 Jan 2023 17:17:07 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH 7/7] hw/acpi/core: Trace enable and status registers of
 GPE separately
Message-ID: <20230125171707.409f2b41@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230122170724.21868-8-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-8-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 22 Jan 2023 18:07:24 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> The bit positions of both registers are related. Tracing the registers
> independently results in the same offsets across these registers which
> eases debugging.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/core.c       | 10 +++++++---
>  hw/acpi/trace-events |  6 ++++--
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index a33e410e69..cc33605d61 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -687,13 +687,13 @@ void acpi_gpe_ioport_writeb(ACPIREGS *ar, uint32_t addr, uint32_t val)
>  {
>      uint8_t *cur;
>  
> -    trace_acpi_gpe_ioport_writeb(addr, val);
> -
>      cur = acpi_gpe_ioport_get_ptr(ar, addr);
>      if (addr < ar->gpe.len / 2) {
> +        trace_acpi_gpe_sts_ioport_writeb(addr, val);
>          /* GPE_STS */
>          *cur = (*cur) & ~val;
>      } else if (addr < ar->gpe.len) {
> +        trace_acpi_gpe_en_ioport_writeb(addr - (ar->gpe.len / 2), val);
>          /* GPE_EN */
>          *cur = val;
>      } else {
> @@ -712,7 +712,11 @@ uint32_t acpi_gpe_ioport_readb(ACPIREGS *ar, uint32_t addr)
>          val = *cur;
>      }
>  
> -    trace_acpi_gpe_ioport_readb(addr, val);
> +    if (addr < ar->gpe.len / 2) {
> +        trace_acpi_gpe_sts_ioport_readb(addr, val);
> +    } else {
> +        trace_acpi_gpe_en_ioport_readb(addr - (ar->gpe.len / 2), val);
> +    }
>  
>      return val;
>  }
> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
> index 159937ddb9..d387adfb0b 100644
> --- a/hw/acpi/trace-events
> +++ b/hw/acpi/trace-events
> @@ -18,8 +18,10 @@ mhp_acpi_pc_dimm_deleted(uint32_t slot) "slot[0x%"PRIx32"] pc-dimm deleted"
>  mhp_acpi_pc_dimm_delete_failed(uint32_t slot) "slot[0x%"PRIx32"] pc-dimm delete failed"
>  
>  # core.c
> -acpi_gpe_ioport_readb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " ==> 0x%" PRIx8
> -acpi_gpe_ioport_writeb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " <== 0x%" PRIx8
> +acpi_gpe_sts_ioport_readb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " ==> 0x%" PRIx8
> +acpi_gpe_en_ioport_readb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " ==> 0x%" PRIx8
> +acpi_gpe_sts_ioport_writeb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " <== 0x%" PRIx8
> +acpi_gpe_en_ioport_writeb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " <== 0x%" PRIx8
>  
>  # cpu.c
>  cpuhp_acpi_invalid_idx_selected(uint32_t idx) "0x%"PRIx32


