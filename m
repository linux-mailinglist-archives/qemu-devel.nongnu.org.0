Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CF22ED5D7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:43:02 +0100 (CET)
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZJN-0007q3-Mf
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:43:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZDa-0002LW-DN
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:37:05 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZDW-0002Gm-Tx
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:37:01 -0500
Received: by mail-ed1-x533.google.com with SMTP id dk8so8606844edb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iaEUFd0+EBKn5/NAWb4IN3dyUhMVYNiu8c9XpxIk8f0=;
 b=IEgG+U8v4AHNRyAPXlqsp5xiibHWWeISKH13HcsdjAtpr62QE90wLjcRyku9i7rDJV
 eb8GOdUf4W9niKVe+MbQOvWG7y2VtgzLxs6Aos0KUPX6DOZFMB5DZPD3zdIy0GWtHCG0
 1y2eXBOrCaCmBQuLoRSqRy+S8MlFQQ/0YsA4/hUsWrHBUCLq4uhAq+f9F7eNKYrHIb3H
 WJ1yVaXzSffByJi/0tiRelZJoszUqRluxMLIbqOWTgP9RJjSAYtV7RvWhUiSGgnSYRvu
 T8GDCeo6j4pjzuijNiEvl8TFfOpz9SO9s2+arE7JeJFN4D9iEdr3X4cGyathRMotPXnP
 mHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iaEUFd0+EBKn5/NAWb4IN3dyUhMVYNiu8c9XpxIk8f0=;
 b=nb80QDYq/aDEqvuYNs4PHaKPmTdOri/giya89HnisBDsH2NIkEh3Y6IHLaPIJI4APZ
 H2US3dZxMrO9gKm1zTw51TxuUNplgZh3O5FY1JNty+JkuWR3ge+dnizFyohRMNVrdomd
 da31cnjPxgmFDac5HbMcEEVRZ0J3AV1TC8sWo54YhILC9CKibuThE2DDcIvS9UWPJdJy
 oizazJDJ+C6AHgtc0VnRMBzJNW038v3esOv4+Sqo23m1WPwCM38THRjmLeX9oCfT8cCt
 N1j7pzOYdHH2d0tlLcvANbYAzTal7TtrkA+bCaLnDc1pBt1ZnuOPSbjGsHHsEDl5g4ho
 naDQ==
X-Gm-Message-State: AOAM531Zb02sFwvRH9+klYdHAmZw+VuyzxCJtVGBNGxRATiwNyrefBNk
 vxG/imM/p4kNh1ehdECAMSEqxEDx1RsX2IsFZWUaqg==
X-Google-Smtp-Source: ABdhPJwp7ZmKyN/bvHY0dA+PLdU/D0Y8OHhceI1xujp8vb7bRRPz0U+b0A45OZbQG79+u1yc1l896VeQQ7MdzCIJ3Ic=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr2414928edr.251.1610041017370; 
 Thu, 07 Jan 2021 09:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-23-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:36:46 +0000
Message-ID: <CAFEAcA-_idiGLjvUCUvqC4h=K5Y1hQL9Ugrcq0kG32HY0NQHLw@mail.gmail.com>
Subject: Re: [PATCH v2 22/24] target/arm: Enforce alignment for aa64 vector
 LDn/STn (single)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 18:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

