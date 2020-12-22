Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D312E060A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 07:31:38 +0100 (CET)
Received: from localhost ([::1]:46480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krbCq-0008W7-SK
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 01:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krbBs-0007t2-7w; Tue, 22 Dec 2020 01:30:36 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:35281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krbBq-00034a-LS; Tue, 22 Dec 2020 01:30:36 -0500
Received: by mail-yb1-xb36.google.com with SMTP id u203so10872120ybb.2;
 Mon, 21 Dec 2020 22:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7G2s3L5xZ25ucPAWpXYKzv/tzl4wtBBMp6CQzqlpwh0=;
 b=m674ppLhoiUfOl8/9JyD7487FJRaMRsx69WAj0CUsWGLYLzzG9s9pCHp7wNMdxa/lU
 KjOVRYmiUuwu5iWVOrKGPAHX7oyxDV0rL07q1dFnVosQOiXE8I5Ln2Zx0C1Tw5lHrwvL
 U1P9R8S/gs1Nzx5j/QOwThtzzCDdqUmm+dV0moTNnrvQeC1OS/aqXTJg/ROevbmr/P5Z
 v4AtO/ntwnZF4q9CU4m4rfGRKAb/B81LjbYejD7cK9zL1iYjjItQwgbHrlXgutKgs14A
 q97CLhEYTTkIJ8Y/wGQJC0Y6hRAdX6Of4wABh5hHYBxhIEqY7F7LFVD/LfYUH4MGEaEr
 RpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7G2s3L5xZ25ucPAWpXYKzv/tzl4wtBBMp6CQzqlpwh0=;
 b=H0lReGVOIP+bPOgZ2+UziuC9hsENkeCwUyscOAujVBeCD+eTSP6xOFYfVux+jhRkwl
 vJMHynVpFdmJ9M0IhZfLgYvycH2DC1hrTQnlDH6G1xeIDxjnCfTfeN05070w41G+6ICu
 Fxzd/BytgRUDEuRvHOGq4IaZOHXe1fd3pSIGgmZN5jgXN/se66p0NS87qaoFc8fd/M4K
 u/YnWDVLzT5YmwFajVTrMEaHVp0qs/gBNZXZCNrBkThFLcYDKJBGWckDhSNFgCYV38oT
 JdLY0zMckTNlORg+oHOadkY8A4sO4CapH78bCkhXeV2+OoYxrZdnG4jnx8cWQ1QGlqs5
 MKbg==
X-Gm-Message-State: AOAM531haOvRm3Hq3tFPiyXpmPIhtApxvrkCbU3aKRZBfgfwgg/BV7qT
 AI0u+cUiWFixHWhtOeOaglLju74yfXe2vNUwqcM=
X-Google-Smtp-Source: ABdhPJxC0e3g0Ve/rXSEuWJcqmmcVMrVvXNhbwj9u8mFkNPlfS3Zl0J1+pvE+W2EEAJFo69Qkl6AGVvs7xeCCZcQnNM=
X-Received: by 2002:a25:ec5:: with SMTP id 188mr29073614ybo.387.1608618633361; 
 Mon, 21 Dec 2020 22:30:33 -0800 (PST)
MIME-Version: 1.0
References: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 22 Dec 2020 14:30:22 +0800
Message-ID: <CAEUhbmXV+e3L0RtmC+qfzoY8wVWPwHXY9ZcBZ=e7RMZ_smuMkw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 17, 2020 at 1:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> For the ECSPIx_CONREG register BURST_LENGTH field, the manual says:
>
> 0x020 A SPI burst contains the 1 LSB in first word and all 32 bits in second word.
> 0x021 A SPI burst contains the 2 LSB in first word and all 32 bits in second word.
>
> Current logic uses either s->burst_length or 32, whichever smaller,
> to determine how many bits it should read from the tx fifo each time.
> For example, for a 48 bit burst length, current logic transfers the
> first 32 bit from the first word in the tx fifo, followed by a 16
> bit from the second word in the tx fifo, which is wrong. The correct
> logic should be: transfer the first 16 bit from the first word in
> the tx fifo, followed by a 32 bit from the second word in the tx fifo.
>
> With this change, SPI flash can be successfully probed by U-Boot on
> imx6 sabrelite board.
>
>   => sf probe
>   SF: Detected sst25vf016b with page size 256 Bytes, erase size 4 KiB, total 2 MiB
>
> Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/ssi/imx_spi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Ping?

