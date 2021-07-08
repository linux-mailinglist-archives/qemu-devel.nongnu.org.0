Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EEB3BFA4D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:33:51 +0200 (CEST)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TDy-0007gk-HV
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1TAG-0004mV-FA
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:30:00 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1TAF-0000gJ-1z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:30:00 -0400
Received: by mail-ej1-x636.google.com with SMTP id c17so9251873ejk.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ciwxvaQr6XQMxA2tTBgoaibMxcEivHLvYU0sXDbeO0g=;
 b=W+AizkgVYudaZve/xEkSz9/YEVELLtZFUcJTZ5kMo5tBDKdlvFC1tOEM90ayvz0t1U
 d2cEYksrEgnOjFGvdeUbs7YR4wd40GE+nXOdDZXAYTomAUaZ6ltMhBmZuBWkg1MZvmse
 qLPgXTqQa01GqEuoTQLmm7EmWGr3Q3Amh+mM0I66d6YOI3arTYNvUKArzQMITCHTxGx1
 sKHlBxJOTQMQoh212Ivh1b01t5cRWXeGhRVg0SAfKbxLywDjHhmS0u2OiRWAAdsaKawG
 1uIVGZhSbnCNdiC15A8O3YAVSuuJBZbWDhM1RA8hCM3SR5g4T0dadDpe7RxD8huRGBWF
 YTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ciwxvaQr6XQMxA2tTBgoaibMxcEivHLvYU0sXDbeO0g=;
 b=lO2On4Q2e0Tq8jUkS9ccXM++GCwBdNO/9jQtoyBmC8k/Aa1+118HYYLhQA8fn5ogA4
 eN4c4CGM0v4QF/zsUW697pkSxZvY1hf/yKVJPRDqykkMZBuchI9qY4JMzGk2FV67JTPo
 lWLWLvfc5kDsgMdR3acc46Z0tKeBXRY4tWt5BeMTZVPOmZY37R/o5F1Nwr6pgotByYaJ
 YlTWGytRLV3TIJRLUpNJIHBly+vYCYEiInil3hntGuxjrDNJNNIH5a7N25J5V7jn5MCu
 PqXqZNFZLk13vH2Um1cAq/STNMHTaIZUOJ03TjIPnhO9iTJoZTQff0uOVAUOCjTAu8df
 S8vA==
X-Gm-Message-State: AOAM533gMGSYnthTViT6aWvojH0ayGlWbwsdEss0GXE55IeW9o6e7CRa
 XA5nxCL2Z4ZSzOvOsCdqWymlIo61IRm4bvYxfkL3CbSKH35Auw==
X-Google-Smtp-Source: ABdhPJy3NIWMIeCvmLWqUkwztkhgIO8y9VVRKoRVSeCuaur/XjMKhfinkINAsm7QQvsYldsXgnhVFXcrfTy/POXa/aw=
X-Received: by 2002:a17:907:9701:: with SMTP id
 jg1mr19466028ejc.56.1625747397399; 
 Thu, 08 Jul 2021 05:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-5-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:29:18 +0100
Message-ID: <CAFEAcA-6RkG6XKLpDn6gpCmws2-bECdmbdqGXE0By0P2EPUu8g@mail.gmail.com>
Subject: Re: [PATCH v2 04/28] target/alpha: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Wed, 30 Jun 2021 at 19:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/translate.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

