Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43BA6E89D1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNA8-0007zp-7g; Thu, 20 Apr 2023 01:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNA5-0007zZ-Ii
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:53 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNA3-0001Lp-S6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:53 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63d4595d60fso4604111b3a.0
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969730; x=1684561730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WOJ6hIB2Qfh92lFD+jfSoOxdT6/0aqhANv6JPVUUvUg=;
 b=O/QpXEZeu9zGCZqMho/9+ZBSbE2pLsQ7D4fND8Lb9lruNoGCuGOnztQDaNhYLvY4RQ
 sKFYPsUZuv+HJkYHWB3WNtM4WdTHZLduENXXJ7zY4SCisF45Gc8pOWHD3wFBZQPX5AOJ
 IkxoeEijnbRcdhn5urVnXoidqPKmGngUFIsy7YdTjGhrtM/LBWsHfMMdIYbixW5DR70b
 TWm+EmduFBbZqn1Mg5sekdoKXnJOBk+rYmqbUBpNpLJOtBQSzY/tcDXlyWJF08G5Ewbc
 /8b396LpyWpw53QarPUSb+L1xHKLFEOkh+t+hGBYN2TIjOGnoC/u8VFZE25Lr42HgHiw
 JTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969730; x=1684561730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WOJ6hIB2Qfh92lFD+jfSoOxdT6/0aqhANv6JPVUUvUg=;
 b=XBKjdGnZr8waBZ+H9BQz+kK5yWwWxaRE+08AobyjuYejysFgxYThOCUk+VKaHZW1VU
 yoyjgLwTpgQg/m4cjBL5x3tdP5f0kiIKzDwpr4hK3iwizBcX6OnbnC7c20/d72HRKX1D
 McUQkoN1NZM3mLhMEza2GokSKV8z4q6Uz1+wQ3Pd+JcT27pvZN7isIs6BfpXTzW4Kra0
 vTk23mqJBISdnbYFtOgaKHQ5jb1SwyPNTvwrjZrHkSMJjQeMfouYMlqwPYhtBXnRsAB8
 cu0V5al9AsPUiUWYkDywvz8jB9/EwoUfUNbtVfgUQR7t36f3pGO0vZmZpOixjV8M8U63
 mltA==
X-Gm-Message-State: AAQBX9ckvKaEGBZoq25jXRQFCLsy9pLhvbjpKtx3rlV0tUb6aj5SNS+3
 5+QL4K2c78pakGRYV9AEdsFU0Q==
X-Google-Smtp-Source: AKy350bKaxED43X5zxCyKto7LLS4B0iVy4670eND4l+3pLBCpqnpF6Tw3DZ76KOpUsPnCbbLLQz84g==
X-Received: by 2002:a17:90a:65c5:b0:246:b9e3:aab5 with SMTP id
 i5-20020a17090a65c500b00246b9e3aab5mr179391pjs.21.1681969730722; 
 Wed, 19 Apr 2023 22:48:50 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:50 -0700 (PDT)
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
Subject: [PATCH v2 21/41] e1000e: Reset packet state after emptying Tx queue
Date: Thu, 20 Apr 2023 14:46:37 +0900
Message-Id: <20230420054657.50367-22-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x432.google.com
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

Keeping Tx packet state after the transmit queue is emptied has some
problems:
- The datasheet says the descriptors can be reused after the transmit
  queue is emptied, but the Tx packet state may keep references to them.
- The Tx packet state cannot be migrated so it can be reset anytime the
  migration happens.

Always reset Tx packet state always after the queue is emptied.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index d4a9984fe4..27124bba07 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -959,6 +959,8 @@ e1000e_start_xmit(E1000ECore *core, const E1000E_TxRing *txr)
     if (!ide || !e1000e_intrmgr_delay_tx_causes(core, &cause)) {
         e1000e_set_interrupt_cause(core, cause);
     }
+
+    net_tx_pkt_reset(txr->tx->tx_pkt, net_tx_pkt_unmap_frag_pci, core->owner);
 }
 
 static bool
@@ -3389,8 +3391,6 @@ e1000e_core_pci_uninit(E1000ECore *core)
     qemu_del_vm_change_state_handler(core->vmstate);
 
     for (i = 0; i < E1000E_NUM_QUEUES; i++) {
-        net_tx_pkt_reset(core->tx[i].tx_pkt,
-                         net_tx_pkt_unmap_frag_pci, core->owner);
         net_tx_pkt_uninit(core->tx[i].tx_pkt);
     }
 
@@ -3515,8 +3515,6 @@ static void e1000e_reset(E1000ECore *core, bool sw)
     e1000x_reset_mac_addr(core->owner_nic, core->mac, core->permanent_mac);
 
     for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
-        net_tx_pkt_reset(core->tx[i].tx_pkt,
-                         net_tx_pkt_unmap_frag_pci, core->owner);
         memset(&core->tx[i].props, 0, sizeof(core->tx[i].props));
         core->tx[i].skip_cp = false;
     }
-- 
2.40.0


