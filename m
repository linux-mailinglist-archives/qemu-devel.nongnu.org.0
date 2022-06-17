Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FBB54F26E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 10:01:24 +0200 (CEST)
Received: from localhost ([::1]:34368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o26ux-0007YJ-9F
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 04:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lU-0005cP-P5
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:36 -0400
Received: from mga06b.intel.com ([134.134.136.31]:28828 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lT-0007CE-6U
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655452295; x=1686988295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gTGywrzpCzMNpBHyDMvcuxeMX8+gcZ5UiuUYs94rVR4=;
 b=IjhRyD3YdEYGM6YWAkXA59olvNBBUHV6+nFx2QuB2qOL1VvhtEy+3W/Q
 uGpOyCGG/rlST2GSh6xTz7pAIVS7uWruQ2JwmZruSXjDsA2NcHaWIvG+k
 tQJOzn8ZaqmU4/b7KaFQo7aCFJ5qVMXeF4MyCzb30xlZN5avO533vMki7
 hOJ3EetIh/byQmc6jy6RpH7go1X1ICL4RJVmwMnBLrpCz8jC5J24oFwpG
 6ClVBTH2/PBPI2DQKy47rIs8KnL651FuO/VGwRQp9m8OuOvcCd4jDreb1
 Br1ZriTr+BD8q7PKOpOnh6NgBo1HUFSo63e3H9Cyd/FVnYKVocomKP4ZL A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341102176"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341102176"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:33 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641936773"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:31 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Zhang Chen <chen.zhang@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>
Subject: [RFC PATCH 10/12] net/filter-ubpf.c: run the ubpf program to handle
 network packet
Date: Fri, 17 Jun 2022 15:36:28 +0800
Message-Id: <20220617073630.535914-11-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617073630.535914-1-chen.zhang@intel.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Run the loaded userspace ebpf program with the packet.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/filter-ubpf.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/net/filter-ubpf.c b/net/filter-ubpf.c
index c63a021759..554cc24d8f 100644
--- a/net/filter-ubpf.c
+++ b/net/filter-ubpf.c
@@ -20,6 +20,8 @@
 #include "qemu/error-report.h"
 #include "trace.h"
 #include "ebpf/ubpf.h"
+#include "colo.h"
+#include "util.h"
 
 #define TYPE_FILTER_UBPF "filter-ubpf"
 OBJECT_DECLARE_SIMPLE_TYPE(FiliterUbpfState, FILTER_UBPF)
@@ -38,9 +40,43 @@ static ssize_t filter_ubpf_receive_iov(NetFilterState *nf,
                                        int iovcnt,
                                        NetPacketSent *sent_cb)
 {
-    /* TODO: handle packet by loaded userspace ebpf program */
+    FiliterUbpfState *s = FILTER_UBPF(nf);
+    size_t size;
+    char *buf;
+    Packet *pkt = NULL;
+    uint64_t result;
+
+    size = iov_size(iov, iovcnt);
+    if (!size) {
+        return 0;
+    }
+
+    buf = g_malloc(size);
+    if (unlikely(iov_to_buf(iov, iovcnt, 0, buf, size) != size)) {
+        g_free(buf);
+        return 0;
+    }
+
+    pkt = packet_new_nocopy(buf, size, 0);
 
-    return 0;
+    if (parse_packet_early(pkt)) {
+        packet_destroy(pkt, NULL);
+        pkt = NULL;
+        return 0;
+    }
+
+    if (s->ip_mode) {
+        result = qemu_ubpf_run_once(&s->ubpf, pkt->ip, sizeof(struct ip));
+    } else {
+        result = qemu_ubpf_run_once(&s->ubpf, pkt->data, pkt->size);
+    }
+
+    /* If result == 1, means trigger the ebpf program rules */
+    if (result) {
+        return -1;
+    } else {
+        return 0;
+    }
 }
 
 static void filter_ubpf_cleanup(NetFilterState *nf)
-- 
2.25.1


