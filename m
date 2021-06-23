Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916883B172A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:46:50 +0200 (CEST)
Received: from localhost ([::1]:40878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvzT7-0007Vv-4w
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvzRb-0005QU-T1
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:45:15 -0400
Received: from mga02.intel.com ([134.134.136.20]:12503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvzRY-0007EE-9i
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:45:15 -0400
IronPort-SDR: hbRVY3fji6Mj3D14qddmkhh3tAFwJRUMJ4QWSdlpWuMDvGR0dZt8XKAyFYsACm0JMp1Hi6Uq1e
 v4Hqmne0AoZQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="194369572"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="194369572"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 02:45:05 -0700
IronPort-SDR: +Kl+stvxIaqBHawq0pRlW1wu7g41Ktt266BlUwQjwR7ckHMPM2um5d2rI+4tFg31nEBaNbgtsu
 16HHVjII09Xw==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="487242761"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 02:45:02 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V9 1/6] qapi/net: Add IPFlowSpec and QMP command for filter
 passthrough
Date: Wed, 23 Jun 2021 17:37:52 +0800
Message-Id: <20210623093757.2683226-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623093757.2683226-1-chen.zhang@intel.com>
References: <20210623093757.2683226-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
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
Cc: Zhang Chen <chen.zhang@intel.com>, Lukas Straub <lukasstraub2@web.de>,
 Zhang Chen <zhangckid@gmail.com>
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
 qapi/net.json | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/net/net.c b/net/net.c
index 76bbb7c31b..00f2be7a58 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1195,6 +1195,16 @@ void qmp_netdev_del(const char *id, Error **errp)
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
index 7fab2e7cd8..bfe38faab5 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -7,6 +7,7 @@
 ##
 
 { 'include': 'common.json' }
+{ 'include': 'sockets.json' }
 
 ##
 # @set_link:
@@ -696,3 +697,80 @@
 ##
 { 'event': 'FAILOVER_NEGOTIATED',
   'data': {'device-id': 'str'} }
+
+##
+# @IPFlowSpec:
+#
+# IP flow specification.
+#
+# @protocol: Transport layer protocol like TCP/UDP, etc. The protocol is the
+#            string instead of enum, because it can be passed to getprotobyname(3)
+#            and avoid duplication with /etc/protocols.
+#
+# @object-name: The @object-name means a qemu object with network packet
+#               processing function, for example colo-compare, filtr-redirector
+#               filtr-mirror, etc. VM can running with multi network packet
+#               processing function objects. They can control different network
+#               data paths from netdev or chardev. So it needs the object-name
+#               to set the effective module.
+#
+# @source: Source address and port.
+#
+# @destination: Destination address and port.
+#
+# Since: 6.1
+##
+{ 'struct': 'IPFlowSpec',
+  'data': { '*protocol': 'str', 'object-name': 'str',
+    '*source': 'InetSocketAddressBase',
+    '*destination': 'InetSocketAddressBase' } }
+
+##
+# @passthrough-filter-add:
+#
+# Add passthrough entry IPFlowSpec to a qemu object with network packet
+# processing function, for example filtr-mirror, COLO-compare, etc.
+# The object-name is necessary. The protocol and source/destination IP and
+# source/destination ports are optional. if only inputs part of the
+# information, it will match all traffic.
+#
+# Returns: Nothing on success
+#
+# Since: 6.1
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
+# Delete passthrough entry IPFlowSpec to a qemu object with network packet
+# processing function, for example filtr-mirror, COLO-compare, etc.
+# The object-name is necessary. The protocol and source/destination IP and
+# source/destination ports are optional. if only inputs part of the
+# information, only the exact same rule will be deleted.
+#
+# Returns: Nothing on success
+#
+# Since: 6.1
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


