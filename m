Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A9569965F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:52:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSegJ-0007HB-D6; Thu, 16 Feb 2023 08:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSegG-0007Bk-Gh
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:52:12 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSegE-0006Ly-D4
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:52:12 -0500
Received: by mail-pg1-x536.google.com with SMTP id b22so1307564pgw.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wasIkPlJl4Xg98xpWM16XLAQZsEgWAZMLJAobJmJtIo=;
 b=ozhJIOmgXfDH9+uuTxj6njFnHT01kcGYLG79lTlbgDdbWKfgmg3HBAvs/QxuNv+XYp
 7QGfbjJnSL370OYt8VCV+1QtkG2n5tnHZINGI3VhM2DRhv241UcMRDk2CturqzjlBu5H
 Rr1QKKsJf8UUu0I1GegW6IPqZ6vAx6hZsO05IO8QmBD9GTp2Wx1wocSRu4rMZRWbPCM/
 SKVQNp45P7izlCFuaEZ0cNy+Fi0/QZx7HzCQAPcxInQ+/7w8pMBK6OIc4yg9IdECAvYt
 oAXVfCrRTJhgutQyIciddDoR2Uk0DXmRtI7OBwk6/GPo1u78VY/2PmYriIDYCE2vFron
 dhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wasIkPlJl4Xg98xpWM16XLAQZsEgWAZMLJAobJmJtIo=;
 b=BuNBo3c17P9Vo+0f7KiLfI7bmKjRpVZ7VaVDOPSlC7hmN1gqg18VxocOAWvArXYszV
 3jt9ZXFUH2VRnH2K10g+K72aEdwXS7GbU4qgGDbwMpWvCYYoEUDz5DzssbxvRS/RhMXn
 2ZpMWSpAG0175Or0G+jMdum2uwa4T6Tl/WH6n+apKFI6BZfgEhYNMeYn6ndZpExC2Ftc
 wenSE6F0qsn043OE2dsPr0IuWa6pdkiyPJG570fgrPE7hedh8iddqexRuVfNZ7uco5bf
 zMn/4LNy8CpYslBlqObBnpo++GrtT1t8STCf4Y8IzltT4JJ1BJMdGB2YCjakzCoaungj
 iENQ==
X-Gm-Message-State: AO0yUKX4FKUMvuaDNV+9fRlx+MFDUe/2RbLwajGPQZW5DhvB5cmecIag
 tSz9bYNI8/8vrpUlMVgHM9gyRYHiQmvmkb6e5356wg==
X-Google-Smtp-Source: AK7set9GD+uH1MAgeWeL5TVzFdkjO7sn1l/FQSgAgkYQCkQ7kE6D30HtDNd9jBfz/e2O3s45+ru8iPxfjQO2RnF35Ck=
X-Received: by 2002:a63:3d8c:0:b0:4fb:3790:120 with SMTP id
 k134-20020a633d8c000000b004fb37900120mr870321pga.6.1676555528708; Thu, 16 Feb
 2023 05:52:08 -0800 (PST)
MIME-Version: 1.0
References: <20230213183803.3239258-1-eric.auger@redhat.com>
In-Reply-To: <20230213183803.3239258-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 13:51:57 +0000
Message-ID: <CAFEAcA9sOykbFg=ZNvMRvjaSEJCEsn0MXODdu22zWSsyhDxAGQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Add raw_writes ops for register whose
 write induce TLB maintenance
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, richard.henderson@linaro.org, 
 pbonzini@redhat.com, qemu-devel@nongnu.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 13 Feb 2023 at 18:38, Eric Auger <eric.auger@redhat.com> wrote:
