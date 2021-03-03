Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F55232B3EA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 05:23:50 +0100 (CET)
Received: from localhost ([::1]:60640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHJ37-00076h-53
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 23:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0Z-0005D0-3O
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:11 -0500
Received: from mga18.intel.com ([134.134.136.126]:42973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0X-0005Ag-Cv
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:10 -0500
IronPort-SDR: MOjeQqSNprePNm20ZEFN8dSia/ix277L/rFOsXFl+zgRBfBwRVUneBBrOYHlVBuR4bnJ4KoHh+
 HhRtb9anmbxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174732202"
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="174732202"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:21:06 -0800
IronPort-SDR: Dy/F+swVfFmJ0IKUcRbx7wOmb+KIp48clW6x8nW9pf/rlTeE39aXfZSLqlRy6QzlKXTujv7fV6
 q/ZmRz1OmHyg==
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="407059999"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:21:04 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH V2 3/7] qapi/net: Add new QMP command for COLO passthrough
Date: Wed,  3 Mar 2021 12:15:35 +0800
Message-Id: <20210303041539.1032415-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303041539.1032415-1-chen.zhang@intel.com>
References: <20210303041539.1032415-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=1.624,
 FROM_WSP_TRAIL=1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Since the real user scenario does not need COLO to monitor all traffic.
Add colo-passthrough-add and colo-passthrough-del to maintain
a COLO network passthrough list.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/net.c     | 10 ++++++++++
 qapi/net.json | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/net/net.c b/net/net.c
index e1035f21d1..037dcc5973 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1151,6 +1151,16 @@ void qmp_netdev_del(const char *id, Error **errp)
     qemu_del_net_client(nc);
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
index b4958447f2..e0c6e1d8f3 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -770,3 +770,43 @@
 { 'struct': 'L4_Connection',
   'data': { 'protocol': 'IP_PROTOCOL', '*id': 'str', '*src_ip': 'str', '*dst_ip': 'str',
     '*src_port': 'int', '*dst_port': 'int' } }
+
+##
+# @colo-passthrough-add:
+#
+# Add passthrough entry according to customer's needs in COLO-compare.
+#
+# Returns: Nothing on success
+#
+# Since: 6.0
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
+# Since: 6.0
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
-- 
2.25.1


