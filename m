Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BFE40F030
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 05:06:23 +0200 (CEST)
Received: from localhost ([::1]:37614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR4Ck-0005Ig-NJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 23:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mR45j-0003Bk-30
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:59:07 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:43860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mR45g-0007dp-DK
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:59:06 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id n17so7441258vsr.10
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 19:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rOn4JkAT1JBFwhiZctCbb9caACV5VRk56wZXmsKWr80=;
 b=GgpahZpCq84n4xXWTR5Huf/93eyWVUtAGRHJOniKe48XLDEPFBC0pjh/Ec2HNRbWCY
 pd54TVejE6d+bTPdAb8WN/uXACtyLNcu18Ey6hO4T06pK/d9mdmBwXxyXs3VJIkK5lBR
 h1GMlB2rBmNxrvrpEf3h+2SSMm37JyvDdm4kQXxOZhZS6Er04CujIZEK51QoHb5HwKaV
 HVeYfoeZLsHDW10phs3hgRJEBuNR4J2oBxDevVQ+1BECn6mme1g0DcD9xKIAESdXtSkq
 7mtYOA1r9iNdrgJueqsCuveOWCw56qqdLWICgqVAGuQtzOsLEK4xScCzFlyiKSLsKlXL
 HJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rOn4JkAT1JBFwhiZctCbb9caACV5VRk56wZXmsKWr80=;
 b=obX/8XP1s/sTrDmPKXYZgAP6m/IFtqqQ3v6swURvxd1XmroA39tiDP6l7oknbe7ka2
 MgKUfG6W4tXKpR6GmRlQuaDCks/F+Pc+ktCuLAZldTTjQ3ek6u7uH/dniyUuxXGw9qkL
 5ehua987B1kJPSvp9MZX8DypkGhYNAKCcglBnUAy9FgWoMITfz8gDm+L/c1p7eFS9hP/
 iU+sAEun4Rj/J5VpxgXrK9pxWx/nRAPqlP1D2DL2faJYhG5iktXRLmyj+//BxdjVHByL
 9bZZf86RBQibB6BTT/AqZVJzZfZIaoOHhI36+VqAoSMHV/Y+8xA3ds/uIEIWuCwEsndw
 E5Zw==
X-Gm-Message-State: AOAM531x59ni+HrlwCLsAch92+arM3jARwKx6pksOZMq1hxVKUqfLiQA
 SrCwtIJH7R6GfWbiAov6D49wRlxFoBVLGgR0GvHesJuz8iPu9gfA
X-Google-Smtp-Source: ABdhPJwI7cByjhHLkjN/9hBKA2qIgmtnbWzTIFwgWr7429QxabLnJ8tQfrIuPn9oC8zrr1iX07mM0I2aSSzdrVgZ6wM=
X-Received: by 2002:a67:1985:: with SMTP id 127mr6761480vsz.44.1631847542235; 
 Thu, 16 Sep 2021 19:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210917025635.32011-1-imp@bsdimp.com>
 <20210917025635.32011-8-imp@bsdimp.com>
In-Reply-To: <20210917025635.32011-8-imp@bsdimp.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 16 Sep 2021 20:58:51 -0600
Message-ID: <CANCZdfr2W_7rOvmk9-TsN-iC893eu+7CB4TaN6f6P_+xXdZv9w@mail.gmail.com>
Subject: Re: [PATCH 7/9] bsd-user: Don't try to mmap fd when it is -1
 independently from MAP_ANONYMOUS flag
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000015383c05cc281dee"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2b.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Guy Yur <guyyur@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000015383c05cc281dee
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 16, 2021 at 8:56 PM Warner Losh <imp@bsdimp.com> wrote:

> From: Guy Yur <guyyur@ngmail.com>
>

I need to fix this email address in the next round or for the pull request.
It's gmail.com, not ngmail.com.

Switch checks for !(flags & MAP_ANONYMOUS) with checks for fd != -1.
> MAP_STACK and MAP_GUARD also force fd == -1 and they don't require
> mapping the fd either.
>
> Signed-off-by: Guy Yur <guyyur@gmail.com>
> [ partially merged before, finishing the job and documenting origin]
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/mmap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index 8b763fffc3..347d314aa9 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -154,7 +154,7 @@ static int mmap_frag(abi_ulong real_start,
>      if (prot1 == 0) {
>          /* no page was there, so we allocate one */
>          void *p = mmap(host_start, qemu_host_page_size, prot,
> -                       flags | MAP_ANON, -1, 0);
> +                       flags | ((fd != -1) ? MAP_ANON : 0), -1, 0);
>          if (p == MAP_FAILED)
>              return -1;
>          prot1 = prot;
> @@ -162,7 +162,7 @@ static int mmap_frag(abi_ulong real_start,
>      prot1 &= PAGE_BITS;
>
>      prot_new = prot | prot1;
> -    if (!(flags & MAP_ANON)) {
> +    if (fd != -1) {
>          /* msync() won't work here, so we return an error if write is
>             possible while it is a shared mapping */
>          if ((flags & TARGET_BSD_MAP_FLAGMASK) == MAP_SHARED &&
> @@ -571,7 +571,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,
> int prot,
>           * worst case: we cannot map the file because the offset is not
>           * aligned, so we read it
>           */
> -        if (!(flags & MAP_ANON) &&
> +        if (fd != -1 &&
>              (offset & ~qemu_host_page_mask) != (start &
> ~qemu_host_page_mask)) {
>              /*
>               * msync() won't work here, so we return an error if write is
> --
> 2.32.0
>
>

--00000000000015383c05cc281dee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Sep 16, 2021 at 8:56 PM Warner Losh &lt;<a href=3D"=
mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">From: Guy Yur &lt;<a href=3D"mailto:guyyur@ngmail.com" ta=
rget=3D"_blank">guyyur@ngmail.com</a>&gt;<br></blockquote><div><br></div><d=
iv>I need to fix this email address in the next round or for the pull reque=
st. It&#39;s <a href=3D"http://gmail.com">gmail.com</a>, not <a href=3D"htt=
p://ngmail.com">ngmail.com</a>.</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
Switch checks for !(flags &amp; MAP_ANONYMOUS) with checks for fd !=3D -1.<=
br>
MAP_STACK and MAP_GUARD also force fd =3D=3D -1 and they don&#39;t require<=
br>
mapping the fd either.<br>
<br>
Signed-off-by: Guy Yur &lt;<a href=3D"mailto:guyyur@gmail.com" target=3D"_b=
lank">guyyur@gmail.com</a>&gt;<br>
[ partially merged before, finishing the job and documenting origin]<br>
Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"=
_blank">imp@bsdimp.com</a>&gt;<br>
---<br>
=C2=A0bsd-user/mmap.c | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c<br>
index 8b763fffc3..347d314aa9 100644<br>
--- a/bsd-user/mmap.c<br>
+++ b/bsd-user/mmap.c<br>
@@ -154,7 +154,7 @@ static int mmap_frag(abi_ulong real_start,<br>
=C2=A0 =C2=A0 =C2=A0if (prot1 =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* no page was there, so we allocate one =
*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *p =3D mmap(host_start, qemu_host_pa=
ge_size, prot,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0flags | MAP_ANON, -1, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0flags | ((fd !=3D -1) ? MAP_ANON : 0), -1, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p =3D=3D MAP_FAILED)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prot1 =3D prot;<br>
@@ -162,7 +162,7 @@ static int mmap_frag(abi_ulong real_start,<br>
=C2=A0 =C2=A0 =C2=A0prot1 &amp;=3D PAGE_BITS;<br>
<br>
=C2=A0 =C2=A0 =C2=A0prot_new =3D prot | prot1;<br>
-=C2=A0 =C2=A0 if (!(flags &amp; MAP_ANON)) {<br>
+=C2=A0 =C2=A0 if (fd !=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* msync() won&#39;t work here, so we ret=
urn an error if write is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 possible while it is a shared map=
ping */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((flags &amp; TARGET_BSD_MAP_FLAGMASK)=
 =3D=3D MAP_SHARED &amp;&amp;<br>
@@ -571,7 +571,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, in=
t prot,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * worst case: we cannot map the file bec=
ause the offset is not<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * aligned, so we read it<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(flags &amp; MAP_ANON) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd !=3D -1 &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(offset &amp; ~qemu_host_pa=
ge_mask) !=3D (start &amp; ~qemu_host_page_mask)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * msync() won&#39;t work h=
ere, so we return an error if write is<br>
-- <br>
2.32.0<br>
<br>
</blockquote></div></div>

--00000000000015383c05cc281dee--

