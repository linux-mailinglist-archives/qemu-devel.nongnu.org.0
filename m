Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0E4681117
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:10:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUqk-0002jV-Bx; Mon, 30 Jan 2023 09:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUqd-0002fb-9i
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:09:27 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUqb-0007l6-OE
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:09:27 -0500
Received: by mail-pj1-x102b.google.com with SMTP id b10so11206879pjo.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qmT83Cik5eBHOjOQZb4K96ZDXLl3GpmhUFr2qiDr+qY=;
 b=A32vaDGjlhKSil2OU2L7jrKn3rbTxMukU9TEVJe3aZEmD9a53n/pO/K+eHAr8n01K8
 SD/tr0IoHyZLHioEONK7rQkGJn/W9nCIZixONkWcpJCHBwGINdIBLnRDsfRyaJoxSwbi
 1dB7Pb8Jy0/pbsInfN1VCUOnjYoWEblG6IRQ1j7+l4jQW3pfrcwjMA+uo7aGTGChqCks
 ZHsM68rDwhErQvDsWejOPTLX3EcFzDN4EuwkE3oJmDsDt/mtPi73OzCa/gnAOzWmN2eE
 nNPpCOl6dIv9EBYA5SecPjymOa1d8JL1xKpXMRUOu7VIAsBjOfpbmGpARUZ8m6hPU9St
 aa/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmT83Cik5eBHOjOQZb4K96ZDXLl3GpmhUFr2qiDr+qY=;
 b=ZdoZgn1rWjAnrL4OITuGSsdbPe409ojJLw+WAQIoHkg+eNGw7CG52UoL/B/pGNMnAc
 Zyo4VdUNpev7FWF5TQUAU9/lyIqZdlFTbCsBm8cO4hwQiaE/bd7WSV7oJKys/NRnQWz/
 M9e/gXrzbeGUwqCWG0QzETwBrIa395sBWS7mZ8/WJAZO6iCg7z9oJrjSMHFFizv3KQmJ
 OFnud0mzAzuVaeFe7amq+1+11+h41QRBtHfKcGI9W5gkhoMwsh7vpHH2zQD1z82m2vwE
 HDXv/z3Iteg/jaSGWnFupU07GzRcNNeE0zlrXvic/zbE6XgoHVCyEfmlo7xJn9tOYm8B
 k/fw==
X-Gm-Message-State: AO0yUKVCWfco5gyRk2NJLDJzSOZT9ZM9HNUWbmwXkCEXH0GOoThLygR8
 XKw1fLdZreqB72zNalr99oP8Dw==
X-Google-Smtp-Source: AK7set8LtsxRsgAkKfY6TDyo4K9a0ZxpccUlfacqJErpbD2180jfNo6moG2dO68Ac9Q20yZBNpu34w==
X-Received: by 2002:a05:6a20:3956:b0:bd:ce7:22d2 with SMTP id
 r22-20020a056a20395600b000bd0ce722d2mr4388986pzg.25.1675087764911; 
 Mon, 30 Jan 2023 06:09:24 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u70-20020a638549000000b004468cb97c01sm6962977pgd.56.2023.01.30.06.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:09:24 -0800 (PST)
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
Subject: [PATCH v5 6/9] tests/qtest/libqos/e1000e: Export macreg functions
Date: Mon, 30 Jan 2023 23:08:06 +0900
Message-Id: <20230130140809.78262-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130140809.78262-1-akihiko.odaki@daynix.com>
References: <20230130140809.78262-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
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

They will be useful for igb testing.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
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