>
> Some registers whose 'cooked' writefns induce TLB maintenance do
> not have raw_writefn ops defined. If only the writefn ops is set
> (ie. no raw_writefn is provided), it is assumed the cooked also
> work as the raw one. For those registers it is not obvious the
> tlb_flush works on KVM mode so better/safer setting the raw write.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>
> ---
>
> v1 -> v2:
> - do not add raw_writefn if type is set to ARM_CP_NO_RAW [Peter]
>
> I am not familiar with those callbacks. I am not sure whether
> the .raw_writefn must be set only for registers only doing some
> TLB maintenance or shall be set safely on other registers doing
> TLB maintenance + other state settings.
> ---
>  target/arm/helper.c | 39 +++++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 16 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c62ed05c12..0bd8806999 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -719,16 +719,20 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
>       * the unified TLB ops but also the dside/iside/inner-shareable variants.
>       */
>      { .name = "TLBIALL", .cp = 15, .crn = 8, .crm = CP_ANY,
> -      .opc1 = CP_ANY, .opc2 = 0, .access = PL1_W, .writefn = tlbiall_write,
> +      .opc1 = CP_ANY, .opc2 = 0, .access = PL1_W,
> +      .writefn = tlbiall_write, .raw_writefn = raw_write,
>        .type = ARM_CP_NO_RAW },
>      { .name = "TLBIMVA", .cp = 15, .crn = 8, .crm = CP_ANY,
> -      .opc1 = CP_ANY, .opc2 = 1, .access = PL1_W, .writefn = tlbimva_write,
> +      .opc1 = CP_ANY, .opc2 = 1, .access = PL1_W,
> +      .writefn = tlbimva_write, .raw_writefn = raw_write,
>        .type = ARM_CP_NO_RAW },
>      { .name = "TLBIASID", .cp = 15, .crn = 8, .crm = CP_ANY,
> -      .opc1 = CP_ANY, .opc2 = 2, .access = PL1_W, .writefn = tlbiasid_write,
> +      .opc1 = CP_ANY, .opc2 = 2, .access = PL1_W,
> +      .writefn = tlbiasid_write, .raw_writefn = raw_write,
>        .type = ARM_CP_NO_RAW },
>      { .name = "TLBIMVAA", .cp = 15, .crn = 8, .crm = CP_ANY,
> -      .opc1 = CP_ANY, .opc2 = 3, .access = PL1_W, .writefn = tlbimvaa_write,
> +      .opc1 = CP_ANY, .opc2 = 3, .access = PL1_W,
> +      .writefn = tlbimvaa_write, .raw_writefn = raw_write,
>        .type = ARM_CP_NO_RAW },
>      { .name = "PRRR", .cp = 15, .crn = 10, .crm = 2,
>        .opc1 = 0, .opc2 = 0, .access = PL1_RW, .type = ARM_CP_NOP },

These are all type ARM_CP_NO_RAW, so don't want a raw_writefn.

> @@ -4183,14 +4187,14 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 0,
>        .access = PL1_RW, .accessfn = access_tvm_trvm,
>        .fgt = FGT_TTBR0_EL1,
> -      .writefn = vmsa_ttbr_write, .resetvalue = 0,
> +      .writefn = vmsa_ttbr_write, .resetvalue = 0, .raw_writefn = raw_write,
>        .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
>                               offsetof(CPUARMState, cp15.ttbr0_ns) } },
>      { .name = "TTBR1_EL1", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 1,
>        .access = PL1_RW, .accessfn = access_tvm_trvm,
>        .fgt = FGT_TTBR1_EL1,
> -      .writefn = vmsa_ttbr_write, .resetvalue = 0,
> +      .writefn = vmsa_ttbr_write, .resetvalue = 0, .raw_writefn = raw_write,
>        .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
>                               offsetof(CPUARMState, cp15.ttbr1_ns) } },
>      { .name = "TCR_EL1", .state = ARM_CP_STATE_AA64,
> @@ -4450,13 +4454,13 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
>        .type = ARM_CP_64BIT | ARM_CP_ALIAS,
>        .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
>                               offsetof(CPUARMState, cp15.ttbr0_ns) },
> -      .writefn = vmsa_ttbr_write, },
> +      .writefn = vmsa_ttbr_write, .raw_writefn = raw_write },
>      { .name = "TTBR1", .cp = 15, .crm = 2, .opc1 = 1,
>        .access = PL1_RW, .accessfn = access_tvm_trvm,
>        .type = ARM_CP_64BIT | ARM_CP_ALIAS,
>        .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
>                               offsetof(CPUARMState, cp15.ttbr1_ns) },
> -      .writefn = vmsa_ttbr_write, },
> +      .writefn = vmsa_ttbr_write, .raw_writefn = raw_write },
>  };
>
>  static uint64_t aa64_fpcr_read(CPUARMState *env, const ARMCPRegInfo *ri)
> @@ -5899,12 +5903,12 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .type = ARM_CP_IO,
>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
> -      .writefn = hcr_write },
> +      .writefn = hcr_write, .raw_writefn = raw_write },

