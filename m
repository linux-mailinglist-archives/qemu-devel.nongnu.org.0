Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D495D48FCC2
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 13:34:11 +0100 (CET)
Received: from localhost ([::1]:33426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n94ja-0000Co-Gh
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 07:34:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n94fv-0007IH-GA
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 07:30:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n94fs-0007UH-59
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 07:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642336218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jLUr74tIyzu/6e3VJoJipXVjzUsexHbMar7SzXBcC1Y=;
 b=glZupMPRo2p9ZXdujvh076e9FGBb+yAlOUTuI3wQxjMHmBBoDQTe+9jYhy7TZqkzepwrpd
 UJ3oyEZGlkR5KTDUlohSUCVde7dAg13A+wiueDEJvlU1DhmTY/FAWW/nVbmnYOIjOBPOXZ
 DX1Lw/ZNy8CbWJiQpbxKmvf3Ou3FdHQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-eTYM-9plNL2KP33SKQR55w-1; Sun, 16 Jan 2022 07:30:16 -0500
X-MC-Unique: eTYM-9plNL2KP33SKQR55w-1
Received: by mail-wm1-f72.google.com with SMTP id
 a68-20020a1c9847000000b00346939a2d7cso2968879wme.1
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 04:30:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jLUr74tIyzu/6e3VJoJipXVjzUsexHbMar7SzXBcC1Y=;
 b=perHnKRA37QhGaWuztWfWtc33zgSxq1rmJqyVb1yHEMTHAJnJtVyJNP08BlKK2mdqg
 6laWGqD3V7Bjoh9RPD3byzl7h0U6WIIWr5ihXoB3l4ccWnxPkCji6/LYFZmjYvsZR/ed
 ryEzEA+/7HhszTB9tOio6wJRuCdR2f0HXx+mMu1EFsMIVQ9jMmJy0WQwryr9YYiapElf
 C59ZQ2BjtkippYnhwnQusJw8gnnLtTQFLYT+MdLVez04XORKyx2C1T3zKBpJLVQLkJTL
 SGKoBvCxHxEXPgsZYws5X7pRje42zBRYRF9/P3wcr/W9b7y96gcZuyrp7VHtCV83uVD8
 haDQ==
X-Gm-Message-State: AOAM532onft0IBuCCBd4NzsHyJsHFIlP/ck655ZCIo+F4iXav1lA2ZUf
 jV19lpq4Qf5cwiCMO0SxJDCSj6jSSGyMcKdA2Pny3LFCno106ao21StrRneSo+3UNHYhgvfau8Q
 pfLLhD7qtm5iHytQ=
X-Received: by 2002:adf:a443:: with SMTP id e3mr15364746wra.183.1642336215715; 
 Sun, 16 Jan 2022 04:30:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYONXPZ98q2X+C3x+zZOsnKtjNcIwHg9JfOR7KBllM97K+Yz5lXQ7OjNuaghwmxQpikb5Z4g==
X-Received: by 2002:adf:a443:: with SMTP id e3mr15364728wra.183.1642336215392; 
 Sun, 16 Jan 2022 04:30:15 -0800 (PST)
Received: from redhat.com ([2.55.158.159])
 by smtp.gmail.com with ESMTPSA id p2sm13530838wmg.44.2022.01.16.04.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 04:30:14 -0800 (PST)
Date: Sun, 16 Jan 2022 07:30:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH] intc: Unexport InterruptStatsProviderClass-related
 functions
Message-ID: <20220116072958-mutt-send-email-mst@kernel.org>
References: <20220116122327.73048-1-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220116122327.73048-1-shentey@gmail.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 16, 2022 at 01:23:26PM +0100, Bernhard Beschow wrote:
> The functions are only used within their respective source files, so no
> need for exporting.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/intc/i8259_common.c            | 6 +++---
>  hw/intc/ioapic_common.c           | 2 +-
>  include/hw/i386/ioapic_internal.h | 1 -
>  include/hw/isa/i8259_internal.h   | 3 ---
>  4 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/intc/i8259_common.c b/hw/intc/i8259_common.c
> index d90b40fe4c..af2e4a2241 100644
> --- a/hw/intc/i8259_common.c
> +++ b/hw/intc/i8259_common.c
> @@ -116,8 +116,8 @@ void pic_stat_update_irq(int irq, int level)
>      }
>  }
>  
> -bool pic_get_statistics(InterruptStatsProvider *obj,
> -                        uint64_t **irq_counts, unsigned int *nb_irqs)
> +static bool pic_get_statistics(InterruptStatsProvider *obj,
> +                               uint64_t **irq_counts, unsigned int *nb_irqs)
>  {
>      PICCommonState *s = PIC_COMMON(obj);
>  
> @@ -132,7 +132,7 @@ bool pic_get_statistics(InterruptStatsProvider *obj,
>      return true;
>  }
>  
> -void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
> +static void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
>  {
>      PICCommonState *s = PIC_COMMON(obj);
>  
> diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
> index 3cccfc1556..aa5f760871 100644
> --- a/hw/intc/ioapic_common.c
> +++ b/hw/intc/ioapic_common.c
> @@ -76,7 +76,7 @@ static void ioapic_irr_dump(Monitor *mon, const char *name, uint32_t bitmap)
>      monitor_printf(mon, "\n");
>  }
>  
> -void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s)
> +static void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s)
>  {
>      static const char *delm_str[] = {
>          "fixed", "lowest", "SMI", "...", "NMI", "INIT", "...", "extINT"};
> diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
> index 021e715f11..9880443cc7 100644
> --- a/include/hw/i386/ioapic_internal.h
> +++ b/include/hw/i386/ioapic_internal.h
> @@ -112,7 +112,6 @@ struct IOAPICCommonState {
>  
>  void ioapic_reset_common(DeviceState *dev);
>  
> -void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s);
>  void ioapic_stat_update_irq(IOAPICCommonState *s, int irq, int level);
>  
>  #endif /* QEMU_IOAPIC_INTERNAL_H */
> diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
> index a6ae8a583f..d272d879fb 100644
> --- a/include/hw/isa/i8259_internal.h
> +++ b/include/hw/isa/i8259_internal.h
> @@ -72,8 +72,5 @@ struct PICCommonState {
>  void pic_reset_common(PICCommonState *s);
>  ISADevice *i8259_init_chip(const char *name, ISABus *bus, bool master);
>  void pic_stat_update_irq(int irq, int level);
> -bool pic_get_statistics(InterruptStatsProvider *obj,
> -                        uint64_t **irq_counts, unsigned int *nb_irqs);
> -void pic_print_info(InterruptStatsProvider *obj, Monitor *mon);
>  
>  #endif /* QEMU_I8259_INTERNAL_H */
> -- 
> 2.34.1


