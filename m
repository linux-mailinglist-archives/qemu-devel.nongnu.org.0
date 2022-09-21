Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9FF5C0019
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:41:32 +0200 (CEST)
Received: from localhost ([::1]:39972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0up-0003y7-Ll
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ob0hC-0000XZ-H9
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:27:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ob0h7-0000mu-B9
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663770439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=97s4p11DurL8eJOBxY9Q/16ramdxkBZJ10V8kdJhjNc=;
 b=ez1x81fWQDQ91en6+Ot4WV6TWSZ1SY5da59lm/bPwTxKfcG8qIcgzOQzrhZOItzrSxnLzR
 4Vi5Cztu+aSGn/1pjbmsNz7hvcd0ZPOEkxRdV/JJcNxBZwYkOne41lqFX245Qgxd2I+3jR
 MkDbH2eVSaS9U+dbJ73uiNAyS3SO04Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-1OTVI89MNjqXnE-zCO39TA-1; Wed, 21 Sep 2022 10:27:16 -0400
X-MC-Unique: 1OTVI89MNjqXnE-zCO39TA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FD353833289;
 Wed, 21 Sep 2022 14:27:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A58DD202E9E0;
 Wed, 21 Sep 2022 14:27:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2ABFA21E6900; Wed, 21 Sep 2022 16:27:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: qemu-devel@nongnu.org,  Dongwon Kim <dongwon.kim@intel.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  =?utf-8?Q?Ma?=
 =?utf-8?Q?rc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 3/3] ui/gtk: Add a new parameter to assign
 connectors/monitors to GFX VCs
References: <20220917000731.465003-1-vivek.kasireddy@intel.com>
 <20220917000731.465003-4-vivek.kasireddy@intel.com>
Date: Wed, 21 Sep 2022 16:27:14 +0200
In-Reply-To: <20220917000731.465003-4-vivek.kasireddy@intel.com> (Vivek
 Kasireddy's message of "Fri, 16 Sep 2022 17:07:31 -0700")
Message-ID: <877d1wby65.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Vivek Kasireddy <vivek.kasireddy@intel.com> writes:

> The new parameter named "connector" can be used to assign physical
> monitors/connectors to individual GFX VCs such that when the monitor
> is connected or hotplugged, the associated GTK window would be
> fullscreened on it. If the monitor is disconnected or unplugged,
> the associated GTK window would be destroyed and a relevant
> disconnect event would be sent to the Guest.
>
> Usage: -device virtio-gpu-pci,max_outputs=3D2,blob=3Dtrue,xres=3D1920,yre=
s=3D1080...
>        -display gtk,gl=3Don,connector.0=3DeDP-1,connector.1=3DDP-1.....
>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  qapi/ui.json    |   9 ++-
>  qemu-options.hx |   1 +
>  ui/gtk.c        | 168 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 177 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 286c5731d1..86787a4c95 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1199,13 +1199,20 @@
>  #               interfaces (e.g. VGA and virtual console character devic=
es)
>  #               by default.
>  #               Since 7.1
> +# @connector:   List of physical monitor/connector names where the GTK w=
indows
> +#               containing the respective graphics virtual consoles (VCs=
) are
> +#               to be placed. If a mapping exists for a VC, it will be
> +#               fullscreened on that specific monitor or else it would n=
ot be
> +#               displayed anywhere and would appear disconnected to the =
guest.

Let's see whether I understand this...  We have VCs numbered 0, 1, ...
VC #i is mapped to the i-th element of @connector, counting from zero.
Correct?

Ignorant question: what's a "physical monitor/connector name"?

Would you mind breaking the lines a bit earlier, between column 70 and
75?

> +#               Since 7.2
>  #
>  # Since: 2.12
>  ##
>  { 'struct'  : 'DisplayGTK',
>    'data'    : { '*grab-on-hover' : 'bool',
>                  '*zoom-to-fit'   : 'bool',
> -                '*show-tabs'     : 'bool'  } }
> +                '*show-tabs'     : 'bool',
> +                '*connector'     : ['str']  } }
>=20=20
>  ##
>  # @DisplayEGLHeadless:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 31c04f7eea..576b65ef9f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1945,6 +1945,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>  #if defined(CONFIG_GTK)
>      "-display gtk[,full-screen=3Don|off][,gl=3Don|off][,grab-on-hover=3D=
on|off]\n"
>      "            [,show-tabs=3Don|off][,show-cursor=3Don|off][,window-cl=
ose=3Don|off]\n"
> +    "            [,connector.<id of VC>=3D<connector name>]\n"

Is "<id of VC>" a VC number?

>  #endif
>  #if defined(CONFIG_VNC)
>      "-display vnc=3D<display>[,<optargs>]\n"

Remainder of my review is on style only.  Style suggestions are not
demands :)

