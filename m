Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B647E41FB2B
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 13:41:32 +0200 (CEST)
Received: from localhost ([::1]:60626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWdOV-0002Ao-Qf
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 07:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWdLM-000137-Gi
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:38:16 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:49535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWdLK-0007r6-Sg
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:38:16 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3A0857462D3;
 Sat,  2 Oct 2021 13:38:13 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 19524745953; Sat,  2 Oct 2021 13:38:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 17B147457EE;
 Sat,  2 Oct 2021 13:38:13 +0200 (CEST)
Date: Sat, 2 Oct 2021 13:38:13 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 02/12] macfb: fix invalid object reference in
 macfb_common_realize()
In-Reply-To: <20211002110007.30825-3-mark.cave-ayland@ilande.co.uk>
Message-ID: <97f3558a-491-a53-4737-d86bc1954884@eik.bme.hu>
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-3-mark.cave-ayland@ilande.co.uk>
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
> During realize memory_region_init_ram_nomigrate() is used to initialise the RAM
> memory region used for the framebuffer but the owner object reference is
> incorrect since MacFbState is a typedef and not a QOM type.
>
> Change the memory region owner to be the corresponding DeviceState to fix the
> issue and prevent random crashes during macfb_common_realize().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/display/macfb.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 2b747a8de8..815870f2fe 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -365,7 +365,7 @@ static void macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
>     memory_region_init_io(&s->mem_ctrl, OBJECT(dev), &macfb_ctrl_ops, s,
>                           "macfb-ctrl", 0x1000);
>
> -    memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(s), "macfb-vram",
> +    memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(dev), "macfb-vram",
>                                      MACFB_VRAM_SIZE, errp);
>     s->vram = memory_region_get_ram_ptr(&s->mem_vram);
>     s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
>

