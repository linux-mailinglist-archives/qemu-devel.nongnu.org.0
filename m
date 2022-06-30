Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B07561F1F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 17:21:16 +0200 (CEST)
Received: from localhost ([::1]:38470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6vyk-0006Fp-MU
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 11:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6vxB-0005Uc-Fn
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6vx7-0005fo-Ng
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656602372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3u1qQHvKJ02bdJ2dz9Vl4cMxGG1IO1l0tHOTs6yVAc=;
 b=cteRoI2JD08V83RHB+aM79DjMltZcQCgmUURU09qH+We8ifZTmbsEjGdmYajHIadWLNVlM
 2v8RnajdYbWvA9WyCS/xCgxQcesPnPCEi2Sr1iGooATWgO82V5kXViRNa+QevJ1eCD/OHg
 UGz93K7p0V7cRWOEgx6Jg84AyHZMCGE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-Lh0cNHkxMReU8A8RlCsC8w-1; Thu, 30 Jun 2022 11:19:29 -0400
X-MC-Unique: Lh0cNHkxMReU8A8RlCsC8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0E5018A6534;
 Thu, 30 Jun 2022 15:19:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27403C2810D;
 Thu, 30 Jun 2022 15:19:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B93C021E690D; Thu, 30 Jun 2022 17:19:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Vivek
 Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v3 2/2] ui/gtk: a new array param monitor to specify the
 target displays
References: <20220630005141.16680-1-dongwon.kim@intel.com>
 <20220630005141.16680-3-dongwon.kim@intel.com>
Date: Thu, 30 Jun 2022 17:19:26 +0200
In-Reply-To: <20220630005141.16680-3-dongwon.kim@intel.com> (Dongwon Kim's
 message of "Wed, 29 Jun 2022 17:51:41 -0700")
Message-ID: <87wncy41s1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> monitors where individual GTK windows are placed upon launching.
>
> Monitor numbers in the array are associated with virtual consoles
> in the order of [VC0, VC1, VC2 ... VCn].
>
> Every GTK window containing each VC will be placed in the region
> of corresponding monitors.
>
> Usage: -display gtk,monitor.<id of VC>=3D<target monitor>,..
>        ex)-display gtk,monitor.0=3D1,monitor.1=3D0
>
> v3: - Revised commit message
>     - Rewrote desription of the new parameter (Markus Armbruster)
>     - Replaced unnecessary 'for' loop with 'if' condition
>       (Markus Armbruster)

Again, patch history ...
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---

... goes here.

>  qapi/ui.json    |  9 ++++++++-
>  qemu-options.hx |  3 ++-
>  ui/gtk.c        | 31 +++++++++++++++++++++++++++++--
>  3 files changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 413371d5e8..7b4c098bb4 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1195,12 +1195,19 @@
>  #               assuming the guest will resize the display to match
>  #               the window size then.  Otherwise it defaults to "off".
>  #               Since 3.1
> +# @monitor:     Array of numbers, each of which represents physical
> +#               monitor where GTK window containing a given VC will be
> +#               placed. Each monitor number in the array will be
> +#               associated with a virtual-console starting from VC0.

Drop the hyphen in "virtual-console".

Is the term "virtual console" obvious?  Gerd?

> +#
> +#               since 7.1
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
> index 377d22fbd8..aabdfb0636 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1938,7 +1938,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>  #endif
>  #if defined(CONFIG_GTK)
>      "-display gtk[,full-screen=3Don|off][,gl=3Don|off][,grab-on-hover=3D=
on|off]\n"
> -    "            [,show-cursor=3Don|off][,window-close=3Don|off]\n"
> +    "            [,monitor.<id of VC>=3D<monitor number>][,show-cursor=
=3Don|off]"
> +    "            [,window-close=3Don|off]\n"
>  #endif
>  #if defined(CONFIG_VNC)
>      "-display vnc=3D<display>[,<optargs>]\n"
> diff --git a/ui/gtk.c b/ui/gtk.c
> index e6878c3209..935176e614 100644
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
> @@ -2393,10 +2397,33 @@ static void gtk_display_init(DisplayState *ds, Di=
splayOptions *opts)
>              gtk_menu_item_activate(GTK_MENU_ITEM(s->untabify_item));
>          }
>      }
> -    if (opts->has_full_screen &&
> -        opts->full_screen) {
> +
> +    if (opts->u.gtk.has_monitor) {
> +        i =3D 0;
> +        n_mon =3D gdk_display_get_n_monitors(window_display);
> +        for (mon =3D opts->u.gtk.monitor; mon; mon =3D mon->next) {
> +            if (mon->value < n_mon && i < s->nb_vcs) {
> +                win =3D s->vc[i].window ? s->vc[i].window : s->window;
> +                if (opts->has_full_screen && opts->full_screen) {
> +                    gtk_window_fullscreen_on_monitor(
> +                        GTK_WINDOW(win),
> +                        gdk_display_get_default_screen(window_display),
> +                        mon->value);
> +                } else {
> +                    gdk_monitor_get_geometry(
> +                        gdk_display_get_monitor(window_display, mon->val=
ue),
> +                        &dest);
> +                    gtk_window_move(GTK_WINDOW(win),
> +                                    dest.x, dest.y);
> +                }
> +                i++;
> +            }
> +        }
> +    } else if (opts->has_full_screen &&
> +               opts->full_screen) {

I'd join these two lines, like

       } else if (opts->has_full_screen && opts->full_screen) {

or even exploit the fact that a opts->full_screen is false when absent

       } else if (opts->full_screen) {

>          gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
>      }
> +
>      if (opts->u.gtk.has_grab_on_hover &&
>          opts->u.gtk.grab_on_hover) {
>          gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));


