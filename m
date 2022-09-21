Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ED15C01E7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:43:27 +0200 (CEST)
Received: from localhost ([::1]:57966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob1sj-0001Yy-PC
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob1jE-0004cE-MS
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:33:36 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:42613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob1j7-0003DT-H1
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:33:34 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so4018229wmq.1
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 08:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=U/NmrzPW43wWpgiE0FyGU/ncbh8Dcp5gydoNFFDQBZg=;
 b=m/g5QrnghFx1JlXXdEWwbTIv17CdXSUdjzGmuzOuOLkgDg1l/4Rch1pvJvEtXImBUt
 aYy4yPLKmeCVpjSnNkJJykqblpU5G9/IVxPw3JNX5hOF/oLOSFd8tW9SLbi2IZxmYYYX
 CTSxpu51mKlCh9e7eHtiFsVyyzQpu3GeHfyNJ2f8Kbpxu/wCVhpX+CaOGnrjfULZXuzF
 HT/kvXKiLxqZM/kVEAp0Ot8ICqcoRo7n+BMXqVxD6AM6sq9adk5ktDRAoveWAbAN7O0L
 3kL09dcYcW9PRX2DPc2O3J5Ft/PcB0si/GlF7ngPA2kxTF+y3ZTdpnCfd9u77dMS4f/J
 h7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=U/NmrzPW43wWpgiE0FyGU/ncbh8Dcp5gydoNFFDQBZg=;
 b=BI3ugDFFmbtcPNWVOsLERu1sHwj+C1VVfdXIV/WHjvxGksSkvJGAx3VEmlJZuRD3NU
 hufpQfcix/1yt6lGZsaZGcocZLqesjE/122TYBKcjCOJOY5Xka7hnnt1LDOFjtZXmXox
 rlQjFU8Lu/bEx7rKBWPKzmXy4xA7Z9ehwkpbtL1iiwLqsgGe0mypwNB+JI+503FV4DDH
 rew5xUItYOWOkZCQD7mvdm6osDC9Wji/HnWduBTeNBdhQm039/zUfUOBlO8xLER7PpGI
 jFxXMJmCSfsxhdWCWV8JgpsL8vOhqBrrONA3+UoNWjveU4aeIP6aF4DTX+bJacd81Sea
 w7wQ==
X-Gm-Message-State: ACrzQf2LFk0mQNS7kzS5NBv8tHB5a2WlSJ7Io8iBGQ4R/KuKjlRbdiOI
 PGMQvN4LR5xrelfbM+kxE3jdXA==
X-Google-Smtp-Source: AMsMyM4FJPfyCFbmbpDYTc3UWnYgW3FIG3RCxAdWJ+5fWElIpGrapB7A4Yzr4imdb3n2XwDOxVGDXw==
X-Received: by 2002:a05:600c:410d:b0:3b4:9454:f894 with SMTP id
 j13-20020a05600c410d00b003b49454f894mr6210233wmi.111.1663774407651; 
 Wed, 21 Sep 2022 08:33:27 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i29-20020adfa51d000000b0022a53fe201fsm2938128wrb.68.2022.09.21.08.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 08:33:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BBBA61FFB7;
 Wed, 21 Sep 2022 16:33:26 +0100 (BST)
References: <20220901182734.2987337-1-fasano@mit.edu>
 <20220901182734.2987337-5-fasano@mit.edu>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Fasano <fasano@mit.edu>
Cc: qemu-devel@nongnu.org, erdnaxe@crans.org, ma.mandourr@gmail.com
Subject: Re: [RFC 4/4] tcg/plugins: Add example pair of QPP plugins
Date: Wed, 21 Sep 2022 16:22:34 +0100
In-reply-to: <20220901182734.2987337-5-fasano@mit.edu>
Message-ID: <87v8pg68u1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


Andrew Fasano <fasano@mit.edu> writes:

> The first plugin, qpp_srv exposes two functions and one callback that oth=
er
> plugins can leverage. These functions are described in the corresponding
> header file.
>
> The second plugin, qpp_client, imports this header file, registers its
> own function to run on a qpp_srv-provided callback, and directly calls
> into the two exposed functions in qpp_srv.

I'll just sketch out how I would change the API in this example plugin:

>
> Signed-off-by: Andrew Fasano <fasano@mit.edu>
> ---
>  contrib/plugins/Makefile     |  2 ++
>  contrib/plugins/qpp_client.c | 42 ++++++++++++++++++++++++++++++++++++
>  contrib/plugins/qpp_client.h |  1 +
>  contrib/plugins/qpp_srv.c    | 33 ++++++++++++++++++++++++++++
>  contrib/plugins/qpp_srv.h    | 17 +++++++++++++++
>  5 files changed, 95 insertions(+)
>  create mode 100644 contrib/plugins/qpp_client.c
>  create mode 100644 contrib/plugins/qpp_client.h
>  create mode 100644 contrib/plugins/qpp_srv.c
>  create mode 100644 contrib/plugins/qpp_srv.h
>
> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
> index b7720fea0f..b7510de89c 100644
> --- a/contrib/plugins/Makefile
> +++ b/contrib/plugins/Makefile
> @@ -21,6 +21,8 @@ NAMES +=3D lockstep
>  NAMES +=3D hwprofile
>  NAMES +=3D cache
>  NAMES +=3D drcov
> +NAMES +=3D qpp_srv
> +NAMES +=3D qpp_client
>=20=20
>  SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))
>=20=20
> diff --git a/contrib/plugins/qpp_client.c b/contrib/plugins/qpp_client.c
> new file mode 100644
> index 0000000000..de3335e167
> --- /dev/null
> +++ b/contrib/plugins/qpp_client.c
> @@ -0,0 +1,42 @@
> +#include <stdio.h>
> +#include <qemu-plugin.h>
> +#include <plugin-qpp.h>
> +#include <glib.h>
> +#include "qpp_srv.h"
> +
> +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;

