Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A49B402762
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 12:50:03 +0200 (CEST)
Received: from localhost ([::1]:46630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNYfy-0002sd-O8
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 06:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNYf8-0001vK-Bo
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:49:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNYf5-0000Sk-W7
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:49:10 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q11so13729155wrr.9
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 03:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FSLy+7Kej1aRgZdX3GIF+4M18gE2uyGvHJjgs/rxBDI=;
 b=Wk7gl3dFwn6TjkcZvEu+NuGuT8MJRj+bvJK9yOBgAr6jBn/2X90w8HKsViZggGmbAO
 oz5zPQA7RC9+ET8etBl9EBMZR9UrSu3E6fpvQy9k0NsM0Qfh2qZqS1zI6hUlGeoDnrCx
 yk3DidWrNoli2RVMpfNrtEFjaTvWPKO2TCD2+Ltl7jT2gpuCDy2bLcuzYdUjgZEmBygr
 F7V5NT4S9LF0ZJG4nXQNROq/wDxdjrsqCKyY0ndCKPt918LMNxJzHUTlqjsK3I1DVbVN
 8j8VBCIl3+YRAsNna5S4eFKT00TAz4gjkt0aX3Fz1af2lkx/kVCZl3I8tlxpeYVI5VCe
 H8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FSLy+7Kej1aRgZdX3GIF+4M18gE2uyGvHJjgs/rxBDI=;
 b=lzaRc4Cv5qHHXqhD6/ABUt2hUXnCSFEXJRpSJC1xM+Q/N6fuhSPJ/FgzdHz3OKEpiY
 cgYOXtXj4JkDCXX/d8QTq6plSQ2Cp0EEfq3vREADSiYNx+XBXi8O2BpFwKve5wPKuClt
 L/IHynXt6XQoxNob18kEVGnmo+yXFuh9NlDGkVV2nEc1WaJpCudp3yeiEBZlE8aAN0J2
 pXQhHo4xrpaPWZsuVpsYuKEpdyjc/j4ShnhM/D5CZEhjbieZKFeDTqtoReTw2v99QTKa
 fjY9bwwhgV7Zps72mp99lbKwannm7amWOeyeeSvnya7OSS+Gy2Jft+rn+j9VmndO5LVT
 zk9g==
X-Gm-Message-State: AOAM533ljvymBPOKjUHQwHdSVzbwRoHVjpcWvM5fDfR+MAsU4iY8NhI5
 dgMOWraAGMGYFHq6oGgxAk9I8AR+nPRkmWBOGRS0Bg==
X-Google-Smtp-Source: ABdhPJxZ5W+wqa4tzCRlx8ZKkvjlH1WZMX1Ou4YfDztm91lOnILAiu5NCP+mYTs6l7Kq3dIvCHGZbBCSHEZlhCqNKUk=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr17443269wrr.376.1631011746473; 
 Tue, 07 Sep 2021 03:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
 <20210902053958.GJ6340@toto>
In-Reply-To: <20210902053958.GJ6340@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 11:48:17 +0100
Message-ID: <CAFEAcA-5krNObRhtxtU-W_5MgFD+iYZBNUiuD5poBrDVBo8Mjw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] hw/arm: xilinx_zynq: Fix upstream U-Boot boot
 failure
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Sept 2021 at 06:40, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
>
> On Wed, Sep 01, 2021 at 08:45:15PM +0800, Bin Meng wrote:
> > As of today, when booting upstream U-Boot for Xilinx Zynq, the UART
> > does not receive anything. Debugging shows that the UART input clock
> > frequency is zero which prevents the UART from receiving anything as.
> > per the logic in uart_receive().
> >
> > Note the U-Boot can still output data to the UART tx fifo, which should
> > not happen, as the design seems to prevent the data transmission when
> > clock is not enabled but somehow it only applies to the Rx side.
> >
> > For anyone who is interested to give a try, here is the U-Boot defconfig:
> > $ make xilinx_zynq_virt_defconfig
> >
> > and QEMU commands to test U-Boot:
> > $ qemu-system-arm -M xilinx-zynq-a9 -m 1G -display none -serial null -serial stdio \
> >     -device loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
> >
> > Note U-Boot used to boot properly in QEMU 4.2.0 which is the QEMU
> > version used in current U-Boot's CI testing. The UART clock changes
> > were introduced by the following 3 commits:
> >
> > 38867cb7ec90 ("hw/misc/zynq_slcr: add clock generation for uarts")
> > b636db306e06 ("hw/char/cadence_uart: add clock support")
> > 5b49a34c6800 ("hw/arm/xilinx_zynq: connect uart clocks to slcr")
>
> Thanks Bin,
>
> On the entire series:
>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


Applied to target-arm.next, thanks.

-- PMM

