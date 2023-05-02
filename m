Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A406F4B71
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 22:37:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptwjU-0006M7-7B; Tue, 02 May 2023 16:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ptwjR-0006Ks-IM; Tue, 02 May 2023 16:36:17 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ptwjP-0001xD-6k; Tue, 02 May 2023 16:36:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 98FC3745712;
 Tue,  2 May 2023 22:34:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D75DB745706; Tue,  2 May 2023 22:34:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D347A7456E3;
 Tue,  2 May 2023 22:34:18 +0200 (CEST)
Date: Tue, 2 May 2023 22:34:18 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH] ui: Fix pixel colour channel order for PNG screenshots
In-Reply-To: <20230502135548.2451309-1-peter.maydell@linaro.org>
Message-ID: <d85ba066-2d0d-fcb2-d5ca-3be6d884d7b7@eik.bme.hu>
References: <20230502135548.2451309-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 2 May 2023, Peter Maydell wrote:
> When we take a PNG screenshot the ordering of the colour channels in
> the data is not correct, resulting in the image having weird
> colouring compared to the actual display.  (Specifically, on a
> little-endian host the blue and red channels are swapped; on
> big-endian everything is wrong.)
>
> This happens because the pixman idea of the pixel data and the libpng
> idea differ.  PIXMAN_a9r8g8b8 defines that pixels are 32-bit values,

Typo: should be PIXMAN_a8r8g8b8 not a9

Regards,
BALATON Zoltan

> with A in bits 24-31, R in bits 16-23, G in bits 8-15 and B in bits
> 0-7.  This means that on little-endian systems the bytes in memory
> are
>   B G R A
> and on big-endian systems they are
>   A R G B
>
> libpng, on the other hand, thinks of pixels as being a series of
> values for each channel, so its format PNG_COLOR_TYPE_RGB_ALPHA
> always wants bytes in the order
>   R G B A
>
> This isn't the same as the pixman order for either big or little
> endian hosts.
>
> The alpha channel is also unnecessary bulk in the output PNG file,
> because there is no alpha information in a screenshot.
>
> To handle the endianness issue, we already define in ui/qemu-pixman.h
> various PIXMAN_BE_* and PIXMAN_LE_* values that give consistent
> byte-order pixel channel formats.  So we can use PIXMAN_BE_r8g8b8 and
> PNG_COLOR_TYPE_RGB, which both have an in-memory byte order of
>    R G B
> and 3 bytes per pixel.
>
> (PPM format screenshots get this right; they already use the
> PIXMAN_BE_r8g8b8 format.)
>
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1622
> Fixes: 9a0a119a382867 ("Added parameter to take screenshot with screendump as PNG")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Disclaimer: I don't have a BE system that I have convenient
> graphics output from that I can use to test the screenshot
> format there.
> ---
> ui/console.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/console.c b/ui/console.c
> index 6e8a3cdc62d..e173731e205 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -311,7 +311,7 @@ static bool png_save(int fd, pixman_image_t *image, Error **errp)
>     png_struct *png_ptr;
>     png_info *info_ptr;
>     g_autoptr(pixman_image_t) linebuf =
> -                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
> +        qemu_pixman_linebuf_create(PIXMAN_BE_r8g8b8, width);
>     uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
>     FILE *f = fdopen(fd, "wb");
>     int y;
> @@ -341,7 +341,7 @@ static bool png_save(int fd, pixman_image_t *image, Error **errp)
>     png_init_io(png_ptr, f);
>
>     png_set_IHDR(png_ptr, info_ptr, width, height, 8,
> -                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
> +                 PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE,
>                  PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
>
>     png_write_info(png_ptr, info_ptr);
>

