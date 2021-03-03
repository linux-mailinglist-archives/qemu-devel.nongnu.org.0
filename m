Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA4E32B3E9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 05:23:50 +0100 (CET)
Received: from localhost ([::1]:60556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHJ37-00074U-2u
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 23:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0X-0005BE-K7
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:09 -0500
Received: from mga18.intel.com ([134.134.136.126]:42977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0V-0005CY-2Q
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:09 -0500
IronPort-SDR: m7CgZNNpxUM5AnYTM+fQlTivbvN8srHWNyNnWaELef9nWKOjkTl5a9ah0iG3s2pjj2WSJpUqlX
 XJwdO1uOp/Pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174732197"
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="174732197"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:21:04 -0800
IronPort-SDR: O5JMtLiJ8HNYmP4X8c1SAAXqs8Y5HcR2kaaFHahUe71aPUJbsZfsGVJTwCmf7sFgbM5CM318xY
 cZa1PhduQ7xQ==
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="407059974"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:21:02 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH V2 2/7] qapi/net.json: Add L4_Connection definition
Date: Wed,  3 Mar 2021 12:15:34 +0800
Message-Id: <20210303041539.1032415-3-chen.zhang@intel.com>
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

Add L4_Connection struct for other QMP commands.
Except protocol field is necessary, other fields are optional.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 qapi/net.json | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/qapi/net.json b/qapi/net.json
index dc4c87dc7b..b4958447f2 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -744,3 +744,29 @@
 ##
 { 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'udplite',
     'icmp', 'igmp', 'ipv6' ] }
+
+##
+# @L4_Connection:
+#
+# Layer 4 network connection.
+#
+# Just for IPv4.
+#
+# @protocol: Transport layer protocol like TCP/UDP...
+#
+# @id: For specific module with Qemu object ID, If there is no such part,
+#      it means global rules.
+#
+# @src_ip: Source IP.
+#
+# @dst_ip: Destination IP.
+#
+# @src_port: Source port.
+#
+# @dst_port: Destination port.
+#
+# Since: 6.0
+##
+{ 'struct': 'L4_Connection',
+  'data': { 'protocol': 'IP_PROTOCOL', '*id': 'str', '*src_ip': 'str', '*dst_ip': 'str',
+    '*src_port': 'int', '*dst_port': 'int' } }
-- 
2.25.1


