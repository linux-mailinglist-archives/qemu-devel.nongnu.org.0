Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E84295810
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 07:42:45 +0200 (CEST)
Received: from localhost ([::1]:50478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVTN6-000064-Sz
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 01:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1kVTK6-0007sN-Gn
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 01:39:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1kVTK4-0005Hh-5H
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 01:39:38 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09M5WjMb169579; Thu, 22 Oct 2020 01:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=NFQ6mX7Oec8dg2n+UpU/2Mau8IPlxzSKbxdmSYHYZLM=;
 b=OBGzxjaoQypc7eTCl6CNX479NEvS5NIpfK8RWrySDHdDT7QD/qC4brQrgAyJdEi15S1y
 4Q6/8IRC0CrhaU8ENm1bEIWN+g32O2LBseKkl2A+QYozSl2Qp+E365zVmRVvxqnA29xP
 6StloEfUSbsCai7MHA+5R3B6gzEXKZxkekbCKM9THO6dM49hKBsh22pVRvgEUF/Snkis
 YgADmzhmybxpK0vq83EQvGTwo/eZ0GonFpqlS3BdQMuR+hJX23t+x9TbDFsqNTL9pUp0
 FxjYdGdAZaxNz0p8J4lB9owEL9qiWfn4dq83VX6OFvDffUHPdHurNfPmvIRlJtNXSDwu tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34b07dncj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 01:39:32 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09M5WqVH170268;
 Thu, 22 Oct 2020 01:39:32 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34b07dnchu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 01:39:32 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09M5bH1R028134;
 Thu, 22 Oct 2020 05:39:30 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 347r89dmj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 05:39:30 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09M5dTQ549152306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Oct 2020 05:39:29 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B77B46A04F;
 Thu, 22 Oct 2020 05:39:29 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECB2E6A057;
 Thu, 22 Oct 2020 05:39:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.185.236])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 22 Oct 2020 05:39:28 +0000 (GMT)
From: tobin@linux.ibm.com
To: qemu-devel@nongnu.org
Subject: [PATCH v7] sev: add sev-inject-launch-secret
Date: Thu, 22 Oct 2020 01:39:09 -0400
Message-Id: <20201022053909.34123-1-tobin@linux.ibm.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-22_01:2020-10-20,
 2020-10-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=1
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220033
Received-SPF: pass client-ip=148.163.156.1; envelope-from=tobin@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 01:39:35
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 jejb@linux.ibm.com, tobin@ibm.com, dgilbert@redhat.com,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, berrange@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>

AMD SEV allows a guest owner to inject a secret blob
into the memory of a virtual machine. The secret is
encrypted with the SEV Transport Encryption Key and
integrity is guaranteed with the Transport Integrity
Key. Although QEMU facilitates the injection of the
launch secret, it cannot access the secret.

Signed-off-by: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Brijesh Singh <brijesh.singh@amd.com>
---
 include/monitor/monitor.h |  3 ++
 include/sysemu/sev.h      |  2 ++
 monitor/misc.c            | 15 ++++++---
 qapi/misc-target.json     | 18 +++++++++++
 target/i386/monitor.c     |  7 +++++
 target/i386/sev-stub.c    |  5 +++
 target/i386/sev.c         | 65 +++++++++++++++++++++++++++++++++++++++
 target/i386/trace-events  |  1 +
 8 files changed, 112 insertions(+), 4 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 348bfad3d5..af3887bb71 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -4,6 +4,7 @@
 #include "block/block.h"
 #include "qapi/qapi-types-misc.h"
 #include "qemu/readline.h"
+#include "include/exec/hwaddr.h"
 
 typedef struct MonitorHMP MonitorHMP;
 typedef struct MonitorOptions MonitorOptions;
@@ -37,6 +38,8 @@ void monitor_flush(Monitor *mon);
 int monitor_set_cpu(Monitor *mon, int cpu_index);
 int monitor_get_cpu_index(Monitor *mon);
 
+void *gpa2hva(MemoryRegion **p_mr, hwaddr addr, uint64_t size, Error **errp);
+
 void monitor_read_command(MonitorHMP *mon, int show_prompt);
 int monitor_read_password(MonitorHMP *mon, ReadLineFunc *readline_func,
                           void *opaque);
diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index 98c1ec8d38..7ab6e3e31d 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -18,4 +18,6 @@
 
 void *sev_guest_init(const char *id);
 int sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len);
+int sev_inject_launch_secret(const char *hdr, const char *secret,
+                             uint64_t gpa, Error **errp);
 #endif
diff --git a/monitor/misc.c b/monitor/misc.c
index 4a859fb24a..b6b2c1c60f 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -667,10 +667,10 @@ static void hmp_physical_memory_dump(Monitor *mon, const QDict *qdict)
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
@@ -683,6 +683,13 @@ static void *gpa2hva(MemoryRegion **p_mr, hwaddr addr, Error **errp)
         return NULL;
     }
 
