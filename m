Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27891396680
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:08:47 +0200 (CEST)
Received: from localhost ([::1]:37212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnlPC-0002Zo-5J
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lnlLf-00080A-QW
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:05:07 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:51878
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lnlLd-0005A8-Ip
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:05:07 -0400
HMM_SOURCE_IP: 172.18.0.218:37984.253484957
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.39?logid-4a3d34afc9d14b97a5e6c1a5d502adc7
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id D220D2800B0;
 Tue,  1 Jun 2021 01:04:59 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 4a3d34afc9d14b97a5e6c1a5d502adc7 for
 qemu-devel@nongnu.org; Tue Jun  1 01:04:59 2021
X-Transaction-ID: 4a3d34afc9d14b97a5e6c1a5d502adc7
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 3/6] migration/dirtyrate: add vcpu option for qmp
 calc-dirty-rate
Date: Tue,  1 Jun 2021 01:05:00 +0800
Message-Id: <28111cd734b1b6e76f7cd8f2f6ad1d4c54f12842.1622479162.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1622479161.git.huangy81@chinatelecom.cn>
References: <cover.1622479161.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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

calculate dirtyrate for each vcpu if vcpu is true, add the
dirtyrate of each vcpu to the return value also.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 migration/dirtyrate.c |  5 ++++-
 migration/dirtyrate.h |  1 +
 qapi/migration.json   | 28 ++++++++++++++++++++++++++--
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index ccb98147e8..3c1a824a41 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -383,7 +383,10 @@ void *get_dirtyrate_thread(void *arg)
     return NULL;
 }
 
-void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
+void qmp_calc_dirty_rate(int64_t calc_time,
+                         bool has_vcpu,
+                         bool vcpu,
+                         Error **errp)
 {
     static struct DirtyRateConfig config;
     QemuThread thread;
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index 6ec429534d..f20dd52d77 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -38,6 +38,7 @@
 struct DirtyRateConfig {
     uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
     int64_t sample_period_seconds; /* time duration between two sampling */
+    bool vcpu; /* calculate dirtyrate for each vcpu using dirty ring */
 };
 
 /*
diff --git a/qapi/migration.json b/qapi/migration.json
index 7a5bdf9a0d..896ebcb93b 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1708,6 +1708,21 @@
 { 'event': 'UNPLUG_PRIMARY',
   'data': { 'device-id': 'str' } }
 
+##
+# @DirtyRateVcpu:
+#
+# Dirty rate of vcpu.
+#
+# @id: vcpu index.
+#
+# @dirty-rate: dirty rate.
+#
+# Since: 6.1
+#
+##
+{ 'struct': 'DirtyRateVcpu',
+  'data': { 'id': 'int', 'dirty-rate': 'int64' } }
+
 ##
 # @DirtyRateStatus:
 #
@@ -1740,6 +1755,10 @@
 #
 # @calc-time: time in units of second for sample dirty pages
 #
+# @vcpu: calculate dirtyrate for each vcpu (Since 6.1)
+#
+# @vcpu-dirty-rate: dirtyrate for each vcpu (Since 6.1)
+#
 # Since: 5.2
 #
 ##
@@ -1747,7 +1766,9 @@
   'data': {'*dirty-rate': 'int64',
            'status': 'DirtyRateStatus',
            'start-time': 'int64',
-           'calc-time': 'int64'} }
+           'calc-time': 'int64',
+           '*vcpu': 'bool',
+           '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ] } }
 
 ##
 # @calc-dirty-rate:
@@ -1756,13 +1777,16 @@
 #
 # @calc-time: time in units of second for sample dirty pages
 #
+# @vcpu: calculate vcpu dirty rate if true, the default value is
+#        false (since 6.1)
+#
 # Since: 5.2
 #
 # Example:
 #   {"command": "calc-dirty-rate", "data": {"calc-time": 1} }
 #
 ##
-{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64'} }
+{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64', '*vcpu': 'bool'} }
 
 ##
 # @query-dirty-rate:
-- 
2.24.3


