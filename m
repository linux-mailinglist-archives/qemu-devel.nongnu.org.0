Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F682551129
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 09:14:47 +0200 (CEST)
Received: from localhost ([::1]:55282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3BcU-0008MN-5S
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 03:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3BVE-0002D1-HY
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:07:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3BV9-0006rb-Qj
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655708830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTTpeh6Zi19DpFzM2OvhoYJaHugC/JFEKZYot3L+IR4=;
 b=hYUGxvi9lPmyOoWPyDxNtHkdfa86xd3BeCGupnoJHj+UiCZQf9/vMYauoIWx3GgP6u3/HI
 GESzy4nElycLsBgOaO60G+4L970c4UDAn6DKhCsN/KHyz8uFCf3nOajerIoOwO8JTTxjkx
 vlenunr1ZKOjoEMQo4NLmFGiKqHSruc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-cNYuELPdNpOy5wcvJQGUrw-1; Mon, 20 Jun 2022 03:07:06 -0400
X-MC-Unique: cNYuELPdNpOy5wcvJQGUrw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57B09811E76;
 Mon, 20 Jun 2022 07:07:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1114CC08087;
 Mon, 20 Jun 2022 07:07:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B46C021E688E; Mon, 20 Jun 2022 09:07:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Vivek
 Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v2 2/2] ui/gtk: a new array param monitor to specify the
 target displays
References: <20220615231942.29981-1-dongwon.kim@intel.com>
 <20220615231942.29981-3-dongwon.kim@intel.com>
Date: Mon, 20 Jun 2022 09:07:04 +0200
In-Reply-To: <20220615231942.29981-3-dongwon.kim@intel.com> (Dongwon Kim's
 message of "Wed, 15 Jun 2022 16:19:42 -0700")
Message-ID: <87o7yn6cfb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dongwon Kim <dongwon.kim@intel.com> writes:

> New integer array parameter, 'monitor' is for specifying the target
> displays where individual QEMU windows are placed upon launching.
>
> The array contains a series of numbers representing the monitor where
> QEMU windows are placed.
>
> Numbers in the array are mapped to QEMU windows like,
>
> [1st detached window, 2nd detached window,.... Main window]
>
> Usage example: -display gtk,monitor.0=3D0,monitor.1=3D1.....
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  qapi/ui.json    |  7 ++++++-
>  qemu-options.hx |  2 +-
>  ui/gtk.c        | 32 +++++++++++++++++++++++++++++++-
>  3 files changed, 38 insertions(+), 3 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 413371d5e8..5980f30c7f 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1195,12 +1195,17 @@
>  #               assuming the guest will resize the display to match
>  #               the window size then.  Otherwise it defaults to "off".
>  #               Since 3.1
> +# @monitor:     Array of numbers, each of which represents physical
> +#               monitor where individual QEMU window is placed in case
> +#               there are multiple of them

End you sentence with a period, and ...

> +#               since 7.1

... start the next phrase with a capital letter.

The documentation text feels vague.  Possibly because I lack familiarity
with this part of the user interface.  What are the "individual QEMU
windows"?  How are they numbered?

>  #
>  # Since: 2.12
>  ##
>  { 'struct'  : 'DisplayGTK',
>    'data'    : { '*grab-on-hover' : 'bool',
> -                '*zoom-to-fit'   : 'bool'  } }
> +                '*zoom-to-fit'   : 'bool',
> +                '*monitor'       : ['uint16']  } }
>=20=20
>  ##
>  # @DisplayEGLHeadless:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 377d22fbd8..f79f533e9d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1938,7 +1938,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>  #endif
>  #if defined(CONFIG_GTK)
>      "-display gtk[,full-screen=3Don|off][,gl=3Don|off][,grab-on-hover=3D=
on|off]\n"
> -    "            [,show-cursor=3Don|off][,window-close=3Don|off]\n"
> +    "            [,monitor.<order>=3D<value>][,show-cursor=3Don|off][,wi=
ndow-close=3Don|off]\n"
>  #endif
>  #if defined(CONFIG_VNC)
>      "-display vnc=3D<display>[,<optargs>]\n"
> diff --git a/ui/gtk.c b/ui/gtk.c
> index e6878c3209..fc9bf04680 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -2316,6 +2316,10 @@ static void gtk_display_init(DisplayState *ds, Dis=
playOptions *opts)
>      GtkDisplayState *s =3D g_malloc0(sizeof(*s));
>      GdkDisplay *window_display;
>      GtkIconTheme *theme;
> +    GtkWidget *win;
> +    GdkRectangle dest;
> +    uint16List *mon;
> +    int n_mon;
>      int i;
>      char *dir;
>=20=20
> @@ -2393,7 +2397,33 @@ static void gtk_display_init(DisplayState *ds, Dis=
playOptions *opts)
>              gtk_menu_item_activate(GTK_MENU_ITEM(s->untabify_item));
>          }
>      }
> -    if (opts->has_full_screen &&
> +    if (opts->u.gtk.has_monitor) {
> +        i =3D 0;
> +        n_mon =3D gdk_display_get_n_monitors(window_display);
> +        for (mon =3D opts->u.gtk.monitor; mon; mon =3D mon->next) {
> +            if (mon->value < n_mon) {
> +                for (; i < s->nb_vcs; i++) {
> +                    win =3D s->vc[i].window ? s->vc[i].window : s->windo=
w;
> +                    if (opts->has_full_screen && opts->full_screen) {
> +                        gtk_window_fullscreen_on_monitor(
> +                            GTK_WINDOW(win),
> +                            gdk_display_get_default_screen(window_displa=
y),
> +                            mon->value);
> +                    } else {
> +                        gdk_monitor_get_geometry(
> +                            gdk_display_get_monitor(window_display, mon-=
>value),
> +                            &dest);
> +                        gtk_window_move(GTK_WINDOW(win),
> +                                        dest.x, dest.y);
> +                    }
> +                    i++;
> +                    break;
> +                }

This loop is odd.  It's of the form

                   for (; COND; STEP) {
                       ...
                       break;
                   }

STEP is unreachable.  The whole thing boils down to

                   if (COND) {
                       ....
                   }

doesn't it?

> +            }
> +        }
> +    }
> +    if (!opts->u.gtk.has_monitor &&
> +        opts->has_full_screen &&
>          opts->full_screen) {
>          gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
>      }


This is

       if (COND1) {
           ...
       }
       if (!COND1 && COND2) {
           ...
       }

I'd prefer

       if (COND1) {
           ...
       } else if (COND2) {
           ...
       }


