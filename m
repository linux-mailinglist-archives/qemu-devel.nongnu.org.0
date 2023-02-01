Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA6A686068
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 08:16:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN66z-0004JF-7M; Wed, 01 Feb 2023 00:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN66v-0004J1-QO; Wed, 01 Feb 2023 00:56:45 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN66C-00088B-2P; Wed, 01 Feb 2023 00:56:45 -0500
Received: by mail-ej1-x635.google.com with SMTP id lu11so10844621ejb.3;
 Tue, 31 Jan 2023 21:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UujxSMSkeUct+x0XI8pjGKtsodqgMGX8cm6l5uT7t1w=;
 b=ZNdzgdpAjHmKqmhFa2E1hPbF1jZoqLp6FC15jFU2V93t2Fx5cP97Ft/dmjCawDI+0O
 jLeH+XWZaYcDDidoTP9K624//FabErXBxHVB+nj5lGDgvctnAyI7REOf9ErZd+3II9lY
 KIPNL+0i0onq+4rOikLnm6NGx2lLABUt0MCKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UujxSMSkeUct+x0XI8pjGKtsodqgMGX8cm6l5uT7t1w=;
 b=sM5hMWRR4kU7KQpHXaJZeB5Xs8PZOU6y5mRgpdkKokd9w7zBVXUBQUNzghEm5Arera
 yVRLtw8YfLXZxBcZCKtg4CWhGABkcGRVjoYfs4iJvceSuzXRd7krkC60w24/CdJO1aid
 0xCBkNhhrX4fPWHpCZw/tUVrKtd1iy6TRkmKsBli1gM/cDJL8WXDWKZKywN/12zfvYsZ
 lms6EImL34PXix3P9Fvf+tV2MsAu4CmtkM7vKWRmixEuGpWfNPt8IxOfSfZ/nDozHLwQ
 gLkrtziZixwtBcaKF8Aj+W9KsxLH+izflH3rQnUU9TUbCIop2UONCehSzluNlWcIP5+f
 kt+g==
X-Gm-Message-State: AO0yUKV8QP3ODLe7Fxtyfe7AaaCKy4mxgWbhgF2Hikrx+srEUNm2jVA0
 JPkodo6ygPfMtvQgHkO+HpvOHzvT1cei+ZuSDlrWJH6K
X-Google-Smtp-Source: AK7set/hMRehJpPuLv+I+oLy+oeN8AF5uDWWYDMW0hHKMVvOAR2N7ac5d7p1RYE+1NY/+qLBVPVb0PEw2SEVFD4APAU=
X-Received: by 2002:a17:906:2012:b0:879:d5f6:9104 with SMTP id
 18-20020a170906201200b00879d5f69104mr267422ejo.118.1675230345104; Tue, 31 Jan
 2023 21:45:45 -0800 (PST)
MIME-Version: 1.0
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-9-clg@kaod.org>
In-Reply-To: <20230119123449.531826-9-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2023 05:45:32 +0000
Message-ID: <CACPK8XfW6peVF27_YthCubp-9J8aGpKp5x15-2-qpusnV=4Dzg@mail.gmail.com>
Subject: Re: [PATCH 08/25] hw/arm/boot: Export write_bootloader for Aspeed
 machines
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 19 Jan 2023 at 12:37, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> AST2600 Aspeed machines have an home made boot loader for secondaries.
> To improve support, export the internal ARM boot loader and use it
> instead.

