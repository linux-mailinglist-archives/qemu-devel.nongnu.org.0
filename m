Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745E637A17D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:15:44 +0200 (CEST)
Received: from localhost ([::1]:54688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNYN-0003EJ-E2
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNUY-0005yH-TM
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:11:46 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNUW-0007wD-H2
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:11:46 -0400
Received: by mail-ej1-x62c.google.com with SMTP id n2so28441156ejy.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EeUlf0JRq1sYHE3OCYgKn7toCRqjL1i2ly2KHpcSbws=;
 b=GmgAkX1E0H6n2I02w1IMQo/ZZcxRSHWhURFTy/dSqzAM6qQ4c8fqcrhKPg60xf6PVx
 6TfrfoRVzvlzEhkWvebN5Z0Qb0beeX4LOIXA6WT70Qnlile+9t3QYoBVdT0OFWufczy9
 5XvOmfBQIChafJh1yNWGtSisQMjUmBOf5Ju9eIh5mXWDCH10pW0aduilU1ZtRC1rXK0E
 xRAt6tEvpnc8atE9DdXaNQqhB+qHR0vc0zW4mgfRCDv7Ffj6gXw7svWbvcJVwIX8XFvR
 jmVU1Qot2Ar0z8ZbaDdopg95CqeHO8YcwktbEirMt0IX20G1GSkf1gP7rYVTxHGDM9Vk
 19GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EeUlf0JRq1sYHE3OCYgKn7toCRqjL1i2ly2KHpcSbws=;
 b=StZGIIP0u8u6vRiPlXQ9a+8WabIJfHmubEjDLPgeJD10IpF99ALGQdBWHTc04Lh35e
 hSeemJlnXzKgCGw3pYVs/Is3AImlXRrCUDN+QN0a7y1qEuJZg/mOetn5z1vFVBtlAzSI
 hdrvcd1GpO5s/8giLrNfy1ZC89axj2KcLopSi7GKjWokyeaNzSNsKOW3CY8m0V9igdIC
 dBUwlJRPf3dClWJELEARNkgrAs7KAAQeEhyQj6XWICmTRpj0+32PCxbjRJbZRJ1GDaa7
 oPYBlxJdg/YBZK8C8RamcJl6QSuJOSEeFXA5KhFeBBN9bKwXe8O45CstY7T135odvxli
 dKyw==
X-Gm-Message-State: AOAM530AmhXRl0xIfMgKm6nGlBpQePTHlbXtvN0UmGS25srk1UFfPo2E
 OeSf9eTFXnBZDzr8RQSf4g31/WS03m0VX4Z9Aa+a0Q==
X-Google-Smtp-Source: ABdhPJxNi2AdtEMBFQQFb6WfAyTtDZ540Hz3qdxwuBSVJ7hxcekOKAgqKXYPHEodmtyVALFVGxwfdTlAl80/MjP6lEc=
X-Received: by 2002:a17:906:254c:: with SMTP id j12mr12922ejb.4.1620720702929; 
 Tue, 11 May 2021 01:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-5-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 09:10:30 +0100
Message-ID: <CAFEAcA9YB1noev21vWDvW=MtTrZ8O=mpgyWLvvTQwNV8yoPYEg@mail.gmail.com>
Subject: Re: [PATCH v6 04/82] target/arm: Implement SVE2 integer unary
 operations (predicated)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix sqabs, sqneg (laurent desnogues)
> ---
>  target/arm/helper-sve.h    | 13 +++++++++++
>  target/arm/sve.decode      |  7 ++++++
>  target/arm/sve_helper.c    | 29 +++++++++++++++++++----
>  target/arm/translate-sve.c | 47 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 92 insertions(+), 4 deletions(-)

> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 42fe315485..bbab84e81d 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -535,8 +535,8 @@ static inline uint64_t do_sadalp_d(uint64_t n, uint64_t m)
>      return m + n1 + n2;
>  }
>
> -DO_ZPZZ(sve2_sadalp_zpzz_h, int16_t, H1_2, do_sadalp_h)
> -DO_ZPZZ(sve2_sadalp_zpzz_s, int32_t, H1_4, do_sadalp_s)
> +DO_ZPZZ(sve2_sadalp_zpzz_h, uint16_t, H1_2, do_sadalp_h)
> +DO_ZPZZ(sve2_sadalp_zpzz_s, uint32_t, H1_4, do_sadalp_s)
>  DO_ZPZZ_D(sve2_sadalp_zpzz_d, uint64_t, do_sadalp_d)
>
>  static inline uint16_t do_uadalp_h(uint16_t n, uint16_t m)
> @@ -557,8 +557,8 @@ static inline uint64_t do_uadalp_d(uint64_t n, uint64_t m)
>      return m + n1 + n2;
>  }
>
> -DO_ZPZZ(sve2_uadalp_zpzz_h, int16_t, H1_2, do_uadalp_h)
> -DO_ZPZZ(sve2_uadalp_zpzz_s, int32_t, H1_4, do_uadalp_s)
> +DO_ZPZZ(sve2_uadalp_zpzz_h, uint16_t, H1_2, do_uadalp_h)
> +DO_ZPZZ(sve2_uadalp_zpzz_s, uint32_t, H1_4, do_uadalp_s)
>  DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
>
>  #undef DO_ZPZZ

These two hunks seem like they should have been in the previous patch.

(Why do we want to use uint* for the sadalp version?)

Other than that:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

