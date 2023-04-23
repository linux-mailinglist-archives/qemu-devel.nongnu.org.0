Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F7D6EBCD8
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:20:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRCq-0003Ai-Hn; Sun, 23 Apr 2023 00:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCo-00033n-0g
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:06 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCk-0000ry-HD
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:04 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1a5197f00e9so28473645ad.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223601; x=1684815601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyIvtVtEkzRRQ65xTTp3qSNNrOItJcBqvkf4ykjxuok=;
 b=HzzBexsyOjcnx9mD4mMcvsPi8w2GiKfouGJVJT02t+Y4bMhTQni+IqNwI40HM7VAkn
 j52KS4260BmFAWk6gCYap+OkSY1cL0jZcLbLXN9exNu1W1+yNBlbYVE2t/n9hHZINki+
 wvWWflTVvacZk9/2PB1BduIYfKabOgbTVaoQJUt/N1HLkDGAVmIixZiU6QNl2IlS6kml
 ZYArHUSsX9tvomYo3g+a0OfvmgsqqM/u1/B1KPMwKefbKJl0IFcVOSEyEJw81phTdFHx
 fo0pUXUHCnePjXEBqaXhUVuuELyOefLTRz8+hybUkbyNdTPzbl1dTyCDHMozjpA1o2d5
 cLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223601; x=1684815601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyIvtVtEkzRRQ65xTTp3qSNNrOItJcBqvkf4ykjxuok=;
 b=E0CcvBKqnICFVfoe2wi7+SjAu3fe7eJvjSP8BhvQuFQgP2gdHYRwsAn/puvLoATbgM
 DDUxDVTpXp4MsZpkBHd58PH0KzK+RbNua8icjNsm0o7wB58tViXYn0tfHV/bztKavXTY
 f7IxBmRRJ4BCXGVrBe5De3tmk6punrrfCSv+IuwlB0cGY98DO12JuUA4z/npAWkf/RqL
 8saWOa8WwETeVXMEsHunxNAB5M3R9AycsSUk4k9G820/dm8yxHx7SPFZugl4CwCCMXLu
 wV9R4IucIch6CJ32ThBUYMSyBVws+L+wc+eQv6nhSUBa4gqw4wFttFeQNtdEoE6tSQwV
 /Tkg==
X-Gm-Message-State: AAQBX9cF79/Zqzh8alnlxR7fZD6DIsf09xFMXAcG3mEqVb0RCFE/GoBy
 qUXE+DMjHVAJwd/2KPXeFW8ddA==
X-Google-Smtp-Source: AKy350ajslBw5A+jVFmlC6p3z3a/qCIQsNZGj27wrXQI/v5rMxicica6BaaIp9ggmfxCOdApj/g0PA==
X-Received: by 2002:a17:902:ebc6:b0:1a5:22a6:4e6a with SMTP id
 p6-20020a170902ebc600b001a522a64e6amr10721232plg.51.1682223601464; 
 Sat, 22 Apr 2023 21:20:01 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:20:01 -0700 (PDT)
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
Subject: [PATCH v3 23/47] vmxnet3: Reset packet state after emptying Tx queue
Date: Sun, 23 Apr 2023 13:18:09 +0900
Message-Id: <20230423041833.5302-24-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
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


