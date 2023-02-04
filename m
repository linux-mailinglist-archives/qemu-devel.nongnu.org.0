Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C31268A834
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 05:38:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOAIT-0005dB-Q5; Fri, 03 Feb 2023 23:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pOAIR-0005cA-3R
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 23:37:03 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pOAIP-0008Vy-Nb
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 23:37:02 -0500
Received: by mail-pl1-x633.google.com with SMTP id m13so7199648plx.13
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 20:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/bxjHFIsiAL+63eNAGcS2MggSsbsWq0QCFg0Dd0/BY=;
 b=3L9d6noNqc4vJ4HxMPyFnhEmlxCmYUKDbzSMBEDqay9a8XUvKEXtX1QvIiWoJ39mHC
 Zn/DzkrX7fUde8mPg6W4c0E1RP8se5G0Z9PXLXMsYiV/FrrdYImsPdy7V6YQ2bXBFFjZ
 pIl/EfgLmwVjENJZaTRVrs8uxbJi1lcobkK80MlW/63Q5SGcoQoBzxUUuU2u9PDfWqsr
 DONaPYefy6rKzMjjgkilZUjFFBntLUuS+ezajIKTzYyI2ziPscg+vMGsdYAfmdlZ8y2P
 kTNivw43nbTQIR/966KIq1frmSyr9PFklpzdJzp6fTGDgTRpmSv75A7BBw74x5aID+j3
 d3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s/bxjHFIsiAL+63eNAGcS2MggSsbsWq0QCFg0Dd0/BY=;
 b=4/rcFGwk11qBoJYJu68JrwBeVpFneX5wtkQTGMZvOkJ8YzWkqcKFp2XXvd1GweiXIj
 m3ZGsbIPg+kEq6D+647j60WrWv1+eAI+HgSlMOZSFd6/dlCttoPESLljFZL0/+OZINo6
 JCvols4ipM+kVRuFVdwJZBnpavRbbac7vzSnScbZlAqSjjx4Lh9Z2AnNbEkdXgSBLwkU
 G+xTKs/nyqyIOIxsKWBif9F7Vn3f6ISglYJL5trdAm5ssIfxM1yMgq0Vf4QfiKsCUi4e
 C/qzwF/+R8oawBEc2Ra23DnUuOh0iqaT983CP9MbvtSZzGllXS5UDpZJ0XvK90OtSgk8
 VJvA==
X-Gm-Message-State: AO0yUKWQ0d0TOJDwkJVwc8DcJJi6QeGgT1FKjaMv3ECsRVwq7mUNeVf4
 OzSWL+yGXsaQeZgs5dVU9j7xkg==
X-Google-Smtp-Source: AK7set8URfXVZqfCeSQ2sfv+nKdINeujIntsQ4YE0ps3zdhe1UAFx9iJOJ3oSvBofDCdVTfr80vC7A==
X-Received: by 2002:a17:90b:1bc6:b0:230:369d:36fc with SMTP id
 oa6-20020a17090b1bc600b00230369d36fcmr12915685pjb.30.1675485420600; 
 Fri, 03 Feb 2023 20:37:00 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a17090adb0700b002308f6e7f41sm225707pjv.55.2023.02.03.20.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 20:37:00 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v8 5/8] tests/qtest/libqos/e1000e: Export macreg functions
Date: Sat,  4 Feb 2023 13:36:18 +0900
Message-Id: <20230204043621.13540-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204043621.13540-1-akihiko.odaki@daynix.com>
References: <20230204043621.13540-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

They will be useful for igb testing.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqos/e1000e.c | 12 ------------
 tests/qtest/libqos/e1000e.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index 28fb3052aa..925654c7fd 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -36,18 +36,6 @@
 
 #define E1000E_RING_LEN (0x1000)
 
-static void e1000e_macreg_write(QE1000E *d, uint32_t reg, uint32_t val)
-{
-    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
-    qpci_io_writel(&d_pci->pci_dev, d_pci->mac_regs, reg, val);
-}
-
-static uint32_t e1000e_macreg_read(QE1000E *d, uint32_t reg)
-{
-    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
-    return qpci_io_readl(&d_pci->pci_dev, d_pci->mac_regs, reg);
-}
-
 void e1000e_tx_ring_push(QE1000E *d, void *descr)
 {
     QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
diff --git a/tests/qtest/libqos/e1000e.h b/tests/qtest/libqos/e1000e.h
index 5e2b201aa7..30643c8094 100644
--- a/tests/qtest/libqos/e1000e.h
+++ b/tests/qtest/libqos/e1000e.h
@@ -42,6 +42,18 @@ struct QE1000E_PCI {
     QE1000E e1000e;
 };
 
+static inline void e1000e_macreg_write(QE1000E *d, uint32_t reg, uint32_t val)
+{
+    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
+    qpci_io_writel(&d_pci->pci_dev, d_pci->mac_regs, reg, val);
+}
+
+static inline uint32_t e1000e_macreg_read(QE1000E *d, uint32_t reg)
+{
+    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
+    return qpci_io_readl(&d_pci->pci_dev, d_pci->mac_regs, reg);
+}
+
 void e1000e_wait_isr(QE1000E *d, uint16_t msg_id);
 void e1000e_tx_ring_push(QE1000E *d, void *descr);
 void e1000e_rx_ring_push(QE1000E *d, void *descr);
-- 
2.39.1


