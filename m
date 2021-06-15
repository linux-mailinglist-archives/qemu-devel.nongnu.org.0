Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A099A3A7D86
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 13:48:52 +0200 (CEST)
Received: from localhost ([::1]:41346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt7Yp-0005ax-GN
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 07:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lt7Uo-0007yn-Q6
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:44:42 -0400
Received: from mga14.intel.com ([192.55.52.115]:19454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lt7Ul-00068r-VL
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:44:42 -0400
IronPort-SDR: dQHt8PoxqgFZQ+fy/0oXeneCt/dAlCjaLAqvBvXKVDSslSWz3CoiV3IklpLAOjIs4k18yfuL0R
 PuJ/cB7GCkYg==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="205790917"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="205790917"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 04:44:35 -0700
IronPort-SDR: FxY4YQzpAweMT1eEQQgJxqP7zv7Us51afHB0vdMGRIOpeHY0LJ4CfZZELSGYt4i4cMyHw73GMQ
 YaJLp6UTkifw==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="450224079"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 04:44:32 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Date: Tue, 15 Jun 2021 19:37:35 +0800
Message-Id: <20210615113740.2278015-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615113740.2278015-1-chen.zhang@intel.com>
References: <20210615113740.2278015-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
All the fields of IPFlowSpec are optional.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/net.c     | 10 +++++++
 qapi/net.json | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/net/net.c b/net/net.c
index 76bbb7c31b..f913e97983 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1195,6 +1195,16 @@ void qmp_netdev_del(const char *id, Error **errp)
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
index 7fab2e7cd8..91f2e1495a 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -7,6 +7,7 @@
 ##
 
 { 'include': 'common.json' }
+{ 'include': 'sockets.json' }
 
 ##
 # @set_link:
@@ -696,3 +697,76 @@
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
+# @object-name: The @object-name means packet handler in Qemu. Because not
+#               all the network packet must pass the colo-compare module,
+#               the net-filters are same situation. There modules attach to
+#               netdev or chardev to work, VM can run multiple modules
+#               at the same time. So it needs the object-name to set
+#               the effective module.
+#
+# @source: Source address and port.
+#
+# @destination: Destination address and port.
+#
+# Since: 6.1
+##
+{ 'struct': 'IPFlowSpec',
+  'data': { '*protocol': 'str', '*object-name': 'str',
+    '*source': 'InetSocketAddressBase',
+    '*destination': 'InetSocketAddressBase' } }
+
+##
+# @colo-passthrough-add:
+#
+# Add passthrough entry IPFlowSpec to the COLO-compare instance.
+# The protocol and source/destination IP/ports are optional. if the user
+# only inputs part of the information, this will match all traffic.
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
+# Delete passthrough entry IPFlowSpec to the COLO-compare instance.
+# The protocol and source/destination IP/ports are optional. if the user
+# only inputs part of the information, this will match all traffic.
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


