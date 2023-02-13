Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B769694E12
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:33:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcfh-00087A-0x; Mon, 13 Feb 2023 12:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfb-00084u-Iu
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:17 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfY-0005PC-BN
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:14 -0500
Received: by mail-ej1-x633.google.com with SMTP id n10so6785603ejc.4
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pG41OOUa5g/2wKwnqxkkUEWtIRp2Dll0QKlkKRVDIKI=;
 b=GvXamY+5Vf5u6rKFYPWnAEl5MLXe1o9Qv16h2YqGLhrx2sxyKsHQmLBEF+GoDx7hzJ
 Y0B23/1OlnmpjipJ+iZUH9L+Sv3moJpdQwNDanAvgC6DuFem1qs5hIt5amyJjg7llr5P
 EGtv9IiGkzruEljJiYaokuvhKyjvx0/cBYSRgiJTzdZKAa63OBqyV06LFtWc1n8Bpa0c
 N2goc7H7Ta8tCU8i+vsa7jJD+HHka/jiX3EK+o2r+5UhopeZk7DAvd14erIIMkpITuTE
 20iYjrMzfyCDQxTyLXn60BSgeydZkWu6/cFgOW5cKwSxsJsM1646+ZWkUXkRXIhAkitm
 Uh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pG41OOUa5g/2wKwnqxkkUEWtIRp2Dll0QKlkKRVDIKI=;
 b=o9EqCgyxsM8wTxMC3+RoLOJa1ncRX8zuGRww2BQZt/mnQWTWdH+qSYisX8vjOYyEpf
 i4RFIcIHcipKielz3WKhuxmZ2JMi6Vd4tmUj2CLbFuK/KZf5BLNSlhoJbr1liy72y1vM
 dXyt9H4qk5U3RQTSL6WOX0tye8tBfmNDRlNZELDAYkF6mIBxxbM4iDDxaS2Ohmq5iNLO
 rxHNIP6iHcMuKNOObG82beXSWwoYh0i27bVfnvjGMkxeyP2M4KMYaV6aaW2Xs1x+G381
 L/mibS4zAtcdnApCtd/nSM/XM9Aaz15kUFnhrPyeRt+bo+VqfjwnwVN4Ba2T5dd6Lg0i
 vj6A==
X-Gm-Message-State: AO0yUKXhW+JJq12x38b/puUJQjF/ihsc2VX+5YtrdWATNp0T30l7DxBx
 eBtgxyXWJtGJQzNqci9iuOebDHC3vos=
X-Google-Smtp-Source: AK7set/yTdp7pu9lfDAlvU1jT2pYj5pPtRS1Ehd9dmC5nROsbux2Jn531457LvoBgtbRGxZhR3qKvA==
X-Received: by 2002:a17:906:f293:b0:8b1:2687:51b1 with SMTP id
 gu19-20020a170906f29300b008b1268751b1mr500875ejb.56.1676309464200; 
 Mon, 13 Feb 2023 09:31:04 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm6988699ejs.183.2023.02.13.09.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 09:31:03 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 04/12] hw/i2c/smbus_ich9: Move ich9_smb_set_irq() in front of
 ich9_smbus_realize()
Date: Mon, 13 Feb 2023 18:30:25 +0100
Message-Id: <20230213173033.98762-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213173033.98762-1-shentey@gmail.com>
References: <20230213173033.98762-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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
index 52ba77f3fc..d29c0f6ffa 100644
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
@@ -125,18 +137,6 @@ static void ich9_smb_class_init(ObjectClass *klass, void *data)
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


