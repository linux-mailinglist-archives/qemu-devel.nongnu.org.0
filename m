Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324914FC2DF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 19:03:03 +0200 (CEST)
Received: from localhost ([::1]:53410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndxRO-0003gl-1M
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 13:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx8c-0000Qz-38
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:43:40 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:43994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx8Z-00022h-G3
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:43:37 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id t12so8011807ybt.10
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I1M5IfmsxMfPBWC7kMQ0VDwWxmnmVjAtSlUs71etqmI=;
 b=clgTQBlfIQz1L58kZcgxzE8Z67aWuyZqQQymbJzNIre9LsnmeMvbIDzufkFDZzI27c
 pnRDjGpFv4JFXviYSD/Ocra5e4QTKtua/lvxj/VymwOe/xeIxJb5zH8GD7GqFhLFh++6
 pFvAfpthGTHeJj3ffV1E4VJdihcnb61fFwiPQ3b2zyOW/UMXusVn5GvHC8vSOIQ1CNg0
 981ok3F+tA1q0Mt/uY9QWmdtwfMpRE+OOzrWEUgVcIXsCY3KAGqGddmoL/qJzNjxfOJQ
 EoW3n/j8HqAkrubfgriiJx+vxjVPCFaGM8QicW+C29rHTuxzCbUcGiwM0mqq3FlFYbV9
 gI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I1M5IfmsxMfPBWC7kMQ0VDwWxmnmVjAtSlUs71etqmI=;
 b=cF1HKngmdAKObG8RH0tC0OzmwNR53gSQ9n1B0el3KyFTYc10t6wupGdx/a8y+53Rth
 ILy13cf6yKfArWQxKW9Z8wkQW2K1vKdR1pdqoAekA/35qHXebzTB/IWcraS6j3OcAZx4
 1+KIGWQLi0oUTlXavFhUeuBY3uTDBQ3xvLNLYVByeAZJCeedRvglYw1eap5nGgapzT31
 4/gWSJMr9JKNBhq9NBhneRAMz75T8hydzgI0qWIrnpAygLY7PfjFE2yIlFoQEnmJxeon
 JhKEt07f4LgAjXqIbVi/AbQ4+84L5mqFqDK+RLlPiDFZvfm1d0PNqHDQrq3FS8xLjY4x
 k40Q==
X-Gm-Message-State: AOAM533xQTtJ8uHFbsqzHSPbofH99ke4LhmgLQAWghI03l5dxc+tvRtx
 5uFRAq6BJowbS7yhoIhvQToeRZWj+5+kOIL9ss/B6FAkHGA=
X-Google-Smtp-Source: ABdhPJyJuYty6bcnhVZT1+Pmv/YWd/3hMfO5owl6A1zzkC5laa1qlBXxbbTeQdspjXIvSGe9wJK4W/u3R8pPrdCx7sg=
X-Received: by 2002:a25:488:0:b0:641:1c71:b0ff with SMTP id
 130-20020a250488000000b006411c71b0ffmr8342842ybe.39.1649695414208; Mon, 11
 Apr 2022 09:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-5-richard.henderson@linaro.org>
In-Reply-To: <20220410055725.380246-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:43:23 +0100
Message-ID: <CAFEAcA_z4FVw=pcwcbxCxfU-WHOKtc_Ah_F49wseWziUghEEqA@mail.gmail.com>
Subject: Re: [PATCH 4/7] target/arm: Enable FEAT_CSV3 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 10 Apr 2022 at 07:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This extension concerns cache speculation, which TCG does
> not implement.  Thus we can trivially enable this feature.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c   | 1 +
>  target/arm/cpu_tcg.c | 1 +
>  2 files changed, 2 insertions(+)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

