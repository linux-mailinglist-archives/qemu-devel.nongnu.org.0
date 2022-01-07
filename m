Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F81487A16
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 17:02:58 +0100 (CET)
Received: from localhost ([::1]:41758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5rhh-0000uc-T4
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 11:02:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5raT-0000gi-M1
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:55:29 -0500
Received: from [2a00:1450:4864:20::430] (port=38711
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5raS-0007Vv-6U
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:55:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id a5so7905946wrh.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 07:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jrx8XDZefQLWmHLLKbzHUif28LpXTEXVJs6kvhsvkrE=;
 b=a5cy8GLq6A/n914f0YS9rB/ZkW0ziJq/631bNyMhEApHpAnjA6XOmOhO71eP9otLLl
 oUdt1BaTe9O0G5kj/oWAiEf99RK8r6tpCUfk/UQPguZM5AYpJU8PP10pdTuu44g3sl8k
 AU3DYEGpFhqzA7haIF0Osf1ehrOqm4x0ELyOFTgdYbMzRaq7n/zxSSlHNzR1m9W/w6gW
 /9PykYX80tg4znb3QcUa83RFkM2OpAATySo0MJnti0jSuGkQTSHJPtJQ1v9S53ToG1eu
 WdXVcENBr04DWRgxyZvAQTXCxeFBmbXZkSYKm1Oklwrt/mZ6IUqnI3O9/9MZAqwmz2MX
 +zTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jrx8XDZefQLWmHLLKbzHUif28LpXTEXVJs6kvhsvkrE=;
 b=5LKCyr2F+nVfgY6BNIc4JcaZ7/SKRl3c+mI0jkLub9ZhtmGHzCOHsvqxMKVrDoH6/z
 xXRmoSPANTIz22fQeuWWa15mYDFflauskPn0RSNPbQt7fgay6KSFGJ5ucxnSTLqCccVo
 T04ZlRenRGXqF0nk4eVt9aUqa651cLo5mr+4dQRJAOOoqn9pZ6JDSXP5ZIuYqOK08Qqv
 sdnaH5oSUTHFPqjnkVYWf+CnWORC+c4kZErBMbipwjQQv31YLFau/q2BJqsdVYxHiSP+
 qrn8v+3q2Ni1Xoiq5beilqPA6Fj9KdGB1U4EwOlq7imhBQ4v5WugIwEeArcOk+DgSzkn
 SbYw==
X-Gm-Message-State: AOAM533QRtpmh+dtztLRKSne4V640jmuPLiYc7+37MKeul02SGW4giZT
 /5M1//5T4JmJoe5w1esLQgFzhuI4+22KM6ATTYuVEA==
X-Google-Smtp-Source: ABdhPJwwbj9QpZ+w8Ve6YzusAdXGoBuIL1UqWUKN8ipNTgqNYo2+N/YMgs9EMvyK81CHiG84IpnWMmwYGxGDdQxcKJE=
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr56930838wrx.2.1641570926512; 
 Fri, 07 Jan 2022 07:55:26 -0800 (PST)
MIME-Version: 1.0
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
 <20211214110354.21816-4-francisco.iglesias@xilinx.com>
In-Reply-To: <20211214110354.21816-4-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 15:55:15 +0000
Message-ID: <CAFEAcA--G02_ja5nDmjUtx5rAB0jNpr61sNWBGuqNFZq+TVwAA@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Dec 2021 at 11:04, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Connect Versal's PMC SLCR (system-level control registers) model.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-versal.c         | 71 +++++++++++++++++++++++++++++++++++++++++++-
>  include/hw/arm/xlnx-versal.h |  5 ++++
>  2 files changed, 75 insertions(+), 1 deletion(-)

> +static void versal_unimp_sd_emmc_sel(void *opaque, int n, int level)
> +{
> +    qemu_log_mask(LOG_UNIMP,
> +                  "Selecting between enabling SD mode or eMMC mode on "
> +                  "controller %d is not yet unimplemented\n", n);
> +}
> +
> +static void versal_unimp_qspi_ospi_mux_sel(void *opaque, int n, int level)
> +{
> +    qemu_log_mask(LOG_UNIMP,
> +                  "Selecting between enabling the QSPI or OSPI linear address "
> +                  "region is not yet unimplemented\n");
> +}
> +
> +static void versal_unimp_irq_parity_imr(void *opaque, int n, int level)
> +{
> +    qemu_log_mask(LOG_UNIMP,
> +                  "PMC SLCR parity interrupt behaviour "
> +                  "is not yet unimplemented\n");
> +}

These should all say "not yet implemented".

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

