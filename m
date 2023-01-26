Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B7367C912
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:50:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKznw-00043R-HV; Thu, 26 Jan 2023 05:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznT-0002r3-Oh
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:00 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznQ-0005YW-HN
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:47:57 -0500
Received: by mail-pl1-x631.google.com with SMTP id d9so1465910pll.9
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VWqHO+rRahXUGWAQnJsH+iI5jUXWsg5ZhWUH3RvHdms=;
 b=XjERjA2e7je4Yt4UBgGawu3Cn2pS3d/5Mjk69PkWpj09Cz+SoK8TnQzvgUGe+gFpbh
 w99YShk5SonLurQwtBvIEEroKRDl9mgbiadIltaTN3Davc+G9WEfkTPvrx2eCEgXt3kI
 fcFhETpQzIwL9gRKYzGBAe+SlLiMjZ02wBhwNctp0gszszkYnfNw1GRBa8wVYxBnsUdf
 i9XfAl3RK1OpJtAGEu2CAJJXpiPLLJo8QhS2uDQNP1U7n9KINLZZWsV49U3xD53Bnvfd
 2mvlo8nyY9IhA/SnJ67gXnaF9fz9dkW3EShVsB63lirh0wo3l8zkbZFUdGG7Xgr+WGpr
 j6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VWqHO+rRahXUGWAQnJsH+iI5jUXWsg5ZhWUH3RvHdms=;
 b=lIJIX3HeOx+QCSQ6oUX0xRtszknw1F4KMFSXaw0/0UmZQs7BzlV241jC0bmQE8aoHF
 Ldrqabw0SNbRFOQ4YZvy8Bj1EmApT3swhrLpoaMBBj48QXIeULXWRMyONQJ6JZDI5Agr
 0/PFNIIGy5JlZPf4irayDejnze/xOQkM6Mux4OOTNb2aAc7IJZIRX+r9sAWk1c1p4glN
 dEvqsl5sce1akzltldJlmB9m9SDqjFTrt1JStysASHNBx/wW4pM2UGtXI+wcPIVEVj7w
 xG8gvqUGncRh27DwLPH4ss0EHn1KaWtreJjeHriVHEyx+YFoz8u+e6lHDNRrBb9wUHFy
 wRrA==
X-Gm-Message-State: AFqh2kpvXUypMQe5IB1buSx8yFY6XJLwQyamCDT3d+2LGZYZMPOF3dqr
 /WxOJbATcVXDuV9mUTKuNW5/i4pDiQXJ4XKT
X-Google-Smtp-Source: AMrXdXtnQ+yD9ddHrAEkCJHQUcLqNjFXiHSRjRvckJRIEKAFjl/7v3vGPwQsJkiR+EPHX4Y41X97+w==
X-Received: by 2002:a05:6a20:94cd:b0:ad:67fa:8e50 with SMTP id
 ht13-20020a056a2094cd00b000ad67fa8e50mr32141928pzb.57.1674730075310; 
 Thu, 26 Jan 2023 02:47:55 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm496789pgo.70.2023.01.26.02.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:47:54 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 12/26] e1000e: Improve software reset
Date: Thu, 26 Jan 2023 19:46:51 +0900
Message-Id: <20230126104705.35023-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126104705.35023-1-akihiko.odaki@daynix.com>
References: <20230126104705.35023-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
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