> diff --git a/ui/gtk.c b/ui/gtk.c
> index 945c550909..651aaaf174 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -37,6 +37,7 @@
>  #include "qapi/qapi-commands-misc.h"
>  #include "qemu/cutils.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/option.h"
>=20=20
>  #include "ui/console.h"
>  #include "ui/gtk.h"
> @@ -115,6 +116,7 @@
>  #endif
>=20=20
>  #define HOTKEY_MODIFIERS        (GDK_CONTROL_MASK | GDK_MOD1_MASK)
> +#define MAX_NUM_ATTEMPTS 5

Could use a comment, and maybe a more telling name (this one doesn't
tell me what is being attempted).

>=20=20
>  static const guint16 *keycode_map;
>  static size_t keycode_maplen;
> @@ -126,6 +128,15 @@ struct VCChardev {
>  };
>  typedef struct VCChardev VCChardev;
>=20=20
> +struct gd_monitor_data {
> +    GtkDisplayState *s;
> +    GdkDisplay *dpy;
> +    GdkMonitor *monitor;
> +    QEMUTimer *hp_timer;
> +    int attempt;
> +};
> +typedef struct gd_monitor_data gd_monitor_data;

We usually contract these like

   typedef struct gd_monitor_data {
       ...
   } gd_monitor_data;

