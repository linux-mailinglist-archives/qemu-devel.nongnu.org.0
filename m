Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EC9307777
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:53:53 +0100 (CET)
Received: from localhost ([::1]:44274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57k8-0004xJ-Mg
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57hW-0003kv-JU
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:51:10 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57hT-0007Qb-JH
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:51:10 -0500
Received: by mail-ed1-x52b.google.com with SMTP id d2so6703409edz.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 05:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GkzRAklb6idVbi4Nlegxw7IMnF2hkEvmjlxBgJ+vS9I=;
 b=zOpHgG6b9hGoscoCcOgh+sv2L2h5StT8MpGQ3HKnRZWSjVgVGfafsctn2g49oBKlfE
 le9G3l2iEuJUk7eOvwiHSKY+E0Bd15Vehux92Q+aFzZVXBra1yLiaoqqGP07MPwX2bPx
 iCNn2HqCtsuh+Ye6/XpzYQv7kXm2A62dyiGByukXpW50u0E66vXxla3GMKg9XWBPHK2O
 8ju7hr2Ik2bjDwrJsWNeVSCPdsADCcimHDGW305CBOxdcpwlKkCt0o9bdlf08QKZjWMc
 wqr9XJeKB0vM3nOeLE/N+1RgmA23sC9MBHWtaOlk2OP386ecP8Us3KL/8YLiEpRtx40i
 UyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GkzRAklb6idVbi4Nlegxw7IMnF2hkEvmjlxBgJ+vS9I=;
 b=EZUPgwnttjBLoKz9odXVMt6VCmJtwZPSnSlE6FpindN6Xmqt2A787Q2dkNwb0jI8ag
 Mja0XCNf8ShbL+wrT92egckPy3fNhEEK1JhcM2bNf1uCcA/LTo7FzEs+PRVLiRcjvrfP
 Y+6csK7ASb1AWmzS5RSl2CNsHMcyC1C+cE9D8uLGM71jLtXG8+9SbHBoZ9I+tdIHH0gz
 0qLoFQB1NY64EwrcFK4+MyRW1hBowmofxmTUyrJsydLKJY0TTXf6Vo23yK/JsLmqys5B
 1L9twiOOrWi0CHVACpDI+CaXncyOX9p3jrUeFCXx5K2xXXOduKxYatAMXYxjjs4OgZlz
 siLw==
X-Gm-Message-State: AOAM532oGFdnX7y+qC95ZUimJ+15Ytt3BUybrINaLRjqPXvKJPwOEWDL
 qEymCnZxwg21SPKr7M4n98D5V3K0A+iZSqtGiAvCFA==
X-Google-Smtp-Source: ABdhPJzRnKj4ag9vupbO6FcqHAfLAUfybK1GcRHprF1uv0p5hkz1uXkubvM9+eDU9eMF4+EKRvtCnqUyhoVbIqDq/b4=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr13929369edb.44.1611841864194; 
 Thu, 28 Jan 2021 05:51:04 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-9-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611063546-20278-9-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:50:52 +0000
Message-ID: <CAFEAcA-UHKxqfmWm21qigrH1jvgkdprH3TY8AUW2HGJKTV50sg@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] hw/ssi: imx_spi: Round up the burst length to be
 multiple of 8
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Current implementation of the imx spi controller expects the burst
> length to be multiple of 8, which is the most common use case.
>
> In case the burst length is not what we expect, log it to give user
> a chance to notice it, and round it up to be multiple of 8.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

> @@ -128,7 +128,20 @@ static uint8_t imx_spi_selected_channel(IMXSPIState *s)
>
>  static uint32_t imx_spi_burst_length(IMXSPIState *s)
>  {
> -    return EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
> +    uint32_t burst;
> +
> +    burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
> +    if (burst % 8) {
> +        qemu_log_mask(LOG_UNIMP,
> +                      "[%s]%s: burst length (%d) not multiple of 8!\n",
> +                      TYPE_IMX_SPI, __func__, burst);
> +        burst = ROUND_UP(burst, 8);
> +        qemu_log_mask(LOG_UNIMP,
> +                      "[%s]%s: burst length rounded up to %d; this may not work.\n",
> +                      TYPE_IMX_SPI, __func__, burst);

It's friendlier to the user to do the LOG_UNIMP when the
unsupported CONREG value is written, rather than here
where it is used. That way the warning happens once, rather
than every time the device transmits data.

Also, you could squash the warning down into one line, something
like:
   "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n"
rather than logging twice.

thanks
-- PMM

