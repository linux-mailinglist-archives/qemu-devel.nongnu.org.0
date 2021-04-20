Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28936565B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:42:06 +0200 (CEST)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnpV-0007DR-3T
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYnkF-0000SH-Pn; Tue, 20 Apr 2021 06:36:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:38258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYnkA-0003tn-Pg; Tue, 20 Apr 2021 06:36:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F51FB4A1;
 Tue, 20 Apr 2021 10:36:22 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 09/13] target/s390x: use kvm_enabled() to wrap call to
 kvm_s390_get_hpage_1m
Date: Tue, 20 Apr 2021 12:36:12 +0200
Message-Id: <20210420103616.32731-10-cfontana@suse.de>
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

this will allow to remove the kvm stubs.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/s390x/diag.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index 86b7032b5b..311e22b4ea 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -21,6 +21,7 @@
 #include "hw/s390x/ipl.h"
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/pv.h"
+#include "sysemu/kvm.h"
 #include "kvm_s390x.h"
 
 int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
@@ -169,7 +170,7 @@ out:
             return;
         }
 
-        if (kvm_s390_get_hpage_1m()) {
+        if (kvm_enabled() && kvm_s390_get_hpage_1m()) {
             error_report("Protected VMs can currently not be backed with "
                          "huge pages");
             env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;
-- 
2.26.2


