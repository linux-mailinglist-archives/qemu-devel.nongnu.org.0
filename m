Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B1137F5CA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:43:41 +0200 (CEST)
Received: from localhost ([::1]:35582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8oe-0003O3-2y
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8ZO-0006h7-NG
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:27:54 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8ZN-00088u-1J
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:27:54 -0400
Received: by mail-ej1-x629.google.com with SMTP id k10so7954210ejj.8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xzrtcq7wnMYDj6hxLpDwuIiZClkcWdkrtaOkeZoQmSo=;
 b=zy0xLuD43ofRgy0QXan8QBW+p7OI16J0HpxRAnNTsDnqeRy2wGXkUU0Si1pQVYvAKo
 1+FqLPoNfa8sgrI8Ppb8r7K1+JtGsj0wHI/Wy9pIrBK0QNew4WyzKVqXtqBzOdGHEuzK
 W3S1kXBXFj93+vAKXwRQ/yiNZYYlcGMxoXKFoFqUPHYOMUC9ZVCA8tbLe4yqmjgpR7M2
 /1/q2fCEjImJcwT3F+bX6Z74kiCZkzzx+hv2TYMsxycKGhhW4wCAnO3bmtyv1hLyVILj
 PWEfQvGUNFTaKgkHmIm5wpsI6flGfCs/d7z0+/m3qaHhpmW52SwPml4aqqD+//P6Em0k
 IZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xzrtcq7wnMYDj6hxLpDwuIiZClkcWdkrtaOkeZoQmSo=;
 b=nYvKSjgDGAalNqfiuvsiwg9/wx3jBJtX9eoJVuw2X8d49x9Nhtb4ga4KIeR8HWhj8U
 zrrm6alv78Z7IH/58ix/8gg49bB5MDyXcOZBT/CZEQ8nti+KlKOFKuYlkTJgEOf3x0zb
 jcg89XRrqoBPM19vD6ljbV/GpHVHX/2e1/kuFgfVP7qb8rbFG3fd5U4SVepnlmh55gDP
 yEQV9K3ho+aDz8eJR3tyhbLL125Hj25KQ2qt4nv2kSsiv+TA3afTIi44nO/FiljUnt4l
 ApPJ/fERGFodp7fdyRc64mwTgqvXddMrvA9FMZ11GZu8/ujIDCmyQrHmicYNcbC3FjgN
 zHVQ==
X-Gm-Message-State: AOAM5306A8q5RN6sWDk55wHCV/ZJEf0B73Fkd7MskSi8xyOQpf8CLRtU
 Dub4G/ArKGvzgx4E6PGiANmKoQRSOvETKZNWEAmgUg==
X-Google-Smtp-Source: ABdhPJw5q3GuDqyVWKxuBamFesBNlesWdsIT/y/dbtVzjo2PsK9O/JBK98gB+OvEdPXQ7HBL1uJk2ADSUeU4/s1nFlE=
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr13407300ejb.482.1620901671410; 
 Thu, 13 May 2021 03:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-44-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:27:40 +0100
Message-ID: <CAFEAcA9OfSucD_AF5AEN8jUvxCMXQPHW8SQJ8rHwApfCm2gwAQ@mail.gmail.com>
Subject: Re: [PATCH v6 43/82] target/arm: Implement SVE2 XAR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Fri, 30 Apr 2021 at 21:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In addition, use the same vector generator interface for AdvSIMD.
> This fixes a bug in which the AdvSIMD insn failed to clear the
> high bits of the SVE register.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

