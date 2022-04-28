Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78C25131A4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:52:57 +0200 (CEST)
Received: from localhost ([::1]:58662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1lY-0008KC-VO
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0wa-0001wG-Rb
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:00:17 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:37541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0wZ-00020k-94
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:00:16 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id d12so8056298ybc.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mpy8DiKXqz43OiSDdKBT5eC7qrPJws6sI9POxOJD438=;
 b=t65ax9upElxo1J/egNd56iVCmTLKeYCPTdT3iIZUujhxHjiDXCHZsHxLZTm6GbPrjP
 7pkyMb4SewJma+qKb5Bkf/P51oY1iSbNBsNn1WuMltOfKAbdiNLvQW/ImX4d3dW35Iai
 4qyKz2ggMKupr+04klSWiS8zsnyu+ppkRbRhwWaMr4cfP7Js+c49IpDI20WxUxJhpHHX
 hCp+fZbI05rVw9dwWEmfd2KY8JhEq6b/gHEh+49FOgzE/gj0byHoCnW0qoeclQP4RyH2
 0tKJpHGtSY3aGS9D3rLqDQ4tkZDzpvP8QVtSS7PLAqw0Pseii2qB8N+1M9U3w3DHH45w
 qLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mpy8DiKXqz43OiSDdKBT5eC7qrPJws6sI9POxOJD438=;
 b=CF7V9owcPXCztwk/lmnl9zb/Ut6xqnmcjncJ32EVw2DHh7a/y8qB4OqrYtQ//DWADH
 tVxLeGzCx0DWPtr4lhgSqkfZpiXve3HtbR60sWpODhhrEWoGQXoVV1MkP642gpbsPspH
 g6rtivGlBfr7OPrLMF1qczeBOrogrtTM+8LRUR5nFoSn12DRP4PZ0+9PC0IxrO5Uadc3
 Qt1S4gI78Xemo0coaORy1PiW8Mm6lb9pq7HhKVTuColmxFZlASuZbazASMAbLFxue/jM
 tlQUHa+xcCQK3ig0iaZyhigQDx+csmMp5K3nYDK3itScZjufeFP3+fwZatVUtxyVbWn3
 Lujg==
X-Gm-Message-State: AOAM530HAYl4dEtOnGX44ImQkjad3i9w8SKUWYhuodMOwAiAQnNJN4IU
 vo0sSNgfgQXYo9yDK8DzheceAJrf6M9E4wqXvC3s+VRx/L4=
X-Google-Smtp-Source: ABdhPJw4dXaGRgaVQyEnv61BgJeksO7uGTF4xX84hxuqWuxiQdy/RVf6qCbRjQK/VTNAEobbPxqjh584YMAvK4h2Nxs=
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr29537789ybs.39.1651140014188; Thu, 28
 Apr 2022 03:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-15-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:00:03 +0100
Message-ID: <CAFEAcA-DVqBxeuSe4AUCZx+KJVaFHPs5hPc=RSQiqGE3qJt6bg@mail.gmail.com>
Subject: Re: [PATCH 14/47] target/arm: Use tcg_constant in disas_cond_select
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

On Tue, 26 Apr 2022 at 17:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

