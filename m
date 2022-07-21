Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0A457C987
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 13:06:34 +0200 (CEST)
Received: from localhost ([::1]:58754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEU0k-0004J2-N1
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 07:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oETuv-00019L-DI
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:00:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oETut-0005DS-2I
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658401226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3COIscdvLsIYKk+bah8UB5GUuzOh7aMOH1So4xvoybE=;
 b=Mq2kCqMghz63S7BxY0cQ4KinBr6x5yA4gH3I1dcA2WfrvjW2bgj8c2jI5sv3EsOWeijy35
 ZR9oRDkwUx+eO2T2q8cJHMiMDrJkR7SXgJBm/oBg5DvldB8oZzOJFCRbk7KwJ8Za7bnANp
 4De1qjup1FdWWrTehZnI8QYbbBy5pto=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-mzO5VM2zMM6Bbz07d3eL1g-1; Thu, 21 Jul 2022 07:00:19 -0400
X-MC-Unique: mzO5VM2zMM6Bbz07d3eL1g-1
Received: by mail-wr1-f72.google.com with SMTP id
 n10-20020a5d6b8a000000b0021da91e4a64so238897wrx.8
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 04:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3COIscdvLsIYKk+bah8UB5GUuzOh7aMOH1So4xvoybE=;
 b=L7s/ibmQPeBU1YURjniRfEh4HL/Qe55LZbKpJY1Sn3Ixc891HWmQ3IWJB5RDlJNBrK
 ErDPME0Xmw7MeTL5VxiRY5e6zKJ7Ojif7z/LdDkCmH2lWJr3wPguY7IIVEmBWq/9Whx+
 DIsysD4Pw1bjqTT8pDOgAcr0PvCS9X0GzyhUA/wQGH8r8WOe2KQKzZkJIJ31/H/6ofkY
 KEYSGURE/x/K/KAihqxk70xzpm77qDX7GbKgQ4X4ZbseMnO8PnYf/BweMJAROJDb8sfn
 bICEi5ML55i8Iq84CoL/BpqxGOZILadV3NwKcG9GUCLV6Mff8f8jUMaPehv5+/VMB6fv
 NDDA==
X-Gm-Message-State: AJIora/5xkPKrX0hNIWyLyjVnCAyMdyMka57vsSckWeFv3oOP/WuZQat
 byY6rbk7NuKRxBr9LFm5VvdxJMEg0dui0z3/w0EAnJFIi55K8mqZKsOQRfBypL03pQTb1BqLNjq
 8Tx4j5BFHkmNxdR4=
X-Received: by 2002:a05:600c:4110:b0:3a3:33cd:3984 with SMTP id
 j16-20020a05600c411000b003a333cd3984mr1232910wmi.128.1658401218318; 
 Thu, 21 Jul 2022 04:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vFbI6v+Gfzf9pYU/IWVqLuIMBUctvyNaZpTTODAPgD5BbO7AnfbAp93QregDQKgr6FrCNW2A==
X-Received: by 2002:a05:600c:4110:b0:3a3:33cd:3984 with SMTP id
 j16-20020a05600c411000b003a333cd3984mr1232877wmi.128.1658401217909; 
 Thu, 21 Jul 2022 04:00:17 -0700 (PDT)
Received: from redhat.com ([2.55.25.63]) by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b003a326b84340sm5677193wmq.44.2022.07.21.04.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 04:00:17 -0700 (PDT)
Date: Thu, 21 Jul 2022 07:00:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v6] hw/i386: pass RNG seed via setup_data entry
Message-ID: <20220721065744-mutt-send-email-mst@kernel.org>
References: <20220721104730.434017-1-Jason@zx2c4.com>
 <20220721104950.434544-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220721104950.434544-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 21, 2022 at 12:49:50PM +0200, Jason A. Donenfeld wrote:
> Tiny machines optimized for fast boot time generally don't use EFI,
> which means a random seed has to be supplied some other way. For this
> purpose, Linux (≥5.20) supports passing a seed in the setup_data table
> with SETUP_RNG_SEED, specially intended for hypervisors, kexec, and
> specialized bootloaders. The linked commit shows the upstream kernel
> implementation.
> 
> Link: https://git.kernel.org/tip/tip/c/68b8e9713c8
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Well why not.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

who's merging this? Paolo me or you?


> ---
>  hw/i386/x86.c                                | 21 +++++++++++++++++---
>  include/standard-headers/asm-x86/bootparam.h |  1 +
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 6003b4b2df..56896cb4b2 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -26,6 +26,7 @@
>  #include "qemu/cutils.h"
>  #include "qemu/units.h"
>  #include "qemu/datadir.h"
> +#include "qemu/guest-random.h"
>  #include "qapi/error.h"
>  #include "qapi/qmp/qerror.h"
>  #include "qapi/qapi-visit-common.h"
> @@ -774,7 +775,7 @@ void x86_load_linux(X86MachineState *x86ms,
>      int dtb_size, setup_data_offset;
>      uint32_t initrd_max;
>      uint8_t header[8192], *setup, *kernel;
> -    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0;
> +    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0, first_setup_data = 0;
>      FILE *f;
>      char *vmode;
>      MachineState *machine = MACHINE(x86ms);
> @@ -784,6 +785,7 @@ void x86_load_linux(X86MachineState *x86ms,
>      const char *dtb_filename = machine->dtb;
>      const char *kernel_cmdline = machine->kernel_cmdline;
>      SevKernelLoaderContext sev_load_ctx = {};
> +    enum { RNG_SEED_LENGTH = 32 };
>  
>      /* Align to 16 bytes as a paranoia measure */
>      cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
> @@ -1063,16 +1065,29 @@ void x86_load_linux(X86MachineState *x86ms,
>          kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
>          kernel = g_realloc(kernel, kernel_size);
>  
> -        stq_p(header + 0x250, prot_addr + setup_data_offset);
>  
>          setup_data = (struct setup_data *)(kernel + setup_data_offset);
> -        setup_data->next = 0;
> +        setup_data->next = cpu_to_le64(first_setup_data);
> +        first_setup_data = prot_addr + setup_data_offset;
>          setup_data->type = cpu_to_le32(SETUP_DTB);
>          setup_data->len = cpu_to_le32(dtb_size);
>  
>          load_image_size(dtb_filename, setup_data->data, dtb_size);
>      }
>  
> +    setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
> +    kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
> +    kernel = g_realloc(kernel, kernel_size);
> +    setup_data = (struct setup_data *)(kernel + setup_data_offset);
> +    setup_data->next = cpu_to_le64(first_setup_data);
> +    first_setup_data = prot_addr + setup_data_offset;
> +    setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
> +    setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
> +    qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
> +
> +    /* Offset 0x250 is a pointer to the first setup_data link. */
> +    stq_p(header + 0x250, first_setup_data);
> +
>      /*
>       * If we're starting an encrypted VM, it will be OVMF based, which uses the
>       * efi stub for booting and doesn't require any values to be placed in the
> diff --git a/include/standard-headers/asm-x86/bootparam.h b/include/standard-headers/asm-x86/bootparam.h
> index 072e2ed546..b2aaad10e5 100644
> --- a/include/standard-headers/asm-x86/bootparam.h
> +++ b/include/standard-headers/asm-x86/bootparam.h
> @@ -10,6 +10,7 @@
>  #define SETUP_EFI			4
>  #define SETUP_APPLE_PROPERTIES		5
>  #define SETUP_JAILHOUSE			6
> +#define SETUP_RNG_SEED			9
>  
>  #define SETUP_INDIRECT			(1<<31)
>  
> -- 
> 2.35.1


