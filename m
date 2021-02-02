Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04CC30BD4D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:42:08 +0100 (CET)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6u4N-0005Ri-5H
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6u2J-0004PS-Ce
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:39:59 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6u2H-0003FB-EX
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:39:58 -0500
Received: by mail-ej1-x630.google.com with SMTP id jj19so1740824ejc.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 03:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J1gMHfjh9hU54RASq2J68fBTn/Px5+qIYgit7RlS7xQ=;
 b=hYmDg6TMVzJOPj43EPSDdCv7fg7tXmkikPqj0g4vz+dLOmu+3tEwI1Qyk8hyXvJhU3
 735FAltTISSRRN9sZBfsL+c7GSWunEo22aKxIex0ccOZxOUK5jik8M4Mvctpp49bb/jf
 NzMxQhmONOmPbkNVS1lflHdpslCEceSsQRnf8bD4Ux74IGZP41O2TpugZTLWsP9BbRgT
 GdhIoB5f8g4sd/QMxBYUSHK4S+ZHLqgwFwyBrkaaxi2tUMuNMJsIIK62zqpPSLiXSBMH
 a1ZAXDP19sgGSu3yqUxSHd1xX4s6a7dJ7rb7vXdBNIHS5FkT2oPFe5qA1fD3Igv04Euy
 jKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J1gMHfjh9hU54RASq2J68fBTn/Px5+qIYgit7RlS7xQ=;
 b=GsK3IJibop/a2sACqqcTxZETsW5ScyGmWpx0mKGAV4p1w3GVBgjHFPuXViY3fbOGKb
 M/38pBw2xkR6wzz+eMAoncsRfzc32ay2focqnAUx+hSjgmoEAx739gry/v21CvMzSFOi
 L58xzqMETi6c6mbmWbb5QqIvBr6kekQ4EZn5kdcVBffoISOY1uSz0RH4OGwmppzqNTF7
 are3rpYLPYFcZlIjAuwrSyoE+T9Ajyo6di/eDH+WRSm4AiJF6M+m0k4gqDK1S0YH6ziq
 zKSCalhkwF0zEv5D15IwPEEvZG20FZ91FWFK4lEfVWebx3ycvh1eZH/z1HPui9QTzod2
 4Mjg==
X-Gm-Message-State: AOAM532+Ak1II+MB5S2WCxuh7WTk10KnuJTvkMTWcboorg4nz4Sc+OKg
 6WverwRAC/WmyTi5h6jRUoVGn1YX4FxtMWdQHfJUxw==
X-Google-Smtp-Source: ABdhPJzerEFtSV88lt4fPHUGS2Cj747nAcVOTA4/eOuhZC72IVuzJNc0BFTl2XuoM+lxhyaVZrFGw9vqS++yc7lPAJE=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr1417364ejh.85.1612265995655; 
 Tue, 02 Feb 2021 03:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 11:39:43 +0000
Message-ID: <CAFEAcA9sDSre3k7YGgwzFBCc22sg2FOuBqVwekQx=fLiFvcevg@mail.gmail.com>
Subject: Re: [PATCH v9 00/10] hw/ssi: imx_spi: Fix various bugs in the imx_spi
 model
To: Bin Meng <bmeng.cn@gmail.com>
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 13:23, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Starting from v8, the series is based on the following 2 versions:
>
> - v5 series sent from Bin
>   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=223919
> - v7 series sent from Philippe
>   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=224612
>
> This series fixes a bunch of bugs in current implementation of the imx
> spi controller, including the following issues:
>
> - remove imx_spi_update_irq() in imx_spi_reset()
> - chip select signal was not lower down when spi controller is disabled
> - round up the tx burst length to be multiple of 8
> - transfer incorrect data when the burst length is larger than 32 bit
> - spi controller tx and rx fifo endianness is incorrect
> - remove pointless variable (s->burst_length) initialization (Philippe)
> - rework imx_spi_reset() to keep CONREG register value (Philippe)
> - rework imx_spi_read() to handle block disabled (Philippe)
> - rework imx_spi_write() to handle block disabled (Philippe)
>
> Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
> (interrupt mode).

Applied to target-arm.next, thanks.

-- PMM

