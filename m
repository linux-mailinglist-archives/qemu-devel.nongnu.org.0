Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25316EF2E3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:56:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcok-0008Qu-EV; Wed, 26 Apr 2023 06:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcoj-0008Pl-1t; Wed, 26 Apr 2023 06:56:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcoh-0006av-K0; Wed, 26 Apr 2023 06:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4/NJzkh/w0msiR6Jab345piw5za3qq6vl+9iJo6nDpc=; b=jH08EPIUhsJVrcekd42WueBoKD
 tHUXPfYVQVJycCsdxup9QoMGfsuSqNwA8i9NNymejoAOW78R03UAK8/UoY/oJS6NQn5QyUC9qePQU
 f6nPjXU5TW00WTCffEqSpuVPIqaUg0rOUim5r7GxJa8zWErPPsv9cfmtmxtjAM2Se7qheqguG2QH/
 kS2LKrwGt2HrONNZpygI1kXwkW1GXi6jN2D2WQuOLWST8yVNMNZ6azaOQ4iyK/fJ21P9GacGY9uhx
 Yed6oK7lU41HQc3sJYcfnVB8Daz9ApRI0VQ9m9ofqU+ZM1Q9U7DhA6xq84Rn7TpyPDjE3oK1Z8d5r
 GbuXPhlWwf+OgaCSO42BfLPcqUy9sFotM9QDnHek4BfuRU3ZqQHJBXyeR32Q9umoJpR646tAQ0rB4
 DM+Xt331fglg2YYAj3yrJN8hmDNDkTjOoEHbiCfsoWGZnTxgrPGVI4Kbj/RbIVdvPVwBWP3ud824u
 KiyM4Sm9Ul2AQs/H3qt7oOhayIem20uh5PJBq69Irx4zASUFs29iEKIErg2aexJTGvK/pr5VLhpvh
 XqVSaj0ZpZtYs2ae4D2vgLix+Ui5UJpjpa70h/R7dRBC9z4EycFonpDH5zbQ1A7kP2KsobqkO051n
 kb76F1itKMVMy/SQ3fzLaH/4ybkny9jjowS/4IhhM=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcng-0001lO-TB; Wed, 26 Apr 2023 11:55:09 +0100
Message-ID: <58de52a3-6c0b-b7d3-e68c-a7cf46d1f15e@ilande.co.uk>
Date: Wed, 26 Apr 2023 11:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-4-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230422150728.176512-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 03/13] hw/isa/vt82c686: Remove via_isa_set_irq()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/04/2023 16:07, Bernhard Beschow wrote:

> Now that via_isa_set_irq() is unused it can be removed.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/isa/vt82c686.h | 2 --
>   hw/isa/vt82c686.c         | 6 ------
>   2 files changed, 8 deletions(-)
> 
> diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
> index da1722daf2..b6e95b2851 100644
> --- a/include/hw/isa/vt82c686.h
> +++ b/include/hw/isa/vt82c686.h
> @@ -34,6 +34,4 @@ struct ViaAC97State {
>       uint32_t ac97_cmd;
>   };
>   
> -void via_isa_set_irq(PCIDevice *d, int n, int level);
> -
>   #endif
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index c7e29bb46a..a69888a396 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -604,12 +604,6 @@ static const TypeInfo via_isa_info = {
>       },
>   };
>   
> -void via_isa_set_irq(PCIDevice *d, int n, int level)
> -{
> -    ViaISAState *s = VIA_ISA(d);
> -    qemu_set_irq(s->isa_irqs_in[n], level);
> -}
> -
>   static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
>   {
>       ViaISAState *s = opaque;

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

