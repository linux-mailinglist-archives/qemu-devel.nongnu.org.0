Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482B731CC8F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:03:32 +0100 (CET)
Received: from localhost ([::1]:49892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1sx-0003KV-91
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lC1r1-0002EW-9A
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:01:31 -0500
Received: from relay64.bu.edu ([128.197.228.104]:41032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lC1qz-00067O-68
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:01:30 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 11GF0Upe012883
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 16 Feb 2021 10:00:33 -0500
Date: Tue, 16 Feb 2021 10:00:30 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] qtest: add a reproducer for LP#1878642
Message-ID: <20210216150025.ujuq7cxspep2kaei@mozz.bu.edu>
References: <20201102163336.115444-1-alxndr@bu.edu>
 <CAFEAcA9d=ZTXzK+u5rjFvkiA53izTBq5Hm5VwQ9=WEAZX+TRJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9d=ZTXzK+u5rjFvkiA53izTBq5Hm5VwQ9=WEAZX+TRJg@mail.gmail.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210216 1325, Peter Maydell wrote:
> On Mon, 2 Nov 2020 at 16:35, Alexander Bulekov <alxndr@bu.edu> wrote:
> >
> > https://bugs.launchpad.net/qemu/+bug/1878642
> >
> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >
> > Based-on: <20200717151705.18611-1-f4bug@amsat.org>
> >
> > The added testcase will fail, unless this ^^^ patch is applied.
> >
> >  tests/qtest/fuzz-test.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
> > index 2f38bb1ec2..9cb4c42bde 100644
> > --- a/tests/qtest/fuzz-test.c
> > +++ b/tests/qtest/fuzz-test.c
> > @@ -34,6 +34,19 @@ static void test_lp1878263_megasas_zero_iov_cnt(void)
> >      qtest_quit(s);
> >  }
> >
> > +static void test_lp1878642_pci_bus_get_irq_level_assert(void)
> > +{
> > +    QTestState *s;
> > +
> > +    s = qtest_init("-M pc-q35-5.0 "
> > +                   "-nographic -monitor none -serial none "
> > +                   "-d guest_errors -trace pci*");
> > +
> > +    qtest_outl(s, 0xcf8, 0x8400f841);
> > +    qtest_outl(s, 0xcfc, 0xebed205d);
> > +    qtest_outl(s, 0x5d02, 0xebed205d);
> > +}
> 
> Hi; I just noticed this, but why does this test case pass
> "-trace pci*" to QEMU? It doesn't look like it does anything to
> try to capture the trace output, which thus winds up just going
> to the stdout/stderr of the "make check" run. Similarly I'm not
> sure '-d guest_errors' is going to do anything helpful unless
> you take steps to capture the output and check it.
> 

Ah, I sometimes include those in the initial report, if the device has
trace-events. I can remove this from fuzz-test.c, if it is slowing
things down.
-Alex

> thanks
> -- PMM

