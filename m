Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AF13CFAF1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:44:14 +0200 (CEST)
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5q2f-0003Dj-3h
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5q0s-0000lq-2I
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5q0q-0004oe-H8
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626788540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lx6BtVvnKumi8vgK5zS6FeADqGTLOCWJrXXnimag+bc=;
 b=MrkRw8mXl3nDiyyTY5Q+dm9tN/upVwA99eaTqErMSNWttzb9KMzJvfdiTRMoyP/r5yUpEO
 tcMCblWgT/8pVs4/F8rvRbfEM86J3PS4XXmVsbes6SSWacgXVNDhCi3PUburZcPmaTP2zw
 q0Kz19IEWi0xmAL7sDL1JPlbQZyhV+A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-_MolbEc1P2KLszOp5p3jFw-1; Tue, 20 Jul 2021 09:42:18 -0400
X-MC-Unique: _MolbEc1P2KLszOp5p3jFw-1
Received: by mail-wr1-f69.google.com with SMTP id
 h15-20020adffd4f0000b0290137e68ed637so10278298wrs.22
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lx6BtVvnKumi8vgK5zS6FeADqGTLOCWJrXXnimag+bc=;
 b=fRHlbT3t42E0KyTF50v9pjcRQQEJmnxwDQtq/aKENwH6nHxMn6+WkCCW4DpdmQGjR3
 3rKPSDqLjfLrVJtvUobcJJTdCacPMSeRXnhdmS0oosPglXJeASUU5YKZZoVvKhtFgE9q
 TRvdbbGbSaGBd5gD3sksrWe0SB7tzbKx4lpC6mWM8+dIxOHTtKQJjDFJVz/1//4T7+yN
 NEKRB5hiE2Rs6JlSrDPNSafPVufw80HzNAcF1Ut3V2yFeWUVe1IYbhrnyFqIywU1wTVg
 l9n8+adwDN6AVju38gn4WKwV01GCoExW9+PXPy0g5MWmFAHQDhY/O6CwVQx5b7S+lYLR
 WlpQ==
X-Gm-Message-State: AOAM530JJjEsN1c9m5GeVfrDhM4Y0fEXwgqEyinzTWqp4/POvGYVkK/k
 5WkBIGlghBeYesFDkq4FBbOR0EzJ1MFe1jWIdJeTUmHKHwqxjH2KhLxez6T0XlHkP2W747QLaJx
 IfzoU1ArUvgZO30s=
X-Received: by 2002:adf:f44d:: with SMTP id f13mr36400164wrp.353.1626788537665; 
 Tue, 20 Jul 2021 06:42:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwwP/9WnlYhMXaTJolpi6KEPNBF0vlJpP0utqNqvICT7EYfppzczIIZ6p3eeO4vHTgo/cM3Q==
X-Received: by 2002:adf:f44d:: with SMTP id f13mr36400144wrp.353.1626788537474; 
 Tue, 20 Jul 2021 06:42:17 -0700 (PDT)
Received: from thuth.remote.csb (p5791dad8.dip0.t-ipconnect.de.
 [87.145.218.216])
 by smtp.gmail.com with ESMTPSA id f13sm24945263wrt.86.2021.07.20.06.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 06:42:17 -0700 (PDT)
Subject: Re: [PATCH 1/2] ui/gtk: detach_all option for making all VCs detached
 upon starting
To: Dongwon Kim <dongwon.kim@intel.com>, qemu-devel@nongnu.org
References: <20210719214157.5863-1-dongwon.kim@intel.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <885e977c-f697-dd02-4be1-b5283fdf343d@redhat.com>
Date: Tue, 20 Jul 2021 15:42:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210719214157.5863-1-dongwon.kim@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/07/2021 23.41, Dongwon Kim wrote:
> With "detach-all=on" for display, all VCs are detached from the beginning.
> This is useful when there are multiple displays assigned to a guest OS.

Can you elaborate? (i.e. why is it useful? Do you just want to avoid having 
multiple things opened at startup? Or is there a different reason?)

> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
> ---
>   qapi/ui.json | 4 +++-
>   ui/gtk.c     | 7 +++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 1052ca9c38..ff14bb2f46 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1141,6 +1141,7 @@
>   # @show-cursor:   Force showing the mouse cursor (default: off).
>   #                 (since: 5.0)
>   # @gl:            Enable OpenGL support (default: off).
> +# @detach-all:    Detatch all VirtualConsoles from beginning (default: off).

Needs a comment à la "(since: 6.2)" at the end (like the one after 
"show-cursor" some lines earlier.

>   #
>   # Since: 2.12
>   #
> @@ -1150,7 +1151,8 @@
>                   '*full-screen'   : 'bool',
>                   '*window-close'  : 'bool',
>                   '*show-cursor'   : 'bool',
> -                '*gl'            : 'DisplayGLMode' },
> +                '*gl'            : 'DisplayGLMode',
> +                '*detach-all'    : 'bool' },

If this is for GTK only, shouldn't this rather go into DisplayGTK instead? 
Or will this be also useful for other display types later?

  Thomas


>     'discriminator' : 'type',
>     'data'    : { 'gtk'            : 'DisplayGTK',
>                   'curses'         : 'DisplayCurses',
> diff --git a/ui/gtk.c b/ui/gtk.c
> index ce885d2ca3..a07e5a049e 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -2211,6 +2211,7 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
>       GdkDisplay *window_display;
>       GtkIconTheme *theme;
>       char *dir;
> +    int i;
>   
>       if (!gtkinit) {
>           fprintf(stderr, "gtk initialization failed\n");
> @@ -2290,6 +2291,12 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
>           gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
>       }
>       gd_clipboard_init(s);
> +
> +    if (opts->detach_all) {
> +        for (i = 0; i < s->nb_vcs - 1; i++) {
> +            gtk_menu_item_activate(GTK_MENU_ITEM(s->untabify_item));
> +        }
> +    }
>   }
>   
>   static void early_gtk_display_init(DisplayOptions *opts)
> 


