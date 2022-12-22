Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB44653B47
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 05:27:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8D8u-0007r5-HS; Wed, 21 Dec 2022 23:25:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8n-0007pp-4R
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:09 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8l-00015r-0w
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671683107; x=1703219107;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=2kLIfGZNTdvSDrBZBTH0L0KDp8KIlJqQNOVEwB4c/0k=;
 b=bNzFThql8oXXxqwjZczgjhgzpl7tmTMND3GLfmupUh+kXuEJw6hxSO+M
 ANZ8vk7l5TxitjF+/hTKYYlFeI1e+3/e6ZEXpIArnemh4+/oqBGkDlod4
 0f72Qo1zFzr22vd4l88i5Xn1YqUwjN+4tAJbBH0s0Sj/Oy3nCzvW0W3GY
 WTSJoV3a9smDHNW1z7xH7vskYN2XkF74GWNuNE6VIrxT4v/ZEOu1lFIkP
 3KQaBxZFUH8F+lKHtNgjWbNFlEEXUIBdue8poeyZA1NuRrcxVKV01lukx
 Y/93w3cPnzyoOWPqwHBSyMVSs0IKKLCxDKjohLAKJKa96w6lfqN+YH1Pa Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321957641"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="321957641"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:25:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="601733219"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="601733219"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.20.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:25:01 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 21 Dec 2022 20:24:38 -0800
Subject: [PATCH v2 8/8] hw/cxl/events: Add in inject general media event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221221-ira-cxl-events-2022-11-17-v2-8-2ce2ecc06219@intel.com>
References: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
In-Reply-To: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>
X-Mailer: b4 0.11.0-dev-141d4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1671683093; l=7127;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=2kLIfGZNTdvSDrBZBTH0L0KDp8KIlJqQNOVEwB4c/0k=;
 b=eHwpxyXnDoarV4OWdpzvxjJrSNjkV8WUI3YsTwjOzVtp60DZmq82RhXrn8gn+i9PqLRnqbszA6Dj
 sYxIfbsIDDjRb/glNFUSxWSAeQ4cDBWLDulnxFoZC55hnaKt5u6y
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=
Received-SPF: pass client-ip=134.134.136.65; envelope-from=ira.weiny@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To facilitate testing provide a QMP command to inject a general media
event.  The event can be added to the log specified.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from RFC:
	Add all fields for this event
	irq happens automatically when log transitions from 0 to 1
---
 hw/mem/cxl_type3.c          | 93 +++++++++++++++++++++++++++++++++++++++++++++
 hw/mem/cxl_type3_stubs.c    |  8 ++++
 include/hw/cxl/cxl_events.h | 20 ++++++++++
 qapi/cxl.json               | 25 ++++++++++++
 4 files changed, 146 insertions(+)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index a43949cab120..bedd09e500ba 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -916,6 +916,99 @@ static CXLPoisonList *get_poison_list(CXLType3Dev *ct3d)
     return &ct3d->poison_list;
 }
 
