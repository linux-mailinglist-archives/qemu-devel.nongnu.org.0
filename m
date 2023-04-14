Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDABC6E2292
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:48:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHmN-0002t3-NH; Fri, 14 Apr 2023 07:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHm5-0002T3-GX
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:31 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHm4-0001Qi-0C
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:29 -0400
Received: by mail-pl1-x636.google.com with SMTP id w11so18015708plp.13
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472367; x=1684064367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyIvtVtEkzRRQ65xTTp3qSNNrOItJcBqvkf4ykjxuok=;
 b=O/lNpwLoLpGrpLDk0MYZSkgAPgfxAYEuIyNefuFLhU1cWfmLNkSFLEYtfbPUZLDAhV
 VLJLx2Do5rjHtKh+6WL980l8dxYHX8ap9hwCpd/hiytMmGD69vlDYXntubdZcs+1fTiC
 cg6L0L7VciC+oZb9TILTTgkykLy+bmhBNS8PSDQAc5hvIv4Kz1bJIHGQYaeRRD+fFcx/
 tsMMXLjVp8b0LT9/c2YnDT00e09CDygGj28ftX01gH3ouVAG0Ijqip1HQQCGuJO/eHfk
 aiBXVg1wtxnwjY3QiT2O/JN3xHMCoI41rKFupFyUzEcfIjyD8NRmEi+0v20LWp393qXS
 2o1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472367; x=1684064367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyIvtVtEkzRRQ65xTTp3qSNNrOItJcBqvkf4ykjxuok=;
 b=I38cCK76lsbwf0veKhCJ3YAh5f1TM3VS4ww22/abn+VzQao4RaE4QVSebPD6Koi07y
 GV4tZPt2Z7wwQccwP+QqrXIVh9y2Fl7MoLAPv5Ei0RVjugkxKwEGV17uHSQiLfLfmVQm
 gOjH7a/i+VpT90Qwmotw2e9I7fXTqbQKZd8dR+PpjRq57hMxk5ChHkRo2J7QsVSbwRHm
 hD+7ZhHGbhyixMNndL3Rlg2szW3vsbdZWewJf9DkCeQVy831hfjPA8DgMEG1S3KKeOVa
 8yPXPaXQtVD0UdRWLV1jUF1psmsmQbCJtAHvP5imocrPmF/1EOZcI0LKc6phBTyKc/O8
 0WRA==
X-Gm-Message-State: AAQBX9d2F4DJCn7+uLWmYNGw3Sz6+b//hsAvVkOXqepQnWYAlu+vkbfX
 Y2hVH39HRxGM2JIS66rjQepU/g==
X-Google-Smtp-Source: AKy350ahfGU8q2htyWS8V6NCiywOS9NhOGEI8/NIgEG07biNS1d8FIAXnOUmqTc4NMgHt7JqoK8aDQ==
X-Received: by 2002:a17:90b:1d01:b0:247:3654:74dd with SMTP id
 on1-20020a17090b1d0100b00247365474ddmr2421591pjb.17.1681472367370; 
 Fri, 14 Apr 2023 04:39:27 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:27 -0700 (PDT)
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
Subject: [PATCH 21/40] vmxnet3: Reset packet state after emptying Tx queue
Date: Fri, 14 Apr 2023 20:37:18 +0900
Message-Id: <20230414113737.62803-22-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x636.google.com
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


