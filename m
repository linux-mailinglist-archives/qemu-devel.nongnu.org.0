Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDFD6484CF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:16:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3f6V-0004xR-5G; Fri, 09 Dec 2022 10:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6T-0004wx-Qq
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:15:57 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6S-0008BK-66
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:15:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id u12so5500014wrr.11
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 07:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kOTrs8mNdt7bcK7mby1WZ2jBtzKRPzMs0pMqA0HZVCA=;
 b=wkPnFRTZgTI8qrZQ/dF/m00n+c8C1bddPte+u0B2kUZSgRxNw1KPi3fvkWEe4NUYPw
 crQJHpP6nlCRCHoPRm8ixL20Vg2K5u+DpFg8LJZ8+340K7Y6pIpuMlbVwIx4xNcJmASP
 5gYgfMvBmrIqMoltle2VdI98U3p5j4JOUZo8ue59ZFti5c4WLU6sIajsmkdaPnZ4mXQf
 iDhx62oDc7gzAbxMeFP1Oyw8C8THIY+9aPj+RbazG6Vurgg0MT4ogPuNNep68eI4lX03
 taSZFEiM6eB+q28VXUovhNljimQU5GrL3hWSK1aP3Yq2w9JfLFj8s+/Ra58fcLVQvF9f
 VZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kOTrs8mNdt7bcK7mby1WZ2jBtzKRPzMs0pMqA0HZVCA=;
 b=xkQP1Qnb5GKSsRkIB6V9oIqspDMyTuirt8kjJhtF4yoPeej0EqajNAuvgc79Ou292x
 c+3z99rSdHm8uyAHavZ/ju1Uv/RvQQQoeOxFfplydck9vU+oOMQurWYYsddRvau6YZ10
 I9T5pFB+rC141IjhVW//IaPc1EtR3vN6WlSpX0ZQ+oIRAWh+87MyI6Qb6YaffxF8SEb+
 hVk7wrr+Vq+RJEaHvCMkurTREWEWrlhDBPtLGLFbe3Fh/9hNbGT/nC6yKHRgXabOpfUC
 GKBBWA+NMLY5BWZhVt54/0i1euxTMDntv2FhMo4Iu/LJWtdLvXESPV64IEdmwkc6ctlB
 iQwQ==
X-Gm-Message-State: ANoB5pnvyDOMNReC0HP+M6RFYhfFU7FmUdcTV482C+/52q9LTCoa8Xrm
 3nfbHsSQrANXBXKvmEPkbSQ3D7OJMW8jyYvN3sE=
X-Google-Smtp-Source: AA0mqf4USiGVNBmOSFjyh/+TrbqXRLOY82//4ebbrcN8qYB6Qo9X/r7bvVs92eSE23qzyDbfAdNRAQ==
X-Received: by 2002:a05:6000:1f05:b0:241:8759:f969 with SMTP id
 bv5-20020a0560001f0500b002418759f969mr4869954wrb.0.1670598955241; 
 Fri, 09 Dec 2022 07:15:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056000137800b002428c4fb16asm1641445wrz.10.2022.12.09.07.15.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 07:15:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-8.0 4/7] hw/mips/gt64xxx_pci: Add a 'cpu-little-endian'
 qdev property
Date: Fri,  9 Dec 2022 16:15:30 +0100
Message-Id: <20221209151533.69516-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209151533.69516-1-philmd@linaro.org>
References: <20221209151533.69516-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

This device does not have to be TARGET-dependent.
Add a 'cpu_big_endian' property which sets the byte-swapping
options if required.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 8c9ec80f7c..9ae4953d1e 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "qemu/units.h"
 #include "qemu/log.h"
+#include "hw/qdev-properties.h"
 #include "hw/registerfields.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
@@ -242,6 +243,8 @@ FIELD(GT_PCI1_CMD,              SByteSwap,      16, 1)
 
 OBJECT_DECLARE_SIMPLE_TYPE(GT64120State, GT64120_PCI_HOST_BRIDGE)
 
+#define FEAT_CPU_LE 0
+
 struct GT64120State {
     PCIHostState parent_obj;
 
@@ -252,6 +255,9 @@ struct GT64120State {
     PCI_MAPPING_ENTRY(ISD);
     MemoryRegion pci0_mem;
     AddressSpace pci0_mem_as;
+
+    /* properties */
+    uint32_t features;
 };
 
 /* Adjust range to avoid touching space which isn't mappable via PCI */
@@ -994,11 +1000,7 @@ static const MemoryRegionOps isd_mem_ops = {
 static void gt64120_reset(DeviceState *dev)
 {
     GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
-#if TARGET_BIG_ENDIAN
-    unsigned cpu_le = 0;
-#else
-    unsigned cpu_le = 1;
-#endif
+    unsigned cpu_le = extract32(s->features, FEAT_CPU_LE, 1);
 
     /* FIXME: Malta specific hw assumptions ahead */
 
@@ -1229,11 +1231,18 @@ static const TypeInfo gt64120_pci_info = {
     },
 };
 
+static Property gt64120_properties[] = {
+    DEFINE_PROP_BIT("cpu-little-endian", GT64120State,
+                    features, FEAT_CPU_LE, !TARGET_BIG_ENDIAN),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void gt64120_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    device_class_set_props(dc, gt64120_properties);
     dc->realize = gt64120_realize;
     dc->reset = gt64120_reset;
     dc->vmsd = &vmstate_gt64120;
-- 
2.38.1


