Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAA060CBCB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:27:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJ0K-0004Bi-Oe; Tue, 25 Oct 2022 08:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onIzy-0003P3-NN
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:25:38 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onIzw-0007UX-3U
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:25:38 -0400
Received: by mail-pg1-x52e.google.com with SMTP id h2so5194477pgp.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 05:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PYMsfhsJgAm2octu+hI1RrFjB1QfRWWlr1UErAST/fA=;
 b=cKkJb6pDUw2WP4fJA7UcZf3JLyfXbLZUgOAcEFLqw/SFmyqzDRE2ebsq/Di/mjyeqM
 +Ren30VDUTadI1VG3396oWboTRYGT6fG4NaY3XBUcDfiRflAE+kAKwz8eG3Iqg4WpoVQ
 c9rxdjlouTEpva88rTuaEFWZuKLUFRzRwIN/Z3nDGxvreUPbQT2CZeBTxtpNcY/3pPDc
 2fTyceK7Bp+SC7zR7gMjXb/2A6GvjWjDGB9FAzPS8av7lkzGpnup5OEjmeMdLnYVF76L
 TSOZNQA3nB7jeLeiCX2c8OhtbhIqdSTFXRVqSDbPw776/x5oMB/JnbkMj/K/Ou0KpwlD
 sBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PYMsfhsJgAm2octu+hI1RrFjB1QfRWWlr1UErAST/fA=;
 b=Cjfea1AUaI9euwSjAuoHmikE7OKH3gD+2hNMAhfai5tB31KfeS+K52JhdW3iqFVc6s
 eBS05m4HTh9F0y3GLKBrALQ+a8Drzq96VfkfJMkjRhzZthqmlXGJsKTScy3fq199Z7AH
 iL3TggqUpD/LbVRDBuM+At/Yey9esv+rdJ/RPxkzA9YbZISV71xI4Fwity61B+HYD371
 2FcALV3oo9gYCGkF+xiacNliqTCOppExcVTcpigh84uKtiz4iG6dekvPrTPFThzQ5Lqy
 Evl3m84+MzRDHzklIODnrLTqJWXKIG+BGyNxAv/bpbDgQ7ckd20CgqMQIreC6D7LFaII
 SZtg==
X-Gm-Message-State: ACrzQf02anZUUModwDYfQloykh7jtYXKOjiTK15FCGwIgIp7XA8R2LPz
 HKLvdJGxE6WFH7Ls68xTMu20CSZ514UtUtEMQPUsmg==
X-Google-Smtp-Source: AMsMyM5lvqCHu0pTqk5ErEudeGjfFnoCiIdyrYyl4rbXm+oWjSStvt/Ts1+Pshj5GHCWEMPOGFMeKV9o4zDhM7a+uyM=
X-Received: by 2002:a05:6a00:181b:b0:56b:fcbe:2e7f with SMTP id
 y27-20020a056a00181b00b0056bfcbe2e7fmr7011322pfa.3.1666700734185; Tue, 25 Oct
 2022 05:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221017093003.547009-1-ake@igel.co.jp>
In-Reply-To: <20221017093003.547009-1-ake@igel.co.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 13:25:22 +0100
Message-ID: <CAFEAcA_E5P2+ybnhH05DNsb_LuKjROU9-NKke46x+_LO7zr-qw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: honor HCR_E2H for AT S1E2R and AT S1E2W
 address translation
To: Ake Koomsin <ake@igel.co.jp>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 17 Oct 2022 at 10:30, Ake Koomsin <ake@igel.co.jp> wrote:
>
> When HCR_E2H is set, AT S1E2R and AT S1E2W should translate an address
> based on both TTBR0_EL2 and TTBR1_EL2.
>
> Signed-off-by: Ake Koomsin <ake@igel.co.jp>
> ---
>  target/arm/helper.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index dde64a487a..147f96e752 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3486,7 +3486,12 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
>              }
>              break;
>          case 4: /* AT S1E2R, AT S1E2W */
> -            mmu_idx = ARMMMUIdx_E2;
> +            if (arm_hcr_el2_eff(env) & HCR_E2H) {
> +                mmu_idx = env->pstate & PSTATE_PAN ?
> +                    ARMMMUIdx_E20_2_PAN : ARMMMUIdx_E20_2;
> +            } else {
> +                mmu_idx = ARMMMUIdx_E2;
> +            }
>              break;

I agree that the AT insns should be handling E2H, but I'm not sure this
is the right fix, and with Richard's recent refactorings I've
kind of lost track of what all our MMUIdxes do.

In the pseudocode, E2H is handled by changing the behaviour not
just of the S1E2 ops, but also of the S1E1 ops. If E2H is set:
 * the S1E2 ops use the EL2&0 regime, but continue to ignore
   PSTATE.PAN
 * the S1E1 ops also use the EL2&0 regime, with the S1E1RP and
   S1E1WP ops looking at PSTATE.PAN and the others not

Richard -- do we want to just do the same thing, or do
our MMUIdx uses differ from the architectural translation
regimes in a way that means we need to do something else?

thanks
-- PMM

