Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201156EC3F2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 05:34:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqmx1-0000Ps-3k; Sun, 23 Apr 2023 23:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pqmwy-0000PN-Jp
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 23:33:12 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pqmww-0003eT-Dn
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 23:33:11 -0400
Received: from [192.168.178.59] (pd9ec3018.dip0.t-ipconnect.de [217.236.48.24])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 34B11DA0ED9;
 Mon, 24 Apr 2023 05:33:06 +0200 (CEST)
Message-ID: <37f99255-20a9-807d-77eb-0465d57cad34@weilnetz.de>
Date: Mon, 24 Apr 2023 05:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
References: <59ffc014-ec48-64a4-3403-7e64c5594053@t-online.de>
 <20230418065652.7152-1-vr_qemu@t-online.de>
Subject: Re: [PATCH v2 1/1] ui/sdl2: disable SDL_HINT_GRAB_KEYBOARD on Windows
In-Reply-To: <20230418065652.7152-1-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.143,
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 18.04.23 um 08:56 schrieb Volker Rümelin:

> Windows sends an extra left control key up/down input event for
> every right alt key up/down input event for keyboards with
> international layout. Since commit 830473455f ("ui/sdl2: fix
> handling of AltGr key on Windows") QEMU uses a Windows low level
> keyboard hook procedure to reliably filter out the special left
> control key and to grab the keyboard on Windows.
>
> The SDL2 version 2.0.16 introduced its own Windows low level
> keyboard hook procedure to grab the keyboard. Windows calls this
> callback before the QEMU keyboard hook procedure. This disables
> the special left control key filter when the keyboard is grabbed.
>
> To fix the problem, disable the SDL2 Windows low level keyboard
> hook procedure.
>
> Reported-by: Bernhard Beschow <shentey@gmail.com>
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   ui/sdl2.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/ui/sdl2.c b/ui/sdl2.c
> index 00aadfae37..9d703200bf 100644
> --- a/ui/sdl2.c
> +++ b/ui/sdl2.c
> @@ -855,7 +855,10 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
>   #ifdef SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR /* only available since SDL 2.0.8 */
>       SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
>   #endif
> +#ifndef CONFIG_WIN32
> +    /* QEMU uses its own low level keyboard hook procecure on Windows */


s/procecure/procedure/


>       SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
> +#endif
>   #ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
>       SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
>   #endif


The typo fix for the comment does not require a v3 and can be applied in 
the pull request.

Reviewed-by: Stefan Weil <sw@weilnetz.de>



