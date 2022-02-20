Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C089F4BD0F5
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 20:31:17 +0100 (CET)
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLrvQ-00033X-SY
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 14:31:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nLrrl-0000Us-1E
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:27:29 -0500
Received: from [2a00:1450:4864:20::434] (port=34763
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nLrrj-0006KU-Fo
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:27:28 -0500
Received: by mail-wr1-x434.google.com with SMTP id d3so7864399wrf.1
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 11:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=faMqYrcbBhMm4Agcylv9OBBgYNSCXbdLwzLNfv+zh34=;
 b=CYE5rwAXJtQz0gI0mX8/drZMtf8pk8a0+F6OT2ZutEPwp/Bmg7XM2aCkJ8IDEn+3k9
 B71Up/qzrG+qrGeDknjVnFNeKDkYtHMxXH60ryO3o9KKWjDXUWERzh0dIe4+vnMYvTQH
 ZASvAJhEt4XzVfOEGug4Oml38UHv16qujAL9ay2gb2H/xyI3wIVbRso8iDFXDTHas/uS
 +SLuI3UwkxhydQ/pQxsXF8f9Xnq5VWPmMVCsFbayxUhQdNU8eh8Im2BybSo8n2+K0LPt
 hVq3C638BIqN1GdKv08pZUX/YxPBRT3cxOk1Yh6a1uIPloAE4EENxDMIU0IRthSUOQCc
 dNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=faMqYrcbBhMm4Agcylv9OBBgYNSCXbdLwzLNfv+zh34=;
 b=F/1FhmBE5QYqtM9UXjoHhcpD5VSEIwFCwbd4WRo/Iq/BDm7gAOj42stgywClv/ZXNB
 h+GUlcWhzhM5nC+hjEUiYg+PBsenP8qrVmN5eDFkrApM/LzOam2JUQLe3TVS8RyP/UkP
 /mfVP9V3MVRYH53gyG1X/fFj+WUmDsqade4JcYpMKyyRYMdi51Z+6j8QXtu9Rop2Dmiw
 dG0ovB+dMpVqW4PrwckblUm2+1GOpeRPcEdRYW6fkIRQFlwzWrJ8Vj3aCYjTP9iaObEv
 JnUPAWmV+a4TB2tzkps+kyX+oxdfiAUF02Ax9YNSg/G5mJqx++Oqy6/gGEd+7AcHShEw
 VZOQ==
X-Gm-Message-State: AOAM531DZ7nSQeHCweB9Dg6HzN+TYFE1AUsE8GaAkXu6vJzbwkZnQ82I
 JrkaphNBOrutkqc7gWZo6mlY3hmiorcaxA==
X-Google-Smtp-Source: ABdhPJwBuO/PpWSrYbr5dQF+kjhncgnLHM0qQtRsWvugN4rzmPGr2zYGm4d34Tink8+8zEP1wgPYDQ==
X-Received: by 2002:adf:8bc6:0:b0:1e3:200d:a363 with SMTP id
 w6-20020adf8bc6000000b001e3200da363mr13803138wra.105.1645385245181; 
 Sun, 20 Feb 2022 11:27:25 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id c14sm9975786wru.37.2022.02.20.11.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 11:27:24 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/isa: add function to check for existence of device by
 its type
Date: Sun, 20 Feb 2022 21:25:48 +0200
Message-Id: <20220220192549.591703-2-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220192549.591703-1-liavalb@gmail.com>
References: <20220220192549.591703-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, imammedo@redhat.com, Liav Albani <liavalb@gmail.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Liav Albani <liavalb@gmail.com>
---
 hw/isa/isa-bus.c     | 17 +++++++++++++++++
 include/hw/isa/isa.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 6c31398dda..39d1768797 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -222,6 +222,23 @@ void isa_build_aml(ISABus *bus, Aml *scope)
     }
 }
 
+bool isa_check_device_existence(const char *typename)
+{
+    assert(isabus != NULL);
+
+    BusChild *kid;
+    ISADevice *dev;
+
+    QTAILQ_FOREACH(kid, &isabus->parent_obj.children, sibling) {
+        dev = ISA_DEVICE(kid->child);
+        const char *object_type = object_get_typename(OBJECT(dev));
+        if (object_type && strcmp(object_type, typename) == 0) {
+            return true;
+        }
+    }
+    return false;
+}
+
 static void isabus_dev_print(Monitor *mon, DeviceState *dev, int indent)
 {
     ISADevice *d = ISA_DEVICE(dev);
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index d4417b34b6..65f0c7e28c 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -99,6 +99,7 @@ IsaDma *isa_get_dma(ISABus *bus, int nchan);
 MemoryRegion *isa_address_space(ISADevice *dev);
 MemoryRegion *isa_address_space_io(ISADevice *dev);
 ISADevice *isa_new(const char *name);
+bool isa_check_device_existence(const char *typename);
 ISADevice *isa_try_new(const char *name);
 bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp);
 ISADevice *isa_create_simple(ISABus *bus, const char *name);
-- 
2.35.1


