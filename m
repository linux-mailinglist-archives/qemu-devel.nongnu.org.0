Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82481481696
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 21:14:54 +0100 (CET)
Received: from localhost ([::1]:36366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2fLZ-0000Tz-5k
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 15:14:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scrameta@googlemail.com>)
 id 1n2fJx-0007lX-6L
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 15:13:13 -0500
Received: from [2a00:1450:4864:20::229] (port=33563
 helo=mail-lj1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scrameta@googlemail.com>)
 id 1n2fJv-0004N5-JV
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 15:13:12 -0500
Received: by mail-lj1-x229.google.com with SMTP id v15so37626727ljc.0
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 12:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=7rJpFjP+tzBX0oE0fOGwLmDSrgmXuO6xaBSm/uoRaiM=;
 b=DqbhWlcCuxvaL6BMf5jzuf0TyZqMWjEVvUwA5qSVHxsi94O9eHQ49Tq/AcDshWMzyt
 DeB+VLhJW75zta92nu7Eo9TuoTzgTGX87kCvFqq5O5bGKZYMv8AipxAD0DttvPKcARwH
 OXthjCA/RFsJMVRUM8XVxRmNJ9QDxsKPw5fgoYvGeMqlBv3p+kZYbiYN16lZkBVO2LTH
 h5Vv+kn0SzrMngeRHKLQM3Hlgq66N2kVPpeJieLJbuFp5Q+1J0tXeOu24U0RHEFfkxZO
 7K6uyvo4VxjdiFND2E1vOnpLbuOJgBr+VeX4fNrfl905g1SqR0H2E7W9NJ2P4vgn8jsq
 khug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7rJpFjP+tzBX0oE0fOGwLmDSrgmXuO6xaBSm/uoRaiM=;
 b=BM7KtVWcUd5wVGjSsOBuIW8aZEb+sbyR/mfk/OS4nv7n91W29Llna6zDVDY6UshFmZ
 8on8BiKSKVUDMA5PVXRra+/4c9L8ASVrsj8oIL+p3stNjXaSX8PMZbqfg8zq3ofgCL0j
 Wx19YUB8BNK+esSU6h+qoz0fNnfEzOvqL55M2K1efrIUpSg9boVJ7IbFMrKyOP5a/9OZ
 WnoTUTqlUvQyS8QhS4sL7pfeHYv6U+bwwg+TlM7bBhFzAWyWekG2XKXQp8HkKhU/gPNA
 9t8BF+2p8KOY3YD2KfVmT+zzzoxHpXB1cePt1e2xMlOzsQIXWOAlULX6mEXMpmkuEbBJ
 dWkw==
X-Gm-Message-State: AOAM531e6vpRje15dYveesrldR4kmv57l9Qrb/OQGuwnFX09lkJxJvr1
 BW67txfdmJj5p8g7+Ta9N31kbzmoHpO18z0s2fD4Z9HjsyQ=
X-Google-Smtp-Source: ABdhPJy9RTFLVqxidJNCH22R1zZXzekP0/bsohj+31Nyaks+V0DNpWUTTOYyMWq30XtT2cCwIDQvc/NczNo6ohJXrMQ=
X-Received: by 2002:a05:651c:886:: with SMTP id
 d6mr2838733ljq.336.1640808788587; 
 Wed, 29 Dec 2021 12:13:08 -0800 (PST)
MIME-Version: 1.0
From: Mark Watson <scrameta@googlemail.com>
Date: Wed, 29 Dec 2021 21:12:56 +0100
Message-ID: <CAOG2ctwLQhtezS80vKWZOJQs5k4qr3PsD2UK+cx8Ce+Sa_HRww@mail.gmail.com>
Subject: New arm alignment issue with 6.2.0 - bisected to single revision
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000fcf74905d44e9059"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::229
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=scrameta@googlemail.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: 16
X-Spam_score: 1.6
X-Spam_bar: +
X-Spam_report: (1.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, HEXHASH_WORD=1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--000000000000fcf74905d44e9059
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm seeing a repeatable alignment exception running m68k system mode on
armv7l (arm cortex a9) following this commit:
"fa947a667fceab02f9f85fc99f54aebcc9ae6b51 is the first bad commit
commit fa947a667fceab02f9f85fc99f54aebcc9ae6b51
Author: Richard Henderson <richard.henderson@linaro.org>
Date: Thu Jul 29 10:45:10 2021 -1000

hw/core: Make do_unaligned_access noreturn

While we may have had some thought of allowing system-mode
to return from this hook, we have no guests that require this.
"
With this included I see this in the kernel dmesg log:
[10621.993234] Alignment trap: not handling instruction f843b004 at
[<b677bb2e>]
[10622.000479] 8<--- cut here ---
[10622.003609] Unhandled fault: alignment exception (0x811) at 0xb13eed96
[10622.010162] pgd = 45acdb93
[10622.012941] [b13eed96] *pgd=0557a831, *pte=c01ee743, *ppte=c01eec33

As well as bisecting I've verified it is this revision by checking out
clean HEAD then reverting just this revision (+ fixing conflicts).

The patch itself just seems to be adding QEMU_NORETURN (aka '__attribute__
((__noreturn__))') which I'd expect to be benign, so I'm not really sure
what is going on.

I cross-compiled it on Ubuntu using gcc/g++ (Ubuntu 9.3.0-17ubuntu1~20.04)
9.3.0.

Thanks,

Mark

--000000000000fcf74905d44e9059
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I&#39;m seeing a repeata=
ble alignment exception running m68k system mode on armv7l (arm cortex a9) =
following this commit:</div><div>&quot;fa947a667fceab02f9f85fc99f54aebcc9ae=
6b51 is the first bad commit<br>
commit fa947a667fceab02f9f85fc99f54aebcc9ae6b51<br>
Author: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.or=
g">richard.henderson@linaro.org</a>&gt;<br>
Date:   Thu Jul 29 10:45:10 2021 -1000<br>
<br>
    hw/core: Make do_unaligned_access noreturn<br>
    <br>
    While we may have had some thought of allowing system-mode<br>
    to return from this hook, we have no guests that require this.</div><di=
v>&quot;</div><div>With this included I see this in the kernel dmesg log:<b=
r></div><div>[10621.993234] Alignment trap: not handling instruction f843b0=
04 at [&lt;b677bb2e&gt;]<br>[10622.000479] 8&lt;--- cut here ---<br>[10622.=
003609] Unhandled fault: alignment exception (0x811) at 0xb13eed96<br>[1062=
2.010162] pgd =3D 45acdb93<br>[10622.012941] [b13eed96] *pgd=3D0557a831, *p=
te=3Dc01ee743, *ppte=3Dc01eec33</div><div><br></div><div>As well as bisecti=
ng I&#39;ve verified it is this revision by checking out clean HEAD then re=
verting just this revision (+ fixing conflicts). <br></div><div><br></div><=
div>The patch itself just seems to be adding QEMU_NORETURN (aka &#39;__attr=
ibute__ ((__noreturn__))&#39;) which I&#39;d expect to be benign, so I&#39;=
m not really sure what is going on.<br></div><div><br></div><div>I cross-co=
mpiled it on Ubuntu using gcc/g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0.</di=
v><div><br></div><div>Thanks,</div><div><br></div><div>Mark<br></div><div><=
br></div><div><br></div><div><br></div></div>

--000000000000fcf74905d44e9059--

