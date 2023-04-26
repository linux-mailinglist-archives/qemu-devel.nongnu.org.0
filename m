Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927496EF236
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:39:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYc-00068J-5t; Wed, 26 Apr 2023 06:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYY-0005i4-IS
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:26 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYX-0003Kp-1V
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:26 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b5c830d5eso5531482b3a.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505564; x=1685097564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YYGEusVh9zHqlKsubKM+jw8dRcawh8Vbu1NCV6xm7qc=;
 b=oV0zU1VMvPH/GhURMTAdNtasYylovaXV31q8LZanPPTAuAFU9kAS8TN47oGgPQXnWH
 BjVVvFhQ3EJWAliOUReD7HBK4torHn7ftUcKk7M+YchiVvrqWu3XrFnoz/NnQPKpY8r8
 rmM9VxqFNOBdAO2Vk/Kwoyvp6lvYH8D1QQQE0t4QC0Tfjv+P9jbg0z1D0COjeiMhTZLE
 Esl0k4PLR/5BJzgLonk8Kuhtdg8Jo5XQyN08B4gQH+X/uGAnqLnvEbiZKJEkpEYofh/t
 SH4njK2Svfs2CmbkXaXu91uL6kc7VpfMXAbvVuJ9/JCyWA74KlUO+XeWVCPeJ3RWRgKJ
 63oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505564; x=1685097564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YYGEusVh9zHqlKsubKM+jw8dRcawh8Vbu1NCV6xm7qc=;
 b=DMHdEmENPBZHoaBuVqiDC1M1E1QHwjGSsAAlWR/cu8LXyXx+ecOWtup3ifJE0ya5H5
 r4eGLqFRUuDQBENl6mLZW8DHWbFJ9Co7ZP2mBDWwhYy0z8IRMEhmKqH8+Rk4ENXhXpFf
 8ukBdtsyxTr8hbRTK+IRhk/ky6UpoRmgrofFdgLST71HpK7CRd/BNUx2aDabsEj/CmwA
 9uzVOwe6PBiHM4erDAM0QkqtuByrZ/1684J52JkADrOm35YGucxEf5plwdzZN9tiACoB
 GYZkjdVX4he2+R0QjIi8g3gELjkdKvSCKDgT3ABtPU1kaCc9Fh2dqT4T2rD+N1hwEYbK
 nzRA==
X-Gm-Message-State: AAQBX9e2uSDXhqmthRsSH+tgx5LWyqiMcx6q3xb2hbEgqcrFxVjffBw9
 AgJXCv6VZFkiTdE7YtKKoY5hZw==
X-Google-Smtp-Source: AKy350a+ws/M7LYf93qTWMZ7E/3BdUr6/tCEVkMqcCcfHt0SHFAZdsqK8T49MFQHCtSxrW6KEYWjlw==
X-Received: by 2002:a05:6a20:9150:b0:f4:4ff5:11ab with SMTP id
 x16-20020a056a20915000b000f44ff511abmr13922652pzc.58.1682505563959; 
 Wed, 26 Apr 2023 03:39:23 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:39:23 -0700 (PDT)
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
Subject: [PATCH v4 34/48] igb: Implement MSI-X single vector mode
Date: Wed, 26 Apr 2023 19:37:02 +0900
Message-Id: <20230426103716.26279-35-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42c.google.com
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
 hw/net/igb_core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index c954369964..6d55b43fb4 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1873,7 +1873,7 @@ igb_update_interrupt_state(IGBCore *core)
 
     icr = core->mac[ICR] & core->mac[IMS];
 
-    if (msix_enabled(core->owner)) {
+    if (core->mac[GPIE] & E1000_GPIE_MSIX_MODE) {
         if (icr) {
             causes = 0;
             if (icr & E1000_ICR_DRSTA) {
@@ -1908,7 +1908,12 @@ igb_update_interrupt_state(IGBCore *core)
         trace_e1000e_irq_pending_interrupts(core->mac[ICR] & core->mac[IMS],
                                             core->mac[ICR], core->mac[IMS]);
 
-        if (msi_enabled(core->owner)) {
+        if (msix_enabled(core->owner)) {
+            if (icr) {
+                trace_e1000e_irq_msix_notify_vec(0);
+                msix_notify(core->owner, 0);
+            }
+        } else if (msi_enabled(core->owner)) {
             if (icr) {
                 msi_notify(core->owner, 0);
             }
-- 
2.40.0


