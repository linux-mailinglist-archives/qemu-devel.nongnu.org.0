Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC17390E9F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 05:03:41 +0200 (CEST)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lljpc-0000WT-La
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 23:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lljnI-0006GV-4w
 for qemu-devel@nongnu.org; Tue, 25 May 2021 23:01:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:16088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lljnD-0002sV-5A
 for qemu-devel@nongnu.org; Tue, 25 May 2021 23:01:15 -0400
IronPort-SDR: dpsVsz7XBTgpY7qZTefQUm74vouibxoxWak6nc4QL2v7tdFHKDOgtp5f2ALy/XJrGGbHzZrMZ+
 nF1LLE4i2+iw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202118598"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="202118598"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 20:01:07 -0700
IronPort-SDR: vR8rDbBqMiEnA3qzDxmcVTGr0K02RQFgydZHuJLbKXWu1P5EkiPKQwg5iLTyk9BHuVHj0CnKc6
 9cVDfA0w01nQ==
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="443741244"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 20:01:04 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V7 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Date: Wed, 26 May 2021 10:54:19 +0800
Message-Id: <20210526025424.1319994-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526025424.1319994-1-chen.zhang@intel.com>
References: <20210526025424.1319994-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 2a472604ec..a4bee86b24 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1194,6 +1194,16 @@ void qmp_netdev_del(const char *id, Error **errp)
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
index af3f5b0fda..aca3b54278 100644
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
+  'data': { '*protocol': 'str', '*object-name': 'str',
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


