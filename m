Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A92FBB6C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:41:41 +0100 (CET)
Received: from localhost ([::1]:48688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1t8W-0001Zc-2B
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1t3D-0004gI-8y
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:36:11 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:41990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1t3B-00053C-KK
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:36:11 -0500
Received: by mail-ed1-x52b.google.com with SMTP id g24so21972742edw.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MMTwjyRE77g6ml3FS++ktCrVNEwFdquuv/A1ZwGqJgQ=;
 b=WlORkPU2RZ6AI7qjPLRkuO4KhKKY0gkvyJmKojqsqpL2aViyDjYZDQYCSD4PrEot27
 IhlW+DRi/9B2kSpzwvqa1nfhf4WrHpJmLKtTwJ80zXoe6UmsPpwVdn4a0fjm1vB12g5B
 CzJY5fqP44qv2J87xBEisoq1tCqQVThMvqJU+9JwS99wyYY2svzzQyNU8pC3nFPjJ1aX
 6BoQuwjV+J9mvw6epdjDCKQKTEc5l7+1gb585c19tINqxELRcRrzzFZf4QZCZAfmGh8K
 6YeAM402xz9SEgJsRx7pYV25TykehTQXKJDo9vOVUZJKiwREwQeoUM9ATXjAr4VTzeVD
 6uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MMTwjyRE77g6ml3FS++ktCrVNEwFdquuv/A1ZwGqJgQ=;
 b=slQac4hXKRj+StiydSz//gPXZMfa8f2v/ckI4AGw7rTclJ9KTRRiVLjrPZWJ7FW8D/
 w/4yzzEvOT1w4kTWBJhXQ0u/qaMn0QuP8uPfxiFdNQFMsjW/eEN2aGV2tsqbI5nQ3B+7
 cFirgRchCroeOpRg8fs2/ULhnGLGcDeTneYEsZIO5LetUEMaFfWayFx7w5vsb1sA8a9Q
 hqg2uet8Pj3xfZp+6xD5/+4uxbaVZcV0wyKRMZPzSla+Z0xss1gD8fQJ4JyLidbRTFEO
 JEBGaLm5NNSbtiQkrqFs3ufThT6jtRELOV69gBUErSBg3PkDQC+6fhTjcqvqnGcD8QcM
 I3UQ==
X-Gm-Message-State: AOAM531aSoPeSH19s5ASil0z8fUgbx5Rm/LqAAiGBZdlX44+jDqC7yx/
 QYJGkRp7wAc98TeE9/TFXuiCXg+q9UgoCCsc39bD7vPfQDw=
X-Google-Smtp-Source: ABdhPJwhQgm7tFEYaJdgOcEwbNPnFImcZLA5wsqzCHoJbdIqp/bXCxD9FVWTpUy9duQAVhl+rx0ReyhWmSK1h0lI8uY=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr3845236eds.204.1611070568128; 
 Tue, 19 Jan 2021 07:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-17-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 15:35:56 +0000
Message-ID: <CAFEAcA9K=pq+kAZoEN5HfandM8Xn9u1YBOBobUGCE8iTM9ZicA@mail.gmail.com>
Subject: Re: [PATCH v2 16/22] tcg/mips: Split out constraint sets to
 tcg-target-con-set.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Fri, 15 Jan 2021 at 21:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target-con-set.h | 36 +++++++++++++
>  tcg/mips/tcg-target.h         |  1 +
>  tcg/mips/tcg-target.c.inc     | 96 +++++++++++------------------------
>  3 files changed, 66 insertions(+), 67 deletions(-)
>  create mode 100644 tcg/mips/tcg-target-con-set.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

