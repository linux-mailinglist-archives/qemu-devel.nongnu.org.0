Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383CE2C9799
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 07:41:09 +0100 (CET)
Received: from localhost ([::1]:54906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjzLY-0006fw-9E
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 01:41:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kjzIp-0005l8-2L
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 01:38:19 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:46756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kjzIm-0005lh-QZ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 01:38:18 -0500
Received: by mail-ed1-x544.google.com with SMTP id b2so1465736edy.13
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 22:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IcaK1k9vWL279nO8ZCLXQ3aRQiZ4ZR/s4kb0Kv4+h5I=;
 b=J/sY8Wz/9+/fZogBHIhK+euZQANeyDS/c+4fNpXntL3exuNaE90rTVHxJ9Uc6TupDn
 757R79R6O+VeClJR/4wE9ZXI/GDkjfjYq4uAzfDec070Qpx65ue5uNjNqKjsAZj+Zpc+
 ri3BvX/vpaKwFzuu+UGp8RPhpnTHGVBEJirF6lBUOqr0U/PBvh75AEm6dEuGW9jqfIpo
 h0QphDMNrgaQgDyFGxc8Z7k4bVAbMIJg1+DtWjA77o2ZrYcQ3DdWHxPzB8Tu5diRTpiy
 rGnPLpVNTCib10pfnLZYtDGl6nZXxAAujhTtAmnc8EssF2/EmEkscvJiZ/xCpLKDnDtD
 kmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IcaK1k9vWL279nO8ZCLXQ3aRQiZ4ZR/s4kb0Kv4+h5I=;
 b=VTxcjXEZaoHw1giO4CZIcIpY4GtGG3PeARSVzX5zI7ZUM8+FEUIzZOznU9Avt7kXzT
 OH7fbBhqC9mxyofPZfoWNylkVUs7I5RCxlQMiQnqliIwGjJbgBs/AWEJek30US4pscxo
 fzCmsPtAra8P3NU5Y8RPa+IhkQrZ+r/C8Pzlq8PKa4Ho7n7t3GcF07LAf5KyTSWtlNdx
 EwXz+HaSubrrcH6iODDgM/oeJnOJ+7v92QK3Z9B7YjXzWAtSWiDJuFsAYTJMtPxQ+BV/
 Uz88xEzKzxPYxpGDOk/HhNsbavzTLz+KfZlFmryaiJsPIC4BIJTIWGfW7fK5zlfYOBgE
 V8iA==
X-Gm-Message-State: AOAM531cRt9qHbptH/ISaMQMe+aiPO/w2fuHXsXlwEy7KRld/3oJs6hw
 LUG5CKMEmchryvh0by+gRSKhhq642TZO2iyv/1s=
X-Google-Smtp-Source: ABdhPJxxn8hyF1aR3IRK3/nppLzVGhFBgJGu8m+QvFFg5kI+YtKbSIis4FX/oJG91M1eYs5vb6pq2Bim9wUW2fBZOE4=
X-Received: by 2002:a50:a6dd:: with SMTP id f29mr1504895edc.257.1606804694882; 
 Mon, 30 Nov 2020 22:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20201201061356.18438-1-lma@suse.com>
In-Reply-To: <20201201061356.18438-1-lma@suse.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 1 Dec 2020 10:38:02 +0400
Message-ID: <CAJ+F1CJ_EnijCJVoirkogWmt5HjdQ-0YkdLmUUOQ2=ssHDFOBg@mail.gmail.com>
Subject: Re: [PATCH v4] qga: Correct loop count in qmp_guest_get_vcpus()
To: Lin Ma <lma@suse.com>
Content-Type: multipart/alternative; boundary="0000000000000fdf8f05b5615fda"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x544.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000fdf8f05b5615fda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Dec 1, 2020 at 10:14 AM Lin Ma <lma@suse.com> wrote:

> The guest-get-vcpus returns incorrect vcpu info in case we hotunplug
> vcpus(not
> the last one).
> e.g.:
> A VM has 4 VCPUs: cpu0 + 3 hotunpluggable online vcpus(cpu1, cpu2 and
> cpu3).
> Hotunplug cpu2,  Now only cpu0, cpu1 and cpu3 are present & online.
>
> ./qmp-shell /tmp/qmp-monitor.sock
> (QEMU) query-hotpluggable-cpus
> {"return": [
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 3}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 2}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu2", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 1}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "vcpus-count": =
1,
>  "qom-path": "/machine/unattached/device[0]", "type": "host-x86_64-cpu"}
> ]}
>
> (QEMU) device_del id=3Dcpu2
> {"return": {}}
>
> (QEMU) query-hotpluggable-cpus
> {"return": [
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 3}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 2}, "vcpus-count": =
1,
>  "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 1}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "vcpus-count": =
1,
>  "qom-path": "/machine/unattached/device[0]", "type": "host-x86_64-cpu"}
> ]}
>
> Before:
> ./qmp-shell -N /tmp/qmp-ga.sock
> Welcome to the QMP low-level shell!
> Connected
> (QEMU) guest-get-vcpus
> {"return": [
> {"online": true, "can-offline": false, "logical-id": 0},
> {"online": true, "can-offline": true, "logical-id": 1}]}
>
> After:
> ./qmp-shell -N /tmp/qmp-ga.sock
> Welcome to the QMP low-level shell!
> Connected
> (QEMU) guest-get-vcpus
> {"return": [
> {"online": true, "can-offline": false, "logical-id": 0},
> {"online": true, "can-offline": true, "logical-id": 1},
> {"online": true, "can-offline": true, "logical-id": 3}]}
>
> Signed-off-by: Lin Ma <lma@suse.com>
> ---
>  qga/commands-posix.c | 44 +++++++++++++++-----------------------------
>  1 file changed, 15 insertions(+), 29 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index c089e38120..48dcdae239 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2376,24 +2376,6 @@ error:
>      return NULL;
>  }
>
> -#define SYSCONF_EXACT(name, errp) sysconf_exact((name), #name, (errp))
> -
> -static long sysconf_exact(int name, const char *name_str, Error **errp)
> -{
> -    long ret;
> -
> -    errno =3D 0;
> -    ret =3D sysconf(name);
> -    if (ret =3D=3D -1) {
> -        if (errno =3D=3D 0) {
> -            error_setg(errp, "sysconf(%s): value indefinite", name_str);
> -        } else {
> -            error_setg_errno(errp, errno, "sysconf(%s)", name_str);
> -        }
> -    }
> -    return ret;
> -}
> -
>  /* Transfer online/offline status between @vcpu and the guest system.
>   *
>   * On input either @errp or *@errp must be NULL.
> @@ -2464,24 +2446,28 @@ static void transfer_vcpu(GuestLogicalProcessor
> *vcpu, bool sys2vcpu,
>
>  GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
>  {
> -    int64_t current;
>      GuestLogicalProcessorList *head, **link;
> -    long sc_max;
> +    const char *cpu_dir =3D "/sys/devices/system/cpu";
> +    const gchar *line;
> +    GDir *cpu_gdir =3D NULL;
>      Error *local_err =3D NULL;
>
> -    current =3D 0;
>      head =3D NULL;
>      link =3D &head;
> -    sc_max =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
> +    cpu_gdir =3D g_dir_open(cpu_dir, 0, NULL);
> +
> +    if (cpu_gdir =3D=3D NULL) {
> +        error_setg_errno(errp, errno, "failed to list entries: %s",
> cpu_dir);
> +        return NULL;
> +    }
>
> -    while (local_err =3D=3D NULL && current < sc_max) {
> +    while (local_err =3D=3D NULL && (line =3D g_dir_read_name(cpu_gdir))=
 !=3D
> NULL) {
>          GuestLogicalProcessor *vcpu;
>          GuestLogicalProcessorList *entry;
> -        int64_t id =3D current++;
> -        char *path =3D g_strdup_printf("/sys/devices/system/cpu/cpu%"
> PRId64 "/",
> -                                     id);
> -
> -        if (g_file_test(path, G_FILE_TEST_EXISTS)) {
> +        int64_t id;
> +        if (sscanf(line, "cpu%ld", &id)) {
> +            g_autofree char *path =3D
> g_strdup_printf("/sys/devices/system/cpu/"
> +                                                    "cpu%" PRId64 "/",
> id);
>              vcpu =3D g_malloc0(sizeof *vcpu);
>              vcpu->logical_id =3D id;
>              vcpu->has_can_offline =3D true; /* lolspeak ftw */
> @@ -2491,8 +2477,8 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Erro=
r
> **errp)
>              *link =3D entry;
>              link =3D &entry->next;
>          }
> -        g_free(path);
>      }
> +    g_dir_close(cpu_gdir);
>

