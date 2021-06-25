Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F863B3B25
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 05:20:56 +0200 (CEST)
Received: from localhost ([::1]:46008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwcOl-00060L-Jy
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 23:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lwcNK-0003x2-D1
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 23:19:26 -0400
Received: from mga04.intel.com ([192.55.52.120]:4132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lwcNG-00068K-T9
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 23:19:26 -0400
IronPort-SDR: 6wrUStMex5U65QGKMShTsHG9UDFd9zlaeR6aP+2ffQuL3ORIrBLI72lbxOkndT0Qo3Egq/1avH
 DF45+lYClcGQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="205772515"
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="205772515"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 20:19:17 -0700
IronPort-SDR: AItyf3krOJ86ZmiXiV9vMQKgkXqZBSMr2K2NowGmu1HSNJLnH3Ny4qPEmINWtrRsl2/wkepKN8
 hynT1uqoEYNg==
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="488024812"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 20:19:14 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: [PULL 2/6] util/qemu-sockets.c: Add inet_parse_base to handle
 InetSocketAddressBase
Date: Fri, 25 Jun 2021 11:11:32 +0800
Message-Id: <20210625031136.2775308-3-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625031136.2775308-1-chen.zhang@intel.com>
References: <20210625031136.2775308-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to carry the flag all the time in many scenarios.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 include/qemu/sockets.h |  1 +
 util/qemu-sockets.c    | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 0c34bf2398..3a0f8fa8f2 100644
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
index 080a240b74..cd7fa0b884 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -713,6 +713,20 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
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


