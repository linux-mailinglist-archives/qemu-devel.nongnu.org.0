Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2646E2278
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:41:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHmL-0002UU-OA; Fri, 14 Apr 2023 07:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHm2-0002HA-3I
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:26 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHm0-0001T1-H2
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:25 -0400
Received: by mail-pl1-x629.google.com with SMTP id o2so18007479plg.4
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472363; x=1684064363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0H51BYlxe+egNhGJYPvqCkgbOunGR2+kIfTggZf4P8U=;
 b=YzRrGrXP9/QjIuN900FJ3GyBb8yTfu9A0YPpokZBpSF4zDTXcXAx3ywI7T+XR0N0hQ
 bmpylHlB8ZH6fCHNNCAMtoogOna5+I0IyLPSIhAhXD3VpeY2/gjsXcixpT6nOIrRtqkK
 q03t6DSOgXH+GYdIONP4whqMQZdllOIf0t1oouaHpsAzoVcfPVguiP2pNN1oo8yiD6Ga
 zDwqbfPiJ+P2xY1FBOVQgVwZvGNgT+5cUeU/t4LNPWWiPvmzAuFAQrOAlm5Jtbp3r3fK
 Wd+RdiQfDX7ipq2NZJYqNg/3OFA2gKQZQ29XPpHwnev+yJFMOHxS2bG1z0YeVTiExNAs
 gcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472363; x=1684064363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0H51BYlxe+egNhGJYPvqCkgbOunGR2+kIfTggZf4P8U=;
 b=FdTmOJREYW8j7e/w0p+bcSfBatEFQ3spZZumfC7ovYKsQxwvd+vzirP8X5ev98ZIi6
 79zq9YqcVnQ9PidMbAEoryhEULGxWMSA/Hyq8EwNAYCo+r0B6K0XjlNEjyOpJUWNa6tH
 vzbbNI6oqgh3KBK9BBTU26gQVHADNNgsINWnHX+QBZ4qGcDBZ+GJqk0a2VLK/KYFCt6G
 wOzPL/67ZUynJQpk2Q+G1yz0XnSKVyQNAeh/QVXYvQFBd40vkjv5qHI6OSYD2IAq1yFe
 6KHnkGBL/zMwfS4AmIatYkh2l9kwaYE/7A5crNu465U5VOI7ebKoevIpQL6AZNhJh7Gn
 Vrvw==
X-Gm-Message-State: AAQBX9dtGe6L/l7piDCbRbw/Peh4IXu8lofvoaXswVzMKupoOnSDqE66
 luad8twFT/ZjijtdSeDHw4AZ4w==
X-Google-Smtp-Source: AKy350YIDSue7fQatGDsSMypDeoK105W/ZXWzlpZt45lB0ZbpCSb9FKhtqREzcQYmSl/AKJq0boH6Q==
X-Received: by 2002:a17:902:e846:b0:1a6:3b04:92bb with SMTP id
 t6-20020a170902e84600b001a63b0492bbmr2837533plg.18.1681472363352; 
 Fri, 14 Apr 2023 04:39:23 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:23 -0700 (PDT)
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
Subject: [PATCH 20/40] e1000e: Reset packet state after emptying Tx queue
Date: Fri, 14 Apr 2023 20:37:17 +0900
Message-Id: <20230414113737.62803-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
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
index dfa896adef..33ffc36c67 100644
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


