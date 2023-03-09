Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E776B26FE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 15:35:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paHLD-0004M5-Hi; Thu, 09 Mar 2023 09:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paHLA-0004LG-BK
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:33:56 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paHL8-0006ut-7w
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:33:56 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso3739672wmi.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 06:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678372433;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKMJWdUHFMBirrvnff0QPYxqH8hBw5todvarN2LbNy0=;
 b=uBm5Wsrz12fJADz9zlpRQclt0wTAOgJ9Knn8Y07rZioVgbzN5ZbMrYBKKshqckk5Zs
 RZWiuAm79cIzKQ1vrDFcPBNCX4NfWiAPoKhHL7Y3ah9NUZubwYYO20K7ejDhuo5PrXju
 dweDjTEtfn5qETBcpl7cW3zaxI1TbASwCrhvuK/jsk0+taLJLdWFrLO5gxj4nZusBQay
 wd6w0W/Fbw3XleAy7sUs2IUDoNlHPxM5p5nMK18Ap2KMOlD44md/uAs85zV39CP8OEYP
 39OcOHI7KBMTyACDnhCLSzp6QvBD2r4KHaAKvrKF3cdk0UsIHbTm3p6DBp6LrXnLxoYz
 LrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678372433;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tKMJWdUHFMBirrvnff0QPYxqH8hBw5todvarN2LbNy0=;
 b=S0kQk0dI6S1mXnLOHv42dtUKKclJcM2VjOs9LKvLn6uxBwXJ82ZFPPxrr+FzaN1gFp
 PD71lVBsKk+gB9642DNvfMcYveCES3LKeC9HTXZ5xlCTWyZX+qK2S017oq9UvT/HFQFb
 QIuQg5QREuFwfER6soxs7HjHCQj2npenj9+adfH9zfOQEfvAq2cwNd7hpxg2tmDadEIw
 enPC23zSdRhxG1ARxKoXreL43g/+ig0F7Wfu9qLuPWfYbnA5Ax91o6+oEQCz9vgI2xN5
 wPT+AQkAcH2sAUAzRCqJzdrgTsXyZIwf2JxOG1QzPkacCxgPhBgiaRNlWNF+IADTq5Ux
 27ag==
X-Gm-Message-State: AO0yUKUdWNHZYLDNgrIEq60Z+lqkgRYMImcIxDm93QXPgJ6VsA5VlB/b
 /7cYY4SxcoWnHLj04aqdsZYMXw==
X-Google-Smtp-Source: AK7set9QHrsX6St/cy5Fj8m5XTCfe2v0j8qx/msP4f7it3Lo7YRgznRwvMBjMvwfeCRq8CTmJMR9Ow==
X-Received: by 2002:a05:600c:4f4a:b0:3dc:4042:5c21 with SMTP id
 m10-20020a05600c4f4a00b003dc40425c21mr19918478wmq.6.1678372432777; 
 Thu, 09 Mar 2023 06:33:52 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c0b4600b003daf672a616sm26120wmr.22.2023.03.09.06.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:33:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1AE8A1FFB7;
 Thu,  9 Mar 2023 14:33:52 +0000 (GMT)
References: <20221213213757.4123265-1-fasano@mit.edu>
 <20221213213757.4123265-3-fasano@mit.edu>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Fasano <fasano@mit.edu>
Cc: qemu-devel@nongnu.org, elysia.witham@ll.mit.edu, erdnaxe@crans.org,
 ma.mandourr@gmail.com
Subject: Re: [PATCH 2/8] plugins: version 2, require unique plugin names
Date: Thu, 09 Mar 2023 14:17:54 +0000
In-reply-to: <20221213213757.4123265-3-fasano@mit.edu>
Message-ID: <87v8jam1tb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Andrew Fasano <fasano@mit.edu> writes:

