Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4662A5BFA36
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 11:07:47 +0200 (CEST)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oavho-0002up-Pw
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 05:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oavZv-0006QK-A9
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 04:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oavZq-0003pq-RZ
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 04:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663750769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uGbepRMojePBts/w0hInKaNpM14/FWSGNrdSUiRJ5aU=;
 b=PuStKeVw+VjWrtebimtZ+sJ4w4H87eGofozgfLOG1s1A7r21phYbSB9mVwnIuitEl+SH0E
 WklO6c5XU3vqRpFUKHIxrFn8lgfUqzxL7x/LRg1vngzkz2ziRBNqqKeFV/5n7+Qc9d+WGN
 d1b8YFFC+Hp9EMvHIePJyTrgnDUU1aI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-31-C9SxDSD2PLm276UldNchwQ-1; Wed, 21 Sep 2022 04:59:28 -0400
X-MC-Unique: C9SxDSD2PLm276UldNchwQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 y16-20020a0cec10000000b004a5df9e16c6so3809251qvo.1
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 01:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=uGbepRMojePBts/w0hInKaNpM14/FWSGNrdSUiRJ5aU=;
 b=gs7G9lN/7jnnTH+EfV7ZOd/b6geyOnN66JZH+uDBAukMcUgpnvMdfDNjC6INc05dF5
 6zsLIOQZ0WLoEQAfHn5ovKrI1tLQ0W71J8vIdJFvzhj/X7J7ZgNxRaAYVqOQouvULZpv
 a5b5OcjhOHZgTXuDwW+GYorZYweZnUZx8Hnb8NTe7b9P/iQV5GHYGslTHEfHIYKyNjQW
 dave34AZ7YHwlQ/8rua9rlwLHEIr84bglF9sR7qVj/CbcJ22BQ4k+3jng08q0EXtBvd5
 /JQxAXUEvmm6y1sXgumxmNCKEwO4uDtht6jSoeKpELYYcgVX8r1IXiBHRIl/y8NeLAux
 ntTQ==
X-Gm-Message-State: ACrzQf0zsu3C6Yahj0yisVj1QNq1L8bBV9UUu318BFZ44KuMHJqjZhL+
 CcKy31Qpty2XVsDVEfqjTMMevE76c21UX1ZlFqnsyncJLBHzRAQ0pXWP61WW1NZR/Ezr/0WUj1H
 hHXQGhrHnIkzPbp/XjfzMg+9BitnpAF0=
X-Received: by 2002:a05:622a:1755:b0:35b:a3ad:6283 with SMTP id
 l21-20020a05622a175500b0035ba3ad6283mr22213028qtk.422.1663750767513; 
 Wed, 21 Sep 2022 01:59:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5/tth4F9ITRHKbfg45wcjqa1/7CRpt698/m73+6nC4ljd5oWQRYW11Lq9MxN6VjRpvSb5GiLyIaxQrwxBA6kA=
X-Received: by 2002:a05:622a:1755:b0:35b:a3ad:6283 with SMTP id
 l21-20020a05622a175500b0035ba3ad6283mr22213018qtk.422.1663750767212; Wed, 21
 Sep 2022 01:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220913234135.255426-1-Jason@zx2c4.com>
In-Reply-To: <20220913234135.255426-1-Jason@zx2c4.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 10:59:16 +0200
Message-ID: <CABgObfbUEPGshiy4_658E2_sNNGFJYnJq34Qvx9G60OAvHm0Bg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86: return modified setup_data only if read as
 memory, not as file
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 050eedc0c8..933bbdd836 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -764,6 +764,18 @@ static bool load_elfboot(const char *kernel_filename,
>      return true;
>  }
>
> +struct setup_data_fixup {
> +    void *pos;
> +    hwaddr val;
> +    uint32_t addr;
> +};

Just a small comment, addr should be little-endian (see
fw_cfg_add_i32).  It's not used outside x86_load_linux, so it is
possible to just use cpu_to_le32 there.

