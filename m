Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70C54E7ECE
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 04:43:15 +0100 (CET)
Received: from localhost ([::1]:38362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXxKc-0008Rs-SO
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 23:43:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nXxIT-0006tX-5Z
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 23:41:01 -0400
Received: from [2607:f8b0:4864:20::62d] (port=43797
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nXxIR-0006pt-2T
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 23:41:00 -0400
Received: by mail-pl1-x62d.google.com with SMTP id w8so10140865pll.10
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 20:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BchzLhfS0quz7rq0fiEwo039xmlmctpyj3wJWiboig4=;
 b=AkOCJeFRnCdiChVUTats2V/mbRPeNTd2VHjE/BIFvbRQLIV9BtszIKsx0l4CWoQWao
 PeK1edJNz5kLj3u8nOxxAlf8C7rPL2csWzBFSipMoLQdlY/K9u2+uvp71jTNYsttVUOl
 snl0tR0NKP00DpHZYV6fcP0olKqvQQ2+9CLYE/LG0nBG0janwvgR71zib9E2ac/hsfWf
 54yyl7jGrkwKVjSCaRvWoTDd56BjmIihklO76uXzS2Yc6Q1IhoJVr6PaDx0yPnQ8Ya5R
 ap+YOPgIC2wT9m+0uaoo8arazrpUnx32Orya1ig7OgrR3Z/LxtKPBXyZfuHOKWxQPrLa
 05wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BchzLhfS0quz7rq0fiEwo039xmlmctpyj3wJWiboig4=;
 b=JgatfKCNX8kibdvAZAcdNzxHqvMbx8ngSqejxyox5ydZWRdcrgWYVeBlWMa5YSjvrL
 +dHSSJoYa0KbJcitmCN31hAyUB9ASw+DA0ct7NQ4sjup9AvWGq3WuBNd+CAmSe980BJb
 WL/NoxVDdI+uvQ4fzm6/lrseU4YrBjo6CZOnHq+KZiHwTRn3/znKzutnjMTZFod/1leF
 ETyKhtZqsShY2Jk5i7R7Ybmx0Jo7QwiUMmqqy6mvzh6cdFBBkhtBYTfbnAVd8ZGd/QQh
 mkxsCLCaDFKgQL+d70dWVIDp4sx2nZMLD58VD2JfPNl6f7TaSGGL0Q28M5Lq7XAYs41+
 jIZg==
X-Gm-Message-State: AOAM530E8yiK15z78tonxejxCqklseSei0OFQZMmKzvPBLHnIBLvunAL
 JK0XQ+2Ir3miF3D7NF2nHBp/akCb8TBO6jiY
X-Google-Smtp-Source: ABdhPJxhKfx6leXO0dBPeJOyilFQhQ7W36jKMLNbSPB2DwdR3T7R7FsslWIPd4B9LY5GluP1Q5U9kg==
X-Received: by 2002:a17:902:c3cd:b0:153:ff15:1e5f with SMTP id
 j13-20020a170902c3cd00b00153ff151e5fmr14889096plj.16.1648266056843; 
 Fri, 25 Mar 2022 20:40:56 -0700 (PDT)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com.
 [209.85.210.172]) by smtp.gmail.com with ESMTPSA id
 d5-20020a056a0024c500b004fae56b2921sm8113614pfv.167.2022.03.25.20.40.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 20:40:56 -0700 (PDT)
Received: by mail-pf1-f172.google.com with SMTP id y10so4777134pfa.7
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 20:40:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:1304:b0:4e1:2338:f11e with SMTP id
 j4-20020a056a00130400b004e12338f11emr13166785pfu.24.1648266055540; Fri, 25
 Mar 2022 20:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220316222116.2492777-1-tjeznach@rivosinc.com>
In-Reply-To: <20220316222116.2492777-1-tjeznach@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 26 Mar 2022 11:40:44 +0800
X-Gmail-Original-Message-ID: <CANzO1D2vyT4=SQsZ6KpRj-nt+KNhBu3DmQtHjg=5p3=fqSK2_g@mail.gmail.com>
Message-ID: <CANzO1D2vyT4=SQsZ6KpRj-nt+KNhBu3DmQtHjg=5p3=fqSK2_g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] hw/riscv: Baseline QEMU support for RISC-V IOMMU
 (draft)
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Content-Type: multipart/alternative; boundary="000000000000bc65ba05db16d81e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GOOGLE_DOC_SUSP=1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bc65ba05db16d81e
Content-Type: text/plain; charset="UTF-8"

Hi Tomasz,

Could you please send this patchset to qemu-riscv@nongnu.org, too?

Regards,
Frank Chang

On Thu, Mar 17, 2022 at 6:24 AM Tomasz Jeznach <tjeznach@rivosinc.com>
wrote:

