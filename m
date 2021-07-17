Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E0A3CC503
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:48:49 +0200 (CEST)
Received: from localhost ([::1]:36162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oQi-0001Nz-15
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oNo-00078U-Au
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:45:49 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oNm-0004aP-O7
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:45:48 -0400
Received: by mail-ej1-x630.google.com with SMTP id hd33so20377234ejc.9
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L16+VV3nqRdu4en3qqy1dyUNczx1kHxXOC7tFGUCxqM=;
 b=F8Ht2xX30W0o9u8fTQgo5s17Gpbn3SWD/lL7wLMDWJ7c8/xu8SmbF5LTQHUUS02M2t
 Po6c4sANsHG33oADXmHiRnafh8cBunzeyNWv5x9pJ8ovcQ+FnkmGVG5bpTYcM/srVafi
 /rsthzsUXNDbgiw0B5tZAT3b6YE4NG3ukm/8XbCIWMj9cwrwss7+Erg1/ZtfD9lc6NlO
 9afpL7L21qw7sLfwklPldVhH+wjEkrokflknqg4kPOvUJfdUEcfMcX/di88vNbHbCvWb
 zdb80ujyJDIaSup50jLszVB838tC0Gad1PPi8UTgqmMk7FLhXHawhwamCNL2xIDFXvUv
 LLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L16+VV3nqRdu4en3qqy1dyUNczx1kHxXOC7tFGUCxqM=;
 b=G/m67KizBcjOYUgVG4msaU7Qk7bnBA7UEd3ajB8f7dhfXSZSTrA8jn/+wdzEWn2amm
 3h3mNKBqd7yPTsykK0o0ASPNUKt/3LjzqSRv92FHCHqdi8Zp4DXR/emvkF/4ifOGBOGJ
 tHzNRwmlW0maqm1eLXU9pxkPipMgo2SEvp44iaRB7VADco3TkvNeCLdGvy2K0Sj2xaVs
 TNveWQXjRD+wk5MVFg72xzYv9YGaPJ0OYdlAV/7d0ptqJkHCRTbb9QnS/a9CJWhk0WxB
 ccTX1Xvf1ZNrl1F4xHKPGZqbipzpKmh+Jlwd6PeLoUrJXquFm2F0n4yOyLckg7bTQ66A
 Y5tw==
X-Gm-Message-State: AOAM532SyNRfkg4rTJroKCMyfTJmMqwamnumZXLYLvWz53tPfnM/Wa7h
 PNYLXRBDNmAxc6QziMNVYbS40G7s9otyha/eLEwXEQ==
X-Google-Smtp-Source: ABdhPJw56lzK2/rOdH6K1fWwptLhv1q3KmRgnuQag764d44Eov/h1Iq/uRnvv6coKT3xqqcLQoevVsszd3T1LsSutAI=
X-Received: by 2002:a17:906:382:: with SMTP id
 b2mr11776465eja.85.1626543944855; 
 Sat, 17 Jul 2021 10:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-8-richard.henderson@linaro.org>
In-Reply-To: <20210712154004.1410832-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 18:45:03 +0100
Message-ID: <CAFEAcA-iJFrbSD05+_cjn_Syz=41juJHY=RZUOi-9J+QobZ8Fw@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] accel/tcg: Move cflags lookup into tb_find
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 16:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will shortly require the guest pc for computing cflags,
> so move the choice just after cpu_get_tb_cpu_state.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

