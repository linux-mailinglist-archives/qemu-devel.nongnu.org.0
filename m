Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D244596C53
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 11:57:28 +0200 (CEST)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOFnj-0001A1-0a
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 05:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1oOFhW-0005IG-5m
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 05:51:06 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:44729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1oOFhU-0001H7-6J
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 05:51:01 -0400
Received: by mail-lf1-x12f.google.com with SMTP id r17so18326560lfm.11
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 02:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc;
 bh=jaD9+D7OSoKax2l2e6kD6PIRMEuxmQ/F8lBsbcyXDbw=;
 b=ik79JqlBuXja/DliDoF1y6TwgDfMGBC/5JCmB6Ucp3HP6t4fhe1f11c3OA0IoFulP0
 yxt8hsAoJWpFcC/Udq+IkLt2dlIj+6Sc0IjRhQ8fVA+WU+IGG3XTD60eEOmcsWwIuzA0
 /fDt3ru4lD4KIPpO0Zm/uTLzNMZjnXC7ypRQcvNDuWY56tyzYdvJ4rhxIS9T9DGTzEaF
 xKILvIz4sSRgRyKHH1hl1ngfsST5ZLqzhu1bKfqTvZrJwvEqoDkDYGfLeKw82zpkpqbk
 XTeS8wasx9qxV3KhaInqn++8QGkTzm8G2XUG1SZTsD1O7mUKA/13ua547eLt9fIcMCwj
 KbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=jaD9+D7OSoKax2l2e6kD6PIRMEuxmQ/F8lBsbcyXDbw=;
 b=AAiLykefVr9SLzYNQ1mcPxgn4nHEHnHsmxvEIGpmULShWFfNSVSO0xxrp1FqydS/xL
 MvoMCRDNFc96HS37PRBCWgvJ4Tx95xoBKkAAYmm0r5zmSP368vPjet5x9y5y4J2zggRB
 nTCjtZ8ngmJJsrCAfKcnl0xbJOkb+bxsuHISkjdFgDoRm/biG2/p5nPBgS+L8P3LpwWJ
 V8j1iTdRs3pljR2TJ2SHcpa4xOTH5lGo1Un7s/uCjtLyPi5JBG9WA0yA4eCMjSUS4H0K
 uQe1YRAlknfxDGLQ3qFNlRVuDQdFr8ZjTdUa+EcM/zGWFsJ62XA1CwI6UCid6IOIwJyb
 tQiQ==
X-Gm-Message-State: ACgBeo1A3ECaxm2dzmy5C0b0XtXWld0hGsDHNchPK4rFc8tUb9WUBrV6
 GjeSJFzm712xfLKmb7Dh0SA=
X-Google-Smtp-Source: AA6agR5V9axhANan0xT5kzLYnxBR4aJub9j/B9GY3UHv6Gj9oqlR12jSez6vvohsYQLlJryp2cPuBQ==
X-Received: by 2002:a05:6512:2248:b0:48a:f8f9:3745 with SMTP id
 i8-20020a056512224800b0048af8f93745mr7938610lfu.256.1660729856234; 
 Wed, 17 Aug 2022 02:50:56 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a05651c10a600b0025d620892cdsm2089625ljn.107.2022.08.17.02.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 02:50:55 -0700 (PDT)
Date: Wed, 17 Aug 2022 11:50:54 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Anton Kochkov <anton.kochkov@proton.me>
Cc: qemu-devel@nongnu.org, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] can: fix Xilinx ZynqMP CAN RX FIFO logic
Message-ID: <20220817095053.GA4571@fralle-msi>
References: <20220812172420.1946484-1-anton.kochkov@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812172420.1946484-1-anton.kochkov@proton.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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

On [2022 Aug 12] Fri 17:25:28, Anton Kochkov wrote:
> Function "update_rx_fifo()" should operate on the RX FIFO
> registers, not the TX FIFO ones.

Hi Anton,

Should we update the git commit message to say this is done for readability /
keeping it consistent? (the defines have the same values)

