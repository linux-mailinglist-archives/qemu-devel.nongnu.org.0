Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0449A6B3BB5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:07:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZe2-0005pQ-SS; Fri, 10 Mar 2023 05:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1paZdz-0005pE-00
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:06:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1paZdx-0006uT-5h
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:06:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678442792;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QowY+D2uLiILv1F+eBxcgLnEyFGHjZ8xsgodpo1ApVs=;
 b=M3hjjUzDHGOPlRgYL2GypO/UeBn4FNFYKNLUZu/rSNNR2wPGbU2e6teE4KkCsoW1XrenfT
 lJxI4xQOG50wiwPGCN9qssg9Z6Z84gAO9Pinkbdb3JbkUSs9m4YP95CEqQk3AyC41WcCtO
 5CgVB8jJJ66JV/ml04p3BGPPa7jnX2Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-bEfZxNNbPRWQFb-UIAQL0Q-1; Fri, 10 Mar 2023 05:06:30 -0500
X-MC-Unique: bEfZxNNbPRWQFb-UIAQL0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0107E101A5B4;
 Fri, 10 Mar 2023 10:06:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7B9F2166B26;
 Fri, 10 Mar 2023 10:06:27 +0000 (UTC)
Date: Fri, 10 Mar 2023 10:06:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 16/18] ui: introduce egl_init()
Message-ID: <ZAsBG9DQp07DuzTL@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
 <20230307115637.2464377-17-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307115637.2464377-17-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 07, 2023 at 03:56:35PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Future patches will introduce EGL support on win32 (too late for 8.0
> though). Having a common place for EGL initialization and error handling
> will make it simpler.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/ui/egl-helpers.h |  2 ++
>  ui/dbus.c                |  7 +------
>  ui/egl-headless.c        | 16 ++++++++--------
>  ui/egl-helpers.c         | 25 +++++++++++++++++++++++++
>  ui/spice-core.c          |  7 +------
>  5 files changed, 37 insertions(+), 20 deletions(-)
> 
> diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
> index c92dd90e33..53d953ddf4 100644
> --- a/include/ui/egl-helpers.h
> +++ b/include/ui/egl-helpers.h
> @@ -65,4 +65,6 @@ int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode);
>  EGLContext qemu_egl_init_ctx(void);
>  bool qemu_egl_has_dmabuf(void);
>  
> +bool egl_init(const char *rendernode, DisplayGLMode mode, Error **errp);
> +
>  #endif /* EGL_HELPERS_H */
> diff --git a/ui/dbus.c b/ui/dbus.c
> index f529928f0b..ebf03bd84d 100644
> --- a/ui/dbus.c
> +++ b/ui/dbus.c
> @@ -451,12 +451,7 @@ early_dbus_init(DisplayOptions *opts)
>      DisplayGLMode mode = opts->has_gl ? opts->gl : DISPLAYGL_MODE_OFF;
>  
>      if (mode != DISPLAYGL_MODE_OFF) {
> -        if (egl_rendernode_init(opts->u.dbus.rendernode, mode) < 0) {
> -            error_report("dbus: render node init failed");
> -            exit(1);
> -        }
> -
> -        display_opengl = 1;
> +        egl_init(opts->u.dbus.rendernode, mode, &error_fatal);
>      }
>  
>      type_register(&dbus_vc_type_info);
> diff --git a/ui/egl-headless.c b/ui/egl-headless.c
> index ae07e91302..ef70e6a18e 100644
> --- a/ui/egl-headless.c
> +++ b/ui/egl-headless.c
> @@ -1,7 +1,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
> -#include "sysemu/sysemu.h"
> +#include "qapi/error.h"
>  #include "ui/console.h"
>  #include "ui/egl-helpers.h"
>  #include "ui/egl-context.h"
> @@ -191,21 +191,21 @@ static const DisplayGLCtxOps eglctx_ops = {
>  
>  static void early_egl_headless_init(DisplayOptions *opts)
>  {
> -    display_opengl = 1;
> +    DisplayGLMode mode = DISPLAYGL_MODE_ON;
> +
> +    if (opts->has_gl) {
> +        mode = opts->gl;
> +    }
> +
> +    egl_init(opts->u.egl_headless.rendernode, mode, &error_fatal);
>  }
>  
>  static void egl_headless_init(DisplayState *ds, DisplayOptions *opts)
>  {
> -    DisplayGLMode mode = opts->has_gl ? opts->gl : DISPLAYGL_MODE_ON;
>      QemuConsole *con;
>      egl_dpy *edpy;
>      int idx;
>  
> -    if (egl_rendernode_init(opts->u.egl_headless.rendernode, mode) < 0) {
> -        error_report("egl: render node init failed");
> -        exit(1);
> -    }
> -
>      for (idx = 0;; idx++) {
>          DisplayGLCtx *ctx;

Why isn't the egl_init() call being made from this egl_headless_init
method, so egl_rendernode_init() is called at the same logical point
as before this change ?


> diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
> index 10772b6471..36b4fc51d9 100644
> --- a/ui/egl-helpers.c
> +++ b/ui/egl-helpers.c
> @@ -19,6 +19,8 @@
>  #include "qemu/error-report.h"
>  #include "ui/console.h"
>  #include "ui/egl-helpers.h"
> +#include "sysemu/sysemu.h"
> +#include "qapi/error.h"
>  
>  EGLDisplay *qemu_egl_display;
>  EGLConfig qemu_egl_config;
> @@ -569,3 +571,26 @@ EGLContext qemu_egl_init_ctx(void)
>  
>      return ectx;
>  }
> +
> +bool egl_init(const char *rendernode, DisplayGLMode mode, Error **errp)
> +{
> +    ERRP_GUARD();
> +
> +    if (mode == DISPLAYGL_MODE_OFF) {
> +        error_setg(errp, "egl: turning off GL doesn't make sense");
> +        return false;
> +    }
> +
> +#ifdef CONFIG_GBM
> +    if (egl_rendernode_init(rendernode, mode) < 0) {
> +        error_setg(errp, "egl: render node init failed");
> +        return false;
> +    }
> +#else
> +    error_setg(errp, "egl: not available on this platform");
> +    return false;
> +#endif
> +
> +    display_opengl = 1;
> +    return true;
> +}

Surely this is going to result in compile errors when !CONFIG_GBM
because these two lines are going to be flagged as unreachable
code, due to the 'return false' in the #else branch.

> diff --git a/ui/spice-core.c b/ui/spice-core.c
> index 76f7c2bc3d..b05c830086 100644
> --- a/ui/spice-core.c
> +++ b/ui/spice-core.c
> @@ -820,12 +820,7 @@ static void qemu_spice_init(void)
>                           "incompatible with -spice port/tls-port");
>              exit(1);
>          }
> -        if (egl_rendernode_init(qemu_opt_get(opts, "rendernode"),
> -                                DISPLAYGL_MODE_ON) != 0) {
> -            error_report("Failed to initialize EGL render node for SPICE GL");
> -            exit(1);
> -        }
> -        display_opengl = 1;
> +        egl_init(qemu_opt_get(opts, "rendernode"), DISPLAYGL_MODE_ON, &error_fatal);
>          spice_opengl = 1;
>      }
>  #endif
> -- 
> 2.39.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


