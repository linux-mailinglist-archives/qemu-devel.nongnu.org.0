Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590003001B9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:38:26 +0100 (CET)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ull-0002gW-Dy
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2ukX-0001hc-2v
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:37:09 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2ukU-0004cA-Gf
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:37:08 -0500
Received: by mail-ej1-x62f.google.com with SMTP id r12so7173040ejb.9
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 03:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yRxDPann/7bwjlu5VchBcHrH73lxDT9XO/l8WhnUvYw=;
 b=ZEC+LFyIQ1iO/c7vKx9FTIDNAs4CN/joYZLsdhGwH1xo6py6brkEr6NLc/h0lwhNAs
 vE56lDyloVQLII4d8cqnzkG/aGkt9AXSyKVCE5hnEK30LHD6Dn9MTOD97GG0pRyavPYa
 6+r2t87dcfCLnIiHVQxsO+bJ3DEuwHeEK0SSxJ0e0gVP8L7mmPFtqyVy2yHzkwhjQnBH
 goUrUHTMtqwVbhYvHyXDztdxqUbTALJR+Ke9dICGpezB5fOJagWWrBjrsv9zuB7JgpEy
 biq1USvQhiduRD6DpD7az3ZGy2aEELKAYC3RIfkeUx9PqgC9+ALU2YCsMFAoBdp2fvVF
 2gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yRxDPann/7bwjlu5VchBcHrH73lxDT9XO/l8WhnUvYw=;
 b=nQvVPZKo/QodQYyq8NHI3FUM94/l92Fb3vkfDX33T//oNLtCVjPr1oqw0EhZuVERYf
 qz96B35CzT2F3cGVFW41ql1wEmMMXbcbHCjUpirx/U8H4Qud10bQKhYC8j9HUJZaZF9v
 9ID+VQACBIgkhWMPwOPzUWzROMlvRijwIq2z7T4he/jJEg5YEYj7kQxOf8QQ0EZ11OOV
 A0xzzVSAwyjcMd0wZiUCvItNgbS0wPMa2mjHtrVwOgsjwnEGp0+uDEJnfzmjdNOlO6Wn
 q2p7Z76UdHy4qFgHfBltrPfliUEd7jQiXL9hkzTVohOWz7iKmBcuuR+sM4q4M/TTu0CD
 e5Yw==
X-Gm-Message-State: AOAM532Is+I6l4OZL2UKUO4cFsnWotEjZEi2e80J8D7S51vDMBR4oVK7
 dr9HtS/3RcGHoawhjrY8l9NK4njUJowpUxFiRXIwuA==
X-Google-Smtp-Source: ABdhPJzM6UtkSjJEQq5NFGyFeOyEtDowtAVAVkT72+Elklzzo7n97iukWMZ1dIj2nZ3T8VZ3d0YnDFDLvMf5Q1Q7xn0=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr2787100ejt.56.1611315424620; 
 Fri, 22 Jan 2021 03:37:04 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-13-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 11:36:53 +0000
Message-ID: <CAFEAcA-2rcoOK4wLZ_m+fX69o7o652Fb4FwBj7FbQgdG4RU3Ug@mail.gmail.com>
Subject: Re: [PATCH v3 12/21] linux-user/aarch64: Implement
 PR_TAGGED_ADDR_ENABLE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the prctl bit that controls whether syscalls accept tagged
> addresses.  See Documentation/arm64/tagged-address-abi.rst in the
> linux kernel.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_syscall.h |  4 ++++
>  target/arm/cpu-param.h              |  3 +++
>  target/arm/cpu.h                    | 23 +++++++++++++++++++++++
>  linux-user/syscall.c                | 25 +++++++++++++++++++++++++
>  target/arm/cpu.c                    |  3 +++
>  5 files changed, 58 insertions(+)
>
> diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
> index 3194e6b009..820601dfcc 100644
> --- a/linux-user/aarch64/target_syscall.h
> +++ b/linux-user/aarch64/target_syscall.h
> @@ -30,4 +30,8 @@ struct target_pt_regs {
>  # define TARGET_PR_PAC_APDBKEY   (1 << 3)
>  # define TARGET_PR_PAC_APGAKEY   (1 << 4)
>
> +#define TARGET_PR_SET_TAGGED_ADDR_CTRL 55
> +#define TARGET_PR_GET_TAGGED_ADDR_CTRL 56
> +# define TARGET_PR_TAGGED_ADDR_ENABLE  (1UL << 0)

Stray extra space.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

