Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD544A4730
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 13:33:00 +0100 (CET)
Received: from localhost ([::1]:58832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEVre-0002MW-T7
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 07:32:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nEUf2-0004Ja-KN
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:15:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nEUez-0006Pq-SN
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:15:51 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20V8dXAW011753; 
 Mon, 31 Jan 2022 11:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=bLhdwK9dSMfKw7aQCMff7h1JqlEW6tr4DDCR1yBgqsQ=;
 b=HzdLF99LJEgo6Ejr3dObnJzMdDF2uyqzXzczq0TESLr2Sw10gssJBxZpeP0z2Sj88h8I
 7tbn7CUm/kph53V1xfWjDKUY7zVEkC+cWDFTQrED6qrXDCTNviHaGQK97Ln/+RGXwOMS
 qYmNq8PpBcs/ViWOO8kjIPsROpskWYjKYteiKQOs9pOQMEp/wdcRU/zccy2WUTPQRS53
 VeUJEMllLsBMwp1wKhy8a0ZSIIJ3QYeFMWr18udOjrI7hvZkWenKlfrCQe6N94y6zYEA
 9I0Y2p8cZ9ZFGwk27Oo8DYDS1ywZmFlGLCK7Cz8/djKGaZz/DgqLnQYHtwQUaQd9n/Qv iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx98u6dxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:15:45 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20VAtbdI005453;
 Mon, 31 Jan 2022 11:15:44 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx98u6dww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:15:44 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VBEECj028601;
 Mon, 31 Jan 2022 11:15:43 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 3dvw79s620-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:15:43 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VBFgPl9372220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 11:15:42 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5CC9AE05C;
 Mon, 31 Jan 2022 11:15:42 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 942A2AE063;
 Mon, 31 Jan 2022 11:15:42 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 31 Jan 2022 11:15:42 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi,
 i386/sev: Add debug-launch-digest to launch-measure response
Date: Mon, 31 Jan 2022 11:15:39 +0000
Message-Id: <20220131111539.3091765-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nVhzh5pdMa6X_9SI3Od4J8QxbDJVh2TB
X-Proofpoint-GUID: vSYVKtgY4MPNnNONhSjJJ_NIHlz1LI4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201310074
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the responses of QMP commands query-sev-launch-measure and
query-sev-attestation-report return just the signed measurement. In
order to validate it, the Guest Owner must know the exact guest launch
digest, besides other host and guest properties which are included in
the measurement.

The other host and guest details (SEV API major, SEV API minor, SEV
build, and guest policy) are all available via query-sev QMP command.
However, the launch digest is not available.  This makes checking the
measurement harder for the Guest Owner, as it has to iterate through all
allowed launch digests and compute the expected measurement.

Add a new field debug-launch-digest to the response of
query-sev-launch-measure and query-sev-attestation-report which includes
the guest launch digest, which is the SHA256 of all initial memory added
to the guest via sev_launch_update_data().

Note that the value of debug-launch-digest should not be used for
verifying the measurement, because it is not signed.  Hence the choice
of the 'debug-' prefix for the field's name.

Suggested-by: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>

---

Implementation note: I keep a buffer (sev->launch_memory) with the
content of all the memory added using sev_launch_update_data().  The
buffer is freed when the measurement is calculated (at which point no
more memory can be added by sev_launch_update_data()).  Ideally
it would be enough to keep just a SHA256 context struct, but I found no
such abstraction in crypto/hash.h -- only functions for calculating
finalized hashes of given buffers.
---
 qapi/misc-target.json    | 18 ++++++++++++++----
 target/i386/sev.c        | 40 ++++++++++++++++++++++++++++++++++++++--
 target/i386/trace-events |  2 +-
 3 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 4bc45d2474..43e659a7d2 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -142,10 +142,15 @@
 #
 # @data: the measurement value encoded in base64
 #
+# @debug-launch-digest: SHA256 of launch memory (base64 encoded) (since: 6.3)
+#
 # Since: 2.12
 #
 ##
-{ 'struct': 'SevLaunchMeasureInfo', 'data': {'data': 'str'},
+{ 'struct': 'SevLaunchMeasureInfo',
+  'data': { 'data': 'str',
+            'debug-launch-digest': 'str'
+          },
   'if': 'TARGET_I386' }
 
 ##
@@ -160,7 +165,8 @@
 # Example:
 #
 # -> { "execute": "query-sev-launch-measure" }
-# <- { "return": { "data": "4l8LXeNlSPUDlXPJG5966/8%YZ" } }
+# <- { "return": { "data": "4l8LXeNlSPUDlXPJG5966/8%YZ",
+#                  "debug-launch-digest": "abcdef1234567890" } }
 #
 ##
 { 'command': 'query-sev-launch-measure', 'returns': 'SevLaunchMeasureInfo',
@@ -237,11 +243,14 @@
 #
 # @data:  guest attestation report (base64 encoded)
 #
+# @debug-launch-digest: SHA256 of launch memory (base64 encoded) (since: 6.3)
 #
 # Since: 6.1
 ##
 { 'struct': 'SevAttestationReport',
-  'data': { 'data': 'str'},
+  'data': { 'data': 'str',
+            'debug-launch-digest': 'str'
+          },
   'if': 'TARGET_I386' }
 
 ##
@@ -261,7 +270,8 @@
 #
 # -> { "execute" : "query-sev-attestation-report",
 #                  "arguments": { "mnonce": "aaaaaaa" } }
-# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
+# <- { "return" : { "data": "aaaaaaaabbbddddd",
+#                   "debug-launch-digest": "abcdef1234567890" } }
 #
 ##
 { 'command': 'query-sev-attestation-report',
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 025ff7a6f8..1c8d8a9966 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -21,6 +21,7 @@
 #include "qapi/error.h"
 #include "qom/object_interfaces.h"
 #include "qemu/base64.h"
+#include "qemu/buffer.h"
 #include "qemu/module.h"
 #include "qemu/uuid.h"
 #include "crypto/hash.h"
@@ -73,6 +74,8 @@ struct SevGuestState {
     int sev_fd;
     SevState state;
     gchar *measurement;
+    gchar *debug_launch_digest;
+    Buffer launch_memory;
 
     uint32_t reset_cs;
     uint32_t reset_ip;
@@ -643,6 +646,7 @@ static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
 
     report = g_new0(SevAttestationReport, 1);
     report->data = g_base64_encode(data, input.len);
+    report->debug_launch_digest = g_strdup(sev->debug_launch_digest);
 
     trace_kvm_sev_attestation_report(mnonce, report->data);
 
@@ -709,6 +713,7 @@ sev_launch_start(SevGuestState *sev)
 
     sev_set_guest_state(sev, SEV_STATE_LAUNCH_UPDATE);
     sev->handle = start.handle;
+    buffer_init(&sev->launch_memory, "sev-guest-launch-memory");
     ret = 0;
 
 out:
@@ -727,6 +732,9 @@ sev_launch_update_data(SevGuestState *sev, uint8_t *addr, uint64_t len)
         return 1;
     }
 
+    buffer_reserve(&sev->launch_memory, len);
+    buffer_append(&sev->launch_memory, addr, len);
+
     update.uaddr = (__u64)(unsigned long)addr;
     update.len = len;
     trace_kvm_sev_launch_update_data(addr, len);
@@ -799,7 +807,17 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
 
     /* encode the measurement value and emit the event */
     sev->measurement = g_base64_encode(data, measurement.len);
-    trace_kvm_sev_launch_measurement(sev->measurement);
+    if (qcrypto_hash_base64(QCRYPTO_HASH_ALG_SHA256,
+                            (const char *)sev->launch_memory.buffer,
+                            sev->launch_memory.offset,
+                            &sev->debug_launch_digest,
+                            NULL) < 0) {
+        error_report("%s: failed hashing launch memory", __func__);
+        return;
+    }
+    buffer_free(&sev->launch_memory);
+
+    trace_kvm_sev_launch_measurement(sev->measurement, sev->debug_launch_digest);
 }
 
 static char *sev_get_launch_measurement(void)
@@ -812,9 +830,19 @@ static char *sev_get_launch_measurement(void)
     return NULL;
 }
 
+static char *sev_get_debug_launch_digest(void)
+{
+    if (sev_guest &&
+        sev_guest->state >= SEV_STATE_LAUNCH_SECRET) {
+        return g_strdup(sev_guest->debug_launch_digest);
+    }
+
+    return NULL;
+}
+
 SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
 {
-    char *data;
+    char *data, *debug_launch_digest;
     SevLaunchMeasureInfo *info;
 
     data = sev_get_launch_measurement();
@@ -823,8 +851,16 @@ SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
         return NULL;
     }
 
+    debug_launch_digest = sev_get_debug_launch_digest();
+    if (!debug_launch_digest) {
+        error_setg(errp, "SEV launch digest is not available");
+        return NULL;
+    }
+
+
     info = g_malloc0(sizeof(*info));
     info->data = data;
+    info->debug_launch_digest = debug_launch_digest;
 
     return info;
 }
diff --git a/target/i386/trace-events b/target/i386/trace-events
index 2cd8726eeb..6a24bb00f0 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -7,7 +7,7 @@ kvm_memcrypt_unregister_region(void *addr, size_t len) "addr %p len 0x%zx"
 kvm_sev_change_state(const char *old, const char *new) "%s -> %s"
 kvm_sev_launch_start(int policy, void *session, void *pdh) "policy 0x%x session %p pdh %p"
 kvm_sev_launch_update_data(void *addr, uint64_t len) "addr %p len 0x%" PRIx64
-kvm_sev_launch_measurement(const char *value) "data %s"
+kvm_sev_launch_measurement(const char *value, const char *debug_launch_digest) "data %s debug_launch_digest %s"
 kvm_sev_launch_finish(void) ""
 kvm_sev_launch_secret(uint64_t hpa, uint64_t hva, uint64_t secret, int len) "hpa 0x%" PRIx64 " hva 0x%" PRIx64 " data 0x%" PRIx64 " len %d"
 kvm_sev_attestation_report(const char *mnonce, const char *data) "mnonce %s data %s"
-- 
2.25.1


