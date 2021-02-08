Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B220313FA4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:54:15 +0100 (CET)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Cbu-0007gJ-EW
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96tT-0004Ln-Bh
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:48:06 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96tB-0007SJ-Gk
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:47:53 -0500
Received: by mail-ed1-x52c.google.com with SMTP id q2so18143223edi.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4fhfLpYOTxB/e5AgW1sQsAyU4PSjyxOuRnRu+oJ1l0=;
 b=dciXufr+Qc8ygz1gSPaxiAD57yBZLpVYeif5F5mTISucP/ih6HXRBuWHrClmMvFr29
 zR8eYV7hB166euDpKLACHKPJ5j7rKERdKqvDkZzJPHvVGb+8D53cxhm/cWCRxFbFSXt/
 sCCCENJ/Ofu3AkAt87zbVToxMvGkyuONBx+G6VFDL4pfc4Ixf3ykCvvChWDqjVkzE6Em
 SOOV1BYs8paVbRJQPp1f2+UWsVw0uuDCzPx5Ilkoawytb3wGLVlYjUyRXTMaVfw6xvRc
 JTF4Kw0k5EqAaXLN82JESMvqgU5UZYchnf2bUcjKB2mDjZxsl3Q89b+zz4geRvnvS/Qf
 JpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4fhfLpYOTxB/e5AgW1sQsAyU4PSjyxOuRnRu+oJ1l0=;
 b=coHbkHHR1Dh/pcPlzSXxol8PeXDVsESXJS9VquzWXUSLq11HLXM8JMtvtxjKGVetAb
 tJPip8kjUH9yAapwJMBC5q4bK7dzeHH+0AVrOOouke0xtQCNtXJaz4zFAKbMzJQlok8d
 vZqaYUxpfe8v/tVcJjrg9QLng2V0SBSV7bDgETRNKLidq2xPJhF8Nnmhmaw08oBrByIi
 AkfHmes9u60oZpXstjFoUWa2WpsdfvbAZSU/MsDkrQnWehmc95k/B80SxM+LOlVR1/Dn
 Ll7hQzTfb4KDGRVqDOo0E4j3YG9ef8YSMr0J7JD2AkrxPscqaMlwPRVR5PApTkrdyh81
 rCdw==
X-Gm-Message-State: AOAM532lI10/Opo7DNq+PdsVfjLHuCNlGRiyMtYjKhGFTxUxk6oCzl23
 BJ4k/1/nNVehnPAMdJA1EbXIf5LqSYCEPveW3Ntqcw==
X-Google-Smtp-Source: ABdhPJypaToXk8DUHNAilxbQzrFZ9mZ/uGNcoSQq+XywLCu4FKQRmAuC6Emu9poD52/yRg/Z5QHNjshyhVDkkRgKeT0=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr15658050ede.44.1612792055320; 
 Mon, 08 Feb 2021 05:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-15-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:47:24 +0000
Message-ID: <CAFEAcA9c-F2PDyGg=7e67KfNy=C8MagLngjTW-suuZxBHmGe9g@mail.gmail.com>
Subject: Re: [PATCH v5 14/31] linux-user: Use guest_range_valid in access_ok
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

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We're currently open-coding the range check in access_ok;
> use guest_range_valid when size != 0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/qemu.h | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 9fbc5edc4b..ba122a7903 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -493,12 +493,9 @@ extern unsigned long guest_stack_size;
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

