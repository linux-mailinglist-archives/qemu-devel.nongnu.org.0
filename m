Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08416EF561
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:18:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prf2J-0003tb-8y; Wed, 26 Apr 2023 09:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prf2G-0003kc-Iy; Wed, 26 Apr 2023 09:18:16 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prf2F-0002CM-1j; Wed, 26 Apr 2023 09:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jNzhfeZdsHOL2a682b8qF3ZrO63K1IZEX+xseeaK5xs=; b=gW1wLQIXjrfQJhyXFB2EL1iUZb
 jPjHkHVEXeS/Ny0AVX9xMeywJ5PoByGszbmztpPQ+wmKHkLat76x4tXR4X82Hr9BbICcDjeQWjOsN
 +US928WZaRYgjf58QqTP0Ta52tLWuReImq1nXw+P6LZCOls8y2loEr12f75Zs55AZ5oYKW5Ag+wGS
 VVbFPnogq+V4vXgmliZGsxBpmYtzkZooWWHPoCJLUbJ8sl+7Tonb7ZyhjzfXWH645U05EHDjgScNZ
 FIOZGPjbu9nRjvuKs2npmPdvCyrI+FGLYHgDWrSgHUj0EHs8L0QksMWG98ek8e7moL2DuXk1tPGnv
 /cWX8xpq66y1LNX0uZKTbQLj2VhPtxqp65cgSqd9VEN5aeW9VKGPi0WHl9dSIbzrEJQ5yuOjMqjPa
 Y4HcLyTFkgCj2BzbFv6wT8ym4pF474+eLaEsGzfwooQ4YEvqFrxaaouQDPugcutg+Ko2fZDNILp+c
 Z9iPi81Wflz2B/QitOUImoOaRgI8wvD1WrgnWmLY8RrBQXVPOzbp/q2zToLPtCkQZWawx/4HOPiqh
 FE0KfIsNVVGeW6zmgePLvg3DCkDOOsuJP8FY1QTKC7iUEjBVynUccRfddCWYt4wRaSvIXZDMo3x63
 lOCHwYeDAR0UDpKnD+DXpLghatWmmnKTy4LjW2Xf4=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prf1E-0002fj-Ey; Wed, 26 Apr 2023 14:17:16 +0100
Message-ID: <ffa8d9e4-db41-e799-a3a0-63b3e5db0644@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-12-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 11/18] hw/isa: Simplify isa_address_space[_io]()
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

On 02/03/2023 22:40, Philippe Mathieu-Daudé wrote:

> We don't have any caller passing a NULL device argument,
> so we can simplify, avoiding to access the global 'isabus'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/isa/isa-bus.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 9c8224afa5..3036341d3b 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -252,20 +252,14 @@ static char *isabus_get_fw_dev_path(DeviceState *dev)
>   
>   MemoryRegion *isa_address_space(ISADevice *dev)
>   {
> -    if (dev) {
> -        return isa_bus_from_device(dev)->address_space;
> -    }
> -
> -    return isabus->address_space;
> +    assert(dev);
> +    return isa_bus_from_device(dev)->address_space;
>   }
>   
>   MemoryRegion *isa_address_space_io(ISADevice *dev)
>   {
> -    if (dev) {
> -        return isa_bus_from_device(dev)->address_space_io;
> -    }
> -
> -    return isabus->address_space_io;
> +    assert(dev);
> +    return isa_bus_from_device(dev)->address_space_io;
>   }
>   
>   type_init(isabus_register_types)

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

