Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB94B37AB24
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:51:59 +0200 (CEST)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUfv-0002LF-0m
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUdZ-0000wk-Qn
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:49:35 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUdW-0007YL-Oo
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:49:33 -0400
Received: by mail-ed1-x52a.google.com with SMTP id di13so23464256edb.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DanP7Wy3DBLPlLRi4fOdK9IbdsewSL5BAjfz+4QSoW0=;
 b=LZuCF2IxTxM6K24z8EIQxrBBvD1yYt+2bHoikBgxtS6BMbeTfWmMmKhvmw4IIw2UgY
 rIapE0q+30PhASDNxNgntfVhbOuk4MklupAQ3lQsxJWHisJBXnEcXmypRJDPAO9WAPSN
 jIBTQY5R7P5dvf1+UkQ2DQa38biEBxzAFvpz6uv/+rwz4qZ93h8KDET4twJXlYDcwwMJ
 0W82mD1g8lCUwQGu3bnEN+kC1E4b9fssFQ6RfMWyoUdNDXhX9FmTRkAIbjtMyx0hVP90
 ddIZP326IDd/UpYe8DzLlHykX6y4eLUj/lXeNtHLBrqW2moPHB7Gk5RSPxfuVTGnEd+3
 DUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DanP7Wy3DBLPlLRi4fOdK9IbdsewSL5BAjfz+4QSoW0=;
 b=VfDRcTse/g7DgiXSngxa4j1Mogbuk4ar5g8ZwvKtjUbvvaVpz1XXAblHjAcYvkdveo
 p30hmf95O+BIj1vph/FrZNRmtDjMAeR2xfL7B/YbtaqNRVR3rICSO78cOTHxLSXjs9bd
 X+vhhIOehuiekVIyr4HpZJqnr6RTO6nX7sXxT9z1SZCEop/TRf97fqSbeDzJW9mP1itl
 u+BQqCORZyY7BVl5+BJCW5KVhgAWFi8l0xSQFCjlRMtPsI853nWo80aB3MP+SMF3Ef3e
 P1o977FHlF8Bj0YjKMuL3caJxUTK3CXnI1nezbnM6XITaj2xHNyT0RRm37dTIKu9ECbF
 Vdhw==
X-Gm-Message-State: AOAM531TKYYM+mWTybrBKxJCEdRyYUbiuVYs3hFXsCnLU1pigElivDXM
 nzVXepYl6lO8FDG1hugdDvPusvsbXEU88RyCyTz/3g==
X-Google-Smtp-Source: ABdhPJy6T8hKO9MrlxfYNV4FWvy4RnqJU54M2GpEGq3vmkuZJ6DjWMR8hXJFYIJ8JO46LTH3I+2D1CwjhRMnlnQ5vTU=
X-Received: by 2002:a05:6402:1d8f:: with SMTP id
 dk15mr34791122edb.146.1620748168947; 
 Tue, 11 May 2021 08:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-21-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 16:48:16 +0100
Message-ID: <CAFEAcA8HcFG2D+1xncTLyQk_67bh91uvAacbm_MHC6fe3z_2+A@mail.gmail.com>
Subject: Re: [PATCH v6 20/82] target/arm: Implement SVE2 integer add/subtract
 long with carry
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

On Fri, 30 Apr 2021 at 21:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix sel indexing and argument order (laurent desnogues).
> ---
>  target/arm/helper-sve.h    |  3 +++
>  target/arm/sve.decode      |  6 ++++++
>  target/arm/sve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 23 +++++++++++++++++++++++
>  4 files changed, 66 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

