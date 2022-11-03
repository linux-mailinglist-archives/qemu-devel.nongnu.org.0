Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D1561749C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 03:56:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqQNt-0000SW-47; Wed, 02 Nov 2022 22:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oqQNq-0000Rx-5C
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 22:55:11 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oqQNo-00052s-Hq
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 22:55:09 -0400
Received: by mail-pl1-x629.google.com with SMTP id 4so709024pli.0
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 19:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7U08m4TM3eeWWGOOMd2Vnh7U/Jcu1ez0NntUYoKhBd0=;
 b=Q+/eyVjVYmw6xbIhG+UP0+OlvzdTrqNY/Xib6alE0X8/kVq4W4dm4H+CUx7UJyLRwN
 Rxh4GcervLwa8hzwkto5AtDPSmFhCfWZM6DArpgni6ShfT5MBmaYxtxUXoxDB6ZD9DYL
 Hax6loWnTpZE7G5JlxzVGolUGk306y7x6p0QhXOBvLjtGFtVf2Et7x1+i2Rghn4xPUN/
 xfBxr37bvJriEj56+aLhAHw7Y0tziOFP+XksgD8v3pcrE9yKuNMLtBxnvwRfo8MUUjE/
 fkP7RTBBLKIsfMXdhg1USdzNj9I/pLkUZIhDX21oe4S0TNWlP7SmdmB48yDeLMyR8El/
 depQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7U08m4TM3eeWWGOOMd2Vnh7U/Jcu1ez0NntUYoKhBd0=;
 b=5m2SJVZHJp25cGrVa2WavIxDMrnEguZT78xWVkRHBGIgLQY68nnfmoiFQvls0JMr1y
 efj9GxpMPNWYa0FdW7JSWMwaAQ5Api7QhGlQ+jzaYEG3pQ438jBCzpyfzXKLD7vp7zp/
 bRnlcpUYvTi04wEylu1GA6/Z3v/kxDJUkmr2X5zn69ejqkR8bsJp++oaLhcg7koOnFmc
 nBFCidaKMZ0E0HRZMYWpd41450wouhIH7oEYxZOP0VJGvWP5WeJ4WX1MI7jUqhqtSCqx
 pD5DnhpbdGTmMQe//Qg0v3mrQSfJAQeEAZnMzM9LXnWP5eRX9/Gu6x1dCJtQoZn7LEL5
 qGNQ==
X-Gm-Message-State: ACrzQf1XdGhS+1B8r66Ggi4VzCG+5gNIVV8ihqKVwntyzHW/0SUrKg3e
 69FUwOrlbO9TsrF3UsSc6YgGfOP9f//OHU+Y
X-Google-Smtp-Source: AMsMyM6lU5Yq8osdDQS2+iPIUN8MOELcQ97dcBAKq0Od0Ns6tyyWAH6w+XvWxMCFerAybBoC/ddSEg==
X-Received: by 2002:a17:90a:600a:b0:213:2a:851c with SMTP id
 y10-20020a17090a600a00b00213002a851cmr45756240pji.177.1667444106683; 
 Wed, 02 Nov 2022 19:55:06 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a170902a50500b00185507b5ef8sm9024779plq.50.2022.11.02.19.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 19:55:06 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] tests/qtest/libqos/e1000e: Set E1000_CTRL_SLU
Date: Thu,  3 Nov 2022 11:54:51 +0900
Message-Id: <20221103025451.27446-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
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

The later device status check depends on E1000_STATUS_LU, which is
enabled by E1000_CTRL_SLU. Though E1000_STATUS_LU is not implemented
and E1000_STATUS_LU is always available in the current implementation,
be a bit nicer and set E1000_CTRL_SLU just in case the bit is
implemented in the future.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/libqos/e1000e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index 1f2ccccb8f..11d9f55c66 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -122,7 +122,7 @@ static void e1000e_pci_start_hw(QOSGraphObject *obj)
 
     /* Reset the device */
     val = e1000e_macreg_read(&d->e1000e, E1000_CTRL);
-    e1000e_macreg_write(&d->e1000e, E1000_CTRL, val | E1000_CTRL_RST);
+    e1000e_macreg_write(&d->e1000e, E1000_CTRL, val | E1000_CTRL_RST | E1000_CTRL_SLU);
 
     /* Enable and configure MSI-X */
     qpci_msix_enable(&d->pci_dev);
-- 
2.38.1