Otherwise:
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

Best regards,
Francisco Iglesias

> 
> Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
> Resolves: https://gitlab.com/qemu-projects/qemu/-/issues/1123
> ---
>  hw/net/can/xlnx-zynqmp-can.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
> index 82ac48cee2..e93e6c5e19 100644
> --- a/hw/net/can/xlnx-zynqmp-can.c
> +++ b/hw/net/can/xlnx-zynqmp-can.c
> @@ -696,30 +696,30 @@ static void update_rx_fifo(XlnxZynqMPCANState *s, const qemu_can_frame *frame)
>                                                 timestamp));
> 
>              /* First 32 bit of the data. */
> -            fifo32_push(&s->rx_fifo, deposit32(0, R_TXFIFO_DATA1_DB3_SHIFT,
> -                                               R_TXFIFO_DATA1_DB3_LENGTH,
> +            fifo32_push(&s->rx_fifo, deposit32(0, R_RXFIFO_DATA1_DB3_SHIFT,
> +                                               R_RXFIFO_DATA1_DB3_LENGTH,
>                                                 frame->data[0]) |
> -                                     deposit32(0, R_TXFIFO_DATA1_DB2_SHIFT,
> -                                               R_TXFIFO_DATA1_DB2_LENGTH,
> +                                     deposit32(0, R_RXFIFO_DATA1_DB2_SHIFT,
> +                                               R_RXFIFO_DATA1_DB2_LENGTH,
>                                                 frame->data[1]) |
> -                                     deposit32(0, R_TXFIFO_DATA1_DB1_SHIFT,
> -                                               R_TXFIFO_DATA1_DB1_LENGTH,
> +                                     deposit32(0, R_RXFIFO_DATA1_DB1_SHIFT,
> +                                               R_RXFIFO_DATA1_DB1_LENGTH,
>                                                 frame->data[2]) |
> -                                     deposit32(0, R_TXFIFO_DATA1_DB0_SHIFT,
> -                                               R_TXFIFO_DATA1_DB0_LENGTH,
> +                                     deposit32(0, R_RXFIFO_DATA1_DB0_SHIFT,
> +                                               R_RXFIFO_DATA1_DB0_LENGTH,
>                                                 frame->data[3]));
>              /* Last 32 bit of the data. */
> -            fifo32_push(&s->rx_fifo, deposit32(0, R_TXFIFO_DATA2_DB7_SHIFT,
> -                                               R_TXFIFO_DATA2_DB7_LENGTH,
> +            fifo32_push(&s->rx_fifo, deposit32(0, R_RXFIFO_DATA2_DB7_SHIFT,
> +                                               R_RXFIFO_DATA2_DB7_LENGTH,
>                                                 frame->data[4]) |
> -                                     deposit32(0, R_TXFIFO_DATA2_DB6_SHIFT,
> -                                               R_TXFIFO_DATA2_DB6_LENGTH,
> +                                     deposit32(0, R_RXFIFO_DATA2_DB6_SHIFT,
> +                                               R_RXFIFO_DATA2_DB6_LENGTH,
>                                                 frame->data[5]) |
> -                                     deposit32(0, R_TXFIFO_DATA2_DB5_SHIFT,
> -                                               R_TXFIFO_DATA2_DB5_LENGTH,
> +                                     deposit32(0, R_RXFIFO_DATA2_DB5_SHIFT,
> +                                               R_RXFIFO_DATA2_DB5_LENGTH,
>                                                 frame->data[6]) |
> -                                     deposit32(0, R_TXFIFO_DATA2_DB4_SHIFT,
> -                                               R_TXFIFO_DATA2_DB4_LENGTH,
> +                                     deposit32(0, R_RXFIFO_DATA2_DB4_SHIFT,
> +                                               R_RXFIFO_DATA2_DB4_LENGTH,
>                                                 frame->data[7]));
> 
>              ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 1);
> --
> 2.37.1
> 
> 
> 

