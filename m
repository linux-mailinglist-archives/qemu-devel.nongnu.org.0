Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C8341FB27
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 13:37:27 +0200 (CEST)
Received: from localhost ([::1]:57834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWdKY-0000Bs-B0
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 07:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWdJK-0007qe-H0
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:36:10 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:29374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWdJF-0005pr-5f
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:36:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 02A5F7462D3;
 Sat,  2 Oct 2021 13:36:01 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D6B7D745953; Sat,  2 Oct 2021 13:36:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D54A47457EE;
 Sat,  2 Oct 2021 13:36:00 +0200 (CEST)
Date: Sat, 2 Oct 2021 13:36:00 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 01/12] macfb: handle errors that occur during realize
In-Reply-To: <20211002110007.30825-2-mark.cave-ayland@ilande.co.uk>
Message-ID: <2d85248a-bddd-c390-d0a2-356d57627786@eik.bme.hu>
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-2-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 2 Oct 2021, Mark Cave-Ayland wrote:
> Make sure any errors that occur within the macfb realize chain are detected
> and handled correctly to prevent crashes and to ensure that error messages are
> reported back to the user.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
> hw/display/macfb.c | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 76808b69cc..2b747a8de8 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c

There's one more in macfb_common_realize() after:

memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(s), "macfb-vram", MACFB_VRAM_SIZE, errp);

otherwise

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>


> @@ -379,6 +379,10 @@ static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
>     MacfbState *ms = &s->macfb;
>
>     macfb_common_realize(dev, ms, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
>     sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_ctrl);
>     sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_vram);
> }
> @@ -391,8 +395,15 @@ static void macfb_nubus_realize(DeviceState *dev, Error **errp)
>     MacfbState *ms = &s->macfb;
>
>     ndc->parent_realize(dev, errp);
> +    if (*errp) {
> +        return;
> +    }
>
>     macfb_common_realize(dev, ms, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
>     memory_region_add_subregion(&nd->slot_mem, DAFB_BASE, &ms->mem_ctrl);
>     memory_region_add_subregion(&nd->slot_mem, VIDEO_BASE, &ms->mem_vram);
> }
>

