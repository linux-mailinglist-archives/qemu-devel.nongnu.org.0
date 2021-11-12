Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09B244E0BF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 04:22:42 +0100 (CET)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlN9F-0008EI-Nw
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 22:22:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mlN82-0005pV-4N
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:21:26 -0500
Received: from mga03.intel.com ([134.134.136.65]:4407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mlN7z-0005Ty-Pp
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:21:25 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="233009080"
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; d="scan'208";a="233009080"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 19:21:21 -0800
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; d="scan'208";a="504711459"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 19:21:19 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH for 7.0 V10 1/6] qapi/net: Add IPFlowSpec and QMP command for
 filter passthrough
Date: Fri, 12 Nov 2021 11:11:07 +0800
Message-Id: <20211112031112.9303-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112031112.9303-1-chen.zhang@intel.com>
References: <20211112031112.9303-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the real user scenario does not need to monitor all traffic.
Add passthrough-filter-add and passthrough-filter-del to maintain
a network passthrough list in object with network packet processing
function. Add IPFlowSpec struct for all QMP commands.
Most the fields of IPFlowSpec are optional,except object-name.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/net.c     | 10 +++++++
 qapi/net.json | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/net/net.c b/net/net.c
index f0d14dbfc1..5d0d5914fb 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1215,6 +1215,16 @@ void qmp_netdev_del(const char *id, Error **errp)
     }
 }
 
+void qmp_passthrough_filter_add(IPFlowSpec *spec, Error **errp)
+{
+    /* TODO implement setup passthrough rule */
+}
+
+void qmp_passthrough_filter_del(IPFlowSpec *spec, Error **errp)
+{
+    /* TODO implement delete passthrough rule */
+}
+
 static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
 {
     char *str;
diff --git a/qapi/net.json b/qapi/net.json
index 7fab2e7cd8..5194aedcf5 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -7,6 +7,7 @@
 ##
 
 { 'include': 'common.json' }
+{ 'include': 'sockets.json' }
 
 ##
 # @set_link:
@@ -696,3 +697,75 @@
 ##
 { 'event': 'FAILOVER_NEGOTIATED',
   'data': {'device-id': 'str'} }
+
+##
+# @IPFlowSpec:
+#
+# IP flow specification.
+#
+# @protocol: Transport layer protocol like TCP/UDP, etc. This will be
+#            passed to getprotobyname(3).
+#
+# @object-name: The @object-name means a QEMU object with network
+#               packet processing function, for example colo-compare,
+#               filter-redirector, filter-mirror, etc. QOM path to
+#               a QOM object that implements their own passthrough
+#               work in the original data processing flow. What is
+#               exposed to the outside world is an operable
+#               passthrough list.
+#
+# @source: Source address and port.
+#
+# @destination: Destination address and port.
+#
+# Since: 7.0
+##
+{ 'struct': 'IPFlowSpec',
+  'data': { '*protocol': 'str', 'object-name': 'str',
+    '*source': 'InetSocketAddressBase',
+    '*destination': 'InetSocketAddressBase' } }
+
+##
+# @passthrough-filter-add:
+#
+# Add an entry to the QOM object own network passthrough list.
+# Absent protocol, host addresses and ports match anything.
+#
+# Returns: Nothing on success
+#
+# Since: 7.0
+#
+# Example:
+#
+# -> { "execute": "passthrough-filter-add",
+#      "arguments": { "protocol": "tcp", "object-name": "object0",
+#      "source": {"host": "192.168.1.1", "port": "1234"},
+#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'passthrough-filter-add', 'boxed': true,
+     'data': 'IPFlowSpec' }
+
+##
+# @passthrough-filter-del:
+#
+# Delete an entry from the QOM object own network passthrough list.
+# Deletes the entry with exactly this protocol, host addresses
+# and ports.
+#
+# Returns: Nothing on success
+#
+# Since: 7.0
+#
+# Example:
+#
+# -> { "execute": "passthrough-filter-del",
+#      "arguments": { "protocol": "tcp", "object-name": "object0",
+#      "source": {"host": "192.168.1.1", "port": "1234"},
+#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'passthrough-filter-del', 'boxed': true,
+     'data': 'IPFlowSpec' }
-- 
2.25.1


