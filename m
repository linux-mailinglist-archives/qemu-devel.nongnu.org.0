Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AA13F4C44
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 16:21:19 +0200 (CEST)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIApC-0006yH-Gs
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 10:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAmG-0000Zl-Sz
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:18:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAmE-0001ky-Pj
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:18:16 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NE3hVg121939; Mon, 23 Aug 2021 10:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+WDovjiY/NOTRnrC1TbX+SwWuPgPSM5HkRu5XduuT/k=;
 b=hUHGzyBcvqz+KUmDsiDILwYtx/rvpss2mWVZ1GPIil8rOBVcXlYp6xprdqS1BnQQQEig
 gjzGps4xh2ivXOnEVUMigoNy+5RKwDPqkZa400LBaIDCNqAB/lQ2tOg1DuOHw6aUA8y1
 m/yxVNnO5f5yNNAnks4tC3YRv4YD4o/zYgGWrbCgJ9AjtnQRWxFe6DnKiXXEVEhfGcAE
 JMBGsAYm6OtnSI/Es6mD6JV+5C6B1oowyyYxqCQfw//JOKTmemIVx1YU/gRWemDArbBJ
 qYODP84GCMBmCTtiuZmNhyT2QHzLHXMCycve4rqQAzJQ5MelLxrDz96nHPx7lI7f7+1T uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3akeg0268g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:18:11 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17NE4MqH126096;
 Mon, 23 Aug 2021 10:18:11 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3akeg0267v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:18:11 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17NEDMv9016512;
 Mon, 23 Aug 2021 14:18:09 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 3ajs4c3ntd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 14:17:53 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17NEGkbb30146964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 14:16:46 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1A06112065;
 Mon, 23 Aug 2021 14:16:46 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FE86112067;
 Mon, 23 Aug 2021 14:16:46 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 14:16:46 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 01/12] migration: Add helpers to save confidential RAM
Date: Mon, 23 Aug 2021 10:16:25 -0400
Message-Id: <20210823141636.65975-2-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210823141636.65975-1-dovmurik@linux.ibm.com>
References: <20210823141636.65975-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5_t-pyuLWHlxuI2pUSxT9B1wJ41Y0D-9
X-Proofpoint-GUID: hULpaUsxnuU82D5VsYBd2crAOV3OFARx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_03:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230098
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Steve Rutherford <srutherford@google.com>,
 James Bottomley <jejb@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU cannot read the memory of memory-encrypted guests, which is
required for sending RAM to the migration target.  Instead, QEMU asks a
migration helper running on an auxiliary vcpu in the guest to extract
pages from memory; these pages are encrypted with a transfer key that is
known to the source and target guests, but not to both QEMUs.

The interaction with the guest migration helper is performed using two
shared (unencrypted) pages which both QEMU and guest can read from and
write to.  The details of the mailbox protocol are described in
migration/confidential-ram.c.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 migration/confidential-ram.h |  17 ++++
 migration/confidential-ram.c | 184 +++++++++++++++++++++++++++++++++++
 migration/meson.build        |   2 +-
 migration/trace-events       |   3 +
 4 files changed, 205 insertions(+), 1 deletion(-)
 create mode 100644 migration/confidential-ram.h
 create mode 100644 migration/confidential-ram.c

