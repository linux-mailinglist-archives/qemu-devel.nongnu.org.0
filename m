Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69431C41A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 23:42:02 +0100 (CET)
Received: from localhost ([::1]:46764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBmZ7-0000qy-Jw
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 17:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lBmYH-0000QK-3Z
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:41:09 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38046
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lBmYF-0002zY-Du
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:41:08 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lBmYZ-0001b9-4z; Mon, 15 Feb 2021 22:41:33 +0000
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210215102149.20513-1-peter.maydell@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <5b91b4f1-f557-ca74-9e68-8f860cac76c7@ilande.co.uk>
Date: Mon, 15 Feb 2021 22:40:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215102149.20513-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] hw/display/tcx: Drop unnecessary code for handling BGR
 format outputs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/02/2021 10:21, Peter Maydell wrote:

> For a long time now the UI layer has guaranteed that the console
> surface is always 32 bits per pixel, RGB. The TCX code already
> assumes 32bpp, but it still has some checks of is_surface_bgr()
> in an attempt to support 32bpp BGR. is_surface_bgr() will always
> return false for the qemu_console_surface(), unless the display
> device itself has deliberately created an alternate-format
> surface via a function like qemu_create_displaysurface_from().
> 
> Drop the never-used BGR-handling code, and assert that we have
> a 32-bit surface rather than just doing nothing if it isn't.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Tested by booting Linux on an SS-5.
> ---
>   hw/display/tcx.c | 31 ++++++++-----------------------
>   1 file changed, 8 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index 965f92ff6b7..d3db3046572 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -128,15 +128,10 @@ static int tcx_check_dirty(TCXState *s, DirtyBitmapSnapshot *snap,
>   
>   static void update_palette_entries(TCXState *s, int start, int end)
>   {
> -    DisplaySurface *surface = qemu_console_surface(s->con);
>       int i;
>   
>       for (i = start; i < end; i++) {
> -        if (is_surface_bgr(surface)) {
> -            s->palette[i] = rgb_to_pixel32bgr(s->r[i], s->g[i], s->b[i]);
> -        } else {
> -            s->palette[i] = rgb_to_pixel32(s->r[i], s->g[i], s->b[i]);
> -        }
> +        s->palette[i] = rgb_to_pixel32(s->r[i], s->g[i], s->b[i]);
>       }
>       tcx_set_dirty(s, 0, memory_region_size(&s->vram_mem));
>   }
> @@ -181,21 +176,18 @@ static void tcx_draw_cursor32(TCXState *s1, uint8_t *d,
>   }
>   
>   /*
> -  XXX Could be much more optimal:
> -  * detect if line/page/whole screen is in 24 bit mode
> -  * if destination is also BGR, use memcpy
> -  */
> + * XXX Could be much more optimal:
> + * detect if line/page/whole screen is in 24 bit mode
> + */
>   static inline void tcx24_draw_line32(TCXState *s1, uint8_t *d,
>                                        const uint8_t *s, int width,
>                                        const uint32_t *cplane,
>                                        const uint32_t *s24)
>   {
> -    DisplaySurface *surface = qemu_console_surface(s1->con);
> -    int x, bgr, r, g, b;
> +    int x, r, g, b;
>       uint8_t val, *p8;
>       uint32_t *p = (uint32_t *)d;
>       uint32_t dval;
> -    bgr = is_surface_bgr(surface);
>       for(x = 0; x < width; x++, s++, s24++) {
>           if (be32_to_cpu(*cplane) & 0x03000000) {
>               /* 24-bit direct, BGR order */
> @@ -204,10 +196,7 @@ static inline void tcx24_draw_line32(TCXState *s1, uint8_t *d,
>               b = *p8++;
>               g = *p8++;
>               r = *p8;
> -            if (bgr)
> -                dval = rgb_to_pixel32bgr(r, g, b);
> -            else
> -                dval = rgb_to_pixel32(r, g, b);
> +            dval = rgb_to_pixel32(r, g, b);
>           } else {
>               /* 8-bit pseudocolor */
>               val = *s;
> @@ -230,9 +219,7 @@ static void tcx_update_display(void *opaque)
>       int y, y_start, dd, ds;
>       uint8_t *d, *s;
>   
> -    if (surface_bits_per_pixel(surface) != 32) {
> -        return;
> -    }
> +    assert(surface_bits_per_pixel(surface) == 32);
>   
>       page = 0;
>       y_start = -1;
> @@ -283,9 +270,7 @@ static void tcx24_update_display(void *opaque)
>       uint8_t *d, *s;
>       uint32_t *cptr, *s24;
>   
> -    if (surface_bits_per_pixel(surface) != 32) {
> -            return;
> -    }
> +    assert(surface_bits_per_pixel(surface) == 32);
>   
>       page = 0;
>       y_start = -1;

Thanks Peter - looks good to me.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Would you like this to go via a qemu-sparc PR or is it easier to go as part of a 
group alongside your other display surface patches via target-arm.next?


ATB,

Mark.