You could use g_autoptr(GDir) instead.

Other than that:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


>      if (local_err =3D=3D NULL) {
>          /* there's no guest with zero VCPUs */
> --
> 2.26.0
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000fdf8f05b5615fda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 1, 2020 at 10:14 AM Lin=
 Ma &lt;<a href=3D"mailto:lma@suse.com">lma@suse.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">The guest-get-vcpus ret=
urns incorrect vcpu info in case we hotunplug vcpus(not<br>
the last one).<br>
e.g.:<br>
A VM has 4 VCPUs: cpu0 + 3 hotunpluggable online vcpus(cpu1, cpu2 and cpu3)=
.<br>
Hotunplug cpu2,=C2=A0 Now only cpu0, cpu1 and cpu3 are present &amp; online=
.<br>
<br>
./qmp-shell /tmp/qmp-monitor.sock<br>
(QEMU) query-hotpluggable-cpus<br>
{&quot;return&quot;: [<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 3}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/peripheral/cpu3&quot;, &quot;typ=
e&quot;: &quot;host-x86_64-cpu&quot;},<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 2}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/peripheral/cpu2&quot;, &quot;typ=
e&quot;: &quot;host-x86_64-cpu&quot;},<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 1}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/peripheral/cpu1&quot;, &quot;typ=
e&quot;: &quot;host-x86_64-cpu&quot;},<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 0}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/unattached/device[0]&quot;, &quo=
t;type&quot;: &quot;host-x86_64-cpu&quot;}<br>
]}<br>
<br>
(QEMU) device_del id=3Dcpu2<br>
{&quot;return&quot;: {}}<br>
<br>
(QEMU) query-hotpluggable-cpus<br>
{&quot;return&quot;: [<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 3}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/peripheral/cpu3&quot;, &quot;typ=
e&quot;: &quot;host-x86_64-cpu&quot;},<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 2}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;type&quot;: &quot;host-x86_64-cpu&quot;},<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 1}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/peripheral/cpu1&quot;, &quot;typ=
e&quot;: &quot;host-x86_64-cpu&quot;},<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 0}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/unattached/device[0]&quot;, &quo=
t;type&quot;: &quot;host-x86_64-cpu&quot;}<br>
]}<br>
<br>
Before:<br>
./qmp-shell -N /tmp/qmp-ga.sock<br>
Welcome to the QMP low-level shell!<br>
Connected<br>
(QEMU) guest-get-vcpus<br>
{&quot;return&quot;: [<br>
{&quot;online&quot;: true, &quot;can-offline&quot;: false, &quot;logical-id=
&quot;: 0},<br>
{&quot;online&quot;: true, &quot;can-offline&quot;: true, &quot;logical-id&=
quot;: 1}]}<br>
<br>
After:<br>
./qmp-shell -N /tmp/qmp-ga.sock<br>
Welcome to the QMP low-level shell!<br>
Connected<br>
(QEMU) guest-get-vcpus<br>
{&quot;return&quot;: [<br>
{&quot;online&quot;: true, &quot;can-offline&quot;: false, &quot;logical-id=
&quot;: 0},<br>
{&quot;online&quot;: true, &quot;can-offline&quot;: true, &quot;logical-id&=
quot;: 1},<br>
{&quot;online&quot;: true, &quot;can-offline&quot;: true, &quot;logical-id&=
quot;: 3}]}<br>
<br>
Signed-off-by: Lin Ma &lt;<a href=3D"mailto:lma@suse.com" target=3D"_blank"=
>lma@suse.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-posix.c | 44 +++++++++++++++----------------------------=
-<br>
=C2=A01 file changed, 15 insertions(+), 29 deletions(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index c089e38120..48dcdae239 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -2376,24 +2376,6 @@ error:<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
-#define SYSCONF_EXACT(name, errp) sysconf_exact((name), #name, (errp))<br>
-<br>
-static long sysconf_exact(int name, const char *name_str, Error **errp)<br=
>
-{<br>
-=C2=A0 =C2=A0 long ret;<br>
-<br>
-=C2=A0 =C2=A0 errno =3D 0;<br>
-=C2=A0 =C2=A0 ret =3D sysconf(name);<br>
-=C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;sysconf(%=
s): value indefinite&quot;, name_str);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;sysconf(%s)&quot;, name_str);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return ret;<br>
-}<br>
-<br>
=C2=A0/* Transfer online/offline status between @vcpu and the guest system.=
<br>
=C2=A0 *<br>
=C2=A0 * On input either @errp or *@errp must be NULL.<br>
@@ -2464,24 +2446,28 @@ static void transfer_vcpu(GuestLogicalProcessor *vc=
pu, bool sys2vcpu,<br>
<br>
=C2=A0GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int64_t current;<br>
=C2=A0 =C2=A0 =C2=A0GuestLogicalProcessorList *head, **link;<br>
-=C2=A0 =C2=A0 long sc_max;<br>
+=C2=A0 =C2=A0 const char *cpu_dir =3D &quot;/sys/devices/system/cpu&quot;;=
<br>
+=C2=A0 =C2=A0 const gchar *line;<br>
+=C2=A0 =C2=A0 GDir *cpu_gdir =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
<br>
-=C2=A0 =C2=A0 current =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0head =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0link =3D &amp;head;<br>
-=C2=A0 =C2=A0 sc_max =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &amp;local_er=
r);<br>
+=C2=A0 =C2=A0 cpu_gdir =3D g_dir_open(cpu_dir, 0, NULL);<br>
+<br>
+=C2=A0 =C2=A0 if (cpu_gdir =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;failed to =
list entries: %s&quot;, cpu_dir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 while (local_err =3D=3D NULL &amp;&amp; current &lt; sc_max)=
 {<br>
+=C2=A0 =C2=A0 while (local_err =3D=3D NULL &amp;&amp; (line =3D g_dir_read=
_name(cpu_gdir)) !=3D NULL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GuestLogicalProcessor *vcpu;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GuestLogicalProcessorList *entry;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t id =3D current++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *path =3D g_strdup_printf(&quot;/sys/devi=
ces/system/cpu/cpu%&quot; PRId64 &quot;/&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_file_test(path, G_FILE_TEST_EXISTS)) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(line, &quot;cpu%ld&quot;, &amp;id))=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree char *path =3D g_strd=
up_printf(&quot;/sys/devices/system/cpu/&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cpu%&quot; PRId64 &quot;/&quot;, i=
d);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vcpu =3D g_malloc0(sizeof *=
vcpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vcpu-&gt;logical_id =3D id;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vcpu-&gt;has_can_offline =
=3D true; /* lolspeak ftw */<br>
@@ -2491,8 +2477,8 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*link =3D entry;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link =3D &amp;entry-&gt;nex=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(path);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 g_dir_close(cpu_gdir);<br></blockquote><div><br></div><div>Y=
ou could use g_autoptr(GDir) instead.</div><div><br></div><div>Other than t=
hat:</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; </div><div> =
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0if (local_err =3D=3D NULL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* there&#39;s no guest with zero VCPUs *=
/<br>
-- <br>
2.26.0<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000fdf8f05b5615fda--

