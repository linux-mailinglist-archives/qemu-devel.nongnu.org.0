Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945B2680F64
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:52:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUW5-00048I-Ra; Mon, 30 Jan 2023 08:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVy-00046I-Nr
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:06 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVv-0003aY-Sq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:06 -0500
Received: by mail-pl1-x635.google.com with SMTP id 5so11675646plo.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHclpSWk2JKU9ohNpbqjRIyblKNi65CiMHRdVnsb5nQ=;
 b=7CGU6XkOSGt7ndxJuP+Ge45LX6YmZiOoGi3lYcJCjD7PY7oBAHPWLmKmi7vxp2HAvQ
 feaRoQ/UBWeXo/l2t1KvFBCwQpTd+4LsaaerD5Qh1gHHkfEL4nHH06JlSFXrv5wGVTqn
 abnEwr7CxCci+M5SSix+bq/JBsgj0k84vOAjigEFSBhbVDk4ATY2I0RBvcpSFG6z1+Yb
 hUqHYuyJQDarf25ZMokxN67bvZ2N2PCGc7NGbjv7b7aELu54RHYGxxEYgoz+NIBDeT8O
 DkaGVp02s8brL1hk7cW7XZEVPvFwSU3wdqC/uUVQu9o3u32OZxSG8rY4oQXaO5BWdDfo
 WHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EHclpSWk2JKU9ohNpbqjRIyblKNi65CiMHRdVnsb5nQ=;
 b=iwxzkXS3RfLshY5q7e/mrYU768f747NIAht+91f4Q7ri2+hVF1FF6mkaVtn9fxB5z2
 V0pOCeJ8JsK+hBLDJUS0dV8Y3LeBcbZQGq2gn2N6agm5faa/qZSBpubj4Pgr2jynZrRE
 HCn9NHUs6pPEB2QM2LRGEDa/84IzJcgbzZnHXCUFgW4gRFGRfeSeIi88nPcOftdu5tr1
 RiW343qwZLJShxagIIxZgUglJqOmrOab9K0Euzg7MMreydT+hjjS+v6zdKCLGd7zqsQZ
 jBXefdBu5G098BCX290OndbU4WnwNv5wjj51wWvYr6psRY2e/jmJBkm/XJra+FHkqfJH
 Jwpw==
X-Gm-Message-State: AFqh2kqmEQwdOJANxzR9VbsDnoEDobWdtXa2QOhsP2ovm69+xmKDrCNE
 zRlEBLTwNS+edKrRQal1So7QzQ==
X-Google-Smtp-Source: AMrXdXtYLJ4Y1TXsE8pTs9ojzy9SIkV5NBNZ7W/P/rajhi6vxZGSuEj4IIRfIA7JyohgKTPdYkkUnQ==
X-Received: by 2002:a17:902:ccc1:b0:194:7d25:cb78 with SMTP id
 z1-20020a170902ccc100b001947d25cb78mr56077078ple.46.1675086483091; 
 Mon, 30 Jan 2023 05:48:03 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:48:02 -0800 (PST)
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
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 12/28] e1000e: Improve software reset
Date: Mon, 30 Jan 2023 22:46:59 +0900
Message-Id: <20230130134715.76604-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130134715.76604-1-akihiko.odaki@daynix.com>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
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
2.39.1


