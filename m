Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1876178D7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 09:36:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqVgV-0008Vx-4a; Thu, 03 Nov 2022 04:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oqVgQ-0008VG-U4
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:34:43 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oqVgP-0001tT-7B
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:34:42 -0400
Received: by mail-pf1-x42c.google.com with SMTP id k22so993276pfd.3
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 01:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ExQTa/2vQtZcjXHtlbXnsdRDv+sHogIvrWKnkVd42V4=;
 b=V6CFnzLBlwvWiN4pVYJI7/CnWMdSbrceALCBXkpLSH+HxuirIWa6bFl0wYnlBE3iO5
 PuD7rgaYfq41IT1SK9qJ+K9qBCnsdOhJPOpHtd8i0hKUhFr4QcbTNAaf3TRk2GmsiX1d
 l8G/IV2KPDORLd2i9w4l4wzXWiSAh89Y88b2USLKC8+bpbdiK6TSQP3FudEGPHsbUUXO
 aGTVhwd7DHDObv780+AoHrPBBLOn3V1b2IgqlhiPWaDpHwRdAUdHR2Je5Ut2poUWHhf/
 VUFElQqgdDsTJ5tXWLck+guWjsXyNZrK5ZXBgFqfHGp2M0raPGFPipn6GaurrnaE3kCD
 /A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ExQTa/2vQtZcjXHtlbXnsdRDv+sHogIvrWKnkVd42V4=;
 b=ytJnJn3R4hskPo0bSH8oFj7zLb9almq2DaMFU5ge6VcQvWNJVjaZr+Wp9DpDLtRTpV
 KGq+7DjOTO5GcL2P6k6WYdkAUguKI3H5I40vQZKnzZn5q3L2hoR9ec+E/5NaatXFWKZy
 +yvHBSoV8wWT0w/m38ZdzJ6qkobB2eHk5dVO6JPposWLddCWWskWqgyrKn8rsZH6zB9O
 jx7DTUW1uFrCIr9oPJ6wuzYzJTcOBeWJP0DsvyEptVcAR4nC7/mwDL5oHXqDNV/xPSEB
 wg3No4dw9u5pcl00DRqzc3CA/J5dcoos9wlIo1XSa6TXZ2fZC/5q2ZZV7ixNb3F/9Ehv
 Ttlg==
X-Gm-Message-State: ACrzQf2RdMyGJXHaV3w5pmNShQiZEW7TL+y4FzAxb+fJpuFpZR3eaHkn
 1p5gWotJ8I4+ulWNHlY+zc/b8OBPkDmkcX+7
X-Google-Smtp-Source: AMsMyM4XVUrLI/23AwNpcixhXLIenwcj5ikkLAOtJkgbDgmb6A+rj76UJhF2m2aMqFK+x4Q/Bo3HOw==
X-Received: by 2002:a63:65c7:0:b0:470:a1:5eac with SMTP id
 z190-20020a6365c7000000b0047000a15eacmr8378085pgb.221.1667464478277; 
 Thu, 03 Nov 2022 01:34:38 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902ec8200b00176ea6ce0efsm28105plg.109.2022.11.03.01.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 01:34:37 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] tests/qtest/libqos/e1000e: Use E1000_STATUS_ASDV_1000
Date: Thu,  3 Nov 2022 17:34:25 +0900
Message-Id: <20221103083425.100590-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Nemonics E1000_STATUS_LAN_INIT_DONE and E1000_STATUS_ASDV_1000 have
the same value, and E1000_STATUS_ASDV_1000 should be used here because
E1000_STATUS_ASDV_1000 represents the auto-detected speed tested here
while E1000_STATUS_LAN_INIT_DONE is a value used for a different purpose
with a variant of e1000e family different from the one implemented in
QEMU.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/libqos/e1000e.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index 11d9f55c66..178d61d04f 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -130,8 +130,8 @@ static void e1000e_pci_start_hw(QOSGraphObject *obj)
 
     /* Check the device status - link and speed */
     val = e1000e_macreg_read(&d->e1000e, E1000_STATUS);
-    g_assert_cmphex(val & (E1000_STATUS_LU | E1000_STATUS_LAN_INIT_DONE),
-        ==, E1000_STATUS_LU | E1000_STATUS_LAN_INIT_DONE);
+    g_assert_cmphex(val & (E1000_STATUS_LU | E1000_STATUS_ASDV_1000),
+        ==, E1000_STATUS_LU | E1000_STATUS_ASDV_1000);
 
     /* Initialize TX/RX logic */
     e1000e_macreg_write(&d->e1000e, E1000_RCTL, 0);
-- 
2.38.1


