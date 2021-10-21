Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF9A436AEE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 20:52:31 +0200 (CEST)
Received: from localhost ([::1]:44700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mddB0-0003iy-8R
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 14:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mdd8z-0001e5-Mv; Thu, 21 Oct 2021 14:50:26 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:36553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mdd8w-0004bt-6M; Thu, 21 Oct 2021 14:50:25 -0400
Received: by mail-qt1-x82c.google.com with SMTP id b12so1415178qtq.3;
 Thu, 21 Oct 2021 11:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=49U2Swa+Y+jYNZ+7cnA8LbU+0BoYUUxLzrIHy8E+U2c=;
 b=DgoPhqRoEUijUebfE1YBxv/srpWvCJ26+z1QYUEE7WbKPGe0FU4X66QOPXbMJAK8lG
 E69zNuXIjWdba5++oMlHGn2fbRXy0pHKHbKi9jgg+RnAdtSLsI8Xpj5tijad0M3pALBe
 XNAYkWeUH2o9yJopEqdUlLP+fNsxUbOFwmB1r0ma4or5iGT1FQ03P0AORCx3BjncalcN
 20a+WTeirvXuzeHzHFwRmK1fQdFbKQJLlevzkRTmLZtRorZdZ1RmvpMzOltc+Mcj33o9
 HxT5hN12HE0D8KBSM0enPB3QfhqwdBRBU+QvGpeZbdrt+UmYz6uxSMbXX2X3x9eej4kJ
 RhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=49U2Swa+Y+jYNZ+7cnA8LbU+0BoYUUxLzrIHy8E+U2c=;
 b=uz5sVhiqrbF7VCqXwm3VBWWG3oY4nijjDdlCKivnyjmS77z779WZtrS9sZeGz9iJMV
 SlzsbmVXxugh2S18N/+nkwon/18Dxdffuz0ORDZaGfuBs3AcKSA0JNXOxyXHJSeXS8LH
 ZZ7Vjeyrj1iTGf6Ik6wwlsevyqlWrB5ZagntMKIKGUFqU78tAg7ExsQe0Px66U37Y1DL
 tT9YVkw5tuSBoqRlsI6D/5rr6kl0OVqQ8UHEGCRio1D0yy9fUCzRm4ZW777ryQbxJqgC
 D2CDF2I2buYPiwz3uqhCbyojhd0p2+nyeRt2gESFr2et36dAGDPjfcpQL5g4tkMxS4td
 yxfg==
X-Gm-Message-State: AOAM532bCG6l/tlMtq3Z7VcymAXT8m2H3nVCksK+j+bWX5W1JdXsqZVi
 bO4hqgobTLazJc70UhCn365nAs/n+T/l
X-Google-Smtp-Source: ABdhPJzm5J2GpzyBCJU8cIQgktkfjkjg8Co8DBjTKRyH4N4xzHg51LCnjGHXBEOgLNNZOQT9lTrgNA==
X-Received: by 2002:ac8:5cc2:: with SMTP id s2mr8082428qta.362.1634842219651; 
 Thu, 21 Oct 2021 11:50:19 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id x16sm2798761qtp.56.2021.10.21.11.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 11:50:19 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:b816:2692:1867:c58b])
 by serve.minyard.net (Postfix) with ESMTPSA id 6772118000C;
 Thu, 21 Oct 2021 18:50:18 +0000 (UTC)
Date: Thu, 21 Oct 2021 13:50:17 -0500
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH v2 2/7] hw/i2c: Read FIFO during RXF_CTL change in
 NPCM7XX SMBus
Message-ID: <20211021185017.GA66936@minyard.net>
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-3-wuhaotsh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021183956.920822-3-wuhaotsh@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: peter.maydell@linaro.org, Titus Rwantare <titusr@google.com>,
 venture@google.com, qemu-devel@nongnu.org, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 11:39:51AM -0700, Hao Wu wrote:
> Originally we read in from SMBus when RXF_STS is cleared. However,
> the driver clears RXF_STS before setting RXF_CTL, causing the SM bus
> module to read incorrect amount of bytes in FIFO mode when the number
> of bytes read changed. This patch fixes this issue.
> 
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>

This looks ok.  I assume you can take this in with the rest of the
patches.

Acked-by: Corey Minyard <cminyard@mvista.com>

> ---
>  hw/i2c/npcm7xx_smbus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
> index f18e311556..1435daea94 100644
> --- a/hw/i2c/npcm7xx_smbus.c
> +++ b/hw/i2c/npcm7xx_smbus.c
> @@ -637,9 +637,6 @@ static void npcm7xx_smbus_write_rxf_sts(NPCM7xxSMBusState *s, uint8_t value)
>  {
>      if (value & NPCM7XX_SMBRXF_STS_RX_THST) {
>          s->rxf_sts &= ~NPCM7XX_SMBRXF_STS_RX_THST;
> -        if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
> -            npcm7xx_smbus_recv_fifo(s);
> -        }
>      }
>  }
>  
> @@ -651,6 +648,9 @@ static void npcm7xx_smbus_write_rxf_ctl(NPCM7xxSMBusState *s, uint8_t value)
>          new_ctl = KEEP_OLD_BIT(s->rxf_ctl, new_ctl, NPCM7XX_SMBRXF_CTL_LAST);
>      }
>      s->rxf_ctl = new_ctl;
> +    if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
> +        npcm7xx_smbus_recv_fifo(s);
> +    }
>  }
>  
>  static uint64_t npcm7xx_smbus_read(void *opaque, hwaddr offset, unsigned size)
> -- 
> 2.33.0.1079.g6e70778dc9-goog
> 
> 

