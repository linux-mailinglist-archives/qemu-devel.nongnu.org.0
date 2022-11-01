Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C68614FEB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:03:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opshw-00076i-Ak; Tue, 01 Nov 2022 10:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opshu-00075v-QR
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:57:38 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsht-0003sa-9S
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:57:38 -0400
Received: by mail-pj1-x102a.google.com with SMTP id k5so5868896pjo.5
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 07:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCgz4NQO2Y5lVAJjZuzF7ik8Rehy8kyoDvHvk3Kdkhs=;
 b=vGSzJ1k56ovh9pD/ycLDasWSfCHua0of8ccxnkUQdckdC6qGF2GKgYr3l+uN476NgQ
 dhY6EqKMEUbjdHF8dKhXVV0B5+DJJ3wtKPRikiSA1OL9E5rQyWRTcBuyx54ly6HXzMZH
 MxnBX7lLjv+WQ0humwuten+Gm3SOyNUK8GFMiq749ZxQdAPs2AbLiF9m4Vj0bks+ERKi
 F+EvBoO4NungB04+ZyHMA1mAxOrjc2XLxQ59OazliiZL/8d1pdnMJvlkK4cCsd9zO6Ut
 LztAbaQUCtJHsoSxgdt7tGmbCOPO9lhRHObKPPV2wcW20ldmu243SvwihE0N5ZNKVApu
 gkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wCgz4NQO2Y5lVAJjZuzF7ik8Rehy8kyoDvHvk3Kdkhs=;
 b=hDULW7jsfj6gCfbruc1oX6+91IRskMtW5se705z/uKDk7l2aJEQTC+3chS64KFbUji
 pEBEueN5NwG3++oK90eRZoEfsjPrhEtFl6vNkKYX0w5Bo7b4Mzt7NVputolWbHZhkJgI
 F0jO6heFXHx9fa06mkqT+q/bkupq6bEijyzlDWx9oZa1OYf8URkEtJLOe8LVPHxgCV0D
 Y55T0+CF+5rExiRCEKPXLX7ROme6S0GroZQUqHe4rnnA1DQjAf3GqBXL+6S3SnKo61YR
 1cfL1ksab5Nr/6/tCr0G/4RyZVzVGxLye2zuYpiBURuNQbqPmGzg3BYHV7IbA/2N4C0Y
 v6eA==
X-Gm-Message-State: ACrzQf0+2l8AF4n06aq/tC/MKvRBsyBinCON3Z4/YRTw7gHaR4iHBbaT
 ciYQCMFB3G2AKhE/dFn083bgav6IdjrE4Hve
X-Google-Smtp-Source: AMsMyM7INYobtzrNGQNurwHjqLWsQW+t3jWsfSnxzUC2zwVuGCX7EZyR1flOkU3ehsb54VCBP968eQ==
X-Received: by 2002:a17:902:d38d:b0:186:9fc5:6c13 with SMTP id
 e13-20020a170902d38d00b001869fc56c13mr19942767pld.73.1667314655766; 
 Tue, 01 Nov 2022 07:57:35 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631656000000b0046f9f4a2de6sm4783219pgw.74.2022.11.01.07.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:57:35 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v9 16/17] virtio-pci: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 23:55:57 +0900
Message-Id: <20221101145558.3998-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101145558.3998-1-akihiko.odaki@daynix.com>
References: <20221101145558.3998-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/hw/virtio/virtio-pci.h | 2 +-
 hw/virtio/virtio-pci.c         | 9 ++-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 2446dcd9ae..9f3736723c 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -141,7 +141,7 @@ struct VirtIOPCIProxy {
     uint32_t msix_bar_idx;
     uint32_t modern_io_bar_idx;
     uint32_t modern_mem_bar_idx;
-    int config_cap;
+    uint8_t config_cap;
     uint32_t flags;
     bool disable_modern;
     bool ignore_backend_features;
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index c37bdc77ea..b393ff01be 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1154,8 +1154,7 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
     PCIDevice *dev = &proxy->pci_dev;
     int offset;
 
-    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0,
-                                cap->cap_len, &error_abort);
+    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0, cap->cap_len);
 
     assert(cap->cap_len >= sizeof *cap);
     memcpy(dev->config + offset + PCI_CAP_FLAGS, &cap->cap_len,
@@ -1864,11 +1863,7 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
 
         pcie_endpoint_cap_init(pci_dev, 0);
 
-        pos = pci_add_capability(pci_dev, PCI_CAP_ID_PM, 0,
-                                 PCI_PM_SIZEOF, errp);
-        if (pos < 0) {
-            return;
-        }
+        pos = pci_add_capability(pci_dev, PCI_CAP_ID_PM, 0, PCI_PM_SIZEOF);
 
         pci_dev->exp.pm_cap = pos;
 
-- 
2.38.1


