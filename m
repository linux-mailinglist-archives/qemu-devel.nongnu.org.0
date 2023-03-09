Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9636B2A9A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:17:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paIwS-0005zp-B4; Thu, 09 Mar 2023 11:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paIwP-0005yg-5F
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:16:29 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paIwN-0000YC-3W
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:16:28 -0500
Received: by mail-wr1-x436.google.com with SMTP id t15so2422935wrz.7
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 08:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678378585;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+YRF8lBxBLAxkYFr+0db1pP9UTkXNzoD7W/590JFb8=;
 b=dool0THIdQMPgWi5vcI4JnglXrVXqV6r+TmYtr4JWFKqhyIy9vkMr8x/mQSEqewzN2
 lC8YzkGzDxAvKJGuAP1DXBLTyvREJlFD2THC/dNTw41aaVBHEnHT/oEtv9LndH1srvwu
 I0hep209CpG8kOTcy0FOLP0cFyAyMf4e90bBFV37QDOJM3RbAjLWUqJjc55pSzuIlAvi
 pH+4pmIhlY4x0PDZBFZ938tqVNw3PXkygvMgNBiUFvquH5EplsnToheXFGlQbiPdVo0g
 +6vGBTiF1BTf7RqNPhCjQaYZtudUn+XPUpLYJvskjaapeILiB5x+EJCd8EbCrrJvhQTp
 PC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678378585;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t+YRF8lBxBLAxkYFr+0db1pP9UTkXNzoD7W/590JFb8=;
 b=jTyMWDAGp5O8ihZZgxEqV8lHN7J6OUOtonxX45b54qlH5GaMy1TFtEMErZkq0KpVY6
 H3vPS3r3NSVCAbnCECRPe36SAloHWu8v0CKvMQ9EfrVBqYtK3H2wVk/qj9ztDNuUGBCP
 aAVscplH+TIKtsZJyrXX0r+RqCV9Brxp+hz6jkRKDHtuDTOJ56VIRTGp6F0kVpOrSV4i
 ri8HWXH/jRDx0x7Yf2SuT+bTtBEnK8x6miAc0oKdHYNPuefQR+jaHYhM5+adLJJSEfoX
 75R1jwP0FUujHOHGEN2PTjAeM8ZBx6Txp0CkTGqJvKRaXxJX6vI5iRp7x9y5aLll0ILB
 DS8g==
X-Gm-Message-State: AO0yUKUAD3x3TlyfXWVGfBX6CyKalOuWj3RFJWHjw4VwDU6+A4LPqNJN
 xbm1ENycC2+KggXq59pimMxleQ==
X-Google-Smtp-Source: AK7set8MF9szPlunJBiHAgt0lbN84GPU3W+hbEogv6mhNEgOL+GXwGK13zXmjgI2FxojsQTDxpmQ0w==
X-Received: by 2002:a5d:530d:0:b0:2c5:510b:8f9c with SMTP id
 e13-20020a5d530d000000b002c5510b8f9cmr14377611wrv.52.1678378585510; 
 Thu, 09 Mar 2023 08:16:25 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a5d408e000000b002bfd524255esm18142277wrp.43.2023.03.09.08.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 08:16:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0D4C1FFB7;
 Thu,  9 Mar 2023 16:16:24 +0000 (GMT)
References: <20221213213757.4123265-1-fasano@mit.edu>
 <20221213213757.4123265-5-fasano@mit.edu>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Fasano <fasano@mit.edu>
Cc: qemu-devel@nongnu.org, elysia.witham@ll.mit.edu, erdnaxe@crans.org,
 ma.mandourr@gmail.com
