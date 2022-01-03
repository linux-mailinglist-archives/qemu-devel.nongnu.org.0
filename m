Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293A3482EF0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 09:16:02 +0100 (CET)
Received: from localhost ([::1]:48848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4IVc-0006cV-LP
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 03:16:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1n4IU6-0005sj-Eo
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:14:26 -0500
Received: from [2a00:1450:4864:20::42c] (port=44007
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1n4IU4-0003lq-M9
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:14:26 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o3so10223162wrh.10
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 00:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DWluscE3Gu5mr87LlIjksC0KJuWsqBo7HVsTRhBSVr0=;
 b=KNZHmTSqSLM1SVO6hSSnqGiczBEP5nPGOeLwmOCI1qoOufIgev8Yuzz8z3kTiL6OCc
 +SAHslHC0mZEz+MG7mMD8EBtee8oYH8yTsGvF+/FZ2rk8CzLYI0kM7F/qWLLm9FqlUIz
 eG2L/DLqRqM8Y8pc/R/JfQXGSJtIkSbLDqAld9CXaBtw5189OJmyTRyAfG1jbbRgAK51
 4IjsnRTDuLhpKm1ObBGSzF742wfNckIAq9OlbciCfrClMGOBr9j8HJpt2PS+4z50B7tV
 NrE0xEQs6Iz8238d6ZhYTTAaTSRKtm/jSxwYi5eAcyAxLlGblUvFLALv9FiipWxpNY6B
 PQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DWluscE3Gu5mr87LlIjksC0KJuWsqBo7HVsTRhBSVr0=;
 b=tkbMLchGeYkp4KzGX31om3zz2eAghZnQjtpNRm6SLU0+zHtxL/xexscErPwlCkEg4L
 gRru2NL6IYtmlhQBo8kuq6Ms3dKrBcE8/3JrQ50rhx+3qg3HoREhGNfwYJY6IUOeZCx6
 CRo0+s0djN1T8zk1L02WdBKM15PhNkxEzvNd8NNNeQUm/Sz5GpO/spNIuDCzh/qPxXVv
 wQ45DhrFNLu0m/gAXA5KRyEPKGfVcG4HLh4oODTKFQT8pahFuM9ZLeTuy7wzozW3YUlL
 Nq6sPlQRtsI4bp5N+p37gi1jgYs17q8YVFjA4K85Xrm+vU0cliVBuZU8jiqI69pd2v/f
 6XWA==
X-Gm-Message-State: AOAM533pHkT8iPNqUzfp0hpy6r/hkmUCvnNTUKhOGejieuI8uNvM/jSm
 IRfPwJ7oXSRPAZQRiFSRysKmOUIubgGggLz0R7A=
X-Google-Smtp-Source: ABdhPJxIGH7iWpz5FS5uKlS7ZnjawfApnfStbmBVSbRuoQW5FJ+vlkQj3iS/OeFphFge6yRt4TLCWj6ulepYI6KbdSQ=
X-Received: by 2002:a5d:5887:: with SMTP id n7mr38068933wrf.436.1641197662389; 
 Mon, 03 Jan 2022 00:14:22 -0800 (PST)
MIME-Version: 1.0
References: <20211229021404.100550-1-lei.rao@intel.com>
In-Reply-To: <20211229021404.100550-1-lei.rao@intel.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 3 Jan 2022 12:14:09 +0400
Message-ID: <CAJ+F1C+6NEayzZr8cDHizFAJwgqCVE1668Z6vbPRBh63HRU50g@mail.gmail.com>
Subject: Re: [RFC PATCH] ui/vnc.c: Fixed a deadlock bug.
To: Rao Lei <lei.rao@intel.com>
Content-Type: multipart/alternative; boundary="000000000000ac4e9e05d4a91bc7"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ac4e9e05d4a91bc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 29, 2021 at 6:18 AM Rao Lei <lei.rao@intel.com> wrote:

> The GDB statck is as follows:
> (gdb) bt
> 0  __lll_lock_wait (futex=3Dfutex@entry=3D0x56211df20360, private=3D0) at
> lowlevellock.c:52
> 1  0x00007f263caf20a3 in __GI___pthread_mutex_lock (mutex=3D0x56211df2036=
0)
> at ../nptl/pthread_mutex_lock.c:80
> 2  0x000056211a757364 in qemu_mutex_lock_impl (mutex=3D0x56211df20360,
> file=3D0x56211a804857 "../ui/vnc-jobs.h", line=3D60)
>     at ../util/qemu-thread-posix.c:80
> 3  0x000056211a0ef8c7 in vnc_lock_output (vs=3D0x56211df14200) at
> ../ui/vnc-jobs.h:60
> 4  0x000056211a0efcb7 in vnc_clipboard_send (vs=3D0x56211df14200, count=
=3D1,
> dwords=3D0x7ffdf1701338) at ../ui/vnc-clipboard.c:138
> 5  0x000056211a0f0129 in vnc_clipboard_notify (notifier=3D0x56211df244c8,
> data=3D0x56211dd1bbf0) at ../ui/vnc-clipboard.c:209
> 6  0x000056211a75dde8 in notifier_list_notify (list=3D0x56211afa17d0
> <clipboard_notifiers>, data=3D0x56211dd1bbf0) at ../util/notify.c:39
> 7  0x000056211a0bf0e6 in qemu_clipboard_update (info=3D0x56211dd1bbf0) at
> ../ui/clipboard.c:50
> 8  0x000056211a0bf05d in qemu_clipboard_peer_release (peer=3D0x56211df244=
c0,
> selection=3DQEMU_CLIPBOARD_SELECTION_CLIPBOARD)
>     at ../ui/clipboard.c:41
> 9  0x000056211a0bef9b in qemu_clipboard_peer_unregister
> (peer=3D0x56211df244c0) at ../ui/clipboard.c:19
> 10 0x000056211a0d45f3 in vnc_disconnect_finish (vs=3D0x56211df14200) at
> ../ui/vnc.c:1358
> 11 0x000056211a0d4c9d in vnc_client_read (vs=3D0x56211df14200) at
> ../ui/vnc.c:1611
> 12 0x000056211a0d4df8 in vnc_client_io (ioc=3D0x56211ce70690,
> condition=3DG_IO_IN, opaque=3D0x56211df14200) at ../ui/vnc.c:1649
> 13 0x000056211a5b976c in qio_channel_fd_source_dispatch
>     (source=3D0x56211ce50a00, callback=3D0x56211a0d4d71 <vnc_client_io>,
> user_data=3D0x56211df14200) at ../io/channel-watch.c:84
> 14 0x00007f263ccede8e in g_main_context_dispatch () at
> /lib/x86_64-linux-gnu/libglib-2.0.so.0
> 15 0x000056211a77d4a1 in glib_pollfds_poll () at ../util/main-loop.c:232
> 16 0x000056211a77d51f in os_host_main_loop_wait (timeout=3D958545) at
> ../util/main-loop.c:255
> 17 0x000056211a77d630 in main_loop_wait (nonblocking=3D0) at
> ../util/main-loop.c:531
> 18 0x000056211a45bc8e in qemu_main_loop () at ../softmmu/runstate.c:726
> 19 0x000056211a0b45fa in main (argc=3D69, argv=3D0x7ffdf1701778,
> envp=3D0x7ffdf17019a8) at ../softmmu/main.c:50
>
> From the call trace, we can see it is a deadlock bug.
> vnc_disconnect_finish will acquire the output_mutex.
> But, the output_mutex will be acquired again in vnc_clipboard_send.
> Repeated locking will cause deadlock. So, I move
> qemu_clipboard_peer_unregister() behind vnc_unlock_output();
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>
>

Looks good to me. Please add to the commit message

Fixes: 0bf41cab93e ("ui/vnc: clipboard support")

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/vnc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 1ed1c7efc6..3ccd33dedc 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -1354,12 +1354,12 @@ void vnc_disconnect_finish(VncState *vs)
>          /* last client gone */
>          vnc_update_server_surface(vs->vd);
>      }
> +    vnc_unlock_output(vs);
> +
>      if (vs->cbpeer.notifier.notify) {
>          qemu_clipboard_peer_unregister(&vs->cbpeer);
>      }
>
> -    vnc_unlock_output(vs);
> -
>      qemu_mutex_destroy(&vs->output_mutex);
>      if (vs->bh !=3D NULL) {
>          qemu_bh_delete(vs->bh);
> --
> 2.32.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ac4e9e05d4a91bc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 29, 2021 at 6:18 AM Rao=
 Lei &lt;<a href=3D"mailto:lei.rao@intel.com">lei.rao@intel.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The GDB stat=
ck is as follows:<br>
(gdb) bt<br>
0=C2=A0 __lll_lock_wait (futex=3Dfutex@entry=3D0x56211df20360, private=3D0)=
 at lowlevellock.c:52<br>
1=C2=A0 0x00007f263caf20a3 in __GI___pthread_mutex_lock (mutex=3D0x56211df2=
0360) at ../nptl/pthread_mutex_lock.c:80<br>
2=C2=A0 0x000056211a757364 in qemu_mutex_lock_impl (mutex=3D0x56211df20360,=
 file=3D0x56211a804857 &quot;../ui/vnc-jobs.h&quot;, line=3D60)<br>
=C2=A0 =C2=A0 at ../util/qemu-thread-posix.c:80<br>
3=C2=A0 0x000056211a0ef8c7 in vnc_lock_output (vs=3D0x56211df14200) at ../u=
i/vnc-jobs.h:60<br>
4=C2=A0 0x000056211a0efcb7 in vnc_clipboard_send (vs=3D0x56211df14200, coun=
t=3D1, dwords=3D0x7ffdf1701338) at ../ui/vnc-clipboard.c:138<br>
5=C2=A0 0x000056211a0f0129 in vnc_clipboard_notify (notifier=3D0x56211df244=
c8, data=3D0x56211dd1bbf0) at ../ui/vnc-clipboard.c:209<br>
6=C2=A0 0x000056211a75dde8 in notifier_list_notify (list=3D0x56211afa17d0 &=
lt;clipboard_notifiers&gt;, data=3D0x56211dd1bbf0) at ../util/notify.c:39<b=
r>
7=C2=A0 0x000056211a0bf0e6 in qemu_clipboard_update (info=3D0x56211dd1bbf0)=
 at ../ui/clipboard.c:50<br>
8=C2=A0 0x000056211a0bf05d in qemu_clipboard_peer_release (peer=3D0x56211df=
244c0, selection=3DQEMU_CLIPBOARD_SELECTION_CLIPBOARD)<br>
=C2=A0 =C2=A0 at ../ui/clipboard.c:41<br>
9=C2=A0 0x000056211a0bef9b in qemu_clipboard_peer_unregister (peer=3D0x5621=
1df244c0) at ../ui/clipboard.c:19<br>
10 0x000056211a0d45f3 in vnc_disconnect_finish (vs=3D0x56211df14200) at ../=
ui/vnc.c:1358<br>
11 0x000056211a0d4c9d in vnc_client_read (vs=3D0x56211df14200) at ../ui/vnc=
.c:1611<br>
12 0x000056211a0d4df8 in vnc_client_io (ioc=3D0x56211ce70690, condition=3DG=
_IO_IN, opaque=3D0x56211df14200) at ../ui/vnc.c:1649<br>
13 0x000056211a5b976c in qio_channel_fd_source_dispatch<br>
=C2=A0 =C2=A0 (source=3D0x56211ce50a00, callback=3D0x56211a0d4d71 &lt;vnc_c=
lient_io&gt;, user_data=3D0x56211df14200) at ../io/channel-watch.c:84<br>
14 0x00007f263ccede8e in g_main_context_dispatch () at /lib/x86_64-linux-gn=
u/libglib-2.0.so.0<br>
15 0x000056211a77d4a1 in glib_pollfds_poll () at ../util/main-loop.c:232<br=
>
16 0x000056211a77d51f in os_host_main_loop_wait (timeout=3D958545) at ../ut=
il/main-loop.c:255<br>
17 0x000056211a77d630 in main_loop_wait (nonblocking=3D0) at ../util/main-l=
oop.c:531<br>
18 0x000056211a45bc8e in qemu_main_loop () at ../softmmu/runstate.c:726<br>
19 0x000056211a0b45fa in main (argc=3D69, argv=3D0x7ffdf1701778, envp=3D0x7=
ffdf17019a8) at ../softmmu/main.c:50<br>
<br>
From the call trace, we can see it is a deadlock bug.<br>
vnc_disconnect_finish will acquire the output_mutex.<br>
But, the output_mutex will be acquired again in vnc_clipboard_send.<br>
Repeated locking will cause deadlock. So, I move<br>
qemu_clipboard_peer_unregister() behind vnc_unlock_output();<br>
<br>
Signed-off-by: Lei Rao &lt;<a href=3D"mailto:lei.rao@intel.com" target=3D"_=
blank">lei.rao@intel.com</a>&gt;<br></blockquote><div><br></div><div>Looks =
good to me. Please add to the commit message</div><div><br></div><div>Fixes=
: 0bf41cab93e (&quot;ui/vnc: clipboard support&quot;)</div><div><br> </div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br></div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/vnc.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/ui/vnc.c b/ui/vnc.c<br>
index 1ed1c7efc6..3ccd33dedc 100644<br>
--- a/ui/vnc.c<br>
+++ b/ui/vnc.c<br>
@@ -1354,12 +1354,12 @@ void vnc_disconnect_finish(VncState *vs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* last client gone */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_update_server_surface(vs-&gt;vd);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 vnc_unlock_output(vs);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (vs-&gt;cbpeer.notifier.notify) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_clipboard_peer_unregister(&amp;vs-&g=
t;cbpeer);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 vnc_unlock_output(vs);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0qemu_mutex_destroy(&amp;vs-&gt;output_mutex);<br>
=C2=A0 =C2=A0 =C2=A0if (vs-&gt;bh !=3D NULL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_bh_delete(vs-&gt;bh);<br>
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ac4e9e05d4a91bc7--

