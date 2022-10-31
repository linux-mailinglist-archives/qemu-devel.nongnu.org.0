Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859C0613B15
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 17:20:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opXVf-0006cX-D7; Mon, 31 Oct 2022 12:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1opXVU-0006Wj-Rb
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 12:19:24 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1opXVR-0001MK-R7
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 12:19:24 -0400
HMM_SOURCE_IP: 172.18.0.218:50162.1127588867
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.180.88 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 91AA32800E6;
 Tue,  1 Nov 2022 00:19:15 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([182.138.180.88])
 by app0025 with ESMTP id c6c5b9944a28487683bb9b918a3c5b07 for
 qemu-devel@nongnu.org; Tue, 01 Nov 2022 00:19:17 CST
X-Transaction-ID: c6c5b9944a28487683bb9b918a3c5b07
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 182.138.180.88
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH RFC 2/4] hmp: Add "info netdev" cmd
Date: Tue,  1 Nov 2022 00:19:00 +0800
Message-Id: <4e96b2beac69aa865777eb95330b9852a36353c7.1667232396.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1667232396.git.huangy81@chinatelecom.cn>
References: <cover.1667232396.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1667232396.git.huangy81@chinatelecom.cn>
References: <cover.1667232396.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Introduce "info netdev" command so developers can play with
it easier.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 hmp-commands-info.hx  | 14 ++++++++++++++
 include/monitor/hmp.h |  1 +
 net/net.c             | 31 +++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 754b1e8..217843c 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -880,6 +880,20 @@ SRST
     Display the vcpu dirty page limit information.
 ERST
 
+    {
+        .name       = "netdev",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show information about netdev, guest acked features are "
+                      "also printed if supporting virtio-net dataplane offloading",
+        .cmd        = hmp_info_netdev,
+    },
+
+SRST
+  ``info netdev``
+    Display information about netdev.
+ERST
+
 #if defined(TARGET_I386)
     {
         .name       = "sgx",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index a9cf064..0bd496a 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -142,5 +142,6 @@ void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
 void hmp_info_stats(Monitor *mon, const QDict *qdict);
+void hmp_info_netdev(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/net/net.c b/net/net.c
index 5d11674..c27ebfa 100644
--- a/net/net.c
+++ b/net/net.c
@@ -55,6 +55,7 @@
 #include "net/filter.h"
 #include "net/vhost-user.h"
 #include "qapi/string-output-visitor.h"
+#include "monitor/hmp.h"
 
 /* Net bridge is currently not supported for W32. */
 #if !defined(_WIN32)
@@ -1268,6 +1269,36 @@ NetDevInfoList *qmp_query_netdev(Error **errp)
     return head;
 }
 
+void hmp_info_netdev(Monitor *mon, const QDict *qdict)
+{
+    NetDevInfoList *info, *head, *info_list = NULL;
+    Error *err = NULL;
+
+    info_list = qmp_query_netdev(&err);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    head = info_list;
+    for (info = head; info != NULL; info = info->next) {
+        monitor_printf(mon, "%s: %s device, "
+            "ufo %s, vnet-hdr %s, vnet-hdr-len %s",
+            info->value->name,
+            NetClientDriver_str(info->value->type),
+            info->value->ufo ? "supported" : "unsupported",
+            info->value->vnet_hdr ? "supported" : "unsupported",
+            info->value->vnet_hdr_len ? "supported" : "unsupported");
+        if (info->value->has_acked_features) {
+            monitor_printf(mon, ", acked-features 0x%" PRIx64,
+                                info->value->acked_features);
+        }
+        monitor_printf(mon, "\n");
+    }
+
+    g_free(info_list);
+}
+
 static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
 {
     char *str;
-- 
1.8.3.1


