Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2C933FD95
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 04:12:35 +0100 (CET)
Received: from localhost ([::1]:52994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMj5O-00060Y-QY
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 23:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMj3g-0004Hn-P0
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:10:48 -0400
Received: from mga09.intel.com ([134.134.136.24]:54696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMj3f-0005qP-2x
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:10:48 -0400
IronPort-SDR: JCTv37OkvENCUhHWH5MutSbty33hTQxPgdbbATRB5XzDm2YvigMm1gmgTiUH3nPc0r8YP3rjvG
 Z8xXc41kyrlg==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="189681343"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="189681343"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 20:10:44 -0700
IronPort-SDR: GZDNlh46FIFXMFtGbVavHt4jQkwlIEIQcEjGQFScJadl9xMDFdYYaCnphlwnT18UNM0votpoDG
 9XkyFZYKxIWw==
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="412898228"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 20:10:42 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH V3 3/7] qapi/net: Add new QMP command for COLO passthrough
Date: Thu, 18 Mar 2021 11:04:56 +0800
Message-Id: <20210318030500.55352-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318030500.55352-1-chen.zhang@intel.com>
References: <20210318030500.55352-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the real user scenario does not need COLO to monitor all traffic.
Add colo-passthrough-add and colo-passthrough-del to maintain
a COLO network passthrough list.

QMP demo usage:
{'execute': 'colo-passthrough-add', 'arguments': {'protocol': 'tcp', 'id': 'comp0', 'src_ip':'10.239.48.105', 'dst_ip':'10.239.48.128', 'src_port':1234, 'dst_port':1235}}

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


