Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3E26EBCF9
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:26:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRDf-0005sk-O6; Sun, 23 Apr 2023 00:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDN-0004u5-UY
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:44 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDL-0001JZ-MH
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:40 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-63d4595d60fso21524380b3a.0
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223638; x=1684815638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LKJLr9o8J2GVfyrdFgQsY8r3zTBN5mxmP1a2nA1FkQU=;
 b=u58n41MRqaPvsVGjgZ/hjr8oj+Ho34MapB8XGbAfSseCtDR25uVXqMXlN7LkdlafAH
 5UZ2OAiaZyEeaBkBDKFUPiofiFUNM1ucRrSI7Fbixn/aa/fO9qQlSSwf6ZpnlcwjcCvA
 dHEPrs4ia0ABdPiXoaZCy0rYsm6oFMr9wIUhcuVlaf86OB0T+Zd0vJtmXJ/NSuNPQJlE
 ggpL8ar2zVUjeW6GARXQeO+LZTaDSzcIWJnvAXWO1bR6sXBQ8uwnJ2uYWtRfeV65P/hX
 jKz8TVx4HVBMi9GCAo0a1vjevZiYh2Hx5xRkvFAkGGiRMMbyYh3av4lb5L9C/Vt0ZQ56
 QJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223638; x=1684815638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LKJLr9o8J2GVfyrdFgQsY8r3zTBN5mxmP1a2nA1FkQU=;
 b=bEJ4RQbV32Jl64a13yf0W/bCKTIslUWeTnzlYLkkCXe2Kw8Ub+CYvJAJEEE/Zs/RXY
 wWaW3i+Q98yMIh1nJY32poE3UDqKZA/7fmDboNmV9T3zRS18fakI7qnt5FuCr/GMB9eh
 aqq3feGFGwjAFPwGfKHMNvKiVXQjiOlTd5sswhysMP3U/Pgu+CP1Box2vDEd+6+EoY+k
 SqnHtb3no+ZApNbWTjXNqrncl/lvwZcRjfR1a1c1Xmc7lu/I01GFssxhEtRuVZJ6ncar
 aBFBHvQR8xpBHapF0K78gq6yJmemZPtC5Fzfnqdl1uOrMuMyOjkNrHcYg10VJrRPBbLD
 Sl7Q==
X-Gm-Message-State: AAQBX9ctrpy+6nPpOG3B6nAWDTXVTSxcyguArU+6G5ghfDwHPh7dmJQO
 S66S5EMbMxtKn8+0Lpl26ueVyg==
X-Google-Smtp-Source: AKy350ZupjMpykR0fEshqXh/Nti2s6/pS48QLqWhop+l7tBCWkbHl7tKhWPrAe2DyWkF1Z+6jwbcfA==
X-Received: by 2002:a17:902:ec91:b0:1a9:57b4:9d5a with SMTP id
 x17-20020a170902ec9100b001a957b49d5amr6235315plg.31.1682223638514; 
 Sat, 22 Apr 2023 21:20:38 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:20:38 -0700 (PDT)
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
Subject: [PATCH v3 34/47] igb: Implement MSI-X single vector mode
Date: Sun, 23 Apr 2023 13:18:20 +0900
Message-Id: <20230423041833.5302-35-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
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
index 77e4ee42a5..46babe85a9 100644
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


