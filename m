Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9898252ED69
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 15:44:55 +0200 (CEST)
Received: from localhost ([::1]:39988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns2w2-0001p4-Ny
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 09:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ns2un-0000W4-3L
 for qemu-devel@nongnu.org; Fri, 20 May 2022 09:43:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ns2ul-0006lJ-9G
 for qemu-devel@nongnu.org; Fri, 20 May 2022 09:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653054214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cvqHoI6xuUJ4ZP29DcTeU1JkZgn8Sa7wpgLOB5dcdpk=;
 b=LjJ6KKO8qR5kV/PG5XJt86fYXSBGPhknxJnc5QWtyRhhqkEVb0IRd9RKVhLITfRuJEMKCs
 K0gGEuvgrUl4tsv4q5qVEfqkTqWQLKLSgSv2KEpdemGciqllNw0fTw6dJ8iLRminwnHR9u
 uC6FPzDazKxPsg8Oi3Hl3/dpk9Uiv5s=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-jZKFsmBKNWadlZSJTn_YfQ-1; Fri, 20 May 2022 09:43:32 -0400
X-MC-Unique: jZKFsmBKNWadlZSJTn_YfQ-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2dc7bdd666fso71998587b3.7
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 06:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cvqHoI6xuUJ4ZP29DcTeU1JkZgn8Sa7wpgLOB5dcdpk=;
 b=QpX38uaLsWJuosWA33u5HUvrugEXoJMntWHkw/V5Kh8r0Iciu5Jpb589U6X0f7TmYV
 4+q0aySyq2EH4SNZZPg8MT4obCwY4+Km1HSsEvlbUgoKsDoMlgoYTah6EiWzdB9/7f4i
 ogIlYirepQyyiMMMSgrJIMo4GEQpHORSyJi6rvtfFLZ5AAJdGGQNTFceUgUA8bWKvYTc
 i0tyXtCysqlu6oh4gIqBI5Slgz9TKfVE476MDLzWl3QkoCjue6TyiTujpZ3/INezzBDB
 F89DZkG1pKH+WKZ/lSoiVsDKIGAUe0U8dJvp8E+R+R0T/eQlrgJfEhSwuKM5MP1c1QH8
 Yu6Q==
X-Gm-Message-State: AOAM530z6i/laBBz1v77CFtebNCAJ5EofeDqmPWaOaW2sZH1//Vmeh1Y
 JTS4CpOqG9TE7LZ4nRqfOwuzidQrEGxhgz3j6pod01t1pPrDY6oN0IzYaGrl5lEiIOzVDf0dMGM
 Zg3Wnl/3XAROsIH9GCL1xo2+xgtOcBmE=
X-Received: by 2002:a05:6902:729:b0:64f:3cfb:6d28 with SMTP id
 l9-20020a056902072900b0064f3cfb6d28mr6979898ybt.30.1653054212385; 
 Fri, 20 May 2022 06:43:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjI8qvlzS0fLVSzFAOlDXDyLSp/upii7UR9s+eEZI3Gwh9e9OjrkJOxIh4nwZ8jlevaTKZh4FBIRMKCoYzF04=
X-Received: by 2002:a05:6902:729:b0:64f:3cfb:6d28 with SMTP id
 l9-20020a056902072900b0064f3cfb6d28mr6979883ybt.30.1653054212183; Fri, 20 May
 2022 06:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-11-marcandre.lureau@redhat.com>
In-Reply-To: <20220513180821.905149-11-marcandre.lureau@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Fri, 20 May 2022 16:43:21 +0300
Message-ID: <CAPMcbCqtiJeN58Bj+n_TXQeHCVEx1LJvwKB2qjKQ8T+U3b-+hA@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] test/qga: use G_TEST_DIR to locate os-release
 test file
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001ca7f105df71ad55"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000001ca7f105df71ad55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Fri, May 13, 2022 at 9:08 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This a more accurate way to lookup the test data, and will allow to move
> the test in a subproject.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/unit/test-qga.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> index d6df1ee92e..ab0b12a2dd 100644
> --- a/tests/unit/test-qga.c
> +++ b/tests/unit/test-qga.c
> @@ -914,15 +914,14 @@ static void test_qga_guest_get_osinfo(gconstpointer
> data)
>  {
>      TestFixture fixture;
>      const gchar *str;
> -    gchar *cwd, *env[2];
> -    QDict *ret, *val;
> +    QDict *ret =3D NULL;
> +    char *env[2];

+    QDict *val;
>
> -    cwd =3D g_get_current_dir();
>      env[0] =3D g_strdup_printf(
> -        "QGA_OS_RELEASE=3D%s%ctests%cdata%ctest-qga-os-release",
> -        cwd, G_DIR_SEPARATOR, G_DIR_SEPARATOR, G_DIR_SEPARATOR);
> +        "QGA_OS_RELEASE=3D%s%c..%cdata%ctest-qga-os-release",
> +        g_test_get_dir(G_TEST_DIST), G_DIR_SEPARATOR, G_DIR_SEPARATOR,
> G_DIR_SEPARATOR);
>      env[1] =3D NULL;
> -    g_free(cwd);
>      fixture_setup(&fixture, NULL, env);
>
>      ret =3D qmp_fd(fixture.fd, "{'execute': 'guest-get-osinfo'}");
> --
> 2.36.1
>
>

--0000000000001ca7f105df71ad55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a hr=
ef=3D"mailto:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>=
&gt;</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, May 13, 2022 at 9:08 PM &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a>&gt;<br>
<br>
This a more accurate way to lookup the test data, and will allow to move<br=
>
the test in a subproject.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/unit/test-qga.c | 11 +++++------<br>
=C2=A01 file changed, 5 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c<br>
index d6df1ee92e..ab0b12a2dd 100644<br>
--- a/tests/unit/test-qga.c<br>
+++ b/tests/unit/test-qga.c<br>
@@ -914,15 +914,14 @@ static void test_qga_guest_get_osinfo(gconstpointer d=
ata)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0TestFixture fixture;<br>
=C2=A0 =C2=A0 =C2=A0const gchar *str;<br>
-=C2=A0 =C2=A0 gchar *cwd, *env[2];<br>
-=C2=A0 =C2=A0 QDict *ret, *val;<br>
+=C2=A0 =C2=A0 QDict *ret =3D NULL;<br>
+=C2=A0 =C2=A0 char *env[2];</blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+=C2=A0 =C2=A0 QDict *val;<br>
<br>
-=C2=A0 =C2=A0 cwd =3D g_get_current_dir();<br>
=C2=A0 =C2=A0 =C2=A0env[0] =3D g_strdup_printf(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;QGA_OS_RELEASE=3D%s%ctests%cdata%ctest-q=
ga-os-release&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cwd, G_DIR_SEPARATOR, G_DIR_SEPARATOR, G_DIR_S=
EPARATOR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;QGA_OS_RELEASE=3D%s%c..%cdata%ctest-qga-=
os-release&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_get_dir(G_TEST_DIST), G_DIR_SEPARATOR, =
G_DIR_SEPARATOR, G_DIR_SEPARATOR);<br>
=C2=A0 =C2=A0 =C2=A0env[1] =3D NULL;<br>
-=C2=A0 =C2=A0 g_free(cwd);<br>
=C2=A0 =C2=A0 =C2=A0fixture_setup(&amp;fixture, NULL, env);<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qmp_fd(fixture.fd, &quot;{&#39;execute&#39;: &#=
39;guest-get-osinfo&#39;}&quot;);<br>
-- <br>
2.36.1<br>
<br>
</blockquote></div></div>

--0000000000001ca7f105df71ad55--


