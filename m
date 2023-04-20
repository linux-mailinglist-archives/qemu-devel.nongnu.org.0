Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B13A6E89BA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:49:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNAR-00009h-F1; Thu, 20 Apr 2023 01:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAM-0008Sr-9A
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:11 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAJ-0001O5-DZ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:10 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-51b6d0b9430so435513a12.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969744; x=1684561744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHea3rpGiJtRZtnnqKDFEmlRzLO6TtsGKMrgSDo1I98=;
 b=rMDxrSkwuLT+rYkA9KVR6iejSy+ufIPI8lDZEhpnq4qLubVfWLtzxJ9fmgNCSB2KcW
 yV5JWTiH0VvSOXs62JtZf2WmLXe9vawrOJcn8kBObnM1DXOTvUHKou5qyRhVLdUbAfnH
 TsqQjDVaMzR/ngknVXFpxuvoq+1x9uzF5ZAm/eaRWUGeCXvEGIPHYPdZzUB7kPCD1V/u
 PF/UETDKoNYr3IxIflQhJ+Z4zI0nWrbNNwG3ad2eCs/gI4QI2OCt/Ob2gX7G6Ktcdh9T
 r1K4O+BSlYuXs7BYTx/oriv9D5V/5eOACmDUfplZrkxoqGdIFuBZD4lX+lPr6azRLXkm
 SGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969744; x=1684561744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EHea3rpGiJtRZtnnqKDFEmlRzLO6TtsGKMrgSDo1I98=;
 b=c4yGMqLlsu8sMBfN5x+CPECUR9OpIMVPyLdN9gSw97k5GPu+UXe5kcmcs0T9EwxU6J
 U0OPBaic1+j+oILclhDSXhfBrIIl/uFz1vW+7hxBbBzUJZEEp1zy9Kx31OrY3n3BAKGB
 Y8eGNSbbw8wv/M17amfVxblA6xvEtcxkSApJohEN+AvU9uHDzKY0H1cMWqUu/acFq/Di
 Hnyu3Po9NKTCb9GS+cq1OB9GdKu5eXgkUTuLnP7bCHUswM+iOIiNXtfQAXHCOyxk3kHf
 dqvSI9r7qKUNKand1tT/hzT2MjwLDOBc3dgj0itf56X0AMiT0H5Mpot7oW71CoxNVdc0
 B6Lw==
X-Gm-Message-State: AAQBX9cLAbpRYGzdi2x8GxIyLkw136Wf48MG7WJiPgc87jx278rdK/L7
 fbJ/VP+huaMqX9vhLBrVCP/2ng==
X-Google-Smtp-Source: AKy350Zag1sePehsOgTYt+ADo04WVl3mWEmQJ5SHr0qNA5l2z4P4GR87mtE7am5K7weQ71LHcCi5pw==
X-Received: by 2002:a17:90a:2ec6:b0:247:1e13:89be with SMTP id
 h6-20020a17090a2ec600b002471e1389bemr544517pjs.27.1681969744465; 
 Wed, 19 Apr 2023 22:49:04 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:04 -0700 (PDT)
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
Subject: [PATCH v2 25/41] igb: Fix igb_mac_reg_init coding style alignment
Date: Thu, 20 Apr 2023 14:46:41 +0900
Message-Id: <20230420054657.50367-26-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52c.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/igb_core.c | 96 +++++++++++++++++++++++------------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index e23c638899..c24c522244 100644
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


