Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEED5FC30D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:28:06 +0200 (CEST)
Received: from localhost ([::1]:36720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiY20-0008KA-W8
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oiXw9-0001KS-6T; Wed, 12 Oct 2022 05:22:01 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:39827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oiXw7-0003Fj-AI; Wed, 12 Oct 2022 05:22:00 -0400
Received: by mail-lf1-x136.google.com with SMTP id b2so24878523lfp.6;
 Wed, 12 Oct 2022 02:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wt2ePo6D6POclD3s5cZgeIsdk/DIA9HOAFBhG9V0t3E=;
 b=kuml+gZK+P+r5mnoYK/nmHNtaCb3QmoglpREEedNXkCSLIgOC0ce2NBvZfeo3tVNg2
 9gvNOZPy8cCJaK38qP/gzcSHkprIvpisD84L3jvp8nUQedeew1DsTybkl0TuI/Lw/05J
 2aoVYPlZtTl5EcxP/Qfbc+gwckZ7RIOtuCDJno4DNRLnctWrzOIGvhe21kW8kHCddlH7
 6+dDiR8W580snyIeBJbyyKAKey0qjjaV8v8oipuHqr6HTkqEVXyjMcZuErcgjszeMfUj
 /Zw5Kjn0U4FGvE50aLS0HIMdCOitO8kLbn78W3S8ocp0JUCnX0GVEk3cXbSjWAsERhai
 jRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wt2ePo6D6POclD3s5cZgeIsdk/DIA9HOAFBhG9V0t3E=;
 b=YpRLKDuJyFQXwHsnDd8aOX1cXO9EiXmIyn/G3+bXjiPFKYx0CQSRQ7Vs5sBA4GRicm
 juhTMDFc/vh9fuMQJSo3mkqQ93YSSjYkn6CGeMg3Cn23Cc01F+5GMomCq9W7lfl2TbC3
 jMwukQ7R5BT1KTFr6+I07k9IBPSXlbDOFpfG7PhetfqiGNdRrSCAqqwiScGmd6qrEenY
 ZrTcDW/wjfT+AYHSzdQkqcPBZadNOqH9rKPv7F7FF/Kq/F3O0SwD4PWQYoP2rnTuJBXm
 qht5Gco8+i5LfkPhW3pwU4B31Qg32RLD6P1WVT5zP6+Uj+ddFJyrkkq+Q3vq1Z4SJ71n
 kvGw==
X-Gm-Message-State: ACrzQf1YaUh6YXHd5KC79N9nUgppYSSoh2eJSU9GZA/8DkKVnK0zq2pk
 jMFjmonV89fscD+A4JyrsJFB+G4ShDFfcsjJfEs=
X-Google-Smtp-Source: AMsMyM4urBDLvkaRLL29BGwlmhFkbJPKvBvu0vHqSFsVP5FYQNNtimjRVgy9B7ZRHHEnihNlshLJCOFVQPcsGcUPdbM=
X-Received: by 2002:a05:6512:419:b0:4a2:2e45:bf0 with SMTP id
 u25-20020a056512041900b004a22e450bf0mr11115854lfk.356.1665566516770; Wed, 12
 Oct 2022 02:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221012085932.799221-1-thuth@redhat.com>
In-Reply-To: <20221012085932.799221-1-thuth@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 12 Oct 2022 13:21:45 +0400
Message-ID: <CAJ+F1C+ebT3se0QUNwUxiC_1TAnuDhTkW2jus3DmsgPOEKSypA@mail.gmail.com>
Subject: Re: [PATCH] tests/unit/test-image-locking: Fix handling of temporary
 files
To: Thomas Huth <thuth@redhat.com>, Bin Meng <bin.meng@windriver.com>
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000094fb5805ead2ec7e"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000094fb5805ead2ec7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Oct 12, 2022 at 1:03 PM Thomas Huth <thuth@redhat.com> wrote:

> test-image-locking leaves some temporary files around - clean
> them up. While we're at it, test-image-locking is a unit test,
> so it should not use "qtest.*" for temporary file names. Give
> them better names instead, so that it clear where the temporary
> files come from.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/unit/test-image-locking.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/unit/test-image-locking.c
> b/tests/unit/test-image-locking.c
> index a47299c247..2624cec6a0 100644
> --- a/tests/unit/test-image-locking.c
> +++ b/tests/unit/test-image-locking.c
> @@ -79,7 +79,7 @@ static void test_image_locking_basic(void)
>      g_autofree char *img_path =3D NULL;
>      uint64_t perm, shared_perm;
>
> -    int fd =3D g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
> +    int fd =3D g_file_open_tmp("qemu-tst-img-lock.XXXXXX", &img_path, NU=
LL);
>      assert(fd >=3D 0);
>
>      perm =3D BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
> @@ -120,7 +120,7 @@ static void test_set_perm_abort(void)
>      g_autofree char *img_path =3D NULL;
>      uint64_t perm, shared_perm;
>      int r;
> -    int fd =3D g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
> +    int fd =3D g_file_open_tmp("qemu-tst-img-lock.XXXXXX", &img_path, NU=
LL);
>      assert(fd >=3D 0);
>
>      perm =3D BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
> @@ -140,6 +140,8 @@ static void test_set_perm_abort(void)
>      check_locked_bytes(fd, perm, ~shared_perm);
>      blk_unref(blk1);
>      blk_unref(blk2);
> +    close(fd);
> +    unlink(img_path);
>

Perhaps we should use g_unlink() instead for better portability? although
this is pre-existing.

otherwise, lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


--=20
Marc-Andr=C3=A9 Lureau

--00000000000094fb5805ead2ec7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 12, 2022 at 1:03 PM Tho=
mas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">test-image=
-locking leaves some temporary files around - clean<br>
them up. While we&#39;re at it, test-image-locking is a unit test,<br>
so it should not use &quot;qtest.*&quot; for temporary file names. Give<br>
them better names instead, so that it clear where the temporary<br>
files come from.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/unit/test-image-locking.c | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/unit/test-image-locking.c b/tests/unit/test-image-lockin=
g.c<br>
index a47299c247..2624cec6a0 100644<br>
--- a/tests/unit/test-image-locking.c<br>
+++ b/tests/unit/test-image-locking.c<br>
@@ -79,7 +79,7 @@ static void test_image_locking_basic(void)<br>
=C2=A0 =C2=A0 =C2=A0g_autofree char *img_path =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t perm, shared_perm;<br>
<br>
-=C2=A0 =C2=A0 int fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;im=
g_path, NULL);<br>
+=C2=A0 =C2=A0 int fd =3D g_file_open_tmp(&quot;qemu-tst-img-lock.XXXXXX&qu=
ot;, &amp;img_path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0assert(fd &gt;=3D 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0perm =3D BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;<br>
@@ -120,7 +120,7 @@ static void test_set_perm_abort(void)<br>
=C2=A0 =C2=A0 =C2=A0g_autofree char *img_path =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t perm, shared_perm;<br>
=C2=A0 =C2=A0 =C2=A0int r;<br>
-=C2=A0 =C2=A0 int fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;im=
g_path, NULL);<br>
+=C2=A0 =C2=A0 int fd =3D g_file_open_tmp(&quot;qemu-tst-img-lock.XXXXXX&qu=
ot;, &amp;img_path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0assert(fd &gt;=3D 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0perm =3D BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;<br>
@@ -140,6 +140,8 @@ static void test_set_perm_abort(void)<br>
=C2=A0 =C2=A0 =C2=A0check_locked_bytes(fd, perm, ~shared_perm);<br>
=C2=A0 =C2=A0 =C2=A0blk_unref(blk1);<br>
=C2=A0 =C2=A0 =C2=A0blk_unref(blk2);<br>
+=C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 unlink(img_path);<br></blockquote><div><br></div><div>Perhap=
s we should use g_unlink() instead for better portability? although this is=
 pre-existing.</div><div>=C2=A0<br></div><div>otherwise, lgtm</div><div>Rev=
iewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@red=
hat.com">marcandre.lureau@redhat.com</a>&gt;<br><br></div></div><br>-- <br>=
<div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div>=
</div>

--00000000000094fb5805ead2ec7e--

