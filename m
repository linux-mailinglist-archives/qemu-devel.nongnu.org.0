Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F40949C455
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 08:31:16 +0100 (CET)
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCclv-0004VE-0V
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 02:31:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nCcf8-0002gw-4v
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 02:24:14 -0500
Received: from [2001:41c9:1:41f::167] (port=34098
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nCcf6-0008Hp-9c
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 02:24:13 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nCceT-0008h9-SC; Wed, 26 Jan 2022 07:23:37 +0000
Message-ID: <004e2b3d-46f3-f829-faea-f36b1e7c3054@ilande.co.uk>
Date: Wed, 26 Jan 2022 07:23:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220122000707.82918-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220122000707.82918-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] hw/display/tcx: Avoid clearing dirty bitmap in
 DeviceReset()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Andreas Gustafsson <gson@gson.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/2022 00:07, Philippe Mathieu-Daudé via wrote:

> Commit 2dd285b5f3 ("tcx: make display updates thread safe")
> converted this model to use the DirtyBitmapSnapshot API,
> resetting the dirty bitmap in tcx_update_display(). There
> is no need to do it again in the DeviceReset handler.
> 
> See more details in commit fec5e8c92b ("vga: make display
> updates thread safe.").
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/display/tcx.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index d4d09d0df8..22b0ae4761 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -371,8 +371,6 @@ static void tcx_reset(DeviceState *d)
>       s->r[258] = s->g[258] = s->b[258] = 255;
>       update_palette_entries(s, 0, 260);
>       memset(s->vram, 0, MAXX*MAXY);
> -    memory_region_reset_dirty(&s->vram_mem, 0, MAXX * MAXY * (1 + 4 + 4),
> -                              DIRTY_MEMORY_VGA);
>       s->dac_index = 0;
>       s->dac_state = 0;
>       s->cursx = 0xf000; /* Put cursor off screen */

I think the issue here is that tcx_reset() should be marking the entire VRAM dirty 
due to the memset() i.e. we should be setting the dirty bitmap rather than resetting 
it. Perhaps memory_region_reset_dirty() should be replaced with 
tcx_invalidate_display() instead?


ATB,

Mark.

