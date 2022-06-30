Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC005561CB9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 16:11:59 +0200 (CEST)
Received: from localhost ([::1]:34014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6utg-0003SA-Oc
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 10:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o6urj-0002I8-K0
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 10:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o6urf-0002xh-Cu
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 10:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656598190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/kOviXNB3SZaZsP+Y2mq9vi67/rftEmOYH0GOP981I=;
 b=ERRluguNhoJMMZ6U8Lgj9rlVNzlxAkjMkdcnio+Rr/47L1iZ2erE9VvkGP0wD2g2y9awri
 gO1XKuatACa2iu1nYGUy1mvmG+IqMqgqWGgzaOfLDHt26JtOqx9hFSbbbgpFtnbp6rWAMM
 cXH5t5Jde61cpY3LueFKWuv4p+Orv4U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-1PCxSSY5P12TuE2xE-gXlw-1; Thu, 30 Jun 2022 10:09:48 -0400
X-MC-Unique: 1PCxSSY5P12TuE2xE-gXlw-1
Received: by mail-ed1-f69.google.com with SMTP id
 r12-20020a05640251cc00b00435afb01d7fso14389508edd.18
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 07:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b/kOviXNB3SZaZsP+Y2mq9vi67/rftEmOYH0GOP981I=;
 b=WmW62w1al2vhTYjnip4X3mf2jnaVaRUJBTjitfpTKwz0TFRaRCOrlsHBx7i8uMfP8F
 SEv1zmo5AIy4dxaCDM4Qx00ZajtOivwDXzPTfHRmWLLGlrnsXS1vMo6V9ifIECoH2oGQ
 xjak38kzIuHmiCrCuqse4hhKuvRhxW5GaapjdLN+eraheaJKtUHH1+a8gR0ts6Ne46w8
 aFUoG21v9En/5l/FCAk5AdluaS6y+oEWt/g9w1FTZ6Qv8U4q/19IdMSZyJMS8eb+u0nf
 c2BknORiCNTgnNt3iDpt1V+K1lZnxK2RCGeduVaB+eg1K1qYAnbgela49kue5v8APD1f
 Wrig==
X-Gm-Message-State: AJIora9oDi12gD8EB3DUlGW+dWsa3n+i/XCJ3fEMCTkBNMwmLhi0kVzZ
 cvkr1xiYWZIh2y6Bk7mo8UMX8x9ox6XUZB2as8lni01HHjyFN9La0vw4ON5X/JMtByB1GWQFj4L
 Q0ldG76hVjdomahg=
X-Received: by 2002:a05:6402:3487:b0:435:b0d2:606e with SMTP id
 v7-20020a056402348700b00435b0d2606emr12197205edc.66.1656598186636; 
 Thu, 30 Jun 2022 07:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uiqmrCLVVrtuXjgzHdXQDdAJTKtrmohaOEfqonTJmE+7LAewefF7hceMMnWnfZ+iamTHfB3Q==
X-Received: by 2002:a05:6402:3487:b0:435:b0d2:606e with SMTP id
 v7-20020a056402348700b00435b0d2606emr12197180edc.66.1656598186439; 
 Thu, 30 Jun 2022 07:09:46 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 ml22-20020a170906cc1600b006febce7081bsm9168772ejb.163.2022.06.30.07.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 07:09:45 -0700 (PDT)
Message-ID: <b7546847-d46a-b62c-f5ff-bd851a8e6ebc@redhat.com>
Date: Thu, 30 Jun 2022 16:09:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] gtk: Add show_tabs=on|off command line option.
Content-Language: en-US
To: =?UTF-8?Q?Felix_xq_Quei=c3=9fner?= <xq@random-projects.net>,
 qemu-devel@nongnu.org
Cc: kraxel@redhat.com, thuth@redhat.com
References: <20220627164404.12137-1-xq@random-projects.net>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220627164404.12137-1-xq@random-projects.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

(Thanks for the patch!)

On 27.06.22 18:44, Felix xq Queißner wrote:
> The patch adds "show_tabs" command line option for GTK ui similar to "grab_on_hover". This option allows tabbed view mode to not have to be enabled by hand at each start of the VM.

I’m not sure we have a hard rule on it, but I think generally commit 
messages should be wrapped at 72 characters.

> Signed-off-by: Felix "xq" Queißner <xq@random-projects.net>
> ---
>   qapi/ui.json    | 5 ++++-
>   qemu-options.hx | 2 +-
>   ui/gtk.c        | 4 ++++
>   3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 413371d5e8..049e7957a9 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1195,12 +1195,15 @@
>   #               assuming the guest will resize the display to match
>   #               the window size then.  Otherwise it defaults to "off".
>   #               Since 3.1
> +# @show-tabs:   Displays the tab items by default.
> +#               Since 7.1

I don’t really understand what “tab items” is supposed to mean. Perhaps 
“tabs item”?

But a bit more verbosity might be nice, too.  What about “Display the 
tab bar for switching between the various graphical interfaces (e.g. VGA 
and virtual console character devices) by default”?  (Note the 
imperative on “Display”, I think we generally use the imperative to 
document options.)

>   #
>   # Since: 2.12
>   ##
>   { 'struct'  : 'DisplayGTK',
>     'data'    : { '*grab-on-hover' : 'bool',
> -                '*zoom-to-fit'   : 'bool'  } }
> +                '*zoom-to-fit'   : 'bool',
> +                '*show-tabs'     : 'bool'  } }
>   
>   ##
>   # @DisplayEGLHeadless:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 377d22fbd8..2b279afff7 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1937,7 +1937,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>       "            [,window-close=on|off]\n"
>   #endif
>   #if defined(CONFIG_GTK)
> -    "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
> +    "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off][,show-tabs=on|off]\n"
>       "            [,show-cursor=on|off][,window-close=on|off]\n"

There is some documentation further below that explains the other 
options.  I think this new option should be explained there as well.  
(Probably reusing the documentation from qapi/ui.json.)

>   #endif
>   #if defined(CONFIG_VNC)
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 2a791dd2aa..1467b8c7d7 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -2390,6 +2390,10 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
>           opts->u.gtk.grab_on_hover) {
>           gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
>       }
> +    if (opts->u.gtk.has_show_tabs &&
> +        opts->u.gtk.show_tabs) {
> +        gtk_menu_item_activate(GTK_MENU_ITEM(s->show_tabs_item));
> +    }
>       gd_clipboard_init(s);
>   }

Not that I’d know any of this code, but FWIW, makes sense and looks good 
to me.

Thanks!

Hanna


