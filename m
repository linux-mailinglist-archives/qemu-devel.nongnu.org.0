Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2866B6E2296
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:49:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHop-0005yk-KV; Fri, 14 Apr 2023 07:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmx-0004jB-72
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:31 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmj-0001rc-4L
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:14 -0400
Received: by mail-pj1-x1035.google.com with SMTP id w11so18580928pjh.5
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472407; x=1684064407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/C/a5KoeOeEM3rKXy5Coa0KaU37snP3P3wPXSFVvgxs=;
 b=TsqSjRISsQdxZfQ9cYBpjMk+zsUPX/IhINICA7t6IkmBX5IObMJMuCW/KYz9WmoB7y
 1UXkhOSF+btxCTioU4dRU1qXSoC0voTsMsqzdKvJwSjnAV2gv2ua1OKBrj7NHRILLwFV
 AQXq84cU8YlmnJZWEsKbYUk0eszGOSdbDo45kktQptYvhnrDZJLGuAFUgIJRCnTKlYgT
 WLa2Jkxl4Zm6X0hJUMd0q7bxCSSfh3D9uiukT2BZPYlhKHHQSnZ+PuMA4RhpZFASKt+3
 RBiWJ3H0UPsAR6m1TkqFmoKNGTVaKQ2d3/ZrYniK/0aGhD0IHCUfh+7NKL9RW/WYOMQL
 zW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472407; x=1684064407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/C/a5KoeOeEM3rKXy5Coa0KaU37snP3P3wPXSFVvgxs=;
 b=bnbYNE9BhDsdKYZmfATD3bHTUeuv8krfqcrus8OsFGhn+O7rq858XmE0xO68qlh8tX
 jiFQKPYwfgqSicgy0+AFyUCi9NAmx3exdc0oB6fcmNn2PasLzxs0n2c8DUUZCrQkNVuD
 gqFXxeeD+wtlc0XavEvDT5Lxw8IaVRmgWoeCSiciJ3c34BCBO/2PQP1eVqvKoin4tWWH
 Uu4zXZ6//rQ9xlebge6mlDKAP58gCzaGOTXkabSH3gdWOiXDdoWN7dFCD/bKGRGqqn3h
 cbNn8k3XZW/ApouTtSK3PaCAn/+y4LCJC5NaG4uLkTWoSU/W9cQVKxEKFlG/SgPNJWKq
 RvRQ==
X-Gm-Message-State: AAQBX9cPYsQV2ceaJ6Kyb39OpRsvIkSBhCOLh+1q7vo0IBRIWbeF1nqq
 ZwjpV3re/qZDUzSfCE1iZHo5YQ==
X-Google-Smtp-Source: AKy350YvboZ+mhTv1dpPZd2L2dAHqqlZ187W4p/HnrvR/7Y6uOuI02eYn6xNOVDBOGes/sNr97ddbg==
X-Received: by 2002:a17:902:e802:b0:1a5:167e:f482 with SMTP id
 u2-20020a170902e80200b001a5167ef482mr3150887plg.20.1681472407475; 
 Fri, 14 Apr 2023 04:40:07 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:40:07 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 33/40] igb: Implement Tx SCTP CSO
Date: Fri, 14 Apr 2023 20:37:30 +0900
Message-Id: <20230414113737.62803-34-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
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
 hw/net/igb_core.c   | 12 +++++++-----
 hw/net/net_tx_pkt.c | 18 ++++++++++++++++++
 hw/net/net_tx_pkt.h |  8 ++++++++
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 0e1b681613..955db1b1dc 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -432,8 +432,9 @@ igb_tx_insert_vlan(IGBCore *core, uint16_t qn, struct igb_tx *tx,
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
@@ -444,10 +445,11 @@ igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
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
diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index f5cd44da6f..fc00d7941d 100644
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
-- 
2.40.0


