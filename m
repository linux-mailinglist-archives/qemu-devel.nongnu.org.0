Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458CC341400
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 05:07:40 +0100 (CET)
Received: from localhost ([::1]:38252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN6QF-0004mi-BK
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 00:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Jt-0006xC-Hk
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:01:07 -0400
Received: from mga18.intel.com ([134.134.136.126]:65167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Ji-0004RO-K7
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:01:02 -0400
IronPort-SDR: aXxdyPE+jqOwzQogHe/xdxFh2YCpx4MzbLiRcgBGgSV+yioIzVxH1JSjNVZQY8kvhOjM21GA3e
 3sRw4iSdMK5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="177409914"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="177409914"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:00:51 -0700
IronPort-SDR: O8fRVmxRXzgGEdPkESruVaYGl4NMdsOg3t+zWK3iLdPz3apUOgbW83akxDoSFCVR7OuWHEaQED
 sHfGKsD2c93w==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="606456682"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:00:47 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO passthrough
Date: Fri, 19 Mar 2021 11:55:04 +0800
Message-Id: <20210319035508.113741-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319035508.113741-1-chen.zhang@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
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
Cc: Zhang Chen <chen.zhang@intel.com>, Lukas Straub <lukasstraub2@web.de>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the real user scenario does not need COLO to monitor all traffic.
Add colo-passthrough-add and colo-passthrough-del to maintain
a COLO network passthrough list.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/net.c     | 10 ++++++++++
 qapi/net.json | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/net/net.c b/net/net.c
index 725a4e1450..7c7cefe0e0 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1199,6 +1199,16 @@ void qmp_netdev_del(const char *id, Error **errp)
     }
 }
 
+void qmp_colo_passthrough_add(L4_Connection *conn, Error **errp)
+{
+    /* Setup passthrough connection */
+}
+
+void qmp_colo_passthrough_del(L4_Connection *conn, Error **errp)
+{
+    /* Delete passthrough connection */
+}
+
 static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
 {
     char *str;
diff --git a/qapi/net.json b/qapi/net.json
index cd4a8ed95e..ec7d3b1128 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -851,3 +851,43 @@
   'data': { 'protocol': 'IP_PROTOCOL', '*id': 'str', '*src_ip': 'str', '*dst_ip': 'str',
     '*src_port': 'int', '*dst_port': 'int' } }
 
+##
+# @colo-passthrough-add:
+#
+# Add passthrough entry according to customer's needs in COLO-compare.
+#
+# Returns: Nothing on success
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute": "colo-passthrough-add",
+#      "arguments": { "protocol": "tcp", "id": "object0", "src_ip": "192.168.1.1",
+#      "dst_ip": "192.168.1.2", "src_port": 1234, "dst_port": 4321 } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'colo-passthrough-add', 'boxed': true,
+     'data': 'L4_Connection' }
+
+##
+# @colo-passthrough-del:
+#
+# Delete passthrough entry according to customer's needs in COLO-compare.
+#
+# Returns: Nothing on success
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute": "colo-passthrough-del",
+#      "arguments": { "protocol": "tcp", "id": "object0", "src_ip": "192.168.1.1",
+#      "dst_ip": "192.168.1.2", "src_port": 1234, "dst_port": 4321 } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'colo-passthrough-del', 'boxed': true,
+     'data': 'L4_Connection' }
+
-- 
2.25.1


