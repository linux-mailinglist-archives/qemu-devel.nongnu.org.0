Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385E7212D44
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 21:44:06 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr57s-0007G0-PF
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 15:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.vnet.ibm.com>)
 id 1jr56x-0006pw-Nl
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 15:43:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.vnet.ibm.com>)
 id 1jr56v-0001vC-G7
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 15:43:07 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062JX6VW121287; Thu, 2 Jul 2020 15:43:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320s40k1yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 15:43:02 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 062JXsJH123200;
 Thu, 2 Jul 2020 15:43:01 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320s40k1yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 15:43:01 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 062JenvK002132;
 Thu, 2 Jul 2020 19:43:00 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 321kkyh4qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 19:43:00 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 062Jgxvf24117736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jul 2020 19:42:59 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D096C605F;
 Thu,  2 Jul 2020 19:42:59 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B452C6055;
 Thu,  2 Jul 2020 19:42:58 +0000 (GMT)
Received: from Tobins-MBP-2.fios-router.home (unknown [9.85.161.101])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Jul 2020 19:42:57 +0000 (GMT)
From: Tobin Feldman-Fitzthum <tobin@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] SEV: QMP support for Inject-Launch-Secret
Date: Thu,  2 Jul 2020 15:42:13 -0400
Message-Id: <20200702194213.23272-1-tobin@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_09:2020-07-02,
 2020-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 cotscore=-2147483648 impostorscore=0 suspectscore=4 phishscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007020132
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=tobin@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 15:43:03
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Cc: thomas.lendacky@amd.com, jejb@linux.ibm.com, tobin@ibm.com,
 dgilbert@redhat.com, Tobin Feldman-Fitzthum <tobin@linux.vnet.ibm.com>,
 pbonzini@redhat.com, brijesh.singh@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tobin Feldman-Fitzthum <tobin@ibm.com>

AMD SEV allows a guest owner to inject a secret blob
into the memory of a virtual machine. The secret is
encrypted with the SEV Transport Encryption Key and
integrity is guaranteed with the Transport Integrity
Key. Although QEMU faciliates the injection of the
launch secret, it cannot access the secret.

Signed-off-by: Tobin Feldman-Fitzthum <tobin@linux.vnet.ibm.com>
---
 include/monitor/monitor.h |  3 ++
 include/sysemu/sev.h      |  2 ++
 monitor/misc.c            |  8 ++---
 qapi/misc-target.json     | 18 +++++++++++
 target/i386/monitor.c     |  9 ++++++
 target/i386/sev-stub.c    |  5 +++
 target/i386/sev.c         | 66 +++++++++++++++++++++++++++++++++++++++
 target/i386/sev_i386.h    |  3 ++
 target/i386/trace-events  |  1 +
 9 files changed, 111 insertions(+), 4 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 1018d754a6..bf049c5b00 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -4,6 +4,7 @@
 #include "block/block.h"
 #include "qapi/qapi-types-misc.h"
 #include "qemu/readline.h"
+#include "include/exec/hwaddr.h"
 
 extern __thread Monitor *cur_mon;
 typedef struct MonitorHMP MonitorHMP;
@@ -36,6 +37,8 @@ void monitor_flush(Monitor *mon);
 int monitor_set_cpu(int cpu_index);
 int monitor_get_cpu_index(void);
 
+void *gpa2hva(MemoryRegion **p_mr, hwaddr addr, uint64_t size, Error **errp);
+
 void monitor_read_command(MonitorHMP *mon, int show_prompt);
 int monitor_read_password(MonitorHMP *mon, ReadLineFunc *readline_func,
                           void *opaque);
diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index 98c1ec8d38..b279b293e8 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -18,4 +18,6 @@
 
 void *sev_guest_init(const char *id);
 int sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len);
+int sev_inject_launch_secret(const char *hdr, const char *secret,
+                             uint64_t gpa);
 #endif
diff --git a/monitor/misc.c b/monitor/misc.c
index 89bb970b00..b9ec8ba410 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -674,10 +674,10 @@ static void hmp_physical_memory_dump(Monitor *mon, const QDict *qdict)
     memory_dump(mon, count, format, size, addr, 1);
 }
 
