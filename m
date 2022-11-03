Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5983A6173E0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 02:52:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqPNR-0008Dn-91; Wed, 02 Nov 2022 21:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oqPNN-0008DE-05
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 21:50:37 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oqPNL-0004aD-4q
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 21:50:36 -0400
Received: by mail-pl1-x62b.google.com with SMTP id v17so572451plo.1
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 18:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fvtlysit2fplNHDZ7rKTR5+Y0mzE26XUzMb6NbiH/Xc=;
 b=A4s6CeFBIGHIDPOknkP8n91Jae50Q+28TXOby54afwAjPIdF8o8xmXsL3oDcs7WCV5
 xDb5lyPlu0AzkaiYXjsCdeHN1vSEJBRT/YTKfTojIm3XrKMNLlkecuoYA/1DZ66hJQOR
 VE3MKmX0n7uIQD7nNVGtq7faIHff+EDJtjGn0GsKU8UzcRGPpMShnR1fVgu/l3ik9q9L
 zqFyky03R6vKO9zFFYoGtzVB6LaTB1RCEuwJSGSQJX54izH2hWWhnqW0tN7RABs1/r8n
 hg5pe4pUlhPMeMoj7zZ4Djerl3YfntKP3+1uapc31pY5OIsvO9qF8Q0qPhAvdYEIjvNt
 a2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fvtlysit2fplNHDZ7rKTR5+Y0mzE26XUzMb6NbiH/Xc=;
 b=aKvUFUIoJ+PGu2xhu6klTDQQsjsk2wq0bOIVRsi7Y92nADUeZ/kNQcsdnMfITLWPYy
 VGwP/T01TLe0MjKevfVrsZvIOxxG331lAyCTMGQ2Rjf8tZsWm6Q1fiTkSdyCLdt6sz/m
 Un4V2Z8pTyg7gxiGc7J7t5qWqpJFQvXgM6s1lxVDSN88G/1Es3vnZEvUr+3dlZB4zab6
 2B2UswSdFj7tm5ul/uSIpYDLLlQKDwM1sH9Ns+iHy2e2mTZRedj5wyGfUrZdvZ8m3aKn
 dER0hXq3KFWGI9uQv9+lHnqsZRQIM+jn2hGdxVRi2UiGfJUKSnAspX0v/NvXJArsHJYG
 OAPQ==
X-Gm-Message-State: ACrzQf3XuotEb4NrY0aYq731UoteiCBQQrKTMcToJtqJhLXKPSblsNvN
 axet/2MYhZcz3fnrSwU8P59HDUPdmovfwJLc
X-Google-Smtp-Source: AMsMyM5eTIa8xrvFlGnKMMS9WW0eFCfIQxNeLJka9k9WD+7cQDmbP+nQSpgaKRHtjPAVIJAqr7pS5g==
X-Received: by 2002:a17:902:d891:b0:186:634e:5525 with SMTP id
 b17-20020a170902d89100b00186634e5525mr27423779plz.126.1667440232970; 
 Wed, 02 Nov 2022 18:50:32 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm9039896pfp.186.2022.11.02.18.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 18:50:32 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] tests/qtest/libqos/e1000e: Refer common PCI ID definitions
Date: Thu,  3 Nov 2022 10:50:17 +0900
Message-Id: <20221103015017.19947-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
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

This is yet another minor cleanup to ease understanding and
future refactoring of the tests.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/libqos/e1000e.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index 2ea5db65d8..1f2ccccb8f 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -18,6 +18,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/net/e1000_regs.h"
+#include "hw/pci/pci_ids.h"
 #include "../libqtest.h"
 #include "pci-pc.h"
 #include "qemu/sockets.h"
@@ -217,8 +218,8 @@ static void *e1000e_pci_create(void *pci_bus, QGuestAllocator *alloc,
 static void e1000e_register_nodes(void)
 {
     QPCIAddress addr = {
-        .vendor_id = 0x8086,
-        .device_id = 0x10D3,
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .device_id = E1000_DEV_ID_82574L,
     };
 
     /* FIXME: every test using this node needs to setup a -netdev socket,id=hs0
-- 
2.38.1


