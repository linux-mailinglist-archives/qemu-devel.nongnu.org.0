Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F41365C23
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:25:40 +0200 (CEST)
Received: from localhost ([::1]:42968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYsFv-0000ji-At
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lYsCO-0005es-SG
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:22:00 -0400
Received: from mga05.intel.com ([192.55.52.43]:37551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lYsCM-0004UC-V9
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:22:00 -0400
IronPort-SDR: AoNi0dDlQwATNu0+Pc7hS6aFsnETQQKrr7s4N/vCYf0PtMn/RD/OKNdu7uEx9hOdU09cqBXfhO
 NIIehvRimQyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="280854207"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="280854207"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 08:21:56 -0700
IronPort-SDR: CCh69qPVenAqxwoZD5yVb4rHNJB37VhAivWUSxd0kVnQn5sRpJO8iN+OvmrLyveTEIlV443SuM
 hlKg9YtXpjtw==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="523846687"
Received: from unknown (HELO tkid-nvme.lan) ([10.239.13.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 08:21:53 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V6 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Date: Tue, 20 Apr 2021 23:15:32 +0800
Message-Id: <20210420151537.64360-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420151537.64360-1-chen.zhang@intel.com>
References: <20210420151537.64360-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
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
a COLO network passthrough list. Add IPFlowSpec struct for all QMP commands.
Except protocol field is necessary, other fields are optional.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/net.c     | 10 ++++++++
 qapi/net.json | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/net/net.c b/net/net.c
index edf9b95418..2a6e5f3886 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1196,6 +1196,16 @@ void qmp_netdev_del(const char *id, Error **errp)
     }
 }
 
+void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp)
+{
+    /* TODO implement setup passthrough rule */
+}
+
+void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp)
+{
+    /* TODO implement delete passthrough rule */
+}
+
 static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
 {
     char *str;
diff --git a/qapi/net.json b/qapi/net.json
index af3f5b0fda..f6e4e37526 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -7,6 +7,7 @@
 ##
 
 { 'include': 'common.json' }
+{ 'include': 'sockets.json' }
 
 ##
 # @set_link:
@@ -694,3 +695,70 @@
 ##
 { 'event': 'FAILOVER_NEGOTIATED',
   'data': {'device-id': 'str'} }
+
+##
+# @IPFlowSpec:
+#
+# IP flow specification.
+#
+# @protocol: Transport layer protocol like TCP/UDP...
+#
+# @object-name: Point out the IPflow spec effective range of object,
+#               If there is no such part, it means global spec.
+#
+# @source: Source address and port.
+#
+# @destination: Destination address and port.
+#
+# Since: 6.1
+##
+{ 'struct': 'IPFlowSpec',
+  'data': { 'protocol': 'str', '*object-name': 'str',
+    '*source': 'InetSocketAddressBase',
+    '*destination': 'InetSocketAddressBase' } }
+
+##
+# @colo-passthrough-add:
+#
+# Add passthrough entry according to user's needs in COLO-compare.
+# Source IP/port and destination IP/port both optional, If user just
+# input parts of infotmation, it will match all.
+#
+# Returns: Nothing on success
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute": "colo-passthrough-add",
+#      "arguments": { "protocol": "tcp", "object-name": "object0",
+#      "source": {"host": "192.168.1.1", "port": "1234"},
+#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'colo-passthrough-add', 'boxed': true,
+     'data': 'IPFlowSpec' }
+
+##
+# @colo-passthrough-del:
+#
+# Delete passthrough entry according to user's needs in COLO-compare.
+# Source IP/port and destination IP/port both optional, If user just
+# input parts of infotmation, it will match all.
+#
+# Returns: Nothing on success
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute": "colo-passthrough-del",
+#      "arguments": { "protocol": "tcp", "object-name": "object0",
+#      "source": {"host": "192.168.1.1", "port": "1234"},
+#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'colo-passthrough-del', 'boxed': true,
+     'data': 'IPFlowSpec' }
-- 
2.25.1


