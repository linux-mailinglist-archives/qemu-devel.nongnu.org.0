Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58656E226F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:40:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHmU-0003Mr-2t; Fri, 14 Apr 2023 07:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmI-0002li-PJ
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:44 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmF-0001VF-Qd
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:41 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 b2-20020a17090a6e0200b002470b249e59so7287359pjk.4
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472378; x=1684064378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=86mUzgfbKt2MDtMsUC4z3dSk7y3GL2pQfv/qeFgfXvA=;
 b=q4ey54EWShcA+0w0veOKfuiYVDBr9T9N51WxSJ3WJe0Lw8Gcxpe+j5LGObfqwPXo6L
 7I9pCJU67G4AEXuM0MvkBLwSaRQMev10upUQaNta9SC/lLJO34TfPrO4Zu4U+9LBib0K
 W1v2SxuKdkbq7CC0m2/dluma09P7GLDI49SX8eiES+u8BfaQVK7Ix/HbjNa7Yq2i6AYG
 R2Bk9ua5KvDgdj9sYvOVw9gxAy7M+BvflFBxcGmXWXNH0KORt/n27w1F+mg5ABFsm1lH
 bRzM/BxH0wEKRp8H6mgVrf5N/uNj2TQV9lLzFVfkKTciK3k4bz/P/g0nVt1SaywJdl+t
 jyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472378; x=1684064378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=86mUzgfbKt2MDtMsUC4z3dSk7y3GL2pQfv/qeFgfXvA=;
 b=iJoRpLZ6OC+lQawJjhZA571YEebKnEAIPtN1W2nqcGX51n2VAzYkofECwbmQ4C5c54
 dILGs6QC6OMZFGF2/n9DHT1lzewQiDbqfrlThxgUS2aGPRZDBWmgTIwWCg2PrhogDiwE
 N0KCKLw0FdFI/KufkjkvKifcFy/L7cgHZlt8ZgUxHnkYU+QRWM7v/7tyWOktMJic4BBo
 GGpf8EuqLqWQW6qnuvTQzERHacinJND6xNsV0HmpgkIRaRhxP1itc3HIXhUYj/jzFInO
 OMS7o60MR50oo8BeYR8rVKL2jzo4LDPWWek3UeXigegTm1dke7BFGty/DE5lUr1EP0oN
 9hnA==
X-Gm-Message-State: AAQBX9fUMSkHlp9lt7Gf3Ma9o9xrUY2owwM0gPrDT+0usz6vs8hvKYpv
 0mNc8HKZQp5HFcL5tjtA1qXbgQ==
X-Google-Smtp-Source: AKy350YsNOVIlhAARmYmv3BU4O8k7hVt0rfeGySlis8zndNElQjryIDfX0FJaNXz0OHCjhelCaIYrg==
X-Received: by 2002:a17:902:ecc4:b0:1a5:180d:c317 with SMTP id
 a4-20020a170902ecc400b001a5180dc317mr3020649plh.43.1681472377887; 
 Fri, 14 Apr 2023 04:39:37 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:37 -0700 (PDT)
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
Subject: [PATCH 24/40] igb: Fix igb_mac_reg_init alignment
Date: Fri, 14 Apr 2023 20:37:21 +0900
Message-Id: <20230414113737.62803-25-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
 hw/net/igb_core.c | 96 +++++++++++++++++++++++------------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 350462c40c..429b0ebc03 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -4027,54 +4027,54 @@ static const uint32_t igb_mac_reg_init[] = {
     [VMOLR0 ... VMOLR0 + 7] = 0x2600 | E1000_VMOLR_STRCRC,
     [RPLOLR]        = E1000_RPLOLR_STRCRC,
     [RLPML]         = 0x2600,
-    [TXCTL0]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL1]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL2]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL3]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL4]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL5]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL6]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL7]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL8]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL9]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL10]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL11]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL12]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL13]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL14]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL15]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL0]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL1]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL2]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL3]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL4]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL5]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL6]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL7]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL8]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL9]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL10]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL11]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL12]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL13]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL14]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL15]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
 };
 
 static void igb_reset(IGBCore *core, bool sw)
-- 
2.40.0


