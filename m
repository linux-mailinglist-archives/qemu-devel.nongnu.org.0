Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B524614C85
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 15:24:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprmU-0005kP-2q; Tue, 01 Nov 2022 09:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmR-0005jQ-8y
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:16 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmN-0003qU-Nq
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:14 -0400
Received: by mail-pl1-x62a.google.com with SMTP id io19so13624105plb.8
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29Tl+P3mSiU78ARC9EiNGA3UTZk5OANT2noEj4nlK5E=;
 b=Uvz/3ZW8WgEuaA3oO2fZOhWmgcY3KL0u4uQLBW+e/8yWnuRAisDUfraFtUXJpSfpqu
 qASpKSTwEOrv0Y1MJL4OnXITqXWVjpE5fDxWpqTJB7OSGXTVuCTEB9d+qPJaHIX0ZjPp
 qayrNgiBnjdPxpAoD2yBkBsqVRX6cpmGrkg/jln1bAYWSWVIXT/OgKidf2Vp5ZxBE5jD
 6b3g6FtDT5GxQtGhXmCY+X2Q98fNUI2ZxGq2eyeQVFgsXfwvzqqPQySToTkmgi+ycEAo
 zUhf3jFwVtIBQiQCPMiCPIbsWZRbdovpSbl9nkXZe6eW1ZcU2KVtQfhfpFCjEKhO8M+9
 VfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=29Tl+P3mSiU78ARC9EiNGA3UTZk5OANT2noEj4nlK5E=;
 b=E13QAduOI2RvR57StPZW6iA6JDAXHxTCb2rFnsJuNmojKU0GvyzX3MiqKmINFBoSWW
 X3p3Fyb31X1TsYPbpWo8O91zyZZVVQeQqUp4CkKa0Pgp/qnLDGegmBNjND//C7+xG7Un
 NRQgloWaF8wFnVLztGmf0UKdnRqBRG40OQrJ8nGVLS/0qstRUUR1l3aLecDZ8lDYkJR2
 KQZU6FyNMpIvVfkqsfGGOeNAk57/59I4jShRvcDianZWvqRYhveC/w47uTNCjc20drSn
 pt8y9b+XmAZyBukahDcqSFk58nLRZiMNqe4SuWRCvj8yu5o+eu0S3hHdIIjs2FmLoUAa
 c4LQ==
X-Gm-Message-State: ACrzQf34ImbYRSjSfHRghsfls7ltN0kGY+Ze3QWzCVncu53u2ZJpZ6Ot
 ztoQ+0EwLAwwVBympXQ6ChiRACE7Vgy0zEMm
X-Google-Smtp-Source: AMsMyM7UM6xrGjLdkXP5SE9mV3mWn9umrEWkUPgf4P8Tjmmlr4FG46YvnIgXrqKhEYhPtqaqnyYzBg==
X-Received: by 2002:a17:90b:4b45:b0:214:e16:65b7 with SMTP id
 mi5-20020a17090b4b4500b002140e1665b7mr3898116pjb.39.1667311089987; 
 Tue, 01 Nov 2022 06:58:09 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:58:09 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v8 02/17] pci: Allow to omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:34 +0900
Message-Id: <20221101135749.4477-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

pci_add_capability appears most PCI devices. Its error handling required
lots of code, and led to inconsistent behaviors such as:
- passing error_abort
- passing error_fatal
- asserting the returned value
- propagating the error to the caller
- skipping the rest of the function
- just ignoring

The code generating errors in pci_add_capability had a comment which
says:
> Verify that capabilities don't overlap.  Note: device assignment
> depends on this check to verify that the device is not broken.
> Should never trigger for emulated devices, but it's helpful for
> debugging these.

Indeed vfio has some code that passes capability offsets and sizes from
a physical device, but it explicitly pays attention so that the
capabilities never overlap. Therefore, we can always assert that
capabilities never overlap when pci_add_capability is called, resolving
these inconsistencies.

Such an implementation of pci_add_capability will not have errp
parameter. However, there are so many callers of pci_add_capability
that it does not make sense to amend all of them at once to match
with the new signature. Instead, this change will allow callers of
pci_add_capability to omit errp as the first step.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/pci.c         |  8 ++++----
 include/hw/pci/pci.h | 13 ++++++++++---
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index b53649d1fd..cce57f572c 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2532,14 +2532,14 @@ bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
 }
 
 /*
- * On success, pci_add_capability() returns a positive value
+ * On success, pci_add_capability_legacy() returns a positive value
  * that the offset of the pci capability.
  * On failure, it sets an error and returns a negative error
  * code.
  */
-int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
-                       uint8_t offset, uint8_t size,
-                       Error **errp)
+int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
+                              uint8_t offset, uint8_t size,
+                              Error **errp)
 {
     uint8_t *config;
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 77b264c17e..50c00ece3e 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -2,6 +2,7 @@
 #define QEMU_PCI_H
 
 #include "exec/memory.h"
+#include "qapi/error.h"
 #include "sysemu/dma.h"
 
 /* PCI includes legacy ISA access.  */
@@ -393,9 +394,15 @@ pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
                                   uint8_t offset, uint8_t size, Error **errp);
 
-int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
-                       uint8_t offset, uint8_t size,
-                       Error **errp);
+int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
+                              uint8_t offset, uint8_t size,
+                              Error **errp);
+
+#define PCI_ADD_CAPABILITY_VA(pdev, cap_id, offset, size, errp, ...) \
+    pci_add_capability_legacy(pdev, cap_id, offset, size, errp)
+
+#define pci_add_capability(...) \
+    PCI_ADD_CAPABILITY_VA(__VA_ARGS__, &error_abort)
 
 void pci_del_capability(PCIDevice *pci_dev, uint8_t cap_id, uint8_t cap_size);
 
-- 
2.38.1


