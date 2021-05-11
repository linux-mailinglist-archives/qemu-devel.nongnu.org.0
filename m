Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A536D37A3B3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:30:46 +0200 (CEST)
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOiy-0008Hu-Fi
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgO0M-0005qu-1b
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:44:39 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgO0H-0001EW-Cu
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:44:37 -0400
Received: by mail-ed1-x52a.google.com with SMTP id g14so21925065edy.6
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+5yvXhbJtVqGWNybLiBSZ9WIxhPhjDKQ5VNXtWIJ33s=;
 b=ZCumT8YVoOgf4U0JxCjyNazyZ0TQu68njtq2xwNPzV8M7yIuCRCFWdQJIHng2590sJ
 V9cL3J6Hxc3pPZ0Zl4hmgNOOGDzSfxi7x7cP7UIcH7cjbUa4S9NY3SQwz/3Hd3t9ZuQZ
 dDwxlzU5WqLyqdhZ5xBpYwbEz8hY6rhTmBuD9BVdq52Z78qXQoYew03ocx60F9rtISGw
 KnaL0EAY9UXRN+ZI2O40rANSXRtQ7XXjzmTxNlSZ8q4wTinj18WfSylc1wJRwO3Nxpzm
 4a2OKo/tT1597vCAPmPp2XJExghIRr0SyMP/5baAxLQQJait/wNuF7yKL5fkVRMvN/Xj
 nXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+5yvXhbJtVqGWNybLiBSZ9WIxhPhjDKQ5VNXtWIJ33s=;
 b=a9ZbAC02SQ7vK1L8Pj4dzd4cZp0PaCgEgsWSAZ4YjPmk+6bohqRJeUcaAALODBfQny
 9UhRXywksCBz16SALosC78qlVzmhX2dhlrL60Bd0eDWB7TJjzdH6bsWOWgHiToESx53/
 eOpX5YFeOVl+1vht903lsjSVZsCThG7k44GqXVj2YyhM1ZR1zZl75ZoDIdxvfTUwjU9Z
 pc+n7/ezuCZd2e9+vlUeXi6RUeS1sil+HNxPzh+H9mOzRoixiXPUZeTWUMHs3DuQhGOP
 wmusGl2aieiYwHRVhAV9P3gdzoohk9RFlo0dn+2lQf1ql9I/cpNc6N6L9BWUXYPbUrjP
 3Mvg==
X-Gm-Message-State: AOAM5339h7r26qYSWKBWmfRj1Qt/7Y9PFW19zswvNyhjxgUOE5Ys4FaH
 W1PrGFSGB5d6bOfrpOymOG1cXy5FcK+cjda7YUhPmg==
X-Google-Smtp-Source: ABdhPJyFw1863GlvT7B4JITxxwyU+UklxFP7hcDO4QHCtg2R1muoNIU5zG5l5YJe7b0zFRzpAy9STN/o4oDF4LpXtJs=
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr34350563edx.52.1620722671863; 
 Tue, 11 May 2021 01:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-7-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 09:43:19 +0100
Message-ID: <CAFEAcA9Pv00takQH-2gJr27a58ivkcO8P+XowkziqDuf5BZKhQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/82] target/arm: Implement SVE2 saturating/rounding
 bitwise shift left (predicated)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Fri, 30 Apr 2021 at 21:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Shift values are always signed (laurent desnogues).
> ---
>  target/arm/helper-sve.h    | 54 ++++++++++++++++++++++++++
>  target/arm/sve.decode      | 17 +++++++++
>  target/arm/sve_helper.c    | 78 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 18 +++++++++
>  4 files changed, 167 insertions(+)
>  /* Note that vector data is stored in host-endian 64-bit chunks,
> @@ -561,6 +562,83 @@ DO_ZPZZ(sve2_uadalp_zpzz_h, uint16_t, H1_2, do_uadalp_h)
>  DO_ZPZZ(sve2_uadalp_zpzz_s, uint32_t, H1_4, do_uadalp_s)
>  DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
>
> +#define do_srshl_b(n, m)  do_sqrshl_bhs(n, m, 8, true, NULL)
> +#define do_srshl_h(n, m)  do_sqrshl_bhs(n, m, 16, true, NULL)
> +#define do_srshl_s(n, m)  do_sqrshl_bhs(n, m, 32, true, NULL)
> +#define do_srshl_d(n, m)  do_sqrshl_d(n, m, true, NULL)
> +
> +DO_ZPZZ(sve2_srshl_zpzz_b, int8_t, H1_2, do_srshl_b)
> +DO_ZPZZ(sve2_srshl_zpzz_h, int16_t, H1_2, do_srshl_h)
> +DO_ZPZZ(sve2_srshl_zpzz_s, int32_t, H1_4, do_srshl_s)
> +DO_ZPZZ_D(sve2_srshl_zpzz_d, int64_t, do_srshl_d)

Should the _b version really be using H1_2 ? Elsewhere the
b/h/s/d usage is H1/H1_2/H1_4/"".

Running whatever tests you have on a bigendian host would
probably be a good idea.

Similarly below.

> +
> +#define do_urshl_b(n, m)  do_uqrshl_bhs(n, (int8_t)m, 8, true, NULL)
> +#define do_urshl_h(n, m)  do_uqrshl_bhs(n, (int16_t)m, 16, true, NULL)
> +#define do_urshl_s(n, m)  do_uqrshl_bhs(n, m, 32, true, NULL)
> +#define do_urshl_d(n, m)  do_uqrshl_d(n, m, true, NULL)
> +
> +DO_ZPZZ(sve2_urshl_zpzz_b, uint8_t, H1_2, do_urshl_b)
> +DO_ZPZZ(sve2_urshl_zpzz_h, uint16_t, H1_2, do_urshl_h)
> +DO_ZPZZ(sve2_urshl_zpzz_s, uint32_t, H1_4, do_urshl_s)
> +DO_ZPZZ_D(sve2_urshl_zpzz_d, uint64_t, do_urshl_d)
> +
> +/* Unlike the NEON and AdvSIMD versions, there is no QC bit to set. */
> +#define do_sqshl_b(n, m) \
> +   ({ uint32_t discard; do_sqrshl_bhs(n, m, 8, false, &discard); })
> +#define do_sqshl_h(n, m) \
> +   ({ uint32_t discard; do_sqrshl_bhs(n, m, 16, false, &discard); })
> +#define do_sqshl_s(n, m) \
> +   ({ uint32_t discard; do_sqrshl_bhs(n, m, 32, false, &discard); })
> +#define do_sqshl_d(n, m) \
> +   ({ uint32_t discard; do_sqrshl_d(n, m, false, &discard); })

Why pass in &discard rather than just NULL ? (Similarly below.)

thanks
-- PMM

