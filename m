Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F696E89C2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:51:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNAQ-0008Ph-LF; Thu, 20 Apr 2023 01:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNA9-00080p-ML
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:58 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNA7-0001MQ-Qf
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:57 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-51fcf5d1e44so565117a12.3
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969734; x=1684561734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyIvtVtEkzRRQ65xTTp3qSNNrOItJcBqvkf4ykjxuok=;
 b=G8jENpT+wYroVqLfAzTmAL6hOyC5RVRck8JfYvwAt2ucWbCPb9J+CxXMKXkyxT5dpQ
 GuUcxDRBg7I3qgkBFTAwQXddcKy/SddnQNM1twQRqb60lZnOAT5ynP+42vWZ9al2a9PE
 E9bqYG9yR7kpP93k15C2nargW12oZFJx1SFr9W7TNbc69anIj60jO4ak+0bMT6z6rVYG
 YFe/bK31fkeZuOl5oRl1xMbzjQKaIpL089gx8YYiCXl06hKOZ6mcdS4sIfij6XDsjVQE
 hfAKbdfzdULnK0Wd91gsP2WRfM6JdHeaTH8hf7LMWw5s5mwsZia3plN8SsQhYKI0qe1d
 0EFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969734; x=1684561734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyIvtVtEkzRRQ65xTTp3qSNNrOItJcBqvkf4ykjxuok=;
 b=Ggz4VTiaKmKib2rc3RK0fktf8Vd/zhLsve5oR+eaRK/DuKheazYokbcveeKw2A8zpn
 1oiAX1iHZrHFEKyAkIEhuGKkn1P5OiHlvVtFo8/i0Iq7o2ZQFOLKDkpB8K/Lc6bhx4FY
 7CooVOJB9FmFmQ8cq/g2dE1BbGQYcqh+OJ4QVrg5xJUO8goz20W/5vVcEYZz6pn2gZh1
 X6E1EiPu+MYYaXP2rBBMxd0LDGwrzN6HqQYcEm0FM0xyEyS1Zb7xaWlzrDO0qutBf9pC
 bIa52i4bpnRQVRqsP+ibQUmm95ktWkSXnK7Z0kurf8/wRRACA5Euo8CUiZkY8tv/Z601
 ojCA==
X-Gm-Message-State: AAQBX9fGjuDOsrMMZllgdHoIHxJnX4C/qy0oahI25PsjF4rr8bucVOPO
 UyeLScRD1PYwzp183exQabWvmw==
X-Google-Smtp-Source: AKy350YvgNgkkqnj8gf9o/l5P04j9RA7WDrsGDjK5vcOm1bSgDZSFVmcJsy2cXMOUfFnHbCQvpLI1A==
X-Received: by 2002:a17:90b:2286:b0:247:bd9b:c19c with SMTP id
 kx6-20020a17090b228600b00247bd9bc19cmr443443pjb.44.1681969734122; 
 Wed, 19 Apr 2023 22:48:54 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:53 -0700 (PDT)
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
Subject: [PATCH v2 22/41] vmxnet3: Reset packet state after emptying Tx queue
Date: Thu, 20 Apr 2023 14:46:38 +0900
Message-Id: <20230420054657.50367-23-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52c.google.com
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


