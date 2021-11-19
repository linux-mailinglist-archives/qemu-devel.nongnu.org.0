Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CD2456BFE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 09:58:49 +0100 (CET)
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnzjM-0002pg-3I
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 03:58:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnzdt-0003R6-68
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 03:53:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnzdr-0000Um-Cr
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 03:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637311985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYO2iWVZf/CmPpLGBP6AASHnGpm6WORgRWXzwqN8w2I=;
 b=LcHmdUwBgnDzYa9wwoUx3ar0uZ37/YIH4lzvahr2bohVIS0/LG7gCqwTOEkbH6pHcFf/aW
 /4/vb7R05b3TFZmgKwil1WdDZ0lpzrCk//lrVHEpgX6OILXLzKcpfsmktpSI/YnRiIARX0
 1mTkN3xmKxepfsSDr2s5Y75gLRGaGtU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-qH7ySHoSO2ySweBjfEQOig-1; Fri, 19 Nov 2021 03:53:04 -0500
X-MC-Unique: qH7ySHoSO2ySweBjfEQOig-1
Received: by mail-wm1-f72.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so4417544wmr.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 00:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FYO2iWVZf/CmPpLGBP6AASHnGpm6WORgRWXzwqN8w2I=;
 b=xHhczoRV5Fmu222HMBp1ks1Q2cTed/B1yHo/qTMHafb9s7KabxRETBePioxrvYCmEc
 hMJk5sUypQblVGHBDBMh5beTotnBCbpv/yh38DfITCnUZbsa2FeM5d3KpDjNqLy2Xn1W
 UjbIWGNBX/VWAC+kVFSCJedkbeivyOkEvAYUrfw5MVjHDqwhWlF1Tv97U39zDrhAAl0G
 m2eFMYUMx+oSXGdX4hCQ5ZJVHZuaRS3U8pR0jxDrbSnWu9fCijKOGSCCKv2P2VYJDHSO
 Q0vyjUfk+U/QdPO80sFRC+Hp8YDLHOc5YQdb9QxNIekvVoo7rO/PbrlDsIwl1DZOAMKf
 oSiA==
X-Gm-Message-State: AOAM531LlwUd/X1Lakika7Qjs3nuEt/7EM+7kJ3WaSCG+OUJy2Y8/E9k
 56VQVld5uIkRQyRLH3UxR0Sjjy9QsCqKApZo9Kbi9rpMYdSjxBEyZOJ27Eh9rTSuVOusSM45Dq9
 stxwGwjgoiVXJt08=
X-Received: by 2002:a7b:c109:: with SMTP id w9mr4837075wmi.114.1637311983226; 
 Fri, 19 Nov 2021 00:53:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzauuW6C3xfNIUKQz8L7b5vUhZVS7ih0VCXco7D6F8Vef5itJk7qRUNRCzhb9nYAScCxsWqMw==
X-Received: by 2002:a7b:c109:: with SMTP id w9mr4837044wmi.114.1637311983040; 
 Fri, 19 Nov 2021 00:53:03 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f19sm15815423wmq.34.2021.11.19.00.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 00:53:02 -0800 (PST)
Message-ID: <7ae6b5a6-9e03-2cc7-0165-1a544584eeb5@redhat.com>
Date: Fri, 19 Nov 2021 09:53:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] ui/gtk: mon_num parameter to specify target monitor for
 launching Qemu
To: Dongwon Kim <dongwon.kim@intel.com>, qemu-devel@nongnu.org
References: <20211118225127.26147-1-dongwon.kim@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211118225127.26147-1-dongwon.kim@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: sweeaun <swee.aun.khor@intel.com>,
 Khairul Anuar Romli <khairul.anuar.romli@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 23:51, Dongwon Kim wrote:
> Introducing a new integer parameter to specify the monitor where the
> Qemu window is placed upon launching.
> 
> Monitor index can start from 0 to (total number of monitors - 1).
> Default value for the parameter is -1, which doesn't affect anything.
> 
> It can be used together with full-screen=on, which will make the Qemu

"QEMU"

> window full-screened on the targetted monitor.

Typo "targeted"

> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Cc: sweeaun <swee.aun.khor@intel.com>
> Cc: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  qapi/ui.json    |  7 ++++++-
>  qemu-options.hx |  2 +-
>  ui/gtk.c        | 10 ++++++++++
>  3 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/ui.json b/qapi/ui.json
> index d7567ac866..7552b503b2 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1099,13 +1099,18 @@
>  #               assuming the guest will resize the display to match
>  #               the window size then.  Otherwise it defaults to "off".
>  #               Since 3.1
> +# @mon-num:     Indicate monitor where Qemu window is lauched. mon-num
> +#               could be any number from -1 to (total num of monitors - 1).
> +#               (default: -1: use default monitor)
> +#               since 6.2

I believe this is 7.0 material now, so "since 7.0".

>  #
>  # Since: 2.12
>  #
>  ##
>  { 'struct'  : 'DisplayGTK',
>    'data'    : { '*grab-on-hover' : 'bool',
> -                '*zoom-to-fit'   : 'bool'  } }
> +                '*zoom-to-fit'   : 'bool',
> +                '*mon-num'       : 'int' } }
>  
>  ##
>  # @DisplayEGLHeadless:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7749f59300..7a888b16b1 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1852,7 +1852,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>  #endif
>  #if defined(CONFIG_GTK)
>      "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
> -    "            [,show-cursor=on|off][,window-close=on|off]\n"
> +    "            [,mon-num=<value>][,show-cursor=on|off][,window-close=on|off]\n"
>  #endif
>  #if defined(CONFIG_VNC)
>      "-display vnc=<display>[,<optargs>]\n"
> diff --git a/ui/gtk.c b/ui/gtk.c
> index d2892ea6b4..8d8aa55822 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -2314,6 +2314,16 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
>                               vc && vc->type == GD_VC_VTE);
>  #endif
>  
> +    if (opts->u.gtk.has_mon_num && opts->u.gtk.mon_num &&
> +        opts->u.gtk.mon_num >= 0) {
> +        GdkRectangle mon_dest;
> +        if (opts->u.gtk.mon_num < gdk_display_get_n_monitors(window_display)) {
> +            gdk_monitor_get_geometry(
> +                gdk_display_get_monitor(window_display, opts->u.gtk.mon_num),
> +                &mon_dest);
> +            gtk_window_move(GTK_WINDOW(s->window), mon_dest.x, mon_dest.y);
> +        }
> +    }
>      if (opts->has_full_screen &&
>          opts->full_screen) {
>          gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
> 


