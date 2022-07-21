Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2000357C927
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 12:38:10 +0200 (CEST)
Received: from localhost ([::1]:41436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oETZJ-0007gk-8e
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 06:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oETXI-0005mS-4j
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:36:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oETXE-0001Yx-AH
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658399754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmbap+2fUtdJ1vSOcxqXiatCQzKeYfHqvUWTEBLmFAM=;
 b=OPZtt/0a+Ndyjl1fq7pNibPJHEbqoUj8TYGxXxleMHPc9bmkzL4ux5gmj/6IWZkGEGkb4X
 PXa5u2yzhSeaM0yZEUToxmxVSbKiRetbXDsw1bHPGf96YZzRzhJtNVaAVVaxckJA9KUXrj
 1x7ZJdW71cucREI+Zv88/OC2YXvhMwU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-fvV2zhhnPjW6vuPlaGxxGQ-1; Thu, 21 Jul 2022 06:35:47 -0400
X-MC-Unique: fvV2zhhnPjW6vuPlaGxxGQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 t13-20020adfe10d000000b0021bae3def1eso229198wrz.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 03:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bmbap+2fUtdJ1vSOcxqXiatCQzKeYfHqvUWTEBLmFAM=;
 b=45SM6obrY5KcL6ZvRzABIS61vz41SqQmUHUooh6gFMBjfmtCTbKoM1nHtNiaZTTP1/
 v2JsPz1AdYhrlJsfWmFbgcU3KSWkdPAUIi8U+jh+AnbMJIcoVSkJdKL2zqlGfjZyJANE
 sVxZn8ZyrKZPMGJZYAaElhHt8lDtEQohujlHx8sdMTfGJD9MeweYwDnL8b0NDisBCocP
 VXfXnXLaYrqJFGdg1F36z1Tv7DkOaHAc9oo0U0oTOL5JEYvqGufDCDVC6bQMzxuS2QKk
 LSPlGwQlXr+MSgTH36nSmr6ZqXzPEVEcoaaI22OuXHQ76/idoblv0AJ+LvBAJpNuavm0
 aegg==
X-Gm-Message-State: AJIora96AOvko5oSELLO9fwy43i4eTvjT1DjX2kvCvA21jaVHSVwdXAI
 pwQ9gHma8TjK+JSvvYDZr1n6j70znVz4Sn8DsG0lB2FQaYKAEkzfVF/vBEA/gyPjVjD1Mygqu5a
 Hiisz+IkSA+9KWk8=
X-Received: by 2002:a05:600c:3553:b0:3a3:2b65:299e with SMTP id
 i19-20020a05600c355300b003a32b65299emr5728627wmq.145.1658399746466; 
 Thu, 21 Jul 2022 03:35:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3CaeABDqRwsOMpKyvaBEPyooiqSsO/hoQ6f5eu0ltAKbcB5qjOPce9WNgcb/M5SrJwX0sYQ==
X-Received: by 2002:a05:600c:3553:b0:3a3:2b65:299e with SMTP id
 i19-20020a05600c355300b003a32b65299emr5728601wmq.145.1658399746047; 
 Thu, 21 Jul 2022 03:35:46 -0700 (PDT)
Received: from redhat.com ([2.55.25.63]) by smtp.gmail.com with ESMTPSA id
 ay35-20020a05600c1e2300b003a2e42ae9a4sm1894718wmb.14.2022.07.21.03.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 03:35:45 -0700 (PDT)
Date: Thu, 21 Jul 2022 06:35:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v4] hw/i386: pass RNG seed via setup_data entry
Message-ID: <20220721062910-mutt-send-email-mst@kernel.org>
References: <YtkitoK3PVjbgXBH@zx2c4.com>
 <20220721100959.427518-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220721100959.427518-1-Jason@zx2c4.com>
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

On Thu, Jul 21, 2022 at 12:09:59PM +0200, Jason A. Donenfeld wrote:
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
> ---
>  hw/i386/x86.c                                | 21 +++++++++++++++++---
>  include/standard-headers/asm-x86/bootparam.h |  1 +
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 6003b4b2df..284c97f158 100644
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
> @@ -771,7 +772,7 @@ void x86_load_linux(X86MachineState *x86ms,
>      bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
>      uint16_t protocol;
>      int setup_size, kernel_size, cmdline_size;
> -    int dtb_size, setup_data_offset;
> +    int dtb_size, setup_data_offset, last_setup_data_offset = 0;
>      uint32_t initrd_max;
>      uint8_t header[8192], *setup, *kernel;
>      hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0;
> @@ -1063,16 +1064,30 @@ void x86_load_linux(X86MachineState *x86ms,
>          kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
>          kernel = g_realloc(kernel, kernel_size);
>  
> -        stq_p(header + 0x250, prot_addr + setup_data_offset);
>          setup_data = (struct setup_data *)(kernel + setup_data_offset);
> -        setup_data->next = 0;
> +        setup_data->next = last_setup_data_offset;

does this make any difference? if the idea is that we'll add more stuff
down the road, then see below ...

>          setup_data->type = cpu_to_le32(SETUP_DTB);
>          setup_data->len = cpu_to_le32(dtb_size);
>  
>          load_image_size(dtb_filename, setup_data->data, dtb_size);
> +
> +        last_setup_data_offset = prot_addr + setup_data_offset;


if the idea is that we'll add more stuff down the road, then
it should be += here.

>      }
>  
> +    setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
> +    kernel_size = setup_data_offset + sizeof(struct setup_data) + 32;
> +    kernel = g_realloc(kernel, kernel_size);
> +    setup_data = (struct setup_data *)(kernel + setup_data_offset);
> +    setup_data->next = last_setup_data_offset;

Likely broken on LE.

> +    setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
> +    setup_data->len = cpu_to_le32(32);
> +    qemu_guest_getrandom_nofail(setup_data->data, 32);
> +
> +    last_setup_data_offset = prot_addr + setup_data_offset;


where does this 32 come from? maybe make it a macro.

> +
> +    stq_p(header + 0x250, last_setup_data_offset);

add a comment while we are at it?

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


