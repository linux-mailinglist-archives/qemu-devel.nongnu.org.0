Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B784D470C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:35:02 +0100 (CET)
Received: from localhost ([::1]:60200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSI0T-0004uh-Na
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:35:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nSHMK-0004KT-JP
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:53:32 -0500
Received: from [2a00:1450:4864:20::429] (port=42715
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nSHMF-0003eR-Pp
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:53:29 -0500
Received: by mail-wr1-x429.google.com with SMTP id u10so7530674wra.9
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zXFg73VuvbxPfYHAKnVJQthpuG2CVbjA1luhbUOlMSM=;
 b=PebCa+AZMF79/lUDW86zwmtKXHJOGy9qsJYxcGo+ctROb+bGbrSrdJFrbakeF2Fv91
 oIwSIO7l0+y6cZ0ctOt9070SYO6V9IGniW8RGyjFjgzQP/4Vz+blRo+Tthx9GvqmDNoj
 kchXtc6eWF0wPnkF68Ct4pajKr9oYr98Fm7Xv4GMtevw4rPR9xeNQ6cXfava+qEKUjpg
 fQ1lBAsNgV4Y/bgIRMmBzr/d8twDwX2FSQNF/MWoqZqEFttgdwOoFZcqDVUS8rIe5InX
 AMP5MO/EyBXBpa2yZb8Gon1A8eNaXcjsSmcRrtrTq0bEWKEIpPQhFKW49r24qB4rOmC/
 YUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zXFg73VuvbxPfYHAKnVJQthpuG2CVbjA1luhbUOlMSM=;
 b=w2MM+6NPqGzGS9xU2Ze+MG8oenAvPQn82NEpGb+uRXKJrCIdhpjqUvAp91pA7OMbMx
 eguZvzvDepsdplKaQrxIL8qrPpsVIRdni+TcTsw4ULBlZcxjEBSNFOzxpRiGGdC8V1eA
 wKe65nUxVxOnne+VKkg3JZ5RSu0e/jOqhTlUx7C5KXxPKF9y1SYH5XDQA/DqacC++Kzi
 MS0Du+M/gsonNthX5vU6lOjDjmCca2zmaDgTf/fqkXLZJRImyiy/3XbFNfK+Xlcjboxj
 lSRPAkaaaOObKc82+nDshtNeefI4ygxDVtR13tuDOED4VUeLtBSmM3z2eQOjKj1rNd5l
 enpw==
X-Gm-Message-State: AOAM530adpQvc5At6UO6apItRtOP+xacFGlTbn5j9qeZQGaY3um444ep
 6vzUYTzZ934eL8JCV9T+jAB7Y6jxd5dIc5ANxjc=
X-Google-Smtp-Source: ABdhPJxEwfi+yeDnKwX1YL6UbDitEnxqeQ/8i1rPUjQ5YBP/lAK2R3DNDF0/vZFE7LyhpuDOP+R3qpEO38Lz7coXy5g=
X-Received: by 2002:a5d:4cd1:0:b0:1f0:24d5:7c37 with SMTP id
 c17-20020a5d4cd1000000b001f024d57c37mr3289372wrt.421.1646913206369; Thu, 10
 Mar 2022 03:53:26 -0800 (PST)
MIME-Version: 1.0
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-5-berrange@redhat.com>
 <YiWra21XaVV9Fdv/@xz-m1.local> <YiXZLzqenrNT/uKg@redhat.com>
 <57b8b146-a197-2f46-bf56-6ab80122e9bd@redhat.com>
 <YinZLBo77h9X9kvX@redhat.com>
 <CAJ+F1CLhb-svEFTR4ehzu69a2PnJn0ZT-=TTRZ_FQedkODAW6g@mail.gmail.com>
 <Yinieq97rqFqfjK4@redhat.com>
In-Reply-To: <Yinieq97rqFqfjK4@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 10 Mar 2022 15:53:14 +0400
Message-ID: <CAJ+F1CJY-zkooRPhQG7+NfT7BSvCr4Un_DRMJSozjmLSn7hL=A@mail.gmail.com>
Subject: Re: [PATCH 04/18] tests: print newline after QMP response in qtest
 logs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a4410b05d9dbdc45"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a4410b05d9dbdc45
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Mar 10, 2022 at 3:35 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

>
> Removing either 'assert' or g_assert would be a massive amount of code
> churn, for no real functional benefit.
>
>
Well, a few thousands of lines that are trivially regexp. And we can make
use of git blame ignore-rev (https://michaelheap.com/git-ignore-rev/) to
skip those cleanups.

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a4410b05d9dbdc45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Mar 10, 2022 at 3:35 PM Daniel P. Ber=
rang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
Removing either &#39;assert&#39; or g_assert would be a massive amount of c=
ode<br>
churn, for no real functional benefit.<br clear=3D"all"><br></blockquote><d=
iv><br></div><div>Well, a few thousands of lines that are trivially regexp.=
 And we can make use of git blame ignore-rev (<a href=3D"https://michaelhea=
p.com/git-ignore-rev/">https://michaelheap.com/git-ignore-rev/</a>) to skip=
 those cleanups.<br></div></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a4410b05d9dbdc45--

