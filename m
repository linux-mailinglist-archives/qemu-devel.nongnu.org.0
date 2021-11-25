Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DB245D835
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 11:25:01 +0100 (CET)
Received: from localhost ([::1]:38246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqBw4-0005Gj-ND
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 05:25:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mqBu0-0003AF-5y
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:22:53 -0500
Received: from [2607:f8b0:4864:20::92b] (port=38543
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mqBtu-0002cl-V7
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:22:51 -0500
Received: by mail-ua1-x92b.google.com with SMTP id w23so11229795uao.5
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 02:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BkfpLrtAOBQfNy2VITJw3WTE1hwZwISdKCvUHwLewbw=;
 b=Xu5uRVYEt+Vcq2TyBqs6lgQnHGNYoqnyb3U7fcSq3rtUlfo2qTDLxUFM5HH3uvUq/P
 djvEuZF4hVvVI7zJVfagacdNS/psLbyZskTO5Ecm3URJ/8e+DTWQtwBdgwd/gl0wSRih
 PNXQ9kW/r5Ge9iFJHpAEysli9w/JW2f6EfUH+UszasRigf/YUophZBpV9FLZfEbqjYds
 nyE1v3sYIkestd40CH1UxLbGRvE+G7Zh38XkRjpnM3JJaifKJECdLoP2L0lm1OOsoqXn
 VFRcS5pnP7wHMHalnXhgKezgbzA6Nx0qVuUzoaD1s81h6u54LoV+R+mxBu+3pVStB2LA
 iupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BkfpLrtAOBQfNy2VITJw3WTE1hwZwISdKCvUHwLewbw=;
 b=4W8WsBnScm2y5lZn15CflCHzTVEUtyJ3lTWr0W+sDK2d9R5c8mvcYSmq8wqKobziMw
 +FeMgh90nJp3rdrYMLuofMzH9Q5tHKFYRj+ew4sTn3otLNs8caJmBKiHlgcx60kuvKc7
 G33phj/LdSpDQWdpjuZcTNxVF2NAR7E+m0sPAb7utLKBQKetN5pf4ej/AUGZ54ulHzLE
 +zQHV+VePMnSnazlCnp42LQo7B1ItRT0ix/yVq42vlXPgBFPxKAyaCSVBmI2nEbhhZVe
 FlykhHxIINQqI0lpJpFdjnKvNULJuxJYkFBRVln5sWlyWckx7HEn0a8qtk8E3y4dr7BR
 CEvQ==
X-Gm-Message-State: AOAM5330+0IE6UILHh2NOHBYxjq/sGrJnmHY8cmURE8Udpwxy5i/3tM9
 JLe4iDK2yL8S9BTWueepyWlvi4g/NtZ4lqxWmJXh1A==
X-Google-Smtp-Source: ABdhPJzp9DbmaXxhCUpFa/fv+LpB2b5KONkm245YUlNjScXbwgjmxha+ZEz9LT1DgxpLchyDv4B+d1LAdVeMT8Aki2g=
X-Received: by 2002:a9f:2383:: with SMTP id 3mr23434990uao.77.1637835764462;
 Thu, 25 Nov 2021 02:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
 <20211123173759.1383510-5-richard.henderson@linaro.org>
In-Reply-To: <20211123173759.1383510-5-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 25 Nov 2021 03:22:33 -0700
Message-ID: <CANCZdfo=F+y+5LzFYam-hALzP_-ToN-eAVQm4_dinTCA07BD4Q@mail.gmail.com>
Subject: Re: [PATCH v6 04/16] linux-user/host/mips: Add safe-syscall.inc.S
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f10be905d19a5aa9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92b;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f10be905d19a5aa9
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 23, 2021 at 10:38 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/mips/hostdep.h          |   3 +
>  linux-user/host/mips/safe-syscall.inc.S | 123 ++++++++++++++++++++++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 linux-user/host/mips/safe-syscall.inc.S
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

--000000000000f10be905d19a5aa9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 23, 2021 at 10:38 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:r=
ichard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org=
</a>&gt;<br>
---<br>
=C2=A0linux-user/host/mips/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 +<br>
=C2=A0linux-user/host/mips/safe-syscall.inc.S | 123 +++++++++++++++++++++++=
+<br>
=C2=A02 files changed, 126 insertions(+)<br>
=C2=A0create mode 100644 linux-user/host/mips/safe-syscall.inc.S<br></block=
quote><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:im=
p@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div><br></div></div></div>

--000000000000f10be905d19a5aa9--