Also I think it's cleaner if a reset callback puts the value back to
zero. fw_cfg already has fw_cfg_machine_reset, so perhaps the easiest
way is to add a FWCfgCallback reset_cb argument to just
fw_cfg_add_bytes_callback. If I am missing something and it's not
necessary I can do the cpu_to_le32 change myself or wait for you; in
any case I'll wait for either your ack or a v5.

By the way, does this supersede v1..v3 that use the new protocol (I'd
guess so from the presence of the same 2/2 patch), or are the two
patches doing belts-and-suspenders?

Thanks,

Paolo

> +static void fixup_setup_data(void *opaque)
> +{
> +    struct setup_data_fixup *fixup = opaque;
> +    stq_p(fixup->pos, fixup->val);
> +}
> +
>  void x86_load_linux(X86MachineState *x86ms,
>                      FWCfgState *fw_cfg,
>                      int acpi_data_size,
> @@ -1088,8 +1100,11 @@ void x86_load_linux(X86MachineState *x86ms,
>          qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
>      }
>
> -    /* Offset 0x250 is a pointer to the first setup_data link. */
> -    stq_p(header + 0x250, first_setup_data);
> +    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
> +    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
> +    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
> +    sev_load_ctx.kernel_data = (char *)kernel;
> +    sev_load_ctx.kernel_size = kernel_size;
>
>      /*
>       * If we're starting an encrypted VM, it will be OVMF based, which uses the
> @@ -1099,16 +1114,18 @@ void x86_load_linux(X86MachineState *x86ms,
>       * file the user passed in.
>       */
>      if (!sev_enabled()) {
> +        struct setup_data_fixup *fixup = g_malloc(sizeof(*fixup));
> +
>          memcpy(setup, header, MIN(sizeof(header), setup_size));
> +        /* Offset 0x250 is a pointer to the first setup_data link. */
> +        fixup->pos = setup + 0x250;
> +        fixup->val = first_setup_data;
> +        fixup->addr = real_addr;
> +        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_SETUP_ADDR, fixup_setup_data, NULL,
> +                                  fixup, &fixup->addr, sizeof(fixup->addr), true);
> +    } else {
> +        fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
>      }
> -
> -    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
> -    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
> -    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
> -    sev_load_ctx.kernel_data = (char *)kernel;
> -    sev_load_ctx.kernel_size = kernel_size;
> -
> -    fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
>      fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
>      fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
>      sev_load_ctx.setup_data = (char *)setup;
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index d605f3f45a..564bda3395 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -692,12 +692,12 @@ static const VMStateDescription vmstate_fw_cfg = {
>      }
>  };
>
> -static void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
> -                                      FWCfgCallback select_cb,
> -                                      FWCfgWriteCallback write_cb,
> -                                      void *callback_opaque,
> -                                      void *data, size_t len,
> -                                      bool read_only)
> +void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
> +                               FWCfgCallback select_cb,
> +                               FWCfgWriteCallback write_cb,
> +                               void *callback_opaque,
> +                               void *data, size_t len,
> +                               bool read_only)
>  {
>      int arch = !!(key & FW_CFG_ARCH_LOCAL);
>
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index 0e7a8bc7af..e4fef393be 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -117,6 +117,28 @@ struct FWCfgMemState {
>   */
>  void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, void *data, size_t len);
>
> +/**
> + * fw_cfg_add_bytes_callback:
> + * @s: fw_cfg device being modified
> + * @key: selector key value for new fw_cfg item
> + * @select_cb: callback function when selecting
> + * @write_cb: callback function after a write
> + * @callback_opaque: argument to be passed into callback function
> + * @data: pointer to start of item data
> + * @len: size of item data
> + * @read_only: is file read only
> + *
> + * Add a new fw_cfg item, available by selecting the given key, as a raw
> + * "blob" of the given size. The data referenced by the starting pointer
> + * is only linked, NOT copied, into the data structure of the fw_cfg device.
> + */
> +void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
> +                               FWCfgCallback select_cb,
> +                               FWCfgWriteCallback write_cb,
> +                               void *callback_opaque,
> +                               void *data, size_t len,
> +                               bool read_only);
> +
>  /**
>   * fw_cfg_add_string:
>   * @s: fw_cfg device being modified
> --
> 2.37.3
>