> This is the series of patches to introduce RISC-V IOMMU emulation in QEMU.
>
> The Rivos IOMMU device implementation is based on a draft proposal of a
> RISC-V I/O Management Unit (IOMMU) [1] as published on 2022/03/10, shared
> and
> discussed with RISCV-V IOMMU Task Group [2].
>
> Specification is in *draft* stage and is expected to be changed based on
> discussion and feedback received from RISC-V IOMMU TG.
>
> This series enables rivos-iommu support for riscv/virt machine emulation.
> With corresponding Linux kernel driver and (modified) pending AIA-IMSIC
> support [3] QEMU is able to boot into Linux with I/O protection enabled for
> PCIe devices.  Without AIA-IMSIC support interrupt based I/O translation
> fault
> reporting and MSI remapping features are not available, while all remaining
> IOMMU features are active.
>
> To enable IOMMU in QEMU add 'rivos-iommu' to the device list for 'virt'
> machine
> emulation.
>
>
> [1]
> https://docs.google.com/document/d/1ytBZ6eDk1pAeBlZjDvm6_qqJbKQ0fMYKedyx0uoAGB0/view
> [2] https://lists.riscv.org/g/tech-iommu/message/3
> [3]
> https://lore.kernel.org/qemu-devel/20220220085526.808674-1-anup@brainfault.org
>
> Tomasz Jeznach (2):
>   hw/riscv: rivos-iommu: Baseline implementation of RIVOS IOMMU.
>   hw/riscv: virt: Add rivos-iommu device to 'virt' machine.
>
>  hw/riscv/Kconfig               |    4 +
>  hw/riscv/meson.build           |    1 +
>  hw/riscv/rivos_iommu.c         | 1350 ++++++++++++++++++++++++++++++++
>  hw/riscv/trace-events          |    7 +
>  hw/riscv/trace.h               |    2 +
>  hw/riscv/virt.c                |  115 ++-
>  include/hw/pci/pci_ids.h       |    1 +
>  include/hw/riscv/rivos_iommu.h |   80 ++
>  include/hw/riscv/virt.h        |    2 +
>  meson.build                    |    1 +
>  10 files changed, 1539 insertions(+), 24 deletions(-)
>  create mode 100644 hw/riscv/rivos_iommu.c
>  create mode 100644 hw/riscv/trace-events
>  create mode 100644 hw/riscv/trace.h
>  create mode 100644 include/hw/riscv/rivos_iommu.h
>
> --
> 2.25.1
>
>
>

--000000000000bc65ba05db16d81e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Tomasz,<div><br></div><div>Could=C2=A0you please send t=
his patchset to <a href=3D"mailto:qemu-riscv@nongnu.org">qemu-riscv@nongnu.=
org</a>, too?</div><div><br></div><div>Regards,</div><div>Frank Chang</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Thu, Mar 17, 2022 at 6:24 AM Tomasz Jeznach &lt;<a href=3D"mailto:tjezna=
ch@rivosinc.com">tjeznach@rivosinc.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">This is the series of patches to intr=
oduce RISC-V IOMMU emulation in QEMU.<br>
<br>
The Rivos IOMMU device implementation is based on a draft proposal of a<br>
RISC-V I/O Management Unit (IOMMU) [1] as published on 2022/03/10, shared a=
nd<br>
discussed with RISCV-V IOMMU Task Group [2].<br>
<br>
Specification is in *draft* stage and is expected to be changed based on<br=
>
discussion and feedback received from RISC-V IOMMU TG.<br>
<br>
This series enables rivos-iommu support for riscv/virt machine emulation.<b=
r>
With corresponding Linux kernel driver and (modified) pending AIA-IMSIC<br>
support [3] QEMU is able to boot into Linux with I/O protection enabled for=
<br>
PCIe devices.=C2=A0 Without AIA-IMSIC support interrupt based I/O translati=
on fault<br>
reporting and MSI remapping features are not available, while all remaining=
<br>
IOMMU features are active.<br>
<br>
To enable IOMMU in QEMU add &#39;rivos-iommu&#39; to the device list for &#=
39;virt&#39; machine<br>
emulation.<br>
<br>
<br>
[1] <a href=3D"https://docs.google.com/document/d/1ytBZ6eDk1pAeBlZjDvm6_qqJ=
bKQ0fMYKedyx0uoAGB0/view" rel=3D"noreferrer" target=3D"_blank">https://docs=
.google.com/document/d/1ytBZ6eDk1pAeBlZjDvm6_qqJbKQ0fMYKedyx0uoAGB0/view</a=
><br>
[2] <a href=3D"https://lists.riscv.org/g/tech-iommu/message/3" rel=3D"noref=
errer" target=3D"_blank">https://lists.riscv.org/g/tech-iommu/message/3</a>=
<br>
[3] <a href=3D"https://lore.kernel.org/qemu-devel/20220220085526.808674-1-a=
nup@brainfault.org" rel=3D"noreferrer" target=3D"_blank">https://lore.kerne=
l.org/qemu-devel/20220220085526.808674-1-anup@brainfault.org</a><br>
<br>
Tomasz Jeznach (2):<br>
=C2=A0 hw/riscv: rivos-iommu: Baseline implementation of RIVOS IOMMU.<br>
=C2=A0 hw/riscv: virt: Add rivos-iommu device to &#39;virt&#39; machine.<br=
>
<br>
=C2=A0hw/riscv/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 4 +<br>
=C2=A0hw/riscv/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 1 +<br>
=C2=A0hw/riscv/rivos_iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1350 ++++++=
++++++++++++++++++++++++++<br>
=C2=A0hw/riscv/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 7 +<br>
=C2=A0hw/riscv/trace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0hw/riscv/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 115 ++-<br>
=C2=A0include/hw/pci/pci_ids.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +=
<br>
=C2=A0include/hw/riscv/rivos_iommu.h |=C2=A0 =C2=A080 ++<br>
=C2=A0include/hw/riscv/virt.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +=
<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A010 files changed, 1539 insertions(+), 24 deletions(-)<br>
=C2=A0create mode 100644 hw/riscv/rivos_iommu.c<br>
=C2=A0create mode 100644 hw/riscv/trace-events<br>
=C2=A0create mode 100644 hw/riscv/trace.h<br>
=C2=A0create mode 100644 include/hw/riscv/rivos_iommu.h<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div>

--000000000000bc65ba05db16d81e--