These ones are OK.

>      { .name = "HCR", .state = ARM_CP_STATE_AA32,
>        .type = ARM_CP_ALIAS | ARM_CP_IO,
>        .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
> -      .writefn = hcr_writelow },
> +      .writefn = hcr_writelow, .raw_writefn = raw_write },

This is going to do the wrong thing on big-endian hosts, because
the data value is the low 32 bits and the raw_writefn will
write that to the whole 64-bit value. We could implement a
special purpose raw write for this register which just writes
the value to the low 32 bits, I guess.

For KVM we could ignore this, though -- the register is EL2 only,
and also is ARM_CP_ALIAS, which means we won't try to do anything
with it for the KVM<->QEMU state sync or the migration codepaths.

>      { .name = "HACR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 7,
>        .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> @@ -5971,6 +5975,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>      { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
>        .access = PL2_RW, .writefn = vmsa_tcr_el12_write,
> +      .raw_writefn = raw_write,
>        .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
>      { .name = "VTCR", .state = ARM_CP_STATE_AA32,
>        .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
> @@ -5987,10 +5992,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .type = ARM_CP_64BIT | ARM_CP_ALIAS,
>        .access = PL2_RW, .accessfn = access_el3_aa32ns,
>        .fieldoffset = offsetof(CPUARMState, cp15.vttbr_el2),
> -      .writefn = vttbr_write },
> +      .writefn = vttbr_write, .raw_writefn = raw_write },
>      { .name = "VTTBR_EL2", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 0,
> -      .access = PL2_RW, .writefn = vttbr_write,
> +      .access = PL2_RW, .writefn = vttbr_write, .raw_writefn = raw_write,
>        .fieldoffset = offsetof(CPUARMState, cp15.vttbr_el2) },
>      { .name = "SCTLR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 0,
> @@ -6002,7 +6007,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .fieldoffset = offsetof(CPUARMState, cp15.tpidr_el[2]) },
>      { .name = "TTBR0_EL2", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 0,
> -      .access = PL2_RW, .resetvalue = 0, .writefn = vmsa_tcr_ttbr_el2_write,
> +      .access = PL2_RW, .resetvalue = 0,
> +      .writefn = vmsa_tcr_ttbr_el2_write, .raw_writefn = raw_write,
>        .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[2]) },
>      { .name = "HTTBR", .cp = 15, .opc1 = 4, .crm = 2,
>        .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,

These ones are all OK.

> @@ -6139,7 +6145,7 @@ static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
>        .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
>        .access = PL2_RW,
>        .fieldoffset = offsetofhigh32(CPUARMState, cp15.hcr_el2),
> -      .writefn = hcr_writehigh },
> +      .writefn = hcr_writehigh, .raw_writefn = raw_write },

Similarly this would need a special purpose raw write function
since we want to only touch the high 32 bits; and again for
the KVM case we won't ever be doing a raw access to this register.


>  };
>
>  static CPAccessResult sel2_access(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -6189,12 +6195,12 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>      { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
> -      .resetfn = scr_reset, .writefn = scr_write },
> +      .resetfn = scr_reset, .writefn = scr_write, .raw_writefn = raw_write },
>      { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_NEWEL,
>        .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
>        .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
> -      .writefn = scr_write },
> +      .writefn = scr_write, .raw_writefn = raw_write },
>      { .name = "SDER32_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 1,
>        .access = PL3_RW, .resetvalue = 0,
> @@ -7862,6 +7868,7 @@ static const ARMCPRegInfo vhe_reginfo[] = {
>      { .name = "TTBR1_EL2", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 1,
>        .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
> +      .raw_writefn = raw_write,
>        .fieldoffset = offsetof(CPUARMState, cp15.ttbr1_el[2]) },

These are OK.

>  #ifndef CONFIG_USER_ONLY
>      { .name = "CNTHV_CVAL_EL2", .state = ARM_CP_STATE_AA64,
> --
> 2.37.3
>

thanks
-- PMM