I didn't quite follow why we're doing this. Is it just a cleanup?

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/arm/boot.h | 24 ++++++++++++++++++++++++
>  hw/arm/aspeed.c       | 42 ++++++++++++++++++++++--------------------
>  hw/arm/boot.c         | 34 +++++++---------------------------
>  3 files changed, 53 insertions(+), 47 deletions(-)
>
> diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
> index f18cc3064f..23edd0d31b 100644
> --- a/include/hw/arm/boot.h
> +++ b/include/hw/arm/boot.h
> @@ -183,4 +183,28 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *=
cpu,
>                                              const struct arm_boot_info *=
info,
>                                              hwaddr mvbar_addr);
>
> +typedef enum {
> +    FIXUP_NONE =3D 0,     /* do nothing */
> +    FIXUP_TERMINATOR,   /* end of insns */
> +    FIXUP_BOARDID,      /* overwrite with board ID number */
> +    FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code addr=
ess */
> +    FIXUP_ARGPTR_LO,    /* overwrite with pointer to kernel args */
> +    FIXUP_ARGPTR_HI,    /* overwrite with pointer to kernel args (high h=
alf) */
> +    FIXUP_ENTRYPOINT_LO, /* overwrite with kernel entry point */
> +    FIXUP_ENTRYPOINT_HI, /* overwrite with kernel entry point (high half=
) */
> +    FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
> +    FIXUP_BOOTREG,      /* overwrite with boot register address */
> +    FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
> +    FIXUP_MAX,
> +} FixupType;
> +
> +typedef struct ARMInsnFixup {
> +    uint32_t insn;
> +    FixupType fixup;
> +} ARMInsnFixup;
> +
> +void arm_write_bootloader(const char *name, hwaddr addr,
> +                          const ARMInsnFixup *insns, uint32_t *fixupcont=
ext,
> +                          AddressSpace *as);
> +
>  #endif /* HW_ARM_BOOT_H */
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 4919a1fe9e..c373bd2851 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -198,33 +198,35 @@ struct AspeedMachineState {
>  static void aspeed_write_smpboot(ARMCPU *cpu,
>                                   const struct arm_boot_info *info)
>  {
> -    static const uint32_t poll_mailbox_ready[] =3D {
> +    AddressSpace *as =3D arm_boot_address_space(cpu, info);
> +    static const ARMInsnFixup poll_mailbox_ready[] =3D {
>          /*
>           * r2 =3D per-cpu go sign value
>           * r1 =3D AST_SMP_MBOX_FIELD_ENTRY
>           * r0 =3D AST_SMP_MBOX_FIELD_GOSIGN
>           */
> -        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
> -        0xe21000ff,  /* ands    r0, r0, #255          */
> -        0xe59f201c,  /* ldr     r2, [pc, #28]         */
> -        0xe1822000,  /* orr     r2, r2, r0            */
> -
> -        0xe59f1018,  /* ldr     r1, [pc, #24]         */
> -        0xe59f0018,  /* ldr     r0, [pc, #24]         */
> -
> -        0xe320f002,  /* wfe                           */
> -        0xe5904000,  /* ldr     r4, [r0]              */
> -        0xe1520004,  /* cmp     r2, r4                */
> -        0x1afffffb,  /* bne     <wfe>                 */
> -        0xe591f000,  /* ldr     pc, [r1]              */
> -        AST_SMP_MBOX_GOSIGN,
> -        AST_SMP_MBOX_FIELD_ENTRY,
> -        AST_SMP_MBOX_FIELD_GOSIGN,
> +        { 0xee100fb0 },  /* mrc     p15, 0, r0, c0, c0, 5 */
> +        { 0xe21000ff },  /* ands    r0, r0, #255          */
> +        { 0xe59f201c },  /* ldr     r2, [pc, #28]         */
> +        { 0xe1822000 },  /* orr     r2, r2, r0            */
> +
> +        { 0xe59f1018 },  /* ldr     r1, [pc, #24]         */
> +        { 0xe59f0018 },  /* ldr     r0, [pc, #24]         */
> +
> +        { 0xe320f002 },  /* wfe                           */
> +        { 0xe5904000 },  /* ldr     r4, [r0]              */
> +        { 0xe1520004 },  /* cmp     r2, r4                */
> +        { 0x1afffffb },  /* bne     <wfe>                 */
> +        { 0xe591f000 },  /* ldr     pc, [r1]              */
> +        { AST_SMP_MBOX_GOSIGN },
> +        { AST_SMP_MBOX_FIELD_ENTRY },
> +        { AST_SMP_MBOX_FIELD_GOSIGN },
> +        { 0, FIXUP_TERMINATOR }
>      };
> +    uint32_t fixupcontext[FIXUP_MAX] =3D { 0 };
>
> -    rom_add_blob_fixed("aspeed.smpboot", poll_mailbox_ready,
> -                       sizeof(poll_mailbox_ready),
> -                       info->smp_loader_start);
> +    arm_write_bootloader("aspeed.smpboot", info->smp_loader_start,
> +                         poll_mailbox_ready, fixupcontext, as);
>  }
>
>  static void aspeed_reset_secondary(ARMCPU *cpu,
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 3d7d11f782..ed6fd7c77f 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -59,26 +59,6 @@ AddressSpace *arm_boot_address_space(ARMCPU *cpu,
>      return cpu_get_address_space(cs, asidx);
>  }
>
> -typedef enum {
> -    FIXUP_NONE =3D 0,     /* do nothing */
> -    FIXUP_TERMINATOR,   /* end of insns */
> -    FIXUP_BOARDID,      /* overwrite with board ID number */
> -    FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code addr=
ess */
> -    FIXUP_ARGPTR_LO,    /* overwrite with pointer to kernel args */
> -    FIXUP_ARGPTR_HI,    /* overwrite with pointer to kernel args (high h=
alf) */
> -    FIXUP_ENTRYPOINT_LO, /* overwrite with kernel entry point */
> -    FIXUP_ENTRYPOINT_HI, /* overwrite with kernel entry point (high half=
) */
> -    FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
> -    FIXUP_BOOTREG,      /* overwrite with boot register address */
> -    FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
> -    FIXUP_MAX,
> -} FixupType;
> -
> -typedef struct ARMInsnFixup {
> -    uint32_t insn;
> -    FixupType fixup;
> -} ARMInsnFixup;
> -
>  static const ARMInsnFixup bootloader_aarch64[] =3D {
>      { 0x580000c0 }, /* ldr x0, arg ; Load the lower 32-bits of DTB */
>      { 0xaa1f03e1 }, /* mov x1, xzr */
> @@ -149,9 +129,9 @@ static const ARMInsnFixup smpboot[] =3D {
>      { 0, FIXUP_TERMINATOR }
>  };
>
> -static void write_bootloader(const char *name, hwaddr addr,
> -                             const ARMInsnFixup *insns, uint32_t *fixupc=
ontext,
> -                             AddressSpace *as)
> +void arm_write_bootloader(const char *name, hwaddr addr,
> +                          const ARMInsnFixup *insns, uint32_t *fixupcont=
ext,
> +                          AddressSpace *as)
>  {
>      /* Fix up the specified bootloader fragment and write it into
>       * guest memory using rom_add_blob_fixed(). fixupcontext is
> @@ -213,8 +193,8 @@ static void default_write_secondary(ARMCPU *cpu,
>          fixupcontext[FIXUP_DSB] =3D CP15_DSB_INSN;
>      }
>
> -    write_bootloader("smpboot", info->smp_loader_start,
> -                     smpboot, fixupcontext, as);
> +    arm_write_bootloader("smpboot", info->smp_loader_start,
> +                         smpboot, fixupcontext, as);
>  }
>
>  void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
> @@ -1173,8 +1153,8 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cp=
u,
>          fixupcontext[FIXUP_ENTRYPOINT_LO] =3D entry;
>          fixupcontext[FIXUP_ENTRYPOINT_HI] =3D entry >> 32;
>
> -        write_bootloader("bootloader", info->loader_start,
> -                         primary_loader, fixupcontext, as);
> +        arm_write_bootloader("bootloader", info->loader_start,
> +                             primary_loader, fixupcontext, as);
>
>          if (info->write_board_setup) {
>              info->write_board_setup(cpu, info);
> --
> 2.39.0
>
>

