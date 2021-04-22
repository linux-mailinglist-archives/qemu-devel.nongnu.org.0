Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1C9367FEB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:00:41 +0200 (CEST)
Received: from localhost ([::1]:60890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZY0e-00051w-NM
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lZXuo-0005ym-IA; Thu, 22 Apr 2021 07:54:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:40076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lZXul-0001yT-0H; Thu, 22 Apr 2021 07:54:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9E6DAECB;
 Thu, 22 Apr 2021 11:54:31 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v3 00/13] s390x cleanup
Date: Thu, 22 Apr 2021 13:54:17 +0200
Message-Id: <20210422115430.15078-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

this is the next version of a cleanup series for s390x.

v2 -> v3: minor changes

* "hw/s390x: rename tod-qemu.c to tod-tcg.c": move to the front (David)

* "hw/s390x: only build tod-qemu from the CONFIG_TCG build"
  - move just after, use "tod-tcg" instead

* "hw/s390x: tod: make explicit checks for accelerators when initializing"
  - removed a line break in commit message

* "target/s390x: start moving TCG-only code to tcg/"
  - split the rename s390x-internal.h rename part, do it before the move

* "target/s390x: move kvm files into kvm/"
  - fix broken/missing move of trace events


---

v1 -> v2: split more, stubs removal for KVM, kvm/ move, sysemu cpu models

* "hw/s390x: rename tod-qemu.c to tod-tcg.c"
  - new patch (Cornelia)

* "hw/s390x: tod: make explicit checks for accelerators when initializing"
  - now error out and abort() for an unknown accelerator. (Cornelia)

* "target/s390x: remove tcg-stub.c" : new patch split from
  "target/s390x: start moving TCG-only code to tcg/" (Cornelia)

* "target/s390x: use kvm_enabled() to wrap call to kvm_s390_get_hpage_1m"
  - new patch, allows the removal of kvm stubs

* "target/s390x: remove kvm-stub.c"
  - new patch, we do not need stubs, as all calls are wrapped by
    kvm_enabled(), and all prototypes are visible.

* "target/s390x: move kvm files into kvm/"
  - new patch

* "target/s390x: split sysemu part of cpu models"
  - new patch

* "MAINTAINERS: update s390x directories"
  - new patch


Pre-requisite series (not really needed for now, only in further work down the line):

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg07461.html

Motivation and higher level steps:

https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg04628.html

Comments welcome, thanks,

Claudio


