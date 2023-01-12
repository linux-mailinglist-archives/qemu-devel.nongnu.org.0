Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB8C666F1A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:10:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuMq-0003xe-Ex; Thu, 12 Jan 2023 04:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMo-0003xI-Px
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:26 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMn-0004Sr-0z
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:26 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so20251224pjj.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHb396BsfrdC6nOrR/W2p2L4OevNEvOX8Dc/tBaVXpc=;
 b=I1zx55xmf9ehL0eBe3DLzMe4JaLKM6Wdtxn5jYHYsCepq3gkwtgGeze4cbFPbHW7yF
 Z498om3gcUzAzDQvSFT+eyQ43r/PBVIEVI2EySuqwprldOylO9JXhb5lUR9GffDclEj1
 7z4nf9B9tYXNCv0kwwjjmRBITxbmNG7id+nFmvaS5UnaCyNYTjS8PkefMsdQ+WR/O77a
 edBoahAv9CbjO+CjOd5Ca7ypkI6nra0g0YLsrjF/KxBQpttvO9Z+uDZwep69E1XepsPT
 zh6b54LkK7o2nGjpLsbLdQvDwEgZ0Es9E49OTiSRWGzbm6w/1//BsN9OB4jSMThPRvLG
 2G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XHb396BsfrdC6nOrR/W2p2L4OevNEvOX8Dc/tBaVXpc=;
 b=qSEi8RbIOz+bnmtsa6LYfmTgo7bmalzH/egsmpQejjJzCm9qbzWgD6sHZpMJIkJqP1
 Wolz56HBjYnTKBb6xVHqUjtU9HbFMdWHsIZbi4ZXmcmdg+7F7XQ5R7hUjQ/E2KxQhaKO
 jAxa6Z+roxL1FHlHKBrQpKZ0A9pFNgOWQ3OjApCDnMm1ounFZE0ZbLooabvaPqrgJSsV
 p3aSvm2HWqJv90ZjRSzpwCuIA6OObMjnQR0xiv3pD+FAT+kmUR20qUA48JytktMJiZtc
 oBYnui9En+HTNhmRMT4dkAaNGmDzIth4LCjyez8jNtg2/wjjdAckU0f4p4i2D6aka2LR
 1xOg==
X-Gm-Message-State: AFqh2krFsTSPOVCJ9mFM3s77R72iiqbaPwlwvQYOkOmeduPlQ7nd3LiP
 QYStAyAXUPTL8hw+az7iC4IHkw==
X-Google-Smtp-Source: AMrXdXuURwFUea1DuGUtOxl7E7sjYKN5to8AG1u/fGQUzXSVmceXE1/XTu08sRE6GQsP/KzGekbM4A==
X-Received: by 2002:a17:90b:23d7:b0:226:e01f:3fb with SMTP id
 md23-20020a17090b23d700b00226e01f03fbmr22289892pjb.3.1673517564300; 
 Thu, 12 Jan 2023 01:59:24 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:59:23 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 18/31] tests/qtest/libqos/e1000e: Remove duplicate register
 definitions
