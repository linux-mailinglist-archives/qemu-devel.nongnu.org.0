Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F9E6A0625
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:26:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8jD-0006DX-Ud; Thu, 23 Feb 2023 05:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jB-0006Af-NU
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:29 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jA-0002Ch-4P
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:29 -0500
Received: by mail-pj1-x1034.google.com with SMTP id u10so12327461pjc.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHclpSWk2JKU9ohNpbqjRIyblKNi65CiMHRdVnsb5nQ=;
 b=e6yJz+w5/ne3mTyTtakFEQjuYzKtsUzQAUXJr9/7/8RFr+r8j4KFY37YwJevtt/ImQ
 E5645om+i4bmeoeoekX8YCVi9ahXAEaawtQ5mexQ8rWsyATJHeHl2zWeMjyYnrctjVwB
 VStHGsxrySet6nfifEhzXow5DIgZ9dBFE9kDL+9bk2zvm8PV5vrz3+d6kfGsuD+qB2fW
 2RZ3T2uOcSb+SEd/dX4Wde1+aoWbFWuT9k6uOS5HJ/JruZx+Z+UD69t9CP6YeslqJ172
 Bx2OzhdDpzl4xVIe64uB7N0H/wU7HtjDbQCXWok4J+Ak5gk8nSpzgfUTbZE7rRy7dzqO
 se0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EHclpSWk2JKU9ohNpbqjRIyblKNi65CiMHRdVnsb5nQ=;
 b=TsPwpOdSjtPjr2xQYxOUYwgTbcPJw3QQiM+kGpt/0887tdODRJnbO0AFCbvdk0WdVs
 BA/q9JC01jXHfPhH/PDkF6u6BCqdFKog38gWHl3oa56bdCHikhEGIMetyK277R/3Oeo2
 27ToOvdXJNEVjW/52RZOJVucCkaWtbNqmx20K5Xr2E6mg2VU/voRBRvruZLJWlZQYU/C
 cumf7u0ZD1yM+c96YcRBYNiuL9VZHoUbZR8mxO42RKuCa+lT6TUhtFmFM3Hu8LzZGsXo
 G0em5sIuD/izM3mceX7N9lCXtFrbKvuwMv8UJaDGuAev+1cFVFVaFnyDI316ZTYpEDof
 EbJg==
X-Gm-Message-State: AO0yUKWBgZ7qEDnuUNN/Xx7nRvbPITLyJTY5aPep2Ph4Ey8dlymsL4QV
 YENQLNpOLQoBS6kZ1OOPykmY/A==
X-Google-Smtp-Source: AK7set9RpFThcxb2ZHirwhYtIzYRVIhuONiND/L6Am3XcXXfcBsYLCkoJM+QtPW8aONXao8bmrd4EQ==
X-Received: by 2002:a17:903:786:b0:19a:8338:703b with SMTP id
 kn6-20020a170903078600b0019a8338703bmr9417853plb.57.1677147686935; 
 Thu, 23 Feb 2023 02:21:26 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:21:26 -0800 (PST)
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
Subject: [PATCH v6 13/34] e1000e: Improve software reset
Date: Thu, 23 Feb 2023 19:19:57 +0900
Message-Id: <20230223102018.141748-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1034.google.com
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


