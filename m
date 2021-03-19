Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C353413FA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 05:05:51 +0100 (CET)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN6OU-0002ur-3v
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 00:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Jf-0006se-UQ
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:00:51 -0400
Received: from mga18.intel.com ([134.134.136.126]:65156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Jd-0004Ka-Ew
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:00:51 -0400
IronPort-SDR: Snasdljvm+korKMj6RHk6BLbdE9wuF4G7BJXbeQLBTdXYnpmh5QP4LnnOktUDW5b1Gj27C+82t
 KaF5FSzMdtdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="177409904"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="177409904"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:00:44 -0700
IronPort-SDR: EktmGBKO5G1CAbGJsaZA+ga4XLSJB2YPxkSmBdtqRU44cY2DtvfhTMQWvAJ2RTvvobE3oXoqLe
 8wmlieZCR2lg==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="606456621"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:00:42 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
Date: Fri, 19 Mar 2021 11:55:02 +0800
Message-Id: <20210319035508.113741-2-chen.zhang@intel.com>
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

Add IP_PROTOCOL as enum include TCP,UDP, ICMP... for other QMP commands.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 qapi/net.json | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/qapi/net.json b/qapi/net.json
index 87361ebd9a..498ea7aa72 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -794,3 +794,34 @@
 #
 ##
 { 'command': 'query-netdev', 'returns': ['NetdevInfo'] }
+
+##
+# @IP_PROTOCOL:
+#
+# Transport layer protocol.
+#
+# Just for IPv4.
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
+{ 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'udplite',
+    'icmp', 'igmp', 'ipv6' ] }
+
-- 
2.25.1


