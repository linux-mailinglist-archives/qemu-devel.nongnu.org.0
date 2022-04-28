Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06A351326C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:24:37 +0200 (CEST)
Received: from localhost ([::1]:35702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2GC-0002Sx-Ut
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1bX-0002uQ-Nm
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:42:37 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:41962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1bV-00014x-D1
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:42:34 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id s30so8244996ybi.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9h0JKe+17DL2oO5lhVjoSfVMdhe5YBmi8iEzvwVXIGA=;
 b=go00VhFKGUJnSRdo6D2T6FinjQFhfm2ZHcthD0Z/0znIig5+ixKEXW3lhoYkzQlc+B
 +aaSeBtvPQo8hXwJ17hj/GkL+5w/aEYGspUbmT9H5KwgYV+dOgv8Mpufb97FSI2g+Xu1
 iNxUbFYHDiygNWLO7k6cPlvIjFnawF+Q/AsOfsSYx0clFePp5T8UgpYffJHQ9G/Glkuw
 Ud0mzeY79qio/I1HqqUACHQP9Ao9PGQ3TH/oNehShpkvEuoGmTOMY0cyhGjgg0534SLs
 lCHXcMLP3o5jSNauDrFsm2kAyK5tG/Lq0LA/UTr9xxZ4kPi/9gTGKXBTSV6UlCp2Em/H
 B2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9h0JKe+17DL2oO5lhVjoSfVMdhe5YBmi8iEzvwVXIGA=;
 b=oE0Oqy2j0U4K4yffEA53JzoJtXV3XqJDXb2L/ZN1xTFzxARd++3+idhi9nIHv8dycS
 wpseGxn1fziRs3BlQq7T2YzdAp5BMajE06dYeyEZRfVIIKfJf/jtWAG2h0Z+iSEpolJ2
 2h89GEuVGcOphMycY0EDyoQWztZ6FMlFNhtXBOsuGfmHIlPQcxDMfDHP+LFbzAwrxSj5
 R5Wg4v+77NVxbeGv4YVCiaZmrhfjZbZI/0IMel1O4KpI/TcnNUxkCQ8/uR62Vh3uspVd
 ehO9judlWhwIb6hOE057Alsd/jY/UuDruscpAsZB1GjxCloY7q1bL7mj1e2CROm3CX3d
 GBSw==
X-Gm-Message-State: AOAM530q3yfATRJjUB3SZF2Wi1snjM+JFLtPl1GPl1x9w03a9HmBsDtp
 Ey23lbvl9vZIosKWHw7RosfyrUDdGjft5xl6xmviuA==
X-Google-Smtp-Source: ABdhPJxgCW2A5XSmz86OrRrrvRbGEG6vqT8tdViIjmB5wwIa29YdbI4X8qghBmY1lYltCf5FAtfQp3RR9XlAxsLbtmQ=
X-Received: by 2002:a25:bb46:0:b0:648:4d25:4b40 with SMTP id
 b6-20020a25bb46000000b006484d254b40mr20063092ybk.479.1651142552019; Thu, 28
 Apr 2022 03:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-40-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:42:20 +0100
Message-ID: <CAFEAcA--TK2MHA_U19LCWBsX+ub1SN16GhTYBQT6PUXyzQCxCQ@mail.gmail.com>
Subject: Re: [PATCH 39/47] target/arm: Use tcg_constant in {incr,
 wrap}_last_active
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

