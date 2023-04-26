Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880BA6EF24A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:41:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYm-0007GO-TL; Wed, 26 Apr 2023 06:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYj-00077a-AP
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:37 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYh-0003ME-Fp
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:36 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-63b57c49c4cso5721228b3a.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505574; x=1685097574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6M3XBA2ZnKRrmKvfDf9nkh3S989gOSnRI0c+3tpxFkM=;
 b=fhcfhEGXjLN3fUHeV13/EvfqIgcOkJt4fx5xSdGIpgC+qvRYNwR7yxWmT9TmZ/HRoZ
 jmdEFKatI1KFbzutUKSv4snfwage8GIf2JOOD0od9LwnZ632JEB9eFeKCaRU2q8cobUk
 4vwywpWLCR0B5Cm9C2SOX1DGcIAc2svR1CFCC9m0kzUt+QIYA4jOCdPWwd0BEh2qYF6M
 zAfIe/rRnUaN9Kb6PxVOQ9ZuuRLTeuM5mFui4vSxE08eNErcuoMuFM5HfFwy6bWVTPSd
 E/dRwQGDrOB0DH9fvo1LYL9aPX2cCsX0I3jsHDgnO8kaZV8b5plN8VRNQ5yMIOZoOapU
 f9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505574; x=1685097574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6M3XBA2ZnKRrmKvfDf9nkh3S989gOSnRI0c+3tpxFkM=;
 b=elD0BeXjLigewM/yaqB3PxVzqjEfnv7VEDcJUrueJCiPlwiNKrLsii/vum2rb1uAIl
 waLRaEc6M2rbb+uVnOf7cPILiRFFuNRB9Ky7JlJ6amfQ67+VN8oS04UjBWAfx/auglWq
 eM7EPeHHPh3S0UvIx+PY9DqnQ38o4jMg0EchJaLRklxipiUNPY92etjlWpzJCDL9uckM
 YfThwaHHx9c3dbtjcv5+nCvwC5HbZvIVZw+aW3WwnKm92x4++SoR3WF+tUqgopQFLvrb
 lHxflYWfSfJoAuI5+hF6FeLweiaT5P1fifbSrZFyhLnSJeza2NTMtfIcjdYjiOA2LWh9
 pZzw==
X-Gm-Message-State: AC+VfDzMEYY9pV8zOSrY7Wyw+cZ7r4qXhUEPjjGYtqAA7VcFfGqj1B05
 UXTMIvB/6/tnCdNfCSc/nQ7Nxg==
X-Google-Smtp-Source: ACHHUZ4H1sXD5GINkuDhYMOY/Wr+7tW5euIIiXvWxermW3XRYhaWw/BobTE1H0GTZfuiUsS5MNjrrg==
X-Received: by 2002:a05:6a21:587:b0:f4:7cbd:c236 with SMTP id
 lw7-20020a056a21058700b000f47cbdc236mr154187pzb.54.1682505574445; 
 Wed, 26 Apr 2023 03:39:34 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:39:34 -0700 (PDT)
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
Subject: [PATCH v4 37/48] igb: Implement Tx SCTP CSO
Date: Wed, 26 Apr 2023 19:37:05 +0900
Message-Id: <20230426103716.26279-38-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x434.google.com
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
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
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
index 95d46d6e6d..5eacf1cd8c 100644
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


