Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8556EBCDE
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:21:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRCt-0003EB-FC; Sun, 23 Apr 2023 00:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCj-00032l-My
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:02 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCg-0000rV-Ow
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:00 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5144a9c11c7so3531923a12.2
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223597; x=1684815597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WOJ6hIB2Qfh92lFD+jfSoOxdT6/0aqhANv6JPVUUvUg=;
 b=ZfX4CmiluRvzuBAcmFk3B1v9/TEq0sgM9Etc0503CODbkYU3RZSYYFbGt3sO7wKziZ
 9kCuF98WjsUsGiHxig95yIYdwu9jC3Mo3JrRW/tCnKNjK5jINiCTFVT7EksMLFXG7xzk
 65TeJ31/b9bWDo98rWwrksr46CACZk+KJFo02aGPB8nNh/Uqt1AFflGgJRg/0RvuTCUw
 pxeeBYcCx8oInbtPm5SX+lVuOojDoPctThnZZuw4LJfrcFrp/VdiOwunIw+bsws8LrQG
 4vthTdFpGFWGnTHzhV7sdUREoncCa1HkATyou2uqr3Bg1dQXEJ9Ptifk9at8wML7GTMD
 T9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223597; x=1684815597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WOJ6hIB2Qfh92lFD+jfSoOxdT6/0aqhANv6JPVUUvUg=;
 b=dQPbupzFa+OA2aZDs/5itO9qDSaUDYEAoYq4k00nqANWvormyTyG6NRUbY6y4Dl/j9
 dx4CGIUzb2ojKTWq5VeYMiXffIzf+FmQE9N+KYoQ+XCUhVsmkHwD1kknYnFH8w2GmNqi
 7zn9k5bB2klOoDtCd+ZdQGwWun+pUuln8Q/twZ8hccZ5A2BV8ODpcb5f5V0/U/Toy86+
 Cd+B3ddsLylZkBAXdlz1uSPI8hCs0eLhPjNf4zqiNyz1/fgQjjO1y2JYL4iKK0H/4JZf
 Zdx4bnP6tWZtBsu/GG3t8OiGgv+7gXX8auZ3SS84yhVLlzcf6CYRPh6mQzl64hzGAQva
 A7xQ==
X-Gm-Message-State: AAQBX9ebuOfj5LxDVZGJ9gRMaNJO4qIGfrMztktWK2HoLRT0kgmJjy8K
 R1rWcW4GKOU/GrfB0kxuKaucdg==
X-Google-Smtp-Source: AKy350YV101WD+NG7YAuZU3pGB/xTUqSPnReaYn7kA7zfvp/0ZzvaFoNYSmRq5ftJXvRAeN4hVHceA==
X-Received: by 2002:a17:903:120d:b0:1a5:b8d7:8ba1 with SMTP id
 l13-20020a170903120d00b001a5b8d78ba1mr11307649plh.39.1682223597747; 
 Sat, 22 Apr 2023 21:19:57 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:57 -0700 (PDT)
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
Subject: [PATCH v3 22/47] e1000e: Reset packet state after emptying Tx queue
Date: Sun, 23 Apr 2023 13:18:08 +0900
Message-Id: <20230423041833.5302-23-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52e.google.com
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