-static void *gpa2hva(MemoryRegion **p_mr, hwaddr addr, Error **errp)
+void *gpa2hva(MemoryRegion **p_mr, hwaddr addr, uint64_t size, Error **errp)
 {
     MemoryRegionSection mrs = memory_region_find(get_system_memory(),
-                                                 addr, 1);
+                                                 addr, size);
 
     if (!mrs.mr) {
         error_setg(errp, "No memory is mapped at address 0x%" HWADDR_PRIx, addr);
@@ -701,7 +701,7 @@ static void hmp_gpa2hva(Monitor *mon, const QDict *qdict)
     MemoryRegion *mr = NULL;
     void *ptr;
 
-    ptr = gpa2hva(&mr, addr, &local_err);
+    ptr = gpa2hva(&mr, addr, 1, &local_err);
     if (local_err) {
         error_report_err(local_err);
         return;
@@ -777,7 +777,7 @@ static void hmp_gpa2hpa(Monitor *mon, const QDict *qdict)
     void *ptr;
     uint64_t physaddr;
 
-    ptr = gpa2hva(&mr, addr, &local_err);
+    ptr = gpa2hva(&mr, addr, 1, &local_err);
     if (local_err) {
         error_report_err(local_err);
         return;
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index dee3b45930..d145f916b3 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -200,6 +200,24 @@
 { 'command': 'query-sev-capabilities', 'returns': 'SevCapability',
   'if': 'defined(TARGET_I386)' }
 
+##
+# @sev-inject-launch-secret:
+#
+# This command injects a secret blob into memory of SEV guest.
+#
+# @packet-header: the launch secret packet header encoded in base64
+#
+# @secret: the launch secret data to be injected encoded in base64
+#
+# @gpa: the guest physical address where secret will be injected.
+#
+# Since: 5.1
+#
+##
+{ 'command': 'sev-inject-launch-secret',
+  'data': { 'packet-header': 'str', 'secret': 'str', 'gpa': 'uint64' },
+  'if': 'defined(TARGET_I386)' }
+
 ##
 # @dump-skeys:
 #
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 27ebfa3ad2..42bcfe6dc0 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -736,3 +736,12 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
 
     return data;
 }
+
+void qmp_sev_inject_launch_secret(const char *packet_hdr,
+                                  const char *secret, uint64_t gpa,
+                                  Error **errp)
+{
+    if (sev_inject_launch_secret(packet_hdr, secret, gpa) != 0) {
+        error_setg(errp, "SEV inject secret failed");
+    }
+}
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index e5ee13309c..fed4588185 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -48,3 +48,8 @@ SevCapability *sev_get_capabilities(void)
 {
     return NULL;
 }
+int sev_inject_launch_secret(const char *hdr, const char *secret,
+                             uint64_t gpa)
+{
+    return 1;
+}
diff --git a/target/i386/sev.c b/target/i386/sev.c
index d273174ad3..3b2b3c8d8b 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -28,6 +28,8 @@
 #include "sysemu/runstate.h"
 #include "trace.h"
 #include "migration/blocker.h"
+#include "exec/address-spaces.h"
+#include "monitor/monitor.h"
 
 #define TYPE_SEV_GUEST "sev-guest"
 #define SEV_GUEST(obj)                                          \
@@ -769,6 +771,70 @@ sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len)
     return 0;
 }
 
+int sev_inject_launch_secret(const char *packet_hdr,
+                             const char *secret, uint64_t gpa)
+{
+    struct kvm_sev_launch_secret input;
+    guchar *data = NULL, *hdr = NULL;
+    int error, ret = 1;
+    void *hva;
+    gsize hdr_sz = 0, data_sz = 0;
+    Error *local_err = NULL;
+    MemoryRegion *mr = NULL;
+
+    /* secret can be inject only in this state */
+    if (!sev_check_state(sev_guest, SEV_STATE_LAUNCH_SECRET)) {
+        error_report("SEV: Not in correct state. (LSECRET) %x",
+                     sev_guest->state);
+        return 1;
+    }
+
+    hdr = g_base64_decode(packet_hdr, &hdr_sz);
+    if (!hdr || hdr_sz != SEV_SECRET_HEADER_LEN) {
+        error_report("SEV: Failed to decode sequence header");
+        return 1;
+    }
+
+    data = g_base64_decode(secret, &data_sz);
+    if (!data || data_sz <= 0 || data_sz > SEV_SECRET_MAX_LEN) {
+        error_report("SEV: Failed to decode data");
+        goto err;
+    }
+
+    hva = gpa2hva(&mr, gpa, data_sz, &local_err);
+    if (!hva) {
+        error_report("SEV: Failed to calculate guest address.");
+        goto err;
+    }
+
+    input.hdr_uaddr = (uint64_t)hdr;
+    input.hdr_len = hdr_sz;
+
+    input.trans_uaddr = (uint64_t)data;
+    input.trans_len = data_sz;
+
+    input.guest_uaddr = (uint64_t)hva;
+    input.guest_len = data_sz;
+
+    trace_kvm_sev_launch_secret(gpa, input.guest_uaddr,
+                                input.trans_uaddr, input.trans_len);
+
+    ret = sev_ioctl(sev_guest->sev_fd, KVM_SEV_LAUNCH_SECRET,
+                    &input, &error);
+    if (ret) {
+        error_report("SEV: failed to inject secret ret=%d fw_error=%d '%s'",
+                     ret, error, fw_error_to_str(error));
+        goto err;
+    }
+
+    ret = 0;
+
+err:
+    g_free(data);
+    g_free(hdr);
+    return ret;
+}
+
 static void
 sev_register_types(void)
 {
diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 8eb7de1bef..b9ed89d48c 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -28,6 +28,9 @@
 #define SEV_POLICY_DOMAIN       0x10
 #define SEV_POLICY_SEV          0x20
 
+#define SEV_SECRET_HEADER_LEN   0x34
+#define SEV_SECRET_MAX_LEN      0x3E80
+
 extern bool sev_enabled(void);
 extern uint64_t sev_get_me_mask(void);
 extern SevInfo *sev_get_info(void);
diff --git a/target/i386/trace-events b/target/i386/trace-events
index 789c700d4a..9f299e94a2 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -15,3 +15,4 @@ kvm_sev_launch_start(int policy, void *session, void *pdh) "policy 0x%x session
 kvm_sev_launch_update_data(void *addr, uint64_t len) "addr %p len 0x%" PRIu64
 kvm_sev_launch_measurement(const char *value) "data %s"
 kvm_sev_launch_finish(void) ""
+kvm_sev_launch_secret(uint64_t hpa, uint64_t hva, uint64_t secret, int len) "hpa 0x%" PRIx64 " hva 0x%" PRIx64 " data 0x%" PRIx64 " len %d"
-- 
2.20.1 (Apple Git-117)


