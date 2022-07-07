Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB1F569E35
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:57:47 +0200 (CEST)
Received: from localhost ([::1]:56664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9NKU-0002xP-PG
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o9N3e-0004ii-7e; Thu, 07 Jul 2022 04:40:28 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:46801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o9N3a-0003VL-II; Thu, 07 Jul 2022 04:40:19 -0400
Received: by mail-lf1-x131.google.com with SMTP id bf9so6683146lfb.13;
 Thu, 07 Jul 2022 01:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g+HgBPRNMnfQn9NM8UnioSQ5ZsmTbtQMVSOdunrUHE4=;
 b=n86MBmSfAgYs6YF3dqgWa/dr0hVjIeKgRqyF9e81Kuh9bRgpYgllabmhNSs0tLk2Hc
 lsBu1oui3V+0KRCLRCzUxgkruzQ1Yd0qYJCbmUtWBG4ZbLEqEi7cqQe6tjTEFzjIAnDr
 PU7VXDsaaQG5RYloHPV04FaO93FvNbAk5v7Ukf6c0HnxUgOR7qMhT0Rf98NdQ3JdQAUH
 EU255fOpWTMhEP5fCFIzEIkrv0nyROhf+yXl8izqzsTuehZH7vyGb71HKknwDZk2h2rf
 mBy6eU6sYVz/fL/q5+i4iO7bxcYQ26OymQLNCjrwgAWfZS0x9siQHm7M9FrCePXNiAnZ
 cFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g+HgBPRNMnfQn9NM8UnioSQ5ZsmTbtQMVSOdunrUHE4=;
 b=NNht4YaGy2byQtECIaMWY47LaBKgZcwppMIXKqDDVgAC4hAT0Xmm5NNAoN8KfmTq9P
 X3q+/Gs2H0f7tf79+n7WhmM7wQiS3IZaerfproGxE3UYGrZYtOhjAcwk9YRCVwyKMbpH
 kcIVbiOld5spZzElqanY+k50MWYOXpmO55La+wgeEK0dHmgjo7+y+Ypqkm6FgSJzCAs0
 PvyRVArG+vNCPynG2pWyhSON1dMisvl1e/gpZTFFkHSmRnb26+hysvcldbUuCBJLNbBt
 oxatgD0GXBx1PpjMMj+SndwZ8al8JJya/CTm/uINl0ewA3zqTdNO8JOzYfzwQnzRVhVK
 3b7A==
X-Gm-Message-State: AJIora+EGimcaC43D6gfFTLjLDtkQ7/wk5lRwV40/tEkCh45exncDZhE
 k4I5YzokcoiXXoPxoPPFbY29DOL0hl8z+xN4KZ8=
X-Google-Smtp-Source: AGRyM1ufhZIQPJRLOvsE21qWyWi6OaDhWSUZWhMxtiXv/8Q5LtlGTW+QCXS/xcv2HlPbBtfm+zlRxrn6ZPwBAMNpTcE=
X-Received: by 2002:ac2:4d22:0:b0:47f:65b5:35ec with SMTP id
 h2-20020ac24d22000000b0047f65b535ecmr29353722lfk.432.1657183214812; Thu, 07
 Jul 2022 01:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220707040310.4163682-1-jsnow@redhat.com>
 <20220707040310.4163682-2-jsnow@redhat.com>
In-Reply-To: <20220707040310.4163682-2-jsnow@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 7 Jul 2022 12:40:02 +0400
Message-ID: <CAJ+F1C+NAmgaMxB-XuzNUvn3i_=bK8pf0cEY+=06NZc4V5+fYQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] qga: treat get-guest-fsinfo as "best effort"
To: John Snow <jsnow@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d8c2bf05e3330852"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
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

--000000000000d8c2bf05e3330852
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jul 7, 2022 at 8:10 AM John Snow <jsnow@redhat.com> wrote:

> In some container environments, there may be references to block devices
> witnessable from a container through /proc/self/mountinfo that reference
> devices we simply don't have access to in the container, and cannot
> provide information about.
>
> Instead of failing the entire fsinfo command, return stub information
> for these failed lookups.
>
> This allows test-qga to pass under docker tests, which are in turn used
> by the CentOS VM tests.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  qga/commands-posix.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 0469dc409d4..950c9d72fe7 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -1207,7 +1207,12 @@ static void build_guest_fsinfo_for_device(char
> const *devpath,
>
>      syspath =3D realpath(devpath, NULL);
>      if (!syspath) {
> -        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
> +        if (errno =3D=3D ENOENT) {
> +            /* This devpath may not exist because of container config,
> etc. */
> +            fs->name =3D g_path_get_basename(devpath);
> +        } else {
> +            error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
> +        }
>

It looks like this function is called recursively with the same "fs"
argument. That's probably why there is a if (!fs->name) check next. You may
want to check it too to avoid leaks and incorrect info.


>          return;
>      }
>
> --
> 2.34.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d8c2bf05e3330852
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 7, 2022 at 8:10 AM John=
 Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In some conta=
iner environments, there may be references to block devices<br>
witnessable from a container through /proc/self/mountinfo that reference<br=
>
devices we simply don&#39;t have access to in the container, and cannot<br>
provide information about.<br>
<br>
Instead of failing the entire fsinfo command, return stub information<br>
for these failed lookups.<br>
<br>
This allows test-qga to pass under docker tests, which are in turn used<br>
by the CentOS VM tests.<br>
<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-posix.c | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 0469dc409d4..950c9d72fe7 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -1207,7 +1207,12 @@ static void build_guest_fsinfo_for_device(char const=
 *devpath,<br>
<br>
=C2=A0 =C2=A0 =C2=A0syspath =3D realpath(devpath, NULL);<br>
=C2=A0 =C2=A0 =C2=A0if (!syspath) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;realpath(\=
&quot;%s\&quot;)&quot;, devpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOENT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This devpath may not exist be=
cause of container config, etc. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;name =3D g_path_get_basen=
ame(devpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;realpath(\&quot;%s\&quot;)&quot;, devpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>It looks=
 like this function is called recursively with the same &quot;fs&quot; argu=
ment. That&#39;s probably why there is a if (!fs-&gt;name) check next. You =
may want to check it too to avoid leaks and incorrect info.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.34.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d8c2bf05e3330852--

