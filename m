Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DFF678F46
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:34:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAz5-0002ib-1M; Mon, 23 Jan 2023 23:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAz2-0002hw-Sw
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:32 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAz1-0002SO-0q
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:32 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso771794pjj.1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VWqHO+rRahXUGWAQnJsH+iI5jUXWsg5ZhWUH3RvHdms=;
 b=h8kSWldfVHoXsQ6M1ocNcxOmA8FsbictoWOKpmrQrafi1M2Lvk6JUFLzQu7wnlgrFn
 ScNiAB1/fHNncIl1jExVijOBWiY+O5vEaGHUueyMjchVpVEdijhXBInig5Jq3HEjoYgi
 PGZ+bo4o/1ARSvF0xQaIiwM2WJ/nrXFy/PMEqITwqWUYbN7FDpho2L7Um2nFRcgHxW7s
 t5F1HlmWzZh3yJsIcW1MAplCEmhbQAQP4AjfnEJMg9MeDLDbNjfO1r1a90HPj7WBy4NM
 w0TlC+aJLqEG9SH3F1TnfaKAlJ+SXScQubiKsMDysIG4CcuFNbQ1gNsfzgtmBtxaj5ha
 OAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VWqHO+rRahXUGWAQnJsH+iI5jUXWsg5ZhWUH3RvHdms=;
 b=oo3pZmkzie3PapzCZyWKr0eRvVq3PSWMFes4OB/Ra/lOZcQytdCKLXGxvR+690WiNI
 m8hHve2+QR3vyNdzkwc+O1+BRbzB1Gq2hoVrSpLp3oYr2WsR3VhN01XZiz8M4tfMg4Lk
 PvbjP2C9WHVCEVx7KVacbXj/Rt7oUYggqETdHv9J4tHhor/ForW4Tr/JQjBXv7Bekpew
 e0et3yd6oD4FFC2woDPTMtcsPP5/01sPoG+diZg7woL/PsIvVvq4+Oc9Qmb9+KR4VcPi
 pWr6mSE/JWletCwrL0ZXIDHv2XtrmpHNmFsyR5BKHa1CfqHcjt2SGbDudWoOABkjMnm9
 8/2A==
X-Gm-Message-State: AFqh2kp8Sn1ya5CDd/9G4u1A7Etfg/t4QRGlRq04Nz2rGkj1NVHtLGlF
 gdLoJgtnOUmjRItJOQoB1sHLWQ==
X-Google-Smtp-Source: AMrXdXvYIGNaYlWJlE7kqFiC17dYU6Xmu52lb6FGDb/OWfqPgoSR9Noc1Bzk+B6dtMG8Qmc4g32LGA==
X-Received: by 2002:a17:902:d2cd:b0:195:e457:341a with SMTP id
 n13-20020a170902d2cd00b00195e457341amr20018654plc.4.1674534749765; 
 Mon, 23 Jan 2023 20:32:29 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:32:29 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 12/26] e1000e: Improve software reset
Date: Tue, 24 Jan 2023 13:31:29 +0900
Message-Id: <20230124043143.5515-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This change makes e1000e reset more things when software reset was
triggered. Some registers are exempted from software reset in the
datasheet and this change also implements the behavior accordingly.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 37aec6a970..b8670662c8 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -58,6 +58,8 @@
 static inline void
 e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val);
 
+static void e1000e_reset(E1000ECore *core, bool sw);
+
 static inline void
 e1000e_process_ts_option(E1000ECore *core, struct e1000_tx_desc *dp)
 {
@@ -1882,7 +1884,7 @@ e1000e_set_ctrl(E1000ECore *core, int index, uint32_t val)
 
     if (val & E1000_CTRL_RST) {
         trace_e1000e_core_ctrl_sw_reset();
-        e1000x_reset_mac_addr(core->owner_nic, core->mac, core->permanent_mac);
+        e1000e_reset(core, true);
     }
 
     if (val & E1000_CTRL_PHY_RST) {
@@ -3488,8 +3490,7 @@ static const uint32_t e1000e_mac_reg_init[] = {
     [EITR...EITR + E1000E_MSIX_VEC_NUM - 1] = E1000E_MIN_XITR,
 };
 
-void
-e1000e_core_reset(E1000ECore *core)
+static void e1000e_reset(E1000ECore *core, bool sw)
 {
     int i;
 
@@ -3499,8 +3500,15 @@ e1000e_core_reset(E1000ECore *core)
 
     memset(core->phy, 0, sizeof core->phy);
     memcpy(core->phy, e1000e_phy_reg_init, sizeof e1000e_phy_reg_init);
-    memset(core->mac, 0, sizeof core->mac);
-    memcpy(core->mac, e1000e_mac_reg_init, sizeof e1000e_mac_reg_init);
+
+    for (i = 0; i < E1000E_MAC_SIZE; i++) {
+        if (sw && (i == PBA || i == PBS || i == FLA)) {
+            continue;
+        }
+
+        core->mac[i] = i < ARRAY_SIZE(e1000e_mac_reg_init) ?
+                       e1000e_mac_reg_init[i] : 0;
+    }
 
     core->rxbuf_min_shift = 1 + E1000_RING_DESC_LEN_SHIFT;
 
@@ -3517,6 +3525,12 @@ e1000e_core_reset(E1000ECore *core)
     }
 }
 
+void
+e1000e_core_reset(E1000ECore *core)
+{
+    e1000e_reset(core, false);
+}
+
 void e1000e_core_pre_save(E1000ECore *core)
 {
     int i;
-- 
2.39.0


