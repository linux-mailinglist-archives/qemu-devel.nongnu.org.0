Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1313531130
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:47:53 +0200 (CEST)
Received: from localhost ([::1]:55564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt8PY-0004DZ-Ph
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nt8NY-0003WV-3A
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:45:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nt8NU-0002de-9m
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653313542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/0tOhMIXKn/SJVLqMBN4gc41Nr9kRkiTBt3vIelWHeU=;
 b=OopYwvbLiOLUTrYL4lfi2BIMNO78/MrX7c/biG5beMBU6elWLoQdsN2HkMarM//997DXRm
 PrXlDCKdHsA0v9Vs3PlmIRXvGxcBiI25fwgF6t4j/MdacoUyn0Ifrn8FtkFz6Y9DR6dqhf
 k7iQBVURF+boCYg++u6y183ItYPJpKg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-xsMzD4W8MN6FlC5EXbHQRw-1; Mon, 23 May 2022 09:45:41 -0400
X-MC-Unique: xsMzD4W8MN6FlC5EXbHQRw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41B5B85A5AA
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:45:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2574C53360;
 Mon, 23 May 2022 13:45:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C0A2021E6906; Mon, 23 May 2022 15:45:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Gerd Hoffmann <kraxel@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 2/3] ui: Switch "-display sdl" to use the QAPI parser
References: <20220519155625.1414365-1-thuth@redhat.com>
 <20220519155625.1414365-3-thuth@redhat.com>
Date: Mon, 23 May 2022 15:45:39 +0200
In-Reply-To: <20220519155625.1414365-3-thuth@redhat.com> (Thomas Huth's
 message of "Thu, 19 May 2022 17:56:24 +0200")
Message-ID: <87v8tw7470.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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

Thomas Huth <thuth@redhat.com> writes:

> The "-display sdl" option still uses a hand-crafted parser for its
> parameters since we didn't want to drag an interface we considered
> somewhat flawed into the QAPI schema. Since the flaws are gone now,
> it's time to QAPIfy.
>
> This introduces the new "DisplaySDL" QAPI struct that is used to hold
> the parameters that are unique to the SDL display. The only specific
> parameter is currently "grab-mod" that is used to specify the required
> modifier keys to escape from the mouse grabbing mode.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qapi/ui.json            | 26 ++++++++++++++-
>  include/sysemu/sysemu.h |  2 --
>  softmmu/globals.c       |  2 --
>  softmmu/vl.c            | 70 +----------------------------------------
>  ui/sdl2.c               | 10 ++++++
>  5 files changed, 36 insertions(+), 74 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 11a827d10f..413371d5e8 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1295,6 +1295,29 @@
>        '*swap-opt-cmd': 'bool'
>    } }
>  
> +##
> +# @HotKeyMod:
> +#
> +# Set of modifier keys that need to be held for shortcut key actions.
> +#
> +# Since: 7.1
> +##
> +{ 'enum'  : 'HotKeyMod',
> +  'data'  : [ 'lctrl-lalt', 'lshift-lctrl-lalt', 'rctrl' ] }

I have a somewhat uneasy feeling about encoding what is essentially a
subset of the sets of modifier keys as an enumeration, but it's what we
have to do to QAPIfy existing grab-mod.

