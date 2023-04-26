Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031796EF24F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:42:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcXz-0002l7-EN; Wed, 26 Apr 2023 06:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXw-0002kE-5C
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:48 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXu-0003Fj-O5
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:47 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-63d4595d60fso42175510b3a.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505525; x=1685097525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyIvtVtEkzRRQ65xTTp3qSNNrOItJcBqvkf4ykjxuok=;
 b=ITalNc8xoixZUGAhI5RP6XE0Hwx0ifzL6L0rPTIBAewFH6SEOnk0OAGfkYnhX2XsT3
 KuSE4p+sgOMMx6OTtdTXqJgv+N9UH2lUD1cmj0GTOZE1LZS0NpZwjC0Bm7PJ+DhMcsFF
 Gg3svJ305UDZKKpdJUWtX5ywvrrVwdgnFMNkGcA5MY9MsE6+AA6OJntXjGhTOVcP8h9A
 chODwYaahX6+3xz+QXM3ivTasipSoN8Nl6UPfTphbIgAAbO4qtaLvPRTJDFdZ44D/vRm
 2LKAs3g9kO1XwFDgjyridYz1r3wv+rGhNF/MaQhE6tRrMJ4ZaAYT0/kIqtDdNLT3e5xU
 Cf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505525; x=1685097525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyIvtVtEkzRRQ65xTTp3qSNNrOItJcBqvkf4ykjxuok=;
 b=QtwLcovjIBAqQnFgvqHb5wXywiQ/bN3lqwjJzjifNiL6Je6PVeVahhaYrxFtoBfgro
 a1mChjlPYmk9TI2Y7QEuSCaTmIueac7jnwrCMrGJi4Pj4/D+o879AnTBC0qR53GwV7MX
 Bi+kt11H3wzBpLwZ+n6UbA59atU8ETvItyOJMRBl6lFcRflMNtjDE9JT2dwEIRYKofwj
 sEjxTiEm3Pof7ZzGWnLXMza8pcBrBZ0Yr+OaR/ho35jy97s/Ft6GH3ZKRySRzzxOVzHM
 dMwgCANA5RCEA9ffSZTu1Onl0VQpuwzvSnhoBSu1CQg02IrxbPFgDIgr7cFJG9n+PXSm
 szrA==
X-Gm-Message-State: AC+VfDyZEXB3UTGzX81RR8FFE2QlfTxJy5dfKJxXWyE9TGfibkOh1fH1
 bqnfAoWZOwb4Q8OMJh22fCE1Kg==
X-Google-Smtp-Source: ACHHUZ6PEFvouzRammnSvNvgxE38XiBjddxnOw5u+qe23SvHrKaLGBO8HRobG4JU3eeRip8sIX7ZNA==
X-Received: by 2002:a05:6a21:78a2:b0:f5:e533:4dc2 with SMTP id
 bf34-20020a056a2178a200b000f5e5334dc2mr2549730pzc.12.1682505525554; 
 Wed, 26 Apr 2023 03:38:45 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:45 -0700 (PDT)
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
Subject: [PATCH v4 23/48] vmxnet3: Reset packet state after emptying Tx queue
Date: Wed, 26 Apr 2023 19:36:51 +0900
Message-Id: <20230426103716.26279-24-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x429.google.com
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

Keeping Tx packet state after the transmit queue is emptied but this
behavior is unreliable as the state can be reset anytime the migration
happens.

Always reset Tx packet state always after the queue is emptied.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/vmxnet3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 05f41b6dfa..18b9edfdb2 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -681,6 +681,8 @@ static void vmxnet3_process_tx_queue(VMXNET3State *s, int qidx)
                              net_tx_pkt_unmap_frag_pci, PCI_DEVICE(s));
         }
     }
+
+    net_tx_pkt_reset(s->tx_pkt, net_tx_pkt_unmap_frag_pci, PCI_DEVICE(s));
 }
 
 static inline void
@@ -1159,7 +1161,6 @@ static void vmxnet3_deactivate_device(VMXNET3State *s)
 {
     if (s->device_active) {
         VMW_CBPRN("Deactivating vmxnet3...");
-        net_tx_pkt_reset(s->tx_pkt, net_tx_pkt_unmap_frag_pci, PCI_DEVICE(s));
         net_tx_pkt_uninit(s->tx_pkt);
         net_rx_pkt_uninit(s->rx_pkt);
         s->device_active = false;
-- 
2.40.0


