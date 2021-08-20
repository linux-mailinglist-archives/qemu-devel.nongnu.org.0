Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637753F2BB1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 14:05:24 +0200 (CEST)
Received: from localhost ([::1]:49874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH3H0-0007Kn-Hw
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 08:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH3Fm-0006XR-Lo
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 08:04:06 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH3Fk-0004CV-6K
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 08:04:06 -0400
Received: by mail-ed1-x52e.google.com with SMTP id i6so13708223edu.1
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 05:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g8dan8T67fWtuX17B9y/L+N6XILYKuDwOawnfg7lC84=;
 b=xZEGHz3gkdxms67Whg7OhfWwgH77SajJv6/qNO5oWPoIX0/Ew5ew6QbRMNrFaxxTRK
 zzOSdLRuh2V30O3R3XJz3dRSvijzGjm2al8hQjf97VYiKyUCe4H2lBr9+PApRvOp/WQT
 fEzMDrzqshoH0DH6rDSyZjhhbvaJaQIxtc3kjk1kvHvxQ8slIzzBmEVkIWPM/X6ZgsMW
 vbVeAFFZrsxdJ78k8BUloARUBVy6oB4NSBJzIfOfIM9XbFDS3X2IDnjUBAzOtWB4agKy
 ejJ9F6PIDR8S+6ieHopbpnFefKzvDU1RKW8JnJF/AXm0AL44uXJDAlHuGOt3YpJdgQbJ
 UtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8dan8T67fWtuX17B9y/L+N6XILYKuDwOawnfg7lC84=;
 b=rGLMq/5yJcRcCRoEiH2ncqGZhvZHyYABUzLjKABK8A4XCFzQm8Etlus+1xqRpyHyJ/
 uHLMZzMvNFslr9AwmOW8R663kLKu5JkMfkcnR7N9l97A3VaTUPb20PNbmT0h77ha09P7
 q4nhWX/JMYdhoih1Rf+YXcpXp1gkSmPtx/Rdt6J2rRuQEJ2ueoUnMiFLAJnHPBC8rhtb
 XTTA2hgiPieBszwzIqTpL3UjCxmANpQc1rKZXPBGYlsYLxi+AqBSPsDZitohy93Bs3wP
 +I+LhadFYfjEUpqMnw190f/zGjGrXHXSxEAYlhLjcWdj7PPkeXn/4yrAG9fpM62L7EkJ
 DZyw==
X-Gm-Message-State: AOAM533WxlbEBkL2v/eaO7g5eIQeNiMwFyyxIDOtdUHEdKZWt7GYUYcF
 ANNqhQ+vBnbJdAlpq3rYOAJyP9ai/UTUXuj8D2Wvyw==
X-Google-Smtp-Source: ABdhPJx5BkdKrYAVtIppVWdBKm+E+C9SGuQ2bkZpCF8KrD2PI4LZhuy0yTe8/9VZ/IxalU3VRQG1L9EkniNukzVdNoo=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr21921648edb.52.1629461041978; 
 Fri, 20 Aug 2021 05:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-14-richard.henderson@linaro.org>
In-Reply-To: <20210818212912.396794-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 13:03:15 +0100
Message-ID: <CAFEAcA81XmmHFtVfA9U307y5D41NzuHZNTFXgHe2-1Y+ZEhjSg@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] tcg/arm: Reserve a register for guest_base
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 22:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reserve a register for the guest_base using aarch64 for reference.
> By doing so, we do not have to recompute it for every memory load.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 39 ++++++++++++++++++++++++++++-----------
>  1 file changed, 28 insertions(+), 11 deletions(-)
>
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index 35bd4c68d6..2728035177 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -84,6 +84,9 @@ static const int tcg_target_call_oarg_regs[2] = {
>
>  #define TCG_REG_TMP  TCG_REG_R12
>  #define TCG_VEC_TMP  TCG_REG_Q15
> +#ifndef CONFIG_SOFTMMU
> +#define TCG_REG_GUEST_BASE  TCG_REG_R11
> +#endif
>
>  typedef enum {
>      COND_EQ = 0x0,
> @@ -1763,7 +1766,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
>
>  static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
>                                    TCGReg datalo, TCGReg datahi,
> -                                  TCGReg addrlo, TCGReg addend)
> +                                  TCGReg addrlo, TCGReg addend,
> +                                  bool scratch_addend)
>  {
>      /* Byte swapping is left to middle-end expansion. */
>      tcg_debug_assert((opc & MO_BSWAP) == 0);
> @@ -1790,7 +1794,7 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
>              && get_alignment_bits(opc) >= MO_64
>              && (datalo & 1) == 0 && datahi == datalo + 1) {
>              tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
> -        } else if (datalo != addend) {
> +        } else if (scratch_addend) {
>              tcg_out_ld32_rwb(s, COND_AL, datalo, addend, addrlo);
>              tcg_out_ld32_12(s, COND_AL, datahi, addend, 4);
>          } else {

I don't understand this change. Yes, we can trash the addend
register, but if it's the same as 'datalo' then the second load
is not going to DTRT... Shouldn't this be
  if (scratch_addend && datalo != addend)
?

-- PMM

