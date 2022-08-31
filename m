Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783125A7E1E
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 14:58:17 +0200 (CEST)
Received: from localhost ([::1]:42478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNIN-0003pR-0g
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 08:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNFC-0007zz-9G; Wed, 31 Aug 2022 08:54:58 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:46736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNF9-0001KP-KQ; Wed, 31 Aug 2022 08:54:57 -0400
Received: by mail-lj1-x22b.google.com with SMTP id k18so8123526lji.13;
 Wed, 31 Aug 2022 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ETY0PHffKg53qROeEeN5OdhIGLApMmoln1S1hh4FPpM=;
 b=HM9cj2qTO68TVlA0MsSELGqB5pYID82R2pMK1BazG6V63r9kgquciHASHjscRO89YL
 e3TF2SnddDT3SZSf1onayiadV11TkP8nf5x2QiwTA9JQB4wVnSSuaqjbMCEE4cITvCov
 huJwjQGdkBvzpnkfVAHsDZRfC25IlC04jzdJF2qBE14kop0zYCFpb60sWigfD1ppQsRE
 fvR1h5ByPR4a8QtrHBh5Z9GEAlLSCUgE+d+xlCJlIARdZZXkxyasj/7UXRX9BFZkf3lq
 VPftFyXJ9uIB084lSFfK1FqQf1ctVcqAiXFS4d/CJ6jk3FQVovOakLw3zJsGprBtQg2d
 Lw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ETY0PHffKg53qROeEeN5OdhIGLApMmoln1S1hh4FPpM=;
 b=DbHMCQpqUnw+KUoR74SRmUx98FHKtqm5RcenOTtSdQ0ZM5/aV4B9LJkW3gpxGVm/hN
 98O8TOSoplAAXHh6p8G7/wEczx6ycr5Sf2eHVm640ELls/FO+juUMh4G8+Y+0WzUT6Bp
 +IRx33j5H1Ubj9s7Nuu7laGr7++Y1a9jtzUJd5HDtrBVya9FGp7RovLkp2k9UnoS3GDj
 kloeZYOvafLlW0d2JcvphED24e+w4j9B0VmKYQpDgxTbMDG/Ak+NwEuFt5N+itpBj40J
 cuuY7KdrLv9MCAtywBHqgAcRVk+k5ndRqvYWPKaYwjXAmWrrOeN8CiqneVccU9c2aQAb
 woAg==
X-Gm-Message-State: ACgBeo3ol2MXA6mdtsN1bGeVcrFRNxTdWpz2gPanrvObSOXlheP9086f
 s850XlPPk4rgLQrZWSuJRYyDNWRf7jNKCavGKzo=
X-Google-Smtp-Source: AA6agR63ZztN7PWdVlvfRM3DWWR0DtWQnObu2JUUrfYcZYqjHkXBbd/HQtGk+chPa4JD2wUJV5XE20FbtXUQBYfMKmU=
X-Received: by 2002:a05:651c:451:b0:263:7cfc:1c0b with SMTP id
 g17-20020a05651c045100b002637cfc1c0bmr5213409ljg.94.1661950493230; Wed, 31
 Aug 2022 05:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-4-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-4-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 16:54:41 +0400
Message-ID: <CAJ+F1CJAb-jz8=4hwDhpUQbbtXj_SoW44TwOmuH8MQWagbrD5Q@mail.gmail.com>
Subject: Re: [PATCH 03/51] block: Unify the get_tmp_filename() implementation
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c88a3c05e78900f2"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000c88a3c05e78900f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bin

On Wed, Aug 24, 2022 at 1:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present get_tmp_filename() has platform specific implementations
> to get the directory to use for temporary files. Switch over to use
> g_get_tmp_dir() which works on all supported platforms.
>
>
It "works" quite differently though. Is this patch really necessary here?

If yes, please explain why.

If not, I suggest you drop optional / rfc / "nice to have" patches from the
series. It will help to get it merged faster.

thanks



> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  block.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/block.c b/block.c
> index bc85f46eed..d06df47f72 100644
> --- a/block.c
> +++ b/block.c
> @@ -864,21 +864,10 @@ int bdrv_probe_geometry(BlockDriverState *bs,
> HDGeometry *geo)
>   */
>  int get_tmp_filename(char *filename, int size)
>  {
> -#ifdef _WIN32
> -    char temp_dir[MAX_PATH];
> -    /* GetTempFileName requires that its output buffer (4th param)
> -       have length MAX_PATH or greater.  */
> -    assert(size >=3D MAX_PATH);
> -    return (GetTempPath(MAX_PATH, temp_dir)
> -            && GetTempFileName(temp_dir, "qem", 0, filename)
> -            ? 0 : -GetLastError());
> -#else
>      int fd;
>      const char *tmpdir;
> -    tmpdir =3D getenv("TMPDIR");
> -    if (!tmpdir) {
> -        tmpdir =3D "/var/tmp";
> -    }
> +    tmpdir =3D g_get_tmp_dir();
> +
>      if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >=3D size) {
>          return -EOVERFLOW;
>      }
> @@ -891,7 +880,6 @@ int get_tmp_filename(char *filename, int size)
>          return -errno;
>      }
>      return 0;
> -#endif
>  }
>
>  /*
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c88a3c05e78900f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Bin<br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 1:42 PM=
 Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">b=
in.meng@windriver.com</a>&gt;<br>
<br>
At present get_tmp_filename() has platform specific implementations<br>
to get the directory to use for temporary files. Switch over to use<br>
g_get_tmp_dir() which works on all supported platforms.<br>
<br></blockquote><div><br></div><div>It &quot;works&quot; quite differently=
 though. Is this patch really necessary here? <br></div><div><br></div><div=
>If yes, please explain why.</div><div><br></div><div>If not, I suggest you=
 drop optional / rfc / &quot;nice to have&quot; patches from the series. It=
 will help to get it merged faster.</div><div><br></div><div>thanks<br></di=
v><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0block.c | 16 ++--------------<br>
=C2=A01 file changed, 2 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/block.c b/block.c<br>
index bc85f46eed..d06df47f72 100644<br>
--- a/block.c<br>
+++ b/block.c<br>
@@ -864,21 +864,10 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeome=
try *geo)<br>
=C2=A0 */<br>
=C2=A0int get_tmp_filename(char *filename, int size)<br>
=C2=A0{<br>
-#ifdef _WIN32<br>
-=C2=A0 =C2=A0 char temp_dir[MAX_PATH];<br>
-=C2=A0 =C2=A0 /* GetTempFileName requires that its output buffer (4th para=
m)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0have length MAX_PATH or greater.=C2=A0 */<br>
-=C2=A0 =C2=A0 assert(size &gt;=3D MAX_PATH);<br>
-=C2=A0 =C2=A0 return (GetTempPath(MAX_PATH, temp_dir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; GetTempFileName(temp_=
dir, &quot;qem&quot;, 0, filename)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? 0 : -GetLastError());<br>
-#else<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
=C2=A0 =C2=A0 =C2=A0const char *tmpdir;<br>
-=C2=A0 =C2=A0 tmpdir =3D getenv(&quot;TMPDIR&quot;);<br>
-=C2=A0 =C2=A0 if (!tmpdir) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpdir =3D &quot;/var/tmp&quot;;<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 tmpdir =3D g_get_tmp_dir();<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (snprintf(filename, size, &quot;%s/vl.XXXXXX&quot;, =
tmpdir) &gt;=3D size) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOVERFLOW;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -891,7 +880,6 @@ int get_tmp_filename(char *filename, int size)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -errno;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
-#endif<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c88a3c05e78900f2--

