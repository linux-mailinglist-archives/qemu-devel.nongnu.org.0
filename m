Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB3548ACC7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 12:39:50 +0100 (CET)
Received: from localhost ([::1]:55460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7FVF-0001UB-6Z
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 06:39:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FOY-0006QF-PF
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:32:54 -0500
Received: from [2a00:1450:4864:20::430] (port=37660
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FOX-0006Dk-D5
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:32:54 -0500
Received: by mail-wr1-x430.google.com with SMTP id t28so25612432wrb.4
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 03:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSkTLgpVd5cOdRMOTFZxl0YF0lWKXfKD0vN6bzRtwLc=;
 b=tG2bzfLRTLfE5oGh3nSqwsQ2rwkTJL+tYEqKBRJ1oDhK/LV9HInBPDw30c4xNzjfsC
 fESsQFC4NQuoUIkfFOJyEbqc73H40xy0e7OUjpG17j8iIf1W5j1mSWQ5lAbZza4Ij2EE
 ZRtb165SI3TiR+rfCI5+kIy9Ft30QyM3cLoBuUlEOvXv5bIrayFcAvjMi6BTEsBT075d
 6W+1W35PtqqGllk8XOCiF6EsrqHhmcg2HlLkKOZKAFXmyo+Og78EjDsjNx3QGQH79rZB
 q+QB/LF5G3vXH+2iN5oTjl6tbfuy9MBXMTlUGUyHPEsPF7iEVv/q4uXPp/32T2Wxy7Ku
 ma9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSkTLgpVd5cOdRMOTFZxl0YF0lWKXfKD0vN6bzRtwLc=;
 b=u85eBGV48rQbqEN4qnzXTrWYvr7N1WyTKKlrnS2JVng1sfQSF/w8kk6vIfLPcbTySU
 GOcgF0rhbN+onJBIkyVrx6R8acoA3BeBZ8gr0Xz16PhVRLKdRCeQoE3TbYBKY+S4Hwk3
 4gcD0NffXyeDx74+RJhtKLUVuYBbHzcaSoM8QPt/vzYwMOZL/Xim8eRNbpIq+Hvzaqpn
 Pi5V04G5VCxgyN63ogeMBEXJhoCP24CrKHL+SIcgYtxlBrgifGN0XaTGEl28neoMf/Ne
 D1qRY4Kh5Grlf/R7k8Lui3XLOBDc9LmRJw5w9N8oJdWWd+lYC6tAtdQx+Aeongbd+f51
 LwQA==
X-Gm-Message-State: AOAM532m2uO2y600UchN5fhLOKcNybYDy2Lv99ktdh+gH75qDi4FGBnv
 GHRx1SX/revdI0CjbvxzG+EfwCNv0YR66Es3+i5EPw==
X-Google-Smtp-Source: ABdhPJyw4WEMNQ8GTwZHhu4JPn+hUQUEsOMZoj+LEXemtaMLV7ADn53zO85oItbdjVq1PIXopLH6knZtaFd5AW1MKV4=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr3625729wrw.2.1641900771949;
 Tue, 11 Jan 2022 03:32:51 -0800 (PST)
MIME-Version: 1.0
References: <20220108063313.477784-1-richard.henderson@linaro.org>
 <20220108063313.477784-5-richard.henderson@linaro.org>
In-Reply-To: <20220108063313.477784-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 11:32:41 +0000
Message-ID: <CAFEAcA8nt3yYV-hfssJxWsBWxYUm79UDDVrGxzxd7xoW6d0n9A@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] tcg/arm: Check alignment for ldrd and strd
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Jan 2022 at 06:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will shortly allow the use of unaligned memory accesses,
> and these require proper alignment.  Use get_alignment_bits
> to verify and remove USING_SOFTMMU.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
>
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index ea8b90e6e2..8a20224dd1 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -35,12 +35,6 @@ bool use_neon_instructions;
>  #endif
>
>  /* ??? Ought to think about changing CONFIG_SOFTMMU to always defined.  */
> -#ifdef CONFIG_SOFTMMU
> -# define USING_SOFTMMU 1
> -#else
> -# define USING_SOFTMMU 0
> -#endif

Removing this ifdef leaves the CONFIG_SOFTMMU ??? comment without
anything it refers to. The perennial question of whether we should
have a linux-user with softmmu isn't very arm-specific, so I
would just delete the ??? comment too.

Anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

