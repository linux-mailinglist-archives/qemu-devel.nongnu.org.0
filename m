Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCD9615031
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:12:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprnc-00069y-PS; Tue, 01 Nov 2022 09:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnb-000699-5w
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:59:27 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnZ-0004fM-Nu
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:59:26 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so18896938pjk.2
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GSC2v4ngPUcx+TLSPrzIkvnSf/m2yHNZ/Q2yIIKBef8=;
 b=Sjz6lanLFRGsh49GTvcmp+jXQCrwSun9fWB2bGcbAhXgRacQIGLvSRERzq9EJXSmsF
 g9Q/Q01Ubp3uFTPWtS4Gknvto1eRRYdM9kH7F5PBtCs5Mu2kUqZWgMeLQhVW83jz0IGu
 EbFMM6X3w6J18uJvLM8zc2t1gqO3Khl/TAzZFFS5DylAFZ9yZyYMw5BX2Acu1vUB8ITY
 3KhJBJrK4TcpncBk29f7xbIuR0JWDy6FgBSQtirTOpXWe7jOT/m1te8TMDY4ItvMYbli
 7B+YgtptftmKH+FgU99Aqlv2ssPqac8L1dhj9gmTr4iUgPlwJCP/F7YOMyrtti/08MLr
 Do4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GSC2v4ngPUcx+TLSPrzIkvnSf/m2yHNZ/Q2yIIKBef8=;
 b=V9Sneq9pXMsr9ahmn+M8LM0B5M5Fqop2dSK3R2x2rdFiuCHhgu8rPUsmauigdcqCJ9
 oXWnxboazlq3W4IAevru+uLt7IK/MpMOiVTE9KOg5yipAGv37hqJ7RP7Qmni3jT11nvR
 duBYuutM1mWde7Y7GIaFXeZYNnTDCcHcpyQIYvqSph52sqiI9kvhq8rPovPblgD9NR/l
 JvLPcS22rNgKGetl0Sv+dVKnL8CPDt3mkh4ESxI5xHi5XdC6agy97s419J3nsYhviMHo
 ZgnCLIK9tt9KuF4mTTrurDYcP30+RVBf4PZLJJRLUt8n7WtFHGAC6U21PTgzA431ZRJQ
 jCNg==
X-Gm-Message-State: ACrzQf1peLFUgusYzkt/gKGKc4wewCDxczH2+KFnR2Siyp9uDIpz/+HX
 KVreyL59UTY+104DoIOGTIk3gv8f3f4CUww/
X-Google-Smtp-Source: AMsMyM7r0X3IBn7tQh5lJ6EJRqN8lCJ2l9RgIUYwsdL/kg5Y2HnGjG1S1+uqbKjSVihsNSKTKvJ0jw==
X-Received: by 2002:a17:902:c1c6:b0:186:994f:6e57 with SMTP id
 c6-20020a170902c1c600b00186994f6e57mr19496479plc.17.1667311164043; 
 Tue, 01 Nov 2022 06:59:24 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:59:23 -0700 (PDT)
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
Subject: [PATCH v8 16/17] virtio-pci: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:48 +0900
Message-Id: <20221101135749.4477-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
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
 hw/virtio/virtio-pci.c         | 9 ++-------
 include/hw/virtio/virtio-pci.h | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

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
-- 
2.38.1


