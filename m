Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086E5344FCF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:23:12 +0100 (CET)
Received: from localhost ([::1]:51030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQ8t-0001fL-2A
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lOQ1x-0004xO-FR; Mon, 22 Mar 2021 15:16:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:48512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lOQ1s-0003SB-Q4; Mon, 22 Mar 2021 15:16:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9860EAB8A;
 Mon, 22 Mar 2021 19:15:53 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v1 0/5] s390x cleanup
Date: Mon, 22 Mar 2021 20:15:46 +0100
Message-Id: <20210322191551.25752-1-cfontana@suse.de>
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

Hi, I am starting a cleanup series for s390x,

with the goal of doing similar splits of KVM vs TCG,
sysemu vs user mode, as for the existing work on x86 and ARM.

S/390 target looks very good already, and seems much easier to work
with. I hope that with some patches it will be even better.

I will pile up more patches later on, but I start sharing something
here with these few RFC patches for your eyes,

they are based on the pre-requisite series:

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg07461.html

Motivation and higher level steps:

https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg04628.html

Comments welcome, thanks,

Claudio

Claudio Fontana (5):
  hw/s390x: only build qemu-tod from the CONFIG_TCG build
  target/s390x: start moving TCG-only code to tcg/
  target/s390x: move sysemu-only code out to cpu-sysemu.c
  target/s390x: split cpu-dump from helper.c
  target/s390x: make helper.c sysemu-only

 include/hw/s390x/tod.h                        |   2 +-
 target/s390x/{internal.h => s390x-internal.h} |   6 +
 target/s390x/{ => tcg}/s390-tod.h             |   0
 target/s390x/{ => tcg}/tcg_s390x.h            |   0
 target/s390x/{ => tcg}/vec.h                  |   0
 hw/s390x/tod-qemu.c                           |   2 +-
 hw/s390x/tod.c                                |   9 +-
 target/s390x/arch_dump.c                      |   2 +-
 target/s390x/cpu-dump.c                       | 131 ++++++++
 target/s390x/cpu-sysemu.c                     | 304 ++++++++++++++++++
 target/s390x/cpu.c                            | 285 +---------------
 target/s390x/cpu_models.c                     |   2 +-
 target/s390x/diag.c                           |   2 +-
 target/s390x/gdbstub.c                        |   2 +-
 target/s390x/helper.c                         | 113 +------
 target/s390x/interrupt.c                      |   4 +-
 target/s390x/ioinst.c                         |   2 +-
 target/s390x/kvm.c                            |   2 +-
 target/s390x/machine.c                        |   4 +-
 target/s390x/mmu_helper.c                     |   2 +-
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
 hw/s390x/meson.build                          |   5 +-
 target/s390x/meson.build                      |  21 +-
 target/s390x/{ => tcg}/insn-data.def          |   0
 target/s390x/{ => tcg}/insn-format.def        |   0
 target/s390x/tcg/meson.build                  |  14 +
 target/s390x/trace-events                     |   2 +-
 41 files changed, 512 insertions(+), 458 deletions(-)
 rename target/s390x/{internal.h => s390x-internal.h} (98%)
 rename target/s390x/{ => tcg}/s390-tod.h (100%)
 rename target/s390x/{ => tcg}/tcg_s390x.h (100%)
 rename target/s390x/{ => tcg}/vec.h (100%)
 create mode 100644 target/s390x/cpu-dump.c
 create mode 100644 target/s390x/cpu-sysemu.c
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
 rename target/s390x/{ => tcg}/insn-data.def (100%)
 rename target/s390x/{ => tcg}/insn-format.def (100%)
 create mode 100644 target/s390x/tcg/meson.build

-- 
2.26.2


