Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A66EBCDD
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:21:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRDz-0006Wj-Uj; Sun, 23 Apr 2023 00:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDY-0005XB-4J
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:52 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDV-0001Km-Qr
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:51 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1a6ebc66ca4so27067415ad.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223648; x=1684815648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1P94Ld32G2n39Qr0uzi/MRSoo66sMPmjfe3uOCd8T3g=;
 b=L41rISjDJQ74CDi+6uP0TSdJOiksBTbho/4X21M/QDLUu4AyCqraT9mPLURL0EOz6X
 FQeZ2xkQEBUYbxZv64UA7D6zeYf4RzaCqwSlLjHopkQYjD+ahANn8MvPiMuSc52mbX4X
 +OhCPLY49iupIWlMlQtmzydYKiJeA9UJsrvaly4l/ulgX8IaIZBboDkQPCX9HnnTTuho
 CEmN25Es2udKeAdThve3UO4vKpfeQF2+JWAx6vGJOYIgoHnv3YCocKwI5ewBUDLhstXR
 4EyL6w6CHGcBxfNs365jzEv9P+Gcx9gCxOeTwTqGv/STY8K6Aux2E2vZli/KkTfDId+y
 CP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223648; x=1684815648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1P94Ld32G2n39Qr0uzi/MRSoo66sMPmjfe3uOCd8T3g=;
 b=IC0wkYb6RuKdQMpWsb/L212HZYOdSVdIlZ7rMr508gH+EFXbp4TO9os2FSSIFn5ur3
 B9SZRIyeE11wmWo140qOtf+1q5lAgivu1cPZLJiomp7jrXqdRWmc7JpH5013L9Nk73L6
 ztdA2QwKNy3fJejBH+A29jlZbHoKjXifhr0j9pcXt9crs9NnnAa4GAPw6Ff3qecUCHlU
 xwACKucR4YWQ1Ns1kjZ+kHVt2D/Pb8xJDAeF8WemLLM/41hivdtACchdnCNYu8wv+Yid
 JgBVFQ41cOabL7AjeiHIJtJixuparZsWjeE9BNgTECRNju+Ae27u2hTDnq4TkuOe7sI6
 QlSw==
X-Gm-Message-State: AAQBX9cjTgsxOB93bgKFJjvn2j+ZJuIT7eD0G924/03tSgMlv46vZ+Hg
 zfTAMA3oUp/wgWqwD0B3SfWqxQ==
X-Google-Smtp-Source: AKy350bW7YlQZpwBFwhlrorwZgYLBnxjE7G+qMwssD0/C5mauTNXJwUUo3/HAHtUquLZJ4SbwFDXKQ==
X-Received: by 2002:a17:903:24e:b0:19d:778:ff5 with SMTP id
 j14-20020a170903024e00b0019d07780ff5mr12252620plh.15.1682223648677; 
 Sat, 22 Apr 2023 21:20:48 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:20:48 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 37/47] igb: Implement Tx SCTP CSO
Date: Sun, 23 Apr 2023 13:18:23 +0900
Message-Id: <20230423041833.5302-38-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/net_tx_pkt.h |  8 ++++++++
 hw/net/igb_core.c   | 12 +++++++-----
 hw/net/net_tx_pkt.c | 18 ++++++++++++++++++
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index 4d7233e975..0a716e74a5 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -116,6 +116,14 @@ void net_tx_pkt_update_ip_checksums(struct NetTxPkt *pkt);
  */
 void net_tx_pkt_update_ip_hdr_checksum(struct NetTxPkt *pkt);
 
+/**
+ * Calculate the SCTP checksum.
+ *
+ * @pkt:            packet
+ *
+ */
+bool net_tx_pkt_update_sctp_checksum(struct NetTxPkt *pkt);
+
 /**
  * get length of all populated data.
  *
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 01d2788cf6..24a90cd35f 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -440,8 +440,9 @@ igb_tx_insert_vlan(IGBCore *core, uint16_t qn, struct igb_tx *tx,
 static bool
 igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
 {
+    uint32_t idx = (tx->first_olinfo_status >> 4) & 1;
+
     if (tx->first_cmd_type_len & E1000_ADVTXD_DCMD_TSE) {
-        uint32_t idx = (tx->first_olinfo_status >> 4) & 1;
         uint32_t mss = tx->ctx[idx].mss_l4len_idx >> E1000_ADVTXD_MSS_SHIFT;
         if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, mss)) {
             return false;
@@ -452,10 +453,11 @@ igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
         return true;
     }
 
-    if (tx->first_olinfo_status & E1000_ADVTXD_POTS_TXSM) {
-        if (!net_tx_pkt_build_vheader(tx->tx_pkt, false, true, 0)) {
-            return false;
-        }
+    if ((tx->first_olinfo_status & E1000_ADVTXD_POTS_TXSM) &&
+        !((tx->ctx[idx].type_tucmd_mlhl & E1000_ADVTXD_TUCMD_L4T_SCTP) ?
+          net_tx_pkt_update_sctp_checksum(tx->tx_pkt) :
+          net_tx_pkt_build_vheader(tx->tx_pkt, false, true, 0))) {
+        return false;
     }
 
     if (tx->first_olinfo_status & E1000_ADVTXD_POTS_IXSM) {
diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index af8f77a3f0..2e5f58b3c9 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -16,6 +16,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/crc32c.h"
 #include "net/eth.h"
 #include "net/checksum.h"
 #include "net/tap.h"
@@ -135,6 +136,23 @@ void net_tx_pkt_update_ip_checksums(struct NetTxPkt *pkt)
                  pkt->virt_hdr.csum_offset, &csum, sizeof(csum));
 }
 
+bool net_tx_pkt_update_sctp_checksum(struct NetTxPkt *pkt)
+{
+    uint32_t csum = 0;
+    struct iovec *pl_start_frag = pkt->vec + NET_TX_PKT_PL_START_FRAG;
+
+    if (iov_from_buf(pl_start_frag, pkt->payload_frags, 8, &csum, sizeof(csum)) < sizeof(csum)) {
+        return false;
+    }
+
+    csum = cpu_to_le32(iov_crc32c(0xffffffff, pl_start_frag, pkt->payload_frags));
+    if (iov_from_buf(pl_start_frag, pkt->payload_frags, 8, &csum, sizeof(csum)) < sizeof(csum)) {
+        return false;
+    }
+
+    return true;
+}
+
 static void net_tx_pkt_calculate_hdr_len(struct NetTxPkt *pkt)
 {
     pkt->hdr_len = pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_len +
-- 
2.40.0


