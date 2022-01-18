Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CFD49316C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 00:35:16 +0100 (CET)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9y0R-0004nL-GL
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 18:35:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andre.przywara@arm.com>)
 id 1n9xw8-0003j7-75; Tue, 18 Jan 2022 18:30:48 -0500
Received: from foss.arm.com ([217.140.110.172]:34262)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andre.przywara@arm.com>)
 id 1n9xvz-0003Go-MK; Tue, 18 Jan 2022 18:30:46 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86E1C1FB;
 Tue, 18 Jan 2022 15:30:28 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53BCC3F766;
 Tue, 18 Jan 2022 15:30:27 -0800 (PST)
Date: Tue, 18 Jan 2022 23:29:35 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 00/13] arm gicv3 ITS: Various bug fixes and refactorings
Message-ID: <20220118232935.50ae1b25@slackpad.fritz.box>
In-Reply-To: <CAFEAcA-ncYCtpH2aCjd4GWuN9SLcxGMQUOutBWyNHByD6_gG0w@mail.gmail.com>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <87pmop7xfw.fsf@linaro.org>
 <CAFEAcA-ncYCtpH2aCjd4GWuN9SLcxGMQUOutBWyNHByD6_gG0w@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=andre.przywara@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jan 2022 19:41:56 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

Hi Peter, Alex,

thanks for the heads up!

> On Tue, 18 Jan 2022 at 17:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> >
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> > =20
> > > I've been working on the ITS to add support for the GICv4 functionali=
ty.
> > > In the course of that I found a handful of bugs in it and also some
> > > places where the code benefited from refactoring to make it a better
> > > base to put in the GICv4 parts. This patchset is just the bugfixes
> > > and cleanups, because there are enough patches here that I figured it
> > > made sense to send them out now rather than holding on to them.
> > >
> > > Most of these patches were in v1 and have been reviewed already. =20
> >
> > I've reviewed the patches and they look good to me. kvm-unit-tests is
> > still failing some tests but the ones it fails hasn't changed from
> > before this patch:
> >
> >   =E2=9C=97  env QEMU=3D$HOME/lsrc/qemu.git/builds/arm.all/qemu-system-=
aarch64 ./run_tests.sh -g gic
> >   PASS gicv2-ipi (3 tests)
> >   PASS gicv2-mmio (17 tests, 1 skipped)
> >   FAIL gicv2-mmio-up (17 tests, 2 unexpected failures)
> >   FAIL gicv2-mmio-3p (17 tests, 3 unexpected failures)
> >   PASS gicv3-ipi (3 tests)
> >   PASS gicv2-active (1 tests)
> >   PASS gicv3-active (1 tests)
> >
> > That said running with -d unimp,guest_errors there are some things that
> > should probably be double checked, e.g.: =20
>=20
> Almost all of the logging seems to be where the test code is
> doing stuff that the GIC spec says isn't valid.

That sounds like a plausible explanation for a unit test suite, but
does not seem to be actually true in this case, see below.

> Also, this
> test is gicv2, which is unrelated to either the gicv3 code
> or to the ITS...

This is true.

>=20
> >   /home/alex/lsrc/qemu.git/builds/arm.all/qemu-system-aarch64 -nodefaul=
ts -machine virt -accel tcg -cpu cortex-a57 -device virtio-serial-device -d=
evice virtconsole,chardev=3D
> >   ctd -chardev testdev,id=3Dctd -device pci-testdev -display none -seri=
al stdio -kernel arm/gic.flat -machine gic-version=3D2 -smp 1 -append "mmio=
" -d unimp,guest_errors
> >   PASS: gicv2: mmio: all CPUs have interrupts
> >   gic_dist_readb: Bad offset 8
> >   gic_dist_readb: Bad offset 9
> >   gic_dist_readb: Bad offset a
> >   gic_dist_readb: Bad offset b =20
>=20
> This is GICD_IIDR, which is a 32-bit register. The test looks like it's
> trying to read it as 4 separate bytes, which is out of spec, and
> is why our implementation is warning about it.

