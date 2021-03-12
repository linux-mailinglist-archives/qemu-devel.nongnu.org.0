Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE7E3386B0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 08:43:57 +0100 (CET)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKcSi-0006yc-BA
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 02:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKcRS-0006Gq-LD; Fri, 12 Mar 2021 02:42:38 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:39634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKcRQ-0000uF-Ai; Fri, 12 Mar 2021 02:42:38 -0500
Received: by mail-ed1-x52c.google.com with SMTP id bf3so6581651edb.6;
 Thu, 11 Mar 2021 23:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oLy4LNf9tlkmzXj+a7rj/1tY+Vg5mYF5bo5EBvgRf2Q=;
 b=SMBOh9mjJKeZgzTSSdcLby4FZ1ZAph7m4MrmHhvkv0IaV82ihg6MwBrgL0ClS5pq+c
 DtjlXfnnL4Z7PY9zW/MWn5XFoUy/r2iHJwKSWNev0X7IqOfqHNrnGa4zR389vSfmMKSV
 hSBGM3tirfrtFIT5IE3NPFJZPKE98MOkL9QkvaA0a3MiuZutqUE6XIEfO4RyIBGF9c4x
 j3On+YUHgXOkbRC/X6HZFBwXTVJN8/RFU4zJYtn+SXsdahgFbQwOMRW8SyQ5hVJto+O/
 bugOkR4jSG4rdS0hXDlZQWlB7jmVm/nSkLO4tKiFSMpReaz5f27fttg+eVMTrpjqSMg1
 /yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oLy4LNf9tlkmzXj+a7rj/1tY+Vg5mYF5bo5EBvgRf2Q=;
 b=qUt9TaQ0mLNEQ0/t51Ledle/5MLF031ZHSpi6FgOZjwC5FXyImC2wfSn7m2aLdjrg+
 a1iRIwMkk3p5s0iG1Lw6vk8sTD4QB3fVQDllyNlCcnpVBBnG+WssMilwrbwi9G79oTlk
 qrOnKn5cQc7bWTblJVkAfBrljBEFKF2fe3eFXUAb/s/n7UByr4P48K70gxnpghfabSXu
 9mdsorHvu8gE02EENweA+1uE7YTgYKHXfH1WQSsOPifrvqiWOHfp7dcPFE2VYhMKNabo
 YKKObrb5RSAiHWi/yiinRqojknOSixVCquLjeQoWE1npbXTdvbppGpPqZ9t2qPE6O/f5
 p8GA==
X-Gm-Message-State: AOAM531pnhCd5gScuC4DBSOf7u8kLSNl5vRKSrKQXrDQRvRBm2UlpCNd
 +Z7pk7e+6Lrs33ypYYcF9Amo5g9fX+ani9ndQBI=
X-Google-Smtp-Source: ABdhPJzLLZ+eccinp9PurCOMuWh5atbhfQ4BbHZuxNCZKm+upcb/iX18T1PbBaKjA0iJSbAVKTR4pFUP/+HOHZxTGzQ=
X-Received: by 2002:a05:6402:31b7:: with SMTP id
 dj23mr12835251edb.245.1615534954518; 
 Thu, 11 Mar 2021 23:42:34 -0800 (PST)
MIME-Version: 1.0
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
In-Reply-To: <20210311231202.1536040-2-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 12 Mar 2021 11:42:22 +0400
Message-ID: <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000161b8505bd520b2a"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, "open list:ARM" <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000161b8505bd520b2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 3:14 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerators names.
>
> - Accelerator is an QAPI enum of all existing accelerators,
>
> - AcceleratorInfo is a QAPI structure providing accelerator
>   specific information. Currently the common structure base
>   provides the name of the accelerator, while the specific
>   part is empty, but each accelerator can expand it.
>
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>
> For example on a KVM-only build we get:
>
>     { "execute": "query-accels" }
>     {
>         "return": [
>             {
>                 "type": "qtest"
>             },
>             {
>                 "type": "kvm"
>             }
>

s/type/name (in this version)

        ]
>     }
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  qapi/machine.json | 55 +++++++++++++++++++++++++++++++++++++++++++++++
>  accel/accel-qmp.c | 47 ++++++++++++++++++++++++++++++++++++++++
>  accel/meson.build |  2 +-
>  3 files changed, 103 insertions(+), 1 deletion(-)
>  create mode 100644 accel/accel-qmp.c
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 330189efe3d..ffbf28e5d50 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1471,3 +1471,58 @@
>  ##
>  { 'event': 'MEM_UNPLUG_ERROR',
>    'data': { 'device': 'str', 'msg': 'str' } }
> +
> +##
> +# @Accelerator:
> +#
> +# An enumeration of accelerator names.
> +#
> +# Since: 6.0
> +##
> +{ 'enum': 'Accelerator',
> +  'data': [ { 'name': 'qtest' },
> +            { 'name': 'tcg' },
> +            { 'name': 'kvm' },
> +            { 'name': 'hax' },
> +            { 'name': 'hvf' },
> +            { 'name': 'whpx' },
> +            { 'name': 'xen' } ] }
> +
>

