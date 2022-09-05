Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8845AD40B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:36:05 +0200 (CEST)
Received: from localhost ([::1]:40280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVCGi-0004AP-P1
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVBxB-0006ya-53
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 09:15:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVBx6-0005NK-14
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 09:15:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id c11so7096684wrp.11
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 06:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=k3VoevaX62iUyZNBaRy38B3aJTBunYT79qy2LillNdI=;
 b=a4A9U5M9LDJ0ZJ9lwNYmXuO6rPit6XBXS5F8aVfmheN6qUdV0Epi0nrkwo0MV1z3My
 K/Qk8eD4v5AMxVGxFcqXB6v2OZzo1q1zZMeoEdsl7WqsHkMozKpGHEE+Gh3esCob5RPF
 DeGP0J1bUNZLKDai0EtJT5SiQNYqGnJCyLL4yjBhUU/C4wlymZvM4v4cS2zG6wTdDcEw
 OuJAq9YuaCOr6EQrcJJMaWI2BpY0mvHX9usiXxsJhezGOSKaYqqAp6afKEDkFoqOm6L4
 aFiyzSLIS/wnfpgdy/WNGEekUYMZrx/6x+MBTIk02LLzbZl3ILj2vkOPvkz9uFYAFveZ
 QppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=k3VoevaX62iUyZNBaRy38B3aJTBunYT79qy2LillNdI=;
 b=2YxPJx3MwA5UkWCFJ1/3FffZp+BWw5UkmZpEX3dAwtmIhCr0ZqYVCb2c72P+T882gp
 Y3qS14HuowWBjx6xxtxHfvSucNXpELT4ufxM3X1R/NArvyds4dfbnVI7+mIIZchJaTv6
 da+IYA3WOSyf+J1Gi9rtFjkk6AmpeLdHJn9aPMMh7DNuL1d3WPD9IQEtfSYQ3T1IfUuV
 SMbqka3ySgD5r0UKSpm9qEO+MJZ8HBoAaF1ndA3Jp8+4Jh2tKpxiOJBAJ5UmvPPrOAvH
 9m8TfYeyNanUFdF3FhsLFu2haMHRa5iFQ1fKvMIq7zyBuGvDsUm5PQpJ3GtUQkaIVbxc
 72bg==
X-Gm-Message-State: ACgBeo067y/YsXaxR4D7+mXoTBGWl8QlesycKTbMxlUgI+6T9mltc8we
 G/cT11SoGzVQue7lU3tc+7kSiQ==
X-Google-Smtp-Source: AA6agR6UmPmptBx6vnsfqeiYazB64X/rF3H2clYJNlXcHuvuzt0iCXED14jJt4mMcmoWh8BVwtLLrw==
X-Received: by 2002:adf:f543:0:b0:228:c692:127a with SMTP id
 j3-20020adff543000000b00228c692127amr1164988wrp.246.1662383745886; 
 Mon, 05 Sep 2022 06:15:45 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a5d6d41000000b0021db7b0162esm8943276wri.105.2022.09.05.06.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 06:15:45 -0700 (PDT)
Date: Mon, 5 Sep 2022 15:15:44 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Tyler Ng <tkng@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, thuth@redhat.com,
 pbonzini@redhat.com, lvivier@redhat.com
Subject: Re: [PATCH 2/4] hw/intc: sifive_plic.c: Fix interrupt priority index.
Message-ID: <20220905131544.2xlaycrcyviufo5y@kamzik>
References: <CAB88-qPD2OAxeg4WA65utUmFj4Y=SceeFTuStpZS4pPWevdBXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB88-qPD2OAxeg4WA65utUmFj4Y=SceeFTuStpZS4pPWevdBXA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Sep 01, 2022 at 03:50:06PM -0700, Tyler Ng wrote:
> Fixes a bug in which the index of the interrupt priority is off by 1.
> For example, using an IRQ number of 3 with a priority of 1 is supposed to set
> plic->source_priority[2] = 1, but instead it sets
> plic->source_priority[3] = 1. When an interrupt is claimed to be
> serviced, it checks the index 2 instead of 3.
> 
> Signed-off-by: Tyler Ng <tkng@rivosinc.com>

Fixes tag?

Thanks,
drew

> ---
>  hw/intc/sifive_plic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index af4ae3630e..e75c47300a 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -178,7 +178,7 @@ static void sifive_plic_write(void *opaque, hwaddr
> addr, uint64_t value,
>      SiFivePLICState *plic = opaque;
> 
>      if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
> -        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 0;
> 
>          plic->source_priority[irq] = value & 7;
>          sifive_plic_update(plic);
> --
> 2.30.2
> 

