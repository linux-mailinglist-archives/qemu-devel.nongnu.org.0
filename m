Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA7C425350
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:42:41 +0200 (CEST)
Received: from localhost ([::1]:38620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYSjQ-0006dw-Mw
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYSee-0002XT-GI
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:37:46 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:57665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYSea-0007d5-HJ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:37:44 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MAP77-1mek3d3C4R-00Bvo5; Thu, 07 Oct 2021 14:37:38 +0200
Subject: Re: [PATCH v3 04/13] macfb: fix overflow of color_palette array
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211007093407.3329-1-mark.cave-ayland@ilande.co.uk>
 <20211007093407.3329-5-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0bc94045-da38-ffe9-4be2-22b322c1a284@vivier.eu>
Date: Thu, 7 Oct 2021 14:37:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211007093407.3329-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+JvZkL+a6VbmBGVJGzVFdy5hGoElbkkUZ9oXaYlHlvdSwQt9O2W
 UB4Y5Y4G1gGKPfGqbokBxw3V2HR2FBqzJIz2hMrLdar6qtNKMMZrI2neumD+WvpHmF5cRKq
 ht6s0ugnSOTVnwT/YWBBbEmVLs1n1hqpqXS8goQ6kBbD5VVtSy5rxRCcXsYVOfxBNF+m3ym
 dJ5NBCAvJ2vo5G5OnR9RA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gqglXY2KOao=:eMfNSTwFKjKwYPr9Jh/+OK
 yLEd/jWmH1pnuWOdOk9cn1JB9VJWsDi1DpS/qe+8tYIpPrmmFJngNhkoh4w25Yb6Xp12v82DI
 azjSTMe2tNgMr24KR5qZfY2/7HKlJ1LvMsmcItmW/DhYPwo2QQoGawfYeV0GJ7S2yYXNjfshx
 RAQ6dVgdhvuj+lLb0kWdRkBht5t+b7hhXYMWI9ZzJMeV34ytcvSCfmZpnzV1fuo0n23t9sXbp
 8j48RMFbwgH1VrenQMCgAIIllmpwv7MFbNM6Ncx3HOwWysmHDabshPNA/Kwg/64Yl6tEhpxp1
 wwrwZQfmWoDPhN2crmBMcxwN+1uyT3RNML5O+W43c8XbPHyuAQkI6tOarA3w15axn/M1vrCBE
 9hsX9lVo/yKlNV78gbKolDDHDk3nntG34+wt1KWoH/5ezxqosSM/ZCzFXD2EzHNo+BLCv9vY0
 B/TnPppeVShYLdKQdFjc+nt21XZG7ncGWCV1113j7NU8Hzl+TpuRz4+O3Gmeol6N/1WJcF+eZ
 OMlo/yrprprcHb8KDcdtXT9MGZbClwBhV3Vbwzk9UomoXcTlVAgqk3Pk0YOio8PMhz9ade0K7
 YZZB9x17DdEGZEAJ++juzz8+h9hCmuZK/Zv6BKJwEK3CvQlCirpyOdMzpU9Vq6Ct0xMDwTj/b
 xfImWJPwmruxgrBMlQltTCgxd93fMFN8W1RvSWMdtuVSk7M7ZKEDRdQibOV6/c84B3IZS327T
 zDd/i8Q6X39knoBsvC5kyVN+Fy+bXFdGicnkEQ==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.964,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/10/2021 à 11:33, Mark Cave-Ayland a écrit :
> The palette_current index counter has a maximum size of 256 * 3 to cover a full
> color palette of 256 RGB entries. Linux assumes that the palette_current index
> wraps back around to zero after writing 256 RGB entries so ensure that
> palette_current is reset at this point to prevent data corruption within
> MacfbState.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index b363bab889..39dab49026 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -303,7 +303,9 @@ static void macfb_ctrl_write(void *opaque,
>          s->palette_current = 0;
>          break;
>      case DAFB_LUT:
> -        s->color_palette[s->palette_current++] = val;
> +        s->color_palette[s->palette_current] = val;
> +        s->palette_current = (s->palette_current + 1) %
> +                             ARRAY_SIZE(s->color_palette);
>          if (s->palette_current % 3) {
>              macfb_invalidate_display(s);
>          }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

