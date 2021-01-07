Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA312ED473
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:41:51 +0100 (CET)
Received: from localhost ([::1]:47688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxYMA-00088W-Nc
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxYLG-0007hY-7G
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:40:54 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxYLE-0004io-IH
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:40:53 -0500
Received: by mail-ed1-x52c.google.com with SMTP id dk8so8424935edb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ZolVs4qB2ef7LoIPC0NN7PtffFLjD20+DZtAcLSE00=;
 b=AhzyITYfIkR/zkIq2a6QcKxlzdor8FUDilF7t5Gi6Ay/dJ0V5lJtTAUeNiNZhoWHGP
 PiyG20+Xsa56zjNk8+Iv2q0wldToo7Wkfobk8NwITy8b5YnZR5ZwXQJVo9U+w1i1x/D0
 zcltPfz0a061GHcjzc2+ONqouxCtZEj0F5zyTwb+gfpINtTqPEXhs5VJIHD7MyNpbOtB
 yyALSimxVPMofrS3d2HyWHZKjPFwYZyns/ARiEeIPHVihl0eGulRRDdf5NQnWbYjc38n
 B32MOJTKyyHrh/2T/Cqum8wJfLjnHVHrcMM2h2dN+W1Lo7+Tj6DkA1o/P7BxxVj8BPC5
 RpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ZolVs4qB2ef7LoIPC0NN7PtffFLjD20+DZtAcLSE00=;
 b=MmF/UWPDwgTNu6andNMhKqq7ioDMuptVwa8FH+I8I9hsn55ejBNOD5MGaEa6UBw913
 neF6xU6W2S1r1W2SFlReDFVXkBJslit/1udrkwFRZ1A4B6yONTrTXHxuLDFoNJEHtO7l
 2Boa9c1tizXDZU1l1sDH8uaejAz7CQ8ehaDGWQJ4XtwAApi3aXTZqbdZVitfTypbj7Rh
 k4axJlEpZakCUDQdj/sfufgHAYTpN2mu0ld5YzSCkrYmLkBcWi8IE/u227+b9Zqd+t5T
 VTpA4YmKwu7n5MxLkWN7arvju5sPYywnZsF63NDdm8DikExneGl3uP+YXr4QjQ1n6wo7
 LKBg==
X-Gm-Message-State: AOAM5316D5IX0NipA1yv+8sUxMBTmsJAIWuzkL+8lU1lb8+yNviG+BpS
 C7YgEReIszOUEF8mBGGt5StO5ctNV+cyJJt2SgVfRw==
X-Google-Smtp-Source: ABdhPJyKc+5acdT76DjJaUm68VPgBHh4iAOEqrZL3u9WonoBcaMdM3vHvC6ocqdSU7WKwT3MWp9WPHjLmohUBgN4iJk=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr2224197edv.100.1610037650829; 
 Thu, 07 Jan 2021 08:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-16-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:40:39 +0000
Message-ID: <CAFEAcA8LyfUn_BZ-e17VtD=aK7N44t2vRkY=uqSO9W9VhBRC1w@mail.gmail.com>
Subject: Re: [PATCH v2 15/24] target/arm: Enforce alignment for VLDn/VSTn
 (multiple)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h          |  1 +
>  target/arm/translate.c          | 15 +++++++++++++++
>  target/arm/translate-neon.c.inc | 27 ++++++++++++++++++++++-----
>  3 files changed, 38 insertions(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

