Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F932ADA33
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:19:53 +0100 (CET)
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVR2-0005PQ-3i
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kcVLc-00081r-MS
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:14:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:48694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kcVLY-0003Hx-Nw
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:14:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A2E5ACF5;
 Tue, 10 Nov 2020 15:14:09 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 0/7] i386 cleanup
Date: Tue, 10 Nov 2020 16:13:59 +0100
Message-Id: <20201110151406.25648-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 23:19:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

this is the first part (first 7 patches) of the previous
RFC v1 (i386 cleanup).

I put the rest of the series on the side, and will be subject
of further RFCs going forward.

In this PATCH I start by moving all i386-specific accelerators
into subdirs of target/i386/ away from the main target directory,

then I go on and strip away all the cpu dump code out of helper.c
into a new file. There is a large amount of checkpatch warnings
and errors, but this is due to the copy paste of the old code,
we might need to clean up the state of the dump code in a later
change if necessary.

After that I take out tcg-specific stuff from cpu.h and from
helper.c and put it in helper-tcg.h and in a new tcg-cpu module.

Motivation and higher level steps:

https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg04628.html

Ciao,

Claudio

Claudio Fontana (7):
  i386: move kvm accel files into kvm/
  i386: move whpx accel files to whpx/
  i386: move hax accel files to accel/hax
  i386: hvf: remove stale MAINTAINERS entry for old hvf stubs
  i386: move TCG accel files into accel/tcg
  i386: move cpu dump out of helper.c into cpu-dump.c
  i386: move TCG cpu class initialization out of helper.c

 MAINTAINERS                           |  10 +-
 hw/i386/fw_cfg.c                      |   2 +-
 hw/i386/intel_iommu.c                 |   2 +-
 hw/i386/kvm/apic.c                    |   2 +-
 hw/i386/kvm/clock.c                   |   2 +-
 hw/i386/microvm.c                     |   2 +-
 hw/i386/pc.c                          |   2 +-
 hw/i386/x86.c                         |   2 +-
 meson.build                           |   1 +
 target/i386/cpu-dump.c                | 538 +++++++++++++++++++++++++
 target/i386/cpu.c                     |  35 +-
 target/i386/cpu.h                     | 100 +----
 target/i386/{ => hax}/hax-all.c       |   0
 target/i386/{ => hax}/hax-cpus.c      |   0
 target/i386/{ => hax}/hax-cpus.h      |   0
 target/i386/{ => hax}/hax-i386.h      |   6 +-
 target/i386/{ => hax}/hax-interface.h |   0
 target/i386/{ => hax}/hax-mem.c       |   0
 target/i386/{ => hax}/hax-posix.c     |   0
 target/i386/{ => hax}/hax-posix.h     |   0
 target/i386/{ => hax}/hax-windows.c   |   0
 target/i386/{ => hax}/hax-windows.h   |   0
 target/i386/hax/meson.build           |   7 +
 target/i386/helper-tcg.h              | 112 ++++++
 target/i386/helper.c                  | 539 +-------------------------
 target/i386/{ => kvm}/hyperv-proto.h  |   0
 target/i386/{ => kvm}/hyperv-stub.c   |   0
 target/i386/{ => kvm}/hyperv.c        |   0
 target/i386/{ => kvm}/hyperv.h        |   0
 target/i386/{ => kvm}/kvm-stub.c      |   0
 target/i386/{ => kvm}/kvm.c           |   0
 target/i386/{ => kvm}/kvm_i386.h      |   0
 target/i386/kvm/meson.build           |   3 +
 target/i386/kvm/trace-events          |   7 +
 target/i386/kvm/trace.h               |   1 +
 target/i386/machine.c                 |   4 +-
 target/i386/meson.build               |  33 +-
 target/i386/tcg-cpu.c                 |  71 ++++
 target/i386/tcg-cpu.h                 |  15 +
 target/i386/{ => tcg}/bpt_helper.c    |   1 +
 target/i386/{ => tcg}/cc_helper.c     |   1 +
 target/i386/{ => tcg}/excp_helper.c   |   1 +
 target/i386/{ => tcg}/fpu_helper.c    |  33 +-
 target/i386/{ => tcg}/int_helper.c    |   1 +
 target/i386/{ => tcg}/mem_helper.c    |   1 +
 target/i386/tcg/meson.build           |  13 +
 target/i386/{ => tcg}/misc_helper.c   |   1 +
 target/i386/{ => tcg}/mpx_helper.c    |   1 +
 target/i386/{ => tcg}/seg_helper.c    |   1 +
 target/i386/{ => tcg}/smm_helper.c    |   2 +
 target/i386/{ => tcg}/svm_helper.c    |   1 +
 target/i386/{ => tcg}/tcg-stub.c      |   0
 target/i386/{ => tcg}/translate.c     |   1 +
 target/i386/trace-events              |   6 -
 target/i386/whpx/meson.build          |   4 +
 target/i386/{ => whpx}/whp-dispatch.h |   0
 target/i386/{ => whpx}/whpx-all.c     |   0
 target/i386/{ => whpx}/whpx-cpus.c    |   0
 target/i386/{ => whpx}/whpx-cpus.h    |   0
 59 files changed, 842 insertions(+), 722 deletions(-)
 create mode 100644 target/i386/cpu-dump.c
 rename target/i386/{ => hax}/hax-all.c (100%)
 rename target/i386/{ => hax}/hax-cpus.c (100%)
 rename target/i386/{ => hax}/hax-cpus.h (100%)
 rename target/i386/{ => hax}/hax-i386.h (95%)
 rename target/i386/{ => hax}/hax-interface.h (100%)
 rename target/i386/{ => hax}/hax-mem.c (100%)
 rename target/i386/{ => hax}/hax-posix.c (100%)
 rename target/i386/{ => hax}/hax-posix.h (100%)
 rename target/i386/{ => hax}/hax-windows.c (100%)
 rename target/i386/{ => hax}/hax-windows.h (100%)
 create mode 100644 target/i386/hax/meson.build
 create mode 100644 target/i386/helper-tcg.h
 rename target/i386/{ => kvm}/hyperv-proto.h (100%)
 rename target/i386/{ => kvm}/hyperv-stub.c (100%)
 rename target/i386/{ => kvm}/hyperv.c (100%)
 rename target/i386/{ => kvm}/hyperv.h (100%)
 rename target/i386/{ => kvm}/kvm-stub.c (100%)
 rename target/i386/{ => kvm}/kvm.c (100%)
 rename target/i386/{ => kvm}/kvm_i386.h (100%)
 create mode 100644 target/i386/kvm/meson.build
 create mode 100644 target/i386/kvm/trace-events
 create mode 100644 target/i386/kvm/trace.h
 create mode 100644 target/i386/tcg-cpu.c
 create mode 100644 target/i386/tcg-cpu.h
 rename target/i386/{ => tcg}/bpt_helper.c (99%)
 rename target/i386/{ => tcg}/cc_helper.c (99%)
 rename target/i386/{ => tcg}/excp_helper.c (99%)
 rename target/i386/{ => tcg}/fpu_helper.c (99%)
 rename target/i386/{ => tcg}/int_helper.c (99%)
 rename target/i386/{ => tcg}/mem_helper.c (99%)
 create mode 100644 target/i386/tcg/meson.build
 rename target/i386/{ => tcg}/misc_helper.c (99%)
 rename target/i386/{ => tcg}/mpx_helper.c (99%)
 rename target/i386/{ => tcg}/seg_helper.c (99%)
 rename target/i386/{ => tcg}/smm_helper.c (99%)
 rename target/i386/{ => tcg}/svm_helper.c (99%)
 rename target/i386/{ => tcg}/tcg-stub.c (100%)
 rename target/i386/{ => tcg}/translate.c (99%)
 create mode 100644 target/i386/whpx/meson.build
 rename target/i386/{ => whpx}/whp-dispatch.h (100%)
 rename target/i386/{ => whpx}/whpx-all.c (100%)
 rename target/i386/{ => whpx}/whpx-cpus.c (100%)
 rename target/i386/{ => whpx}/whpx-cpus.h (100%)

-- 
2.26.2


