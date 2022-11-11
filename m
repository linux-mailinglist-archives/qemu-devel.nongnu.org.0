Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F8F62612D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:32:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYix-00086y-8N; Fri, 11 Nov 2022 13:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYit-000860-2t
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:53 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYio-0005Hj-9R
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:50 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l14so7522079wrw.2
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PuFr65DHYvQCpbDpxv+MZAfjV8gOeGfjlaJ44Vc426s=;
 b=aJshykLP0PtUguLo0DEJ0h4HZCXzfht+GQ5Lo3KjQtfi31kn6BxXDx48gAC+j5Ja7z
 /2y2T95JmB02VPJSFFIhD+FKaLuxUSO7i20IVe98UsWQjjJZrFNyNpL/BtjNxRTlK6Ou
 YT83pac+4Jt2+yC498MvBEh9/9TwYX3Man52Tn1PztUz+ftONX/KA2t8+FknMkOppk3Q
 3vom43fv4V++3bknDLLu7rDM2kuvsjLojCOAyYK1w0HwHDLbDnI0X/qjKWBGABJvXr9U
 /XVJsbMugMYOnk37vEluwPKEd/UfFAKJg4PrMcCJX1Jp62yOMINOzPd0O/5wLC+OBJq7
 iAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PuFr65DHYvQCpbDpxv+MZAfjV8gOeGfjlaJ44Vc426s=;
 b=59EcBhGosP+T2Fim1f5KMCk/ScvottVZcmPkrtDAwXzvJYzHELwJbuLlN4u9fIzj7R
 DR465OQ810U/5GWjdH3WGXdC8pkQgaLoY0tBilPnBoGBnDQpNWq0dnOs8U0Yoo2xBt1i
 XzQFfRMuIObq8Hs7hKDpNuNjUC6mOwAa5/jyklVtvvMrmZEIif6YHXZHb1UcL860geCa
 BfJiBNqXfkIwtn2KjTVhpPOnheBEA0isHFk/TZN2fkkUWDvb8IrqYUkRHxwInZ+Ykc9C
 klM+GD6/F/dbOlxnZtb+kz6y6lFvS8YIySECEiLcf5jM6WF0DhYaVsxROEW/lHEXzKLo
 mF1Q==
X-Gm-Message-State: ANoB5pmtBig7SwKV1zXzeBzXWSShc3UpANMhmNcgXTDPfWZAYGuZGnn3
 +d8mit4sH78yYM7ePFaJLP9Fzw==
X-Google-Smtp-Source: AA0mqf6f4J0GSxWEzkM8560JPSWpeeh4znKsrz0Ls2xq7LLBgcGouAb4BBc0+4bWcKK2I3lnAxmMFg==
X-Received: by 2002:a5d:5707:0:b0:236:8130:56e3 with SMTP id
 a7-20020a5d5707000000b00236813056e3mr2061573wrv.371.1668191144730; 
 Fri, 11 Nov 2022 10:25:44 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a7bce8a000000b003c6bd12ac27sm3656600wmj.37.2022.11.11.10.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62D931FFC7;
 Fri, 11 Nov 2022 18:25:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH  v5 17/20] hw/intc: properly model IOAPIC MSI messages
Date: Fri, 11 Nov 2022 18:25:32 +0000
Message-Id: <20221111182535.64844-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

On the real HW the IOAPIC is wired directly to the APIC and doesn't
really generate memory accesses on the main bus of the system. To
model this we can use the MTRT_MACHINE requester type and set the id
as a magic number to represent the IOAPIC as the source.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
---
 include/hw/i386/ioapic_internal.h |  2 ++
 hw/intc/ioapic.c                  | 35 ++++++++++++++++++++++++-------
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
index 9880443cc7..a8c7a1418a 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -82,6 +82,8 @@
 
 #define IOAPIC_VER_ENTRIES_SHIFT        16
 
+/* Magic number to identify IOAPIC memory transactions */
+#define MEMTX_IOAPIC                    0xA71C
 
 #define TYPE_IOAPIC_COMMON "ioapic-common"
 OBJECT_DECLARE_TYPE(IOAPICCommonState, IOAPICCommonClass, IOAPIC_COMMON)
diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 264262959d..8a5418002b 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -21,6 +21,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qapi/error.h"
 #include "monitor/monitor.h"
 #include "hw/i386/apic.h"
@@ -88,9 +89,33 @@ static void ioapic_entry_parse(uint64_t entry, struct ioapic_entry_info *info)
         (info->delivery_mode << MSI_DATA_DELIVERY_MODE_SHIFT);
 }
 
-static void ioapic_service(IOAPICCommonState *s)
+/*
+ * No matter whether IR is enabled, we translate the IOAPIC message
+ * into a MSI one, and its address space will decide whether we need a
+ * translation.
+ *
+ * As the IOPIC is directly wired to the APIC writes to it are not the
+ * same as writes coming from the main bus of the machine. To model
+ * this we set its source as machine specific with the MEMTX_IOPIC
+ * id.
+ */
+static void send_ioapic_msi(struct ioapic_entry_info info)
 {
     AddressSpace *ioapic_as = X86_MACHINE(qdev_get_machine())->ioapic_as;
+    MemTxAttrs attrs = MEMTXATTRS_MACHINE(MEMTX_IOAPIC);
+    MemTxResult res;
+
+    address_space_stl_le(ioapic_as, info.addr, info.data,
+                                         attrs, &res);
+    if (res != MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: couldn't write to %"PRIx32"\n", __func__, info.addr);
+    }
+}
+
+
+static void ioapic_service(IOAPICCommonState *s)
+{
     struct ioapic_entry_info info;
     uint8_t i;
     uint32_t mask;
@@ -130,12 +155,8 @@ static void ioapic_service(IOAPICCommonState *s)
                     continue;
                 }
 #endif
-
-                /* No matter whether IR is enabled, we translate
-                 * the IOAPIC message into a MSI one, and its
-                 * address space will decide whether we need a
-                 * translation. */
-                stl_le_phys(ioapic_as, info.addr, info.data);
+                /* If not handled by KVM we now send it ourselves */
+                send_ioapic_msi(info);
             }
         }
     }
-- 
2.34.1


