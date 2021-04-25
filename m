Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D336A8C9
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 20:15:49 +0200 (CEST)
Received: from localhost ([::1]:34658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lajIK-0007Zr-0F
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 14:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lajFC-0006it-B7
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 14:12:34 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:40836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lajF6-0005Ep-U9
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 14:12:34 -0400
Received: by mail-qt1-x834.google.com with SMTP id o21so11982024qtp.7
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 11:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d/2X22dkBsCaXEgQRbsI24XKCaa6LLtoKM7/IdDMLoM=;
 b=B2P32yM0RI7QqmYMAGJNqRyrJl3KhYeounlIUbdGUoVRxJE/9UTxLv/XqRirHrzTyu
 j4J9o/2iVcfWvSCZcIY8kYrGDWTHmJApYewrgNKa01NPhXddo7un+GCrjVJ97TTZPH8Y
 yZ+XWOPuvJVGj9gznq8oK9r8InAx3HGC8GRnDbEqKK5bYzud9r0QhM3S4DgEd7BdMN0f
 hm0on25E3XyuP4e7s6O43l3XravtOzO+18RYtyewEgQojV870CYgnwOQp2SyPEW9AzgH
 dXcOseBeBsWF2Pf2MTm/4TfmOE8vdphMy0FTQ1MkHL58f/rK04s+p2nqOJEVQDvluztl
 /QdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d/2X22dkBsCaXEgQRbsI24XKCaa6LLtoKM7/IdDMLoM=;
 b=L9ooB9bDwWQ8tQ77Q5qzlaTv2hL0Nt0T8S4niWZlxWPFZKpxtLD5Qig1fSRI7VU61l
 MrhtYPhY49+vtQ1BkaGP6gOD1g/ueRk1abZva1Sf3K6lGPC+1FbSW040h2yuR9Sj9QNI
 sL/0DRAfUDogSAnjjV7u7eMYiHq3NNDMr3gtR/cHWG5KWB3EG2tSV/teamA8ayEp5iIk
 1YGjFA9UY72N7ImRd7IIvwmPs6h327acz0vmgulnI48uGEWVlRg4HAh1syivkfa65Ucc
 b+RC53RHFeVEcL9OgiSH9WIkVVeZSpxiWrgNAV4YocGwLqZiMDRz1JPSs32RxuXVNsh1
 I+QA==
X-Gm-Message-State: AOAM530Kh4b18DrvXN7RxdmxLUKq8v0bgiVC+nQpqRWfilObQ+q6Ld9L
 qmH44/pdDvHcdn/6h8mIJFpOL/o3jZ77rM/9R+ncNA==
X-Google-Smtp-Source: ABdhPJzR1hvGs6c7zGUcNewwnpdrV6A7/lB5KG9qGf3T2hDS3WG/sVOgs3ypaESqoxoHLeaFrCIDDVvlDpzF475Hmrw=
X-Received: by 2002:a05:622a:d5:: with SMTP id
 p21mr12960489qtw.235.1619374346839; 
 Sun, 25 Apr 2021 11:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210425155749.896330-1-richard.henderson@linaro.org>
 <20210425155749.896330-5-richard.henderson@linaro.org>
In-Reply-To: <20210425155749.896330-5-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 25 Apr 2021 12:12:16 -0600
Message-ID: <CANCZdfrg-ndpvf+ZyUQrRY1afV2-41biQxdyGcvsh8tppoG2RA@mail.gmail.com>
Subject: Re: [PATCH 4/8] linux-user: Pass CPUArchState to
 target_restore_altstack
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b3bf1b05c0cff816"
Received-SPF: none client-ip=2607:f8b0:4864:20::834;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x834.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b3bf1b05c0cff816
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 25, 2021 at 10:08 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> In most cases we were already passing get_sp_from_cpustate
> directly to the function.  In other cases, we were passing
> a local variable which already contained the same value.
> In the rest of the cases, we were passing the stack pointer
> out of env directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/signal-common.h     | 2 +-
>  linux-user/aarch64/signal.c    | 2 +-
>  linux-user/alpha/signal.c      | 2 +-
>  linux-user/arm/signal.c        | 4 ++--
>  linux-user/hexagon/signal.c    | 2 +-
>  linux-user/hppa/signal.c       | 2 +-
>  linux-user/i386/signal.c       | 2 +-
>  linux-user/m68k/signal.c       | 2 +-
>  linux-user/microblaze/signal.c | 2 +-
>  linux-user/mips/signal.c       | 2 +-
>  linux-user/nios2/signal.c      | 2 +-
>  linux-user/openrisc/signal.c   | 2 +-
>  linux-user/ppc/signal.c        | 2 +-
>  linux-user/riscv/signal.c      | 2 +-
>  linux-user/s390x/signal.c      | 2 +-
>  linux-user/sh4/signal.c        | 2 +-
>  linux-user/signal.c            | 6 +++---
>  linux-user/xtensa/signal.c     | 2 +-
>  18 files changed, 21 insertions(+), 21 deletions(-)
>

Reviewed by: Warner Losh <imp@bsdimp.com>

--000000000000b3bf1b05c0cff816
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 25, 2021 at 10:08 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">In most cases we were already passing get_sp_from_cpusta=
te<br>
directly to the function.=C2=A0 In other cases, we were passing<br>
a local variable which already contained the same value.<br>
In the rest of the cases, we were passing the stack pointer<br>
out of env directly.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/signal-common.h=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0linux-user/aarch64/signal.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0linux-user/alpha/signal.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0linux-user/arm/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0linux-user/hexagon/signal.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0linux-user/hppa/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0linux-user/i386/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0linux-user/m68k/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0linux-user/microblaze/signal.c | 2 +-<br>
=C2=A0linux-user/mips/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0linux-user/nios2/signal.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0linux-user/openrisc/signal.c=C2=A0 =C2=A0| 2 +-<br>
=C2=A0linux-user/ppc/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0linux-user/riscv/signal.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0linux-user/s390x/signal.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0linux-user/sh4/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +++-=
--<br>
=C2=A0linux-user/xtensa/signal.c=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A018 files changed, 21 insertions(+), 21 deletions(-)<br></blockquote><=
div><br></div><div>Reviewed by: Warner Losh &lt;<a href=3D"mailto:imp@bsdim=
p.com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div></div></div>

--000000000000b3bf1b05c0cff816--

