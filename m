Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3775343DAE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:24:35 +0100 (CET)
Received: from localhost ([::1]:60632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHje-0005yi-V3
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOHU7-000823-1r
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:08:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOHU0-0002ni-PX
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616407702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y6LypCmlc48uGr2Rv+a4xfYK5lEqailGG9L9qoIYFCo=;
 b=chHgHjslTr6o+w6bVXSsWuSU3PF2vVzuYKmmA1PyjFA0X6qqcKIG353K8XiZZhM9dANytt
 mpY7tYS7e1xthugQCBrz7ByFPLgCMX9RilKaWcJEePuMSyNLX6G/Si2LwLSH+eYy1AsZjn
 /dqrfUMFFSpkEn5UeXcqLO15hqVZ8xM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-vPfVuPv3NVCLrIJDU5T7Ew-1; Mon, 22 Mar 2021 06:08:19 -0400
X-MC-Unique: vPfVuPv3NVCLrIJDU5T7Ew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 851368015BD;
 Mon, 22 Mar 2021 10:08:18 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-83.pek2.redhat.com
 [10.72.12.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB2475D9CD;
 Mon, 22 Mar 2021 10:08:16 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 01/13] net: eth: Add a helper to pad a short Ethernet frame
Date: Mon, 22 Mar 2021 18:08:00 +0800
Message-Id: <1616407692-693-2-git-send-email-jasowang@redhat.com>
In-Reply-To: <1616407692-693-1-git-send-email-jasowang@redhat.com>
References: <1616407692-693-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

Add a helper to pad a short Ethernet frame to the minimum required
length, which can be used by backends' code.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/eth.h | 17 +++++++++++++++++
 net/eth.c         | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/net/eth.h b/include/net/eth.h
index 0671be6..7767ae8 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -31,6 +31,7 @@
 
 #define ETH_ALEN 6
 #define ETH_HLEN 14
+#define ETH_ZLEN 60     /* Min. octets in frame without FCS */
 
 struct eth_header {
     uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
@@ -422,4 +423,20 @@ bool
 eth_parse_ipv6_hdr(const struct iovec *pkt, int pkt_frags,
                    size_t ip6hdr_off, eth_ip6_hdr_info *info);
 
+/**
+ * eth_pad_short_frame - pad a short frame to the minimum Ethernet frame length
+ *
+ * If the Ethernet frame size is shorter than 60 bytes, it will be padded to
+ * 60 bytes at the address @padded_pkt.
+ *
+ * @padded_pkt: buffer address to hold the padded frame
+ * @padded_buflen: pointer holding length of @padded_pkt. If the frame is
+ *                 padded, the length will be updated to the padded one.
+ * @pkt: address to hold the original Ethernet frame
+ * @pkt_size: size of the original Ethernet frame
+ * @return true if the frame is padded, otherwise false
+ */
+bool eth_pad_short_frame(uint8_t *padded_pkt, size_t *padded_buflen,
+                         const void *pkt, size_t pkt_size);
+
 #endif
diff --git a/net/eth.c b/net/eth.c
index 1e0821c..f913e43 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -548,3 +548,20 @@ bool eth_parse_ipv6_hdr(const struct iovec *pkt, int pkt_frags,
     info->l4proto = ext_hdr.ip6r_nxt;
     return true;
 }
+
+bool eth_pad_short_frame(uint8_t *padded_pkt, size_t *padded_buflen,
+                         const void *pkt, size_t pkt_size)
+{
+    assert(padded_buflen && *padded_buflen >= ETH_ZLEN);
+
+    if (pkt_size >= ETH_ZLEN) {
+        return false;
+    }
+
+    /* pad to minimum Ethernet frame length */
+    memcpy(padded_pkt, pkt, pkt_size);
+    memset(&padded_pkt[pkt_size], 0, ETH_ZLEN - pkt_size);
+    *padded_buflen = ETH_ZLEN;
+
+    return true;
+}
-- 
2.7.4


