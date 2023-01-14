Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9604266A933
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:24:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXjd-0000w6-G4; Fri, 13 Jan 2023 23:01:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXik-0000N2-Ey
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:42 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXig-0005fB-8F
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:41 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 s13-20020a17090a6e4d00b0022900843652so7314309pjm.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=stqqQOmPDTeUlCDCM5EqHgRPUm+ihzUsJ5RvofEjHxU=;
 b=ejr6w2VgsROmAAfcbdBWouM8okZfpt6zu0vaSV3ZZcixU84+knPaL6iCXnhomMsszr
 XfEaP3Ti5UqeieSy6mAchZsjFERefybny3L7iJ2kzvhHHb5LwP5EGDreWc9xP2jPjVZu
 PDZ1Af0J7uUMZvKU/r/5Eo78Co9vUnDuMN/8+uglJC5zb75mU7abfMl8oDDSU6a+wh8o
 gtDYbSpflSQuW1Vbepg4mzL4437L+HJA0MgsDtg3BN1ojEShF4aOyjre30exGEV5sFm0
 tX7HFKkvLfwkBt9oZ8v8b1OAtr95aVS7DY07K+RRNvY+aQGkEtATUmRsXaiyp8cXtUFD
 84MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=stqqQOmPDTeUlCDCM5EqHgRPUm+ihzUsJ5RvofEjHxU=;
 b=WQ0PMYbBGmjlEVHDo8Ugnd/ajyE1HZssnatsBiBedlhxu1OUN8JxURvvJ7fNX0WDHa
 dVByRueTzIzjr9sZ3ZOtBNwgt0OglM+Q0oKoZWmaXeSm+BCDphucNbXC05TPY/GbUlPL
 OB+YZET4nRfgZ95UUdFOyvd8MtFA/5Vbr4u/N1OSFxd1Xc/chNngkyANacjuuBsZYC81
 xn5ZtDY6RT4VVSmT3sUtL5kTkFsLk//zjp5UGolY6e8Gtv0YdsuTifzeipsV4Q+wCm51
 uQUeTrwzyImKQ2cYt8vGLujxIKk6w53Cmg9bLKzUPBWHQHAR4TUqNb9VSCLHt9zMT0Ek
 P8Sg==
X-Gm-Message-State: AFqh2kpbYdVGK+Bm+X9KNY5E2PXPYX0zn7aoPdsM+Z/RuMXoZpugHhvK
 IP7mUdRrtfSo9kaedoXn3Sfqln3Iw7q7mfkH
X-Google-Smtp-Source: AMrXdXufsAR5Ta4GN4hdkH5SjKMQl12HnSkXsPg/Ty+nR1rIMUVmzXhZOQZTrIn+juSxs3+49CRYhg==
X-Received: by 2002:a17:902:784a:b0:193:3354:1c22 with SMTP id
 e10-20020a170902784a00b0019333541c22mr12547121pln.39.1673668837581; 
 Fri, 13 Jan 2023 20:00:37 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170902868f00b00189fdadef9csm910894plo.107.2023.01.13.20.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:00:37 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 19/19] tests/qtest/libqos/e1000e: Remove duplicate register
 definitions
Date: Sat, 14 Jan 2023 12:59:19 +0900
Message-Id: <20230114035919.35251-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114035919.35251-1-akihiko.odaki@daynix.com>
References: <20230114035919.35251-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102d.google.com
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

The register definitions in tests/qtest/libqos/e1000e.h had names
different from hw/net/e1000_regs.h, which made it hard to understand
what test codes corresponds to the implementation. Use
hw/net/e1000_regs.h from tests/qtest/libqos/e1000e.c to remove
these duplications.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