Claudio Fontana (13):
  hw/s390x: rename tod-qemu.c to tod-tcg.c
  hw/s390x: only build tod-tcg from the CONFIG_TCG build
  hw/s390x: tod: make explicit checks for accelerators when initializing
  target/s390x: remove tcg-stub.c
  target/s390x: start moving TCG-only code to tcg/
  target/s390x: move sysemu-only code out to cpu-sysemu.c
  target/s390x: split cpu-dump from helper.c
  target/s390x: make helper.c sysemu-only
  target/s390x: use kvm_enabled() to wrap call to kvm_s390_get_hpage_1m
  target/s390x: remove kvm-stub.c
  target/s390x: move kvm files into kvm/
  target/s390x: split sysemu part of cpu models
  MAINTAINERS: update s390x directories

 meson.build                                   |   1 +
 include/hw/s390x/tod.h                        |   2 +-
 target/s390x/{ => kvm}/kvm_s390x.h            |   0
 target/s390x/kvm/trace.h                      |   1 +
 target/s390x/{internal.h => s390x-internal.h} |   8 +
 target/s390x/{ => tcg}/s390-tod.h             |   0
 target/s390x/{ => tcg}/tcg_s390x.h            |   0
 target/s390x/{ => tcg}/vec.h                  |   0
 hw/intc/s390_flic_kvm.c                       |   2 +-
 hw/s390x/s390-stattrib-kvm.c                  |   2 +-
 hw/s390x/tod-kvm.c                            |   2 +-
 hw/s390x/{tod-qemu.c => tod-tcg.c}            |   2 +-
 hw/s390x/tod.c                                |   9 +-
 hw/vfio/ap.c                                  |   2 +-
 target/s390x/arch_dump.c                      |   2 +-
 target/s390x/cpu-dump.c                       | 131 ++++++
 target/s390x/cpu-sysemu.c                     | 304 +++++++++++++
 target/s390x/cpu.c                            | 287 +-----------
 target/s390x/cpu_models.c                     | 421 +----------------
 target/s390x/cpu_models_sysemu.c              | 426 ++++++++++++++++++
 target/s390x/cpu_models_user.c                |  20 +
 target/s390x/diag.c                           |   7 +-
 target/s390x/gdbstub.c                        |   2 +-
 target/s390x/helper.c                         | 113 +----
 target/s390x/interrupt.c                      |   6 +-
 target/s390x/ioinst.c                         |   2 +-
 target/s390x/kvm-stub.c                       | 126 ------
 target/s390x/{ => kvm}/kvm.c                  |   4 +-
 target/s390x/machine.c                        |   6 +-
 target/s390x/mmu_helper.c                     |   4 +-
 target/s390x/sigp.c                           |   2 +-
 target/s390x/tcg-stub.c                       |  30 --
 target/s390x/{ => tcg}/cc_helper.c            |   2 +-
 target/s390x/{ => tcg}/crypto_helper.c        |   2 +-
 target/s390x/{ => tcg}/excp_helper.c          |   2 +-
 target/s390x/{ => tcg}/fpu_helper.c           |   2 +-
 target/s390x/{ => tcg}/int_helper.c           |   2 +-
 target/s390x/{ => tcg}/mem_helper.c           |   2 +-
 target/s390x/{ => tcg}/misc_helper.c          |   2 +-
 target/s390x/{ => tcg}/translate.c            |   2 +-
 target/s390x/{ => tcg}/vec_fpu_helper.c       |   2 +-
 target/s390x/{ => tcg}/vec_helper.c           |   2 +-
 target/s390x/{ => tcg}/vec_int_helper.c       |   0
 target/s390x/{ => tcg}/vec_string_helper.c    |   2 +-
 target/s390x/{ => tcg}/translate_vx.c.inc     |   0
 MAINTAINERS                                   |   8 +-
 hw/s390x/meson.build                          |   4 +-
 target/s390x/kvm/meson.build                  |  17 +
 target/s390x/kvm/trace-events                 |   7 +
 target/s390x/meson.build                      |  41 +-
 target/s390x/{ => tcg}/insn-data.def          |   0
 target/s390x/{ => tcg}/insn-format.def        |   0
 target/s390x/tcg/meson.build                  |  14 +
 target/s390x/trace-events                     |   8 +-
 54 files changed, 1007 insertions(+), 1038 deletions(-)
 rename target/s390x/{ => kvm}/kvm_s390x.h (100%)
 create mode 100644 target/s390x/kvm/trace.h
 rename target/s390x/{internal.h => s390x-internal.h} (97%)
 rename target/s390x/{ => tcg}/s390-tod.h (100%)
 rename target/s390x/{ => tcg}/tcg_s390x.h (100%)
 rename target/s390x/{ => tcg}/vec.h (100%)
 rename hw/s390x/{tod-qemu.c => tod-tcg.c} (98%)
 create mode 100644 target/s390x/cpu-dump.c
 create mode 100644 target/s390x/cpu-sysemu.c
 create mode 100644 target/s390x/cpu_models_sysemu.c
 create mode 100644 target/s390x/cpu_models_user.c
 delete mode 100644 target/s390x/kvm-stub.c
 rename target/s390x/{ => kvm}/kvm.c (99%)
 delete mode 100644 target/s390x/tcg-stub.c
 rename target/s390x/{ => tcg}/cc_helper.c (99%)
 rename target/s390x/{ => tcg}/crypto_helper.c (98%)
 rename target/s390x/{ => tcg}/excp_helper.c (99%)
 rename target/s390x/{ => tcg}/fpu_helper.c (99%)
 rename target/s390x/{ => tcg}/int_helper.c (99%)
 rename target/s390x/{ => tcg}/mem_helper.c (99%)
 rename target/s390x/{ => tcg}/misc_helper.c (99%)
 rename target/s390x/{ => tcg}/translate.c (99%)
 rename target/s390x/{ => tcg}/vec_fpu_helper.c (99%)
 rename target/s390x/{ => tcg}/vec_helper.c (99%)
 rename target/s390x/{ => tcg}/vec_int_helper.c (100%)
 rename target/s390x/{ => tcg}/vec_string_helper.c (99%)
 rename target/s390x/{ => tcg}/translate_vx.c.inc (100%)
 create mode 100644 target/s390x/kvm/meson.build
 create mode 100644 target/s390x/kvm/trace-events
 rename target/s390x/{ => tcg}/insn-data.def (100%)
 rename target/s390x/{ => tcg}/insn-format.def (100%)
 create mode 100644 target/s390x/tcg/meson.build

-- 
2.26.2


