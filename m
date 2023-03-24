Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E16C8185
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:40:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfjI9-0005NL-KS; Fri, 24 Mar 2023 11:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pfjI7-0005LV-Oe
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:25:19 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pfjI3-0003Sr-L7
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:25:19 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E7F6A337DE;
 Fri, 24 Mar 2023 15:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679671509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nith8pIamhTmDtsuv1rZoelcUzlAFZlv94ChGxaKqrg=;
 b=Jg1TJ/yjcBRsIXXpmfJNZe6eZF+uAAckSvwn4N/RcHvJ1dGbdI37kOVniWIlR2f0oPmUoo
 xm/pcNMMNrGHp2RcG8OsB8z20BlTdrjAxCFzkst6queIpzXHoRH7z51ELzBNgoKBvlJvpg
 k4VfLSZPInpRMu5iFdiryskV06ptjZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679671509;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nith8pIamhTmDtsuv1rZoelcUzlAFZlv94ChGxaKqrg=;
 b=8pQnTt+612/2jMjBTI+c73JpzQJR2TJ1WrRqwHhUpfqr3q7EkvohE1IcM95/0jMa9SKlgi
 VP4ffd4aUGHZmTAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71BFE138ED;
 Fri, 24 Mar 2023 15:25:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rrSPDtXAHWRnawAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 24 Mar 2023 15:25:09 +0000
From: Fabiano Rosas <farosas@suse.de>
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>
Subject: Re: [PULL v2 18/18] ui/dbus: restrict opengl to gbm-enabled config
In-Reply-To: <20230313200134.503083-19-marcandre.lureau@redhat.com>
References: <20230313200134.503083-1-marcandre.lureau@redhat.com>
 <20230313200134.503083-19-marcandre.lureau@redhat.com>
Date: Fri, 24 Mar 2023 12:25:06 -0300
Message-ID: <87bkkijhnx.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> We can enable EGL later for non-GBM hosts.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  ui/dbus-listener.c | 10 +++++-----
>  ui/dbus.c          | 12 +++++++++++-
>  2 files changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
> index 85692f1b27..911acdc529 100644
> --- a/ui/dbus-listener.c
> +++ b/ui/dbus-listener.c
> @@ -50,7 +50,7 @@ struct _DBusDisplayListener {
>=20=20
>  G_DEFINE_TYPE(DBusDisplayListener, dbus_display_listener, G_TYPE_OBJECT)
>=20=20
> -#ifdef CONFIG_OPENGL
> +#ifdef CONFIG_GBM
>  static void dbus_update_gl_cb(GObject *source_object,
>                             GAsyncResult *res,
>                             gpointer user_data)
> @@ -239,7 +239,7 @@ static void dbus_refresh(DisplayChangeListener *dcl)
>      graphic_hw_update(dcl->con);
>  }
>=20=20
> -#ifdef CONFIG_OPENGL
> +#ifdef CONFIG_GBM
>  static void dbus_gl_gfx_update(DisplayChangeListener *dcl,
>                                 int x, int y, int w, int h)
>  {
> @@ -302,7 +302,7 @@ static void dbus_gfx_update(DisplayChangeListener *dc=
l,
>          DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
>  }
>=20=20
> -#ifdef CONFIG_OPENGL
> +#ifdef CONFIG_GBM
>  static void dbus_gl_gfx_switch(DisplayChangeListener *dcl,
>                                 struct DisplaySurface *new_surface)
>  {
> @@ -369,7 +369,7 @@ static void dbus_cursor_define(DisplayChangeListener =
*dcl,
>          NULL);
>  }
>=20=20
> -#ifdef CONFIG_OPENGL
> +#ifdef CONFIG_GBM
>  const DisplayChangeListenerOps dbus_gl_dcl_ops =3D {
>      .dpy_name                =3D "dbus-gl",
>      .dpy_gfx_update          =3D dbus_gl_gfx_update,
> @@ -417,7 +417,7 @@ dbus_display_listener_constructed(GObject *object)
>      DBusDisplayListener *ddl =3D DBUS_DISPLAY_LISTENER(object);
>=20=20
>      ddl->dcl.ops =3D &dbus_dcl_ops;
> -#ifdef CONFIG_OPENGL
> +#ifdef CONFIG_GBM
>      if (display_opengl) {
>          ddl->dcl.ops =3D &dbus_gl_dcl_ops;
>      }
> diff --git a/ui/dbus.c b/ui/dbus.c
> index 904f5a0a6d..0513de9918 100644
> --- a/ui/dbus.c
> +++ b/ui/dbus.c
> @@ -47,8 +47,10 @@ static DBusDisplay *dbus_display;
>  static QEMUGLContext dbus_create_context(DisplayGLCtx *dgc,
>                                           QEMUGLParams *params)
>  {
> +#ifdef CONFIG_GBM
>      eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
>                     qemu_egl_rn_ctx);
> +#endif
>      return qemu_egl_create_context(dgc, params);
>  }
>=20=20
> @@ -56,7 +58,11 @@ static bool
>  dbus_is_compatible_dcl(DisplayGLCtx *dgc,
>                         DisplayChangeListener *dcl)
>  {
> -    return dcl->ops =3D=3D &dbus_gl_dcl_ops || dcl->ops =3D=3D &dbus_con=
sole_dcl_ops;
> +    return
> +#ifdef CONFIG_GBM
> +        dcl->ops =3D=3D &dbus_gl_dcl_ops ||
> +#endif
> +        dcl->ops =3D=3D &dbus_console_dcl_ops;
>  }
>=20=20
>  static void
> @@ -459,7 +465,11 @@ early_dbus_init(DisplayOptions *opts)
>      DisplayGLMode mode =3D opts->has_gl ? opts->gl : DISPLAYGL_MODE_OFF;
>=20=20
>      if (mode !=3D DISPLAYGL_MODE_OFF) {
> +#ifdef CONFIG_OPENGL
>          egl_init(opts->u.dbus.rendernode, mode, &error_fatal);
> +#else
> +        error_report("dbus: GL rendering is not supported");
> +#endif
>      }
>=20=20
>      type_register(&dbus_vc_type_info);

With this patch I get:

FAILED: libcommon.fa.p/ui_dbus-listener.c.o
cc -m64 -mcx16 -Ilibcommon.fa.p -Iui -I../ui -I/usr/include/pixman-1 \
               -I/usr/include/libpng16 -I/usr/include/spice-server \
               -I/usr/include/cacard -I/usr/include/nss3 -I/usr/include/nsp=
r4 -I/usrc
../ui/dbus-listener.c: In function =E2=80=98dbus_call_update_gl=E2=80=99:
../ui/dbus-listener.c:74:5: error: implicit declaration of function =E2=80=
=98glFlush=E2=80=99; did you mean =E2=80=98fflush=E2=80=99? [-Werror=3Dimpl=
icit-function-declaration]
     glFlush();
     ^~~~~~~
     fflush

I don't have libepoxy, only virgl installed. Did we miss something in
meson perhaps?