> +
> +##
> +# @DisplaySDL:
> +#
> +# SDL2 display options.
> +#
> +# @grab-mod:  Modifier keys that should be pressed together with the
> +#             "G" key to release the mouse grab.
> +#
> +# Since: 7.1
> +##
> +{ 'struct'  : 'DisplaySDL',
> +  'data'    : { '*grab-mod'   : 'HotKeyMod' } }
> +
>  ##
>  # @DisplayType:
>  #
> @@ -1374,7 +1397,8 @@
>        'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
>        'egl-headless': { 'type': 'DisplayEGLHeadless',
>                          'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
> -      'dbus': { 'type': 'DisplayDBus', 'if': 'CONFIG_DBUS_DISPLAY' }
> +      'dbus': { 'type': 'DisplayDBus', 'if': 'CONFIG_DBUS_DISPLAY' },
> +      'sdl': { 'type': 'DisplaySDL', 'if': 'CONFIG_SDL' }
>    }
>  }
>  
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index b4030acd74..812f66a31a 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -42,8 +42,6 @@ extern int graphic_depth;
>  extern int display_opengl;
>  extern const char *keyboard_layout;
>  extern int win2k_install_hack;
> -extern int alt_grab;
> -extern int ctrl_grab;
>  extern int graphic_rotate;
>  extern int old_param;
>  extern uint8_t *boot_splash_filedata;
> diff --git a/softmmu/globals.c b/softmmu/globals.c
> index 916bc12e2b..527edbefdd 100644
> --- a/softmmu/globals.c
> +++ b/softmmu/globals.c
> @@ -50,8 +50,6 @@ QEMUOptionRom option_rom[MAX_OPTION_ROMS];
>  int nb_option_roms;
>  int old_param;
>  const char *qemu_name;
> -int alt_grab;
> -int ctrl_grab;
>  unsigned int nb_prom_envs;
>  const char *prom_envs[MAX_PROM_ENVS];
>  uint8_t *boot_splash_filedata;
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 57ab9d5322..484e9d9921 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1056,75 +1056,7 @@ static void parse_display(const char *p)
>          exit(0);
>      }
>  
> -    if (strstart(p, "sdl", &opts)) {
> -        /*
> -         * sdl DisplayType needs hand-crafted parser instead of
> -         * parse_display_qapi() due to some options not in
> -         * DisplayOptions, specifically:
> -         *   - ctrl_grab + alt_grab
> -         *     They can't be moved into the QAPI since they use underscores,
> -         *     thus they will get replaced by "grab-mod" in the long term
> -         */
> -#if defined(CONFIG_SDL)
> -        dpy.type = DISPLAY_TYPE_SDL;
> -        while (*opts) {
> -            const char *nextopt;
> -
> -            if (strstart(opts, ",grab-mod=", &nextopt)) {
> -                opts = nextopt;
> -                if (strstart(opts, "lshift-lctrl-lalt", &nextopt)) {
> -                    alt_grab = 1;
> -                } else if (strstart(opts, "rctrl", &nextopt)) {
> -                    ctrl_grab = 1;
> -                } else {
> -                    goto invalid_sdl_args;
> -                }
> -            } else if (strstart(opts, ",window-close=", &nextopt)) {
> -                opts = nextopt;
> -                dpy.has_window_close = true;
> -                if (strstart(opts, "on", &nextopt)) {
> -                    dpy.window_close = true;
> -                } else if (strstart(opts, "off", &nextopt)) {
> -                    dpy.window_close = false;
> -                } else {
> -                    goto invalid_sdl_args;
> -                }
> -            } else if (strstart(opts, ",show-cursor=", &nextopt)) {
> -                opts = nextopt;
> -                dpy.has_show_cursor = true;
> -                if (strstart(opts, "on", &nextopt)) {
> -                    dpy.show_cursor = true;
> -                } else if (strstart(opts, "off", &nextopt)) {
> -                    dpy.show_cursor = false;
> -                } else {
> -                    goto invalid_sdl_args;
> -                }
> -            } else if (strstart(opts, ",gl=", &nextopt)) {
> -                opts = nextopt;
> -                dpy.has_gl = true;
> -                if (strstart(opts, "on", &nextopt)) {
> -                    dpy.gl = DISPLAYGL_MODE_ON;
> -                } else if (strstart(opts, "core", &nextopt)) {
> -                    dpy.gl = DISPLAYGL_MODE_CORE;
> -                } else if (strstart(opts, "es", &nextopt)) {
> -                    dpy.gl = DISPLAYGL_MODE_ES;
> -                } else if (strstart(opts, "off", &nextopt)) {
> -                    dpy.gl = DISPLAYGL_MODE_OFF;
> -                } else {
> -                    goto invalid_sdl_args;
> -                }
> -            } else {
> -            invalid_sdl_args:
> -                error_report("invalid SDL option string");
> -                exit(1);
> -            }
> -            opts = nextopt;
> -        }
> -#else
> -        error_report("SDL display supported is not available in this binary");
> -        exit(1);
> -#endif

When CONFIG_SDL is off, the error message changes from

    qemu-system-x86_64: -display sdl: SDL display supported is not available in this binary

to

    qemu-system-x86_64: -display sdl: Parameter 'type' does not accept value 'sdl'

I don't mind, but I'd suggest to mention it in the commit message.

> -    } else if (strstart(p, "vnc", &opts)) {
> +    if (strstart(p, "vnc", &opts)) {
>          /*
>           * vnc isn't a (local) DisplayType but a protocol for remote
>           * display access.
> diff --git a/ui/sdl2.c b/ui/sdl2.c
> index d3741f9b75..8cb77416af 100644
> --- a/ui/sdl2.c
> +++ b/ui/sdl2.c
> @@ -40,6 +40,8 @@ static struct sdl2_console *sdl2_console;
>  
>  static SDL_Surface *guest_sprite_surface;
>  static int gui_grab; /* if true, all keyboard/mouse events are grabbed */
> +static bool alt_grab;
> +static bool ctrl_grab;

I like that these become internal to sdl2.c.

>  
>  static int gui_saved_grab;
>  static int gui_fullscreen;
> @@ -853,6 +855,14 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
>  
>      gui_fullscreen = o->has_full_screen && o->full_screen;
>  
> +    if (o->u.sdl.has_grab_mod) {
> +        if (o->u.sdl.grab_mod == HOT_KEY_MOD_LSHIFT_LCTRL_LALT) {
> +            alt_grab = true;
> +        } else if (o->u.sdl.grab_mod == HOT_KEY_MOD_RCTRL) {
> +            ctrl_grab = true;
> +        }
> +    }
> +
>      for (i = 0;; i++) {
>          QemuConsole *con = qemu_console_lookup_by_index(i);
>          if (!con) {

Reviewed-by: Markus Armbruster <armbru@redhat.com>


