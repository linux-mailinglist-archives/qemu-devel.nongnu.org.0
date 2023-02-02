Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40332687C9B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:46:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNY23-0003fQ-UE; Thu, 02 Feb 2023 06:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNY21-0003es-Gb
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:45:33 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNY1z-000778-2I
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:45:33 -0500
Received: by mail-pg1-x52c.google.com with SMTP id e10so1111617pgc.9
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k0aMObOWow29Reu+FMBdklIqzz/SDZfvpzgCk6sCugU=;
 b=rvvVs0BXu31xd6ZW6DE1/ewtc/KX6venFC9/bzbGxe5NeU9UMjAQoBbdCwilZE1Ufx
 PtD2+mBQvQ18iFYD+dSToKDFPpPkZdwk/abVcAzQ2lIDPf7WMT2ocAVW9zhldnHTp7Nf
 GRgocd2qBtdN9YsGX58rG0p1eNZK3Wzrw2RSF6eaGaO3JdzQjF1mWICSeyeNJzUX07sZ
 oL+3biLmSNDgW9/hasW67zmV3+XTdUEkrsffJ2ugslRWCcglAu6/qjKEQyo/a476HqHt
 42aW75bAaO48inVlQ1TR7yxurXy/jasOXrM3Wgj+tYINFStlSiwdw3HvtPEAFuCy+Lwe
 gHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k0aMObOWow29Reu+FMBdklIqzz/SDZfvpzgCk6sCugU=;
 b=Li0joYxDeiZX67uH4RgmDysvCQ/eFzKGGZcaj52O7nW3GDUYpBg5pUJn+4QjRi0L3K
 X30Wd3UaEyHhNOxI8iyNGCBgPK+CnFftsNviLc6r2Rmt0qYIpsvdB6lA2TjVfhpbVybd
 qBVksX44k0Z7Gq46JSDl4l/1mdjVRwGz/ZVLX5w60LC3ALD7tOdgvWPh7kq4SUCvB9pT
 /iKOb3ZRE34SwLwc8EbqpaJHXSBePyFO5r23W2s4ER8efN7exweNV/ePQsImSeAetkEu
 PLveK4jLomejPOCAN46UrL2ZBNlymqVozZcHOYwKOGynSG/C7HOE4FUtU1HtxyFTlp8N
 6g3A==
X-Gm-Message-State: AO0yUKWpIQAOs0p+F+syEk6ozvyYKg1H3xw046gEtvGruLoDk1gRZ5Ob
 m97gYvEPTMIQzqiH0Fj7YJsWxZ4FlGCvPhFM+4kMLw==
X-Google-Smtp-Source: AK7set80BalaUOUDrbUVsrqplgLFrXZpu+ErlGGajoM1aSbN9EMUINcJ8TuSepooOeq/7z1Eyp4U4eoxK1eQl+hA9Vs=
X-Received: by 2002:a63:ce03:0:b0:4cf:5317:8401 with SMTP id
 y3-20020a63ce03000000b004cf53178401mr955246pgf.120.1675338329359; Thu, 02 Feb
 2023 03:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20230124232059.4017615-1-richard.henderson@linaro.org>
In-Reply-To: <20230124232059.4017615-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 11:45:18 +0000
Message-ID: <CAFEAcA-YvxTgein_EQ6QDtqhKie6to0G9+5ZM7K3s0c2LSDivg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Use TYPE_ARM_SMMUV3
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 24 Jan 2023 at 23:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the macro instead of two explicit string literals.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 3 ++-
>  hw/arm/virt.c     | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

