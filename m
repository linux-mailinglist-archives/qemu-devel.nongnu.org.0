Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC236E226C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:40:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHmP-0003Da-7m; Fri, 14 Apr 2023 07:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmA-0002ae-TQ
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:36 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHm8-0001UJ-Ey
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:34 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 c10-20020a17090abf0a00b0023d1bbd9f9eso21364711pjs.0
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472371; x=1684064371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KdcxfKN/J65417H793s7q+fei8H0pQ2z9x/1WzA/BTE=;
 b=wbdKZfHe9PHiKL/cAmiZKVQF9vA4j5EiBf9BO0+TQWTw00nWk6ycglRywA1MVv6B/2
 LaXZkAJjn/Ke/drtN6IT0m3GsltHlMW5NFSCSdXUuAohgnWvdueoJfIs8wSq1vd8NBgY
 JwvdOAw9neNk5plWO0aEBlxzlwWIrePnQ1uNyLr9HgY9MFXC1adOw5SrIuYRv/x3VEjF
 ZJQ7pfnOyHpHX9gYuCjM+L5tj8maje9jGH5X4axNWZ1aeQFHLgGAgDHlKM+kqMfNLtFu
 rKnIGYtiGVntZsz0fYY9zuUjRxPir4r1fp7SpQ9GZkC6CyPSYEXWCT4de4aJk88cjkYy
 eETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472371; x=1684064371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KdcxfKN/J65417H793s7q+fei8H0pQ2z9x/1WzA/BTE=;
 b=PlcaNjmo/21+deMFaQEZgvhXD9A0JgVLEDkfSfIoKS1RPgQHreNVE+NUqhyCVKKh0b
 ECmXhwc+yhU3CuvzKZjX+7RSYdA3oDG5xeWyXm656d4fgJF9UKyvCGXdpvDgjB+wz3uI
 2Wr/XKjlwkGlb9pGkgSNBlnRT1mhfAUt46wpyBILIXH+nAwfzGPrrpOHpJN98rmqgHEv
 PJceC0gcYNHYmklyn40ErV9GKUSBYV//9XvrlvntrI6aj2FIadBiLEseziq7W9y2MueR
 VTeLNjWazbdGiKyJWUazWILaKYdc0/BVnTV0h64XQLL9Z0yE4mQ4dg5L+4m+3QeEms5e
 MWsQ==
X-Gm-Message-State: AAQBX9fAKSoZUa53wyXP0gSzIZRWo0yVpN8esSunUR2ntyvwuXOVdBR8
 O6/H/YHbCPJraewQJphpEWASmw==
X-Google-Smtp-Source: AKy350aqnTnCr/DjunN9/W5e9KzDneppjLH3WLRX9XxhQi40UWAFL8xubBdBn/LzYZhK8nq6JbJMQw==
X-Received: by 2002:a17:902:ac90:b0:19e:675b:a40f with SMTP id
 h16-20020a170902ac9000b0019e675ba40fmr2375465plr.8.1681472371316; 
 Fri, 14 Apr 2023 04:39:31 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:31 -0700 (PDT)
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
Subject: [PATCH 22/40] igb: Add more definitions for Tx descriptor
Date: Fri, 14 Apr 2023 20:37:19 +0900
Message-Id: <20230414113737.62803-23-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
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
 hw/net/igb_core.c |  2 +-
 hw/net/igb_regs.h | 32 +++++++++++++++++++++++++++-----
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index e5a7021c0e..350462c40c 100644
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
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index c5c5b3c3b8..22ce909173 100644
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
 
-- 
2.40.0


