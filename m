Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3CC66E3B8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:36:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHowY-0002A0-Vg; Tue, 17 Jan 2023 11:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHowN-00024j-02
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:36:03 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHowJ-0007ju-Uo
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:36:02 -0500
Received: by mail-pf1-x42b.google.com with SMTP id 127so6660365pfe.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dS/ggcPZBvQU5dbidRBE62qE4/4oYfJnjx1QRD/AKsw=;
 b=paSeG8m8smVdyz8rYQVf6ZwgMti2RqOkSWY/kJpb5kG+6s651LT0nJ3M3QGBCLHUT7
 uhTvvDGtMaYpI77huCSVhMNeAR18cw1jnPK2se9fLUDsODeiNycxOW2yzMESpPF+IA+7
 HOByeVoD5VeDVFrgjP37tcbmj1oXug72Uv07M7Cpe9SCM3V7u2ro3YTTaP9azMVSx428
 libdcumOyAvMgIrm2PyUHMip1bROfy0QVdBjEiJ33YjdYKKX5b+RHGLjlWGKMqrFtVkV
 bijlDUDUZLraRJbO/FSuVQkspO5MOAb0L1ro76ejpY3ykzbelw5XYBOZep3WnSjkDnbq
 J8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dS/ggcPZBvQU5dbidRBE62qE4/4oYfJnjx1QRD/AKsw=;
 b=QZwmKl1vjKwjGN7d82Bn+tbhPvOdk/9Bu0ZSRags8d770NRYL8NYU0+CTizci3kFmM
 4WnTFNHRR8MVXKNkfinz7fE1fPBsROTEOv99gBlS7UmBK3eVlHXO8pIRLvfI7+YjQ01C
 K0DE3gS8x5N9WWK1rgaCcDZlt09KZBL0PZ0nR13X4kQg+dq0E1RZWoGf3+cEFbpTXkP2
 k4rCjdhn0QuoQF1pnnGvOeS8HVsc3aotL+/SRvbVgdnpzHK09DnkpYzw5qKtl76LYs9D
 Sg1Ye3Pn/gbWa/uVYPM/OAq/lZth1Tz/d5JT2I86W9G4aYCHWA2DOID0ttuWHeaDsDF4
 k9BQ==
X-Gm-Message-State: AFqh2krsvZD14KghcYtA882m1W8ZfjejI9lox4gKE7mIySemu44kK8yb
 yXDWViP8gBUmHrzw7HC0tfIBGQ0cGoymkE+nagtuNDnhVKkAxQ==
X-Google-Smtp-Source: AMrXdXuoQJvGjLWOJa6Ob4NQKm/KvoZHeCtXNQC7cQXiwRwUwIiSQHTgXJPvHv1NuaiLDKaNbLmkQr/l6xK2id/FZ30=
X-Received: by 2002:a63:510f:0:b0:477:86c1:640f with SMTP id
 f15-20020a63510f000000b0047786c1640fmr300768pgb.231.1673973358375; Tue, 17
 Jan 2023 08:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20230114054605.2977022-1-richard.henderson@linaro.org>
In-Reply-To: <20230114054605.2977022-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 16:35:47 +0000
Message-ID: <CAFEAcA_SfJkVCR2Z2UFE7nW+SAOb-8mTQtnNT44tu-M_ugON_g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix in_debug path in S1_ptw_translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, idan.horowitz@gmail.com, qemu-arm@nongnu.org, 
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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

On Sat, 14 Jan 2023 at 05:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> During the conversion, the test against get_phys_addr_lpae got inverted,
> meaning that successful translations went to the 'failed' label.
>
> Cc: qemu-stable@nongnu.org
> Fixes: f3639a64f60 ("target/arm: Use softmmu tlbs for page table walking")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1417
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

