Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB880309084
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 00:18:58 +0100 (CET)
Received: from localhost ([::1]:44070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5d2W-0004ug-Oa
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 18:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5d01-0002fo-Qb
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:16:22 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5czz-0000IU-SA
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:16:21 -0500
Received: by mail-ej1-x632.google.com with SMTP id gx5so15266745ejb.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 15:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MCP95q+3TnGZ9ymvpcL4waERtxGvUQ3JEcawuH2wSgg=;
 b=rhV+EvFM0Baqv35hB/mV7gKZGytHjxBvWgz1LQEgPkDYs1cl+Abeh2QqgXnNlh5Tx+
 dpaOzvgovR2LCQXYfaon5zUNROz7W9ZBF2mim0tjbDpvucND9Eh9X/pxnyoTHp9Q73Ou
 UxP4q2aaJJvxS1s5hb6ksNLlQsa3omuRNotf5I86jyzDv6ZBTtk0SCJ/YejZG8CLENzd
 tNimVmlcv0QjdnNSlgWP1KCHeafs5wn1mOkkIz5cdxqv0ZK+k26opQJ44tuIuJeKyDKA
 x78/o3Cl2b9s8znO00uB+aCUqlo06ULw1TKtGvJmUkLwhTHXbEkiP7VqlPSSX8b5pfUP
 /Dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MCP95q+3TnGZ9ymvpcL4waERtxGvUQ3JEcawuH2wSgg=;
 b=dawLeuLS3TMcv0RBxd/zUYCyGahn2/SFgjlgAFzX22GU8J4E7ZNmfTLGE6SZtH67UP
 NMDwKX1dywmkoitAyr1BR39YUJN8V4BpaDDvX1Ibyy1gQw9MvMUZxhiPjUN2JwWvMtjO
 q32NKbJKlAJKe0hS63SUcRG73c1H+cASNqtmj0AXd1KRmpzW5zGXGEjkuGdr/AuEqTUb
 /DD9VOwXM18KuoV4DFBloJD7hPWbIvChTobd7TgPsjlpWCGteTha4rybNv+y0HwUdbrV
 S3MC5CmQw1I6EjNaclhgDhmqAu7kYJsaOr9+Liji9oMBNHBr8S6D5lLIRm6P3w4Gbcc3
 1Nnw==
X-Gm-Message-State: AOAM532s3Fe5nBgVUE/lLZw/9B08asHD+mBIaDyXsYBDZRGRRWUOq32X
 vUKmxxIthxPF84oVUPKLU3tff1Ca9dsxxDbpWkigVw==
X-Google-Smtp-Source: ABdhPJwC9PdhP7nUahtEWPRTyYREEX0jZ9Vk8VE8UfNDX1RVlTFoE3mFuytMU71U0F6hFGUWDA1KssjmHRXcnmX5aAA=
X-Received: by 2002:a17:906:4002:: with SMTP id
 v2mr6821253ejj.85.1611962176951; 
 Fri, 29 Jan 2021 15:16:16 -0800 (PST)
MIME-Version: 1.0
References: <20210129201028.787853-1-richard.henderson@linaro.org>
 <20210129201028.787853-3-richard.henderson@linaro.org>
In-Reply-To: <20210129201028.787853-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 23:16:06 +0000
Message-ID: <CAFEAcA-Ez=3Xv5jVei1E3noa20D17_Uz_HFOmXK5Ek_p0_dwkA@mail.gmail.com>
Subject: Re: [PATCH v3 02/24] tcg/tci: Remove TCG_TARGET_HAS_* ifdefs
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Fri, 29 Jan 2021 at 20:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The opcodes always exist, regardless of whether or not they
> are enabled.  Remove the unnecessary ifdefs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 82 ----------------------------------------
>  1 file changed, 82 deletions(-)
>
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index 9c45f5f88f..b62e14d5ce 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -71,70 +71,42 @@ static const TCGTargetOpDef tcg_target_op_defs[] = {
>      { INDEX_op_add_i32, { R, RI, RI } },
>      { INDEX_op_sub_i32, { R, RI, RI } },
>      { INDEX_op_mul_i32, { R, RI, RI } },
> -#if TCG_TARGET_HAS_div_i32
>      { INDEX_op_div_i32, { R, R, R } },
>      { INDEX_op_divu_i32, { R, R, R } },
>      { INDEX_op_rem_i32, { R, R, R } },
>      { INDEX_op_remu_i32, { R, R, R } },
> -#elif TCG_TARGET_HAS_div2_i32
> -    { INDEX_op_div2_i32, { R, R, "0", "1", R } },
> -    { INDEX_op_divu2_i32, { R, R, "0", "1", R } },
> -#endif

> -#if TCG_TARGET_HAS_div_i64
>      { INDEX_op_div_i64, { R, R, R } },
>      { INDEX_op_divu_i64, { R, R, R } },
>      { INDEX_op_rem_i64, { R, R, R } },
>      { INDEX_op_remu_i64, { R, R, R } },
> -#elif TCG_TARGET_HAS_div2_i64
> -    { INDEX_op_div2_i64, { R, R, "0", "1", R } },
> -    { INDEX_op_divu2_i64, { R, R, "0", "1", R } },
> -#endif

Why are div2/divu2 special cases such that their entries
get deleted rather than unconditionally included ?

thanks
-- PMM

