Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E074CA3E0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:35:42 +0100 (CET)
Received: from localhost ([::1]:38986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNGf-0002Zn-7z
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:35:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPMqm-0000ix-8K
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:08:58 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=42637
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPMqk-0001pW-4j
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:08:55 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id f5so2535643ybg.9
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 03:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aoaE2JNk7pDFmBahG5UX1vgTn40WfvyEsSed8FaQ2Jw=;
 b=MjacDy4TwOV0srnXkZlksZuiPf4FFj2Ng+mlspUsOs/pRfc9mEoDd8NqB27nlphEIR
 sWdKjMPgmTt7By+hfmsRH0wVnNxvImnea9EJMfGmoarQbBMt8eW5uUSKpbjY7Wzke7cn
 ijGOTrkDb+L9buLmmVwXNpxb1gFLLdZBFKmDcUnuIc8C84RqTiWY1CAIAfDCKavOAOok
 wIFk4KffD1+dSOQCGpO8N+DTepbHJK7N+VAOdMRHm0Ezdggl5XYPbLY/7TQl7eUA829l
 UzojkXvy/pk17BgxLgG47dF1XN+mAQtZWRYWVcdogE8ghAjV8IDAAgFvwG9whbhhmbnl
 P2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aoaE2JNk7pDFmBahG5UX1vgTn40WfvyEsSed8FaQ2Jw=;
 b=S/aaDj/m9tCoUVRmS5I2S4ly/y7iOzwgf5PoGgDfWkRSvRbJ6JM0+evBNh8Ekmwupb
 h9LEowRVoZ0M8ZMPdF2NrSl/5GAAV9iydEGyILaSYlXfP5CCnXYd6TusR/xW5/J3pEAU
 FwQy2ddK7+G5mBa9kp31UKLAJn0KYTHsUBUQ+jfg5zdLDaAstlXgYyZDqMhUco1Gf1X1
 pR2rG4pu3u0j6RRRIH5RA+zcNfvr+joVXRAnLDvUOgvnmuc/fP/+8IMCplLik3GqNwtm
 JJmOzFner9HQa3troAb0NMjLyKSyoiP7oQF5FEuvVjvy5Liz2zop5ZaX/e8xyPGbdMVL
 2bHw==
X-Gm-Message-State: AOAM532r43WJ/sEsO+aBvlCA9mQOCuyu51/thknuyCXy3yBbzoxotI5P
 ASS1wHYvM4yChPSo6pCYkP4AVPPyzb5wLRnAhPRAXg==
X-Google-Smtp-Source: ABdhPJwl25Ctm7tC6lL7bAu5zZRNcU27s8Gxcy4c1aaLou7CDXc6v2/t+ZExyPAu3/F9skzLmxkWCmKsGsWYe0n8/TI=
X-Received: by 2002:a25:9c08:0:b0:628:a472:30f4 with SMTP id
 c8-20020a259c08000000b00628a47230f4mr1273088ybo.67.1646219332910; Wed, 02 Mar
 2022 03:08:52 -0800 (PST)
MIME-Version: 1.0
References: <20220301215958.157011-1-richard.henderson@linaro.org>
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 11:08:41 +0000
Message-ID: <CAFEAcA8E49vV9bGxMMXM=NBSCm0R1toUptrvt4=v2rM69u9o7w@mail.gmail.com>
Subject: Re: [PATCH v4 00/18] target/arm: Implement LVA, LPA, LPA2 features
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Mar 2022 at 22:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v4:
>   * Add cpu property for lpa2.
>   * Disable that property for -machine virt-6.2 and previous.
>
> Changes for v3:
>   * Update emulation.rst.
>   * Split out separate update to ID_AA64MMFR0.
>   * Hack for avocado.
>

I've applied patches 1-16 to target-arm.next now, since they're
all already reviewed. 17 and 18 are still on my list to review
so we should be able to get those in (ie actually enable LPA2)
for this release.

thanks
-- PMM

