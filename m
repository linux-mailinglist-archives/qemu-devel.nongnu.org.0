Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900CB444443
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:06:21 +0100 (CET)
Received: from localhost ([::1]:43736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHqG-000496-NI
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1miHiF-0002aY-Vf
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:58:04 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1miHiE-0005Wv-FG
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:58:03 -0400
Received: by mail-wr1-x429.google.com with SMTP id t30so3989927wra.10
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KRRJEqxNS8vDvdreC2/i6tfsomYGjRjQxyf3QNnoCZs=;
 b=TjgECzLAPP34684WAf5cb+jxLy85raP/0kHnociYCA7YvNNBXfojZMiLhwrsbUPFFt
 EAiIPDEW1EK1GSIWUQtGhETc6CfBK2cS+WPend8VDXn2h4Fm9Z8hL5nWu9Trf51jjz0A
 joLdEqr23Pen2UtwduG0U4qGY9MMT1JNTEl+D3h9C8XN/L7HKFd9fCS+umFC+stFL2AN
 k/vDVgC2A3R0/6MoKxkL9FomlOIXJz6RkA0L/utLDJjBMGCuHnI2Orx13bg+/vWmdMEv
 4f/egKEzupxK8O5sb3ZeSNR+aqEquOhI3IdADIT8Y+NFePXl6Kbi0Su1oprHtjVX+pca
 RojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KRRJEqxNS8vDvdreC2/i6tfsomYGjRjQxyf3QNnoCZs=;
 b=uTmUW14K/96Z2A37tcWTGqM7+NNXEGjfrfquXGsuLOqpo0DM3z6nCZNUf3+wDblkOu
 LibVOcedUElaLOzGIrD8GmP6HW1PufZ/7B4OGu0MPzXfmjuE+qo684DpWxee4byUGe6y
 +XnBXpWU+xpdc2APV3mw4hFewf9gMFZbbeSDnMdU/8PfZIt/rve0H1qPLJVE07gsiffx
 Okcj43WJOtSpAZa2K98iIHHslCEH4Sou3xLW8N0sFoqEg+USFSdp4MAlsQO4OFflRySp
 bCmz9cN8BfLp74O4OA2Yd1DoID1AMWsWX5JkZDUCAgJALi49bLpnApWwrLKOAfQmxZ4W
 dXKw==
X-Gm-Message-State: AOAM533Gltp4qKezLOG0VtFA7ROcU2OQOMeRZkDLIQsGJefTQJBUk0Y3
 RJB/PYTx1/xMOXYZ/EzTSGpUS8ztdht644I1Z3nOknyWsrM=
X-Google-Smtp-Source: ABdhPJwhMFYRpAjUlJbCCBbJlLEUflDFCw8gDUX6Idzl3+Wzn2xXMBLRltf+kqZ7fVICTMU1WLbB4TUGaPRqOHt23lg=
X-Received: by 2002:a5d:6da5:: with SMTP id u5mr16904145wrs.374.1635951481015; 
 Wed, 03 Nov 2021 07:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <20211103144844.1285634-3-jsnow@redhat.com>
In-Reply-To: <20211103144844.1285634-3-jsnow@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 3 Nov 2021 18:57:49 +0400
Message-ID: <CAJ+F1CJR_K61nFrq04YbZBGO8YzTuZj3U2c+4EzHevSpN=ikWA@mail.gmail.com>
Subject: Re: [PATCH 2/6] ui/clipboard: Don't use g_autoptr just to free a
 variable
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e5591b05cfe3a2f9"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e5591b05cfe3a2f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Nov 3, 2021 at 6:50 PM John Snow <jsnow@redhat.com> wrote:

> Clang doesn't recognize that the variable is being "used" and will emit
> a warning:
>
>   ../ui/clipboard.c:47:34: error: variable 'old' set but not used
> [-Werror,-Wunused-but-set-variable]
>       g_autoptr(QemuClipboardInfo) old =3D NULL;
>                                  ^
>   1 error generated.
>
> OK, fine. Just do things the old way.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  ui/clipboard.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/ui/clipboard.c b/ui/clipboard.c
> index d7b008d62a..d53576b0f6 100644
> --- a/ui/clipboard.c
> +++ b/ui/clipboard.c
> @@ -44,13 +44,14 @@ void qemu_clipboard_peer_release(QemuClipboardPeer
> *peer,
>
>  void qemu_clipboard_update(QemuClipboardInfo *info)
>  {
> -    g_autoptr(QemuClipboardInfo) old =3D NULL;
> +    QemuClipboardInfo *old =3D NULL;
>      assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
>
>      notifier_list_notify(&clipboard_notifiers, info);
>
>      old =3D cbinfo[info->selection];
>      cbinfo[info->selection] =3D qemu_clipboard_info_ref(info);
> +    g_free(old);
>

qemu_clipboard_info_unref(cbinfo[info->selection]), don't need "old" either
then

thanks

 }
>
>  QemuClipboardInfo *qemu_clipboard_info(QemuClipboardSelection selection)
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e5591b05cfe3a2f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 3, 2021 at 6:50 PM John=
 Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Clang doesn&#=
39;t recognize that the variable is being &quot;used&quot; and will emit<br=
>
a warning:<br>
<br>
=C2=A0 ../ui/clipboard.c:47:34: error: variable &#39;old&#39; set but not u=
sed [-Werror,-Wunused-but-set-variable]<br>
=C2=A0 =C2=A0 =C2=A0 g_autoptr(QemuClipboardInfo) old =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
=C2=A0 1 error generated.<br>
<br>
OK, fine. Just do things the old way.<br>
<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a>&gt;<br>
---<br>
=C2=A0ui/clipboard.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/ui/clipboard.c b/ui/clipboard.c<br>
index d7b008d62a..d53576b0f6 100644<br>
--- a/ui/clipboard.c<br>
+++ b/ui/clipboard.c<br>
@@ -44,13 +44,14 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *pee=
r,<br>
<br>
=C2=A0void qemu_clipboard_update(QemuClipboardInfo *info)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 g_autoptr(QemuClipboardInfo) old =3D NULL;<br>
+=C2=A0 =C2=A0 QemuClipboardInfo *old =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0assert(info-&gt;selection &lt; QEMU_CLIPBOARD_SELECTION=
__COUNT);<br>
<br>
=C2=A0 =C2=A0 =C2=A0notifier_list_notify(&amp;clipboard_notifiers, info);<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0old =3D cbinfo[info-&gt;selection];<br>
=C2=A0 =C2=A0 =C2=A0cbinfo[info-&gt;selection] =3D qemu_clipboard_info_ref(=
info);<br>
+=C2=A0 =C2=A0 g_free(old);<br></blockquote><div><br></div><div>qemu_clipbo=
ard_info_unref(cbinfo[info-&gt;selection]), don&#39;t need &quot;old&quot; =
either then</div><div><br></div><div>thanks<br></div><div> <br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0QemuClipboardInfo *qemu_clipboard_info(QemuClipboardSelection selecti=
on)<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e5591b05cfe3a2f9--

