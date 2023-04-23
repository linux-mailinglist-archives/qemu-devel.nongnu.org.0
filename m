Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E76EBCD1
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:20:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRBl-0001oo-NM; Sun, 23 Apr 2023 00:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRBj-0001oL-Fm
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:18:59 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRBh-0000kI-U4
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:18:59 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1a80d827179so28944655ad.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223536; x=1684815536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFx0uWHXmGtU+bW523w2MjKrmNDNNhMu9pkvmW6PJDU=;
 b=KCCYOjnEGqBZbr56g2k0G/Z3xmFM8UcegJ86oJQ7apQWMK4eLwgNbT91PsSvo5V4GV
 6SYXizS8lSZp0UK7m8lAe1ZSyVo5mYrJtHnqOMahWpNeLFAZnCAZi9l105f8toflDdyI
 dwiBV6AryFtgkszAx8X5oqhv2VkXjD4cLrEKVWaTkWMdtwVzAtWfrMb5lIBV8FVOk2g0
 TCdD1DUYPveFXOFmbqfSxkOchx6MDM/4tepXd8vuBCJoCWcnchyxfEIV6rATi+bOiTwm
 HxvJZf3+BXxJTRMSTPVHdNgBvjxjxT6+1wilq8rBQPD9PgMqHx4iWSKvl+0K9cv0z8gZ
 gYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223536; x=1684815536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TFx0uWHXmGtU+bW523w2MjKrmNDNNhMu9pkvmW6PJDU=;
 b=bneJmx1Lu6SPlxe184EesU5cVw0pHodyC3WuS1phvGBQvvps22NsU9LbpIMnjgboOt
 gQLs0lDJHuqHAp2L3tAralQpaaItza2SpoQStRPAmUyU1P9ogliJBNG6LGh1/QnJTy2j
 dGNOSoovJ4w2ZZoXNzl4Qh39+c19ROImrHfgzwy91yxpLgo76YPtctVoRhx4cWciXsHw
 wrdZbqZIE8OZq6CZ/JoCIgW6D24lpbC2fijL0Pv6cqnW10zFP4vigpOAa6t+MKTg02pA
 V5PZsI0e2VLdXpAB4dsIyTYd0LoGjYh/eHH34HtMH/ijdIip4MJns0+cn5Tx5Hs/bhJ7
 1rEw==
X-Gm-Message-State: AAQBX9ejg9/xOSpoXcKkI8q1ovkoiBWw1v7YFZc1fZ98nUeOJ0WZRbtl
 WVhJgDQvIhtzGHBoBaMvqGKh/PZdV86NubJrBKo=
X-Google-Smtp-Source: AKy350aH9rgi1IEje1ZSFWe6R8FnKPaEz08e++RmmpwzWu+CXONexp8COvFMlp58ABfr/2nxQY2XHA==
X-Received: by 2002:a17:903:1c9:b0:1a9:5f3e:e3bb with SMTP id
 e9-20020a17090301c900b001a95f3ee3bbmr4426003plh.2.1682223536776; 
 Sat, 22 Apr 2023 21:18:56 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:18:56 -0700 (PDT)
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
Subject: [PATCH v3 04/47] igb: Fix Rx packet type encoding
Date: Sun, 23 Apr 2023 13:17:50 +0900
Message-Id: <20230423041833.5302-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
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

igb's advanced descriptor uses a packet type encoding different from
one used in e1000e's extended descriptor. Fix the logic to encode
Rx packet type accordingly.

Fixes: 3a977deebe ("Intrdocue igb device emulation")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_regs.h |  5 +++++
 hw/net/igb_core.c | 38 +++++++++++++++++++-------------------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index c5c5b3c3b8..21ee9a3b2d 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -641,6 +641,11 @@ union e1000_adv_rx_desc {
 
 #define E1000_STATUS_NUM_VFS_SHIFT 14
 
+#define E1000_ADVRXD_PKT_IP4 BIT(4)
+#define E1000_ADVRXD_PKT_IP6 BIT(6)
+#define E1000_ADVRXD_PKT_TCP BIT(8)
+#define E1000_ADVRXD_PKT_UDP BIT(9)
+
 static inline uint8_t igb_ivar_entry_rx(uint8_t i)
 {
     return i < 8 ? i * 4 : (i - 8) * 4 + 2;
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 464a41d0aa..dbd1192a8e 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1227,7 +1227,6 @@ igb_build_rx_metadata(IGBCore *core,
     struct virtio_net_hdr *vhdr;
     bool hasip4, hasip6;
     EthL4HdrProto l4hdr_proto;
-    uint32_t pkt_type;
 
     *status_flags = E1000_RXD_STAT_DD;
 
@@ -1266,28 +1265,29 @@ igb_build_rx_metadata(IGBCore *core,
         trace_e1000e_rx_metadata_ack();
     }
 
-    if (hasip6 && (core->mac[RFCTL] & E1000_RFCTL_IPV6_DIS)) {
-        trace_e1000e_rx_metadata_ipv6_filtering_disabled();
-        pkt_type = E1000_RXD_PKT_MAC;
-    } else if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP ||
-               l4hdr_proto == ETH_L4_HDR_PROTO_UDP) {
-        pkt_type = hasip4 ? E1000_RXD_PKT_IP4_XDP : E1000_RXD_PKT_IP6_XDP;
-    } else if (hasip4 || hasip6) {
-        pkt_type = hasip4 ? E1000_RXD_PKT_IP4 : E1000_RXD_PKT_IP6;
-    } else {
-        pkt_type = E1000_RXD_PKT_MAC;
-    }
+    if (pkt_info) {
+        *pkt_info = rss_info->enabled ? rss_info->type : 0;
 
-    trace_e1000e_rx_metadata_pkt_type(pkt_type);
+        if (hasip4) {
+            *pkt_info |= E1000_ADVRXD_PKT_IP4;
+        }
 
-    if (pkt_info) {
-        if (rss_info->enabled) {
-            *pkt_info = rss_info->type;
+        if (hasip6) {
+            *pkt_info |= E1000_ADVRXD_PKT_IP6;
         }
 
-        *pkt_info |= (pkt_type << 4);
-    } else {
-        *status_flags |= E1000_RXD_PKT_TYPE(pkt_type);
+        switch (l4hdr_proto) {
+        case ETH_L4_HDR_PROTO_TCP:
+            *pkt_info |= E1000_ADVRXD_PKT_TCP;
+            break;
+
+        case ETH_L4_HDR_PROTO_UDP:
+            *pkt_info |= E1000_ADVRXD_PKT_UDP;
+            break;
+
+        default:
+            break;
+        }
     }
 
     if (hdr_info) {
-- 
2.40.0


