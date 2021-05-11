Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F02B37AAC6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:34:30 +0200 (CEST)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUOz-0008HY-26
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUJ0-0001cm-Ou
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:28:18 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUIx-0005HN-LY
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:28:18 -0400
Received: by mail-ed1-x531.google.com with SMTP id j19so998297edr.12
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JQ0BWn84RGaHdcxv5AFPpzgujy+QwPh+goRgEMr16f8=;
 b=RT2nAFqPC9RY1JN2hny5fFkxpO6cliKaUji9lwU3xV0MAo7jKeNf3krD3FZKJCaxwz
 H1mId0gtpg7CkHZFUvTFk78hTah/50fkKv/hoxbouwaRtWhn9qJbJXB7g9SD7o9kbZHy
 8vvxy0RrmvQnVd1cBsTlZNOgFAg8w4k5dJzwfNHiwa3WJQEZsbpZQWRNzaF/YKqyhggQ
 GFKEG6cOXUzhdbK6OnYWzJOa7MrLP1fo1+G6Yk3tQRY2D7a9toRFrZDfWn1BY963UfOB
 CNC7vOOG/aSkdWhMhdKDO5eb6QYg1yrsr91Z+XPUcIdqx5z0KHyciQiE6FWjA+SPfOkZ
 0A3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JQ0BWn84RGaHdcxv5AFPpzgujy+QwPh+goRgEMr16f8=;
 b=Yq7/xQJV2tkgfXc9MOQ4lmaUAzgi3v7JqssOEJ+2MQRnkOt8rMxCt13Ff4DjknJXdM
 MJMP4iuXFBLu2rnBDaB/aZQZXdQYF2lebXMnmlKEDqKaC3bvXBi/aUS11pwCkP4MDGyR
 Kn2rWeFrgl/5z+iSOvvqKZD4nNmXVbdoQF4yM73YQC6NnKJpGGnW3L5kDa1js05SFJzX
 aGgNXQrMpE/Dz2muk5H/9B5oppB90scaRdsgmlUsaB0ZYJPB6rAQSg4UvJ5uDvPP3uZr
 oODHGYPFDaK5IjxU84y6nhN7xh5/81FQTJulaDoYV3HnopBiB+HOgUHZ9zJckojZ8CfN
 9r5Q==
X-Gm-Message-State: AOAM531FmpeokPV7jUI3QmwJUY+vCoQfQ+kV1HSFOjVaW1itmr1H1MUt
 V9GRx+IUi2hA4MvrgDLPItVcqeJHHGcFXcGD5WY0AQ==
X-Google-Smtp-Source: ABdhPJx/B+QAJK2bhClcpF1Kx7C1IFECcX0FViPWpUfDL8ogm9DjYv4jaWELsoFvLIa/8OBWz24QzLzf0B2LdsuY/AA=
X-Received: by 2002:a50:ab06:: with SMTP id s6mr28455809edc.100.1620746893784; 
 Tue, 11 May 2021 08:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-20-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 16:27:01 +0100
Message-ID: <CAFEAcA-+cMkkfORKqDp9vmBEvwYLVcqdYF9DK6M2de5WDy5bzQ@mail.gmail.com>
Subject: Re: [PATCH v6 19/82] target/arm: Implement SVE2 integer absolute
 difference and accumulate long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Fri, 30 Apr 2021 at 21:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix select offsetting and argument order (laurent desnogues).
> ---
>  target/arm/helper-sve.h    | 14 ++++++++++
>  target/arm/sve.decode      | 12 +++++++++
>  target/arm/sve_helper.c    | 23 ++++++++++++++++
>  target/arm/translate-sve.c | 55 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 104 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

