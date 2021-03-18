Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE633FD9D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 04:14:14 +0100 (CET)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMj6z-0000U5-Cq
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 23:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMj3f-0004Ha-7g
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:10:47 -0400
Received: from mga09.intel.com ([134.134.136.24]:54700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMj3d-0005sv-G2
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:10:47 -0400
IronPort-SDR: c3R9nWlKCrpn0Up6ZR0+hXMUTobzLAZ5g2DjJGdq223P300KFTgaf2SGFKnjQ+iHzUHtd+/tOH
 9RBrsIqksZwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="189681337"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="189681337"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 20:10:41 -0700
IronPort-SDR: VToqeDUO/HLPVVKLiEpM9uaE4O0aGDCyCu+pYPJAaz77fnIxLXcLQJiPrxI2weSBAPqKgTGD61
 rqtfOkWsaKCg==
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="412898213"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 20:10:39 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH V3 2/7] qapi/net.json: Add L4_Connection definition
Date: Thu, 18 Mar 2021 11:04:55 +0800
Message-Id: <20210318030500.55352-3-chen.zhang@intel.com>
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


