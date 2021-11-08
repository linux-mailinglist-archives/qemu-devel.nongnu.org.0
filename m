Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34229447B94
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:09:51 +0100 (CET)
Received: from localhost ([::1]:43762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjziw-0000wS-5K
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:09:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mjzgF-0006za-OR
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:07:05 -0500
Received: from mail.ilande.co.uk ([46.43.2.167]:36560
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mjzgB-0002mx-67
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:07:00 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mjzfz-0008cK-BI; Mon, 08 Nov 2021 08:06:51 +0000
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211105165254.3544369-1-laurent@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <8d268062-8dcc-4638-cb48-ccfcf1a99d06@ilande.co.uk>
Date: Mon, 8 Nov 2021 08:06:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211105165254.3544369-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] macfb: fix a memory leak (CID 1465231)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=46.43.2.167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.06,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/11/2021 16:52, Laurent Vivier wrote:

> Rewrite the function using g_string_append_printf() rather than
> g_strdup_printf()/g_strconcat().
> 
> Fixes: df8abbbadf74 ("macfb: add common monitor modes supported by the MacOS toolbox ROM")
> Cc: mark.cave-ayland@ilande.co.uk
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/display/macfb.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 4b352eb89c3f..277d3e663331 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -440,21 +440,18 @@ static MacFbMode *macfb_find_mode(MacfbDisplayType display_type,
>   
>   static gchar *macfb_mode_list(void)
>   {
> -    gchar *list = NULL;
> -    gchar *mode;
> +    GString *list = g_string_new("");
>       MacFbMode *macfb_mode;
>       int i;
>   
>       for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
>           macfb_mode = &macfb_mode_table[i];
>   
> -        mode = g_strdup_printf("    %dx%dx%d\n", macfb_mode->width,
> +        g_string_append_printf(list, "    %dx%dx%d\n", macfb_mode->width,
>                                  macfb_mode->height, macfb_mode->depth);
> -        list = g_strconcat(mode, list, NULL);
> -        g_free(mode);
>       }
>   
> -    return list;
> +    return g_string_free(list, FALSE);
>   }
>   
>   
> @@ -643,7 +640,7 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
>           gchar *list;
>           error_setg(errp, "unknown display mode: width %d, height %d, depth %d",
>                      s->width, s->height, s->depth);
> -        list =  macfb_mode_list();
> +        list = macfb_mode_list();
>           error_append_hint(errp, "Available modes:\n%s", list);
>           g_free(list);

Thanks Laurent, looks good to me.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