QEMU_PLUGIN_EXPORT const char *qemu_plugin_name =3D "qpp_client";
QEMU_PLUGIN_EXPORT const char *qemu_plugin_uses =3D "qpp_server";

> +
> +void my_on_exit(int x, bool b)

void my_on_exit(gpointer evdata, gpointer udata)
{
  struct qpp_exit_event *info =3D (struct qpp_exit_event *) evdata;
  x =3D info->x;
  b =3D info->b;

> +{
> +  g_autoptr(GString) report =3D g_string_new("Client: on_exit runs with =
args: ");
> +  g_string_append_printf(report, "%d, %d\n", x, b);
> +  qemu_plugin_outs(report->str);
> +
> +  g_string_printf(report, "Client: calls qpp_srv's do_add(1): %d\n",
> +                          qpp_srv_do_add(1));
> +  qemu_plugin_outs(report->str);
> +
> +  g_string_printf(report, "Client: calls qpp_srv's do_sub(1): %d\n",
> +                           qpp_srv_do_sub(1));
> +  qemu_plugin_outs(report->str);
> +}
> +
> +
> +QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
> +                   const qemu_info_t *info, int argc, char **argv) {
> +
> +    /*
> +     * Register our "my_on_exit" function to run on the on_exit QPP-call=
back
> +     * exported by qpp_srv
> +     */
> +    QPP_REG_CB("qpp_srv", on_exit, my_on_exit);

   qemu_plugin_register_event_listener("qpp_server", "exit", my_on_exit);

> +
> +    g_autoptr(GString) report =3D g_string_new(CURRENT_PLUGIN ": Call "
> +                                             "qpp_srv's do_add(0) =3D> "=
);
> +    g_string_append_printf(report, "%d\n", qpp_srv_do_add(0));
> +    qemu_plugin_outs(report->str);
> +
> +    g_string_printf(report, "Client: registered on_exit callback\n");
> +    return 0;
> +}
> +
> diff --git a/contrib/plugins/qpp_client.h b/contrib/plugins/qpp_client.h
> new file mode 100644
> index 0000000000..573923f580
> --- /dev/null
> +++ b/contrib/plugins/qpp_client.h
> @@ -0,0 +1 @@
> +void my_on_exit(int, bool);
> diff --git a/contrib/plugins/qpp_srv.c b/contrib/plugins/qpp_srv.c
> new file mode 100644
> index 0000000000..61a6ab38ed
> --- /dev/null
> +++ b/contrib/plugins/qpp_srv.c
> @@ -0,0 +1,33 @@
> +#include <stdio.h>
> +#include <qemu-plugin.h>
> +#include <plugin-qpp.h>
> +#include <gmodule.h>
> +#include "qpp_srv.h"
> +
> +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;

QEMU_PLUGIN_EXPORT const char *qemu_plugin_name =3D "qpp_server";

> +
> +QPP_CREATE_CB(on_exit);

void *on_exit;

> +
> +static void plugin_exit(qemu_plugin_id_t id, void *p)
> +{
> +  qemu_plugin_outs(CURRENT_PLUGIN "exit triggered, running all registere=
d"
> +                  " QPP callbacks\n");
> +  QPP_RUN_CB(on_exit, 0, true);

     struct qpp_exit_event *info =3D g_new0(qpp_exit_event, 1);
     info->x =3D 0;
     info->b =3D true;
     qemu_plugin_trigger_event(on_exit, info);

> +}
> +
> +QEMU_PLUGIN_EXPORT int do_add(int x)

QEMU_PLUGIN_EXPORT int qpp_srv_do_add(int x)

> +{
> +  return x + 1;
> +}
> +
> +QEMU_PLUGIN_EXPORT int do_sub(int x)

QEMU_PLUGIN_EXPORT int qpp_srv_do_sub(int x)

> +{
> +  return x - 1;
> +}
> +
> +QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
> +                   const qemu_info_t *info, int argc, char **argv) {
> +    qemu_plugin_outs("qpp_srv loaded\n");
> +    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
> +    return 0;
> +}
> diff --git a/contrib/plugins/qpp_srv.h b/contrib/plugins/qpp_srv.h
> new file mode 100644
> index 0000000000..ceb26e3d2c
> --- /dev/null
> +++ b/contrib/plugins/qpp_srv.h
> @@ -0,0 +1,17 @@
> +#ifndef QPP_SRV_H
> +#define QPP_SRV_H
> +
> +/*
> + * Prototype for the on_exit callback: callback functions should be
> + * of type `void f(int, bool)`
> + */
> +QPP_CB_PROTOTYPE(void, on_exit, int, bool);

can be dropped.

> +
> +/*
> + * Prototypes for the do_add and do_sub functions. Both return an int and
> + * take an int as an argument.
> + */
> +QPP_FUN_PROTOTYPE(qpp_srv, int, do_add, int);
> +QPP_FUN_PROTOTYPE(qpp_srv, int, do_sub, int);

int qpp_srv_do_add(int);
int qpp_srv_do_sub(int);

the linking is dealt with by loader.

> +
> +#endif /* QPP_SRV_H */


--=20
Alex Benn=C3=A9e

