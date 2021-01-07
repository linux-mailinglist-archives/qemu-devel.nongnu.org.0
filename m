Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253842ED61F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:55:58 +0100 (CET)
Received: from localhost ([::1]:34396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZVt-0002Yl-7W
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZUG-00017i-O1
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:54:16 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZUE-0001O5-Ek
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:54:16 -0500
Received: by mail-ed1-x530.google.com with SMTP id b2so8623558edm.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aL48qderxPw85CzscQ0M5uVrCA+0WaiodXOzIokt/Dw=;
 b=Get/I7IxDv33MwkvsxK5V4x8oco+mSjMp8ZR+cBmvc7gFdrEU0VkKEKcR9NOprEXXR
 ofkoGDM/NaMc8Pqnkz3jcXoylVDIVEkJXTxWlOnb2lwxd+/KZUUcusYM+WUg+USvY3HO
 05Y/S30pjuirZmfFsv6m+HrDKOcB9JjLb4dYQWyA2pCCoRiHgg3FsjbTpGyVTB9qA7VW
 7JP6n7kYBG8VqeydT9ltwzNyRZRTt1a1sR/BXtqxZatDbYYKbLN19f9jZ1d+MzOlbCZg
 kew+Pl1C4/Q8S4JKXZ5gluyE+8LO/RtWmPfd0o0hlkY6X1eObp1SoStsuC7LW0ttn76+
 aQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aL48qderxPw85CzscQ0M5uVrCA+0WaiodXOzIokt/Dw=;
 b=qLItHtkoNkIpir0PqGc5ifC4SJYIsuq7pCOucJzJSNK/+A1idv7ohvIPElEcMfulWQ
 cJehF/HvqA/2AMftrKzq1WlB3jVTB9g61rMaMZk13XHVM/GYeVLcM7NtdLCfxfVImgZy
 R0kScfdxLlihC6kynMXZpQd7dFZ5lu5PUslW6AZxJHMh26K1clwNbN38whcin2wl1RLB
 idrbqY3O49trEHpd0iG7Ij2/k7lN7OkUU/OBUcJxzOa3/ezPehgZDnAQNfX2kcy90mWz
 +INIhnUVVV15QoEzVNYNqIzPpNyG7iym6QHv0uFre9fSTmKlkSu0j5oUN0M21SxiiN1z
 VTnA==
X-Gm-Message-State: AOAM532r7IN9LWI+3FGEBQzdO/ibigvJhSCXjxoTem6JE5O0mNRtQkRb
 ZBlyk0KBexepkrff7GJqgBs/n5r8PNPY9I6cu0E4Rg==
X-Google-Smtp-Source: ABdhPJw/rTyRa47fGR4Ogef204Fd1em2wLpflZu26XAQuOIBmisPw/cVT0Q9itYwNUgYjPc8r+coUL1SvAUPDi7kEi8=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr2508664edr.204.1610042053005; 
 Thu, 07 Jan 2021 09:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20201221204426.88514-1-richard.henderson@linaro.org>
In-Reply-To: <20201221204426.88514-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:54:01 +0000
Message-ID: <CAFEAcA8FrSwpG6GkhxnPQa0h=Lq4Yjv7YWHFDu3DejKOjdJR3A@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix MTE0_ACTIVE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Collingbourne <pcc@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Dec 2020 at 20:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In 50244cc76abc we updated mte_check_fail to match the ARM
> pseudocode, using the correct EL to select the TCF field.
> But we failed to update MTE0_ACTIVE the same way, which led
> to g_assert_not_reached().
>
> Cc: qemu-stable@nongnu.org
> Buglink: https://bugs.launchpad.net/bugs/1907137
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7b8bcd6903..4597081d5d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -12932,7 +12932,7 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>          if (FIELD_EX32(flags, TBFLAG_A64, UNPRIV)
>              && tbid
>              && !(env->pstate & PSTATE_TCO)
> -            && (sctlr & SCTLR_TCF0)
> +            && (sctlr & SCTLR_TCF)
>              && allocation_tag_access_enabled(env, 0, sctlr)) {
>              flags = FIELD_DP32(flags, TBFLAG_A64, MTE0_ACTIVE, 1);
>          }


I don't understand this change, could you explain a bit more?
In commit 50244cc76abcac we change to looking at the TCF
field corresponding to the actual current EL instead of the
EL for the memory-access. But if we're doing that then why
should we be looking at exclusively SCTLR_TCF0 in this
for-unpriv-access code rather than doing the same thing we do
for normal accesses and checking
  (sctlr & (el == 0 ? SCTLR_TCF0 : SCTLR_TCF))
?

thanks
-- PMM

