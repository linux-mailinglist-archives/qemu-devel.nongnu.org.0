Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517FB678D64
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 02:26:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK831-0008Av-Te; Mon, 23 Jan 2023 20:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pK830-0008Ae-Ce; Mon, 23 Jan 2023 20:24:26 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pK82y-0005kP-Hn; Mon, 23 Jan 2023 20:24:26 -0500
Received: by mail-ej1-x633.google.com with SMTP id az20so35265295ejc.1;
 Mon, 23 Jan 2023 17:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0ZIuz7MMINQls+Wp5fdZcpUvEDFsnJfZ+7hA5iQJwcw=;
 b=Klfz1n5KJAEbA0Xn90MH7U2B8sz6cx0p+5j8Cm7BEsffvuAChuIfBidxV+/sFH0fCu
 P2mvefIcztw18jW5VCGCniVlEVhmWZAsu8Xf7OecHOOcuKin/70x14esHq0UanIBTagm
 lO26LHGwD7HSUQ75jq/O+//sLJVLVMwh4F4ViQXYtrpar60ZeH4jyRWxk4dv9l9kD/6C
 p5NxPFckAOP/27+JTI5JYonntdrUSBTUN/0MCI31N2E9UsHr0pkscexgm/ga2GhtL+9G
 BrAk3oNuAC1+xzyzwR1A8PPTNxER3Hoc35AfS07BLuen5VY3cLwPb8YvafvZLyNSCEMS
 5xEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0ZIuz7MMINQls+Wp5fdZcpUvEDFsnJfZ+7hA5iQJwcw=;
 b=DeH6q1VrmJua5fqlokrk/TOZIeAvDFMifFgVHR7IF5JmBdtvoL7bdqUkPM26gLbVhs
 ECO0QFmiQmcCS+6kSjXsEiTjDWH09Y2OUWwOTXSOfAbmRR+tXMhO8EAG9z8WXmGS+OUB
 NTK1FswzwO1Rhr/lWBV+IPOe3GcSojn47E8JPJEzGW0ugf1iIae7v5Zbbv7XUvDKPtpP
 aXRARXXvplF59C7gqSRXkwoHQcny6mtiMVAfDKiktoSpM0FvuS/mIrxeibT8prqy8vLw
 ho2c4kZx7s8i1De23/+h8EpginQI+BPnklOwOAfIPlhbTskxWwyvXBs9505aZofW5DeZ
 usPQ==
X-Gm-Message-State: AFqh2kqMTQxAtS45D+QgY8qNRdZb+NHEZ7K8kDvWSba9AbCnYas4246z
 YDBkNRv8EjyA9bAqZx+MhL+1dnG92UPqu7byN4Q=
X-Google-Smtp-Source: AMrXdXuJs1/tHs4qfRjLfOjfmyc9sGOv9fyxctdD5YanFZ0OaZ6Nri6jyjl9D5BevZj3UWKtPlfi469Zsazf6nw/Y2I=
X-Received: by 2002:a17:906:555:b0:85f:5ff0:3cb0 with SMTP id
 k21-20020a170906055500b0085f5ff03cb0mr3274651eja.341.1674523462044; Mon, 23
 Jan 2023 17:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 24 Jan 2023 09:24:10 +0800
Message-ID: <CAEUhbmUisvp3QFhnz0Ty74=7zn-h4UpdC_b9E3LNr8B7Bp8Y1Q@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, Bin Meng <bin.meng@windriver.com>,
 alistair23@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, Jan 23, 2023 at 11:58 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> If the CSRs and CSR instructions are disabled because the Zicsr
> extension isn't enabled then we want to make sure we don't run any CSR
> instructions in the boot ROM.
>
> This patches removes the CSR instructions from the reset-vec if the
> extension isn't enabled. We replace the instruction with a NOP instead.
>
> Note that we don't do this for the SiFive U machine, as we are modelling
> the hardware in that case.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/boot.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 2594276223..cb27798a25 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>          reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
>      }
>
> +    if (!harts->harts[0].cfg.ext_icsr) {
> +        /*
> +         * The Zicsr extension has been disabled, so let's ensure we don't
> +         * run the CSR instruction. Let's fill the address with a non
> +         * compressed nop.
> +         */
> +        reset_vec[2] = 0x00000013;   /*     addi   x0, x0, 0 */
> +    }

This is fine for a UP system. I am not sure how SMP can be supported
without Zicsr as we need to assign hartid in a0.

> +
>      /* copy in the reset vector in little_endian byte order */
>      for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
>          reset_vec[i] = cpu_to_le32(reset_vec[i]);
> --

Regards,
Bin