Looking at k-u-t's arm/gic.c and QEMU's hw/intc/arm_gic.c I see two
problems here: QEMU implements word accesses as four successive calls to
gic_dist_readb() - which is probably fine if that helps code design,
but it won't allow it to actually spot access size issues. I just
remember that we spent some brain cells and CPP macros on getting the
access size right in KVM - hence those tests in kvm-unit-tests.
=20
But more importantly it looks like GICD_IIDR is actually not
implemented: There is a dubious "if (offset < 0x08) return 0;" line,
but IIDR (offset 0x8) would actually fall through, and hit the bad_reg
label, which would return 0 (and cause the message, if enabled).
Also the name and how it's called suggests that this deals with bytes
only, but returns uint32_t, and for instance deals with bit 10 in
TYPER. I see how this eventually falls into place magically (the upper
three bytes return 0, and get ORed into the >8 bit result of offset 8),
but those messages are definitely false alarm then.

If that helps: from a GIC MMIO perspective 8-bit accesses are actually
the exception rather than the norm (ARM IHI 0048B.b 4.1.4 GIC register
access).

> >   INFO: gicv2: mmio: IIDR: 0x00000000
> >   gic_dist_writeb: Bad offset 4
> >   gic_dist_writeb: Bad offset 5
> >   gic_dist_writeb: Bad offset 6
> >   gic_dist_writeb: Bad offset 7
> >   gic_dist_writeb: Bad offset 4
> >   gic_dist_writeb: Bad offset 5
> >   gic_dist_writeb: Bad offset 6
> >   gic_dist_writeb: Bad offset 7
> >   gic_dist_writeb: Bad offset 4
> >   gic_dist_writeb: Bad offset 5
> >   gic_dist_writeb: Bad offset 6
> >   gic_dist_writeb: Bad offset 7 =20
>=20
> These complaints are because the test is trying to write
> to GICD_TYPER, which is not permitted.

Writes are not permitted, yes, but k-u-t emits a proper str, so there
should be only three lines, not twelve.

> >   PASS: gicv2: mmio: GICD_TYPER is read-only
> >   gic_dist_readb: Bad offset 8
> >   gic_dist_readb: Bad offset 9
> >   gic_dist_readb: Bad offset a
> >   gic_dist_readb: Bad offset b =20
>=20
> More attempts to do byte accesses to a word-only register.

The messages come actually again because IIDR is not handled at all,
and there are only four of them because of the design of gic_dist_read().
k-u-t issues a proper ldr here.
I think we refrained from actually testing illegal access sizes,
because that could trigger external aborts/SErrors on real hardware.

> >   gic_dist_writeb: Bad offset 8
> >   gic_dist_writeb: Bad offset 9
> >   gic_dist_writeb: Bad offset a
> >   gic_dist_writeb: Bad offset b
> >   gic_dist_readb: Bad offset 8
> >   gic_dist_readb: Bad offset 9
> >   gic_dist_readb: Bad offset a
> >   gic_dist_readb: Bad offset b
> >   gic_dist_writeb: Bad offset 8
> >   gic_dist_writeb: Bad offset 9
> >   gic_dist_writeb: Bad offset a
> >   gic_dist_writeb: Bad offset b
> >   gic_dist_readb: Bad offset 8
> >   gic_dist_readb: Bad offset 9
> >   gic_dist_readb: Bad offset a
> >   gic_dist_readb: Bad offset b
> >   PASS: gicv2: mmio: GICD_IIDR is read-only
> >   gic_dist_writeb: Bad offset fe8
> >   gic_dist_writeb: Bad offset fe9
> >   gic_dist_writeb: Bad offset fea
> >   gic_dist_writeb: Bad offset feb
> >   gic_dist_writeb: Bad offset fe8
> >   gic_dist_writeb: Bad offset fe9
> >   gic_dist_writeb: Bad offset fea
> >   gic_dist_writeb: Bad offset feb
> >   gic_dist_writeb: Bad offset fe8
> >   gic_dist_writeb: Bad offset fe9
> >   gic_dist_writeb: Bad offset fea
> >   gic_dist_writeb: Bad offset feb =20
>=20
> Writing bytes to a register that is both read-only and also 32-bit only.