> From: Elysia Witham <elysia.witham@ll.mit.edu>
>
> In order for the QPP API to resolve interactions between plugins,
> plugins must export their own names which cannot match any other
> loaded plugins.
>
> Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
> Signed-off-by: Andrew Fasano <fasano@mit.edu>
> ---
>  include/qemu/qemu-plugin.h |  2 +-
>  plugins/core.c             | 12 +++++++++
>  plugins/loader.c           | 50 +++++++++++++++++++++++++++++++++-----
>  plugins/plugin.h           |  7 ++++++
>  tests/plugin/bb.c          |  1 +
>  tests/plugin/empty.c       |  1 +
>  tests/plugin/insn.c        |  1 +
>  tests/plugin/mem.c         |  1 +
>  tests/plugin/syscall.c     |  1 +
>  9 files changed, 69 insertions(+), 7 deletions(-)
>
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index d0e9d03adf..5326f33ce8 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -51,7 +51,7 @@ typedef uint64_t qemu_plugin_id_t;
>=20=20
>  extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
>=20=20
> -#define QEMU_PLUGIN_VERSION 1
> +#define QEMU_PLUGIN_VERSION 2
>=20=20
>  /**
>   * struct qemu_info_t - system information for plugins
> diff --git a/plugins/core.c b/plugins/core.c
> index ccb770a485..5fbdcb5768 100644
> --- a/plugins/core.c
> +++ b/plugins/core.c
> @@ -236,6 +236,18 @@ void qemu_plugin_vcpu_exit_hook(CPUState *cpu)
>      qemu_rec_mutex_unlock(&plugin.lock);
>  }
>=20=20
> +int name_to_plugin_version(const char *name)
> +{
> +    struct qemu_plugin_ctx *ctx;
> +    QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
> +        if (strcmp(ctx->name, name) =3D=3D 0) {
> +            return ctx->version;
> +        }
> +    }
> +    warn_report("Could not find any plugin named %s.", name);
> +    return -1;
> +}
> +

This function seems to be unused.

>  struct plugin_for_each_args {
>      struct qemu_plugin_ctx *ctx;
>      qemu_plugin_vcpu_simple_cb_t cb;
> diff --git a/plugins/loader.c b/plugins/loader.c
> index 88c30bde2d..12c0680e03 100644
> --- a/plugins/loader.c
> +++ b/plugins/loader.c
> @@ -177,7 +177,7 @@ QEMU_DISABLE_CFI
>  static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t =
*info, Error **errp)
>  {
>      qemu_plugin_install_func_t install;
> -    struct qemu_plugin_ctx *ctx;
> +    struct qemu_plugin_ctx *ctx, *ctx2;
>      gpointer sym;
>      int rc;
>=20=20
> @@ -208,17 +208,55 @@ static int plugin_load(struct qemu_plugin_desc *des=
c, const qemu_info_t *info, E
>                     desc->path, g_module_error());
>          goto err_symbol;
>      } else {
> -        int version =3D *(int *)sym;
> -        if (version < QEMU_PLUGIN_MIN_VERSION) {
> +        ctx->version =3D *(int *)sym;
> +        if (ctx->version < QEMU_PLUGIN_MIN_VERSION) {
>              error_setg(errp, "Could not load plugin %s: plugin requires =
API version %d, but "
>                         "this QEMU supports only a minimum version of %d",
> -                       desc->path, version, QEMU_PLUGIN_MIN_VERSION);
> +                       desc->path, ctx->version, QEMU_PLUGIN_MIN_VERSION=
);
>              goto err_symbol;
> -        } else if (version > QEMU_PLUGIN_VERSION) {
> +        } else if (ctx->version > QEMU_PLUGIN_VERSION) {
>              error_setg(errp, "Could not load plugin %s: plugin requires =
API version %d, but "
>                         "this QEMU supports only up to version %d",
> -                       desc->path, version, QEMU_PLUGIN_VERSION);
> +                       desc->path, ctx->version, QEMU_PLUGIN_VERSION);
>              goto err_symbol;
> +        } else if (ctx->version < QPP_MINIMUM_VERSION) {
> +            ctx->name =3D NULL;

A comment wouldn't go amiss here. Something like:

  "Older plugins will not be available for QPP calls".

> +        } else {
> +            if (!g_module_symbol(ctx->handle, "qemu_plugin_name", &sym))=
 {
> +                error_setg(errp, "Could not load plugin %s: plugin does =
not "
> +                           "declare plugin name %s",
> +                           desc->path, g_module_error());
> +                goto err_symbol;
> +            }
> +            ctx->name =3D (const char *)strdup(*(const char **)sym);
> +            QTAILQ_FOREACH(ctx2, &plugin.ctxs, entry) {
> +                if (strcmp(ctx2->name, ctx->name) =3D=3D 0) {
> +                    error_setg(errp, "Could not load plugin %s as the na=
me %s "
> +                               "is already in use by plugin at %s",
> +                               desc->path, ctx->name, ctx2->desc->path);
> +                    goto err_symbol;
> +                }
> +            }
> +            if (g_module_symbol(ctx->handle, "qemu_plugin_uses", &sym)) {
> +                const char **dependencies =3D &(*(const char **)sym);
> +                bool found =3D false;
> +                while (*dependencies) {
> +                    found =3D false;
> +                    QTAILQ_FOREACH(ctx2, &plugin.ctxs, entry) {
> +                        if (strcmp(ctx2->name, *dependencies) =3D=3D 0) {

Lets use glib where we can, in this case g_strcmp0().

> +                            dependencies++;
> +                            found =3D true;
> +                            break;
> +                        }
> +                    }
> +                    if (!found) {
> +                        error_setg(errp, "Could not load plugin %s as it=
 is "
> +                                   "dependent on %s which is not loaded",
> +                                   ctx->name, *dependencies);
> +                        goto err_symbol;
> +                    }

We are implying a load order here which we should document. Ideally we
could avoid it but I suspect that requires too much hoop jumping.

> +                }
> +            }
>          }
>      }
>=20=20
> diff --git a/plugins/plugin.h b/plugins/plugin.h
> index 5eb2fdbc85..ce885bfa98 100644
> --- a/plugins/plugin.h
> +++ b/plugins/plugin.h
> @@ -16,6 +16,7 @@
>  #include "qemu/qht.h"
>=20=20
>  #define QEMU_PLUGIN_MIN_VERSION 0
> +#define QPP_MINIMUM_VERSION 2
>=20=20
>  /* global state */
>  struct qemu_plugin_state {
> @@ -50,6 +51,8 @@ struct qemu_plugin_state {
>  struct qemu_plugin_ctx {
>      GModule *handle;
>      qemu_plugin_id_t id;
> +    const char *name;
> +    int version;
>      struct qemu_plugin_cb *callbacks[QEMU_PLUGIN_EV_MAX];
>      QTAILQ_ENTRY(qemu_plugin_ctx) entry;
>      /*
> @@ -64,6 +67,8 @@ struct qemu_plugin_ctx {
>=20=20
>  struct qemu_plugin_ctx *plugin_id_to_ctx_locked(qemu_plugin_id_t id);
>=20=20
> +struct qemu_plugin_ctx *plugin_name_to_ctx_locked(const char* name);
> +
>  void plugin_register_inline_op(GArray **arr,
>                                 enum qemu_plugin_mem_rw rw,
>                                 enum qemu_plugin_op op, void *ptr,
> @@ -97,4 +102,6 @@ void plugin_register_vcpu_mem_cb(GArray **arr,
>=20=20
>  void exec_inline_op(struct qemu_plugin_dyn_cb *cb);
>=20=20
> +int name_to_plugin_version(const char *name);
> +
>  #endif /* PLUGIN_H */
> diff --git a/tests/plugin/bb.c b/tests/plugin/bb.c
> index 7d470a1011..c04e5aaf90 100644
> --- a/tests/plugin/bb.c
> +++ b/tests/plugin/bb.c
> @@ -15,6 +15,7 @@
>  #include <qemu-plugin.h>
>=20=20
>  QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
> +QEMU_PLUGIN_EXPORT const char *qemu_plugin_name =3D "bb";
>=20=20
>  typedef struct {
>      GMutex lock;
> diff --git a/tests/plugin/empty.c b/tests/plugin/empty.c
> index 8fa6bacd93..0f3d2b92b9 100644
> --- a/tests/plugin/empty.c
> +++ b/tests/plugin/empty.c
> @@ -14,6 +14,7 @@
>  #include <qemu-plugin.h>
>=20=20
>  QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
> +QEMU_PLUGIN_EXPORT const char *qemu_plugin_name =3D "empty";
>=20=20
>  /*
>   * Empty TB translation callback.
> diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
> index cd5ea5d4ae..3f71138139 100644
> --- a/tests/plugin/insn.c
> +++ b/tests/plugin/insn.c
> @@ -15,6 +15,7 @@
>  #include <qemu-plugin.h>
>=20=20
>  QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
> +QEMU_PLUGIN_EXPORT const char *qemu_plugin_name =3D "insn";
>=20=20
>  #define MAX_CPUS 8 /* lets not go nuts */
>=20=20
> diff --git a/tests/plugin/mem.c b/tests/plugin/mem.c
> index 4570f7d815..35e5d7fe2a 100644
> --- a/tests/plugin/mem.c
> +++ b/tests/plugin/mem.c
> @@ -15,6 +15,7 @@
>  #include <qemu-plugin.h>
>=20=20
>  QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
> +QEMU_PLUGIN_EXPORT const char *qemu_plugin_name =3D "mem";
>=20=20
>  static uint64_t inline_mem_count;
>  static uint64_t cb_mem_count;
> diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
> index 96040c578f..922bdbd2e6 100644
> --- a/tests/plugin/syscall.c
> +++ b/tests/plugin/syscall.c
> @@ -15,6 +15,7 @@
>  #include <qemu-plugin.h>
>=20=20
>  QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
> +QEMU_PLUGIN_EXPORT const char *qemu_plugin_name =3D "syscall";
>=20=20
>  typedef struct {
>      int64_t num;

You should update the plugins in contrib/plugins as well.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

