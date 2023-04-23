Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A2E6EBCE6
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:23:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRCw-0003hk-3y; Sun, 23 Apr 2023 00:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCp-0003Ce-Uu
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:07 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCo-00011S-6o
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:07 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-24756a12ba0so2356366a91.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223605; x=1684815605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EdeWqV/q8JHODRa34sLM7+dwV7kBQYTP3MfCii3wL/s=;
 b=KF5cKFoW4JbC9LSOeeXxzxoIB7Sd4Bb/nOLI7KkHGXcEZfJ0p77qQJZS9GaPGvGhvf
 TY38OObv1kUPO3EvaG8DdYVgkWl93xPn9iEv+nid9k/YdJVRU2P5pcKT4y/gw7YR2qG2
 O5+5ei4TWJa4udHq1EwJ1GU0aP23bThnF2MrF46f7Jr4dvLzhGGCM39guhgcl8uBt6Sy
 EaWcpRSmrJepmtIY+sBtDxVtk0DaGVHYwP/0aaGJPd/DxpKMKf03vRwzwLou74NYRxFx
 pUiG/xwWNUb/0mJTQ/8DVH3goMS0eYxTTebowqkjL9IeG7V0R7WZ9g2UnG9mZzQvrxNP
 LPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223605; x=1684815605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EdeWqV/q8JHODRa34sLM7+dwV7kBQYTP3MfCii3wL/s=;
 b=ksp+n8LSEo/nEXQkIU41jXqHFy3BkfJSzLK5OfAxbkr2xG5/uyqRchKV/LWptjoQHD
 K/ze+VqSrmxQh8wpFOcuW0hVhJsUsFiS7mxrsKw0lNQ2VmwXO6P7PzxWKuHnyRAhmfew
 wS2eEtMzasuaTJfc0H/CeA85UGqbryCN5d/fbfnf31/6Zvv2540+ZcQPJ1NWtgDBh95S
 TBC+l2e3jsA6ls4nU9mPSNiQxoov1rqh3MAW9SGdoiF75MwknegtbPa9u+TryvleFM7n
 4TRW1SFdqagy9ZrktD5pbglcFm6xhE6MmztAQw5l5WFeP9mq6eghynfs2WTKOE9FnURX
 xk+Q==
X-Gm-Message-State: AAQBX9cFTJHJCq5yXUbi/sXZyheTX2jOce4ckMrMz/dW3KcHkxc7z9NW
 HaJS6pCS4wG++2f862C9dBwIrA==
X-Google-Smtp-Source: AKy350YtVMKvFoHppYB+zhYQaHYirXrIDPD5qau5EL76GdrbCMdOLdLKUkvk84rTfEYyKrMEnbdRlA==
X-Received: by 2002:a17:90a:ad90:b0:247:bd63:c3af with SMTP id
 s16-20020a17090aad9000b00247bd63c3afmr10800007pjq.8.1682223604825; 
 Sat, 22 Apr 2023 21:20:04 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:20:04 -0700 (PDT)
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
Subject: [PATCH v3 24/47] igb: Add more definitions for Tx descriptor
Date: Sun, 23 Apr 2023 13:18:10 +0900
Message-Id: <20230423041833.5302-25-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
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
 hw/net/igb_regs.h | 32 +++++++++++++++++++++++++++-----
 hw/net/igb_core.c |  4 ++--
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index 21ee9a3b2d..eb995d8b2e 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -42,11 +42,6 @@ union e1000_adv_tx_desc {
     } wb;
 };
 
-#define E1000_ADVTXD_DTYP_CTXT  0x00200000 /* Advanced Context Descriptor */
-#define E1000_ADVTXD_DTYP_DATA  0x00300000 /* Advanced Data Descriptor */
-#define E1000_ADVTXD_DCMD_DEXT  0x20000000 /* Descriptor Extension (1=Adv) */
-#define E1000_ADVTXD_DCMD_TSE   0x80000000 /* TCP/UDP Segmentation Enable */
-
 #define E1000_ADVTXD_POTS_IXSM  0x00000100 /* Insert TCP/UDP Checksum */
 #define E1000_ADVTXD_POTS_TXSM  0x00000200 /* Insert TCP/UDP Checksum */
 
