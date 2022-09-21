Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1CC5BFABD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 11:22:41 +0200 (CEST)
Received: from localhost ([::1]:43488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oavwG-00060y-Ow
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 05:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oavpA-0000ZD-R0
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:15:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oavp7-0006z6-0p
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:15:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663751715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3fJT6AvaJS561dGJVx2LNkTG27LE9ohao1L7WUwCA0E=;
 b=ZtqhykoO0YcEvbNYGDIN44m7y0RLkjdAwm6yKl2JCYhm8TlN57kwaRUGJPn9xAiZtUEqnD
 meTGQRwZtAMEnqxGVrNq1dAhadzz0jrUb5uR7BBqlxlzBu4GNGs7MoHdWoLY/Mr7yPiNyz
 MqTL1BCOMaWM9Vrc1Fu0veS8ku3bqGI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-KS_QqMMwNdeu43YJFU1-PQ-1; Wed, 21 Sep 2022 05:15:14 -0400
X-MC-Unique: KS_QqMMwNdeu43YJFU1-PQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 z13-20020a05640240cd00b0045276a79364so3902106edb.2
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 02:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3fJT6AvaJS561dGJVx2LNkTG27LE9ohao1L7WUwCA0E=;
 b=j7ToAJyN9yxcCd++QU1tmkQgPY6qxRd9o4XL1gYcbxmn9cApBfZlTF3tFVk2TnJMGh
 FTAGiAfC1iFY5ZmLysszAS/a51NuPlGjIJBG2cRA0YD4lg89S71jEuZEFpekFLVGd8d+
 ktxbX8zXJZKzT5fI4PKYYS4YugirgRZRc8+DiGBE3hAQcdrItmUxsety0fCd3pp9U3PE
 TCn70m7HIbTp4BVxtOg8GRIkROKarHB+g7/7q4wWtc6fump3xxuprOgBdXyNJ2vkJ5Hq
 ApsDjkJ2wOMt4pY6Tg4wKBDPmoGHQLT3kZI6bx4ThINqpmZXlwI1fhNgcuJXvQ4QN0el
 Fh7g==
X-Gm-Message-State: ACrzQf2pN18GDREe5zptLHcwmHeEMmXZHW0lcBJw7KUxl9drEp94pb9E
 vkdzCyDGufCh4F3kOKFOcstFgD9pcAE/XfjFFaVHpkAKfcMWu6nStLbYXIGQyZZFQgnGdPpayR0
 /2fIRwvnxUXA4VXo=
X-Received: by 2002:aa7:cc8a:0:b0:446:7668:2969 with SMTP id
 p10-20020aa7cc8a000000b0044676682969mr23890316edt.206.1663751713548; 
 Wed, 21 Sep 2022 02:15:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7OvqSQk7iEWDJINwZd9/zqpWyHwx54Fz6RG0YZH7XTETgFRdNY2ob9yMOpOPTD1MENz3nKjw==
X-Received: by 2002:aa7:cc8a:0:b0:446:7668:2969 with SMTP id
 p10-20020aa7cc8a000000b0044676682969mr23890298edt.206.1663751713326; 
 Wed, 21 Sep 2022 02:15:13 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 bh6-20020a170906a0c600b0077085fdd613sm1060178ejb.44.2022.09.21.02.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 02:15:12 -0700 (PDT)
Date: Wed, 21 Sep 2022 05:15:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v4 1/2] x86: return modified setup_data only if read as
 memory, not as file
Message-ID: <20220921051314-mutt-send-email-mst@kernel.org>
References: <20220913234135.255426-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220913234135.255426-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Sep 14, 2022 at 12:41:34AM +0100, Jason A. Donenfeld wrote:
> If setup_data is being read into a specific memory location, then
> generally the setup_data address parameter is read first, so that the
> caller knows where to read it into. In that case, we should return
> setup_data containing the absolute addresses that are hard coded and
> determined a priori. This is the case when kernels are loaded by BIOS,
> for example. In contrast, when setup_data is read as a file, then we
> shouldn't modify setup_data, since the absolute address will be wrong by
> definition. This is the case when OVMF loads the image.
> 
> This allows setup_data to be used like normal, without crashing when EFI
> tries to use it.
> 
> (As a small development note, strangely, fw_cfg_add_file_callback() was
> exported but fw_cfg_add_bytes_callback() wasn't, so this makes that
> consistent.)
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/i386/x86.c             | 37 +++++++++++++++++++++++++++----------
>  hw/nvram/fw_cfg.c         | 12 ++++++------
>  include/hw/nvram/fw_cfg.h | 22 ++++++++++++++++++++++
>  3 files changed, 55 insertions(+), 16 deletions(-)
> 
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
> +

btw

	typedef struct SetupDataFixup {
	    void *pos;
	    hwaddr val;
	    uint32_t addr;
	} SetupDataFixup;


and use typedef everywhere.

Yes I know setup_data is like this but that probably should be
fixed too.

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


