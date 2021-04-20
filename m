Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A94365C2F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:28:03 +0200 (CEST)
Received: from localhost ([::1]:48270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYsIE-0002zY-M0
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lYsCQ-0005gU-CH
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:22:02 -0400
Received: from mga05.intel.com ([192.55.52.43]:37555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lYsCO-0004Vw-I4
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:22:02 -0400
IronPort-SDR: HrS8fdyoif+UBmTQ8OZP46cGHVGjPPKxLG9YszKE3Pu/vHyzTMd9AG43/5nQBpKTGlQsz8Jxns
 fg764o/DYqCg==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="280854213"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="280854213"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 08:21:59 -0700
IronPort-SDR: mpjETsMrO5wE8qR4iu+VGh2mrHE+VF+kdYyN4Uj5owhH3DtLCCyF6bDRvWz0AbyUtY1MSbgHMZ
 DPbKBmALUf5A==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="523846701"
Received: from unknown (HELO tkid-nvme.lan) ([10.239.13.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 08:21:56 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V6 2/6] util/qemu-sockets.c: Add inet_parse_base to handle
 InetSocketAddressBase
Date: Tue, 20 Apr 2021 23:15:33 +0800
Message-Id: <20210420151537.64360-3-chen.zhang@intel.com>
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

No need to carry the flag all the time in many scenarios.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 include/qemu/sockets.h |  1 +
 util/qemu-sockets.c    | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 7d1f813576..d5abc227eb 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -32,6 +32,7 @@ int socket_set_fast_reuse(int fd);
 int inet_ai_family_from_address(InetSocketAddress *addr,
                                 Error **errp);
 int inet_parse(InetSocketAddress *addr, const char *str, Error **errp);
+int inet_parse_base(InetSocketAddressBase *addr, const char *str, Error **errp);
 int inet_connect(const char *str, Error **errp);
 int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);
 
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8af0278f15..c16eba1917 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -690,6 +690,20 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
     return 0;
 }
 
+int inet_parse_base(InetSocketAddressBase *base, const char *str, Error **errp)
+{
+    InetSocketAddress *addr;
+    int ret = 0;
+
+    addr = g_new0(InetSocketAddress, 1);
+    ret = inet_parse(addr, str, errp);
+
+    base->host = addr->host;
+    base->port = addr->port;
+
+    g_free(addr);
+    return ret;
+}
 
 /**
  * Create a blocking socket and connect it to an address.
-- 
2.25.1