Why not use a simple enum?

+##
> +# @AcceleratorInfo:
> +#
> +# Accelerator information.
> +#
> +# @name: The accelerator name.
> +#
> +# Since: 6.0
> +##
> +{ 'union': 'AcceleratorInfo',
> +  'base': {'name': 'Accelerator'},
> +  'discriminator': 'name',
> +  'data': { } }
>
+
>

Making room for future details, why not.

+##
> +# @query-accels:
> +#
> +# Get a list of AcceleratorInfo for all built-in accelerators.
> +#
> +# Returns: a list of @AcceleratorInfo describing each accelerator.
> +#
> +# Since: 6.0
> +#
> +# Example:
> +#
> +# -> { "execute": "query-accels" }
> +# <- { "return": [
> +#        {
> +#            "type": "qtest"
> +#        },
> +#        {
> +#            "type": "kvm"
> +#        }
> +#    ] }
> +#
> +##
> +{ 'command': 'query-accels',
> +  'returns': ['AcceleratorInfo'] }
>

That's nice, but how do you know which accels are actually enabled?

diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
> new file mode 100644
> index 00000000000..f16e49b8956
> --- /dev/null
> +++ b/accel/accel-qmp.c
> @@ -0,0 +1,47 @@
> +/*
> + * QEMU accelerators, QMP commands
> + *
> + * Copyright (c) 2021 Red Hat Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/qapi-commands-machine.h"
> +
> +static const Accelerator accel_list[] =3D {
> +    ACCELERATOR_QTEST,
> +#ifdef CONFIG_TCG
> +    ACCELERATOR_TCG,
> +#endif
> +#ifdef CONFIG_KVM
> +    ACCELERATOR_KVM,
> +#endif
> +#ifdef CONFIG_HAX
> +    ACCELERATOR_HAX,
> +#endif
> +#ifdef CONFIG_HVF
> +    ACCELERATOR_HVF,
> +#endif
> +#ifdef CONFIG_WHPX
> +    ACCELERATOR_WHPX,
> +#endif
> +#ifdef CONFIG_XEN_BACKEND
> +    ACCELERATOR_XEN,
> +#endif
> +};
> +
> +AcceleratorInfoList *qmp_query_accels(Error **errp)
> +{
> +    AcceleratorInfoList *list =3D NULL, **tail =3D &list;
> +
> +    for (unsigned i =3D 0; i < ARRAY_SIZE(accel_list); i++) {
> +        AcceleratorInfo *info =3D g_new0(AcceleratorInfo, 1);
> +
> +        info->name =3D accel_list[i];
> +
> +        QAPI_LIST_APPEND(tail, info);
> +    }
> +
> +    return list;
> +}
> diff --git a/accel/meson.build b/accel/meson.build
> index b44ba30c864..7a48f6d568d 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -1,4 +1,4 @@
> -specific_ss.add(files('accel-common.c'))
> +specific_ss.add(files('accel-common.c', 'accel-qmp.c'))
>  softmmu_ss.add(files('accel-softmmu.c'))
>  user_ss.add(files('accel-user.c'))
>
> --
> 2.26.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000161b8505bd520b2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 12, 2021 at 3:14 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Introduce the &#39;query-accels&#39; QMP command which returns a list=
<br>
of built-in accelerators names.<br>
<br>
- Accelerator is an QAPI enum of all existing accelerators,<br>
<br>
- AcceleratorInfo is a QAPI structure providing accelerator<br>
=C2=A0 specific information. Currently the common structure base<br>
=C2=A0 provides the name of the accelerator, while the specific<br>
=C2=A0 part is empty, but each accelerator can expand it.<br>
<br>
- &#39;query-accels&#39; QMP command returns a list of @AcceleratorInfo<br>
<br>
For example on a KVM-only build we get:<br>
<br>
=C2=A0 =C2=A0 { &quot;execute&quot;: &quot;query-accels&quot; }<br>
=C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;return&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &=
quot;qtest&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &=
quot;kvm&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div>=
<div>s/type/name (in this version)<br></div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
=C2=A0 =C2=A0 }<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0qapi/machine.json | 55 ++++++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0accel/accel-qmp.c | 47 ++++++++++++++++++++++++++++++++++++++++<br>
=C2=A0accel/meson.build |=C2=A0 2 +-<br>
=C2=A03 files changed, 103 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 accel/accel-qmp.c<br>
<br>
diff --git a/qapi/machine.json b/qapi/machine.json<br>
index 330189efe3d..ffbf28e5d50 100644<br>
--- a/qapi/machine.json<br>
+++ b/qapi/machine.json<br>
@@ -1471,3 +1471,58 @@<br>
=C2=A0##<br>
=C2=A0{ &#39;event&#39;: &#39;MEM_UNPLUG_ERROR&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;device&#39;: &#39;str&#39;, &#39;msg&#3=
9;: &#39;str&#39; } }<br>
+<br>
+##<br>
+# @Accelerator:<br>
+#<br>
+# An enumeration of accelerator names.<br>
+#<br>
+# Since: 6.0<br>
+##<br>
+{ &#39;enum&#39;: &#39;Accelerator&#39;,<br>
+=C2=A0 &#39;data&#39;: [ { &#39;name&#39;: &#39;qtest&#39; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;tcg&#39; =
},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;kvm&#39; =
},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;hax&#39; =
},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;hvf&#39; =
},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;whpx&#39;=
 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;xen&#39; =
} ] }<br>
+<br></blockquote><div><br></div><div>Why not use a simple enum?<br></div><=
div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+##<br>
+# @AcceleratorInfo:<br>
+#<br>
+# Accelerator information.<br>
+#<br>
+# @name: The accelerator name.<br>
+#<br>
+# Since: 6.0<br>
+##<br>
+{ &#39;union&#39;: &#39;AcceleratorInfo&#39;,<br>
+=C2=A0 &#39;base&#39;: {&#39;name&#39;: &#39;Accelerator&#39;},<br>
+=C2=A0 &#39;discriminator&#39;: &#39;name&#39;,<br>
+=C2=A0 &#39;data&#39;: { } }<br></blockquote><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
+<br></blockquote><div><br></div><div>Making room for future details, why n=
ot.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+##<br>
+# @query-accels:<br>
+#<br>
+# Get a list of AcceleratorInfo for all built-in accelerators.<br>
+#<br>
+# Returns: a list of @AcceleratorInfo describing each accelerator.<br>
+#<br>
+# Since: 6.0<br>
+#<br>
+# Example:<br>
+#<br>
+# -&gt; { &quot;execute&quot;: &quot;query-accels&quot; }<br>
+# &lt;- { &quot;return&quot;: [<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;qtest&q=
uot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;kvm&quo=
t;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+#=C2=A0 =C2=A0 ] }<br>
+#<br>
+##<br>
+{ &#39;command&#39;: &#39;query-accels&#39;,<br>
+=C2=A0 &#39;returns&#39;: [&#39;AcceleratorInfo&#39;] }<br></blockquote><d=
iv><br></div><div>That&#39;s nice, but how do you know which accels are act=
ually enabled?</div><div> <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c<br>
new file mode 100644<br>
index 00000000000..f16e49b8956<br>
--- /dev/null<br>
+++ b/accel/accel-qmp.c<br>
@@ -0,0 +1,47 @@<br>
+/*<br>
+ * QEMU accelerators, QMP commands<br>
+ *<br>
+ * Copyright (c) 2021 Red Hat Inc.<br>
+ *<br>
+ * SPDX-License-Identifier: GPL-2.0-or-later<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/qapi-commands-machine.h&quot;<br>
+<br>
+static const Accelerator accel_list[] =3D {<br>
+=C2=A0 =C2=A0 ACCELERATOR_QTEST,<br>
+#ifdef CONFIG_TCG<br>
+=C2=A0 =C2=A0 ACCELERATOR_TCG,<br>
+#endif<br>
+#ifdef CONFIG_KVM<br>
+=C2=A0 =C2=A0 ACCELERATOR_KVM,<br>
+#endif<br>
+#ifdef CONFIG_HAX<br>
+=C2=A0 =C2=A0 ACCELERATOR_HAX,<br>
+#endif<br>
+#ifdef CONFIG_HVF<br>
+=C2=A0 =C2=A0 ACCELERATOR_HVF,<br>
+#endif<br>
+#ifdef CONFIG_WHPX<br>
+=C2=A0 =C2=A0 ACCELERATOR_WHPX,<br>
+#endif<br>
+#ifdef CONFIG_XEN_BACKEND<br>
+=C2=A0 =C2=A0 ACCELERATOR_XEN,<br>
+#endif<br>
+};<br>
+<br>
+AcceleratorInfoList *qmp_query_accels(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 AcceleratorInfoList *list =3D NULL, **tail =3D &amp;list;<br=
>
+<br>
+=C2=A0 =C2=A0 for (unsigned i =3D 0; i &lt; ARRAY_SIZE(accel_list); i++) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AcceleratorInfo *info =3D g_new0(AcceleratorIn=
fo, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;name =3D accel_list[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, info);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return list;<br>
+}<br>
diff --git a/accel/meson.build b/accel/meson.build<br>
index b44ba30c864..7a48f6d568d 100644<br>
--- a/accel/meson.build<br>
+++ b/accel/meson.build<br>
@@ -1,4 +1,4 @@<br>
-specific_ss.add(files(&#39;accel-common.c&#39;))<br>
+specific_ss.add(files(&#39;accel-common.c&#39;, &#39;accel-qmp.c&#39;))<br=
>
=C2=A0softmmu_ss.add(files(&#39;accel-softmmu.c&#39;))<br>
=C2=A0user_ss.add(files(&#39;accel-user.c&#39;))<br>
<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000161b8505bd520b2a--

