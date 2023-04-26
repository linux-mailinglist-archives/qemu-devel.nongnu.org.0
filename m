Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E7A6EF278
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:44:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcY8-0002pV-N4; Wed, 26 Apr 2023 06:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcY0-0002lV-8F
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:52 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXy-0003GD-K5
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:52 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-63b7588005fso5790308b3a.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505529; x=1685097529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UD3tok/robUh/ITv/zdjm3SWmSNjhXL/rVRQIfCxUtc=;
 b=s/Xny+XTZjSArmCn+hiZKkjcMsNn5rn1OKOBfa4jo2TLNnxIBrwF0/DHllqR5RV23y
 4r+1wMr/nTDPcGPW+FjuTtlxvRU19yOat+5U5AcfA7iYZdoQ3YEog0IF14GQW2BTBc50
 B+WGwn9Hpd2TTvsu4ybQqQgGfGgs9bjQWCiPfrrOVLIZtGuvBblPplL1IIjTVIMxOVg7
 o9f7dt3MRvZMYYycV8f4DiaIm4bFfwsieG4hOf/0QuMB25l6DOThyILTXZbynMnBz8w+
 Yr+bUPLZ6UuPtqTTYM3Nwsbc4iB3t10PUYbBCq77H6FNgEoy56l92DV9c1/un7sWI+vs
 ifLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505529; x=1685097529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UD3tok/robUh/ITv/zdjm3SWmSNjhXL/rVRQIfCxUtc=;
 b=bI7Q9LDywl14o5Tded7po3QzyYo+znuHMzZFBAws83Dky+wXgirAhYjNX68opdrB3q
 Syl1a3AsQPIgZCQ0+CfQmXh4iMdz58KX0AXyUU+gXDOkOT6F79ceP19LpFtYqZe2PxB8
 +hS/67Pr7lxlW7+YVC3xIX3LRbbb9ScOSufRjmVZCaCtzNm/wqywNr56gf7YAmBe8VRy
 mZXeHQIkQP/zOH+CLNWVG5gO8/1iTcwiBuMkxwy5dzc3tDvLyhbzE9J/S2M69/PQaw4g
 qUYfOHQ0Hj87ixsjaTntiLnF3HF+gtzPGNL8QEtk+t9L4uKRfBbCK5bojqvkcPX1QT4M
 ispA==
X-Gm-Message-State: AAQBX9dEmf8ewK8g5E7i71mwxRb5Q3zLKP1tYrAbLE+ytyyJtKGHZjI8
 zRtBRIYeGSlTWKGywNeyGYeFSA==
X-Google-Smtp-Source: AKy350ayrDYfESgh2nHX7qFzmPaY3a7wR/Jw6nOU0fk3VQVCxLRdM6E2mfsp4Zh8sBbi+etDjoer+g==
X-Received: by 2002:a05:6a00:1988:b0:63d:3a32:7407 with SMTP id
 d8-20020a056a00198800b0063d3a327407mr28404758pfl.16.1682505529062; 
 Wed, 26 Apr 2023 03:38:49 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:48 -0700 (PDT)
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
Subject: [PATCH v4 24/48] igb: Add more definitions for Tx descriptor
Date: Wed, 26 Apr 2023 19:36:52 +0900
Message-Id: <20230426103716.26279-25-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x429.google.com
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
index 162ef26789..56a53872cf 100644
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


