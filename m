Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0073BFA03
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:24:53 +0200 (CEST)
Received: from localhost ([::1]:56958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1T5I-0001uC-Ch
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T2N-0007cb-Fk
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:21:51 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T2L-0007PG-WA
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:21:51 -0400
Received: by mail-ed1-x52c.google.com with SMTP id l2so8270177edt.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n7FkEkNsSCs/bKzc5NF7yIaBQa4ZkL0PNu7c8iwoKRI=;
 b=Z3qRSSk9BPZwh+kak4Ky/gEgRaTfcMp+relTiLPXsd2Y/iHjMtlhoCQ8SEhK+JOwpX
 AKXBIzDZd1lpi2x7Rw3huaSY8uImNXJadDcvfJyryWwgKI0QVAJB2YkoyllrilsPUVFM
 AxkBFudVc8zNqUEXJL/IuYF/Z2sJFDO5+CwtxbChKOiMuZup9z9dRJa2hEdEnoux6Lhe
 8n+VB7FPvanyNUM/TRtq9yyZY3EihGGSAESg6HrBRYuneAJnhq+GVr3DJWkUM50sJYps
 VwnyXqkfohTjqNTicccPCGL9PG123DD6aqoHlruC6CnfyRuJFw3tOek7gEGQm3K+6VdA
 MTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n7FkEkNsSCs/bKzc5NF7yIaBQa4ZkL0PNu7c8iwoKRI=;
 b=OtIP165E2pbP/emr6KBB28pQYcwx8WTSbr7gF/9VFeHxyCzT5YhdNrVg1ClCBabbKV
 Es8TpIE+C/ZJXBBt+GK1MVQPVGs8+4uQL0Q6HMLu7ObVi8hgr3Kb77YHIHwdEJfkN75x
 wA5FQC9Ixvrnx+MVgl1M00rV7tge3jp1dXPBr5SkMQ96GxxZO8YY8KM8mQkRcz6xrcyw
 FlFX16dkvXAv36Uz9cGuGQh+JMz+JrNiAD36uaZ5JNs9ic+0In/B2XPOICAgD+42rvRh
 m4vSXMAaEMbTW3SnRWhz+5GYm8gFP+jSYCJLZ1fUdmiPEqrfLWozKNAo3rpeZGqZadms
 uXHg==
X-Gm-Message-State: AOAM532qlAS+4Yyv5gspBrJAqLkdIW72oL0FnDEPpTWU3/Q/TiOVqms3
 48LURNSnDnJsxK9AzB0psqFUZSxkAWm5K0B32QkbDA==
X-Google-Smtp-Source: ABdhPJyGSlEgEyTb9Wj4+SSXpF2oiryP5YTTcWo1LeiCscVCm+7dVOShh9eC0QN9oAGXRCMV9PdH53c3oO4FIbri6pw=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr36934058edt.100.1625746908205; 
 Thu, 08 Jul 2021 05:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-15-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:21:09 +0100
Message-ID: <CAFEAcA84r1Mn5=3m=rkaGTHRjof-3_TrF4uNLpf2rHdp_0zD=A@mail.gmail.com>
Subject: Re: [PATCH v2 14/28] target/microblaze: Use translator_use_goto_tb
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 19:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Just use translator_use_goto_tb directly at the one call site,
> rather than maintaining a local wrapper.
>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/microblaze/translate.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

