Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E223FF0BE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:08:33 +0200 (CEST)
Received: from localhost ([::1]:37520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpGR-0005Li-VM
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLp7F-0007U5-3Q
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:59:01 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLp7D-0002li-H4
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:59:00 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso1838741wmb.2
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y+RUG+AZkfiFzsk0lc+8ExcS8P695yTR1lHSIzv9YGE=;
 b=CNVAqGZE1PtiEMH0FUANMS8dErlANSoSu4f+N49jmbiFAijjxHfNfB55WWpj9gGL3q
 xL66I+AbZ3F6za3IzDjN9HRIWrFCZQTQJly/aUyRp8irtJVgjw9toL4QGcbGjCQgZaix
 7K8GFGtcNHmd63nW5R7z3uN+5mAhlIF5udhm/QRJFDITAfBVMb3a+gRDKYJGKUsJTwIG
 rY+sWTqQ0RwuSgEzFQlPkarFQx6CO/OHLKTP3y0BHl4NbeTT0SHd6ilD59KNzJFobw7F
 6qIoCvvXLuCLeJv5rW4yGfHmzp1gIFjwD6iiKsZ/B+CP5lLiWHv6w/mDPlgjU20iCq/Z
 EE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y+RUG+AZkfiFzsk0lc+8ExcS8P695yTR1lHSIzv9YGE=;
 b=T5CgtFm+sOwnenshSaGJSDRhQ3z5Tz5yvRKENSI+XFLvbahPEyjh/Zab73mJwXUqXf
 zIwhTIvQy9s9annWTyxvR5AntCLpsV5x07RYfimKxzOw9UohzAJLKr5l0WrsBcQ3ippE
 mGW7J8tR9cv3KFyNv24tpdQg3MOWn39w/2YeRnS4um/Jt1g0FdvpwLzUQ4Eg540iSf/U
 sOgEipNy+AE56AG/z7sU0mSfNoOwDh2emCsggV8aRG425HGtzNUdj0iJk7eU7wwUtCY6
 rkgL3pJW8aldqDfeboHpQK99M5eXg5A4Ez0kSh2YhEsXxaSY4YkMfT0tlNJbIJfwrsBI
 DFkw==
X-Gm-Message-State: AOAM530yi+nBdfMGKPaw8Qyf9gFiKOuz5qGPqB4mmmgu9V4qBX7OQWpT
 tb2BRKwhrgaf38BaUc8jPdBPrIjer7JJiND1NQnS0A==
X-Google-Smtp-Source: ABdhPJxK1QCeVUIE0QLPbMEj0mpOgErvb9IzSVRMwv92OnAQRzbEyJBP3cVQp5dqft3dl98SUjOd+e25+S3NhW75Pj8=
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr3861640wmj.126.1630598338040; 
 Thu, 02 Sep 2021 08:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210808013406.223506-1-linux@roeck-us.net>
In-Reply-To: <20210808013406.223506-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 16:58:09 +0100
Message-ID: <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 8 Aug 2021 at 02:34, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The control register does not really have a means to deselect
> all chip selects directly. As result, CS is effectively never
> deselected, and connected flash chips fail to perform read
> operations since they don't get the expected chip select signals
> to reset their state machine.
>
> Normally and per controller documentation one would assume that
> chip select should be set whenever a transfer starts (XCH is
> set or the tx fifo is written into), and that it should be disabled
> whenever a transfer is complete. However, that does not work in
> practice: attempts to implement this approach resulted in failures,
> presumably because a single transaction can be split into multiple
> transfers.
>
> At the same time, there is no explicit signal from the host indicating
> if chip select should be active or not. In the absence of such a direct
> signal, use the burst length written into the control register to
> determine if an access is ongoing or not. Disable all chip selects
> if the burst length field in the configuration register is set to 0,
> and (re-)enable chip select if a transfer is started. This is possible
> because the Linux driver clears the burst length field whenever it
> prepares the controller for the next transfer.
> This solution  is less than perfect since it effectively only disables
> chip select when initiating the next transfer, but it does work with
> Linux and should otherwise do no harm.
>
> Stop complaining if the burst length field is set to a value of 0,
> since that is done by Linux for every transfer.
>
> With this patch, a command line parameter such as "-drive
> file=flash.sabre,format=raw,if=mtd" can be used to instantiate the
> flash chip in the sabrelite emulation. Without this patch, the
> flash instantiates, but it only reads zeroes.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> I am not entirely happy with this solution, but it is the best I was
> able to come up with. If anyone has a better idea, I'll be happy
> to give it a try.
>
>  hw/ssi/imx_spi.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 189423bb3a..7a093156bd 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -167,6 +167,8 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>      DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
>              fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
>
> +    qemu_set_irq(s->cs_lines[imx_spi_selected_channel(s)], 0);
> +
>      while (!fifo32_is_empty(&s->tx_fifo)) {
>          int tx_burst = 0;
>
> @@ -385,13 +387,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>      case ECSPI_CONREG:
>          s->regs[ECSPI_CONREG] = value;
>
> -        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
> -        if (burst % 8) {
> -            qemu_log_mask(LOG_UNIMP,
> -                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
> -                          TYPE_IMX_SPI, __func__, burst);
> -        }

Why has this log message been removed ?

>          if (!imx_spi_is_enabled(s)) {
>              /* device is disabled, so this is a soft reset */
>              imx_spi_soft_reset(s);

thanks
-- PMM