> +
>  #define TYPE_CHARDEV_VC "chardev-vc"
>  DECLARE_INSTANCE_CHECKER(VCChardev, VC_CHARDEV,
>                           TYPE_CHARDEV_VC)
> @@ -1385,6 +1396,147 @@ static void gd_menu_untabify(GtkMenuItem *item, v=
oid *opaque)
>      }
>  }
>=20=20
> +static void gd_monitor_fullscreen(GdkDisplay *dpy, VirtualConsole *vc,
> +                                  gint monitor_num)
> +{
> +    GtkDisplayState *s =3D vc->s;
> +
> +    if (!vc->window) {
> +        gd_tab_window_create(vc);
> +    }
> +    gtk_window_fullscreen_on_monitor(GTK_WINDOW(vc->window),
> +                                     gdk_display_get_default_screen(dpy),
> +                                     monitor_num);
> +    s->full_screen =3D TRUE;
> +    gd_update_cursor(vc);
> +}
> +
> +static int gd_monitor_lookup(GdkDisplay *dpy, char *label)
> +{
> +    GdkMonitor *monitor;
> +    const char *monitor_name;
> +    int i, total_monitors;
> +
> +    total_monitors =3D gdk_display_get_n_monitors(dpy);
> +    for (i =3D 0; i < total_monitors; i++) {

Suggest to format like this:

       int total_monitors =3D gdk_display_get_n_monitors(dpy);
       GdkMonitor *monitor;
       const char *monitor_name;
       int i;

       for (i =3D 0; i < total_monitors; i++) {

> +        monitor =3D gdk_display_get_monitor(dpy, i);
> +        if (monitor) {
> +            monitor_name =3D gdk_monitor_get_model(monitor);
> +            if (monitor_name && !strcmp(monitor_name, label)) {

Would

           if (monitor && !g_strcmp0(gdk_monitor_get_model(monitor), label)=
) {

do?

> +                return i;
> +            }
> +        }
> +    }
> +    return -1;
> +}
> +
> +static void gd_monitor_check_vcs(GdkDisplay *dpy, GdkMonitor *monitor,
> +                                 GtkDisplayState *s)
> +{
> +    VirtualConsole *vc;
> +    const char *monitor_name =3D gdk_monitor_get_model(monitor);
> +    int i;
> +
> +    for (i =3D 0; i < s->nb_vcs; i++) {
> +        vc =3D &s->vc[i];
> +        if (!strcmp(vc->label, monitor_name)) {
> +            gd_monitor_fullscreen(dpy, vc, gd_monitor_lookup(dpy, vc->la=
bel));
> +            gd_set_ui_size(vc, surface_width(vc->gfx.ds),
> +                           surface_height(vc->gfx.ds));
> +            break;
> +        }
> +    }
> +}
> +
> +static void gd_monitor_hotplug_timer(void *opaque)
> +{
> +    gd_monitor_data *data =3D opaque;
> +    const char *monitor_name =3D gdk_monitor_get_model(data->monitor);
> +
> +    if (monitor_name) {
> +        gd_monitor_check_vcs(data->dpy, data->monitor, data->s);
> +    }
> +    if (monitor_name || data->attempt =3D=3D MAX_NUM_ATTEMPTS) {
> +        timer_del(data->hp_timer);
> +        g_free(data);
> +    } else {
> +        data->attempt++;
> +        timer_mod(data->hp_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME)=
 + 50);

Suggest to break the line like

           timer_mod(data->hp_timer,
                     qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + 50);

for readability.

> +    }
> +}
> +
> +static void gd_monitor_add(GdkDisplay *dpy, GdkMonitor *monitor,
> +                           void *opaque)
> +{
> +    GtkDisplayState *s =3D opaque;
> +    gd_monitor_data *data;
> +    const char *monitor_name =3D gdk_monitor_get_model(monitor);
> +
> +    if (!monitor_name) {
> +        data =3D g_malloc0(sizeof(*data));
> +        data->s =3D s;
> +        data->dpy =3D dpy;
> +        data->monitor =3D monitor;
> +        data->hp_timer =3D timer_new_ms(QEMU_CLOCK_REALTIME,
> +                                      gd_monitor_hotplug_timer, data);
> +        timer_mod(data->hp_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME)=
 + 50);
> +    } else {
> +        gd_monitor_check_vcs(dpy, monitor, s);
> +    }

Often

       if (cond) {
           do stuff when cond
       } else {
           do stuff when !cond
       }

is easier to read than

       if (!cond) {
           do stuff when !cond
       } else {
           do stuff when !!cond
       }

Give it a thought.

> +}
> +
> +static void gd_monitor_remove(GdkDisplay *dpy, GdkMonitor *monitor,
> +                              void *opaque)
> +{
> +    GtkDisplayState *s =3D opaque;
> +    VirtualConsole *vc;
> +    const char *monitor_name =3D gdk_monitor_get_model(monitor);
> +    int i;
> +
> +    if (!monitor_name) {
> +        return;
> +    }
> +    for (i =3D 0; i < s->nb_vcs; i++) {
> +        vc =3D &s->vc[i];
> +        if (!strcmp(vc->label, monitor_name)) {
> +            gd_tab_window_close(NULL, NULL, vc);
> +            gd_set_ui_size(vc, 0, 0);
> +            break;
> +        }
> +    }
> +}
> +
> +static void gd_connectors_init(GdkDisplay *dpy, GtkDisplayState *s)
> +{
> +    VirtualConsole *vc;
> +    strList *connector =3D s->opts->u.gtk.connector;
> +    gint page_num =3D 0, monitor_num;
> +
> +    gtk_notebook_set_show_tabs(GTK_NOTEBOOK(s->notebook), FALSE);
> +    gtk_widget_hide(s->menu_bar);
> +    for (; connector; connector =3D connector->next) {

Please don't split off part of the loop control.  What about

       for (conn =3D s->opts->u.gtk.connector; conn; conn =3D conn->next) {

?

> +        vc =3D gd_vc_find_by_page(s, page_num);
> +        if (!vc) {
> +            break;
> +        }
> +        if (page_num =3D=3D 0) {
> +            vc->window =3D s->window;
> +        }
> +
> +        g_free(vc->label);
> +        vc->label =3D g_strdup(connector->value);
> +        monitor_num =3D gd_monitor_lookup(dpy, vc->label);
> +        if (monitor_num >=3D 0) {
> +            gd_monitor_fullscreen(dpy, vc, monitor_num);
> +            gd_set_ui_size(vc, surface_width(vc->gfx.ds),
> +                           surface_height(vc->gfx.ds));
> +        } else {
> +            gd_set_ui_size(vc, 0, 0);
> +        }
> +        page_num++;
> +    }
> +}
> +
>  static void gd_menu_show_menubar(GtkMenuItem *item, void *opaque)
>  {
>      GtkDisplayState *s =3D opaque;
> @@ -1705,7 +1857,14 @@ static gboolean gd_configure(GtkWidget *widget,
>                               GdkEventConfigure *cfg, gpointer opaque)
>  {
>      VirtualConsole *vc =3D opaque;
> +    GtkDisplayState *s =3D vc->s;
> +    GtkWidget *parent =3D gtk_widget_get_parent(widget);
>=20=20
> +    if (s->opts->u.gtk.has_connector) {
> +        if (!parent || !GTK_IS_WINDOW(parent)) {
> +            return FALSE;
> +        }
> +    }
>      gd_set_ui_size(vc, cfg->width, cfg->height);
>      return FALSE;
>  }
> @@ -2038,6 +2197,12 @@ static void gd_connect_signals(GtkDisplayState *s)
>                       G_CALLBACK(gd_menu_grab_input), s);
>      g_signal_connect(s->notebook, "switch-page",
>                       G_CALLBACK(gd_change_page), s);
> +    if (s->opts->u.gtk.has_connector) {
> +        g_signal_connect(gtk_widget_get_display(s->window), "monitor-add=
ed",
> +                         G_CALLBACK(gd_monitor_add), s);
> +        g_signal_connect(gtk_widget_get_display(s->window), "monitor-rem=
oved",
> +                         G_CALLBACK(gd_monitor_remove), s);
> +    }
>  }
>=20=20
>  static GtkWidget *gd_create_menu_machine(GtkDisplayState *s)
> @@ -2402,6 +2567,9 @@ static void gtk_display_init(DisplayState *ds, Disp=
layOptions *opts)
>          opts->u.gtk.show_tabs) {
>          gtk_menu_item_activate(GTK_MENU_ITEM(s->show_tabs_item));
>      }
> +    if (s->opts->u.gtk.has_connector) {
> +        gd_connectors_init(window_display, s);
> +    }
>      gd_clipboard_init(s);
>  }


