Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6639E391A1C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:27:15 +0200 (CEST)
Received: from localhost ([::1]:55650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluV8-0001fq-F8
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lluSi-00083n-I8; Wed, 26 May 2021 10:24:44 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lluSg-00061k-Ol; Wed, 26 May 2021 10:24:44 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 n5-20020a1c72050000b0290192e1f9a7e1so626402wmc.2; 
 Wed, 26 May 2021 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ORCeOe/azUUD6/5loOQJVMd3UNGL2eaY5a9u5h5/+WY=;
 b=WEml9EGxhbzp8s9P8UkP9wfbs+CtOgQZQrf8LCx//os/KhXgaxva66W9y3AEH5h6Mn
 8tv77hS5Ugtpaz6UV4LYLpAuciLzG+ZokkCeI1fbwOGs2GbiHRj7kn8NRZBUV0nAMPPW
 XDnjsGlPO0VU1TA0Ppz8hs9sUpJNJURnKCjzEXlQA2iT6VndcVKMLx73ffwWv1yRWr+2
 gspC8gSmBbNZ2EEDzcQ2esI5aNSY1a+dPQnV/txADBhOyx2A8YziTyxk+jfMFkX+EGYV
 hMxOrP8SC4ZW/mBTUbLFroQXz7WIVb91TJz//cmYzIpor3FbqLtGhV7gIGr3z+Djb0EW
 72pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ORCeOe/azUUD6/5loOQJVMd3UNGL2eaY5a9u5h5/+WY=;
 b=FtQ4h7QpX3CBuACIRaynkMDH/oPYjIpgFPrReMHA7tqpOnzeCFDts8T3T7R4qMxlKV
 5Ue18bEKj7XNZyqRBKh8gsX0XIqF1M9AJDq87JxT5tt+Nix5desoRLtz1YDCzsuRy8ME
 tC61gw+UJciS3/TjOQyzthnhEGlS19me0VSnTm1MSD5ySerx80ral2AiykzlaOfJHlyA
 g90mBFsuGMm1LBYMr4XLyFWK/FFHguhJ4jNSScT7IGzy2NzQO+Z1JMmnWA3/6+fTFPQ4
 4tD/h53DDv0l0TJIfDBi42sGbMaFK//MeBRiaAqy6BRUM0AgjNwfHMQSziLOUe5zFXVm
 T0Ew==
X-Gm-Message-State: AOAM533aTEvPFUkgZeTJgtpFp+YkbE0PumfoXO7COn6rAMB3eZiJmSfI
 DfrkdORc7eLTfjF6H5MlenHLAtGZeS+bgg==
X-Google-Smtp-Source: ABdhPJzstc/Gy04+9cH2zR5Ff9PIb23FSM7UwaXkFJhoCHyVStgpXqnVr+3Fbuuu2AueMZbFG0e4vg==
X-Received: by 2002:a1c:4006:: with SMTP id n6mr1493627wma.58.1622039080910;
 Wed, 26 May 2021 07:24:40 -0700 (PDT)
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id p5sm22002220wrd.25.2021.05.26.07.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 07:24:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/pci-host/q35: Ignore write of reserved PCIEXBAR LENGTH
 field
Date: Wed, 26 May 2021 16:24:38 +0200
Message-Id: <20210526142438.281477-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

libFuzzer triggered the following assertion:

  cat << EOF | qemu-system-i386 -M pc-q35-5.0 \
    -nographic -monitor none -serial none \
    -qtest stdio -d guest_errors -trace pci\*
  outl 0xcf8 0xf2000060
  outl 0xcfc 0x8400056e
  EOF
  pci_cfg_write mch 00:0 @0x60 <- 0x8400056e
  Aborted (core dumped)

This is because guest wrote MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD
(reserved value) to the PCIE XBAR register.

There is no indication on the datasheet about what occurs when
this value is written. Simply ignore it on QEMU (and report an
guest error):

  pci_cfg_write mch 00:0 @0x60 <- 0x8400056e
  Q35: Reserved PCIEXBAR LENGTH
  pci_cfg_read mch 00:0 @0x0 -> 0x8086
  pci_cfg_read mch 00:0 @0x0 -> 0x29c08086
  ...

Cc: qemu-stable@nongnu.org
Reported-by: Alexander Bulekov <alxndr@bu.edu>
BugLink: https://bugs.launchpad.net/qemu/+bug/1878641
Fixes: df2d8b3ed4 ("q35: Introduce q35 pc based chipset emulator")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Do not remove default case (rth)
---
 hw/pci-host/q35.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 2eb729dff58..0f37cf056a9 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -29,6 +29,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/i386/pc.h"
 #include "hw/pci-host/q35.h"
 #include "hw/qdev-properties.h"
@@ -318,6 +319,8 @@ static void mch_update_pciexbar(MCHPCIState *mch)
         addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
         break;
     case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD:
+        qemu_log_mask(LOG_GUEST_ERROR, "Q35: Reserved PCIEXBAR LENGTH\n");
+        return;
     default:
         abort();
     }
-- 
2.26.3


