Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EE84849F0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 22:33:56 +0100 (CET)
Received: from localhost ([::1]:52142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4rRL-0004uI-Av
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 16:33:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n4rQ5-0004Cz-Iz
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 16:32:37 -0500
Received: from [2607:f8b0:4864:20::92e] (port=35356
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n4rQ4-0007mT-2E
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 16:32:37 -0500
Received: by mail-ua1-x92e.google.com with SMTP id v14so47924850uau.2
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 13:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dq/KJvzBkj8k3eTHLhZv322FGwyh90HxJfneK+LKwDM=;
 b=Jk35WuWzuM5QTKl/1+N1tJpGT3mQsqd2T2HivxEJp/iJYhHFtcr3HBGITC2T16IeWg
 /FOUO6HuSMAZHvC7eL17K2l3ZwFNdf8nGsTZst7Qv/QeiFI9idUGHDTJ3mBAo98qvxcW
 gX6RjETMxACHCQ9b6OiSSYRewIDSTiuK4zr3rPLfH9DKNsIzgbNQq45j5lSsTrjKHBYP
 El3EbmTotui/Wx+oKaElMUqb4YqB3FsnV/hWg9d7L9Rpb4yGLhAVwm5SpzoIYz9aOMfl
 2XGUnH+NZdN6XxFLtgZ0KkJwQodjQlKzXN8GjskmiYQo3lBpXzi2Vu407YxWU3eMbHwZ
 EN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dq/KJvzBkj8k3eTHLhZv322FGwyh90HxJfneK+LKwDM=;
 b=vaFrD66XfOmy8FzLMQAk9FpfJqUjAPaAHUGrfEkmla4WAP3h9Xa1iCym9infon9WXl
 cKrk3R6Dp4+eVm9ZNcKKh6vFyw655WD5j8k/cL1U87SbzTwP/yEqLQjzRfgBaWYdoZ0Y
 RNQtUVNoxjEo3lc7HgQEpVxmAcl+zbJnOvEZmToxIxcyVHCPGQlK4RO6PYEOiXrriYew
 u/cEY97g45y631cEoQ4oF8tQvLMQTW/aJO5Ul2XtTK+wA82xyTTIxv9EKuaEXmTCbELc
 nGmOwW7j5qLqHO0WEZtd2CDtZbbxTKMniFuvpD01tpxSgg+8jMpHckc6Me7E2MoLHxmK
 GAlg==
X-Gm-Message-State: AOAM530fZ1xAH9djNpWnc//EWYVbtXBcJcz7FTTtATf2aI3JudHQiuXB
 kRQkdTXgw5PLPpv1gtk0iky4Vre/cyQYTnlh95CMtA==
X-Google-Smtp-Source: ABdhPJwa38Kr7AEpCJOeu0W8BE4q0KGvDtypF6C71E/vnfOXyowHVfnvRZIL5sPcvXmuxFZtaEXXgaC/k79j8shxm10=
X-Received: by 2002:a67:c209:: with SMTP id i9mr16613327vsj.46.1641331953889; 
 Tue, 04 Jan 2022 13:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20220104211827.3260431-1-venture@google.com>
In-Reply-To: <20220104211827.3260431-1-venture@google.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 4 Jan 2022 13:32:22 -0800
Message-ID: <CAO=notzyC8icquKrrQZMJRZ5Dqvh3rj0OMw+A1_6iMUTbjSCHw@mail.gmail.com>
Subject: Re: [PATCH] Set return code on failure
To: Jason Wang <jasowang@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Foley <pefoley@google.com>
Content-Type: multipart/alternative; boundary="00000000000012818c05d4c860d2"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=venture@google.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -148
X-Spam_score: -14.9
X-Spam_bar: --------------
X-Spam_report: (-14.9 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--00000000000012818c05d4c860d2
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 4, 2022 at 1:18 PM Patrick Venture <venture@google.com> wrote:

> From: Peter Foley <pefoley@google.com>
>
> Match the other error handling in this function.
>

Just noticed I didn't fix up the commit title here to match style.  Should
I do a PATCH RESEND or a new patch, or can you add the "net/tap: " to the
title before applying (should it be accepted).


>
> Signed-off-by: Peter Foley <pefoley@google.com>
>
Reviewed-by: Patrick Venture <venture@google.com>

> ---
>  net/tap.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/tap.c b/net/tap.c
> index f716be3e3f..c5cbeaa7a2 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -900,6 +900,7 @@ int net_init_tap(const Netdev *netdev, const char
> *name,
>              if (i == 0) {
>                  vnet_hdr = tap_probe_vnet_hdr(fd, errp);
>                  if (vnet_hdr < 0) {
> +                    ret = -1;
>                      goto free_fail;
>                  }
>              } else if (vnet_hdr != tap_probe_vnet_hdr(fd, NULL)) {
> --
> 2.34.1.448.ga2b2bfdf31-goog
>
>

--00000000000012818c05d4c860d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 4, 2022 at 1:18 PM Patric=
k Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Peter Foley &lt;<a href=3D"mailto:pefoley@google.com" target=3D"_blank">pe=
foley@google.com</a>&gt;<br>
<br>
Match the other error handling in this function.<br></blockquote><div><br><=
/div><div>Just noticed I didn&#39;t fix up the commit title here to match s=
tyle.=C2=A0 Should I do a PATCH RESEND or a new patch, or can you add the &=
quot;net/tap: &quot; to the title before applying (should it be accepted).<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Peter Foley &lt;<a href=3D"mailto:pefoley@google.com" target=
=3D"_blank">pefoley@google.com</a>&gt;<br></blockquote><div>Reviewed-by: Pa=
trick Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com<=
/a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0net/tap.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/net/tap.c b/net/tap.c<br>
index f716be3e3f..c5cbeaa7a2 100644<br>
--- a/net/tap.c<br>
+++ b/net/tap.c<br>
@@ -900,6 +900,7 @@ int net_init_tap(const Netdev *netdev, const char *name=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnet_hdr =3D =
tap_probe_vnet_hdr(fd, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (vnet_hdr =
&lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =
=3D -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0goto free_fail;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (vnet_hdr !=3D ta=
p_probe_vnet_hdr(fd, NULL)) {<br>
-- <br>
2.34.1.448.ga2b2bfdf31-goog<br>
<br>
</blockquote></div></div>

--00000000000012818c05d4c860d2--

