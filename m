Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83DA5A5253
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 18:55:19 +0200 (CEST)
Received: from localhost ([::1]:36658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSi2g-00028k-J4
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 12:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vtjnash@gmail.com>) id 1oSh1q-00055I-Ib
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 11:50:29 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:46685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vtjnash@gmail.com>) id 1oSh1m-0005vG-0v
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 11:50:20 -0400
Received: by mail-ej1-x62f.google.com with SMTP id bj12so16524347ejb.13
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 08:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=lTgl3EpE2acGGU3Nhesyo92ou38c73wF2ZRcqAVCQxs=;
 b=oH9+QnxGz5m9bCs23Tr7Q00fa4Jya6e/xuDDg4JnlszguCGyOFLzpMmJ3r+y33qJ2E
 4oM9wRBijo471axkayoHV4FWsIAkG85DL6g6jnSHHUN2gykpBfEBN0/8VzthENnDPlBA
 FBfvr79zGhJJCWHNPIjMv9/R8+Vy9ca0cPKQqYpfzfHizXPAIIe4SyPk6ltDPoqaQZpx
 aPM2Cjs8pxyyPA+eqUYtmkT5U2ezmTxVtOaVREOWVlKrm0Exu10ZlzGJiyiHdiFTyn2T
 MzTLSvRFCE8OQ/MB0tz5bB40ATKu3w/7R6eJ/xl7Gcr5q0kyiRCTpLe96noNfjhaqlHq
 ut8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=lTgl3EpE2acGGU3Nhesyo92ou38c73wF2ZRcqAVCQxs=;
 b=IQ+Bi7BOCSZJBN8zugPRDmx5qUkSqlwnUnrt6e/Z+G1Bkih3W4RLeOOATXBRyqODLp
 iTOMGVOYV9cfqY4Wej43K1Voup2S8Z8gueSS4CHzhssVXHTPI2DmVEFqohTblnijbsMM
 1J48JaIEhT7TZH0Rku4IY4N59iu+S09idJEAfmdeaopINIY04mXjh6IzjZw2ec7XFLQ0
 cjIbQUKRsHmiT5bfp/xGpvn1H8Gza8Awd3adi1EIpYHk/0rOwjd2zuUK1P43vBAWiRYs
 a6Br6af6U4Tl5BO+mzgnd2sEVlJ5GSIZthZOT/oWOPE3oPRD5x30/NfqRwgmpf45bHd5
 Ld7w==
X-Gm-Message-State: ACgBeo2nmHlWCWGe6mFjOQyUqbOyRwQy6wZ3EOtc89VDUNCu5a9Rerep
 64qpsvn+wtvWjaOJ3awNv4HHDq7ae1zt7jok1nBti7SrW52ZrQ==
X-Google-Smtp-Source: AA6agR6ofmzI5DDOwoxeygMm4NUY/UtsXxxGiXyq9T3S33Z4v3HOGesQAK+l/IJzuskOp94Ar8rk8pnCuA/XaZWqw7w=
X-Received: by 2002:a17:906:cc4a:b0:73d:d3b9:b263 with SMTP id
 mm10-20020a170906cc4a00b0073dd3b9b263mr12831204ejb.130.1661788215087; Mon, 29
 Aug 2022 08:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220808190727.875155-1-vtjnash@gmail.com>
In-Reply-To: <20220808190727.875155-1-vtjnash@gmail.com>
From: Jameson Nash <vtjnash@gmail.com>
Date: Mon, 29 Aug 2022 11:49:57 -0400
Message-ID: <CADnnjUXfz1Z0tZFGqpPwaJpeQQcSs6102JLePf8oaa4+QAOYDA@mail.gmail.com>
Subject: Re: [PATCH] linux-user: fix readlinkat handling with magic exe symlink
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="000000000000409ad005e763389e"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=vtjnash@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Aug 2022 12:51:41 -0400
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

--000000000000409ad005e763389e
Content-Type: text/plain; charset="UTF-8"

