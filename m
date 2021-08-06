Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975B33E23A9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 09:03:18 +0200 (CEST)
Received: from localhost ([::1]:56104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBtsz-0008Sq-MB
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 03:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1mBtqf-0007Uk-MN; Fri, 06 Aug 2021 03:00:53 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30]:43719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1mBtqc-0005oe-Fp; Fri, 06 Aug 2021 03:00:53 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 y16-20020a4ad6500000b0290258a7ff4058so1988654oos.10; 
 Fri, 06 Aug 2021 00:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/H/5hDhiJ0avrythNliwelus3UOHvx8664BlxKBAnLY=;
 b=P7w3z8/W0bB3ZaVTNoQHEIegcTJ7cWEizS2vW/CaGaBCvMA30/9pxGQkhnW83WUToP
 4fEQDWd1v+wnQ3zTbYjEa62U2KFOUk4RtaqkM134Usyo98Gt46hCJUj37ftvWxoLkGsn
 qiOkNdOKi686cMrtipWLcmFGVvlR92GeQw247SFgYAgKUcaDTYpWZNVduUMIokhQuqbH
 t1GsCCHYVODG4rgnu/DeLNBefG77p/73sjt/L0ZgXZs7X4qXlGEI3RJoZqVjshwreYcp
 e9GjDLnyvX/BcT59nrjO6fhWXRR/XinDbYDdTEZcLKNyJnSvyJzaLUqb5X4E98+i+gHR
 aczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/H/5hDhiJ0avrythNliwelus3UOHvx8664BlxKBAnLY=;
 b=I8I/7BWxDKly6Q5H/LnLGyi5kB+LtFBs1Ezqq9Oripfm6M3cHh+FtWQc6dzaJmqn8u
 kZ+Sq3sPLbMCNVIwuhxtmAzypHkDRZW0vZL0jgV8xmvnw7RxhVCFKiX9wHNRfvUSlYFC
 2vE3RSZIGreL1ko7K92hPrFuKzw2IaZ8WlS2KSWvzStEn1uEVRARI9vOT9tXrnN8CYc2
 WCYvCNzyrMKIgEG6fVfghRe62YmQ9O/qnUGfhSPOCfal3jIkTdeunv0CxyhLc0H7LHBQ
 szywgue3xgvCKdEOX1QT7+5w8r7Qiw7Vs5itLecowipQnmw8U6HXYx/pJ6XTp9muYmEZ
 BLjw==
X-Gm-Message-State: AOAM531Kg132sjhqXZmt4nRwBxkBCuCAKEha5UUI3YkbFKETUSXK4aXY
 uw7BwAiGSGpXFfCmoFqZ4yvsPu2SfNbuHMl1V2E=
X-Google-Smtp-Source: ABdhPJyKlLUtGJpiOW06PopBgJVf8ANeA3AlQFQbgMEZpADqrtknrrtby+4oWV/JE+0LHpvcOL04FZw9GmDPAVhgGmw=
X-Received: by 2002:a4a:d1d1:: with SMTP id a17mr5728683oos.9.1628233248254;
 Fri, 06 Aug 2021 00:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
 <22f355e1-1c2c-cf24-ad41-45c937221bea@redhat.com>
