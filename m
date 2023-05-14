Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1FB701D66
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 14:36:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyAxG-0004cz-Ji; Sun, 14 May 2023 08:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyAx6-0004Zf-9J; Sun, 14 May 2023 08:35:52 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyAx4-00051o-N5; Sun, 14 May 2023 08:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JxgV9WCX/PZY8Kh2TuMnE/di5xoJ3iGWoJXz4s3abtQ=; b=oV2rU1CrU0SK9S13yMd32Zkx6E
 HsdWj6OY54KN19ET7ZTWJJ6HGcoJ6WA3dk49+ZMphX5NwYYXas8xDmLISP5kpkgEoMEssmjFjee9R
 XmiO14mqs6OKTH2Aa8WnUQtznCmfkXZhIWMqLXVtQVrze3H/rAtupiX9PgI6Yh8+zQmK0hZQpI8lL
 CdOyT5BtRZD+kWMlzLDR+I2Mmz/iMTJGnNVduAIh1PtoGlqJRexRzW9rU55/06ev1ZHteBF3823gq
 97PBEOcKmVqgSztl/AzuMn1HDmjsk/Y1G/1c35J+8nUQ9YWAZsJbVwpbxYIP2CRHawaLZT4mQDM3j
 D6SexZPMLCDyXSEw17jhKNXY7ear3DmmDrj8uMZwggqqG6VpnM4JT4x+yAglb7BZUO1smq728E5NF
 zDC034EK8OYsf9mTAIsd6VuvqSplfv1bO/2O+Wv2z1Q0OwhlgmjJ+p/+iw40lrp2F53B5B8Szf1qC
 m2x/dHpRCsHOh4sCIlo41NMDUVBBs0kBI66My6uw08PTlyEDwc/9gFxnKa0TEO1+gpj/7eAly4YaS
 nY85QZJeizsHqQaC4R4nu3Iy9MRBd6P8vBXFPe8Ga0fXAqU+qcZNYq0lgnfiG+scmbM8G2fmzT33j
 b58KPuRBuFv833lQg4i3O+f6ccGdAiM0OCYoAP7sA=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyAvz-0003Dv-1C; Sun, 14 May 2023 13:34:47 +0100
Message-ID: <9ecbc639-678c-ca86-2d5a-6a009d5dc398@ilande.co.uk>
Date: Sun, 14 May 2023 13:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230513100906.46672-1-shentey@gmail.com>
 <20230513100906.46672-5-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230513100906.46672-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 4/4] hw/isa/i82378: Remove unused "io" attribute
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
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

On 13/05/2023 11:09, Bernhard Beschow wrote:

> The attribute isn't used since commit 5c9736789b79ea49cd236ac326f0a414f63b1015
> "i82378: Cleanup implementation".
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/i82378.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
> index 5432ab5065..63e0857208 100644
> --- a/hw/isa/i82378.c
> +++ b/hw/isa/i82378.c
> @@ -34,7 +34,6 @@ struct I82378State {
>   
>       qemu_irq cpu_intr;
>       qemu_irq *isa_irqs_in;
> -    MemoryRegion io;
>   };
>   
>   static const VMStateDescription vmstate_i82378 = {

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.


