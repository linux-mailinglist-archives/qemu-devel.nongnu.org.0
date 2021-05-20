Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224FC38B08D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:53:16 +0200 (CEST)
Received: from localhost ([::1]:39770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljj6x-0000ce-08
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljj5K-0007LQ-OO
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:51:36 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljj5H-0002lp-3w
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:51:34 -0400
Received: by mail-ej1-x632.google.com with SMTP id l1so25429938ejb.6
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 06:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q7equHk7i48+d4K4okkPuh8PDXpVfZXhJXgC/DFmrbs=;
 b=V5mgVhPWidU4aD0V0Mw3efahAnLt5T79Sg8JLqemd8kcbToNcjd0GirhfmWsg/c+gM
 moBU7EEAEF8K1OjCIqMkeRvTO/UjHFOOvLULLKcnsyuiV6uNBNyP2VkisBdjzfUnlHIy
 BGD82Qqj/t+8UZsIsdqMjTAHoy734jyAcwcAOhFUAjyfZmJNkJKNGrXL//EtfMFjB9hB
 o35dLjWC8gvFBVBVzyH9EBKTxeayEKjEl0myJgMeN+R3wjzDalzN2WXBuji/3TAdzXPv
 ntDOxGcZwAw2ubus1T45M/NC/JXv0mdcSJUhHrGzkCd7n04bQq+ZwjofQzAFV0xZWT9M
 4/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q7equHk7i48+d4K4okkPuh8PDXpVfZXhJXgC/DFmrbs=;
 b=lhtIia4LT8RYLSS8KCrpxgkA767KZ6WwqEvLGMZqel5NxS+Y5vKqwUScqup8SPM2NG
 MwxbUDD5NZLxeJnH2cA/YnxvvRhYDfuWyk2qiW+vck+pDQgDjhtiY3DuREVDUu7hZyWW
 MRwCZViKAKevrq927TMdt6g2av7wlOwMlrxNQNf/G5iAiCCRLi8J/iXMIQNJ5m3bgsrw
 jLWsFNu//3HKh4lKC22zyc//+h0oayHQXnRrbYzQpcL9YRLhaJO27+i/az6Lv03Nf5jh
 YlGeYbUofXR/9YTljpAFMUD46Sr5OqW0h8gPx98jbKpYGkr7NCQrNAI5MsI3bqQbouqI
 v79A==
X-Gm-Message-State: AOAM5308+j2V5pmXvFG9Y3EvQVXnlBbTXSCvIoCUlpdpwScdcgAktYHW
 7f8DZGnsqEG9071kjrurSa28QOF7VwLI2jW5+6ey7w==
X-Google-Smtp-Source: ABdhPJz+ARBx5/Hn9M4Cxq3saB1DqFuysqLRKtVafTap5mT7xmyDNHmr82ETCMIgU0uJ21gVpmT+vCPPlFPnDKFrEFM=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr4691796ejb.407.1621518689193; 
 Thu, 20 May 2021 06:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210511101951.165287-1-alistair.francis@wdc.com>
 <20210511101951.165287-25-alistair.francis@wdc.com>
In-Reply-To: <20210511101951.165287-25-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 14:51:10 +0100
Message-ID: <CAFEAcA_J739jGEGLTAo+JEqRDyWcuCMZicT1tpxPQY26N5h2SA@mail.gmail.com>
Subject: Re: [PULL v3 24/42] target/riscv: Implementation of enhanced PMP
 (ePMP)
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hou Weiying <weiying_hou@outlook.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>, Myriad-Dreamin <camiyoru@gmail.com>,
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 May 2021 at 11:21, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> From: Hou Weiying <weiying_hou@outlook.com>
>
> This commit adds support for ePMP v0.9.1.
>
> The ePMP spec can be found in:
> https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8
>
> Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
> Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
> Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Message-id: fef23b885f9649a4d54e7c98b168bdec5d297bb1.1618812899.git.alistair.francis@wdc.com
> [ Changes by AF:
>  - Rebase on master
>  - Update to latest spec
>  - Use a switch case to handle ePMP MML permissions
>  - Fix a few bugs
> ]
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Hi; this code confuses Coverity into thinking that the pmp_hart_has_privs()
function might read the value pointed to by 'allowed_privs' when
it is uninitialized (CID 1453108):


> @@ -294,13 +351,94 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>              pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
>
>          /*
> -         * If the PMP entry is not off and the address is in range, do the priv
> -         * check
> +         * Convert the PMP permissions to match the truth table in the
> +         * ePMP spec.
>           */
> +        const uint8_t epmp_operation =
> +            ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
> +            ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
> +            (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
> +            ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);

Here we construct a value which can only be in the range [0,15],
but we do it in a way that Coverity isn't clever enough to figure out...

> +
>          if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
> -            *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> -            if ((mode != PRV_M) || pmp_is_locked(env, i)) {
> -                *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
> +            /*
> +             * If the PMP entry is not off and the address is in range,
> +             * do the priv check
> +             */
> +            if (!MSECCFG_MML_ISSET(env)) {
> +                /*
> +                 * If mseccfg.MML Bit is not set, do pmp priv check
> +                 * This will always apply to regular PMP.
> +                 */
> +                *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> +                if ((mode != PRV_M) || pmp_is_locked(env, i)) {
> +                    *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
> +                }
> +            } else {
> +                /*
> +                 * If mseccfg.MML Bit set, do the enhanced pmp priv check
> +                 */
> +                if (mode == PRV_M) {
> +                    switch (epmp_operation) {
> +                    case 0:
> +                    case 1:
> +                    case 4:
> +                    case 5:
> +                    case 6:
> +                    case 7:
> +                    case 8:
> +                        *allowed_privs = 0;
> +                        break;
> +                    case 2:
> +                    case 3:
> +                    case 14:
> +                        *allowed_privs = PMP_READ | PMP_WRITE;
> +                        break;
> +                    case 9:
> +                    case 10:
> +                        *allowed_privs = PMP_EXEC;
> +                        break;
> +                    case 11:
> +                    case 13:
> +                        *allowed_privs = PMP_READ | PMP_EXEC;
> +                        break;
> +                    case 12:
> +                    case 15:
> +                        *allowed_privs = PMP_READ;
> +                        break;

...so coverity thinks that "via the 'default' case" is a valid flow
of control in these switch() statements...

> +                    }
> +                } else {
> +                    switch (epmp_operation) {
> +                    case 0:
> +                    case 8:
> +                    case 9:
> +                    case 12:
> +                    case 13:
> +                    case 14:
> +                        *allowed_privs = 0;
> +                        break;
> +                    case 1:
> +                    case 10:
> +                    case 11:
> +                        *allowed_privs = PMP_EXEC;
> +                        break;
> +                    case 2:
> +                    case 4:
> +                    case 15:
> +                        *allowed_privs = PMP_READ;
> +                        break;
> +                    case 3:
> +                    case 6:
> +                        *allowed_privs = PMP_READ | PMP_WRITE;
> +                        break;
> +                    case 5:
> +                        *allowed_privs = PMP_READ | PMP_EXEC;
> +                        break;
> +                    case 7:
> +                        *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> +                        break;
> +                    }
> +                }
>              }
>
>              ret = ((privs & *allowed_privs) == privs);

...and that we can get to here without having ever set *allowed_privs.


Adding
   default:
       g_assert_not_reached();

to both switches should clarify to both Coverity and human readers that
the cases in the switch are a complete enumeration of the possibilities.

thanks
-- PMM