Yes, the read-only violation is expected, but the code only does ldr.

> >   PASS: gicv2: mmio: ICPIDR2 is read-only
> >   INFO: gicv2: mmio: value of ICPIDR2: 0x0000002b
> >   PASS: gicv2: mmio: IPRIORITYR: consistent priority masking
> >   INFO: gicv2: mmio: IPRIORITYR: priority mask is 0xffffffff
> >   PASS: gicv2: mmio: IPRIORITYR: implements at least 4 priority bits
> >   INFO: gicv2: mmio: IPRIORITYR: 8 priority bits implemented
> >   PASS: gicv2: mmio: IPRIORITYR: clearing priorities
> >   gic_dist_readb: Bad offset 520
> >   gic_dist_readb: Bad offset 521
> >   gic_dist_readb: Bad offset 522
> >   gic_dist_readb: Bad offset 523
> >   gic_dist_writeb: Bad offset 520
> >   gic_dist_writeb: Bad offset 521
> >   gic_dist_writeb: Bad offset 522
> >   gic_dist_writeb: Bad offset 523
> >   gic_dist_readb: Bad offset 520
> >   gic_dist_readb: Bad offset 521
> >   gic_dist_readb: Bad offset 522
> >   gic_dist_readb: Bad offset 523
> >   gic_dist_writeb: Bad offset 520
> >   gic_dist_writeb: Bad offset 521
> >   gic_dist_writeb: Bad offset 522
> >   gic_dist_writeb: Bad offset 523
> >   gic_dist_readb: Bad offset 520
> >   gic_dist_readb: Bad offset 521
> >   gic_dist_readb: Bad offset 522
> >   gic_dist_readb: Bad offset 523 =20
>=20
> I suspect from what the following test says that this is an
> attempt to write beyond the end of the valid IPRIORITYR registers,
> which isn't permitted.

Trying to manipulate non-implemented SPIs is not really useful (and
indeed typically points to guest bugs), but it is permitted by the
GICv2 spec, which says: "A register field corresponding to an
unimplemented interrupt is RAZ/WI." - which is actually what bad_reg
implements - just minus the message.

> >   PASS: gicv2: mmio: IPRIORITYR: accesses beyond limit RAZ/WI
> >   PASS: gicv2: mmio: IPRIORITYR: accessing last SPIs
> >   PASS: gicv2: mmio: IPRIORITYR: priorities are preserved
> >   PASS: gicv2: mmio: IPRIORITYR: byte reads successful
> >   PASS: gicv2: mmio: IPRIORITYR: byte writes successful
> >   PASS: gicv2: mmio: ITARGETSR: bits for non-existent CPUs masked
> >   INFO: gicv2: mmio: ITARGETSR: 7 non-existent CPUs
> >   PASS: gicv2: mmio: ITARGETSR: accesses beyond limit RAZ/WI
> >   FAIL: gicv2: mmio: ITARGETSR: register content preserved
> >   INFO: gicv2: mmio: ITARGETSR: writing 01010001 reads back as 00000000
> >   PASS: gicv2: mmio: ITARGETSR: byte reads successful
> >   FAIL: gicv2: mmio: ITARGETSR: byte writes successful
> >   INFO: gicv2: mmio: ITARGETSR: writing 0x1f into bytes 2 =3D> 0x000000=
00
> >   SUMMARY: 17 tests, 2 unexpected failures =20
>=20
> These ITARGETSR failures are not correct (or you're not running the
> test case the way it's supposed to be). Your command line runs
> only one CPU, and for a uniprocessor GIC the ITARGETRSn registers
> are supposed to be RAZ/WI, whereas the test seems to be expecting
> something else.

Interesting, indeed the *whole* of GICD_ITARGETSRs are RAZ/WI on a
uniprocessor implementation, where is also says that bits for
non-implemented CPU interfaces as RAZ/WI, which would suggest that at
least bit 0 is preserved (what this test checks).
I will double check the spec again on what uniprocessor means
precisely, and then send a kvm-unit-tests patch.

But running with -smp [2..8] still reports issues - but we know of these
for a while, I think, and they are not really critical.

Cheers,
Andre

