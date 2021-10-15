Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B175642FC15
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:26:30 +0200 (CEST)
Received: from localhost ([::1]:55426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSqb-0006n5-SP
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSYy-0001u3-3P
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:08:16 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:39746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSYv-0002Mz-RO
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:08:15 -0400
Received: by mail-vk1-xa35.google.com with SMTP id m199so5658796vka.6
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 12:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w9rTHeMQ2l15ob5QQU3pKBu13BzsgU1zQDV1GyFG7Vk=;
 b=C3G+NEeY468meswZIryk0vWWnMRZDiQioWsKLON+fLWTYwm7R1wWeKetPyqiyILDFz
 YFmRIHYIv+BRbbO1M5Eq0eU3xa4Y04Jr5bS7qgpVxVdlM2cVFzKw26IXVvWQ7z1Is4+Z
 5v716E9dvatSPxzIhrYddi5uzVkm/v8QJIHsDHCwwleCbu+IwUZcVQlQBicXr3HhF5jH
 ySTvT0XukwtnjRdJWg5eJIh6PG65AWLooJ2/SVlrbNWYoMZPfTafQJtPExANesFYpXx2
 OK7E51qe3xRtB4sLL4QYPn/0hYYBTkpZ8s/7CJt8XCF0bFOU60GqzotFdeWZHJDb0VbJ
 Sqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w9rTHeMQ2l15ob5QQU3pKBu13BzsgU1zQDV1GyFG7Vk=;
 b=2jt4emWZ5PoP24jyTZnrx7cWOk829pXs8mGLK3lxJXn56mR58K0Dfss9zmcw41AlJc
 emwIOfKrA189sdKpwgdT1JQfYX17FDUlaiYUzdFlLr95yLXsPcPFMmul+FMWgVTh5391
 5sUm5sG5Ovdz/spUVx1FLvpt8pHLdzNBKHbHdjXMSrbSnRAVdtbUmmAcS3GuVyWcOLbz
 PLJ+9Zswt0bGTNsSIeFRVWkaQ7Jufinlx9yVKBQgxdxM7Gn5tw/QQX37nWBRvl/oxY/9
 vaeg9LfiOhm7kTG2oUWmhgLvqMXPIzgNMH3u08sW7ppG3KdEH9deGrLHBCpUQCMgrStL
 Zrfg==
X-Gm-Message-State: AOAM533M/YKRFaMQA5hftPe7T0G+PfErp1YdlunjMewFbcM9HPnhcwld
 ZoV9zamFh2ctJygX/t7XJ05LZVEFdB9zZ6/dU/DPMg==
X-Google-Smtp-Source: ABdhPJyAwvCXsrLy87TILUEhy6vGcebPvud2JTeqNwvsvaVdQBGQEjeswjdsYWF7MkrVIxq5CIbOZiHp1eEZhgGZooM=
X-Received: by 2002:a05:6122:180d:: with SMTP id
 ay13mr4001939vkb.21.1634324892836; 
 Fri, 15 Oct 2021 12:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-59-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-59-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 13:08:02 -0600
Message-ID: <CANCZdfpwgk+P0s-TMpP9AF__nyUHcf6VCdswXW3X=xLsD1Dimw@mail.gmail.com>
Subject: Re: [PATCH v5 58/67] accel/tcg: Report unaligned atomics for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000af82df05ce68eaa5"
Received-SPF: none client-ip=2607:f8b0:4864:20::a35;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000af82df05ce68eaa5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 10:14 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Use the new cpu_loop_exit_sigbus for atomic_mmu_lookup, which
> has access to complete alignment info from the TCGMemOpIdx arg.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/user-exec.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 5646f8e527..92cbffd7c6 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -476,11 +476,22 @@ static void *atomic_mmu_lookup(CPUArchState *env,
> target_ulong addr,
>                                 MemOpIdx oi, int size, int prot,
>                                 uintptr_t retaddr)
>  {
> +    MemOp mop =3D get_memop(oi);
> +    int a_bits =3D get_alignment_bits(mop);
> +    void *ret;
> +
> +    /* Enforce guest required alignment.  */
> +    if (unlikely(addr & ((1 << a_bits) - 1))) {
> +        MMUAccessType t =3D prot =3D=3D PAGE_READ ? MMU_DATA_LOAD :
> MMU_DATA_STORE;
> +        cpu_loop_exit_sigbus(env_cpu(env), addr, t, retaddr);
> +    }
> +
>      /* Enforce qemu required alignment.  */
>      if (unlikely(addr & (size - 1))) {
>          cpu_loop_exit_atomic(env_cpu(env), retaddr);
>      }
> -    void *ret =3D g2h(env_cpu(env), addr);
> +
> +    ret =3D g2h(env_cpu(env), addr);
>      set_helper_retaddr(retaddr);
>      return ret;
>  }
> --
> 2.25.1
>
>

--000000000000af82df05ce68eaa5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:14 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Use the new cpu_loop_exit_sigbus for atomic_mmu_lookup, =
which<br>
has access to complete alignment info from the TCGMemOpIdx arg.<br>
<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0accel/tcg/user-exec.c | 13 ++++++++++++-<br>
=C2=A01 file changed, 12 insertions(+), 1 deletion(-)<br></blockquote><div>=
<br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdi=
mp.com">imp@bsdimp.com</a>&gt;</div><div><br></div></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index 5646f8e527..92cbffd7c6 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -476,11 +476,22 @@ static void *atomic_mmu_lookup(CPUArchState *env, tar=
get_ulong addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MemOpIdx oi, int size, int prot,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t retaddr)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 MemOp mop =3D get_memop(oi);<br>
+=C2=A0 =C2=A0 int a_bits =3D get_alignment_bits(mop);<br>
+=C2=A0 =C2=A0 void *ret;<br>
+<br>
+=C2=A0 =C2=A0 /* Enforce guest required alignment.=C2=A0 */<br>
+=C2=A0 =C2=A0 if (unlikely(addr &amp; ((1 &lt;&lt; a_bits) - 1))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType t =3D prot =3D=3D PAGE_READ ? MM=
U_DATA_LOAD : MMU_DATA_STORE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_loop_exit_sigbus(env_cpu(env), addr, t, re=
taddr);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Enforce qemu required alignment.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0if (unlikely(addr &amp; (size - 1))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_loop_exit_atomic(env_cpu(env), retadd=
r);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 void *ret =3D g2h(env_cpu(env), addr);<br>
+<br>
+=C2=A0 =C2=A0 ret =3D g2h(env_cpu(env), addr);<br>
=C2=A0 =C2=A0 =C2=A0set_helper_retaddr(retaddr);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000af82df05ce68eaa5--

