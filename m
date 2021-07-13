Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1BB3C68F2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 05:56:16 +0200 (CEST)
Received: from localhost ([::1]:60160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m39Wp-0001XK-HE
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 23:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m39Vj-0000V4-SN; Mon, 12 Jul 2021 23:55:07 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:33368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m39Vh-0006rI-OQ; Mon, 12 Jul 2021 23:55:07 -0400
Received: by mail-io1-xd2a.google.com with SMTP id z11so3680133iow.0;
 Mon, 12 Jul 2021 20:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h8UqyeLT2+eJ5XDePjOQKKSAsIo5ixgZeJxUn8lzncM=;
 b=jgnd00L4Nfg9WiAJPcjLvH7Ulyf6nzZrScXS0MqKuj6oto21s8Mn7fTdrmIKiynauQ
 fSp+7Ml3H2dDdV/7gYFnotv0/Ne+84cn2Gdv4V2Pu9Jeo86IJmicdRJmLQqVO4ZQ3xlU
 pwDIxqt58fLGueyLWmFWsoDrdR4bmgfB7mgi0o5OR7jdnyw+aLyu1s6P6dumOZLnSRnR
 yx5EcY/wwo4hOpZxuE4xcRTXUYPUAOg0bMQ1JJdaN5cu5dNCfzmaNpTcEvKETOi4tS+3
 CGC1rz5canI2A41g5rq0H9pCvibYfM5jYCrC0RRjMcbmbhq+8yXAtKaTPAZmVBtpyEES
 3IBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h8UqyeLT2+eJ5XDePjOQKKSAsIo5ixgZeJxUn8lzncM=;
 b=IIqpzOfwsIBeS2DZlKaOINCDR8YOfmUxiZA3DmNwHPX+McoPI8qAHUu/ZnKlv5ppIM
 MzsdZQT1H1hvjCAmUCDMJmUG1k+GmvJ4WMIHC3teymr6wETGycLKghWF0zc+gLS4WEXh
 it4AkwOp+lFEQHYSBE3as+V5/GuhYQTkfEE5JKJu3gYuIVip+UcyMeSpWqnfbl1vlpwv
 vgegRhhaDnExvf6GFcO+u1E0XLs1AgkOAJ1RCzPuaHkwjYO1FAXCwt32fIDOS/79ft5v
 LBHEBdGu9LdWHBdAPCBeMIXkpZQnO7laPh+VCGakayk1QOvFJc/i+WIUc9f7gu13nh/6
 3oTA==
X-Gm-Message-State: AOAM531V6UBAKARFri1rtjQmxSBwLKigZdZ5Wd7ad1Bkv/cOckF9UKC8
 VfxZwUvq9UXqL4vZsCsB+r/z4Vh5guYmXeTpshU=
X-Google-Smtp-Source: ABdhPJx7XUjWcyTMic8ROy7T5V6oykRko/zHnbmurIsvPxAMvm22J8a5EmVJCE86BX0QaAI+QFtMgncQYBFVIdOM2lg=
X-Received: by 2002:a05:6638:1204:: with SMTP id
 n4mr2032761jas.135.1626148503616; 
 Mon, 12 Jul 2021 20:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <1626146083-19434-1-git-send-email-cyruscyliu@gmail.com>
In-Reply-To: <1626146083-19434-1-git-send-email-cyruscyliu@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Jul 2021 13:54:37 +1000
Message-ID: <CAKmqyKO3vHYiS_fDqnQh66jjXDZUvxx2XYxKbwNzgHJWBc_gfw@mail.gmail.com>
Subject: Re: [PATCH] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
To: Qiang Liu <cyruscyliu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 13, 2021 at 1:15 PM Qiang Liu <cyruscyliu@gmail.com> wrote:
>
> xlnx_dp_read allows an out-of-bounds read at its default branch because
> of an improper index.
>
> According to
> https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
> (DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.
>
> DP_INT_MASK     0x000003A4      32      mixed   0xFFFFF03F      Interrupt Mask Register for intrN.
> DP_INT_EN       0x000003A8      32      mixed   0x00000000      Interrupt Enable Register.
> DP_INT_DS       0x000003AC      32      mixed   0x00000000      Interrupt Disable Register.
>
> In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
> will write s->core_registers[0x3A4
> >> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
> >> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
> >> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
> In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
> the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
> rather than 0x3A4.
>
> This patch adjusts the size of s->core_registers and enforces the read
> access to offset 0x3A* and 0x3AC to 0x3A4. BTW, because the size of this
> MMIO region is 0x3AF, this patch also removes the assertion in
> xlnx_dp_write.
>
> Fixes: 58ac482a66de ("introduce xlnx-dp")
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/xlnx_dp.c         | 7 ++++---
>  include/hw/display/xlnx_dp.h | 2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 7bcbb13..8903181 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -713,8 +713,10 @@ static uint64_t xlnx_dp_read(void *opaque, hwaddr offset, unsigned size)
>          ret = 0;
>          break;
>      default:
> -        assert(offset <= (0x3AC >> 2));
> -        ret = s->core_registers[offset];
> +        if (offset == (0x3A8 >> 2) || offset == (0x3AC >> 2))
> +            ret = s->core_registers[DP_INT_MASK];
> +        else
> +            ret = s->core_registers[offset];
>          break;
>      }
>
> @@ -876,7 +878,6 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
>          xlnx_dp_update_irq(s);
>          break;
>      default:
> -        assert(offset <= (0x504C >> 2));
>          s->core_registers[offset] = value;
>          break;
>      }
> diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
> index e85e428..99a6d47 100644
> --- a/include/hw/display/xlnx_dp.h
> +++ b/include/hw/display/xlnx_dp.h
> @@ -39,7 +39,7 @@
>  #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
>  #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
>
> -#define DP_CORE_REG_ARRAY_SIZE              (0x3AF >> 2)
> +#define DP_CORE_REG_ARRAY_SIZE              (0x3A8 >> 2)
>  #define DP_AVBUF_REG_ARRAY_SIZE             (0x238 >> 2)
>  #define DP_VBLEND_REG_ARRAY_SIZE            (0x1DF >> 2)
>  #define DP_AUDIO_REG_ARRAY_SIZE             (0x50 >> 2)
> --
> 2.7.4
>
>

