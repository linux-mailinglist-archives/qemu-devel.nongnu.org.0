Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B6567716A
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 19:17:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJetw-0006RI-Nw; Sun, 22 Jan 2023 13:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJetr-0006R2-UP; Sun, 22 Jan 2023 13:17:03 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJetp-0005Ar-Gv; Sun, 22 Jan 2023 13:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gj3hwQlbfd5s67GqVJ0HFTa8g737suVlFJsUb2SzZao=; b=ICy4E7bwR3/unLwg4XDuU29lyO
 VCACXGW+AJsPL1KAW1ztJq0Kj16pr/mNXGCqHf6e07JOPCGsJNsH96DMBjSdBafJIcmX4/zxYTtwc
 qkhEjLFAJiA3kCUt8WdmRsWo03zrpQMkenXXs4FB9GpTO91+xAnNHSddDh5TMMIdJ8R0ZA+6w5Lph
 aAMFd7HtnA74HimmXc0r5ROz8ayM55yJrltUzHmtHmONg9DXCK3BnKKlyEfN3AsgQvu03v101xfJP
 rE+2JR2IOgM4mmO9CSZQ1NuQcDBWOgJMlQlrXjUYNrxVyq2NCGTGWtlKphQVd7jC+WTAVxSzdkFbK
 zhHV9qUdPbuzuqPZ3bumToij+rJS6K2i2plufFccWRRU0hz9/mQGDn+5kPctZGBy/RmucxHseQ6Jp
 rLqC0RKJfNDE3ZVIBuYaAEbC5N8Dn6VLUI7ATllzCTqVLc6dvow5ivTBYsLnk1ZefX913CSA2mE5S
 DulaDKoHYMrLUYhHmejs/0Im0yuATu2M/AeutAEL4nh+d/Kiqz8CWBh+8EGjzhJ6dAK6W7Kkq5jaX
 tbnST231NOGHFkBk2xAkeORglifr+IbaSFdOd8lHYeDwLLqIWKMUCZC/dFseMqeIZuYGnSMh4SVZp
 53GEMMFZ1wU1rNUXz2Y580XcqlRZpbnbzkrW/WVvg=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJetL-0006FZ-Bf; Sun, 22 Jan 2023 18:16:35 +0000
Message-ID: <dfcca6fe-9626-9b11-5031-43ccd5ca8025@ilande.co.uk>
Date: Sun, 22 Jan 2023 18:16:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1674001241.git.balaton@eik.bme.hu>
 <165a4ea190af7c09832f50f02004fad82f704898.1674001242.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <165a4ea190af7c09832f50f02004fad82f704898.1674001242.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 3/4] hw/misc/macio: Remove some single use local variables
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 18/01/2023 00:32, BALATON Zoltan wrote:

> Drop some local variables that could just be substituted at the single
> place they were used. This makes the code shorter and simpler.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/macio.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index 4d7223cc85..ae2a9a960d 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -53,10 +53,8 @@
>    */
>   static void macio_escc_legacy_setup(MacIOState *s)
>   {
> -    ESCCState *escc = ESCC(&s->escc);
> -    SysBusDevice *sbd = SYS_BUS_DEVICE(escc);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(&s->escc);
>       MemoryRegion *escc_legacy = g_new(MemoryRegion, 1);
> -    MemoryRegion *bar = &s->bar;
>       int i;
>       static const int maps[] = {
>           0x00, 0x00, /* Command B */
> @@ -80,16 +78,15 @@ static void macio_escc_legacy_setup(MacIOState *s)
>           memory_region_add_subregion(escc_legacy, maps[i], port);
>       }
>   
> -    memory_region_add_subregion(bar, 0x12000, escc_legacy);
> +    memory_region_add_subregion(&s->bar, 0x12000, escc_legacy);
>   }
>   
>   static void macio_bar_setup(MacIOState *s)
>   {
> -    ESCCState *escc = ESCC(&s->escc);
> -    SysBusDevice *sbd = SYS_BUS_DEVICE(escc);
> -    MemoryRegion *bar = &s->bar;
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(&s->escc);
> +    MemoryRegion *bar = sysbus_mmio_get_region(sbd, 0);
>   
> -    memory_region_add_subregion(bar, 0x13000, sysbus_mmio_get_region(sbd, 0));
> +    memory_region_add_subregion(&s->bar, 0x13000, bar);
>       macio_escc_legacy_setup(s);
>   }

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