Date: Thu, 12 Jan 2023 18:57:30 +0900
Message-Id: <20230112095743.20123-19-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The register definitions in tests/qtest/libqos/e1000e.h had names
different from hw/net/e1000_regs.h, which made it hard to understand
what test codes corresponds to the implementation. Use
hw/net/e1000_regs.h from tests/qtest/libqos/e1000e.c to remove
these duplications.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/libqos/e1000e.c | 20 ++++++++++----------
 tests/qtest/libqos/e1000e.h |  5 -----
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index b90eb2d5e0..28fb3052aa 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -51,13 +51,13 @@ static uint32_t e1000e_macreg_read(QE1000E *d, uint32_t reg)
 void e1000e_tx_ring_push(QE1000E *d, void *descr)
 {
     QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
-    uint32_t tail = e1000e_macreg_read(d, E1000E_TDT);
-    uint32_t len = e1000e_macreg_read(d, E1000E_TDLEN) / E1000_RING_DESC_LEN;
+    uint32_t tail = e1000e_macreg_read(d, E1000_TDT);
+    uint32_t len = e1000e_macreg_read(d, E1000_TDLEN) / E1000_RING_DESC_LEN;
 
     qtest_memwrite(d_pci->pci_dev.bus->qts,
                    d->tx_ring + tail * E1000_RING_DESC_LEN,
                    descr, E1000_RING_DESC_LEN);
-    e1000e_macreg_write(d, E1000E_TDT, (tail + 1) % len);
+    e1000e_macreg_write(d, E1000_TDT, (tail + 1) % len);
 
     /* Read WB data for the packet transmitted */
     qtest_memread(d_pci->pci_dev.bus->qts,
@@ -68,13 +68,13 @@ void e1000e_tx_ring_push(QE1000E *d, void *descr)
 void e1000e_rx_ring_push(QE1000E *d, void *descr)
 {
     QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
-    uint32_t tail = e1000e_macreg_read(d, E1000E_RDT);
-    uint32_t len = e1000e_macreg_read(d, E1000E_RDLEN) / E1000_RING_DESC_LEN;
+    uint32_t tail = e1000e_macreg_read(d, E1000_RDT);
+    uint32_t len = e1000e_macreg_read(d, E1000_RDLEN) / E1000_RING_DESC_LEN;
 
     qtest_memwrite(d_pci->pci_dev.bus->qts,
                    d->rx_ring + tail * E1000_RING_DESC_LEN,
                    descr, E1000_RING_DESC_LEN);
-    e1000e_macreg_write(d, E1000E_RDT, (tail + 1) % len);
+    e1000e_macreg_write(d, E1000_RDT, (tail + 1) % len);
 
     /* Read WB data for the packet received */
     qtest_memread(d_pci->pci_dev.bus->qts,
@@ -145,8 +145,8 @@ static void e1000e_pci_start_hw(QOSGraphObject *obj)
                            (uint32_t) d->e1000e.tx_ring);
     e1000e_macreg_write(&d->e1000e, E1000_TDBAH,
                            (uint32_t) (d->e1000e.tx_ring >> 32));
-    e1000e_macreg_write(&d->e1000e, E1000E_TDLEN, E1000E_RING_LEN);
-    e1000e_macreg_write(&d->e1000e, E1000E_TDT, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_TDLEN, E1000E_RING_LEN);
+    e1000e_macreg_write(&d->e1000e, E1000_TDT, 0);
     e1000e_macreg_write(&d->e1000e, E1000_TDH, 0);
 
     /* Enable transmit */
@@ -156,8 +156,8 @@ static void e1000e_pci_start_hw(QOSGraphObject *obj)
                            (uint32_t)d->e1000e.rx_ring);
     e1000e_macreg_write(&d->e1000e, E1000_RDBAH,
                            (uint32_t)(d->e1000e.rx_ring >> 32));
-    e1000e_macreg_write(&d->e1000e, E1000E_RDLEN, E1000E_RING_LEN);
-    e1000e_macreg_write(&d->e1000e, E1000E_RDT, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_RDLEN, E1000E_RING_LEN);
+    e1000e_macreg_write(&d->e1000e, E1000_RDT, 0);
     e1000e_macreg_write(&d->e1000e, E1000_RDH, 0);
 
     /* Enable receive */
diff --git a/tests/qtest/libqos/e1000e.h b/tests/qtest/libqos/e1000e.h
index 3bf285af42..091ce139da 100644
--- a/tests/qtest/libqos/e1000e.h
+++ b/tests/qtest/libqos/e1000e.h
@@ -25,11 +25,6 @@
 #define E1000E_RX0_MSG_ID           (0)
 #define E1000E_TX0_MSG_ID           (1)
 
-#define E1000E_TDLEN    (0x3808)
-#define E1000E_TDT      (0x3818)
-#define E1000E_RDLEN    (0x2808)
-#define E1000E_RDT      (0x2818)
-
 typedef struct QE1000E QE1000E;
 typedef struct QE1000E_PCI QE1000E_PCI;
 
-- 
2.39.0


