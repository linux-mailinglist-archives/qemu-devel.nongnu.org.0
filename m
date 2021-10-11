Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1C3428BF9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 13:27:45 +0200 (CEST)
Received: from localhost ([::1]:55152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZtT6-0000H6-UN
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 07:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZtNL-0001Wh-DD
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:21:47 -0400
Received: from mga04.intel.com ([192.55.52.120]:28236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZtNJ-0007q1-JO
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:21:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="225624865"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="225624865"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 04:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="490432195"
Received: from icx-2s.bj.intel.com ([10.240.193.41])
 by orsmga008.jf.intel.com with ESMTP; 11 Oct 2021 04:21:34 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] monitor: numa support for 'info sgx' command
Date: Mon, 11 Oct 2021 19:15:52 +0800
Message-Id: <20211011111554.12403-5-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20211011111554.12403-1-yang.zhong@intel.com>
References: <20211011111554.12403-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yang.zhong@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, eblake@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch can enable numa support for 'info sgx' command
in the monitor, which can show detailed SGX EPC sections
info.

(qemu) info sgx
 SGX support: enabled
 SGX1 support: enabled
 SGX2 support: enabled
 FLC support: enabled
 SECTION #0: size=67108864
 SECTION #1: size=29360128

 The QMP interface show:
 (QEMU) query-sgx
 {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
 [{"index": 0, "size": 67108864}, {"index": 1, "size": 29360128}], "flc": true}}

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/sgx.c         | 25 +++++++++++++++++++++++--
 target/i386/monitor.c | 11 +++++++++--
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 906facb645..8af45925c6 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -126,6 +126,28 @@ SGXInfo *sgx_get_capabilities(Error **errp)
     return info;
 }
 
+static SGXEPCSectionList *sgx_get_epc_sections_list(void)
+{
+    GSList *device_list = sgx_epc_get_device_list();
+    SGXEPCSectionList *head = NULL, **tail = &head;
+    SGXEPCSection *section;
+    uint64_t i = 0;
+
+    for (; device_list; device_list = device_list->next) {
+        DeviceState *dev = device_list->data;
+        Object *obj = OBJECT(dev);
+
+        section = g_new0(SGXEPCSection, 1);
+        section->index = i++;
+        section->size = object_property_get_uint(obj, SGX_EPC_SIZE_PROP,
+                                                 &error_abort);
+        QAPI_LIST_APPEND(tail, section);
+    }
+    g_slist_free(device_list);
+
+    return head;
+}
+
 SGXInfo *sgx_get_info(Error **errp)
 {
     SGXInfo *info = NULL;
@@ -144,14 +166,13 @@ SGXInfo *sgx_get_info(Error **errp)
         return NULL;
     }
 
-    SGXEPCState *sgx_epc = &pcms->sgx_epc;
     info = g_new0(SGXInfo, 1);
 
     info->sgx = true;
     info->sgx1 = true;
     info->sgx2 = true;
     info->flc = true;
-    info->section_size = sgx_epc->size;
+    info->sections = sgx_get_epc_sections_list();
 
     return info;
 }
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 196c1c9e77..08e7d4a425 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -773,6 +773,7 @@ SGXInfo *qmp_query_sgx(Error **errp)
 void hmp_info_sgx(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
+    SGXEPCSectionList *section_list, *section;
     g_autoptr(SGXInfo) info = qmp_query_sgx(&err);
 
     if (err) {
@@ -787,8 +788,14 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
                    info->sgx2 ? "enabled" : "disabled");
     monitor_printf(mon, "FLC support: %s\n",
                    info->flc ? "enabled" : "disabled");
-    monitor_printf(mon, "size: %" PRIu64 "\n",
-                   info->section_size);
+
+    section_list = info->sections;
+    for (section = section_list; section; section = section->next) {
+        monitor_printf(mon, "SECTION #%" PRId64 ": ",
+                       section->value->index);
+        monitor_printf(mon, "size=%" PRIu64 "\n",
+                       section->value->size);
+    }
 }
 
 SGXInfo *qmp_query_sgx_capabilities(Error **errp)

