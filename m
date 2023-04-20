Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBEC6E89E9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:54:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNAv-0002EM-QA; Thu, 20 Apr 2023 01:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAo-0001Xj-29
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:39 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAm-0001Uy-CK
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:37 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1a814fe0ddeso8063325ad.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969772; x=1684561772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lhHRazQ1Xyz5kEvlAe8Bgx9OM5ANAAvESgkitu1uPko=;
 b=H90fVT2SfgqPG+kOaqBaH4ovrZI/4vmMLGtHKZlDL0Bj4es/jcfgPt/R0yrt5ZtSnA
 KytOzbY6pXTXCZ5vua0Pz/Ghhjm4ZtWhACNCoG1TAqiTaRhYaVS78ONX5O+QOPIUI7u0
 fdPaOGj1MVHD3eXHZSGD4bm4F0ZnUwUdxei0pH5vs3Ax42G9rgPXH2qHCT6sZ9jBGS9Z
 duqZoPpuNM33uw+5dr2oXVycXsg6rLej9QQJHeeiBBEqT4A2XqRpNEgPKbAVZhhXqIV/
 kUMWmfaSL2L7SREFj9fSCCf0Rm7g3F8OjcqLbsdUwGtImWy0pBncN4ft3s105X/yAexz
 YnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969772; x=1684561772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lhHRazQ1Xyz5kEvlAe8Bgx9OM5ANAAvESgkitu1uPko=;
 b=YUuRwmxmrGaxTcMVKlQpujnvaCNUP1bh+/SxK4qs8Wl7chZpHLCGYu8nzgWeAxc2dz
 aSNIXCSOTL4qNARVCatEAIznf//h2cj3fWDmXi9lPntLG93E+E/izyUtKGBdJ5cBbidO
 np1JsDUcKpW/z+hJfniGefOLuO3fPG/Wj8slLlfUEozZtcjplcBevo1W2geFKhUNacLN
 Rh9TPayZJEj+HyBEoppUeBVf9CWD2x4ha6oDFGN4G8KBTBdI2pBb0kwJyETsOAd/XE2d
 z+iPTZhW6jzgA5lrD/QUxepggOMq9Sy1Mv6J6luS4dnZtk4DXA/DB+WRa6rz1sEvhhMO
 8iRQ==
X-Gm-Message-State: AAQBX9fzBG0/6khohnN1oK9mZ6UVoVfTf7WotVat/nofDexNiqMCl1Si
 rwAk7jqW3VKu5IKv6J7yBpCJqw==
X-Google-Smtp-Source: AKy350a2filE4g+Fktu46cSWXeAL0CATyxUdRZgJpewqKQTbKvPUvmx6gfVFFrNNkxSKJudTEsesEQ==
X-Received: by 2002:a17:902:ecd0:b0:1a6:8d57:5c0b with SMTP id
 a16-20020a170902ecd000b001a68d575c0bmr367339plh.67.1681969771922; 
 Wed, 19 Apr 2023 22:49:31 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:31 -0700 (PDT)
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
Subject: [PATCH v2 33/41] igb: Implement Tx SCTP CSO
Date: Thu, 20 Apr 2023 14:46:49 +0900
Message-Id: <20230420054657.50367-34-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
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
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index b7f7e765a5..00fd163bf3 100644
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
-- 
2.40.0


