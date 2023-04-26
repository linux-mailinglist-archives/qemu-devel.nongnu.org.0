Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970AF6EF242
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:40:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcWw-0007fo-LH; Wed, 26 Apr 2023 06:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcWu-0007ew-JJ
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:37:44 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcWs-0002hH-T5
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:37:44 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63b57c49c4cso5719967b3a.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505459; x=1685097459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFx0uWHXmGtU+bW523w2MjKrmNDNNhMu9pkvmW6PJDU=;
 b=R9wNQcPzYcUYfmS0btkHwABAH6tyVWIyZemfPm41jBBYC0ivhmue4a+LywWB6N36A7
 TmswysPI8U8Xr36sAXDEkH/7kGz2jZcTF/w8oW5o9VfPnYliSIkOKKH5OZfTomDaPIYS
 1aBXj828gVGHSHcaDdqlEF2hGLN4c7fZP2YgT+zTrFyb+a2Edt/t67QYxZj4Nl1eZ9gA
 P9xQpce+yru545R4TglHlmzHEfaEx0nCvH0MAPyF7jJNq+5gtxSn5FBX+TxKtjxRNnVZ
 AOQ3s7VPae+fzatYgMiWjXH4Sz8F9MG+NW1bUZSCkikRPqfAxTOHjJBBU/LewQ/6cKC4
 VFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505459; x=1685097459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TFx0uWHXmGtU+bW523w2MjKrmNDNNhMu9pkvmW6PJDU=;
 b=G0elSe/wOuF/HcICtlCp2WCMW1PVP+vKcJtKFPVdgvCz0kBqolnchCXk8sKoEWOWV0
 pb6cLlp6t7PcqGeKZr+5mfEshXjeH3uUKf/lIwxT5zaY6NOkLTwDfvAQbFe7W69vZ0N1
 EgWmPRJIac4crveqUjLlktzSw5Sct4fgHbXi6O6rEGVieBm4v7jyLdEN3rtyIHtHtBmf
 4mENoyJFy8/jIDvIj6FbSZIawZRL9/fzc94ZfhighzLl6FDMWkBWki0QCeX59HTcdwMJ
 pVSOEPzMKlult7j88WJUVJVCz1hbx3STqH+sc7xze+HZ5M5WHel/uYcesOJVhBVQ2wGb
 yo8g==
X-Gm-Message-State: AAQBX9cZLozyV7hziZR4NWTH1Oek0YDu3f1Dbya7qR9iCY8uQgb8Ixye
 +K43pmHDSEEUcKG5tLvHMY75jw==
X-Google-Smtp-Source: AKy350a69RHlKvylHGKYWdkOEAyi70ThdFLk/jEAt6pbYx3rukcSFh9OWXmUrr6RDJSKr1MM8Et4SQ==
X-Received: by 2002:a05:6a20:8f29:b0:f2:813b:ac5c with SMTP id
 b41-20020a056a208f2900b000f2813bac5cmr24108557pzk.21.1682505459497; 
 Wed, 26 Apr 2023 03:37:39 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:37:39 -0700 (PDT)
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
Subject: [PATCH v4 04/48] igb: Fix Rx packet type encoding
Date: Wed, 26 Apr 2023 19:36:32 +0900
Message-Id: <20230426103716.26279-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
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