+    if (mrs.size < size) {
+        error_setg(errp, "Size of memory region at 0x%" HWADDR_PRIx
+                   " exceeded.", addr);
+        memory_region_unref(mrs.mr);
+        return NULL;
+    }
+
     *p_mr = mrs.mr;
     return qemu_map_ram_ptr(mrs.mr->ram_block, mrs.offset_within_region);
 }
@@ -694,7 +701,7 @@ static void hmp_gpa2hva(Monitor *mon, const QDict *qdict)
     MemoryRegion *mr = NULL;
     void *ptr;
 
-    ptr = gpa2hva(&mr, addr, &local_err);
+    ptr = gpa2hva(&mr, addr, 1, &local_err);
     if (local_err) {
         error_report_err(local_err);
         return;
@@ -770,7 +777,7 @@ static void hmp_gpa2hpa(Monitor *mon, const QDict *qdict)
     void *ptr;
     uint64_t physaddr;
 
-    ptr = gpa2hva(&mr, addr, &local_err);
+    ptr = gpa2hva(&mr, addr, 1, &local_err);
     if (local_err) {
         error_report_err(local_err);
         return;
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 1e561fa97b..4486a543ae 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -201,6 +201,24 @@
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
+# Since: 5.2
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
index 7abae3c8df..f9d4951465 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -728,3 +728,10 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
 {
     return sev_get_capabilities(errp);
 }
+
+void qmp_sev_inject_launch_secret(const char *packet_hdr,
+                                  const char *secret, uint64_t gpa,
+                                  Error **errp)
+{
+    sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
+}
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 88e3f39a1e..c1fecc2101 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -49,3 +49,8 @@ SevCapability *sev_get_capabilities(Error **errp)
     error_setg(errp, "SEV is not available in this QEMU");
     return NULL;
 }
+int sev_inject_launch_secret(const char *hdr, const char *secret,
+                             uint64_t gpa, Error **errp)
+{
+    return 1;
+}
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 93c4d60b82..1546606811 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -29,6 +29,8 @@
 #include "trace.h"
 #include "migration/blocker.h"
 #include "qom/object.h"
+#include "exec/address-spaces.h"
+#include "monitor/monitor.h"
 
 #define TYPE_SEV_GUEST "sev-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
@@ -785,6 +787,69 @@ sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len)
     return 0;
 }
 
+int sev_inject_launch_secret(const char *packet_hdr, const char *secret,
+                             uint64_t gpa, Error **errp)
+{
+    struct kvm_sev_launch_secret input;
+    g_autofree guchar *data = NULL, *hdr = NULL;
+    int error, ret = 1;
+    void *hva;
+    gsize hdr_sz = 0, data_sz = 0;
+    MemoryRegion *mr = NULL;
+
+    if (!sev_guest) {
+        error_setg(errp, "SEV: SEV not enabled.");
+        return 1;
+    }
+
+    /* secret can be injected only in this state */
+    if (!sev_check_state(sev_guest, SEV_STATE_LAUNCH_SECRET)) {
+        error_setg(errp, "SEV: Not in correct state. (LSECRET) %x",
+                     sev_guest->state);
+        return 1;
+    }
+
+    hdr = g_base64_decode(packet_hdr, &hdr_sz);
+    if (!hdr || !hdr_sz) {
+        error_setg(errp, "SEV: Failed to decode sequence header");
+        return 1;
+    }
+
+    data = g_base64_decode(secret, &data_sz);
+    if (!data || !data_sz) {
+        error_setg(errp, "SEV: Failed to decode data");
+        return 1;
+    }
+
+    hva = gpa2hva(&mr, gpa, data_sz, errp);
+    if (!hva) {
+        error_prepend(errp, "SEV: Failed to calculate guest address: ");
+        return 1;
+    }
+
+    input.hdr_uaddr = (uint64_t)(unsigned long)hdr;
+    input.hdr_len = hdr_sz;
+
+    input.trans_uaddr = (uint64_t)(unsigned long)data;
+    input.trans_len = data_sz;
+
+    input.guest_uaddr = (uint64_t)(unsigned long)hva;
+    input.guest_len = data_sz;
+
+    trace_kvm_sev_launch_secret(gpa, input.guest_uaddr,
+                                input.trans_uaddr, input.trans_len);
+
+    ret = sev_ioctl(sev_guest->sev_fd, KVM_SEV_LAUNCH_SECRET,
+                    &input, &error);
+    if (ret) {
+        error_setg(errp, "SEV: failed to inject secret ret=%d fw_error=%d '%s'",
+                     ret, error, fw_error_to_str(error));
+        return ret;
+    }
+
+    return 0;
+}
+
 static void
 sev_register_types(void)
 {
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


