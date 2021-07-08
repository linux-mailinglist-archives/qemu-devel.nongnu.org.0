Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721263BF9F3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:19:32 +0200 (CEST)
Received: from localhost ([::1]:48768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1T07-0004Lb-Hk
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Sxp-00013t-0g
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:17:09 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:44938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Sxj-0006dE-RO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:17:08 -0400
Received: by mail-ed1-x536.google.com with SMTP id l24so8183836edr.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mhwm3350Fr2Y6nzAWSxKZMQLQak5RCP5NxXP7p5kGvY=;
 b=Y8JBUY64E6xkJF4ltWcdSGrdOUNkQ0HlxKu1OrbVQwrWkyoFECdasKhD4szkzXoO6p
 sYUo780Np6E3c9HRXKCD7PsgaZ0S7uzbRaQE4EVxUL/r+G8x+QKBZ7vaY4hmzgaMUQQa
 sVD4XBLCyhFsD9dz8MyArmGYeV37oXCBLbGVEo4wsAJ7aXf9RD+WNfjweZ6BvH/cBiQC
 N7vfkf8CaRrWOCdYZj/Srmue55BpmffeJ8qkKlupMrFX1Ijo8qFvCyk9XxD/GIHSvc9w
 mUiCEUxCBmDt+8eqllIbZfMT3SvackYv2Iqyx7k/tLzmVfRgsN6eAR1VooAL60r1gMgh
 Z3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mhwm3350Fr2Y6nzAWSxKZMQLQak5RCP5NxXP7p5kGvY=;
 b=RadBckQnW1X+hby/kMwdIDWQiNjfDQ0+Ua48U9e6jANBEWxIGD41/ay9N5o9KX3/Qy
 orjr5XUy6acIDx5teG+0Y/SRus5KnCtwcxv8Ju6q1BNGv1pZvyY+CO/0iEZN1seup9zo
 0LSS10h50DfRefZqArKHacSzfQxWHEf0RvQcGhRsmOoeORjjg20jX1UMmEkpViSAZshU
 JB8yvjdh+3JHF3zH2yRos7guUeMglKX7x0ymBhWDyp3Y6JPRM1rJ1gnq3ftZAw4ja60W
 EymRDRhrRaZNhCDtip9gH6z7aZ0GZRDUGvpmeXQNrL0qLWylF3lhiiTJKOH4VV8TT6FX
 2gOg==
X-Gm-Message-State: AOAM533umHlNHUq2NWlUCq91CJ5EYM5WitkFnbM0fLymIA6NGtbiDesu
 SHticaNsv3Pi8DKxL24IDmpg0+GuTb7o/vZW9Xs2CzYcvL3teQ==
X-Google-Smtp-Source: ABdhPJwVcmZ1g85hiCnBHMZIKKarZf8vjDH2iVUPOZEFffQp36UMgvLCGvqQp7hgbdB0O6PtCZFtYwhZ6pAEPTRAyso=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr13891484eds.204.1625746621982; 
 Thu, 08 Jul 2021 05:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-25-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:16:23 +0100
Message-ID: <CAFEAcA-oLmUkY7d_kSyGJbq6DKuwCi9tdPEB8=AtdJJkoBTAKw@mail.gmail.com>
Subject: Re: [PATCH v2 24/28] target/sh4: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 19:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sh4/translate.c | 11 +++--------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

