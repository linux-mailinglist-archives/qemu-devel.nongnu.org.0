Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E016A60B2E9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:53:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on0Sb-0007dg-FV; Mon, 24 Oct 2022 12:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1on0SY-0007dQ-6j
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 12:37:54 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1on0SW-00044J-Ha
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 12:37:54 -0400
Received: by mail-pl1-x62f.google.com with SMTP id jo13so5308082plb.13
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 09:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MrCwu+eqwdsVgBk9dvsRU7MwgqUcA3AMQc+6ZiWhQq0=;
 b=I/aWNRtq/WSBhgTOQ7M0sfV3tSf5sv/M8KaILJV+MLPb0lmwqQv8yrkn+uNyAqCCz6
 Ver+XS9/ViyvWC6ALmLPokqc7NeE4JS56IVHjpqeZ/UHqqalazHlXbdN45DM/v69t2Gu
 AZ934Xx7r3SP/zZELlLptde/oetupDZ6WVr8QxvtbobMB0EQpgPvp4kVJOOWp62yDNtg
 rHbL1s9ulciGnYayOWg9un2w/RvjmUXlYzK3U//YDR/1mNFGlpoyS34nkP+27ZP5dSV6
 TBz1aH+2k/yZ1O6Eq4N1APrK86JuT5ChfY436KFUFrRhbPXnPvO0jNH0wbsw5D3VAive
 APDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MrCwu+eqwdsVgBk9dvsRU7MwgqUcA3AMQc+6ZiWhQq0=;
 b=vLR5zQL+drNSEdrRZscFTkdFRj+8LbeDHAgKZGJd1uE2A35+khwegTwe9oepxlaZgH
 t+pXJI9Guw9GL9/FgUSRBNORdgwlEFddiozLX9Wtz5SPtebzKSblidxBSlskdM5y5r15
 bS3C9KaO1ej8igEYDMGxUp3u9NvbEcDpDobMMlbmpiAoHVO8q0cE18b+a8EnqS3wdMZH
 q3xykxIqPa68z0bnzeudDc1hmU4pj+LGQFCGSoafFwhZWixQ5gaNZrrw2PsJ7ifvEUu3
 KsgKGBTtYZP9X+JAhssCud5baFLRNLt25PcBLuSpQb7xM52z1OdjCdIDhBgcDSMTv2Wl
 4sNw==
X-Gm-Message-State: ACrzQf03AIdTJnG1yD9FyGRFy6RvLtromr3De4xGc71JMKLLqgSXA99j
 xUABC4N8Jv/vWqatc1fUmvL18LXklUchSVMuEU1WZw==
X-Google-Smtp-Source: AMsMyM6uRmld0EXTMiW/jereIvJ6kUPfu+0gMexM5rVthb/JPGRAC0tpqIiYGoCe2NkPkI5DQ+xJ350INLMu+R84JPU=
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr38646037pjb.215.1666629470535; Mon, 24
 Oct 2022 09:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221017092432.546881-1-ake@igel.co.jp>
In-Reply-To: <20221017092432.546881-1-ake@igel.co.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2022 17:37:38 +0100
Message-ID: <CAFEAcA9sQ-QJCw_P3OAp5O9o7pHcpz1kwmSi+=Dg4qqMfYt1iQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: honor HCR_E2H and HCR_TGE in
 arm_excp_unmasked()
To: Ake Koomsin <ake@igel.co.jp>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
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

On Mon, 17 Oct 2022 at 10:29, Ake Koomsin <ake@igel.co.jp> wrote:
>
> An exception targeting EL2 from lower EL is actually maskable when
> HCR_E2H and HCR_TGE are both set. This applies to both secure and
> non-secure Security state.
>
> Signed-off-by: Ake Koomsin <ake@igel.co.jp>
> ---
>  target/arm/cpu.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 94ca6f163f..86d3377d3f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -561,14 +561,24 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
>      if ((target_el > cur_el) && (target_el != 1)) {
>          /* Exceptions targeting a higher EL may not be maskable */
>          if (arm_feature(env, ARM_FEATURE_AARCH64)) {
> -            /*
> -             * 64-bit masking rules are simple: exceptions to EL3
> -             * can't be masked, and exceptions to EL2 can only be
> -             * masked from Secure state. The HCR and SCR settings
> -             * don't affect the masking logic, only the interrupt routing.
> -             */
> -            if (target_el == 3 || !secure || (env->cp15.scr_el3 & SCR_EEL2)) {
> +            switch (target_el) {
> +            case 2:
> +                /*
> +                 * According to ARM DDI 0487H.a, an interrupt can be masked
> +                 * when HCR_E2H and HCR_TGE are both set regardless of the
> +                 * current Security state. Note that We need to revisit this
> +                 * part again once we need to support NMI.
> +                 */
> +                if ((hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
> +                        unmasked = true;
> +                }
> +                break;
> +            case 3:
> +                /* Interrupt cannot be masked when the target EL is 3 */
>                  unmasked = true;
> +                break;
> +            default:
> +                g_assert_not_reached();

Hi; thanks for this patch. You're correct that there is a bug here, but
it took me a while to work out why it's OK to remove the "don't allow
masking if we're in Secure EL0/EL1 and the exception is going to NS EL2"
check. The answer to that turns out to be "the target_el could never be
2 anyway in that case": because arm_phys_excp_target_el() uses
arm_hcr_el2_eff(),
if we're Secure and SEL2 isn't enabled then the effective HCR_EL2 bits
will all be zero, which forces us into the "targets EL1" or "targets EL3"
cases.

So I think that's worth mentioning in the commit message:

"We can remove the conditions that try to suppress masking of
interrupts when we are Secure and the exception targets EL2 and
Secure EL2 is disabled, because in that case arm_phys_excp_target_el()
will never return 2 as the target EL. The 'not if secure' check
in this function was originally written before arm_hcr_el2_eff(), and
back then the target EL could be 2 even if we were in Secure EL0/EL1;
it is no longer needed."

I'll apply this to target-arm.next, with the commit message
updated to include that.

thanks
-- PMM

