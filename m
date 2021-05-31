Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4714B39669A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:11:38 +0200 (CEST)
Received: from localhost ([::1]:42352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnlRx-00065D-9a
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lnlMc-0000gI-4R
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:06:06 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:33244
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lnlMX-0005aC-Mk
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:06:05 -0400
HMM_SOURCE_IP: 172.18.0.218:53114.1639123736
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.38?logid-ed481103dcf04c7799310e542c3cbd82
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id ED4F72800FA;
 Tue,  1 Jun 2021 01:05:57 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id ed481103dcf04c7799310e542c3cbd82 for
 qemu-devel@nongnu.org; Tue Jun  1 01:05:58 2021
X-Transaction-ID: ed481103dcf04c7799310e542c3cbd82
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 5/6] migration/dirtyrate: check support of calculation for
 vcpu
Date: Tue,  1 Jun 2021 01:05:58 +0800
Message-Id: <8c48e41e38c31827f305806704e6e23faef848c3.1622479162.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1622479161.git.huangy81@chinatelecom.cn>
References: <cover.1622479161.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

vcpu method only works when kvm dirty ring is enabled, use
kvm_dirty_ring_enabled to probe if dirty ring is enabled.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 migration/dirtyrate.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 7952eb6117..da6500c8ec 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -16,6 +16,7 @@
 #include "cpu.h"
 #include "exec/ramblock.h"
 #include "qemu/rcu_queue.h"
+#include "sysemu/kvm.h"
 #include "qapi/qapi-commands-migration.h"
 #include "ram.h"
 #include "trace.h"
@@ -415,6 +416,14 @@ void qmp_calc_dirty_rate(int64_t calc_time,
         return;
     }
 
+    /*
+     * Vcpu method only works when kvm dirty ring is enabled.
+     */
+    if (has_vcpu && vcpu && !kvm_dirty_ring_enabled()) {
+        error_setg(errp, "kvm dirty ring is disabled, use sample method.");
+        return;
+    }
+
     /*
      * Init calculation state as unstarted.
      */
@@ -427,6 +436,7 @@ void qmp_calc_dirty_rate(int64_t calc_time,
 
     config.sample_period_seconds = calc_time;
     config.sample_pages_per_gigabytes = DIRTYRATE_DEFAULT_SAMPLE_PAGES;
+    config.vcpu = has_vcpu ? vcpu : false;
     qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
                        (void *)&config, QEMU_THREAD_DETACHED);
 }
-- 
2.24.3


