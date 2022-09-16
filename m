Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6B95BA756
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 09:18:53 +0200 (CEST)
Received: from localhost ([::1]:53942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ5ch-0002wx-0H
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 03:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oZ5Ze-0001R5-7V
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 03:15:42 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:54986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oZ5Zb-0001CA-TF
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 03:15:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E0966B823FF
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 07:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4FBC433B5
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 07:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663312534;
 bh=AVBjeLLxGFtbbwvyQz6cqEROEblHa6i0fXm30abuaPQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=C1iPgzfGgKPzbJucDYhz5uAzRKGW/r2/emDtdIdvlZpnQNzwRSF8M1W6E8b+Mr68/
 27ZT57Xu+VYuXpRAj7QD7tXopwnv1PwJeXNY16U6Vl/cvUtJAwmJnDxH6F+r/Bvr4J
 ivVAwZ8d8hBmfQ30kdXsXk3nMm6UxFSNiYpeKdJ71e0s3of0viITL+ztpohrtf94nJ
 8DikVKOB2MfKIqIY763+F5hNLmSZ/IVsGvkGg2Wi252TaFwl72zCwR4Qn+0FaueQSj
 N3bhqVXTeTV/S9kr+FGIl0IAQpFtkdoUmPJ0uGMQjBr0WoKeFW7ammOPiZuXAFC8+n
 olJMM3hZpvPUQ==
Received: by mail-lf1-f50.google.com with SMTP id f14so33175256lfg.5
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 00:15:34 -0700 (PDT)
X-Gm-Message-State: ACrzQf1Ai4/0vpIlAviU3cCDt7YcCaYdzvAfwSb8YUZiF2hOvRMARTQH
 4NjVsKQaqJABxekyEMgztWqeKP0K6n+QAITX6Mo=
X-Google-Smtp-Source: AMsMyM5RhcofZGALEc8mlC7pBRERdNBl9tLIBgRDLMtpVBxpukN/YGYuk5/MyQ8H3GeXG/BYK+NV1vL6ZWLNX8NUEvw=
X-Received: by 2002:a05:6512:13a1:b0:48d:f14:9059 with SMTP id
 p33-20020a05651213a100b0048d0f149059mr1344544lfa.110.1663312532360; Fri, 16
 Sep 2022 00:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220913234135.255426-1-Jason@zx2c4.com>
In-Reply-To: <20220913234135.255426-1-Jason@zx2c4.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 16 Sep 2022 09:15:20 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGh3zWghPw7ir5_wwadHZH7Q-h41sDe=0=+D4TAcfME0A@mail.gmail.com>
Message-ID: <CAMj1kXGh3zWghPw7ir5_wwadHZH7Q-h41sDe=0=+D4TAcfME0A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86: return modified setup_data only if read as
 memory, not as file
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=145.40.68.75; envelope-from=ardb@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Wed, 14 Sept 2022 at 01:42, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
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
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

This is still somewhat of a crutch, but at least we can now
disambiguate between loaders that treat the setup data as a file
(OVMF) and ones that treat it as an object that lives at a fixed
address in memory (SeaBIOS)

I'll note that this also addresses the existing issue with -dtb on
x86, which currently breaks the OVMF direct kernel boot in the same
way as the RNG seed does.

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
> @@ -764,6 +764,18 @@ static bool load_elfboot(const char *kernel_filename=
,
>      return true;
>  }
>
> +struct setup_data_fixup {
> +    void *pos;
> +    hwaddr val;
> +    uint32_t addr;
> +};
> +
> +static void fixup_setup_data(void *opaque)
> +{
> +    struct setup_data_fixup *fixup =3D opaque;
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
> +    sev_load_ctx.kernel_data =3D (char *)kernel;
> +    sev_load_ctx.kernel_size =3D kernel_size;
>
>      /*
>       * If we're starting an encrypted VM, it will be OVMF based, which u=
ses the
> @@ -1099,16 +1114,18 @@ void x86_load_linux(X86MachineState *x86ms,
>       * file the user passed in.
>       */
>      if (!sev_enabled()) {
> +        struct setup_data_fixup *fixup =3D g_malloc(sizeof(*fixup));
> +
>          memcpy(setup, header, MIN(sizeof(header), setup_size));
> +        /* Offset 0x250 is a pointer to the first setup_data link. */
> +        fixup->pos =3D setup + 0x250;
> +        fixup->val =3D first_setup_data;
> +        fixup->addr =3D real_addr;
> +        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_SETUP_ADDR, fixup_setup=
_data, NULL,
> +                                  fixup, &fixup->addr, sizeof(fixup->add=
r), true);
> +    } else {
> +        fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
>      }
> -
> -    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
> -    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
> -    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
> -    sev_load_ctx.kernel_data =3D (char *)kernel;
> -    sev_load_ctx.kernel_size =3D kernel_size;
> -
> -    fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
>      fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
>      fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
>      sev_load_ctx.setup_data =3D (char *)setup;
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index d605f3f45a..564bda3395 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -692,12 +692,12 @@ static const VMStateDescription vmstate_fw_cfg =3D =
{
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
>      int arch =3D !!(key & FW_CFG_ARCH_LOCAL);
>
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index 0e7a8bc7af..e4fef393be 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -117,6 +117,28 @@ struct FWCfgMemState {
>   */
>  void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, void *data, size_t le=
n);
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
> + * is only linked, NOT copied, into the data structure of the fw_cfg dev=
ice.
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

