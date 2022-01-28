Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C178849FE3B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:40:01 +0100 (CET)
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUHw-0001Sf-B6
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:39:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTpr-0006kP-0c
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:10:51 -0500
Received: from [2a00:1450:4864:20::436] (port=35683
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTpp-00041Q-21
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:10:50 -0500
Received: by mail-wr1-x436.google.com with SMTP id e2so11845389wra.2
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 08:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=igkfLhYonqbLVtPlyInZvWkiychkszlLExxMICt/Yuc=;
 b=BNE3g4TdsmTQPicxXa3WsKqfTLaz6whrOqR8Lc1xH2/pRl+5CyGhRQ1nbM3+cu5Ljk
 tnzpgqtHVD5IasRnfYxJ7Z8R/jdqtzI3/Vuzmfq2ReJjd/brPNbJe/WfpaZTlujEJt1G
 /hHauVAYPqCzbKf/6wZgESwXeGgZRejsQp2UjCqt7duuW9yWg8OeEswU8VQsIXHlvBCy
 1Cuw0Thw2r5fFDmrHvG81EfSe5ZfpP7PipqDgKVF9VbrKVPzkp5PHQUib601S+gHDadr
 Qp0KT/w9HptiFe10SdbzLi9/V799kpuHp93lFhQB581Cq9tJlff++n8/SHazmLsJramo
 Y+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=igkfLhYonqbLVtPlyInZvWkiychkszlLExxMICt/Yuc=;
 b=XkYnQjeBCd68NiN2ldr2ShoU5L8XUSbs+f3ZrhwtjOX2SjiFS8njovf8lttXyYc0TO
 SO/dS9V8b+CCflmSk/6y2wkTi59prHtTnAJBI240KWIlvAc4G93TjyzgBnJnep0d7tXB
 icbSFV29dc1KWjur6tqItWxUcTtHLjdEuE6gwtm+GjFRQUs8G746g0odxQAqOZNR/gx6
 09vW+GNZBdOahyEdOX1sJ8MVrRPiVZo+fUdUAgDHmieq8byKPhtjcwZ/7GyxhtycEBtM
 ZFeTsm6/3HximwImiuQCSvcmQ7w7IEYa8H7zVCrYP5esTYBVpYV1BXF5M31AzzbR2wDc
 4CJQ==
X-Gm-Message-State: AOAM532YqrTLcNp1zXc1oj5WoN7KF2C8XQpcyY8VRiurZHggzUJQms0B
 p9hgTAddgK7m7xA1lMz+5FEE7+gK86DYl9KT4XyeLQ==
X-Google-Smtp-Source: ABdhPJyGbSen2UGfEq4MY5WM1xWFxsivHSZY5Z1oLOubE/qa6sG52gs35e0WpjlwUOkivCM5SUXEZi4lAmRgy/I3jFM=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr7955470wrz.2.1643386239328; 
 Fri, 28 Jan 2022 08:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
 <20220121055830.3164408-54-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220121055830.3164408-54-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 16:10:28 +0000
Message-ID: <CAFEAcA_V_L7_bD=_U9eKf_we2Q79tb_sJ2XAcGSzWgL-ooqg+Q@mail.gmail.com>
Subject: Re: [PULL 53/61] target/riscv: Split out the vill from vtype
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 Jan 2022 at 09:42, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> We need not specially process vtype when XLEN changes.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-id: 20220120122050.41546-16-zhiwei_liu@c-sky.com
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Odd thing I noticed looking at this code: as far as I can see we
may set env->vill to 1 in the vsetvl helper, but there is nowhere
that we set it to 0, so once it transitions to 1 it's stuck there
until the system is reset. Is this really right?

> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 89621e1996..6c740b92c1 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -125,6 +125,7 @@ struct CPURISCVState {
>      target_ulong vl;
>      target_ulong vstart;
>      target_ulong vtype;
> +    bool vill;
>
>      target_ulong pc;
>      target_ulong load_res;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 502aee84ab..327a2c4f1d 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -60,8 +60,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>          uint32_t maxsz = vlmax << sew;
>          bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
>                             (maxsz >= 8);
> -        flags = FIELD_DP32(flags, TB_FLAGS, VILL,
> -                    FIELD_EX64(env->vtype, VTYPE, VILL));
> +        flags = FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
>          flags = FIELD_DP32(flags, TB_FLAGS, SEW, sew);
>          flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
>                      FIELD_EX64(env->vtype, VTYPE, VLMUL));
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 292f7e1624..b11d92b51b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -283,7 +283,18 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
>  static RISCVException read_vtype(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> -    *val = env->vtype;
> +    uint64_t vill;
> +    switch (env->xl) {
> +    case MXL_RV32:
> +        vill = (uint32_t)env->vill << 31;
> +        break;
> +    case MXL_RV64:
> +        vill = (uint64_t)env->vill << 63;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    *val = (target_ulong)vill | env->vtype;
>      return RISCV_EXCP_NONE;
>  }
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index a4b7859c2a..740e11fcff 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -124,8 +124,8 @@ static bool vector_needed(void *opaque)
>
>  static const VMStateDescription vmstate_vector = {
>      .name = "cpu/vector",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .needed = vector_needed,
>      .fields = (VMStateField[]) {
>              VMSTATE_UINT64_ARRAY(env.vreg, RISCVCPU, 32 * RV_VLEN_MAX / 64),
> @@ -134,6 +134,7 @@ static const VMStateDescription vmstate_vector = {
>              VMSTATE_UINTTL(env.vl, RISCVCPU),
>              VMSTATE_UINTTL(env.vstart, RISCVCPU),
>              VMSTATE_UINTTL(env.vtype, RISCVCPU),
> +            VMSTATE_BOOL(env.vill, RISCVCPU),
>              VMSTATE_END_OF_LIST()
>          }
>  };
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index ad505ec9b2..a9484c22ea 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -52,7 +52,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>          || (ediv != 0)
>          || (reserved != 0)) {
>          /* only set vill bit. */
> -        env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
> +        env->vill = 1;
> +        env->vtype = 0;
>          env->vl = 0;
>          env->vstart = 0;
>          return 0;
> --
> 2.31.1

thanks
-- PMM

