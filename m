Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D3936564D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:38:46 +0200 (CEST)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnmH-0002Ja-Bf
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYnk8-0000Ga-OK; Tue, 20 Apr 2021 06:36:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:38018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYnjx-0003oq-IC; Tue, 20 Apr 2021 06:36:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92465B4AF;
 Tue, 20 Apr 2021 10:36:19 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 04/13] target/s390x: remove tcg-stub.c
Date: Tue, 20 Apr 2021 12:36:07 +0200
Message-Id: <20210420103616.32731-5-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210420103616.32731-1-cfontana@suse.de>
References: <20210420103616.32731-1-cfontana@suse.de>
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

now that we protect all calls to the tcg-specific functions
with if (tcg_enabled()), we do not need the TCG stub anymore.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/s390x/tcg-stub.c  | 30 ------------------------------
 target/s390x/meson.build |  2 +-
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 target/s390x/tcg-stub.c

diff --git a/target/s390x/tcg-stub.c b/target/s390x/tcg-stub.c
deleted file mode 100644
index d22c898802..0000000000
--- a/target/s390x/tcg-stub.c
+++ /dev/null
@@ -1,30 +0,0 @@
-/*
- * QEMU TCG support -- s390x specific function stubs.
- *
- * Copyright (C) 2018 Red Hat Inc
- *
- * Authors:
- *   David Hildenbrand <david@redhat.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "qemu-common.h"
-#include "cpu.h"
-#include "tcg_s390x.h"
-
-void tcg_s390_tod_updated(CPUState *cs, run_on_cpu_data opaque)
-{
-}
-void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
-                                              uint32_t code, uintptr_t ra)
-{
-    g_assert_not_reached();
-}
-void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc,
-                                           uintptr_t ra)
-{
-    g_assert_not_reached();
-}
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 1219f64112..a5e1ded93f 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -21,7 +21,7 @@ s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
   'vec_helper.c',
   'vec_int_helper.c',
   'vec_string_helper.c',
-), if_false: files('tcg-stub.c'))
+))
 
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 
-- 
2.26.2


