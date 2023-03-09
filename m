Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1C56B2AA5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:24:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJ42-0001BZ-Ut; Thu, 09 Mar 2023 11:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paJ3t-0001B2-2P
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:24:13 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paJ3q-0001ek-Vi
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:24:12 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l25so2463685wrb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 08:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678379048;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vfk9GtE+PAeLJpXxRT4zcagwOO+V7BH+eCCVdzlN+a8=;
 b=g7Y6HX+DAqOENdLIGmPJQM8la1yzT8l4v0iiDvGjlUerhtuaYcH8qwSkNeJrCDbfjW
 Y34onBg5RmQ+e2jDxVxIFV5KWa92bv5Tx/WmqdW5Sn3MbRINf++GPHvQvYBtu2DBMzjk
 chJLTR8/x3L0mo7UjymfrJQfPKTMs0hfwuZgsInwDdvTyjoQ6Cw+9t3P+tRAmAavO0Ox
 kQYVJZoi7gyC/DqYJs1meEGyujkKYr3KPnDEKDWp4k2R7aW68Peksy/EBXZs/jvjvdEz
 wJ6nOJ9B79vKXxU3g3Y24SJzgYzO3OxbIQeLpd3x27wBSyTq03dt3g5PUx+6MxuSk73I
 6BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678379048;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Vfk9GtE+PAeLJpXxRT4zcagwOO+V7BH+eCCVdzlN+a8=;
 b=arVRy150PicnH6MbhDDmSsdocFat69muwY9jqBb8X3rVn+StnisXv+P+wtZ/4HP+fP
 8Xb0+x+YotfYAN6Fsan4fSLTO7dP4kLMA6G87SpI9tZKFEsog5hAKZxMYDjLgMrQn1sK
 UQ+CJ9f2wJM27JfrV0J1vXzN+TfZT4lvOUW6Ixp2078DGcMuiZhaPEUfBBCIfUndQrFw
 BqEhTPJWx1mmk6feqJIvDRCnUY7o4eXTAW9oKls3N6uLtdn4Z+WHAwH/8lCN+QtObZEW
 gGnc5j8IL+QhSbVhfDJ2TDb8g0ko6dVAdWHBPYZWGhKtAyr7aaH08EKTopiB6H8LoK1S
 S8lw==
X-Gm-Message-State: AO0yUKUqrwYcM7HwG221nDW8gr4KzsodK4c2xcOUKeBHGpqdHXw2eCE6
 lAvKR4pKBTQ6Tpf7t59dkzVzcg==
X-Google-Smtp-Source: AK7set+nJkyaZ0GWJZyM7VSAFHApEJ9Y4t4BpHaz63KXFlEdxvcqO/Z/5k0S3YYQovxEn3YvPfWIiA==
X-Received: by 2002:a5d:4b8a:0:b0:2c9:9b81:11de with SMTP id
 b10-20020a5d4b8a000000b002c99b8111demr16901077wrt.20.1678379047825; 
 Thu, 09 Mar 2023 08:24:07 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a5d658a000000b002c70851fdd8sm18294198wru.75.2023.03.09.08.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 08:24:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2326D1FFB7;
 Thu,  9 Mar 2023 16:24:07 +0000 (GMT)
References: <20221213213757.4123265-1-fasano@mit.edu>
 <20221213213757.4123265-6-fasano@mit.edu>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Fasano <fasano@mit.edu>
Cc: qemu-devel@nongnu.org, elysia.witham@ll.mit.edu, erdnaxe@crans.org,
 ma.mandourr@gmail.com
