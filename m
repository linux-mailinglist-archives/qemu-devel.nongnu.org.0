Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BDF2E235E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 02:17:25 +0100 (CET)
Received: from localhost ([::1]:34358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksFFs-0002mn-8x
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 20:17:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ksFCE-0001V6-Uk
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 20:13:39 -0500
Received: from mga06.intel.com ([134.134.136.31]:46595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ksFCD-0004bX-C8
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 20:13:38 -0500
IronPort-SDR: w56iw+EwSXsDCZCQAX6KJFzhcxV0JvYDdeliuw5B54cPx7HIUaRxOTfZ1XNBSImqNFmEkNI6aP
 PC0N8soDVdJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9844"; a="237652001"
X-IronPort-AV: E=Sophos;i="5.78,443,1599548400"; d="scan'208";a="237652001"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 17:13:18 -0800
IronPort-SDR: fs3DsK8KtByJhO4tgB6lihn1b82LUlhHxBy7ufkd5rSKM2pEiGWrm0VSCKzf1JZXv61L3OCQn9
 Zjx04dixQGwA==
X-IronPort-AV: E=Sophos;i="5.78,443,1599548400"; d="scan'208";a="565580016"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 17:13:16 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
Date: Thu, 24 Dec 2020 09:09:16 +0800
Message-Id: <20201224010918.19275-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201224010918.19275-1-chen.zhang@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=2.999,
 FROM_WSP_TRAIL=2.3, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Since the real user scenario does not need to monitor all traffic.
Add colo-passthrough-add and colo-passthrough-del to maintain
a COLO network passthrough list.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/net.c     | 12 ++++++++++++
 qapi/net.json | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/net/net.c b/net/net.c
index e1035f21d1..eac7a92618 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1151,6 +1151,18 @@ void qmp_netdev_del(const char *id, Error **errp)
     qemu_del_net_client(nc);
 }
 
+void qmp_colo_passthrough_add(const char *prot, const uint32_t port,
+                              Error **errp)
+{
+    /* Setup passthrough connection */
+}
+
+void qmp_colo_passthrough_del(const char *prot, const uint32_t port,
+                              Error **errp)
+{
+    /* Delete passthrough connection */
+}
+
 static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
 {
     char *str;
diff --git a/qapi/net.json b/qapi/net.json
index c31748c87f..466c29714e 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -714,3 +714,49 @@
 ##
 { 'event': 'FAILOVER_NEGOTIATED',
   'data': {'device-id': 'str'} }
+
+##
+# @colo-passthrough-add:
+#
+# Add passthrough entry according to customer's needs in COLO-compare.
+#
+# @protocol: COLO passthrough just support TCP and UDP.
+#
+# @port: TCP or UDP port number.
+#
+# Returns: Nothing on success
+#
+# Since: 5.3
+#
+# Example:
+#
+# -> { "execute": "colo-passthrough-add",
+#      "arguments": { "protocol": "tcp", "port": 3389 } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'colo-passthrough-add',
+     'data': {'protocol': 'str', 'port': 'uint32'} }
+
+##
+# @colo-passthrough-del:
+#
+# Delete passthrough entry according to customer's needs in COLO-compare.
+#
+# @protocol: COLO passthrough just support TCP and UDP.
+#
+# @port: TCP or UDP port number.
+#
+# Returns: Nothing on success
+#
+# Since: 5.3
+#
+# Example:
+#
+# -> { "execute": "colo-passthrough-del",
+#      "arguments": { "protocol": "tcp", "port": 3389 } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'colo-passthrough-del',
+     'data': {'protocol': 'str', 'port': 'uint32'} }
-- 
2.17.1


