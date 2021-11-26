Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE08C45EF74
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 14:51:40 +0100 (CET)
Received: from localhost ([::1]:46214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqbdb-0002so-JL
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 08:51:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mqbaT-0000o8-B8
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 08:48:25 -0500
Received: from [2a00:1450:4864:20::431] (port=40831
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mqbaK-0002Sv-C2
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 08:48:19 -0500
Received: by mail-wr1-x431.google.com with SMTP id t9so1843403wrx.7
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 05:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G54oSutrQy9gBO7jfZLi96dlbLMUO7UrRauldhBZAzY=;
 b=gvutmrEPhV7z0/eEn7We1yYMieBrU32QFspC3F7AK7ALugWQsdFZla5wplp0XH5G+s
 LY9BjrtI7B3NGAbB4oO/pwbWGWkYBiaZSTyEMs3wK3cqgfRDJJa7QO7fNgKqUnNt2ZVC
 SxWH9zem1ja0t7sBV0dGWvgh+boYDwmTOlvHZT+u35LaB76AUdiOu88YaSuFJQhjrcTV
 wY4r2PRbTU7K58ntEhXfzgqdBX0ZrnapNXzjoR9M3HTGrVz4cFGE/oKUfUrEspPLXMjB
 JR3rhpTHZ3bfSlY2hy0/W7im6TOU4kt3/VspQh5tHHePONI9b+GOPrDgWa+nHd3KftfD
 wUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G54oSutrQy9gBO7jfZLi96dlbLMUO7UrRauldhBZAzY=;
 b=PVPCWNAEL8Ip4pvXF155HcNyMZF51HdyeajM9vZJLmINhn/Re/Dd5uyu9eyC8P/iz1
 aQMD8Y/Q6wCyi2OlDbpnHE7h/cJtZtsb1bP2JftvUvJhbMFsj2vhj57dQlqAuSGX1lXS
 /UxXUVuaINnQDsCYoLQwgb9u/ioe0p/DJMCMB/E+JEIdRypXEZwD4bjcfhWxbY4kUzWs
 Z5/NAgW18s7jgHAMd7qbzlhfFV8wmxvAhvvu+gyE+vRS1We8LcZw2EjpAO9PMFMysTfO
 yPgzTHkeSFKsbb2RCXRKhk5Yupw2PMWNTj2O90G2Xx85+riymY+ryl3Lo4O3noA+7szl
 soUw==
X-Gm-Message-State: AOAM530iC7W/YK7WfvF3HEeiiwY0DfQpPIQvYF4nc6PwYA0HF6KhvyuZ
 4P4pPI3olrZQY+vfgpIWGkhUFaP44GohOrXoWFY=
X-Google-Smtp-Source: ABdhPJxecJXwVc27CR72A03W4legcxyGuZ7VOSFibsm7N2G5XO7MtQnSsu3Nqcj7Q3ii2Qx4iLl3Q9phXEOdl4a89HI=
X-Received: by 2002:adf:ea8c:: with SMTP id s12mr13940643wrm.535.1637934494972; 
 Fri, 26 Nov 2021 05:48:14 -0800 (PST)
MIME-Version: 1.0
References: <1637933911-37482-1-git-send-email-priyankar.jain@nutanix.com>
In-Reply-To: <1637933911-37482-1-git-send-email-priyankar.jain@nutanix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Nov 2021 17:48:03 +0400
Message-ID: <CAJ+F1CJJn9K-dOrNg_xD3n1OOSnQWeO8iKO63zEiQ70HOHcFEA@mail.gmail.com>
Subject: Re: [PATCH v2] dbus-vmstate: Restrict error checks to registered
 proxies in dbus_get_proxies
To: Priyankar Jain <priyankar.jain@nutanix.com>
Content-Type: multipart/alternative; boundary="000000000000bd000d05d1b15701"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bd000d05d1b15701
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 26, 2021 at 5:40 PM Priyankar Jain <priyankar.jain@nutanix.com>
wrote:

> The purpose of dbus_get_proxies to construct the proxies corresponding to
> the
> IDs registered to dbus-vmstate.
>
> Currenty, this function returns an error in case there is any failure
> while instantiating proxy for "all" the names on dbus.
>
> Ideally this function should error out only if it is not able to find and
> validate the proxies registered to the backend otherwise any offending
> process(for eg: the process purposefully may not export its Id property o=
n
> the dbus) may connect to the dbus and can lead to migration failures.
>
> This commit ensures that dbus_get_proxies returns an error if it is not
> able to find and validate the proxies of interest(the IDs registered
> during the dbus-vmstate instantiation).
>
> Signed-off-by: Priyankar Jain <priyankar.jain@nutanix.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

thanks

---
>  backends/dbus-vmstate.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
> index 9cfd758c42..57369ec0f2 100644
> --- a/backends/dbus-vmstate.c
> +++ b/backends/dbus-vmstate.c
> @@ -114,14 +114,19 @@ dbus_get_proxies(DBusVMState *self, GError **err)
>                      "org.qemu.VMState1",
>                      NULL, err);
>          if (!proxy) {
> -            return NULL;
> +            if (err !=3D NULL && *err !=3D NULL) {
> +                warn_report("%s: Failed to create proxy: %s",
> +                            __func__, (*err)->message);
> +                g_clear_error(err);
> +            }
> +            continue;
>          }
>
>          result =3D g_dbus_proxy_get_cached_property(proxy, "Id");
>          if (!result) {
> -            g_set_error_literal(err, G_IO_ERROR, G_IO_ERROR_FAILED,
> -                                "VMState Id property is missing.");
> -            return NULL;
> +            warn_report("%s: VMState Id property is missing.", __func__)=
;
> +            g_clear_object(&proxy);
> +            continue;
>          }
>
>          id =3D g_variant_dup_string(result, &size);
> --
> 2.30.1 (Apple Git-130)
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000bd000d05d1b15701
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 26, 2021 at 5:40 PM Priya=
nkar Jain &lt;<a href=3D"mailto:priyankar.jain@nutanix.com">priyankar.jain@=
nutanix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The purpose of dbus_get_proxies to construct the proxies corresp=
onding to the<br>
IDs registered to dbus-vmstate.<br>
<br>
Currenty, this function returns an error in case there is any failure<br>
while instantiating proxy for &quot;all&quot; the names on dbus.<br>
<br>
Ideally this function should error out only if it is not able to find and<b=
r>
validate the proxies registered to the backend otherwise any offending<br>
process(for eg: the process purposefully may not export its Id property on<=
br>
the dbus) may connect to the dbus and can lead to migration failures.<br>
<br>
This commit ensures that dbus_get_proxies returns an error if it is not<br>
able to find and validate the proxies of interest(the IDs registered<br>
during the dbus-vmstate instantiation).<br>
<br>
Signed-off-by: Priyankar Jain &lt;<a href=3D"mailto:priyankar.jain@nutanix.=
com" target=3D"_blank">priyankar.jain@nutanix.com</a>&gt;<br></blockquote><=
div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailt=
o:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><di=
v><br></div><div>thanks</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
---<br>
=C2=A0backends/dbus-vmstate.c | 13 +++++++++----<br>
=C2=A01 file changed, 9 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c<br>
index 9cfd758c42..57369ec0f2 100644<br>
--- a/backends/dbus-vmstate.c<br>
+++ b/backends/dbus-vmstate.c<br>
@@ -114,14 +114,19 @@ dbus_get_proxies(DBusVMState *self, GError **err)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;org.qemu.VMState1&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0NULL, err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!proxy) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err !=3D NULL &amp;&amp; *er=
r !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;=
%s: Failed to create proxy: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 __func__, (*err)-&gt;message);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_error(err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D g_dbus_proxy_get_cached_proper=
ty(proxy, &quot;Id&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!result) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_set_error_literal(err, G_IO_ER=
ROR, G_IO_ERROR_FAILED,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;VMState Id property is missing=
.&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;%s: VMState Id=
 property is missing.&quot;, __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_object(&amp;proxy);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id =3D g_variant_dup_string(result, &amp;=
size);<br>
-- <br>
2.30.1 (Apple Git-130)<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bd000d05d1b15701--

