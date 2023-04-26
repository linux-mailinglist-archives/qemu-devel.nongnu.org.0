Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43516EF245
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:41:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcXw-0002jw-Cc; Wed, 26 Apr 2023 06:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXt-0002i8-0P
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:45 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXr-0003Dw-Fy
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:44 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-24781e23c27so6210411a91.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505522; x=1685097522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KtUv0mGmA7OSWgIJyTpKTrAjxT7V/SfSD72W9CU2fMA=;
 b=MFy6i5CkM6ogUGITRMhjs40Asdz875poZMAZOrl2nTp23dJEYsTwIKkU+1sLzgDWTR
 js6Sq8fZNIen1cFRemvSD/e92Sp0m3/pWQWACCXvpPBUFGGDrCHseZOsmeCvakJ7bTC0
 /NKem46gIweaJnsgZoCpS5/ZUoemwoIpC2l2X8Mn+yD3Pi5i6v56X9IKAFFNeio3Eyyt
 A7TA9Y9su3ih6uEF3l0syoG53OFkgEA6TxgeLMbZB9sB6MuO7NBFdupDWPbwfaxsCpgQ
 UpJYrc1jtsY31LTb9IhCoTG6F3mrWQ3w54Gsap8CmT24o9vPIKjgIdGrb4W26N5DcAZQ
 EdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505522; x=1685097522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KtUv0mGmA7OSWgIJyTpKTrAjxT7V/SfSD72W9CU2fMA=;
 b=Qx/JYZ1kfjwWkQpE0ZLLTeTzfBCNYNmM8riox9yo0OxrBsWRZkhsp8Utjwr7BqamQp
 rswo/babGMBe2TpesfI0mvBNg7LRrE8Lyl0e7+NqS7kopNZ3wo8p7tszG2E5Q7dDECwp
 O0QPnwlEBrwj6x+V7WtP29m60rXaur+gyq8rsF7MInyhc8/JPDvDu6Ib9ErfkheLIUPT
 MO4pI6o1Th9CAGPwgljJ6DgYrBH4cr+VdVKQOYqhdWuNrD/MjlkMUPZFvRsee8sqFfcT
 cqEECM3aOOT8QicFJAScoI2KJOvcAOZ6bLklf25SPbas6sdaokf3pBGbok+0DtMNmCKl
 8MDA==
X-Gm-Message-State: AAQBX9eUYEpZFSHj9J/CGspAhvkLHCiUJulX61cQNq36GvZ2JaPV+K6E
 I0rEnf7JRhYTyO3OKnE6axxvCw==
X-Google-Smtp-Source: AKy350Z/Efqzv5xLQEj4WpqB3ZylZNJSLTE6RJrJt2BqgKUIgdsYdkkZBfoUj7v2wyQW0IQh/m+pIA==
X-Received: by 2002:a17:90b:1957:b0:23d:376a:c2bc with SMTP id
 nk23-20020a17090b195700b0023d376ac2bcmr18985318pjb.5.1682505522138; 
 Wed, 26 Apr 2023 03:38:42 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:41 -0700 (PDT)
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
Subject: [PATCH v4 22/48] e1000e: Reset packet state after emptying Tx queue
Date: Wed, 26 Apr 2023 19:36:50 +0900
Message-Id: <20230426103716.26279-23-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
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
index 6a213c0224..7dce448657 100644
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


