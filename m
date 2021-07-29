Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AF13D9F1D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:03:39 +0200 (CEST)
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9110-0006WH-5d
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90zY-00057h-CH
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:02:08 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90zW-00026R-JE
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:02:07 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so3383558wmd.3
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 01:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GsWB11/7L1auMhnevEordPhIXZ67qdQlFVVHwmV2cQ8=;
 b=vDsztvRRYOvRQ+n/v5PzQ7ilihhOulpmBPqnAMwmQanTE/Ctf/dBDhlPDaxf/4iDzW
 UcB/nqMlK6BI8N42nwcsDz6kMo3Fx0K9g6c2CBwWG2gw7x3caOIkmya7QcfT4YQQHCVm
 nrP2tWK+fLUhXoxEcTGmgUw5ykmv/eKBOQjVSOZzTyVZ6gs3r8qc3zK2BBZHRVIe8FDa
 auW+CltJ5R7UjEu/66Ntsl/OW1fTsk0LQMLoTVuensJranGDgPuujqYsiBCjuNEgSbRE
 3hippkb7RjL0S6WKVJrYzkEc8N5K4bf41T7gkprJDmFH4aqPAtmLfJSPO3HY26Y7/PvM
 B/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GsWB11/7L1auMhnevEordPhIXZ67qdQlFVVHwmV2cQ8=;
 b=nTXqBkCNZTkxA0Xjwg1kE/qpUHTo1vrdsx+u6d4DhZ1d/AqjyLTmTygvOg8ODLKTgA
 R+2UlISH4ZeOPiIU0wqiUV+5FmzyiAZneUWf7adJJWCmbY+mJDqtb7z9vOanf2qLSwZY
 My/+Wa786eUubJdhUQwI7eHpR8U1zAZdRoHiPWb+fu7gP+vKeeQ2nZfGWdTMg8U5MWl8
 QmSZWhzJ1lRn23+kQUjidOn58RjlqPejpWMxRtw5bGAuKP2eKxjuWCqoGV7V7ITfYoML
 P42WBP1sS9I0W55PwwQ4YokWdQOx+tmwlw5SmylY3RRXct+c3kvd5aKHUf0cm4gWkI2D
 xM+Q==
X-Gm-Message-State: AOAM533fizy6iAUopOVCa5GyOauF095JBOblZLFJZ8a8nppT09hMcUic
 aiIjM7ioEpf8du3pL1a1USg=
X-Google-Smtp-Source: ABdhPJx+gq2tvfxbhQY6xIoQZukcafI/l9oiiYAJp46YOenzI41sDdHE7yySQTizOpNHVgh8qranqA==
X-Received: by 2002:a7b:cf13:: with SMTP id l19mr11454894wmg.134.1627545724731; 
 Thu, 29 Jul 2021 01:02:04 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id z25sm2336806wmf.9.2021.07.29.01.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 01:02:04 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/mips/boston: Allow loading elf kernel and dtb
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210729033959.6454-1-jiaxun.yang@flygoat.com>
 <20210729033959.6454-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e1b334a3-522b-fc5b-0093-1fb7a5d677d1@amsat.org>
Date: Thu, 29 Jul 2021 10:02:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729033959.6454-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: aleksandar.rikalo@syrmia.com, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 5:39 AM, Jiaxun Yang wrote:
> ELF kernel allows us debugging much easier with DWARF symbols.

You can load the symbols using the 'loader' device:
docs/system/generic-loader.rst.

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/boston.c | 38 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index a5746ede65..42b31a1ce4 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -20,6 +20,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  
> +#include "elf.h"
>  #include "hw/boards.h"
>  #include "hw/char/serial.h"
>  #include "hw/ide/pci.h"
> @@ -546,10 +547,39 @@ static void boston_mach_init(MachineState *machine)
>              exit(1);
>          }
>      } else if (machine->kernel_filename) {
> -        fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
> -        if (fit_err) {
> -            error_report("unable to load FIT image");
> -            exit(1);
> +        uint64_t kernel_entry, kernel_low, kernel_high, kernel_size;
> +
> +        kernel_size = load_elf(machine->kernel_filename, NULL,
> +                           cpu_mips_kseg0_to_phys, NULL,
> +                           (uint64_t *)&kernel_entry,
> +                           (uint64_t *)&kernel_low, (uint64_t *)&kernel_high,
> +                           NULL, 0, EM_MIPS, 1, 0);
> +
> +        if (kernel_size) {
> +            hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
> +            hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
> +
> +            s->kernel_entry = kernel_entry;
> +            if (machine->dtb) {
> +                int dt_size;
> +                const void *dtb_file_data, *dtb_load_data;

g_autofree is preferred.

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +
> +                dtb_file_data = load_device_tree(machine->dtb, &dt_size);
> +                dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);
> +
> +                /* Calculate real fdt size after filter */
> +                dt_size = fdt_totalsize(dtb_load_data);
> +                rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
> +                g_free((void *) dtb_file_data);
> +                g_free((void *) dtb_load_data);
> +            }
> +        } else {
> +            /* Try to load file as FIT */
> +            fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
> +            if (fit_err) {
> +                error_report("unable to load kernel image");
> +                exit(1);
> +            }
>          }
>  
>          gen_firmware(memory_region_get_ram_ptr(flash) + 0x7c00000,
> 

