Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385F536075E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:43:43 +0200 (CEST)
Received: from localhost ([::1]:49982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzTJ-0002VV-1e
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzRD-0000sw-AJ
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:41:31 -0400
Received: from mga06.intel.com ([134.134.136.31]:54485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzR6-0002Bp-TK
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:41:31 -0400
IronPort-SDR: s43+Sx7DcjrHAg3dwmQ63BjsySq/+dA01mY7lG3qkWbr8DW3ifBcZcHIUu9j0G1Nb2a2UUR0xD
 mqk3GD0e+ahA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="256146908"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="256146908"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:41:18 -0700
IronPort-SDR: pIEy4D6usxigK6MDJXfSebCSO+vhP77TINs2p1GVkneNLQbW8hVq8cjRofMJnirFgzzqYVOLSX
 6hXpVdB9pCSA==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="425134930"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:41:15 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V5 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Date: Thu, 15 Apr 2021 18:35:10 +0800
Message-Id: <20210415103515.1251386-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415103515.1251386-1-chen.zhang@intel.com>
References: <20210415103515.1251386-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
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
 net/net.c     | 10 ++++++
 qapi/net.json | 98 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+)

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
index af3f5b0fda..1ff819b3fb 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -7,6 +7,7 @@
 ##
 
 { 'include': 'common.json' }
+{ 'include': 'sockets.json' }
 
 ##
 # @set_link:
@@ -694,3 +695,100 @@
 ##
 { 'event': 'FAILOVER_NEGOTIATED',
   'data': {'device-id': 'str'} }
+
+##
+# @IPProtocol:
+#
+# Transport layer protocol.
+#
+# @tcp: Transmission Control Protocol.
+#
+# @udp: User Datagram Protocol.
+#
+# @dccp: Datagram Congestion Control Protocol.
+#
+# @sctp: Stream Control Transmission Protocol.
+#
+# @udplite: Lightweight User Datagram Protocol.
+#
+# @icmp: Internet Control Message Protocol.
+#
+# @igmp: Internet Group Management Protocol.
+#
+# @ipv6: IPv6 Encapsulation.
+#
+# TODO: Need to add more transport layer protocol.
+#
+# Since: 6.1
+##
+{ 'enum': 'IPProtocol',
+  'data': [
+   'tcp', 'udp', 'dccp', 'sctp',
+   'udplite', 'icmp', 'igmp', 'ipv6' ] }
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
+  'data': { 'protocol': 'IPProtocol', '*object-name': 'str',
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


