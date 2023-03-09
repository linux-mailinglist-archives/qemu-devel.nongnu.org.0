Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1B46B2AD6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:34:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJCs-0007sB-QX; Thu, 09 Mar 2023 11:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paJCZ-0007cD-2G
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:33:11 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paJCW-0003KH-1m
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:33:10 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso1613991wmp.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 08:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678379564;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p1bBQyHP1qZqv4ZaElj4B3aGTQfoQH6riVy8fW+x+gM=;
 b=HFaVtDQg23Ua6CrpF+S0dQ40Y30/mQ3C8Ak844MFJnmjo+w2MaS0R4cP/kL8JohzOs
 1hYsN5BKZr5sIf54/IqwJ/pOgPgjfo8yMgf12fvO8GPY8tinFi+RoVh+F2sFQeYiInxn
 RUjALSfb0H3JygM4Ban/awj9aMh+CescnaXtDDZKkRkb5+Uv5AITZeDeWGf5AT6T+zRh
 56FNFoSpw7ciYc75IZmdQLalTkCZmHVH0N434ZtOGB1pgBopFeXvoJ7jAuAwyHg/MfKd
 5yJnBHg5jyuoM5lGXNrJW0pz3MMIfoew2qvOdOr1P2LqqphFROs5HQofKWYSG/fRHUsA
 SQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678379564;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p1bBQyHP1qZqv4ZaElj4B3aGTQfoQH6riVy8fW+x+gM=;
 b=Bex7b4kik7j7p3Y6u9VdIMnP+v5vuZNV4KsTYKeag1fLerGRs3uqqMICNCw3wfRCDP
 H6dZsX0WlGE+Gi4KR+k1FdAU6AxBJtpWBA6+q9bPY6VonGCCSVNKMhWpgpSp4RA3Tk85
 fXTLZ4HvujKqW0MOBLFUBSs6lt4++PaM9CP2IDrVoRZpeoHRpMnyhDuzSQrtz1o2+viH
 zYNKmiQhJ02Ru6uDBmBLbCqZZTfaMZrIUv/o6GA4Ypn3XBIi5IWlz87FvVg+z1Px7jS4
 eFf1IOTJKQlnP6dQFK2T7tC1FRdKbpauDtIAezy6tEMWJOeUmTaFDA73EO/YsIJ8EEUv
 BQxQ==
X-Gm-Message-State: AO0yUKWt6wlQ0fWEvL64YvHS/+vg937RD9gmS65rbaTnKazYUhfjynfU
 7aGiNyaxtabl1/uoRDDdjm3JNJwV5x6FPtlcn8I=
X-Google-Smtp-Source: AK7set8p+RIXPFc87nghyM+0AtjVebpWXDyvErjgd9V2RJwDZd8bF8EvF0E5JQ/xyI5vqjcL9o7BmQ==
X-Received: by 2002:a05:600c:4f13:b0:3eb:3998:8bca with SMTP id
 l19-20020a05600c4f1300b003eb39988bcamr19308175wmq.17.1678379564423; 
 Thu, 09 Mar 2023 08:32:44 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a05600c355500b003e214803343sm339273wmq.46.2023.03.09.08.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 08:32:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C21AC1FFB7;
 Thu,  9 Mar 2023 16:32:43 +0000 (GMT)
References: <20221213213757.4123265-1-fasano@mit.edu>
 <20221213213757.4123265-7-fasano@mit.edu>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Fasano <fasano@mit.edu>
Cc: qemu-devel@nongnu.org, elysia.witham@ll.mit.edu, erdnaxe@crans.org,
 ma.mandourr@gmail.com
Subject: Re: [PATCH 6/8] plugins: implement QPP import function
Date: Thu, 09 Mar 2023 16:26:29 +0000
In-reply-to: <20221213213757.4123265-7-fasano@mit.edu>
Message-ID: <87edpxnavo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
> Plugins can export functions or import functions from other
> plugins using their name and the function name. This is also
> described in <qemu-plugin.h>.
>
> Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
> Signed-off-by: Andrew Fasano <fasano@mit.edu>
> ---
>  include/qemu/qemu-plugin.h   | 10 ++++++++++
>  plugins/api.c                | 21 +++++++++++++++++++++
>  plugins/qemu-plugins.symbols |  1 +
>  3 files changed, 32 insertions(+)
>
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 4221545015..a0516e9a0e 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -354,6 +354,16 @@ size_t qemu_plugin_tb_n_insns(const struct qemu_plug=
in_tb *tb);
>   */
>  uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb);
>=20=20
> +/**
> + * qemu_plugin_import_function() - return pointer to a function in anoth=
er
> + * plugin
> + * @plugin: plugin name
> + * @function: function name
> + *
> + * Returns: NULL on failure, function pointer on success
> + */
> +gpointer qemu_plugin_import_function(const char *plugin, const char *fun=
ction);
> +
>  /**
>   * qemu_plugin_create_callback() - create a new cb with given name
>   * @id: unique plugin id
> diff --git a/plugins/api.c b/plugins/api.c
> index 1f7ea718dc..a998df6942 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -400,6 +400,27 @@ bool qemu_plugin_bool_parse(const char *name, const =
char *value, bool *ret)
>      return name && value && qapi_bool_parse(name, value, ret, NULL);
>  }
>=20=20
> +/*
> + * QPP: inter-plugin function resolution and callbacks
> + */
> +
> +gpointer qemu_plugin_import_function(const char *target_plugin,
> +                                     const char *function) {
> +    gpointer function_pointer =3D NULL;
> +    struct qemu_plugin_ctx *ctx =3D plugin_name_to_ctx_locked(target_plu=
gin);
> +    if (ctx =3D=3D NULL) {
> +        error_report("Unable to load plugin %s by name", target_plugin);
> +    } else if (g_module_symbol(ctx->handle, function,
> +               (gpointer *)&function_pointer)) {
> +        return function_pointer;
> +    } else {
> +      error_report("function: %s not found in plugin: %s", function,
> +                   target_plugin);
> +    }
> +    abort();
> +    return NULL;

Hmm when does __attribute__ ((constructor)) get called during the
g_module_open() of the plugin? I think aborting is a is a poor failure
mode in this case as you can bring down the whole translator with a poor
plugin load. I'd rather fail gracefully and uninstall the plugin.

> +}
> +
>  bool qemu_plugin_create_callback(qemu_plugin_id_t id, const char *cb_nam=
e)
>  {
>      struct qemu_plugin_ctx *ctx =3D plugin_id_to_ctx_locked(id);
> diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
> index b7013980cf..70a518839d 100644
> --- a/plugins/qemu-plugins.symbols
> +++ b/plugins/qemu-plugins.symbols
> @@ -3,6 +3,7 @@
>    qemu_plugin_end_code;
>    qemu_plugin_entry_code;
>    qemu_plugin_get_hwaddr;
> +  qemu_plugin_import_function;
>    qemu_plugin_create_callback;
>    qemu_plugin_run_callback;
>    qemu_plugin_reg_callback;


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

