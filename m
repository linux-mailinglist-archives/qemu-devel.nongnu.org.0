Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3EF407D75
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 15:08:09 +0200 (CEST)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPPDL-0004Gy-Ho
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 09:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPB7-0002Cx-KF
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 09:05:49 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPAv-0005Ar-6Z
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 09:05:49 -0400
Received: by mail-pg1-x52f.google.com with SMTP id f129so6738312pgc.1
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 06:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AG2NQkaKnidbsmLjpxu2eNIlYv0knyLTM1sGncf/cCw=;
 b=BHfUMKBuG4kSIKZ0r5BdkR1rEiFwIw70rI6c2Q7Y6McTsZcCxyjdReBfScDAgkMMWs
 IHmtxSrQCZh0aRhsSFd7LpRW5rgMbrKIrl1mqorGG8esXDMAjm2DIOQevOWkto7vxtKd
 eGpyKyThO7LydZIKxOcsG5obTt7TQAcAqBEzWUxi1eXknaWTdA/AyTNdVcwMN/RGHu1w
 6Fg2821YGWMYF951m25jaFASmbpDZOIhdAFbZ/nb+PcZUlMsxu7mosvtkOrxFDc7xqAo
 7bB2wSxFjZbTJe3aZtdPx8JzusuEquRM1NmfTjdOwsktNwx6mQ3K5N9h8oHkghY7veQc
 Z9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AG2NQkaKnidbsmLjpxu2eNIlYv0knyLTM1sGncf/cCw=;
 b=AXzCJrv+91cvBqTN/4XVXpn9643mHIIWYsbcN9b+8DJPqda6g98NnOXvRmwEvAo1b5
 z6vh4xLwqZQp9DGpLO1PE8avARoCZJSgK2RjI3EK1JPFp1WZqBUURU+mCH0urSphRiTL
 /t6KFeMp5KKn3vpd9eLtRYkglP+duMd+208mlkcChnbJGaTIgq6bTHixH9VhGycOUBkp
 he9motkjSHKrLHPtBhUsaQKEkfJ/1O+p0KfWhLjO0VfOlUYo7pJxfR281kzJsHO5gkT6
 tAl43bzEoWSivB1edUwNwjYmQtWt1Yl9DD0uvhb6paAGFJl6XYle/zyJAcz1Ps+UM2Oy
 F4ow==
X-Gm-Message-State: AOAM533GPvW9+g+h+czgjOtxOSvB8wzCTsPpPb6aCzB2uspwCDQa6bSB
 a5LMsInTpg58JBJXcFbXW1ietqnR9R0TQfRt
X-Google-Smtp-Source: ABdhPJycCqPiEj4Fy91vm5f7Vop0w7AzrrAnm2WQbI7Ea97cKBAmzMyeTl2UWEQ0Fl5LaEu3RHnLYQ==
X-Received: by 2002:a05:6a00:2184:b0:3f4:cac4:cf41 with SMTP id
 h4-20020a056a00218400b003f4cac4cf41mr6458553pfi.6.1631451934930; 
 Sun, 12 Sep 2021 06:05:34 -0700 (PDT)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com.
 [209.85.214.179])
 by smtp.gmail.com with ESMTPSA id r23sm3970999pjo.3.2021.09.12.06.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 06:05:34 -0700 (PDT)
Received: by mail-pl1-f179.google.com with SMTP id d17so4085989plr.12;
 Sun, 12 Sep 2021 06:05:34 -0700 (PDT)
X-Received: by 2002:a17:90a:bd18:: with SMTP id
 y24mr7585142pjr.83.1631451934132; 
 Sun, 12 Sep 2021 06:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210912124346.165540-1-frank.chang@sifive.com>
In-Reply-To: <20210912124346.165540-1-frank.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 12 Sep 2021 21:05:23 +0800
X-Gmail-Original-Message-ID: <CANzO1D3f7fKZretwwjKG3axj3UBF5EjGT25F2J_PRCWo+8XpLA@mail.gmail.com>
Message-ID: <CANzO1D3f7fKZretwwjKG3axj3UBF5EjGT25F2J_PRCWo+8XpLA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hw/dma: Align SiFive PDMA behavior with real
 hardware
To: Frank Chang <frank.chang@sifive.com>
Content-Type: multipart/alternative; boundary="000000000000008f8f05cbcc0190"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000008f8f05cbcc0190
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<frank.chang@sifive.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=8812=E6=97=A5 =E9=
=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=888:46=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Frank Chang <frank.chang@sifive.com>
>
> Current QEMU PDMA doesn't align with real PDMA's behavior. This would
> result in Linux dmatest failed. This patchest aligns with real PDMA's
> behavior we tested on the real board. The golden results are performed
> in U-Boot on the Unmatched board with PDMA supported.
>
> Changelog:
>
> v2:
>   * Add comment to describe document errors.
>
> Frank Chang (3):
>   hw/dma: sifive_pdma: reset Next* registers when Control.claim is set
>   hw/dma: sifive_pdma: claim bit must be set before DMA transactions
>   hw/dma: sifive_pdma: don't set Control.error if 0 bytes to transfer
>
> Green Wan (1):
>   hw/dma: sifive_pdma: allow non-multiple transaction size transactions
>
>  hw/dma/sifive_pdma.c | 54 +++++++++++++++++++++++++++++++++++---------
>  1 file changed, 43 insertions(+), 11 deletions(-)
>
> --
> 2.25.1
>
>
>
I made a mistake while sending the patchset.
Please ignore this series, I will resend it again.
Sorry for the confusion.

Regards,
Frank Chang

--000000000000008f8f05cbcc0190
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&lt;<a href=3D"mailto:frank.chang@sifive.=
com">frank.chang@sifive.com</a>&gt; =E6=96=BC 2021=E5=B9=B49=E6=9C=8812=E6=
=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=888:46=E5=AF=AB=E9=81=93=EF=BC=9A=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com"=
 target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
Current QEMU PDMA doesn&#39;t align with real PDMA&#39;s behavior. This wou=
ld<br>
result in Linux dmatest failed. This patchest aligns with real PDMA&#39;s<b=
r>
behavior we tested on the real board. The golden results are performed<br>
in U-Boot on the Unmatched board with PDMA supported.<br>
<br>
Changelog:<br>
<br>
v2:<br>
=C2=A0 * Add comment to describe document errors.<br>
<br>
Frank Chang (3):<br>
=C2=A0 hw/dma: sifive_pdma: reset Next* registers when Control.claim is set=
<br>
=C2=A0 hw/dma: sifive_pdma: claim bit must be set before DMA transactions<b=
r>
=C2=A0 hw/dma: sifive_pdma: don&#39;t set Control.error if 0 bytes to trans=
fer<br>
<br>
Green Wan (1):<br>
=C2=A0 hw/dma: sifive_pdma: allow non-multiple transaction size transaction=
s<br>
<br>
=C2=A0hw/dma/sifive_pdma.c | 54 +++++++++++++++++++++++++++++++++++--------=
-<br>
=C2=A01 file changed, 43 insertions(+), 11 deletions(-)<br>
<br>
--<br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>I made a mistake while sending the pat=
chset.</div><div>Please ignore this series, I will resend it again.</div><d=
iv>Sorry for the confusion.<br></div><div><br></div><div>Regards,</div><div=
>Frank Chang=C2=A0</div></div></div>

--000000000000008f8f05cbcc0190--

