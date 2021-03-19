Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F73413F5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 05:03:22 +0100 (CET)
Received: from localhost ([::1]:55676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN6M5-00009x-95
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 00:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Jp-0006vJ-IH
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:01:01 -0400
Received: from mga18.intel.com ([134.134.136.126]:65160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Jf-0004P3-59
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:00:59 -0400
IronPort-SDR: mKrAEJi88jUD2A/A1Bedrrc6YB3aoVRShBdr3Ry8nQtmVtaCgTF8Ya00MOkwSTm2rOzy1Ci2RV
 dZVrglg2F1rQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="177409906"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="177409906"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:00:48 -0700
IronPort-SDR: gQROqdB514rQXKH9NVCObihYXXkQTKh1jtRQ6PchPaL/0DKBQSSSJQpYqM/C+NFJ+J5MAc9wHQ
 d0QhzbepSkgQ==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="606456635"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:00:45 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
Date: Fri, 19 Mar 2021 11:55:03 +0800
Message-Id: <20210319035508.113741-3-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319035508.113741-1-chen.zhang@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
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

Add L4_Connection struct for other QMP commands.
Except protocol field is necessary, other fields are optional.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 qapi/net.json | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/qapi/net.json b/qapi/net.json
index 498ea7aa72..cd4a8ed95e 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -825,3 +825,29 @@
 { 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'udplite',
     'icmp', 'igmp', 'ipv6' ] }
 
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
+# Since: 6.1
+##
+{ 'struct': 'L4_Connection',
+  'data': { 'protocol': 'IP_PROTOCOL', '*id': 'str', '*src_ip': 'str', '*dst_ip': 'str',
+    '*src_port': 'int', '*dst_port': 'int' } }
+
-- 
2.25.1


