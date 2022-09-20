Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8685F5BEC5C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 19:51:24 +0200 (CEST)
Received: from localhost ([::1]:54644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oahP0-00066o-V2
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 13:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vtjnash@gmail.com>) id 1oadUq-0000kd-K1
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:41:08 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:33612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vtjnash@gmail.com>) id 1oadUo-0005YR-Ng
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:41:08 -0400
Received: by mail-lj1-x22b.google.com with SMTP id a10so3114725ljq.0
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=NpXpq1zYy/6Z5E5qu87UtsHaMxmINrQkUZIPdZzjdlU=;
 b=SI2xC2Htcu3PtYN6s1o4hqvVxlggAiFB6RhxW2to25KREat6oKRQwuZaJVLIGZNqKt
 vp0okh6xKU5Utriv5SWdnWCNpF8Mx8Gx6EFYWIiUjBFjA28cT+83SZGFaGZEw6ET2DFm
 3bmevHPs77h/UrUpcINGvSqeCWAJ4BOoExNpccq3omuTeIJ1oB2Hy7YpAHFQq7VnVAHf
 BLFV44PmDUZMDT0OM0sqFBqzu2HBE1exVeHvwYxPcsI5LcxQ0v5NVHM5y9POoTQ9iiWy
 qwzcK6ghv8vCwWYYunOYcKotdL0o59HIe+kI+4Qf3KQ9qvLIk33zLXUPFzykehBnh6av
 TjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=NpXpq1zYy/6Z5E5qu87UtsHaMxmINrQkUZIPdZzjdlU=;
 b=4/N8mlbW2C9AW8F5xFfXdnZ9O1hN88m/Jm/W/0jK6sZFt+BsWjVZ/waOn49sGBY9+g
 4TGohLr43D2tZ4vALwfS4k+K83XKlWNwv4FY0NGEz5pQhS10gVeXhmPaQA0KDvKo4mAQ
 +V3DTRC1/o8UJiC3JpgxIjIbIxErjd/ujLKS/spILXSAgX2/5iz2qDHOMWg5lxLnkspm
 90kG5HBAKrkd+x4oKKDAm3O6qVaIBQEQzGvDNn/70ik25z6WNEDy7B4Oz1DwFDCnP28g
 NCe/IldcKLHsaTACpsJwbPCDiGPd3G8os3qWgJUAAegpmtZaMlU6CM7q70ZZijR7iaMf
 fwnw==
X-Gm-Message-State: ACrzQf2IeMGfjGQBInS5tEP4wzFJIiAJ9FtQjegG2UtQ7ZHPUgiuA4qn
 p/kXCx2jxyWIvJf6lgOcYSosop0dKkdI7hTmNVh2njFWpC3NFK9R8xo=
X-Google-Smtp-Source: AMsMyM5pbVYMxLcDW7trLnmGk7VoqgJuue/1PIADBKdZqyY4BQrfsrQ3H6pA4H8eD+rqzHmLpE0TdSS57i2d9abL2QE=
X-Received: by 2002:a2e:9657:0:b0:26c:5b63:83f7 with SMTP id
 z23-20020a2e9657000000b0026c5b6383f7mr1162357ljh.392.1663681262957; Tue, 20
 Sep 2022 06:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220808190727.875155-1-vtjnash@gmail.com>
 <CADnnjUXfz1Z0tZFGqpPwaJpeQQcSs6102JLePf8oaa4+QAOYDA@mail.gmail.com>
In-Reply-To: <CADnnjUXfz1Z0tZFGqpPwaJpeQQcSs6102JLePf8oaa4+QAOYDA@mail.gmail.com>
From: Jameson Nash <vtjnash@gmail.com>
Date: Tue, 20 Sep 2022 15:40:45 +0200
Message-ID: <CADnnjUWmTg=H=hCSF70veZ41ZsttSHh6TQy+yrt-VH2ieAckEA@mail.gmail.com>
Subject: Re: [PATCH] linux-user: fix readlinkat handling with magic exe symlink
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="000000000000b2ba3205e91bfab5"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=vtjnash@gmail.com; helo=mail-lj1-x22b.google.com
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

--000000000000b2ba3205e91bfab5
Content-Type: text/plain; charset="UTF-8"

bump?? This is just copying the existing
f17f4989fa193fa8279474c5462289a3cfe69aea commit to cover all code paths, so
I was hoping it would be trivial to get an ack for this. Thanks!

On Mon, Aug 29, 2022 at 5:49 PM Jameson Nash <vtjnash@gmail.com> wrote:

> bump? This helps fix one of the libuv tests when run under qemu
> https://github.com/libuv/libuv/pull/2941#issuecomment-1207145306
>
> On Mon, Aug 8, 2022 at 3:07 PM Jameson Nash <vtjnash@gmail.com> wrote:
>
>> Exactly the same as f17f4989fa193fa8279474c5462289a3cfe69aea before was
>> for readlink. I suppose this was simply missed at the time.
>>
>> Signed-off-by: Jameson Nash <vtjnash@gmail.com>
>> ---
>>  linux-user/syscall.c | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index ef53feb5ab..6ef4e42b21 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -9894,11 +9894,22 @@ static abi_long do_syscall1(CPUArchState
>> *cpu_env, int num, abi_long arg1,
>>              p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
>>              if (!p || !p2) {
>>                  ret = -TARGET_EFAULT;
>> +            } else if (!arg4) {
>> +                /* Short circuit this for the magic exe check. */
>> +                ret = -TARGET_EINVAL;
>>              } else if (is_proc_myself((const char *)p, "exe")) {
>>                  char real[PATH_MAX], *temp;
>>                  temp = realpath(exec_path, real);
>> -                ret = temp == NULL ? get_errno(-1) : strlen(real) ;
>> -                snprintf((char *)p2, arg4, "%s", real);
>> +                /* Return value is # of bytes that we wrote to the
>> buffer. */
>> +                if (temp == NULL) {
>> +                    ret = get_errno(-1);
>> +                } else {
>> +                    /* Don't worry about sign mismatch as earlier mapping
>> +                     * logic would have thrown a bad address error. */
>> +                    ret = MIN(strlen(real), arg4);
>> +                    /* We cannot NUL terminate the string. */
>> +                    memcpy(p2, real, ret);
>> +                }
>>              } else {
>>                  ret = get_errno(readlinkat(arg1, path(p), p2, arg4));
>>              }
>> --
>> 2.25.1
>>
>>

--000000000000b2ba3205e91bfab5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">bump?? This is just copying the existing =
f17f4989fa193fa8279474c5462289a3cfe69aea commit to cover all code paths, so=
 I was hoping it would be trivial to get an ack for this. Thanks!</div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Au=
g 29, 2022 at 5:49 PM Jameson Nash &lt;<a href=3D"mailto:vtjnash@gmail.com"=
>vtjnash@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div>bump? This helps fix one of the libuv tests when run under qemu <a h=
ref=3D"https://github.com/libuv/libuv/pull/2941#issuecomment-1207145306" ta=
rget=3D"_blank">https://github.com/libuv/libuv/pull/2941#issuecomment-12071=
45306</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, Aug 8, 2022 at 3:07 PM Jameson Nash &lt;<a href=3D"mailto:=
vtjnash@gmail.com" target=3D"_blank">vtjnash@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,20=
4);padding-left:1ex">Exactly the same as f17f4989fa193fa8279474c5462289a3cf=
e69aea before was<br>
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
</blockquote></div></div>

--000000000000b2ba3205e91bfab5--

