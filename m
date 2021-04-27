Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1313A36C8EA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:55:09 +0200 (CEST)
Received: from localhost ([::1]:52090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbQ3H-0005pc-La
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lbQ1v-0004f2-Oa
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:53:43 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lbQ1u-0002TV-0c
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:53:43 -0400
Received: by mail-ed1-x531.google.com with SMTP id g10so2599913edb.0
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 08:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fwKxPFzaBwnovi3S3KiMsaunUkouQrJVia/oq7zsiLw=;
 b=MYnehIHBIPrHwq5aaPrlEqJAdu2o8AAQMFyKSc1N5F0WhnIyFgXdIl3LgDJuClfBnF
 /2BWk2+9YRZK0YcaMjrA1n+M3GnES/U7cj0ug9Ih2nC8JfDZAM3bMH+3zUXlUfgixv7h
 9j/1fEmTlYuGvSNZD2B2KeB7J5x0+JEOwvPj41jVQ6YQ9jYZqi117eL5s3tZfZqtHFnj
 wCKEnB1IjDP80r76wZeYor26llI1D3ZHiQewA5Y1DFR32KXQYQu4qqLK9ax6i7l+nQEO
 crGrDpMzURXHQnehRsKztCmScL0qRJ1s+90JsSOv8FZPuthI9T0dOg9SCxxfEWfxyeyz
 GtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fwKxPFzaBwnovi3S3KiMsaunUkouQrJVia/oq7zsiLw=;
 b=V9vX9u6rG8AmahMel/pQFkX24YwZ9TObOOhXfqkvZdwGvPl1paxhUcAqtSrppu4GvK
 rp7o0KKfVf4IEf9SZxPxdr4jqWjbetklvjgmCbCppqsfXIQOt3wywqI/acOdS3cdEg9e
 7wxThdrH2lMCZ+2sY7Z0pUkUmbaVHdTv4tuaOAk4zI+mHmMAEI9N9j4yRFJPy+3PkPL7
 39wD0XIF5eqmpZyJVr9txt8UC1pUx7Pgg4xZEd7De6axKjBzRxxMaOyWImDLcKURjTce
 TaXWKykGmAxlesSi35b3mMWQFd5rDOcDB0+dlnvC3dv4u/8zA7U+29diesFaEZznqByy
 OjlQ==
X-Gm-Message-State: AOAM532pGXMMDUEHLIcqb85a0BQwzyy/pGSyuB2QsqHWibLncagcihWo
 lofFieXdQ2JeQYzG62vRIbsa2VOTLBrrlZx2dSE=
X-Google-Smtp-Source: ABdhPJzAUT+yaJt1KQ0+ABUISuABLCM0KQI4QLEOLLoVVer8jCa1jm8FEkvq3DE8+/67owDgc0/7wCF1wjG1ftQZpi4=
X-Received: by 2002:a50:d4dd:: with SMTP id e29mr5270310edj.257.1619538819982; 
 Tue, 27 Apr 2021 08:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210427150824.638359-1-kraxel@redhat.com>
 <20210427150824.638359-2-kraxel@redhat.com>
In-Reply-To: <20210427150824.638359-2-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Apr 2021 19:53:28 +0400
Message-ID: <CAJ+F1CLojkyQtjb8YgjfmtNocKE80+ujs_2_30VPogj6od_WVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] qemu-edid: use qemu_edid_size()
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000010a9b205c0f6441d"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000010a9b205c0f6441d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 7:15 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> So we only write out that part of the edid blob
> which has been filled with data.
> Also use a larger buffer for the blob.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  qemu-edid.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/qemu-edid.c b/qemu-edid.c
> index 1cd6a9517238..c3a9fba10dc4 100644
> --- a/qemu-edid.c
> +++ b/qemu-edid.c
> @@ -41,7 +41,8 @@ static void usage(FILE *out)
>  int main(int argc, char *argv[])
>  {
>      FILE *outfile =3D NULL;
> -    uint8_t blob[256];
> +    uint8_t blob[512];
> +    size_t size;
>      uint32_t dpi =3D 100;
>      int rc;
>
> @@ -119,7 +120,8 @@ int main(int argc, char *argv[])
>
>      memset(blob, 0, sizeof(blob));
>      qemu_edid_generate(blob, sizeof(blob), &info);
> -    fwrite(blob, sizeof(blob), 1, outfile);
> +    size =3D qemu_edid_size(blob);
> +    fwrite(blob, size, 1, outfile);
>      fflush(outfile);
>
>      exit(0);
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000010a9b205c0f6441d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 27, 2021 at 7:15 PM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">So we on=
ly write out that part of the edid blob<br>
which has been filled with data.<br>
Also use a larger buffer for the blob.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qemu-edid.c | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qemu-edid.c b/qemu-edid.c<br>
index 1cd6a9517238..c3a9fba10dc4 100644<br>
--- a/qemu-edid.c<br>
+++ b/qemu-edid.c<br>
@@ -41,7 +41,8 @@ static void usage(FILE *out)<br>
=C2=A0int main(int argc, char *argv[])<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0FILE *outfile =3D NULL;<br>
-=C2=A0 =C2=A0 uint8_t blob[256];<br>
+=C2=A0 =C2=A0 uint8_t blob[512];<br>
+=C2=A0 =C2=A0 size_t size;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t dpi =3D 100;<br>
=C2=A0 =C2=A0 =C2=A0int rc;<br>
<br>
@@ -119,7 +120,8 @@ int main(int argc, char *argv[])<br>
<br>
=C2=A0 =C2=A0 =C2=A0memset(blob, 0, sizeof(blob));<br>
=C2=A0 =C2=A0 =C2=A0qemu_edid_generate(blob, sizeof(blob), &amp;info);<br>
-=C2=A0 =C2=A0 fwrite(blob, sizeof(blob), 1, outfile);<br>
+=C2=A0 =C2=A0 size =3D qemu_edid_size(blob);<br>
+=C2=A0 =C2=A0 fwrite(blob, size, 1, outfile);<br>
=C2=A0 =C2=A0 =C2=A0fflush(outfile);<br>
<br>
=C2=A0 =C2=A0 =C2=A0exit(0);<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000010a9b205c0f6441d--

