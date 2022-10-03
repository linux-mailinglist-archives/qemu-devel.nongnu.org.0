Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80F35F3188
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 15:53:36 +0200 (CEST)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofLt1-0006FJ-Vm
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 09:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ofLjD-0003xi-Bm
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:43:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ofLj8-0002CD-DM
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664804601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p7R4Fgl/uHTKpBug6Ba492MbHbEMzigsk9SrDyDhuIU=;
 b=EuJ+mtOkNHhP+UKV9DX2K/YK5DQ5DrRFG1XgXm91uowqH7XFy17a27jSgzzbjqhRbRTjU0
 ByZVsqcN1w89eIbgXe7Xf4gXt1xDXKq2wqnrS0/a0g4iRtRhMyTXbTdDY9LT5XeukKGH6n
 oc9ByEhrUB6L/orRQz4rVSf0aebmPXI=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-6JiHYam3PSu32x2Ef-8YqQ-1; Mon, 03 Oct 2022 09:43:18 -0400
X-MC-Unique: 6JiHYam3PSu32x2Ef-8YqQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 g15-20020a25af8f000000b006bcad4bf46aso10310383ybh.19
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 06:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=p7R4Fgl/uHTKpBug6Ba492MbHbEMzigsk9SrDyDhuIU=;
 b=b6R6TCsI8+0xuKbpMA0G0U6c2v2u7kqsJlzwZyMfOetSD5LSOG6ZPcO2pOsgpBSGGJ
 F3Qb7UHMlmygkwJHG0nGBSjH5WMTsSXuJi6N+q9yx9rx/KIudTQTzCwMQ6jwsax25oqS
 8P7hNEf3alw4cptHOeKmc50JF/xDrWk4ovJVuNv4YWxOEFn+VNGEBe/xeAHQ3PWkgUxl
 Uonga2uIyM1YaCOlqVxAPjR730xYamP/NgB9PVYrkyfeLGSZwCtfbiAbWWPNck1w4J6+
 dk5WcXrl0WVOO1/x9igLJvbFIzK7ei90Jq09RzuK5VMExx0NSEFoK/icBU9ZVteeaMiq
 WvJA==
X-Gm-Message-State: ACrzQf09FYlHu7mpp4LQyvGI6gaopwUpxS9ytV2HmY4ZyfEDZul1pj3g
 jFP1z6JLG/0MpnbM2IrALle7pknEAOuizoTnS/xGzSC2QgCjOIl77179lsLCtFTKeXdQGx+qqDM
 CZEEAGPO3sEYdlhon3/kCFSJsrBw9zBs=
X-Received: by 2002:a5b:402:0:b0:6bc:b975:9dbf with SMTP id
 m2-20020a5b0402000000b006bcb9759dbfmr19583924ybp.437.1664804598145; 
 Mon, 03 Oct 2022 06:43:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7iq/JY+ppSTbyBB1i+OuqYEw5qjSSmTygTM+cuClR/MiC0q/rZEgPVUbA16wwuv19BqZPECO2YxEOrmwIPf3E=
X-Received: by 2002:a5b:402:0:b0:6bc:b975:9dbf with SMTP id
 m2-20020a5b0402000000b006bcb9759dbfmr19583909ybp.437.1664804597954; Mon, 03
 Oct 2022 06:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
 <20221003093911.1844031-5-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20221003093911.1844031-5-alexander.ivanov@virtuozzo.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 3 Oct 2022 16:43:06 +0300
Message-ID: <CAPMcbCoscJmS_R+3FAVnyNz4FLBq4mH2Hbuhb0LMg7bJOSC_Vw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] qga: Add shutdown/halt/reboot support for FreeBSD
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 marcandre.lureau@gmail.com
Content-Type: multipart/alternative; boundary="000000000000ae8d8d05ea2186d2"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ae8d8d05ea2186d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Mon, Oct 3, 2022 at 12:39 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> Add appropriate shutdown command arguments to qmp_guest_shutdown()
> for FreeBSD.
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>  qga/commands-posix.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 49f9996a9c..88e0d0fe24 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -90,6 +90,10 @@ void qmp_guest_shutdown(bool has_mode, const char
> *mode, Error **errp)
>      const char *powerdown_flag =3D "-i5";
>      const char *halt_flag =3D "-i0";
>      const char *reboot_flag =3D "-i6";
> +#elif defined(CONFIG_BSD)
> +    const char *powerdown_flag =3D "-p";
> +    const char *halt_flag =3D "-h";
> +    const char *reboot_flag =3D "-r";
>  #else
>      const char *powerdown_flag =3D "-P";
>      const char *halt_flag =3D "-H";
> @@ -120,6 +124,9 @@ void qmp_guest_shutdown(bool has_mode, const char
> *mode, Error **errp)
>  #ifdef CONFIG_SOLARIS
>          execl("/sbin/shutdown", "shutdown", shutdown_flag, "-g0", "-y",
>                "hypervisor initiated shutdown", (char *)NULL);
> +#elif defined(CONFIG_BSD)
> +        execl("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
> +               "hypervisor initiated shutdown", (char *)NULL);
>  #else
>          execl("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
>                 "hypervisor initiated shutdown", (char *)NULL);
> --
> 2.34.1
>
>

--000000000000ae8d8d05ea2186d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 3=
, 2022 at 12:39 PM Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@=
virtuozzo.com">alexander.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Add appropriate shutdown comma=
nd arguments to qmp_guest_shutdown()<br>
for FreeBSD.<br>
<br>
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-posix.c | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 49f9996a9c..88e0d0fe24 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -90,6 +90,10 @@ void qmp_guest_shutdown(bool has_mode, const char *mode,=
 Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0const char *powerdown_flag =3D &quot;-i5&quot;;<br>
=C2=A0 =C2=A0 =C2=A0const char *halt_flag =3D &quot;-i0&quot;;<br>
=C2=A0 =C2=A0 =C2=A0const char *reboot_flag =3D &quot;-i6&quot;;<br>
+#elif defined(CONFIG_BSD)<br>
+=C2=A0 =C2=A0 const char *powerdown_flag =3D &quot;-p&quot;;<br>
+=C2=A0 =C2=A0 const char *halt_flag =3D &quot;-h&quot;;<br>
+=C2=A0 =C2=A0 const char *reboot_flag =3D &quot;-r&quot;;<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0const char *powerdown_flag =3D &quot;-P&quot;;<br>
=C2=A0 =C2=A0 =C2=A0const char *halt_flag =3D &quot;-H&quot;;<br>
@@ -120,6 +124,9 @@ void qmp_guest_shutdown(bool has_mode, const char *mode=
, Error **errp)<br>
=C2=A0#ifdef CONFIG_SOLARIS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execl(&quot;/sbin/shutdown&quot;, &quot;s=
hutdown&quot;, shutdown_flag, &quot;-g0&quot;, &quot;-y&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hypervisor ini=
tiated shutdown&quot;, (char *)NULL);<br>
+#elif defined(CONFIG_BSD)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(&quot;/sbin/shutdown&quot;, &quot;shutdo=
wn&quot;, shutdown_flag, &quot;+0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hypervisor in=
itiated shutdown&quot;, (char *)NULL);<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execl(&quot;/sbin/shutdown&quot;, &quot;s=
hutdown&quot;, &quot;-h&quot;, shutdown_flag, &quot;+0&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;hypervisor in=
itiated shutdown&quot;, (char *)NULL);<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000ae8d8d05ea2186d2--