Subject: Re: [PATCH 5/8] plugins: implement QPP callbacks
Date: Thu, 09 Mar 2023 16:17:05 +0000
In-reply-to: <20221213213757.4123265-6-fasano@mit.edu>
Message-ID: <87ilf9nba0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
> Plugins are able to use API functions which are explained in
> <qemu-plugin.h> to create and run their own callbacks and register
> functions on another plugin's callbacks.
>
> Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
> Signed-off-by: Andrew Fasano <fasano@mit.edu>
> ---
>  include/qemu/qemu-plugin.h   |  46 +++++++++++++++
>  plugins/api.c                | 111 +++++++++++++++++++++++++++++++++++
>  plugins/loader.c             |   1 +
>  plugins/qemu-plugins.symbols |   4 ++
>  4 files changed, 162 insertions(+)
>
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 3ec82ce97f..4221545015 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -354,6 +354,52 @@ size_t qemu_plugin_tb_n_insns(const struct qemu_plug=
in_tb *tb);
>   */
>  uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb);
>=20=20
> +/**
> + * qemu_plugin_create_callback() - create a new cb with given name
> + * @id: unique plugin id
> + * @name: name of cb
> + *
> + * Returns: true on success, false otherwise
> + */
> +bool qemu_plugin_create_callback(qemu_plugin_id_t id, const char *name);
> +
> +/**
> + * qemu_plugin_run_callback() - run all functions registered to cb with =
given
> + * name using given args
> + * @id: unique plugin id
> + * @name: name of cb
> + * @evdata: pointer to evdata struct
> + * @udata: pointer to udata struct
> + *
> + * Returns: true if any registerd functions were run, false otherwise
> + */
> +bool qemu_plugin_run_callback(qemu_plugin_id_t id, const char *name,
> +                              gpointer evdata, gpointer udata);
> +
> +/**
> + * qemu_plugin_reg_callback() - register a function to be called on cb w=
ith
> + * given name
> + * @target_plugin: name of plugin that provides the callback
> + * @cb_name: name of the callback
> + * @function_pointer: pointer to function being registered
> + *
> + * Returns: true if function was registered successfully, false otherwise
> + */
> +bool qemu_plugin_reg_callback(const char *target_plugin, const char *cb_=
name,
> +                              cb_func_t function_pointer);
> +
> +/**
> + * qemu_plugin_unreg_callback() - unregister a function to be called on =
cb
> + * with given name
> + * @target_plugin: name of plugin that provides the callback
> + * @cb_name: name of the callback
> + * @function_pointer: pointer to function being unregistered
> + *
> + * Returns: true if function was unregistered successfully, false otherw=
ise
> + */
> +bool qemu_plugin_unreg_callback(const char *target_plugin, const char *c=
b_name,
> +                                cb_func_t function_pointer);
> +
>  /**
>   * qemu_plugin_tb_get_insn() - retrieve handle for instruction
>   * @tb: opaque handle to TB passed to callback
> diff --git a/plugins/api.c b/plugins/api.c
> index 2078b16edb..1f7ea718dc 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -400,6 +400,117 @@ bool qemu_plugin_bool_parse(const char *name, const=
 char *value, bool *ret)
>      return name && value && qapi_bool_parse(name, value, ret, NULL);
>  }
>=20=20
> +bool qemu_plugin_create_callback(qemu_plugin_id_t id, const char *cb_nam=
e)
> +{
> +    struct qemu_plugin_ctx *ctx =3D plugin_id_to_ctx_locked(id);

c.f. last patch. I see no locking going on here.

> +    if (ctx =3D=3D NULL) {
> +        error_report("Cannot create callback with invalid plugin ID");
> +        return false;
> +    }
> +
> +    if (ctx->version < QPP_MINIMUM_VERSION) {
> +        error_report("Plugin %s cannot create callbacks as its PLUGIN_VE=
RSION"
> +                     " %d is below QPP_MINIMUM_VERSION (%d).",
> +                     ctx->name, ctx->version, QPP_MINIMUM_VERSION);
> +        return false;
> +    }
> +
> +    if (plugin_find_qpp_cb(ctx, cb_name)) {
> +        error_report("Plugin %s already created callback %s", ctx->name,
> +                     cb_name);
> +        return false;
> +    }
> +
> +    plugin_add_qpp_cb(ctx, cb_name);
> +    return true;
> +}
> +
> +bool qemu_plugin_run_callback(qemu_plugin_id_t id, const char *cb_name,
> +                              gpointer evdata, gpointer udata) {
> +    struct qemu_plugin_ctx *ctx =3D plugin_id_to_ctx_locked(id);

Or here.

> +    if (ctx =3D=3D NULL) {
> +        error_report("Cannot run callback with invalid plugin ID");
> +        return false;
> +    }
> +
> +    struct qemu_plugin_qpp_cb *cb =3D plugin_find_qpp_cb(ctx, cb_name);
> +    if (!cb) {
> +        error_report("Can not run previously-unregistered callback %s in=
 "
> +                     "plugin %s", cb_name, ctx->name);
> +        return false;
> +    }
> +
> +    for (int i =3D 0; i < cb->counter; i++) {
> +        cb_func_t qpp_cb_func =3D cb->registered_cb_funcs[i];
> +        qpp_cb_func(evdata, udata);
> +    }
> +
> +    return (cb->registered_cb_funcs[0] !=3D NULL);
> +}
> +
> +bool qemu_plugin_reg_callback(const char *target_plugin, const char *cb_=
name,
> +                              cb_func_t function_pointer) {
> +    struct qemu_plugin_ctx *ctx =3D plugin_name_to_ctx_locked(target_plu=
gin);
> +    if (ctx =3D=3D NULL) {
> +        error_report("Cannot register callback with unknown plugin %s",
> +                     target_plugin);
> +      return false;
> +    }
> +
> +    struct qemu_plugin_qpp_cb *cb =3D plugin_find_qpp_cb(ctx, cb_name);
> +    if (!cb) {
> +        error_report("Cannot register a function to run on callback %s i=
n "
> +                     "plugin %s as that callback does not exist",
> +                     cb_name, target_plugin);
> +        return false;
> +    }
> +
> +    if (cb->counter =3D=3D QEMU_PLUGIN_EV_MAX) {

I'm a little confused why there is a relation to the number of callbacks
QPP can support and the list of qemu callback events.

> +        error_report("The maximum number of allowed callbacks are alread=
y "
> +                     "registered for callback %s in plugin %s",
> +                     cb_name, target_plugin);
> +        return false;
> +    }
> +
> +    cb->registered_cb_funcs[cb->counter] =3D function_pointer;
> +    cb->counter++;
> +    return true;
> +}
> +
> +bool qemu_plugin_unreg_callback(const char *target_plugin, const char *c=
b_name,
> +                              cb_func_t function_pointer) {
> +    struct qemu_plugin_ctx *ctx =3D
> plugin_name_to_ctx_locked(target_plugin);

Locking.

> +    if (ctx =3D=3D NULL) {
> +        error_report("Cannot remove callback function from unknown plugi=
n %s",
> +                     target_plugin);
> +        return false;
> +    }
> +
> +    struct qemu_plugin_qpp_cb *cb =3D plugin_find_qpp_cb(ctx, cb_name);
> +    if (!cb) {
> +        error_report("Cannot remove a function to run on callback %s in "
> +                     "plugin %s as that callback does not exist",
> +                     cb_name, target_plugin);
> +        return false;
> +    }
> +
> +    for (int i =3D 0; i < cb->counter; i++) {
> +        if (cb->registered_cb_funcs[i] =3D=3D function_pointer) {
> +            for (int j =3D i + 1; j < cb->counter; j++) {
> +                cb->registered_cb_funcs[i] =3D cb->registered_cb_funcs[j=
];
> +                i++;
> +            }
> +            cb->registered_cb_funcs[i] =3D NULL;
> +            cb->counter--;
> +            return true;
> +        }
> +    }
> +    error_report("Function to remove not found in registered functions "
> +                 "for callback %s in plugin %s",
> +                 cb_name, target_plugin);
> +    return false;
> +}
> +
>  /*
>   * Binary path, start and end locations
>   */
> diff --git a/plugins/loader.c b/plugins/loader.c
> index ab01d0753c..7f047ebc99 100644
> --- a/plugins/loader.c
> +++ b/plugins/loader.c
> @@ -310,6 +310,7 @@ void plugin_add_qpp_cb(struct qemu_plugin_ctx *ctx, c=
onst char *name)
>      new_cb =3D qemu_memalign(qemu_dcache_linesize, sizeof(*new_cb));
>      memset(new_cb, 0, sizeof(*new_cb));
>      new_cb->name =3D name;
> +    new_cb->counter =3D 0;
>      QTAILQ_INSERT_TAIL(&ctx->qpp_cbs, new_cb, entry);
>  }
>=20=20
> diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
> index 71f6c90549..b7013980cf 100644
> --- a/plugins/qemu-plugins.symbols
> +++ b/plugins/qemu-plugins.symbols
> @@ -3,6 +3,10 @@
>    qemu_plugin_end_code;
>    qemu_plugin_entry_code;
>    qemu_plugin_get_hwaddr;
> +  qemu_plugin_create_callback;
> +  qemu_plugin_run_callback;
> +  qemu_plugin_reg_callback;
> +  qemu_plugin_unreg_callback;
>    qemu_plugin_hwaddr_device_name;
>    qemu_plugin_hwaddr_is_io;
>    qemu_plugin_hwaddr_phys_addr;


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

