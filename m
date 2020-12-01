Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB442CA534
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 15:11:26 +0100 (CET)
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk6NI-0003j4-5n
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 09:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk6M9-000360-Fs
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:10:13 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:35071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk6M6-00049r-5R
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:10:13 -0500
Received: by mail-ej1-x642.google.com with SMTP id f23so4409329ejk.2
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 06:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2hDTG7eH2YALna29gS24auN6LcZA51ioUvnvzX8r81Q=;
 b=glIa8q0LaM7pBZJesYfNjhj5rcRfSnokhgBJB9Od9ZNuN1ZIn/PURuvC1sVcvSJ6Js
 2OMHWGiUOwHrfWm1hZ+mFTdJxGBs5rCFt517htU3nvjVnuVlMnFpLJ9io+JEfWUsHYRZ
 MjFKmmIXRfBV2CGxUV07M8AKdFSInBSsb2WxGzvT7qSrVPvAyG1sDgrdV0UhfUiB6wq/
 +c5nahN4xSH8XrM7AHi18mKpCRbUtS3ro2S8AlXsjRJea1jXFwUcEfaWoknicGLVnzFE
 q5VK4pQ6pbKV95MlN8hMe4zsJZolcO+9RX5OTii/9P1ROmh/JkYpWaYYo4k3/ai+5v2K
 Lwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2hDTG7eH2YALna29gS24auN6LcZA51ioUvnvzX8r81Q=;
 b=lHzSxR93wLY0eLm6wJyYy5AAK3crI1rbdWV+wJdCQSJ3d0RBm6zU35bBymdk8/QIMU
 TH4C4fDMs8IaBqAwa16podF+513ZLu/GHSnmmhw5MUwS9ZsOU8xHLbhM22R5Ef2SThnh
 RZIERrkiO1xr1Ym+9Pi/gS0FfKUZasjXljIQ0mLk2qinsqT68fs72Kc7E9H5oKeHoAH5
 PqvrBr7BUhsGc/Vi3upVDaLMZybqOw2jzk19EXsx7okNI8T47khTzFNj7qfUdzls8z+V
 9QLLnljN3QHvQ8jB5lRp+Dv03A/XqfsUVNTfE2OOtNRrWRgti6KGioDJQNTLZaoO3wGs
 UyMA==
X-Gm-Message-State: AOAM5321FaitOuiXsnRmKk7CdWF03128g+tWn91uxcvsZBpneJQNK0o0
 YuR7S9AEmfRDiR71i008HMj23TYJoYfSGyBRTib/3g==
X-Google-Smtp-Source: ABdhPJzm5AdBXfuGHdoiPVrfDlxFmfRJuLrq2w9jdjLVNKpwsaV5jhWsrCPHhQbFMzKk/9Dr/y8zBaRFI5luQL/LdDw=
X-Received: by 2002:a17:906:4bc6:: with SMTP id x6mr3294956ejv.4.1606831808587; 
 Tue, 01 Dec 2020 06:10:08 -0800 (PST)
MIME-Version: 1.0
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <20201125040642.2339476-11-richard.henderson@linaro.org>
In-Reply-To: <20201125040642.2339476-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 14:09:57 +0000
Message-ID: <CAFEAcA9mC3XmOgNyxQuJh_LbK94wbvWYNUz9NkBDk0EjXKgTOA@mail.gmail.com>
Subject: Re: [PATCH 10/11] target/arm: Fix decode of align in VLDST_single
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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

On Wed, 25 Nov 2020 at 04:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The encoding of size = 2 and size = 3 had the incorrect decode
> for align, overlapping the stride field.  This error was hidden
> by what should have been unnecessary masking in translate.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/neon-ls.decode       | 4 ++--
>  target/arm/translate-neon.c.inc | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

