Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33A4AA945
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 15:09:04 +0100 (CET)
Received: from localhost ([::1]:34496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGLkM-0003Of-SM
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 09:09:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGLhs-0001tZ-By
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 09:06:29 -0500
Received: from [2001:41c9:1:41f::167] (port=48810
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGLhm-0002Ta-Dq
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 09:06:24 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGLhD-0009uy-0o; Sat, 05 Feb 2022 14:05:51 +0000
Message-ID: <3ba67c7d-f10b-ae22-61f4-962164ba37b4@ilande.co.uk>
Date: Sat, 5 Feb 2022 14:06:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203000550.36711-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220203000550.36711-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2] hw/display/tcx: Mark the VRAM dirty upon reset
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
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 03/02/2022 00:05, Philippe Mathieu-Daudé via wrote:

> When resetting we don't want to *reset* the dirty bitmap,
> we want to *set* it to mark the entire VRAM dirty due to
> the memset() call.
> 
> Replace memory_region_reset_dirty() by tcx_set_dirty()
> which conveniently set the correct ranges dirty.
> 
> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Supersedes: <20220122000707.82918-1-f4bug@amsat.org>
> ---
>   hw/display/tcx.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index d4d09d0df8..90e2975e35 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -371,8 +371,7 @@ static void tcx_reset(DeviceState *d)
>       s->r[258] = s->g[258] = s->b[258] = 255;
>       update_palette_entries(s, 0, 260);
>       memset(s->vram, 0, MAXX*MAXY);
> -    memory_region_reset_dirty(&s->vram_mem, 0, MAXX * MAXY * (1 + 4 + 4),
> -                              DIRTY_MEMORY_VGA);
> +    tcx_set_dirty(s, 0, MAXX * MAXY);
>       s->dac_index = 0;
>       s->dac_state = 0;
>       s->cursx = 0xf000; /* Put cursor off screen */

I don't think the size calculation of MAXX * MAXY is correct when comparing with 
above? I think it's easiest just to use the same approach as update_palette_entries() 
here e.g.

     tcx_set_dirty(s, 0, memory_region_size(&s->vram_mem));


ATB,

Mark.

