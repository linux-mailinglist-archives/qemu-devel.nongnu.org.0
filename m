Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA457589460
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 00:29:21 +0200 (CEST)
Received: from localhost ([::1]:44188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJMrg-0001tQ-AK
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 18:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJMoG-0005ic-Ui
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 18:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJMoE-00027L-FN
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 18:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659565545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HX7H9yHA5WLbJq2xz49M9De6B7/eSaJklg3r87Lbtkw=;
 b=KE35ptQRbFV/j6tiALaQ5LRSjwH7bxPEx/wsUecdcl8KkzhSQQZjM2f8jTEykA7ZLKxGBw
 VmDaMGPPnZnam0LqPS/ViEs0DwvURWTZLdd3OIudkJ+8/q1H1+C/Mt5mbgae3/W7HJWTg8
 qaUI04mWSc18Y+3dvROB2v2wx08HbIs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-So04hwUCMCaPV7_xG-VGWQ-1; Wed, 03 Aug 2022 18:25:44 -0400
X-MC-Unique: So04hwUCMCaPV7_xG-VGWQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 z20-20020a05640235d400b0043e1e74a495so2728099edc.11
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 15:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=HX7H9yHA5WLbJq2xz49M9De6B7/eSaJklg3r87Lbtkw=;
 b=A/s4If9hCyQSIgtioGestbeiWSKizRbULir2OLnYW7jb3C+eTPuchfkL7RHNMCaEQN
 2S0U7T62JbK8TwqIkFdhQQl+YQuEny3uz33IgXBhRUY51UB22JvmB8jnR41DsfYyH+1f
 ogH9TbiWfSyRK148mb/MAlbqUAFLJgApRtzX6Spd+8PU/+llgUkFtahBPL7gRPMYkUqo
 irq6+plxN0VtNIcAFJ32aSa5X5KovqQm+Awr1v4VHCuB99zUp6eX5oxKIajeaTJhwPia
 cg6u4n48d5XfZqB6FPR7dZHsR+4Pi5EWq9S2/TGnhTjx82PPJFyXFFqTsutTHZmJ3sj9
 xX3A==
X-Gm-Message-State: AJIora8BmSLk4oc89CY4/4wwLI1U6isC5O4RlyLpBowpxI17QXHUALtp
 UIau1wv5Gg7lxk1aAekJQCgb43lE8t8YvKHSec85M+UASAW+Xzm9hz//SoxhwWynVgBFkuMgako
 3qLzVHEyiyQdgfYA=
X-Received: by 2002:a17:906:4fd3:b0:72f:2306:32a6 with SMTP id
 i19-20020a1709064fd300b0072f230632a6mr21629071ejw.83.1659565543357; 
 Wed, 03 Aug 2022 15:25:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vXHHL4LaIAO2gySICmI1DszxeYSj7mJP4Ty3qPjIlEJYYjruKFu0DJ3Lq79CIrTj3X4KP66Q==
X-Received: by 2002:a17:906:4fd3:b0:72f:2306:32a6 with SMTP id
 i19-20020a1709064fd300b0072f230632a6mr21629046ejw.83.1659565542992; 
 Wed, 03 Aug 2022 15:25:42 -0700 (PDT)
Received: from redhat.com ([2.54.191.86]) by smtp.gmail.com with ESMTPSA id
 m22-20020a170906721600b0072ed9efc9dfsm7738029ejk.48.2022.08.03.15.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 15:25:42 -0700 (PDT)
Date: Wed, 3 Aug 2022 18:25:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-efi@vger.kernel.org
Subject: Re: [PATCH RFC v1] hw/i386: place setup_data at fixed place in memory
Message-ID: <20220803182340-mutt-send-email-mst@kernel.org>
References: <20220803170235.1312978-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220803170235.1312978-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 03, 2022 at 07:02:35PM +0200, Jason A. Donenfeld wrote:
> The boot parameter header refers to setup_data at an absolute address,
> and each setup_data refers to the next setup_data at an absolute address
> too. Currently QEMU simply puts the setup_datas right after the kernel
> image, and since the kernel_image is loaded at prot_addr -- a fixed
> address knowable to QEMU apriori -- the setup_data absolute address
> winds up being just `prot_addr + a_fixed_offset_into_kernel_image`.
> 
> This mostly works fine, so long as the kernel image really is loaded at
> prot_addr. However, OVMF doesn't load the kernel at prot_addr, and
> generally EFI doesn't give a good way of predicting where it's going to
> load the kernel. So when it loads it at some address != prot_addr, the
> absolute addresses in setup_data now point somewhere bogus, causing
> crashes when EFI stub tries to follow the next link.
> 
> Fix this by placing setup_data at some fixed place in memory, not as
> part of the kernel image, and then pointing the setup_data absolute
> address to that fixed place in memory. This way, even if OVMF or other
> chains relocate the kernel image, the boot parameter still points to the
> correct absolute address.
> 
> === NOTE NOTE NOTE NOTE NOTE ===
> This commit is currently garbage! It fixes the boot test case, but it
> just picks the address 0x10000000. That's probably not a good idea. If
> somebody with some x86 architectural knowledge could let me know a
> better reserved place to put this, that'd be very appreciated.
> 
> Fixes: 3cbeb52467 ("hw/i386: add device tree support")
> Reported-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: linux-efi@vger.kernel.org
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/i386/x86.c | 38 +++++++++++++++++++++-----------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 050eedc0c8..0b0083b345 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -773,9 +773,9 @@ void x86_load_linux(X86MachineState *x86ms,
>      bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
>      uint16_t protocol;
>      int setup_size, kernel_size, cmdline_size;
> -    int dtb_size, setup_data_offset;
> +    int dtb_size, setup_data_item_len, setup_data_total_len = 0;
>      uint32_t initrd_max;
> -    uint8_t header[8192], *setup, *kernel;
> +    uint8_t header[8192], *setup, *kernel, *setup_datas = NULL;
>      hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0, first_setup_data = 0;
>      FILE *f;
>      char *vmode;
> @@ -1048,6 +1048,8 @@ void x86_load_linux(X86MachineState *x86ms,
>      }
>      fclose(f);
>  
> +#define SETUP_DATA_PHYS_BASE 0x10000000
> +
>      /* append dtb to kernel */
>      if (dtb_filename) {
>          if (protocol < 0x209) {
> @@ -1062,34 +1064,36 @@ void x86_load_linux(X86MachineState *x86ms,
>              exit(1);
>          }
>  
> -        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
> -        kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
> -        kernel = g_realloc(kernel, kernel_size);
> -
> -
> -        setup_data = (struct setup_data *)(kernel + setup_data_offset);
> +        setup_data_item_len = sizeof(struct setup_data) + dtb_size;
> +        setup_datas = g_realloc(setup_datas, setup_data_total_len + setup_data_item_len);
> +        setup_data = (struct setup_data *)(setup_datas + setup_data_total_len);
>          setup_data->next = cpu_to_le64(first_setup_data);
> -        first_setup_data = prot_addr + setup_data_offset;
> +        first_setup_data = SETUP_DATA_PHYS_BASE + setup_data_total_len;
> +        setup_data_total_len += setup_data_item_len;
>          setup_data->type = cpu_to_le32(SETUP_DTB);
>          setup_data->len = cpu_to_le32(dtb_size);
> -
>          load_image_size(dtb_filename, setup_data->data, dtb_size);
>      }
>  
>      if (!legacy_no_rng_seed) {
> -        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
> -        kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
> -        kernel = g_realloc(kernel, kernel_size);
> -        setup_data = (struct setup_data *)(kernel + setup_data_offset);
> +        setup_data_item_len = sizeof(struct setup_data) + SETUP_RNG_SEED;
> +        setup_datas = g_realloc(setup_datas, setup_data_total_len + setup_data_item_len);
> +        setup_data = (struct setup_data *)(setup_datas + setup_data_total_len);
>          setup_data->next = cpu_to_le64(first_setup_data);
> -        first_setup_data = prot_addr + setup_data_offset;
> +        first_setup_data = SETUP_DATA_PHYS_BASE + setup_data_total_len;
> +        setup_data_total_len += setup_data_item_len;
>          setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
>          setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
>          qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
>      }
>  
> -    /* Offset 0x250 is a pointer to the first setup_data link. */
> -    stq_p(header + 0x250, first_setup_data);
> +    if (first_setup_data) {
> +            /* Offset 0x250 is a pointer to the first setup_data link. */
> +            stq_p(header + 0x250, first_setup_data);
> +            rom_add_blob("setup_data", setup_datas, setup_data_total_len, setup_data_total_len,
> +                         SETUP_DATA_PHYS_BASE, NULL, NULL, NULL, NULL, false);
> +    }
> +
>

Allocating memory on x86 is tricky business.  Can we maybe use bios-linker-loader
with COMMAND_WRITE_POINTER to get an address from firmware?

  
>      /*
>       * If we're starting an encrypted VM, it will be OVMF based, which uses the
> -- 
> 2.35.1


