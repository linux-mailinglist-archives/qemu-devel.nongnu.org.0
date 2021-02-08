Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE30F3142E1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:25:41 +0100 (CET)
Received: from localhost ([::1]:58350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EyS-0004h3-VD
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Aj6-0001gi-Iv
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:53:36 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Aj4-0002eg-Rq
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:53:32 -0500
Received: by mail-ed1-x52c.google.com with SMTP id s3so19522481edi.7
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 09:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y5JdCRpB9l3B5/J8PFpRb0hvUTv0KNFtLs5loESkpGU=;
 b=u1dKfCI8e0rpX2fcPZc3NJ0QD7/0nRTrypBSEoIK+UkSLaEGsVIGUOYK11oERLdGMy
 vNfUHd8QruClVqbP+29reJbu8ON1EVsT7dLnN9dwr5l4emhllyvck1Pg/wtPSEy40Rty
 Z1mZ0WR2rJWSqgzreoWXntlCaqvG1Ihy/pAQV5KiKadqp6J6XVXqTtvsiZjMEVRNicuW
 o+2FivPB/dFziO36OzJ9qVmhW3fjqEjeXjTL7yvrW7LGRYnFqo6cSKC/C6fmwRosTCaT
 9/i0jFTssTjD/udo88iEfR88x0oh5CBRChP8H0cu+4gVGnLsrhidUXFB/4FReot33Sd8
 8hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y5JdCRpB9l3B5/J8PFpRb0hvUTv0KNFtLs5loESkpGU=;
 b=DQmG1pfSaC5K+uWPQ/yiJK9dMzZE0rOkWGV724uNlBGgJpysJqTj6Mwupl4Fl68MkJ
 LwX0eXRVEX0YxOa8+4mfDK0Rl94mMcFttq1JKlQVW3kI68n26eRANx6OwIYh9FjG67Aa
 nm1Ea+EcqcGM9ls+SF48v1xDRojzJZLCdsnMbTDclEibsELG5TRtw0KijBbTHPvLfsc4
 EHHjvTZxiINwi/a9vHPaQJ3es7a71Y0bR+qTlTUutxC4prvL0V1IjJffe+uaS/0ccI1n
 WNKadL/d7pDU/YrTTD/DOBuwn5JqxxNg+AMEDPSlg9ubTpX1OUl8iem2rT7zTotrefvk
 jzVw==
X-Gm-Message-State: AOAM530eenyJZYjtl5qcD3FQCg5YTnFHaqCUOJxvW/2xv51lYt5f4Cwj
 w7BYj9JUB33IJ+YJpz7qqENtS39XB3uwwKbmAWQNxw==
X-Google-Smtp-Source: ABdhPJwsTd6UzTYq4n8eo+2e9F72im8jh90EFgMr6j2fHoFxlcsddH4zijYOPK2Mn3tUCyrMnMM5QstILHsjQmhT1/U=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr18776579edc.146.1612806809296; 
 Mon, 08 Feb 2021 09:53:29 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-3-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 17:53:17 +0000
Message-ID: <CAFEAcA9bfj0X1Pb6_Em2hX7OkgmobFf=SGWQe=cXHaCO8n5jCQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] tcg/arm: Add host vector framework
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Mon, 8 Feb 2021 at 03:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add registers and function stubs.  The functionality
> is disabled via use_neon_instructions defined to 0.
>
> We must still include results for the mandatory opcodes in
> tcg_target_op_def, as all opcodes are checked during tcg init.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +    if (use_neon_instructions) {
> +        tcg_target_available_regs[TCG_TYPE_V64]  = ALL_VECTOR_REGS;
> +        tcg_target_available_regs[TCG_TYPE_V128] = ALL_VECTOR_REGS;
> +
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q0);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q1);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q2);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q3);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q4);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q5);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q6);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q7);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q8);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q9);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q10);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q11);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q12);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q13);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q14);
> +        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q15);
> +    }

The AAPCS says that q4-q7 are preserved across calls.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

