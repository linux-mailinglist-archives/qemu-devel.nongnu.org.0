Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5670E68BFF8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:23:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2Op-0007EQ-Ti; Mon, 06 Feb 2023 09:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP2NX-0005jW-GU
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:22:03 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP2NS-0006UY-RZ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:21:53 -0500
Received: by mail-pf1-x42a.google.com with SMTP id bd15so8474342pfb.8
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sd14rTUiBsZlxxfi75qQEG0NCtQZBHRFgoSruOseJIs=;
 b=XlbnOOz700kul6SPydThmsgAlFmFiFPHtBYZstTF3H9zDZSQUXZu1D5zoYtlAVecg4
 oBzKSmhrhH33GrV7mOX/bV/EDO1Fnwi9hi9ZKl1d5aNT4X/O9cVrbsKHHVtn40iGy9VR
 zFXMWUM2eFPdy5Dj6cLf+45zR8o9LPU42bt63IC5AhhLlShKIDOJYatOrexYFR+f7xZT
 dbGnQI25BiNqyPJKApuMyChW1FfmnOxHcJYqFEG7wjJ1hR6oISPCdvB7+dNEYuvNKgD8
 mmArnDw6a89D+oECqAgZ45y+iWJPSc0QjmuQRdDZkGzUYsgXkueZiFLe/em2wtJnxQm6
 7Qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sd14rTUiBsZlxxfi75qQEG0NCtQZBHRFgoSruOseJIs=;
 b=iR8KKElICOc5prgJ2qH6XURqL9CSP2AMMMgNL3kZIh1ATKxEilI0+Nu/JJx4ae83Ew
 kFDp2TWVF7m2eAuixaHeBzGC3FhHfLoXdlzVZkknti19WKlzxnXLWai3vn6ywESX5+5r
 EL+4CZza361yNLwDa7Je3R0+fljX8/emCEm6ZkiYmawZhxKDvdGcBrhRbq0wgu7kvOzu
 yrlE5UVtdMmnEWMm050ij4YivEKmhcAhMA3FZKia0/Ur1IjEqqwDvbzgrFAdrPVGtxlR
 7ZaWN8j9hK53FJGtagCGJFj6aaAWAWE0VDaueLfz96wZjol9oOhDtzdbA82wmqvtfC59
 I2NQ==
X-Gm-Message-State: AO0yUKUqdDCKz7VqKTvW/XBJFibK6DFngSLabtfKPk+LGTbrlFOzzZMf
 D6FwOaWXo28vbBfAkigDli9rzJzJwzNSz/XD1f17Cw==
X-Google-Smtp-Source: AK7set8HHoScnTiIpF0ZUmRiTxPmWZGFfTGb08XsxyF0KF9lWsKwC+sLeckG+unB5Hd5TjbWs5nAnFVTXFOAYXIDSE8=
X-Received: by 2002:a63:6cd:0:b0:4db:3747:ff55 with SMTP id
 196-20020a6306cd000000b004db3747ff55mr3124942pgg.110.1675693309407; Mon, 06
 Feb 2023 06:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-9-farosas@suse.de>
In-Reply-To: <20230206140809.26028-9-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Feb 2023 14:21:38 +0000
Message-ID: <CAFEAcA83T5v0f0FkVh5k_91m1jkyYAybBYLSvYXrM3-J=NAz=A@mail.gmail.com>
Subject: Re: [PATCH 08/10] hw/arm: Select GICV3_TCG for sbsa-ref machine
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
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

On Mon, 6 Feb 2023 at 14:10, Fabiano Rosas <farosas@suse.de> wrote:
>
> This machine hardcodes the creation of the interrupt controller, so
> make sure the dependency is explicitly described in the Kconfig.
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 552e3d04ee..823f8b11f1 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -232,6 +232,7 @@ config SBSA_REF
>      select PL061 # GPIO
>      select USB_EHCI_SYSBUS
>      select WDT_SBSA
> +    select ARM_GICV3_TCG
>
>  config SABRELITE
>      bool
> --
> 2.35.3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

