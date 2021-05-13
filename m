Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912D537F995
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:20:05 +0200 (CEST)
Received: from localhost ([::1]:47632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhCC4-00014g-MO
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhCAU-0007D0-5e
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:18:26 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhCAS-0003by-Iv
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:18:25 -0400
Received: by mail-ed1-x533.google.com with SMTP id df21so3932059edb.3
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 07:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OOc4gL5uPk2ACAGFRhazVHQWnGubWnzLQye6pT02Va8=;
 b=mG+XAW5luxYONw2lp91tJweKPN4uoNLYnfLQoZKQcuMrNF8Dvk5GdnnNNAWUU9vaoc
 scQ9sYexNiHvb9JLbjjGgDZpbk/dBYJQqOcu9+kAgEBhe20iP16f6QpA23OrBJuMrIfN
 D2q2HQ++V/r/kdYs+345ko35HuooZ/+O+qfSdYNtp55s1dPJJogGjB220SS0V0WJ2HaE
 LqrBG+6bLHNghFYQILma7ag1hyMEkYwymIE6Ry8SrmTjNmqO1J8HxoCxBNPgb/qyVINi
 AVfyjEpFNE3Rt+HDWKv+WlJKhsmaugpxpyxzoz027zVRD6tCKSg1JRwiTdcSqwga6fjB
 XijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OOc4gL5uPk2ACAGFRhazVHQWnGubWnzLQye6pT02Va8=;
 b=BZis1+Dmmh4weeTSUPXIJX356YrCtPDsNm7qq2NEe/i8kMtIxnXR6wdpck6EQC8/UH
 0Dnb2OZuv0o87rxwvlk68F+EuJHtCs8KBBIMHcK9kIYsgtHUxr/GNy11oRIj0RHhjk+8
 Bzz5eWhk3b+Vq7rYxLqrugM5oizpl74/ezLBOEKPWdVx3QLDlhRK5+YY01gea+AcQdkL
 XVw/H8T26Ok2Ae95yHRNyLLMUgRvER7wyOc1ZS6nhQSKY86vs4Zw09yKMx2tGZaZV600
 vS5st7gtJahSlDa4cOJuvOb4SNUKO4G0Uhn6MroPEC1ytaivTXaHTEnksX6D/ZZel2io
 3LrA==
X-Gm-Message-State: AOAM533RTjRzAAfs2IS42GiPc/FOd6QN3IRhWSrPHfM+KoCw2l74nT5k
 AaatBTzTcV2b6TH6ZvhQNWNd5LJGJV/0SwOfM8MpXA==
X-Google-Smtp-Source: ABdhPJxaPmbKaYE9OyYY4UroRMYxuZPuoYkpBXAZLVEEQ0LYD0wgGgtEXIoy4/YvYGlnSioeZGsav5cYZYVT4aJy/oc=
X-Received: by 2002:a50:ab06:: with SMTP id s6mr41834238edc.100.1620915502772; 
 Thu, 13 May 2021 07:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-69-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-69-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 15:18:11 +0100
Message-ID: <CAFEAcA-T_LwSMZJbPszdS3CobzNAjJWY1gptsgZQT6bhxLKkaA@mail.gmail.com>
Subject: Re: [PATCH v6 68/82] target/arm: Implement SVE2 FLOGB
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200430191405.21641-1-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fixed esz index and c++ comments
> v3: Fixed denormal arithmetic and raise invalid.

> +static int64_t do_float64_logb_as_int(float64 a, float_status *s)
> +{
> +    if (float64_is_normal(a)) {
> +        return extract64(a, 52, 11) - 1023;
> +    } else if (float64_is_infinity(a)) {
> +        return INT64_MAX;
> +    } else if (float64_is_any_nan(a) || float64_is_zero(a)) {
> +        float_raise(float_flag_invalid, s);
> +        return INT64_MIN;
> +    } else {
> +        /* denormal (see above) */
> +        return -1023 + 12 - clz64(extract64(a, 0, 52));
> +    }
> +}

These don't look like they're handling denormal inputs quite right:
 * should raise the input-denormal exception
 * should flush-to-zero if that is enabled

thanks
-- PMM

