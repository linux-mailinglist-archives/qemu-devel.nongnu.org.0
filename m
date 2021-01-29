Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FF73090A1
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 00:32:25 +0100 (CET)
Received: from localhost ([::1]:55458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5dFY-0002S4-Kj
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 18:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5dEK-0001wM-TM
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:31:08 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5dEH-000518-Oa
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:31:08 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hs11so15339673ejc.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 15:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JLzZaRGgfzSdDIIOYwDcLmzu39P2J/jQY5CBCulIm8w=;
 b=DleCkqEdhslzjus7OpkqP62ngxc/EAwa7FrF5JyiW2C0MMLAy3lsJ3YeEI5zYqHRsd
 c1y2BcUkkf0WdvjpYwMqCD7QkQ0YQpOV0Sr2aUVIjFaOI7WEDPbukG4ewEqPAOjN9N2+
 AGFBDxibNN2jhPP82k2OBzd14A6Z0VjpTv+j/f4r8snhXZU6JZupKtCawHTVXsW3x/O5
 4KHfj5YYQV6OBNTymDN2/mS1BSYpIFu8PdvxkrGswknI1Xqwv1nIhQsZ/NfvbYkLfLtR
 u70iaw1Jmr/soJ2qdUJEB2UgQipGgisJdaafA8E6IWRPW+mjwjaW74BWRaorvtDqrEJv
 CLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JLzZaRGgfzSdDIIOYwDcLmzu39P2J/jQY5CBCulIm8w=;
 b=firt+0v6pQU0NBQ3m1FfMIppsTfgQlgs1lfZ9NJkO6Zijr4H34IweYuPxQ6Tl4z85E
 +eniR8FxcQEz2HS8kx57K9IDSt/7htfWSZ6r+ljxmhLtppX/ZLwKFJ6wEScTdNYm+Bqw
 A8wnI17vB8SNlHB67z+9PvxEOBLPXAIkategN9Jaw5Sq3GPneAl59NEfdbFXXvtofjGf
 mHu0CiHwghw5W0/0SwP/zxk1VnwXyFaVAypg3ckoEh9XgEjF6ur4pg3hpQK/KDh22aDv
 h304770O8w60Vc2v1MvmbFSTBH0aO7N/tstCkgo6Etp93IirSEQw/Dbq5ecJPNuwbwfm
 rQBQ==
X-Gm-Message-State: AOAM533iMmBXS3dIZRzkGOojYily75nbGLVglLHi9M6OsXDL0feJJtgx
 SD8qkIgLpKFZ4AwAs1F45fltkADXJDmNIAOggTofOA==
X-Google-Smtp-Source: ABdhPJyQDOIK2ImMznzCgawSAbrPXgIDAs9gI/XzuH/WZfxxI3/g+JslMWV7W8c1B2aX3gwXehxntQvwKKmYUHeqPtc=
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr6743443ejv.4.1611963064173; 
 Fri, 29 Jan 2021 15:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20210129201028.787853-1-richard.henderson@linaro.org>
 <20210129201028.787853-24-richard.henderson@linaro.org>
In-Reply-To: <20210129201028.787853-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 23:30:53 +0000
Message-ID: <CAFEAcA80Qj8pU3TKCjD3KZzq5iM=epH7RsRKx2dDDw0w=0Riww@mail.gmail.com>
Subject: Re: [PATCH v3 23/24] tcg/tci: Split out constraint sets to
 tcg-target-con-set.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Fri, 29 Jan 2021 at 20:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This requires finishing the conversion to tcg_target_op_def.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target-con-set.h |  25 ++++
>  tcg/tci/tcg-target.h         |   2 +
>  tcg/tci/tcg-target.c.inc     | 279 +++++++++++++++++------------------
>  3 files changed, 161 insertions(+), 145 deletions(-)
>  create mode 100644 tcg/tci/tcg-target-con-set.h
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

