Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DEB39B741
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 12:41:30 +0200 (CEST)
Received: from localhost ([::1]:35908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp7Gb-0001Rd-6p
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 06:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lp7FD-0007pU-Dz
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:40:03 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lp7FB-0007s1-CG
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:40:03 -0400
Received: by mail-ej1-x62b.google.com with SMTP id og14so8468234ejc.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 03:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PEjxInX0aZLDLWZ5TGwsFJ+XLJP0/UspYsKJK5U2tKA=;
 b=H/yR7Jxt4o4lgy6vEEvkpeDkmEURo1ooVMqgm6GzF5W4delz+g148ylxQcLve/GbV8
 Z8SPD9hQYTym7mNqqQ7Tft6pXTaLMZJ595FcPU2rQMjSVGitRBtcEn88l9EsC+yVWfFU
 x50UMq75f84p7gpK4HpM5kEI7DPYtEoC3UOOcC9JL8SRNM7mnnQNThVBdVQ6iU+52aoN
 t7ggjoL5+NNYhspKbJ0DDEM5JZxj0y5WqmVFrZiKgkxvmibUr9fCWaUDgK+qV5wzUVwt
 Ptb9bR+922PIbGyf/m36XB6rX0p/bTdS7np7joZ/Te/WeB4sYoa99vQ2tU+XE7MIDVq4
 iMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PEjxInX0aZLDLWZ5TGwsFJ+XLJP0/UspYsKJK5U2tKA=;
 b=IiUwiPv5M8bsMvnLaGrFeMhTLKKteI0pJ5/IzMT3/wB40xgkS+6Z8d7Jx3VVFcs8/F
 X5B8wz8AKlHZCq0Zcnnl5E90F2gWRzKTQbpRtL8Pfm+3YgEGvkoAzybAvcol7EmkzuIn
 m8bHncqmlqnJxunGubDCGi1WgSZHGqy/lx8DKXB8w+imYlNyM+KtRibwtSYbtutqIRKV
 vHbITpB4kM3ObofX25VpTJsQAX7q8G1sP/bsxow7SpvQ0iVgO1RyO0mMkpImqCkLUskW
 xYroFpl90XACDsYh38/qX5z1u4TR3F3PHpZzlQP/aI24ZpcN/HIvTiUGfKvum8s0W/Ti
 DfEA==
X-Gm-Message-State: AOAM530Bguko6gJuZCyPqNtxU6T3s0ZuBrCTnqiUAgZNtfOEAVPnnUmw
 TEcgzzVLFkZweWNImcd5brcq5LzdhUmDx3fomu0=
X-Google-Smtp-Source: ABdhPJwkT8a4et9oQgf02R/tRmhq0RzIMQYkSACmYYtVHfHSqS86Eefqg7S6VuSAlzVm26pc4mmAHx/8zBQTeMMxh6g=
X-Received: by 2002:a17:906:7203:: with SMTP id
 m3mr3423188ejk.381.1622803199275; 
 Fri, 04 Jun 2021 03:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210604103714.1237414-1-kraxel@redhat.com>
In-Reply-To: <20210604103714.1237414-1-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Jun 2021 14:39:46 +0400
Message-ID: <CAJ+F1CKR6zxikG0_E5p+Pd=LYYLArQ6tUvWo9VTJ0TpOG0LH0Q@mail.gmail.com>
Subject: Re: [PATCH] vhost-user-gpu: reorder free calls.
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003bbb9e05c3ee5040"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003bbb9e05c3ee5040
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 4, 2021 at 2:38 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Free in correct order to avoid use-after-free.
>
> Resolves: CID 1453812
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  contrib/vhost-user-gpu/vhost-user-gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c
> b/contrib/vhost-user-gpu/vhost-user-gpu.c
> index 6dc6a44f4e26..611360e6b475 100644
> --- a/contrib/vhost-user-gpu/vhost-user-gpu.c
> +++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
> @@ -350,8 +350,8 @@ vg_resource_create_2d(VuGpu *g,
>      if (!res->image) {
>          g_critical("%s: resource creation failed %d %d %d",
>                     __func__, c2d.resource_id, c2d.width, c2d.height);
> -        g_free(res);
>          vugbm_buffer_destroy(&res->buffer);
> +        g_free(res);
>          cmd->error =3D VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
>          return;
>      }
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003bbb9e05c3ee5040
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 4, 2021 at 2:38 PM Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Free in c=
orrect order to avoid use-after-free.<br>
<br>
Resolves: CID 1453812<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0contrib/vhost-user-gpu/vhost-user-gpu.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-g=
pu/vhost-user-gpu.c<br>
index 6dc6a44f4e26..611360e6b475 100644<br>
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c<br>
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c<br>
@@ -350,8 +350,8 @@ vg_resource_create_2d(VuGpu *g,<br>
=C2=A0 =C2=A0 =C2=A0if (!res-&gt;image) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_critical(&quot;%s: resource creation fa=
iled %d %d %d&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __fun=
c__, c2d.resource_id, c2d.width, c2d.height);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(res);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vugbm_buffer_destroy(&amp;res-&gt;buffer)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(res);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_OUT=
_OF_MEMORY;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003bbb9e05c3ee5040--

