Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BD9D93FE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 16:37:15 +0200 (CEST)
Received: from localhost ([::1]:43446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKkQM-0007LP-Kg
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 10:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41715)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iKkNZ-000555-8J
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 10:34:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iKkNX-0000iT-PP
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 10:34:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55842)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iKkNT-0000g1-9J; Wed, 16 Oct 2019 10:34:15 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DABCF3090FE0;
 Wed, 16 Oct 2019 14:34:13 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90FB219C68;
 Wed, 16 Oct 2019 14:34:11 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v1 0/5] target/arm/kvm: Provide an option to adjust virtual
 time
Date: Wed, 16 Oct 2019 16:34:05 +0200
Message-Id: <20191016143410.5023-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 16 Oct 2019 14:34:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
 - move from RFC status to v1
 - put kvm_arm_vm_state_change() in kvm.c to share among kvm32.c and kvm6=
4.c
 - add r-b's from Richard


This series is inspired by a series[1] posted by Bijan Mottahedeh about
a year ago.  The problem described in the cover letter of [1] is easily
reproducible and some users would like to have the option to avoid it.
However the solution, which is to adjust the virtual counter offset each
time the VM transitions to the running state, introduces a different
problem, which is that the virtual and physical counters diverge.  As
described in the cover letter of [1] this divergence is easily observed
when comparing the output of `date` and `hwclock` after suspending the
guest, waiting a while, and then resuming it.  Because this different
problem may actually be worse for some users, unlike [1], the series
posted here makes the virtual counter offset adjustment optional and not
even enabled by default.  Besides the adjustment being optional, this
series approaches the needed changes differently to apply them in more
appropriate locations.  Finally, unlike [1], this series doesn't attempt
to measure "pause time" itself.  Simply using QEMU_CLOCK_VIRTUAL, which
only ticks when the VM is not stopped, is sufficient.

I've based this series on the SVE series[2] because we're adding a new
CPU feature (kvm-adjvtime) and the SVE series introduces CPU feature
documentation, probing, and tests that we can then immediately apply
to kvm-adjvtime.

Additional notes
----------------

Note 1
------

As described above, when running a guest with kvm-adjtime enabled it
will be less likely the guest OS and guest applications get surprise
time jumps when they use the virtual counter.  However the counter will
no longer reflect real time.  It will lag behind.  If this is a problem
then the guest can resynchronize its time from an external source or
even from its physical counter.  If the suspend/resume is done with
libvirt's virsh, and the guest is running the guest agent, then it's
also possible to use a sequence like this

 $ virsh suspend $GUEST
 $ virsh resume $GUEST
 $ virsh domtime --sync $GUEST

in order to resynchronize a guest right after the resume.  Of course
there will still be time when the clock is not right, possibly creating
confusing timestamps in logs, for example, and the guest must still be
tolerant to the time synchronizations.

Note 2
------

Userspace that wants to set KVM_REG_ARM_TIMER_CNT should beware that
the KVM register ID is not correct.  This cannot be fixed because it's
UAPI and if the UAPI headers are used then it can't be a problem.
However, if a userspace attempts to create the ID themselves from the
register's specification, then they will get KVM_REG_ARM_TIMER_CVAL
instead, as the _CNT and _CVAL definitions have their register
parameters swapped.

Note 3
------

I didn't test this with a 32-bit KVM host, but the changes to kvm32.c
are the same as kvm64.c. So what could go wrong? Test results would be
appreciated.
=20

[1] https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg05713.html
[2] https://patchew.org/QEMU/20191001125845.8793-1-drjones@redhat.com/

Thanks,
drew


Andrew Jones (5):
  target/arm/kvm64: kvm64 cpus have timer registers
  timer: arm: Introduce functions to get the host cntfrq
  target/arm/kvm: Implement cpu feature kvm-adjvtime
  tests/arm-cpu-features: Check feature default values
  target/arm/cpu: Add the kvm-adjvtime CPU property

 docs/arm-cpu-features.rst | 27 +++++++++++++++++-
 include/qemu/timer.h      | 16 +++++++++++
 target/arm/cpu.c          |  2 ++
 target/arm/cpu.h          |  3 ++
 target/arm/cpu64.c        |  1 +
 target/arm/kvm.c          | 59 +++++++++++++++++++++++++++++++++++++++
 target/arm/kvm32.c        |  3 ++
 target/arm/kvm64.c        |  4 +++
 target/arm/kvm_arm.h      | 25 +++++++++++++++++
 target/arm/monitor.c      |  1 +
 tests/arm-cpu-features.c  | 48 +++++++++++++++++++++++++------
 11 files changed, 179 insertions(+), 10 deletions(-)

--=20
2.21.0


