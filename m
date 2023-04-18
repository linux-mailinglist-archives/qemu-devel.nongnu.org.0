Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30C96E5A93
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 09:37:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poftA-0002Ms-Tp; Tue, 18 Apr 2023 03:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poft9-0002MK-2B
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 03:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poft7-0005Qt-Fo
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 03:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681803387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNSUXHold44cPQDbSUjvZtk72tNgGZtN97+TYgx/yoY=;
 b=LWrQfs+NhwwiRuA6Er8TgPhUR53fc/7FDYMbS6NjrCVqPaw7gTfpFWAxpag1MwwK0WLipE
 28PLQaSMnQw5r7ry1W6Mx8gqLKHo85ydj3Dae+OBdPABojPGmyx3n/rLmv1TClSbvX0wRD
 bTHc2su6j0BPplWX8Lz/tpZEhH73NcI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-2hhVTqkENSCcS2DvoxgB9g-1; Tue, 18 Apr 2023 03:36:26 -0400
X-MC-Unique: 2hhVTqkENSCcS2DvoxgB9g-1
Received: by mail-wm1-f71.google.com with SMTP id
 l20-20020a05600c4f1400b003f0a04fe9b9so6075502wmq.7
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 00:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681803385; x=1684395385;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pNSUXHold44cPQDbSUjvZtk72tNgGZtN97+TYgx/yoY=;
 b=he5L8X1srV2Hx+dnp0PB/QgiN1o6sU4WvyH+tgxLENQskZQeX9G5LJ51T8ocZ5GTJo
 q9irHQCTQma91KsbeWKYtmz+o8lCqCmeYHm52MtTkzm4eH5pHlhqPLhULjaEZbRPYXUy
 JhOLZvxYgt7v6PLD03ty5dO4Y1PNE0qbN+4VNzpITV7g8ANl525SqlM5zXzA1BbFjgSL
 NTDnlfIfudCKclxjK3WpSxn9wZHpt9Zx/bApjnii/9WIwXLCHzekUBSxhE7H276DRd2w
 DzSxcNjM53aDEQg/Am8VZb7x89pZTtYwJsigNMwTuaX72wn7C+PmQTyT9u9dLjipHNq6
 Ir+g==
X-Gm-Message-State: AAQBX9ch1xgWP3MNEiufoG8pL0vVDt4spLyjxWa++zXsOKHjxp2wCBLy
 Ow0AwVRk57+/7Dcr05lYYAYguQdUmQfOEIWKKX4xCVj9dKe1EBoJ7zamCHSG0tz6VKW01O3LUoU
 V7EKVBtK11GMcGXE=
X-Received: by 2002:a1c:7c15:0:b0:3ee:1acd:b039 with SMTP id
 x21-20020a1c7c15000000b003ee1acdb039mr12615455wmc.34.1681803385018; 
 Tue, 18 Apr 2023 00:36:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZeJu8XoYij+fw4de2mOdjk7PGaK33XugC6Pj8YTvlUAlIeX/Py84dydvdlql/Koe6AEcgeQQ==
X-Received: by 2002:a1c:7c15:0:b0:3ee:1acd:b039 with SMTP id
 x21-20020a1c7c15000000b003ee1acdb039mr12615437wmc.34.1681803384715; 
 Tue, 18 Apr 2023 00:36:24 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-59.web.vodafone.de.
 [109.43.176.59]) by smtp.gmail.com with ESMTPSA id
 q4-20020adff944000000b002fda1b12a0bsm718909wrr.2.2023.04.18.00.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 00:36:24 -0700 (PDT)
Message-ID: <e6969ec3-d2f7-8cb8-478b-9c7a15becb57@redhat.com>
Date: Tue, 18 Apr 2023 09:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ui/sdl2: disable SDL_HINT_GRAB_KEYBOARD on Windows
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Stefan Weil <sw@weilnetz.de>
References: <72f7af6f-d22f-c347-db88-b8d9a769d6a3@t-online.de>
 <20230418062823.5683-1-vr_qemu@t-online.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230418062823.5683-1-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/04/2023 08.28, Volker Rümelin wrote:
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
>       SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
> +#endif
>   #ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
>       SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
>   #endif

Reviewed-by: Thomas Huth <thuth@redhat.com>


