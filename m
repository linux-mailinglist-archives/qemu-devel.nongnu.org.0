Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F97A52D06D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 12:27:42 +0200 (CEST)
Received: from localhost ([::1]:47328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrdNT-0008DG-1L
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 06:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrdJZ-0006qz-Kf
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:23:29 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:41513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrdJY-00073n-0V
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:23:29 -0400
Received: by mail-yb1-xb30.google.com with SMTP id x2so7900721ybi.8
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 03:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6+mQg6Km9PCaVsSY0lD6r2PzVkIRrRIKWAQbDxYhNXw=;
 b=dx4gqTqm+x/JlMdflvLvuaFVWdnqNRDBJ5Z4E1RhKsJDG083QQs3NnGXlUknAil/Cu
 hJA5mYSniltM0EjrDQRAlbGH7SQcVjCSWoDqur0o3awmWbP9yJCgzYtf2B3ffl2T67Wy
 0/zqvsMEstQetU7mAy70J4mVB0DGWfqPPbkSVWt16mc6MIJIFp+/ELMOPUhvUdttcxwV
 e0gIL57PftKckJs7WoEeQfWcYqyWskj+GYz3PGRpsee6lDB9sPNI4EVeICLZay3M2B3e
 Pa5ptjLL9EUswKxE078OdLbXhCx3E5854oleh97L9ZDAkBKfTIp+z8I7CegdhClQgqtq
 30NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6+mQg6Km9PCaVsSY0lD6r2PzVkIRrRIKWAQbDxYhNXw=;
 b=WSAmRVZTkltjoFrUy7dpD55jFsRplxeTwaP+XT+P9WWeZJQ4Eh+Q//342FYyCb3Xaa
 0ET/DoiNU/sbegvt0mXoDTgXBOulndGaMRtvtyeFg77Op2KSwj+dKxqFaaQTsbaKYHMp
 /qU6Jx59vtDCLzH6uQVZp2IopVnLuse/dLqjji13rJef9qK03TbT5yaXMCjuH52dIpeQ
 lj1vWUxydxHGjlpETyyzQZWfbU70qYUGSY6TN8atMbkymf/HyoNWmvZqQTy3MvMRqXef
 oRpxSGwVGFfbn75zgoBf+X0YNGGo6/SnpCoZ+/p/eHa+eRe93K2o/TXn0v6cR0Qtte97
 9W4A==
X-Gm-Message-State: AOAM532lZi2TrQ2XxwwxCGc/YrSAXBay/Brb5kj1Yb8l2S5svNHiypj6
 YzyKEQFosz1nGB4iVPYx+DOctWuiva2m3cLf0b+C1Rcz3SI=
X-Google-Smtp-Source: ABdhPJwtg2t/u69ILwpNbqPfGEsKWyM7nvRS8WLjvKVEzUYsD0mTHIrTBMpHTMIO2AxTY5QpuUsDC4XoeF+pgiGiP2w=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr3677564ybq.67.1652955806743; Thu, 19 May
 2022 03:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220517145242.1215271-1-florian.lugou@provenrun.com>
In-Reply-To: <20220517145242.1215271-1-florian.lugou@provenrun.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 11:23:15 +0100
Message-ID: <CAFEAcA86yCAsdGroBUn6ncphnCZNTbznp2LRygMb1mtmOMO8LQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix PAuth keys access checks for disabled SEL2
To: Florian Lugou <florian.lugou@provenrun.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 May 2022 at 15:53, Florian Lugou <florian.lugou@provenrun.com> wrote:
>
> As per the description of the HCR_EL2.APK field in the ARMv8 ARM,
> Pointer Authentication keys accesses should only be trapped to Secure
> EL2 if it is enabled.
>
> Signed-off-by: Florian Lugou <florian.lugou@provenrun.com>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

