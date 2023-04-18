Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBF66E5931
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 08:16:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poecu-0005RC-RH; Tue, 18 Apr 2023 02:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1poecp-0005Po-Km
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 02:15:37 -0400
Received: from mailout05.t-online.de ([194.25.134.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1poecl-0006YC-G5
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 02:15:33 -0400
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout05.t-online.de (Postfix) with SMTP id 6631823581;
 Tue, 18 Apr 2023 08:15:25 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.18.128]) by fwd82.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1poece-14M0hd0; Tue, 18 Apr 2023 08:15:24 +0200
Message-ID: <332871a9-c303-59aa-eb64-4d550562fdb6@t-online.de>
Date: Tue, 18 Apr 2023 08:15:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] ui/sdl2: Grab Alt+Tab also in fullscreen mode
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230417192139.43263-1-shentey@gmail.com>
 <20230417192139.43263-2-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20230417192139.43263-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1681798524-79066C36-18884D0B/0/0 CLEAN NORMAL
X-TOI-MSGID: 4d3c704b-b6ff-4e56-a373-91835c3da5e6
Received-SPF: none client-ip=194.25.134.82; envelope-from=vr_qemu@t-online.de;
 helo=mailout05.t-online.de
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

> By default, SDL grabs Alt+Tab only in non-fullscreen mode. This causes Alt+Tab
> to switch tasks on the host rather than in the VM in fullscreen mode while it
> switches tasks in non-fullscreen mode in the VM. Fix this confusing behavior
> by grabbing Alt+Tab in fullscreen mode, always causing tasks to be switched in
> the VM.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   ui/sdl2.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>

> diff --git a/ui/sdl2.c b/ui/sdl2.c
> index b12dec4caf..8af8b89f1d 100644
> --- a/ui/sdl2.c
> +++ b/ui/sdl2.c
> @@ -856,6 +856,9 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
>       SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
>   #endif
>       SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
> +#ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
> +    SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
> +#endif
>       memset(&info, 0, sizeof(info));
>       SDL_VERSION(&info.version);
>   