bump? This helps fix one of the libuv tests when run under qemu
https://github.com/libuv/libuv/pull/2941#issuecomment-1207145306

On Mon, Aug 8, 2022 at 3:07 PM Jameson Nash <vtjnash@gmail.com> wrote:

> Exactly the same as f17f4989fa193fa8279474c5462289a3cfe69aea before was
> for readlink. I suppose this was simply missed at the time.
>
> Signed-off-by: Jameson Nash <vtjnash@gmail.com>
> ---
>  linux-user/syscall.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ef53feb5ab..6ef4e42b21 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9894,11 +9894,22 @@ static abi_long do_syscall1(CPUArchState *cpu_env,
> int num, abi_long arg1,
>              p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
>              if (!p || !p2) {
>                  ret = -TARGET_EFAULT;
> +            } else if (!arg4) {
> +                /* Short circuit this for the magic exe check. */
> +                ret = -TARGET_EINVAL;
>              } else if (is_proc_myself((const char *)p, "exe")) {
>                  char real[PATH_MAX], *temp;
>                  temp = realpath(exec_path, real);
> -                ret = temp == NULL ? get_errno(-1) : strlen(real) ;
> -                snprintf((char *)p2, arg4, "%s", real);
> +                /* Return value is # of bytes that we wrote to the
> buffer. */
> +                if (temp == NULL) {
> +                    ret = get_errno(-1);
> +                } else {
> +                    /* Don't worry about sign mismatch as earlier mapping
> +                     * logic would have thrown a bad address error. */
> +                    ret = MIN(strlen(real), arg4);
> +                    /* We cannot NUL terminate the string. */
> +                    memcpy(p2, real, ret);
> +                }
>              } else {
>                  ret = get_errno(readlinkat(arg1, path(p), p2, arg4));
>              }
> --
> 2.25.1
>
>

--000000000000409ad005e763389e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>bump? This helps fix one of the libuv tests when run =
under qemu <a href=3D"https://github.com/libuv/libuv/pull/2941#issuecomment=
-1207145306">https://github.com/libuv/libuv/pull/2941#issuecomment-12071453=
06</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Aug 8, 2022 at 3:07 PM Jameson Nash &lt;<a href=3D"mailto:vtj=
nash@gmail.com">vtjnash@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
Exactly the same as f17f4989fa193fa8279474c5462289a3cfe69aea before was<br>
for readlink. I suppose this was simply missed at the time.<br>
<br>
Signed-off-by: Jameson Nash &lt;<a href=3D"mailto:vtjnash@gmail.com" target=
=3D"_blank">vtjnash@gmail.com</a>&gt;<br>
---<br>
=C2=A0linux-user/syscall.c | 15 +++++++++++++--<br>
=C2=A01 file changed, 13 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
index ef53feb5ab..6ef4e42b21 100644<br>
--- a/linux-user/syscall.c<br>
+++ b/linux-user/syscall.c<br>
@@ -9894,11 +9894,22 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p2 =3D lock_user(VERIFY_WRI=
TE, arg3, arg4, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!p || !p2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -TARG=
ET_EFAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!arg4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Short circuit t=
his for the magic exe check. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -TARGET_EI=
NVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (is_proc_myself((=
const char *)p, &quot;exe&quot;)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char real[PAT=
H_MAX], *temp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0temp =3D real=
path(exec_path, real);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D temp =3D=
=3D NULL ? get_errno(-1) : strlen(real) ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf((char *)p=
2, arg4, &quot;%s&quot;, real);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Return value is=
 # of bytes that we wrote to the buffer. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (temp =3D=3D NU=
LL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =
=3D get_errno(-1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* D=
on&#39;t worry about sign mismatch as earlier mapping<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0* logic would have thrown a bad address error. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =
=3D MIN(strlen(real), arg4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* W=
e cannot NUL terminate the string. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memc=
py(p2, real, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D get_e=
rrno(readlinkat(arg1, path(p), p2, arg4));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000409ad005e763389e--

