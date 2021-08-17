Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F693EE9FC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:35:17 +0200 (CEST)
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvV6-000793-4C
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvTq-0005mH-KI; Tue, 17 Aug 2021 05:33:58 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:54238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvTo-0003Na-Iz; Tue, 17 Aug 2021 05:33:58 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 54F38C6019D;
 Tue, 17 Aug 2021 11:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629192834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=METMcd9nRfoNTaPjmMOKcSgvLFVRhZInPlLz6EF7KSU=;
 b=g09eKTDfMrXjAFgV4NJ7Lz9ZvLIllWr7aPD6rvNcjcvSeQaOq+l1yTWpzGrzMuSM5TQEQ7
 usjejyvcxRz5WSOTruOJlREHNADRQQV3RmoyYAK1haqRRYjZt2lnH8VXTa+NxmNLflLIMz
 Gvyj1DU2J0Gxh2fgUtkhoQ0UI+7VPgSY9zp+lfGhI3K7QJ06k9OmKkNHgPzXLy1GRLJBv/
 J82wm+2CxqrBaS+h4OLbq3MKqsHvD6NpBJtmYNVon50VCvAq9mlDV4xrS8fkGhNd5vmP0p
 YO+B067NPwwLoE6KWYlpT4uEgSLl6If3WHObht4hHEItfbafkfpTD3i3cU0cLg==
Date: Tue, 17 Aug 2021 11:36:06 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 07/25] armsse: Wire up systick cpuclk clock
Message-ID: <20210817093606.wrf7nlcunwuaq4q6@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-8-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-8-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> Wire up the cpuclk for the systick devices to the SSE object's
> existing mainclk clock.
> 
> We do not wire up the refclk because the SSE subsystems do not
> provide a refclk.  (This is documented in the IoTKit and SSE-200
> TRMs; the SSE-300 TRM doesn't mention it but we assume it follows the
> same approach.) When we update the systick device later to honour "no
> refclk connected" this will fix a minor emulation inaccuracy for the
> SSE-based boards.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/armsse.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index a1456cb0f42..70b52c3d4b9 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -995,6 +995,9 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>          int j;
>          char *gpioname;
>  
> +        qdev_connect_clock_in(cpudev, "cpuclk", s->mainclk);
> +        /* The SSE subsystems do not wire up a systick refclk */
> +
>          qdev_prop_set_uint32(cpudev, "num-irq", s->exp_numirq + NUM_SSE_IRQS);
>          /*
>           * In real hardware the initial Secure VTOR is set from the INITSVTOR*
> -- 
> 2.20.1
> 

-- 