diff --git a/migration/confidential-ram.h b/migration/confidential-ram.h
new file mode 100644
index 0000000000..0d49718d31
--- /dev/null
+++ b/migration/confidential-ram.h
@@ -0,0 +1,17 @@
+/*
+ * QEMU migration for confidential guest's RAM
+ */
+
+#ifndef QEMU_CONFIDENTIAL_RAM_H
+#define QEMU_CONFIDENTIAL_RAM_H
+
+#include "exec/cpu-common.h"
+#include "qemu-file.h"
+
+void cgs_mh_init(void);
+void cgs_mh_cleanup(void);
+
+int cgs_mh_save_encrypted_page(QEMUFile *f, ram_addr_t src_gpa, uint32_t size,
+                               uint64_t *bytes_sent);
+
+#endif
diff --git a/migration/confidential-ram.c b/migration/confidential-ram.c
new file mode 100644
index 0000000000..65a588e7f6
--- /dev/null
+++ b/migration/confidential-ram.c
@@ -0,0 +1,184 @@
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/rcu.h"
+#include "qemu/coroutine.h"
+#include "qemu/timer.h"
+#include "io/channel.h"
+#include "qapi/error.h"
+#include "exec/memory.h"
+#include "trace.h"
+#include "confidential-ram.h"
+
+enum cgs_mig_helper_cmd {
+    /* Initialize migration helper in guest */
+    CGS_MIG_HELPER_CMD_INIT = 0,
+
+    /*
+     * Fetch a page from gpa, encrypt it, and save result into the shared page
+     */
+    CGS_MIG_HELPER_CMD_ENCRYPT,
+
+    /* Read the shared page, decrypt it, and save result into gpa */
+    CGS_MIG_HELPER_CMD_DECRYPT,
+
+    /* Reset migration helper in guest */
+    CGS_MIG_HELPER_CMD_RESET,
+
+    CGS_MIG_HELPER_CMD_MAX
+};
+
+struct QEMU_PACKED CGSMigHelperCmdParams {
+    uint64_t cmd_type;
+    uint64_t gpa;
+    int32_t prefetch;
+    int32_t ret;
+    int32_t go;
+    int32_t done;
+};
+typedef struct CGSMigHelperCmdParams CGSMigHelperCmdParams;
+
+struct QEMU_PACKED CGSMigHelperPageHeader {
+    uint32_t len;
+    uint8_t data[0];
+};
+typedef struct CGSMigHelperPageHeader CGSMigHelperPageHeader;
+
+struct CGSMigHelperState {
+    CGSMigHelperCmdParams *cmd_params;
+    CGSMigHelperPageHeader *io_page_hdr;
+    uint8_t *io_page;
+    bool initialized;
+};
+typedef struct CGSMigHelperState CGSMigHelperState;
+
+static CGSMigHelperState cmhs = {0};
+
+#define MH_BUSYLOOP_TIMEOUT       100000000LL
+#define MH_REQUEST_TIMEOUT_MS     100
+#define MH_REQUEST_TIMEOUT_NS     (MH_REQUEST_TIMEOUT_MS * 1000 * 1000)
+
+/*
+ * The migration helper shared area is hard-coded at gpa 0x820000 with size of
+ * 2 pages (0x2000 bytes).  Instead of hard-coding, the address and size may be
+ * fetched from OVMF itself using a pc_system_ovmf_table_find call to query
+ * OVMF's GUIDed structure for a migration helper GUID.
+ */
+#define MH_SHARED_CMD_PARAMS_ADDR    0x820000
+#define MH_SHARED_IO_PAGE_HDR_ADDR   (MH_SHARED_CMD_PARAMS_ADDR + 0x800)
+#define MH_SHARED_IO_PAGE_ADDR       (MH_SHARED_CMD_PARAMS_ADDR + 0x1000)
+
+void cgs_mh_init(void)
+{
+    RCU_READ_LOCK_GUARD();
+    cmhs.cmd_params = qemu_map_ram_ptr(NULL, MH_SHARED_CMD_PARAMS_ADDR);
+    cmhs.io_page_hdr = qemu_map_ram_ptr(NULL, MH_SHARED_IO_PAGE_HDR_ADDR);
+    cmhs.io_page = qemu_map_ram_ptr(NULL, MH_SHARED_IO_PAGE_ADDR);
+}
+
+static int send_command_to_cgs_mig_helper(uint64_t cmd_type, uint64_t gpa)
+{
+    /*
+     * The cmd_params struct is on a page shared with the guest migration
+     * helper.  We use a volatile struct to force writes to memory so that the
+     * guest can see them.
+     */
+    volatile CGSMigHelperCmdParams *params = cmhs.cmd_params;
+    int64_t counter, request_timeout_at;
+
+    /*
+     * At this point io_page and io_page_hdr should be already filled according
+     * to the requested cmd_type.
+     */
+
+    params->cmd_type = cmd_type;
+    params->gpa = gpa;
+    params->prefetch = 0;
+    params->ret = -1;
+    params->done = 0;
+
+    /*
+     * Force writes of all command parameters before writing the 'go' flag.
+     * The guest migration handler waits for the go flag and then reads the
+     * command parameters.
+     */
+    smp_wmb();
+
+    /* Tell the migration helper to start working on this command */
+    params->go = 1;
+
+    /*
+     * Wait for the guest migration helper to process the command and mark the
+     * done flag
+     */
+    request_timeout_at = qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
+                         MH_REQUEST_TIMEOUT_NS;
+    do {
+        counter = 0;
+        while (!params->done && (counter < MH_BUSYLOOP_TIMEOUT)) {
+            counter++;
+        }
+    } while (!params->done &&
+             qemu_clock_get_ns(QEMU_CLOCK_REALTIME) < request_timeout_at);
+
+    if (!params->done) {
+        error_report("Migration helper command %" PRIu64 " timed-out for "
+                     "gpa 0x%" PRIx64, cmd_type, gpa);
+        return -EIO;
+    }
+
+    return params->ret;
+}
+
+static void init_cgs_mig_helper_if_needed(void)
+{
+    int ret;
+
+    if (cmhs.initialized) {
+        return;
+    }
+
+    ret = send_command_to_cgs_mig_helper(CGS_MIG_HELPER_CMD_INIT, 0);
+    if (ret == 0) {
+        cmhs.initialized = true;
+    }
+}
+
+void cgs_mh_cleanup(void)
+{
+    send_command_to_cgs_mig_helper(CGS_MIG_HELPER_CMD_RESET, 0);
+}
+
+int cgs_mh_save_encrypted_page(QEMUFile *f, ram_addr_t src_gpa, uint32_t size,
+                               uint64_t *bytes_sent)
+{
+    int ret;
+
+    init_cgs_mig_helper_if_needed();
+
+    /* Ask the migration helper to encrypt the page at src_gpa */
+    trace_encrypted_ram_save_page(size, src_gpa);
+    ret = send_command_to_cgs_mig_helper(CGS_MIG_HELPER_CMD_ENCRYPT, src_gpa);
+    if (ret) {
+        error_report("Error cgs_mh_save_encrypted_page ret=%d", ret);
+        return -1;
+    }
+
+    /* Sanity check for response header */
+    if (cmhs.io_page_hdr->len > 1024) {
+        error_report("confidential-ram: migration helper response is too large "
+                     "(len=%u)", cmhs.io_page_hdr->len);
+        return -EINVAL;
+    }
+
+    qemu_put_be32(f, cmhs.io_page_hdr->len);
+    qemu_put_buffer(f, cmhs.io_page_hdr->data, cmhs.io_page_hdr->len);
+    *bytes_sent = 4 + cmhs.io_page_hdr->len;
+
+    qemu_put_be32(f, size);
+    qemu_put_buffer(f, cmhs.io_page, size);
+    *bytes_sent += 4 + size;
+
+    return ret;
+}
diff --git a/migration/meson.build b/migration/meson.build
index f8714dcb15..774223c1a3 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -32,4 +32,4 @@ softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
 softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
 
 specific_ss.add(when: 'CONFIG_SOFTMMU',
-                if_true: files('dirtyrate.c', 'ram.c', 'target.c'))
+                if_true: files('dirtyrate.c', 'ram.c', 'target.c', 'confidential-ram.c'))
diff --git a/migration/trace-events b/migration/trace-events
index a1c0f034ab..3d442a767f 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -344,3 +344,6 @@ migration_block_save_pending(uint64_t pending) "Enter save live pending  %" PRIu
 # page_cache.c
 migration_pagecache_init(int64_t max_num_items) "Setting cache buckets to %" PRId64
 migration_pagecache_insert(void) "Error allocating page"
+
+# confidential-ram.c
+encrypted_ram_save_page(uint32_t size, uint64_t gpa) "size: %u, gpa: 0x%" PRIx64
-- 
2.20.1