Subject: Re: [PATCH 4/8] plugins: add core API functions for QPP callbacks
Date: Thu, 09 Mar 2023 16:09:40 +0000
In-reply-to: <20221213213757.4123265-5-fasano@mit.edu>
Message-ID: <87mt4lnbmv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
> Plugin callbacks and their registered functions are stored in a
> separate struct which is accessible from the plugin's ctx.
> In order for plugins to use another plugin's callbacks, we have
> internal functions that resolve a plugin's name to its ctx and
> find a target plugin.
>
> Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
> Signed-off-by: Andrew Fasano <fasano@mit.edu>
> ---
>  include/qemu/qemu-plugin.h | 10 ++++++++++
>  plugins/core.c             | 23 +++++++++++++++++++++++
>  plugins/loader.c           | 10 ++++++++++
>  plugins/plugin.h           | 15 +++++++++++++++
>  4 files changed, 58 insertions(+)
>
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 5326f33ce8..3ec82ce97f 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -14,6 +14,7 @@
>  #include <inttypes.h>
>  #include <stdbool.h>
>  #include <stddef.h>
> +#include <gmodule.h>
>=20=20
>  /*
>   * For best performance, build the plugin with -fvisibility=3Dhidden so =
that
> @@ -38,6 +39,15 @@
>   */
>  typedef uint64_t qemu_plugin_id_t;
>=20=20
> +/**
> + * typedef cb_func_t - callback function pointer type
> + * @evdata: plugin callback defined event data
> + * @udata: plugin defined user data
> + *
> + * No return value.
> + */
> +typedef void (*cb_func_t) (gpointer evdata, gpointer udata);
> +
>  /*
>   * Versioning plugins:
>   *
> diff --git a/plugins/core.c b/plugins/core.c
> index 6a50b4a6e6..0415a55ec5 100644
> --- a/plugins/core.c
> +++ b/plugins/core.c
> @@ -236,6 +236,17 @@ void qemu_plugin_vcpu_exit_hook(CPUState *cpu)
>      qemu_rec_mutex_unlock(&plugin.lock);
>  }
>

This looks like another unused function. I was looking to see what
locking was done before calling it as the suffix implies there should be
some.

> +struct qemu_plugin_ctx *plugin_name_to_ctx_locked(const char* name)
> +{
> +    struct qemu_plugin_ctx *ctx;
> +    QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
> +        if (strcmp(ctx->name, name) =3D=3D 0) {
> +            return plugin_id_to_ctx_locked(ctx->id);
> +        }
> +    }
> +    return NULL;
> +}
> +
>  int name_to_plugin_version(const char *name)
>  {
>      struct qemu_plugin_ctx *ctx;
> @@ -260,6 +271,18 @@ const char *id_to_plugin_name(qemu_plugin_id_t id)
>      }
>  }
>

This one too.

> +struct qemu_plugin_qpp_cb *plugin_find_qpp_cb(struct qemu_plugin_ctx *ct=
x,
> +                                              const char *name)
> +{
> +    struct qemu_plugin_qpp_cb *cb;
> +    QTAILQ_FOREACH(cb, &ctx->qpp_cbs, entry) {
> +        if (strcmp(cb->name, name) =3D=3D 0) {
> +            return cb;
> +        }
> +    }
> +    return NULL;
> +}
> +
>  struct plugin_for_each_args {
>      struct qemu_plugin_ctx *ctx;
>      qemu_plugin_vcpu_simple_cb_t cb;
> diff --git a/plugins/loader.c b/plugins/loader.c
> index 12c0680e03..ab01d0753c 100644
> --- a/plugins/loader.c
> +++ b/plugins/loader.c
> @@ -277,6 +277,7 @@ static int plugin_load(struct qemu_plugin_desc *desc,=
 const qemu_info_t *info, E
>              break;
>          }
>      }
> +    QTAILQ_INIT(&ctx->qpp_cbs);
>      QTAILQ_INSERT_TAIL(&plugin.ctxs, ctx, entry);
>      ctx->installing =3D true;
>      rc =3D install(ctx->id, info, desc->argc, desc->argv);
> @@ -303,6 +304,15 @@ static int plugin_load(struct qemu_plugin_desc *desc=
, const qemu_info_t *info, E
>      return 1;
>  }
>=20=20
> +void plugin_add_qpp_cb(struct qemu_plugin_ctx *ctx, const char *name)
> +{
> +    struct qemu_plugin_qpp_cb *new_cb;
> +    new_cb =3D qemu_memalign(qemu_dcache_linesize, sizeof(*new_cb));
> +    memset(new_cb, 0, sizeof(*new_cb));

Is there a reason to do aligned allocation here. Have you measured a
difference between this and a normal g_new0() in performance?

> +    new_cb->name =3D name;
> +    QTAILQ_INSERT_TAIL(&ctx->qpp_cbs, new_cb, entry);
> +}
> +

I think we need some rules for this that can be enforced. Can a plugin
create a cb at any time? Or only during initialisation?

If it's at any time we need some sort of serialisation to prevent races.

>  /* call after having removed @desc from the list */
>  static void plugin_desc_free(struct qemu_plugin_desc *desc)
>  {
> diff --git a/plugins/plugin.h b/plugins/plugin.h
> index 9e710c23a7..fee4741bc6 100644
> --- a/plugins/plugin.h
> +++ b/plugins/plugin.h
> @@ -47,6 +47,14 @@ struct qemu_plugin_state {
>      struct qht dyn_cb_arr_ht;
>  };
>=20=20
> +typedef void (*cb_func_t) (gpointer evdata, gpointer udata);
> +
> +struct qemu_plugin_qpp_cb {
> +    const char *name;
> +    cb_func_t registered_cb_funcs[QEMU_PLUGIN_EV_MAX];
> +    int counter;
> +    QTAILQ_ENTRY(qemu_plugin_qpp_cb) entry;
> +};
>=20=20
>  struct qemu_plugin_ctx {
>      GModule *handle;
> @@ -54,6 +62,7 @@ struct qemu_plugin_ctx {
>      const char *name;
>      int version;
>      struct qemu_plugin_cb *callbacks[QEMU_PLUGIN_EV_MAX];
> +    QTAILQ_HEAD(, qemu_plugin_qpp_cb) qpp_cbs;
>      QTAILQ_ENTRY(qemu_plugin_ctx) entry;
>      /*
>       * keep a reference to @desc until uninstall, so that plugins do not=
 have
> @@ -106,4 +115,10 @@ int name_to_plugin_version(const char *name);
>=20=20
>  const char *id_to_plugin_name(qemu_plugin_id_t id);
>=20=20
> +struct qemu_plugin_qpp_cb *plugin_find_qpp_cb(struct qemu_plugin_ctx *pl=
ugin_ctx,
> +                                              const char *cb_name);
> +
> +/* loader.c */
> +void plugin_add_qpp_cb(struct qemu_plugin_ctx *ctx, const char *name);
> +
>  #endif /* PLUGIN_H */


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

