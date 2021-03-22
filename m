Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE746344FDA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:26:30 +0100 (CET)
Received: from localhost ([::1]:57364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQC5-0004su-NZ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lOQ1z-0004zp-0V; Mon, 22 Mar 2021 15:16:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:48754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lOQ1v-0003UL-RI; Mon, 22 Mar 2021 15:16:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5FF8AF27;
 Mon, 22 Mar 2021 19:15:55 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v1 5/5] target/s390x: make helper.c sysemu-only
Date: Mon, 22 Mar 2021 20:15:51 +0100
Message-Id: <20210322191551.25752-6-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322191551.25752-1-cfontana@suse.de>
References: <20210322191551.25752-1-cfontana@suse.de>
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

Now that we have moved cpu-dump functionality out of helper.c,
we can make the module sysemu-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/s390x/helper.c    | 4 ----
 target/s390x/meson.build | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 41ccc83d11..f246bec353 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -27,11 +27,8 @@
 #include "hw/s390x/pv.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#ifndef CONFIG_USER_ONLY
 #include "sysemu/tcg.h"
-#endif
 
-#ifndef CONFIG_USER_ONLY
 void s390x_tod_timer(void *opaque)
 {
     cpu_inject_clock_comparator((S390CPU *) opaque);
@@ -322,4 +319,3 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, hwaddr len)
     cpu_physical_memory_unmap(sa, len, 1, len);
     return 0;
 }
-#endif /* CONFIG_USER_ONLY */
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 6e1aa3b0cd..bbcaede384 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -4,7 +4,6 @@ s390x_ss.add(files(
   'cpu_features.c',
   'cpu_models.c',
   'gdbstub.c',
-  'helper.c',
   'interrupt.c',
   'cpu-dump.c',
 ))
@@ -23,6 +22,7 @@ s390x_ss.add(gen_features_h)
 
 s390x_softmmu_ss = ss.source_set()
 s390x_softmmu_ss.add(files(
+  'helper.c',
   'arch_dump.c',
   'diag.c',
   'ioinst.c',
-- 
2.26.2


