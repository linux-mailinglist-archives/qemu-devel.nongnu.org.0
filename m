Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23194480F10
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:55:17 +0100 (CET)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2P7U-0007J3-9K
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:55:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OwU-0003Hv-Mi
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:43:56 -0500
Received: from [2607:f8b0:4864:20::534] (port=44796
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OwS-0005xQ-5M
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:43:53 -0500
Received: by mail-pg1-x534.google.com with SMTP id m15so17323561pgu.11
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jxCcFrmTdf4r9WPSe3R0xGMWSqwC3U1jx8xIeXhaN/g=;
 b=ELb/rfel+oyO1CAbBcHJJvnkRWm45/FGZgChT+DPIn9YT8CXtLpEv+GNmIaX6QutlS
 mXFylz4AZLnWFcZZrEt62IP/308YkDsBrhnP30LlPs6Cs0IXD7UY7WLFW8NGJqOVlhMK
 LeIPwyOG8JRR4FDxXWFXzNsHTSLyoO0e+55qBGOeQypIIuUpWwocCc/VrC6hoUzTXG01
 c34PsVdx9BoU56Wet7OODNIwSZXYOd7GNj8JkwsA0dbuKZmNQCMv/u83+nG1UK1y3dRe
 u04zArq7SJbx3qfdm1nEnFKRQ4ybV8ajFK8QsshmlFmHToOoTronHZiBFwtUy292+Yip
 pxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jxCcFrmTdf4r9WPSe3R0xGMWSqwC3U1jx8xIeXhaN/g=;
 b=hFZANopxJecMXgeM7d6jtTxTeOyZtBXlFdtphkg4eX9oZVkAEKEBc7zJD1yaK8fwXS
 nDBajHmCkf+092m+9aCVI+A0mEYLEWyCfmLHBjABA6gqicGn56PRhSg7ReILXTRJaF1G
 IfmJL8A4u/P0PSTKaV9xuDkS2T4IdrkwKhh24qRK+sWFBbKYFlNNj74MIEBsrC+wZrc/
 xPbL7CCtN1/UIlAwfXq4Uy8JbvCwOkBLfMMP9rXgD5BhrLNHS96arDsvcD7ijInp913o
 n52iCC8tdQ8ANcabCW1Xuz4tzf4Q+zEI/OfKchdTe5diNoefbiY0+7AWHyYtF6bvSWzX
 U89Q==
X-Gm-Message-State: AOAM530vzEFEo9JMVQIexeFQc5s4uRPhLLvk0uyBNYJq1tFcIOALI0YK
 yDYBbUjTjtqAYx2kqGxmjQUGMoXlFF9l5g==
X-Google-Smtp-Source: ABdhPJzVPqsGwYXuxhA6IJITyNWYUEK7XGBgXc3ZENiTF9Re+8u5ZOA3Rkf4HYwY+H6Fr+bELvcF0g==
X-Received: by 2002:a63:485a:: with SMTP id x26mr21747313pgk.580.1640745830595; 
 Tue, 28 Dec 2021 18:43:50 -0800 (PST)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com.
 [209.85.215.173])
 by smtp.gmail.com with ESMTPSA id ot7sm26859672pjb.12.2021.12.28.18.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 18:43:50 -0800 (PST)
Received: by mail-pg1-f173.google.com with SMTP id f8so7283867pgf.8;
 Tue, 28 Dec 2021 18:43:50 -0800 (PST)
X-Received: by 2002:a63:395:: with SMTP id 143mr21760538pgd.181.1640745829688; 
 Tue, 28 Dec 2021 18:43:49 -0800 (PST)
MIME-Version: 1.0
References: <20211229021250.29804-1-frank.chang@sifive.com>
In-Reply-To: <20211229021250.29804-1-frank.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 29 Dec 2021 10:43:38 +0800
X-Gmail-Original-Message-ID: <CANzO1D2aLFo-H_R9GL67HMF-3UUDFQW4osZuC1O7m4BpHDh4JQ@mail.gmail.com>
Message-ID: <CANzO1D2aLFo-H_R9GL67HMF-3UUDFQW4osZuC1O7m4BpHDh4JQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix RVV calling incorrect RFV/RVD check functions bug
To: Frank Chang <frank.chang@sifive.com>
Content-Type: multipart/alternative; boundary="000000000000586af205d43fe8e9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000586af205d43fe8e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<frank.chang@sifive.com> =E6=96=BC 2021=E5=B9=B412=E6=9C=8829=E6=97=A5 =E9=
=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8810:13=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Frank Chang <frank.chang@sifive.com>
>
> For vector widening and narrowing floating-point instructions, we should
> use require_scale_rvf() instead of require_rvf() to check whether the
> correspond RVF/RVD is enabled if either source or destination
> floating-point operand is double-width of SEW. Otherwise, illegal
> instruction exception should be raised.
>
> e.g. For SEW=3D16, if the source/destination floating-point operand is
> double-width of SEW, RVF needs to be enabled. Otherwise, an illegal
> instruction exception will be raised. Similarly, for SEW=3D32, RVD
> needs to be enabled.
>
> Frank Chang (3):
>   target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for
>     widening fp insns
>   target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for
>     widening fp/int type-convert insns
>   target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for
>     narrowing fp/int type-convert insns


Oops, I misspell the word "function" in the patch titles.
I will correct it in my next patchset.

Regards,
Frank Chang


>


>  target/riscv/insn_trans/trans_rvv.c.inc | 78 ++++++++++++++++++-------
>  1 file changed, 57 insertions(+), 21 deletions(-)
>
> --
> 2.31.1
>
>
>

--000000000000586af205d43fe8e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&lt;<a href=3D"mailto:frank.chang@sifive.=
com">frank.chang@sifive.com</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=8829=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8810:13=E5=AF=AB=E9=81=93=EF=BC=
=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.c=
om" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
For vector widening and narrowing floating-point instructions, we should<br=
>
use require_scale_rvf() instead of require_rvf() to check whether the<br>
correspond RVF/RVD is enabled if either source or destination<br>
floating-point operand is double-width of SEW. Otherwise, illegal<br>
instruction exception should be raised.<br>
<br>
e.g. For SEW=3D16, if the source/destination floating-point operand is<br>
double-width of SEW, RVF needs to be enabled. Otherwise, an illegal<br>
instruction exception will be raised. Similarly, for SEW=3D32, RVD<br>
needs to be enabled.<br>
<br>
Frank Chang (3):<br>
=C2=A0 target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for<br=
>
=C2=A0 =C2=A0 widening fp insns<br>
=C2=A0 target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for<br=
>
=C2=A0 =C2=A0 widening fp/int type-convert insns<br>
=C2=A0 target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for<br=
>
=C2=A0 =C2=A0 narrowing fp/int type-convert insns</blockquote><div><br></di=
v><div>Oops, I misspell the word &quot;function&quot; in the patch titles.<=
/div><div>I will correct it in my next patchset.</div><div><br></div><div>R=
egards,</div><div>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">=C2=A0</blockquote><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
=C2=A0target/riscv/insn_trans/trans_rvv.c.inc | 78 ++++++++++++++++++------=
-<br>
=C2=A01 file changed, 57 insertions(+), 21 deletions(-)<br>
<br>
--<br>
2.31.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000586af205d43fe8e9--

