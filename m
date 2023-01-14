Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEE066A93A
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:31:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXt8-0006Vr-Cd; Fri, 13 Jan 2023 23:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXt5-0006T3-0w
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:11:23 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXt2-0007QN-6c
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:11:22 -0500
Received: by mail-pj1-x102e.google.com with SMTP id q64so24267601pjq.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4FcszSrN0Z8qZkzBy36ozCpKc4AAg08VRBsT7xQa8Y=;
 b=sEDDZJpt3I1+YlpB0TE0mj1NR9pMqqI9MHrk1LULXDyrbAqDwz6pNL+gEL8QuG0llL
 3P70j8u/H+dB/85HNKc3y1X3QeGGCftwOAbZ0JUL08IIWxNi6gbpskgZqRWAaS3YGLkm
 x4xNFdWLF4Ma2aC0RxTwe64Fi3zasR2IwjSS77yKn0nk6wk4OWQrgWgLxi0KBfdtQkiE
 I4YALTN+A1vfONm8E0RpCsF6FO0W6XPZ+usgt81D4YZPg4piq7o9SpU8Pa4QtvGB42aK
 fx+hekM/yR0muoe2AJXt15+kBuWDpTCnZMNLzdVWzU1hhivJtBeVhs+hXaovX7U0PcPo
 Slag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4FcszSrN0Z8qZkzBy36ozCpKc4AAg08VRBsT7xQa8Y=;
 b=zxfZOGC+6Vd7q0PNIGmeIFS7GEmSpD06Ct+Dm3agGHPmrdybiusVMkcSaX9lV7xXVt
 v2ocB10zdmlL2PggQb+lDHQu1O81qHtwlGoUZ0MWDMnijSXmiwTVjb3M/qkGLhnsonb6
 SVWcnaC0mfCc7gVuf20E+wYUPv8peMDSdYhxtBwD5JhpgKKnrDenn34VA9EBZoLPmtyc
 rMfOnwC9wPq4S7Uocw0Qulux1lMib5pfNpDWXYO23Iq9lLVFqOq0TZsfxegWvS/VHhT9
 4vsrRqR7enSetixEwTaErSyILXGhFZ8oUVhNp+ItiQGQgOQ2rcNQ/3B3gQqnWaLLLEVI
 JOKA==
X-Gm-Message-State: AFqh2kqK4ZkhSQtIsYqMwh4IWDAL6zCpEHQvsobBrBm+JVs/m/B+I1VK
 NZ+ub13rSaF9jrupzcJJG6XjGw==
X-Google-Smtp-Source: AMrXdXseGPJGmlqWzdtOF0UqTjX9IfW7YMHPtPn8MAXcOFtROyxcCBOsUz1uhjMBr7vYFHjAP5F+TA==
X-Received: by 2002:a17:90b:1208:b0:227:2081:864 with SMTP id
 gl8-20020a17090b120800b0022720810864mr19778359pjb.24.1673669469023; 
 Fri, 13 Jan 2023 20:11:09 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a63ef55000000b00478bd458bdfsm12244535pgk.88.2023.01.13.20.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:11:08 -0800 (PST)
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
 Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: [PATCH v2 09/13] tests/qtest/libqos/e1000e: Export macreg functions
Date: Sat, 14 Jan 2023 13:10:00 +0900
Message-Id: <20230114041004.36459-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114041004.36459-1-akihiko.odaki@daynix.com>
References: <20230114041004.36459-1-akihiko.odaki@daynix.com>
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
2.39.0