@@ -151,6 +146,10 @@ union e1000_adv_rx_desc {
 #define IGB_82576_VF_DEV_ID        0x10CA
 #define IGB_I350_VF_DEV_ID         0x1520
 
+/* VLAN info */
+#define IGB_TX_FLAGS_VLAN_MASK     0xffff0000
+#define IGB_TX_FLAGS_VLAN_SHIFT    16
+
 /* from igb/e1000_82575.h */
 
 #define E1000_MRQC_ENABLE_RSS_MQ            0x00000002
@@ -160,6 +159,29 @@ union e1000_adv_rx_desc {
 #define E1000_MRQC_RSS_FIELD_IPV6_UDP       0x00800000
 #define E1000_MRQC_RSS_FIELD_IPV6_UDP_EX    0x01000000
 
+/* Adv Transmit Descriptor Config Masks */
+#define E1000_ADVTXD_MAC_TSTAMP   0x00080000 /* IEEE1588 Timestamp packet */
+#define E1000_ADVTXD_DTYP_CTXT    0x00200000 /* Advanced Context Descriptor */
+#define E1000_ADVTXD_DTYP_DATA    0x00300000 /* Advanced Data Descriptor */
+#define E1000_ADVTXD_DCMD_EOP     0x01000000 /* End of Packet */
+#define E1000_ADVTXD_DCMD_IFCS    0x02000000 /* Insert FCS (Ethernet CRC) */
+#define E1000_ADVTXD_DCMD_RS      0x08000000 /* Report Status */
+#define E1000_ADVTXD_DCMD_DEXT    0x20000000 /* Descriptor extension (1=Adv) */
+#define E1000_ADVTXD_DCMD_VLE     0x40000000 /* VLAN pkt enable */
+#define E1000_ADVTXD_DCMD_TSE     0x80000000 /* TCP Seg enable */
+#define E1000_ADVTXD_PAYLEN_SHIFT    14 /* Adv desc PAYLEN shift */
+
+#define E1000_ADVTXD_MACLEN_SHIFT    9  /* Adv ctxt desc mac len shift */
+#define E1000_ADVTXD_TUCMD_L4T_UDP 0x00000000  /* L4 Packet TYPE of UDP */
+#define E1000_ADVTXD_TUCMD_IPV4    0x00000400  /* IP Packet Type: 1=IPv4 */
+#define E1000_ADVTXD_TUCMD_L4T_TCP 0x00000800  /* L4 Packet TYPE of TCP */
+#define E1000_ADVTXD_TUCMD_L4T_SCTP 0x00001000 /* L4 packet TYPE of SCTP */
+/* IPSec Encrypt Enable for ESP */
+#define E1000_ADVTXD_L4LEN_SHIFT     8  /* Adv ctxt L4LEN shift */
+#define E1000_ADVTXD_MSS_SHIFT      16  /* Adv ctxt MSS shift */
+/* Adv ctxt IPSec SA IDX mask */
+/* Adv ctxt IPSec ESP len mask */
+
 /* Additional Transmit Descriptor Control definitions */
 #define E1000_TXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Tx Queue */
 
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 4ac7e7af44..5fb2a38a6f 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -418,7 +418,7 @@ igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
 {
     if (tx->first_cmd_type_len & E1000_ADVTXD_DCMD_TSE) {
         uint32_t idx = (tx->first_olinfo_status >> 4) & 1;
-        uint32_t mss = tx->ctx[idx].mss_l4len_idx >> 16;
+        uint32_t mss = tx->ctx[idx].mss_l4len_idx >> E1000_ADVTXD_MSS_SHIFT;
         if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, mss)) {
             return false;
         }
@@ -612,7 +612,7 @@ igb_process_tx_desc(IGBCore *core,
         if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
             idx = (tx->first_olinfo_status >> 4) & 1;
             igb_tx_insert_vlan(core, queue_index, tx,
-                tx->ctx[idx].vlan_macip_lens >> 16,
+                tx->ctx[idx].vlan_macip_lens >> IGB_TX_FLAGS_VLAN_SHIFT,
                 !!(tx->first_cmd_type_len & E1000_TXD_CMD_VLE));
 
             if (igb_tx_pkt_send(core, tx, queue_index)) {
-- 
2.40.0


