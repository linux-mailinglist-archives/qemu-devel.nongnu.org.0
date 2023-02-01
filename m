Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C145B685E39
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 05:15:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN4Va-00015j-7o; Tue, 31 Jan 2023 23:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4VY-00015O-RV
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:14:04 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4VX-0001Cl-Ce
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:14:04 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so740807pjb.5
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 20:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/bxjHFIsiAL+63eNAGcS2MggSsbsWq0QCFg0Dd0/BY=;
 b=FWQfZ0IBvGr+jLqmJraoceKiKFNCThcgJ3uUQ+7kvQsEP5lDUKld5UzG/cMhj8SOFW
 vb/5HCsCTZAaTLXiXLTQR5ycHsK6gkEx+IAdmeLyVvAknohmu6z6oAbmfn0igognvKjf
 P+RoKCV6vBRQsEYp2J5GYI4/MRVjZfIsxprIsfqUhh2yNzfiz90jeMuWeOv/ryhk11ey
 NnRPPD9FMs4DdX3tHstopAhxhfsG9cqA1z990MXGeXnjcHMMRV9YYrilCwdWCO1s9KOu
 YMufv4pKKZcPtO/txXTinDVphNkCcwq7qRH9MbOjq5sFszlt97qNg+x+E26kp+O4933N
 I/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s/bxjHFIsiAL+63eNAGcS2MggSsbsWq0QCFg0Dd0/BY=;
 b=j4jBvvoQMrmUacEKzZOYdZb82Y+S2gFozmNZMfHm8eUjMawllsxlgPeQ3rvNHCM3f0
 uUdwBfVJ0pRr0hRaBP1w6sUlbKgPlxuV/66N3od5t6C55I6XbdNQvD1IJRfZ1IMXikYD
 +mLGDgrhvqIhO3dx54DJJJkxbqAmHywGM9c1G8pcF+0BLgB91NtrHz+Jw3f+EIe8JrZu
 51yUkItwiZQRyFOpjgxg9Y0w4KT9HVfpRvGJiHTv3UCvNoJv+w06/3/0zeOzJKLLDUh1
 2VtDVTacJxgLKD/nF7gwPvulC8BklAF8RKqPagzJgPFyGuK+X4nbyPy5YQVlzAHqfluD
 XsrQ==
X-Gm-Message-State: AO0yUKWIs+j5LDMt+414FaQXOwPKeqRG0fY96RkEufK9Ms/chbgRVUfg
 gd7GmAlp7YLrbnkfV0P1NHhNBw==
X-Google-Smtp-Source: AK7set+t2Lg3LMfBVSAfr0ebEEg+aD8ytfiLfIG1Fy7BEz4qo6JCgaOP8QIkdEikyzqCU5XjGNnVyQ==
X-Received: by 2002:a17:90b:1e11:b0:229:3c5:26da with SMTP id
 pg17-20020a17090b1e1100b0022903c526damr594232pjb.40.1675224842113; 
 Tue, 31 Jan 2023 20:14:02 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a17090a7a8800b0022c01052e92sm231350pjf.56.2023.01.31.20.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 20:14:01 -0800 (PST)
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
Subject: [PATCH v6 6/9] tests/qtest/libqos/e1000e: Export macreg functions
Date: Wed,  1 Feb 2023 13:13:17 +0900
Message-Id: <20230201041320.32096-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201041320.32096-1-akihiko.odaki@daynix.com>
References: <20230201041320.32096-1-akihiko.odaki@daynix.com>
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