+static void cxl_assign_event_header(struct cxl_event_record_hdr *hdr,
+                                    QemuUUID *uuid, uint8_t flags,
+                                    uint8_t length)
+{
+    hdr->flags[0] = flags;
+    hdr->length = length;
+    memcpy(&hdr->id, uuid, sizeof(hdr->id));
+    hdr->timestamp = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+}
+
+QemuUUID gen_media_uuid = {
+    .data = UUID(0xfbcd0a77, 0xc260, 0x417f,
+                 0x85, 0xa9, 0x08, 0x8b, 0x16, 0x21, 0xeb, 0xa6),
+};
+
+#define CXL_GMER_VALID_CHANNEL                          BIT(0)
+#define CXL_GMER_VALID_RANK                             BIT(1)
+#define CXL_GMER_VALID_DEVICE                           BIT(2)
+#define CXL_GMER_VALID_COMPONENT                        BIT(3)
+
+/*
+ * For channel, rank, and device; any value inside of the fields valid range
+ * will flag that field to be valid.  IE pass -1 to mark the field invalid.
+ *
+ * Component ID is device specific.  Define this as a string.
+ */
+void qmp_cxl_inject_gen_media_event(const char *path, uint8_t log,
+                                    uint8_t flags, uint64_t physaddr,
+                                    uint8_t descriptor, uint8_t type,
+                                    uint8_t transaction_type,
+                                    int16_t channel, int16_t rank,
+                                    int32_t device,
+                                    const char *component_id,
+                                    Error **errp)
+{
+    Object *obj = object_resolve_path(path, NULL);
+    struct cxl_event_gen_media gem;
+    struct cxl_event_record_hdr *hdr = &gem.hdr;
+    CXLDeviceState *cxlds;
+    CXLType3Dev *ct3d;
+    uint16_t valid_flags = 0;
+
+    if (log >= CXL_EVENT_TYPE_MAX) {
+        error_setg(errp, "Invalid log type: %d", log);
+        return;
+    }
+    if (!obj) {
+        error_setg(errp, "Unable to resolve path");
+        return;
+    }
+    if (!object_dynamic_cast(obj, TYPE_CXL_TYPE3)) {
+        error_setg(errp, "Path does not point to a CXL type 3 device");
+    }
+    ct3d = CXL_TYPE3(obj);
+    cxlds = &ct3d->cxl_dstate;
+
+    memset(&gem, 0, sizeof(gem));
+    cxl_assign_event_header(hdr, &gen_media_uuid, flags,
+                            sizeof(struct cxl_event_gen_media));
+
+    gem.phys_addr = physaddr;
+    gem.descriptor = descriptor;
+    gem.type = type;
+    gem.transaction_type = transaction_type;
+
+    if (0 <= channel && channel <= 0xFF) {
+        gem.channel = channel;
+        valid_flags |= CXL_GMER_VALID_CHANNEL;
+    }
+
+    if (0 <= rank && rank <= 0xFF) {
+        gem.rank = rank;
+        valid_flags |= CXL_GMER_VALID_RANK;
+    }
+
+    if (0 <= device && device <= 0xFFFFFF) {
+        st24_le_p(gem.device, device);
+        valid_flags |= CXL_GMER_VALID_DEVICE;
+    }
+
+    if (component_id && strcmp(component_id, "")) {
+        strncpy((char *)gem.component_id, component_id,
+                sizeof(gem.component_id) - 1);
+        valid_flags |= CXL_GMER_VALID_COMPONENT;
+    }
+
+    stw_le_p(gem.validity_flags, valid_flags);
+
+    if (cxl_event_insert(cxlds, log, (struct cxl_event_record_raw *)&gem)) {
+        cxl_event_irq_assert(ct3d);
+    }
+}
+
 void qmp_cxl_inject_poison(const char *path, uint64_t start, uint64_t length,
                            Error **errp)
 {
diff --git a/hw/mem/cxl_type3_stubs.c b/hw/mem/cxl_type3_stubs.c
index f2c9f48f4010..62f04d487031 100644
--- a/hw/mem/cxl_type3_stubs.c
+++ b/hw/mem/cxl_type3_stubs.c
@@ -2,6 +2,14 @@
 #include "qemu/osdep.h"
 #include "qapi/qapi-commands-cxl.h"
 
+void qmp_cxl_inject_gen_media_event(const char *path, uint8_t log,
+                                    uint8_t flags, uint64_t physaddr,
+                                    uint8_t descriptor, uint8_t type,
+                                    uint8_t transaction_type,
+                                    int16_t channel, int16_t rank,
+                                    int32_t device,
+                                    char *component_id,
+                                    Error **errp) {}
 void qmp_cxl_inject_poison(const char *path, uint64_t start, uint64_t length,
                            Error **errp) {}
 void qmp_cxl_inject_uncorrectable_error(const char *path,
diff --git a/include/hw/cxl/cxl_events.h b/include/hw/cxl/cxl_events.h
index 2df40720320a..3175e9d9866d 100644
--- a/include/hw/cxl/cxl_events.h
+++ b/include/hw/cxl/cxl_events.h
@@ -103,4 +103,24 @@ struct cxl_event_interrupt_policy {
 /* DCD is optional but other fields are not */
 #define CXL_EVENT_INT_SETTING_MIN_LEN 4
 
+/*
+ * General Media Event Record
+ * CXL rev 3.0 Section 8.2.9.2.1.1; Table 8-43
+ */
+#define CXL_EVENT_GEN_MED_COMP_ID_SIZE  0x10
+#define CXL_EVENT_GEN_MED_RES_SIZE      0x2e
+struct cxl_event_gen_media {
+    struct cxl_event_record_hdr hdr;
+    uint64_t phys_addr;
+    uint8_t descriptor;
+    uint8_t type;
+    uint8_t transaction_type;
+    uint8_t validity_flags[2];
+    uint8_t channel;
+    uint8_t rank;
+    uint8_t device[3];
+    uint8_t component_id[CXL_EVENT_GEN_MED_COMP_ID_SIZE];
+    uint8_t reserved[CXL_EVENT_GEN_MED_RES_SIZE];
+} QEMU_PACKED;
+
 #endif /* CXL_EVENTS_H */
diff --git a/qapi/cxl.json b/qapi/cxl.json
index b4836bb87f53..56e85a28d7e0 100644
--- a/qapi/cxl.json
+++ b/qapi/cxl.json
@@ -5,6 +5,31 @@
 # = CXL devices
 ##
 
+##
+# @cxl-inject-gen-media-event:
+#
+# @path: CXL type 3 device canonical QOM path
+#
+# @log: Event Log to add the event to
+# @flags: header flags
+# @physaddr: Physical Address
+# @descriptor: Descriptor
+# @type: Type
+# @transactiontype: Transaction Type
+# @channel: Channel
+# @rank: Rank
+# @device: Device
+# @componentid: Device specific string
+#
+##
+{ 'command': 'cxl-inject-gen-media-event',
+  'data': { 'path': 'str', 'log': 'uint8', 'flags': 'uint8',
+            'physaddr': 'uint64', 'descriptor': 'uint8',
+            'type': 'uint8', 'transactiontype': 'uint8',
+            'channel': 'int16', 'rank': 'int16',
+            'device': 'int32', 'componentid': 'str'
+            }}
+
 ##
 # @cxl-inject-poison:
 #

-- 
2.38.1

