Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD00682C02
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:56:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpDE-0006mZ-Cd; Tue, 31 Jan 2023 06:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDC-0006kb-Hn; Tue, 31 Jan 2023 06:54:06 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDA-0002P4-Ss; Tue, 31 Jan 2023 06:54:06 -0500
Received: by mail-ej1-x630.google.com with SMTP id dr8so19236932ejc.12;
 Tue, 31 Jan 2023 03:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cjbKNJ2e/Nb+msjDvSg2Rp01VPuMdSK9TW+rDQ4iT2Q=;
 b=RUcZfjAZTx8VlDv3/Xh//0GaY3AMLo3GbyeKnUCR6wEUnSLK/dgkdkxOJ6ShGjnJc6
 mhZpc4/R0s0GuawtBPv+5aJOTNnhzNKKNFHoA0+kzh2smoLBFYXQSOjXne8CnD28pii0
 HMaeWeGEWNUSUt+PY9n8Mq4zf5EBtIrEas7le60MD5mvhnMtkOggYwDJNh8x8aJNxzvf
 i/ZfLr6HjV+mdszQstO47ZDwyO3cnI6a8LtGJWyPgbj5woQl6szDdafApQ/+lVEQ1UJd
 19Tx3/s1jmraeH8Io+/QmhTQuTTbRAk3LbUnoFTlavGERKwCi2Ck+LXY6ekuQYKaG9EW
 2V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cjbKNJ2e/Nb+msjDvSg2Rp01VPuMdSK9TW+rDQ4iT2Q=;
 b=aVm4q4zWfwaZC4Rje/pkhijjSHM3QFvO+jX75BXjyX2uzDE82IwU/2YUxi3/eenCDw
 iglIJYXunO4F0bLWgQAJ8+CWO1UeHG3olVYfxxmtmvj5l1rZVF0lz3ejRWj0iD+OrjjO
 BWuwk6IHMFzuwtwC55I8pMqZ3md6etrDzMZP0wRtm35tk66PhVwYvl1yY4ZhVxsrqiG1
 X9rpazlU3e+KumVj1ipqLcFxAPA2bq+CCR4Uq62fnbOqkKb7dp43i5cnEqnxC7U8tPAI
 08s1An0eOTApw/sfNmbFsfeJiWC8j4I90exvYajJt1XfELjg+beYUBHdw2LvzRgmO3jh
 rcUw==
X-Gm-Message-State: AO0yUKW7O9lZLPU6sWFJnAZjWNoLB3sESeDtVxL4R/rGmt7w9Mf5kJNS
 Qji+4gO5/PXaG/4a7U6B0w2WEJulRo8=
X-Google-Smtp-Source: AK7set84EY8pxQcsyz6ZxFnuPjw2k0WV6qv9yiy9Ipd0iR161RwuKb3hn3kJfaQQpNbZyFWQc2V6qg==
X-Received: by 2002:a17:907:c23:b0:870:2cc7:e8e2 with SMTP id
 ga35-20020a1709070c2300b008702cc7e8e2mr3624927ejc.54.1675166042697; 
 Tue, 31 Jan 2023 03:54:02 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:54:02 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 12/20] hw/i2c/smbus_ich9: Move ich9_smb_set_irq() in front
 of ich9_smbus_realize()
Date: Tue, 31 Jan 2023 12:53:18 +0100
Message-Id: <20230131115326.12454-13-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is a preparation for the next commit to make it cleaner.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i2c/smbus_ich9.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index ee50ba1f2c..06d97ac942 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -80,6 +80,18 @@ static void ich9_smbus_write_config(PCIDevice *d, uint32_t address,
     }
 }
 
+static void ich9_smb_set_irq(PMSMBus *pmsmb, bool enabled)
+{
+    ICH9SMBState *s = pmsmb->opaque;
+
+    if (enabled == s->irq_enabled) {
+        return;
+    }
+
+    s->irq_enabled = enabled;
+    pci_set_irq(&s->dev, enabled);
+}
+
 static void ich9_smbus_realize(PCIDevice *d, Error **errp)
 {
     ICH9SMBState *s = ICH9_SMB_DEVICE(d);
@@ -128,18 +140,6 @@ static void ich9_smb_class_init(ObjectClass *klass, void *data)
     adevc->build_dev_aml = build_ich9_smb_aml;
 }
 
-static void ich9_smb_set_irq(PMSMBus *pmsmb, bool enabled)
-{
-    ICH9SMBState *s = pmsmb->opaque;
-
-    if (enabled == s->irq_enabled) {
-        return;
-    }
-
-    s->irq_enabled = enabled;
-    pci_set_irq(&s->dev, enabled);
-}
-
 I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base)
 {
     PCIDevice *d =
-- 
2.39.1


