Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E9560E68F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 19:33:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onkFr-0000kB-Gv; Wed, 26 Oct 2022 13:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkFb-0007OT-MW
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:31:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkFZ-0001cY-NN
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666805490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LLn6KRZwZKDn7PWxdNxnuv5aWnGn2t3RTK5vTzuw5TY=;
 b=DvrSeRKBeZbx2XwO7L3m56Tyuw2ZKQLSvqhUpVvDDGGfOxzOumFI17pnigyxHIln4guCz/
 hSSkdbEWusN6S1BHRXk7Bf4PNzaomz1A82/65kNdNphoVybAZeIkFl851ZFbUMMWkkaZLr
 sI3giR3Kr9PhE/7a1dYbb4nT6M/f9o8=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-MIKHBeOeOsSPdMTJq9LSkA-1; Wed, 26 Oct 2022 13:31:28 -0400
X-MC-Unique: MIKHBeOeOsSPdMTJq9LSkA-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-13bdcfbd787so3698650fac.18
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 10:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LLn6KRZwZKDn7PWxdNxnuv5aWnGn2t3RTK5vTzuw5TY=;
 b=Qi3y9Gsh4hmlYrOjX6rbzY3LKhj7BJvnJgGzcVlN3yApqKq07FCNiVYYsxxDDNTPmF
 Co5psjC7/jLv6l+xm5ehpxfyDt8Hc3smsZuPu1EoGgtlgJ7/1FvaGQq3eIYMnjK66F3R
 1GKtcSfyJDAZD85P9v9EIbGyzEd42mZ9/L+il57BE8qbl6eQylgz9okMQ/JinuULdCNV
 kYk+WDqieF7vYKUjBkC8u2x2M20JH0dckoNwgZYb66M6MI+vRkgebSncWQQI+guBFmSE
 17UoV7l5LdF9kaKHkpbSwwqyOr5yf++VRfIpmC8npmPS3r9iWhphRbeCLzIx5XAafm/R
 KfxQ==
X-Gm-Message-State: ACrzQf2U2X8U3xyQv9I6VVwn0CJ7P8CPO1PHYVXCb7cUFBObcI3E8eL3
 QTLXlUB3Cvj3ewx7B/Z4R53+gDRC6fRAfQttYzqD7WxEqaMtLMnolo6+VHB6JdNV7aJhGYus1fc
 4twQ4cX3cmsZq6WNBL8dth3yYVqYvOzU=
X-Received: by 2002:a05:6808:1813:b0:359:a368:a111 with SMTP id
 bh19-20020a056808181300b00359a368a111mr2320887oib.14.1666805488044; 
 Wed, 26 Oct 2022 10:31:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4TTK6zC/ej6BV6oCjX+W8upew755SDUlon7+J2i3gBMEZGKtQfpGtprPXOvzUo3O2eA4xibPbFXUlBtZa+l74=
X-Received: by 2002:a05:6808:1813:b0:359:a368:a111 with SMTP id
 bh19-20020a056808181300b00359a368a111mr2320878oib.14.1666805487804; Wed, 26
 Oct 2022 10:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221020220346.124381-1-bjorn.forsman@gmail.com>
In-Reply-To: <20221020220346.124381-1-bjorn.forsman@gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 26 Oct 2022 20:31:16 +0300
Message-ID: <CAPMcbCpPje_vo8RPQtT4AM_b1hH427exC2==1YRrotQKXLv7nQ@mail.gmail.com>
Subject: Re: [PATCH] qga: add channel path to error messages
To: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com
Content-Type: multipart/alternative; boundary="00000000000002c67405ebf3651d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000002c67405ebf3651d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Fri, Oct 21, 2022 at 1:04 AM Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com=
>
wrote:

> It's useful to know which device was used if/when it fails.
>
> channel-win32.c had this since 2015, with
> c69403fcd4a0cb89f838a212ab71e4a1a3464c95 ("qemu-ga: debug printouts to
> help troubleshoot installation"), this brings channel-posix.c up to
> speed.
>
> Signed-off-by: Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>
> ---
>  qga/channel-posix.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qga/channel-posix.c b/qga/channel-posix.c
> index 6796a02cff..e6dce985ae 100644
> --- a/qga/channel-posix.c
> +++ b/qga/channel-posix.c
> @@ -138,7 +138,7 @@ static gboolean ga_channel_open(GAChannel *c, const
> gchar *path,
>              0
>          );
>          if (fd =3D=3D -1) {
> -            error_setg_errno(errp, errno, "error opening channel");
> +            error_setg_errno(errp, errno, "error opening channel '%s'",
> path);
>              return false;
>          }
>  #ifdef CONFIG_SOLARIS
> @@ -163,7 +163,7 @@ static gboolean ga_channel_open(GAChannel *c, const
> gchar *path,
>          assert(fd < 0);
>          fd =3D qga_open_cloexec(path, O_RDWR | O_NOCTTY | O_NONBLOCK, 0)=
;
>          if (fd =3D=3D -1) {
> -            error_setg_errno(errp, errno, "error opening channel");
> +            error_setg_errno(errp, errno, "error opening channel '%s'",
> path);
>              return false;
>          }
>          tcgetattr(fd, &tio);
> --
> 2.36.2
>
>

--00000000000002c67405ebf3651d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 2=
1, 2022 at 1:04 AM Bj=C3=B8rn Forsman &lt;<a href=3D"mailto:bjorn.forsman@g=
mail.com">bjorn.forsman@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">It&#39;s useful to know which device was u=
sed if/when it fails.<br>
<br>
channel-win32.c had this since 2015, with<br>
c69403fcd4a0cb89f838a212ab71e4a1a3464c95 (&quot;qemu-ga: debug printouts to=
<br>
help troubleshoot installation&quot;), this brings channel-posix.c up to<br=
>
speed.<br>
<br>
Signed-off-by: Bj=C3=B8rn Forsman &lt;<a href=3D"mailto:bjorn.forsman@gmail=
.com" target=3D"_blank">bjorn.forsman@gmail.com</a>&gt;<br>
---<br>
=C2=A0qga/channel-posix.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qga/channel-posix.c b/qga/channel-posix.c<br>
index 6796a02cff..e6dce985ae 100644<br>
--- a/qga/channel-posix.c<br>
+++ b/qga/channel-posix.c<br>
@@ -138,7 +138,7 @@ static gboolean ga_channel_open(GAChannel *c, const gch=
ar *path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error opening channel&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error opening channel &#39;%s&#39;&quot;, path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#ifdef CONFIG_SOLARIS<br>
@@ -163,7 +163,7 @@ static gboolean ga_channel_open(GAChannel *c, const gch=
ar *path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(fd &lt; 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D qga_open_cloexec(path, O_RDWR | O_=
NOCTTY | O_NONBLOCK, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error opening channel&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error opening channel &#39;%s&#39;&quot;, path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcgetattr(fd, &amp;tio);<br>
-- <br>
2.36.2<br>
<br>
</blockquote></div>

--00000000000002c67405ebf3651d--


