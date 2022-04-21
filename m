Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4618750A8A4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:01:13 +0200 (CEST)
Received: from localhost ([::1]:55446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhc3E-000360-Av
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhbpp-0003WI-97
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:47:21 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:40484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhbpn-0006tA-Je
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:47:20 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id i20so10336555ybj.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HgBEukXG6xyc1fESvAsIqWBoomCczufsfPYxF1CPcQk=;
 b=CIq9JhQyiM3rvvv7Fp35r65bu9IjRCWbMqGXmgP6lnl2mBJfpX0oGfDSlxPwyzh8q9
 8+AhH2d46rq+NzT1RRlsfyPFWoQnL9R4aIKyNdMnVnDgC+ysfdcI+hGH8C3Xj7Ozd/Hx
 Nd+hwQMn0FX93zi7BmL3V082KigQhk+U39lrYAPQ97EI6a8u8y4ObHiFFIUwuCICTAHS
 iQN72uju6n1aXVHdZxwjzAkCz9P/PxYamyIkhJoxa4U3fHm06kBaU5tW2/ok0mbLgeNG
 w7sbrcbt/T1B2oqbEK9jyJOse1MTjgOLxoUUY+gPfFbZRxjRDH9Zgh5TeAcZxdfd0wqb
 3Arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HgBEukXG6xyc1fESvAsIqWBoomCczufsfPYxF1CPcQk=;
 b=BkychZMSzdAJq7Kc3O7Fkg4RugsborsVKOUZ03mTYUdhzcA47bziH44eFffWZdLehm
 jZePfwDB98WXE6Ax2dZhe+yDtnb8flgk+SlQbKWyTHyNS9vCcunThH6tPNFtfD6zeDpr
 GGkANpIgRGHP/7fdkOk6h9jCtps/PC9+JNhi1v4lkw8E4Z8DHheIKtnHVOxlV3dRLgC4
 //olQg1c3Zt3jYUnLhfzO5IT5jExXA8z+UZkGyWY931/7EsrUr/MujinUJS7443dwxzk
 4aJPbzOWkJfCu50u2l7fpjR2dAKnfSqaVoecGZ93Z0dglr4BWAVh56CmgT6PTP8BP+Fm
 HW3w==
X-Gm-Message-State: AOAM533LPnYfKJpKowCOsyx4KnkPPLWWvUxWWehdlgmoxl0izVE3N3IR
 ofCtgA1vsGSRHco5XvnGZN0t75SRDi/A8kL+358+VQ==
X-Google-Smtp-Source: ABdhPJwtqMMVOOQCeIjS2gk2g/2PrxPLbB99sgBKAH5uy8StdLoAmPFEK3xc5s89A29DftLUzPt9RvXWEN4FUgaj9yA=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr1135865ybg.140.1650566838491; Thu, 21
 Apr 2022 11:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-13-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 19:47:07 +0100
Message-ID: <CAFEAcA_WTPB-=rgELDx4fzim-RQgpd_M90D5-4eKs4ynUSXOXg@mail.gmail.com>
Subject: Re: [PATCH v3 12/60] target/arm: Split out gen_rebuild_hflags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Sun, 17 Apr 2022 at 18:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For aa32, the function has a parameter to use the new el.
> For aa64, that never happens.
> Use tcg_constant_i32 while we're at it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

