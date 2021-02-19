Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2DD31F3B8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 02:56:33 +0100 (CET)
Received: from localhost ([::1]:37594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCv1z-0006jF-WA
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 20:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCv0U-0006Ig-JI
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 20:54:58 -0500
Received: from relay64.bu.edu ([128.197.228.104]:47192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCv0R-000262-Sl
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 20:54:57 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 11J1s3ek011982
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 18 Feb 2021 20:54:07 -0500
Date: Thu, 18 Feb 2021 20:54:03 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] net: eepro100: validate various address values
Message-ID: <20210219015403.tl5upltt3d2bnmw5@mozz.bu.edu>
References: <20210218140629.373646-1-ppandit@redhat.com>
 <CAFEAcA_8sUX5nbg5+DR8Z6F3t1Y3o=tgZY56dFTKLgA7XVWOcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_8sUX5nbg5+DR8Z6F3t1Y3o=tgZY56dFTKLgA7XVWOcw@mail.gmail.com>
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 P J P <ppandit@redhat.com>, Ruhr-University Bochum <bugs-syssec@rub.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210218 1441, Peter Maydell wrote:
> On Thu, 18 Feb 2021 at 14:13, P J P <ppandit@redhat.com> wrote:
> >
> > From: Prasad J Pandit <pjp@fedoraproject.org>
> >
> > While processing controller commands, eepro100 emulator gets
> > command unit(CU) base address OR receive unit (RU) base address
> > OR command block (CB) address from guest. If these values are not
> > checked, it may lead to an infinite loop kind of issues. Add checks
> > to avoid it.
> >
> > Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
> > Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> > ---
> >  hw/net/eepro100.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> > index 16e95ef9cc..afa1c9b2aa 100644
> > --- a/hw/net/eepro100.c
> > +++ b/hw/net/eepro100.c
> > @@ -843,7 +843,8 @@ static void action_command(EEPRO100State *s)
> >          bool bit_i;
> >          bool bit_nc;
> >          uint16_t ok_status = STATUS_OK;
> > -        s->cb_address = s->cu_base + s->cu_offset;
> > +        s->cb_address = s->cu_base + s->cu_offset;  /* uint32_t overflow */
> > +        assert (s->cb_address >= s->cu_base);
> 
> We get these values from the guest; you can't just assert() on them.
> You need to do something else.
> 
> My reading of the 8255x data sheet is that there is nothing
> in the hardware that forbids the guest from programming the
> device such that the cu_base + cu_offset wraps around:
> http://www.intel.com/content/dam/doc/manual/8255x-10-100-mbps-ethernet-controller-software-dev-manual.pdf
> -- page 30 says that this is all doing 32-bit arithmetic
> on addresses and doesn't say that there is any special case
> handling by the device of overflow of that addition.
> 
> Your commit message isn't very clear about what the failure
> case is here, but I think the fix has to be something
> different from this.

Maybe the infinite loop mentioned in the commit message is actually a
DMA recursion issue? I'm providing a reproducer for a DMA re-entracy
issue below. With this patch applied, the reproducer triggers the
assert(), rather than overflowing the stack, so maybe it is the same
issue?
-Alex

cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
512M -device i82559er,netdev=net0 -netdev user,id=net0 -nodefaults \
-qtest stdio
outl 0xcf8 0x80001014
outl 0xcfc 0xc000
outl 0xcf8 0x80001010
outl 0xcfc 0xe0020000
outl 0xcf8 0x80001004
outw 0xcfc 0x7
write 0x1ffffc0b 0x1 0x55
write 0x1ffffc0c 0x1 0xfc
write 0x1ffffc0d 0x1 0x46
write 0x1ffffc0e 0x1 0x07
write 0x746fc59 0x1 0x02
write 0x746fc5b 0x1 0x02
write 0x746fc5c 0x1 0xe0
write 0x4 0x1 0x07
write 0x5 0x1 0xfc
write 0x6 0x1 0xff
write 0x7 0x1 0x1f
outw 0xc002 0x20
EOF

Formatted for committing a regression-test:

static void test_fuzz(void)
{
    QTestState *s =
        qtest_init("-display none , -m 512M -device i82559er,netdev=net0 "
                   "-netdev user,id=net0 -nodefaults");
    qtest_outl(s, 0xcf8, 0x80001014);
    qtest_outl(s, 0xcfc, 0xc000);
    qtest_outl(s, 0xcf8, 0x80001010);
    qtest_outl(s, 0xcfc, 0xe0020000);
    qtest_outl(s, 0xcf8, 0x80001004);
    qtest_outw(s, 0xcfc, 0x7);
    qtest_bufwrite(s, 0x1ffffc0b, "\x55", 0x1);
    qtest_bufwrite(s, 0x1ffffc0c, "\xfc", 0x1);
    qtest_bufwrite(s, 0x1ffffc0d, "\x46", 0x1);
    qtest_bufwrite(s, 0x1ffffc0e, "\x07", 0x1);
    qtest_bufwrite(s, 0x746fc59, "\x02", 0x1);
    qtest_bufwrite(s, 0x746fc5b, "\x02", 0x1);
    qtest_bufwrite(s, 0x746fc5c, "\xe0", 0x1);
    qtest_bufwrite(s, 0x4, "\x07", 0x1);
    qtest_bufwrite(s, 0x5, "\xfc", 0x1);
    qtest_bufwrite(s, 0x6, "\xff", 0x1);
    qtest_bufwrite(s, 0x7, "\x1f", 0x1);
    qtest_outw(s, 0xc002, 0x20);
    qtest_quit(s);
}


> 
> thanks
> -- PMM
> 

