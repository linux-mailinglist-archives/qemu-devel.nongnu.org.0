Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E3753062C
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 23:29:30 +0200 (CEST)
Received: from localhost ([::1]:38812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nst8j-0006tm-H7
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 17:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4R-0002sw-4t; Sun, 22 May 2022 17:25:03 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4P-0005Ra-JX; Sun, 22 May 2022 17:25:02 -0400
Received: by mail-ed1-x536.google.com with SMTP id g12so16889770edq.4;
 Sun, 22 May 2022 14:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ySy5Qh2/rqashHeRzCYokfJk5ESmG04Yqr6Wb5D5T6o=;
 b=cfRODoXcIlJCFvIx0iMeIzEh48ff7fNjDZ4xMPtBrpUc2fC6J/bRxjLW1OYe1LwVYR
 9RlncBU6YHG6nSqyhl3CSVT4ZQ/XBy4c2LkTmelF3YDrzQyYBWD5KP5H25gLUHQphBiu
 GlQcubc2KksuGgy8lHWzC1OqcN5ERCNMPu/gSqSHAXVzGEs96n3pfoWzUlGW7j88XXxB
 sOA3mdLMBwWrk1OPiGORQAP8YBA/Ykb5eZIjUO6lOvEChhg7EY2f79kG4DVx0Q2oWGf0
 Natz7b18z8rDoArdy1NIo9wx2wwK7yuKaS9Y8UgKyWeeRizp0JvqoqaQRRsjayV5zNFH
 1wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ySy5Qh2/rqashHeRzCYokfJk5ESmG04Yqr6Wb5D5T6o=;
 b=5ysnV3/+srhUFkt1NcSbGwEgj//SLRDFym3UdJVAHyn6GbkulHrCkevY8La+rCvHA0
 wy34Vb0Lu1WcKgoDW7GbwXoD6VPAwpCPjj71jg26QhjKaExQHxPXNBU0Kk2Ebw/nC0RG
 h/NKNH4Mt2TkyF53yh+BAzI4eFYYKv9Fll3MdgJlgQXAztOItXFyQYLKqHrLZPAkyI8f
 yu5EkblI5LMI2c+bxb27Sij4QPvv4uXDIxWMo3jI4XB9P8kbpJBRwzObv+GtvuPHvfNr
 G3/uNMcG2fIcIXvY942ytVSftg7DAnNUdATQfLrn2YEFLboWK7vA6j5+qfJKLvUfGbyS
 WYZQ==
X-Gm-Message-State: AOAM532L13E+Hjvxv6qqeYhqORDrZPvENFmPryZf3AH6L1Cl0VkUmihi
 dl+ptHyyLzNjKhPE1nG05Y/DMMKa4Io=
X-Google-Smtp-Source: ABdhPJwBccSjUCiu/CJktam61QhuWe9hLftYUXK/D7h33Hg+AS2c4KnMJBp3q2HIVu10l4VicWYCVA==
X-Received: by 2002:a05:6402:2996:b0:42b:49a:6d24 with SMTP id
 eq22-20020a056402299600b0042b049a6d24mr18239671edb.145.1653254699759; 
 Sun, 22 May 2022 14:24:59 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-075-232.78.54.pool.telefonica.de. [78.54.75.232])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a170907270400b006f3ef214e22sm5418768ejk.136.2022.05.22.14.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 14:24:59 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v2 1/6] include/hw/southbridge/piix: Aggregate all PIIX
 soughbridge type names
Date: Sun, 22 May 2022 23:24:26 +0200
Message-Id: <20220522212431.14598-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220522212431.14598-1-shentey@gmail.com>
References: <20220522212431.14598-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_PIIX3_PCI_DEVICE resides there as already, so add the remaining
ones, too.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/isa/piix3.c                | 3 ---
 include/hw/isa/isa.h          | 2 --
 include/hw/southbridge/piix.h | 4 ++++
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index dab901c9ad..d96ce2b788 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -35,9 +35,6 @@
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
-#define TYPE_PIIX3_DEVICE "PIIX3"
-#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
-
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
     qemu_set_irq(piix3->pic[pic_irq],
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 034d706ba1..e9fa2f5cea 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -144,6 +144,4 @@ static inline ISABus *isa_bus_from_device(ISADevice *d)
     return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
 }
 
-#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
-
 #endif
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index f63f83e5c6..4d17400dfd 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -70,6 +70,10 @@ typedef struct PIIXState PIIX3State;
 DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
                          TYPE_PIIX3_PCI_DEVICE)
 
+#define TYPE_PIIX3_DEVICE "PIIX3"
+#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
+#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
+
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
 
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
-- 
2.36.1