In-Reply-To: <22f355e1-1c2c-cf24-ad41-45c937221bea@redhat.com>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Fri, 6 Aug 2021 15:00:36 +0800
Message-ID: <CAAKa2jn++EK1S1WDChL=uu8YsX2y7DbqoF11_70jLYaw7ytMuA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 4, 2021 at 3:43 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 04/08/2021 08.51, Qiang Liu wrote:
> > xlnx_dp_read allows an out-of-bounds read at its default branch because
> > of an improper index.
> >
> > According to
> > https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
> > (DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.
> >
> > DP_INT_MASK     0x000003A4      32      mixed   0xFFFFF03F      Interrupt Mask Register for intrN.
> > DP_INT_EN       0x000003A8      32      mixed   0x00000000      Interrupt Enable Register.
> > DP_INT_DS       0x000003AC      32      mixed   0x00000000      Interrupt Disable Register.
> >
> > In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
> > will write s->core_registers[0x3A4
> >>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
> >>> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
> >>> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
> > In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
> > the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
> > rather than 0x3A4.
> >
> > This patch enforces the read access to offset 0x3A8 and 0x3AC to 0x3A4,
> > but does not adjust the size of s->core_registers to avoid breaking
> > migration.
> >
> > Fixes: 58ac482a66de ("introduce xlnx-dp")
> > Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> > ---
> > v2:
> >    - not change DP_CORE_REG_ARRAY_SIZE
> >    - add a qtest reproducer
> >    - update the code style
> >
> > I have a question about the QTest reproducer. Before patching xlnx-dp,
> > (0x3ac >> 2) will exceed the right bound of s->core_registers.  However,
> > this is allowed by the assertion. There is no warning and this
> > reproducer will pass. Is the reprodocer OK?
> >
> >   hw/display/xlnx_dp.c            |  6 +++++-
> >   tests/qtest/fuzz-xlnx-dp-test.c | 33 +++++++++++++++++++++++++++++++++
> >   tests/qtest/meson.build         |  1 +
> >   3 files changed, 39 insertions(+), 1 deletion(-)
> >   create mode 100644 tests/qtest/fuzz-xlnx-dp-test.c
> >
> > diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> > index 7bcbb13..747df6e 100644
> > --- a/hw/display/xlnx_dp.c
> > +++ b/hw/display/xlnx_dp.c
> > @@ -714,7 +714,11 @@ static uint64_t xlnx_dp_read(void *opaque, hwaddr offset, unsigned size)
> >           break;
> >       default:
> >           assert(offset <= (0x3AC >> 2));
> > -        ret = s->core_registers[offset];
> > +        if (offset == (0x3A8 >> 2) || offset == (0x3AC >> 2)) {
> > +            ret = s->core_registers[DP_INT_MASK];
> > +        } else {
> > +            ret = s->core_registers[offset];
> > +        }
> >           break;
> >       }
> >
> > diff --git a/tests/qtest/fuzz-xlnx-dp-test.c b/tests/qtest/fuzz-xlnx-dp-test.c
> > new file mode 100644
> > index 0000000..69eb6c0
> > --- /dev/null
> > +++ b/tests/qtest/fuzz-xlnx-dp-test.c
>
> Would it make sense to call the file xlnx-zcu102.c instead, in case we want
> to add other tests related to this machine later?
It seems that each file in tests/qtest is called by the name of a
single virtual device. I follow this pattern. Additionally, maybe if,
in the future, xlnx-dp is used by another machine, then it is not
proper to call the file xlnx-zcu102. What do you think about it?

> > @@ -0,0 +1,33 @@
> > +/*
> > + * QTest fuzzer-generated testcase for xlnx-dp display device
> > + *
> > + * Copyright (c) 2021 Qiang Liu <cyruscyliu@gmail.com>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "libqos/libqtest.h"
> > +
> > +/*
> > + * This used to trigger the out-of-bounds read in xlnx_dp_read
> > + */
> > +static void test_fuzz_xlnx_dp_0x3ac(void)
> > +{
> > +    QTestState *s = qtest_init("-M xlnx-zcu102 -display none ");
>
> You don't need "-display none", it's added by default in the qtest framework
> (see tests/qtest/libqtest.c)
Got it.

> > +    qtest_readl(s, 0xfd4a03ac);
> > +    qtest_quit(s);
> > +}
> > +
> > +int main(int argc, char **argv)
> > +{
> > +    const char *arch = qtest_get_arch();
> > +
> > +    g_test_init(&argc, &argv, NULL);
> > +
> > +   if (strcmp(arch, "aarch64") == 0) {
>
> You likely don't need the architecture check, since it's only added for
> aarch64 in the meson.build file anyway.
Got it.

> > +        qtest_add_func("fuzz/test_fuzz_xlnx_dp/3ac", test_fuzz_xlnx_dp_0x3ac);
> > +   }
> > +
> > +   return g_test_run();
> > +}
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index 83ad237..6fd6b0e 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -185,6 +185,7 @@ qtests_aarch64 = \
> >      'numa-test',
> >      'boot-serial-test',
> >      'xlnx-can-test',
> > +   'fuzz-xlnx-dp-test',
> >      'migration-test']
> >
> >   qtests_s390x = \
>
> With at least the "-display none" removed:
> Acked-by: Thomas Huth <thuth@redhat.com>
Thank you!

