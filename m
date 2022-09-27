Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381B15EBA74
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:19:23 +0200 (CEST)
Received: from localhost ([::1]:42198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od3w9-00062C-Ln
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1od3pg-0001S7-Hk
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1od3pe-0007Hn-1d
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664259157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zJrHzaxNcnQv0678NgijbMZc++QaPH3ZRBJrAIEU64s=;
 b=OIb4bBhKnGzhyDkF8uCTwcUikzY43/pp7IsL6T4jOzMylkpekYWf8nElar/LlORT/RSzGE
 f3crVFNQGkvPX6MHslIubd+WHHo+egihKQpe7sqU0GN6nCRmhGUIz4mYEg8A5tiV0V0jaQ
 lINC/e2Q1i7jhl6nrHMH3A+jye65zM4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-C5d2GjoFPu2bbtqcpFjKWg-1; Tue, 27 Sep 2022 02:12:31 -0400
X-MC-Unique: C5d2GjoFPu2bbtqcpFjKWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D642B380450B;
 Tue, 27 Sep 2022 06:12:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E1661121314;
 Tue, 27 Sep 2022 06:12:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A880521E691D; Tue, 27 Sep 2022 08:12:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bryce Mills <brycemills@proton.me>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,  Gerd Hoffmann
 <kraxel@redhat.com>
Subject: Re: [PATCH] gtk: Add show_menubar=on|off command line option.
References: <ABCl6OVdH-uJRTTHQW03cUzQV49DpAlfES0YCgGQlOljvmVYqFNQjBKZ0CPNmduU1RWn9iOEiQxYyNQ0BOHw3sv3RKpsXQn2pv4oJIbUZ0Y=@proton.me>
 <875yhabjsu.fsf@pond.sub.org>
 <ed3Bidk-uGSVXI-v3h8LR26iI7f3BERxYImf9TzyAbrZuDzPHTMkiCHqIngRHrFi_HEymvn2WUrgOOufmBczg2I_-9wPfooFbC3Ae0bJTsk=@proton.me>
Date: Tue, 27 Sep 2022 08:12:28 +0200
In-Reply-To: <ed3Bidk-uGSVXI-v3h8LR26iI7f3BERxYImf9TzyAbrZuDzPHTMkiCHqIngRHrFi_HEymvn2WUrgOOufmBczg2I_-9wPfooFbC3Ae0bJTsk=@proton.me>
 (Bryce Mills's message of "Mon, 26 Sep 2022 17:32:13 +0000")
Message-ID: <87sfkdmjlf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please post revisions in a new thread (not in reply to anything), and
with a subject like [PATCH v2].  You can use "git format-patch -v2" to
get such subjects.

Bryce Mills <brycemills@proton.me> writes:

> The patch adds "show_menubar" command line option for GTK UI similar to
> "show_tabs". This option allows to hide menu bar initially, it still can
> be toggled by shortcut and other shortcuts still work.
>
> Signed-off-by: Bryce Mills <brycemills@proton.me>
> ---
>  qapi/ui.json    |  6 +++++-
>  qemu-options.hx |  3 +++
>  ui/gtk.c        | 15 ++++++++++-----
>  3 files changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 286c5731d1..cb252bdf86 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1200,12 +1200,16 @@
>  #               by default.
>  #               Since 7.1
>  #

Drop the blank line, please.

> +# @show-menubar:  Display the main window menubar. Defaults to "on".
> +#                 Since 8.0
> +#
>  # Since: 2.12
>  ##
>  { 'struct'  : 'DisplayGTK',
>    'data'    : { '*grab-on-hover' : 'bool',
>                  '*zoom-to-fit'   : 'bool',
> -                '*show-tabs'     : 'bool'  } }
> +                '*show-tabs'     : 'bool',
> +                '*show-menubar'  : 'bool'  } }
>  
>  ##
>  # @DisplayEGLHeadless:

With that done, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

Two more remarks below.

> diff --git a/qemu-options.hx b/qemu-options.hx
> index d8b5ce5b43..62d3ce10bf 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1947,6 +1947,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>  #if defined(CONFIG_GTK)
>      "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
>      "            [,show-tabs=on|off][,show-cursor=on|off][,window-close=on|off]\n"
> +    "            [,show-menubar=on|off]\n"

Not this patch's fault: help neglects to explain the option parameters.

>  #endif
>  #if defined(CONFIG_VNC)
>      "-display vnc=<display>[,<optargs>]\n"
> @@ -2039,6 +2040,8 @@ SRST
>  
>          ``window-close=on|off`` : Allow to quit qemu with window close button
>  
> +        ``show-menubar=on|off`` : Display then main window menubar
> +

Please specify the default here as well.

>      ``curses[,charset=<encoding>]``
>          Display video output via curses. For graphics device models
>          which support a text mode, QEMU can display this output using a

[...]


