Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783EA2F3738
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:36:03 +0100 (CET)
Received: from localhost ([::1]:39152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNaM-0001A8-8z
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNFz-0003YN-1M
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:00 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:40555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNFw-0004qU-BE
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:14:58 -0500
Received: by mail-ej1-x631.google.com with SMTP id f4so3497943ejx.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y2D++BW35zFmYTheLMBecjwElXG7eVrAjCSmYiIui/g=;
 b=Vw0lKlQmWdjp4KavGpFzJiWQDuWTw7UhZ4Nyg/D/QLAeS2VlhMbqDGt3AhvFzOldWe
 5HC4gXTf+viUesuCLCXbcblzklIwQkpXyTG2Rnjr8l7JeUC8PHWVTtUJVS6GnXeGsSaC
 5j7iMCEEO3z+Hz+EwNK7AxB+MNfCd6VsdOzfz+xY600rGG4/ecmwYoE4g+E+RI4KPFOr
 G9hS/SBw2sGUH+s6fs29usks7jNYA2l/uJcxLIuFOVgZBozoRgbhq4wN6yPUnKf+vf9X
 yIGxkQe2d8C1LikWXwcVbBMbD/AqY/bZR0prawRTzbcgO4fixGB0+IPF0poNuHhXIAAX
 L32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y2D++BW35zFmYTheLMBecjwElXG7eVrAjCSmYiIui/g=;
 b=X+pRjVIH9siTzcvFUBc9qzjZrUKvpRnUW+YlX6gHhr6zndk4UH8D10xLm1L9UWaJSX
 G28lk69T4prR1RumZbiRALkMUQDX432aamvK2egZdQksGwrUuE2K+lTBDPuR4/knMaYm
 FbfBVkP6QRKQmYAoYbc9lr/zQ6ZVovLFS2jh1ryfup8H6pTB5t2uVZnUXleinxwaV7jP
 g23MIp9dZdVgSRLLiWtTg1k34AH6KPvwFelAY8Npf0l71vaDtoma6/ShhcHdgGOwOMt3
 zPYa+QkWdh3A/odMI8x+h8vpltvROzemAqMdUk7G3WmTRnnbMhBUWuhRMzcuni+0Ap5x
 OUwA==
X-Gm-Message-State: AOAM53219ZH9O/M5WzCC2UQMamk5zal9kWp6UhCkPzDcGjehh2XLKCvO
 SIiSdcdx5jCAnm9zCf4WNPJCIDnHaFAKUQ==
X-Google-Smtp-Source: ABdhPJys8R/jCRgG2xnZsMexGN5TUrIDvaw+Zr3gSy0rvQKGxqE7+ht7ftp4R5Uuo4YrYOolUI/6/w==
X-Received: by 2002:a17:906:b24c:: with SMTP id
 ce12mr3843435ejb.89.1610471695106; 
 Tue, 12 Jan 2021 09:14:55 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:14:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/20] whpx: move internal definitions to whpx-internal.h
Date: Tue, 12 Jan 2021 18:14:33 +0100
Message-Id: <20210112171450.791427-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only leave the external interface in sysemu/whpx.h.  whpx_apic_in_platform
is moved to a .c file because it needs whpx_state.

Reported-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201219090637.1700900-3-pbonzini@redhat.com>
---
 include/sysemu/whpx.h            | 22 +---------------------
 target/i386/whpx/whpx-all.c      |  4 ++++
 target/i386/whpx/whpx-internal.h | 18 ++++++++++++++++++
 3 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
index 9346fd92e9..8ca1c1c4ac 100644
--- a/include/sysemu/whpx.h
+++ b/include/sysemu/whpx.h
@@ -15,28 +15,8 @@
 
 #ifdef CONFIG_WHPX
 
-#include "whp-dispatch.h"
-
-struct whpx_state {
-    uint64_t mem_quota;
-    WHV_PARTITION_HANDLE partition;
-    bool kernel_irqchip_allowed;
-    bool kernel_irqchip_required;
-    bool apic_in_platform;
-};
-
-struct whpx_lapic_state {
-    struct {
-        uint32_t data;
-        uint32_t padding[3];
-    } fields[256];
-};
-
-extern struct whpx_state whpx_global;
 int whpx_enabled(void);
-
-void whpx_apic_get(DeviceState *s);
-#define whpx_apic_in_platform() (whpx_global.apic_in_platform)
+bool whpx_apic_in_platform(void);
 
 #else /* CONFIG_WHPX */
 
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 12f79e2cd6..985ceba8f8 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -1866,6 +1866,10 @@ int whpx_enabled(void)
     return whpx_allowed;
 }
 
+bool whpx_apic_in_platform(void) {
+    return whpx_global.apic_in_platform;
+}
+
 static void whpx_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
diff --git a/target/i386/whpx/whpx-internal.h b/target/i386/whpx/whpx-internal.h
index e0a9ea1dce..8cfaaef141 100644
--- a/target/i386/whpx/whpx-internal.h
+++ b/target/i386/whpx/whpx-internal.h
@@ -5,6 +5,24 @@
 #include <WinHvPlatform.h>
 #include <WinHvEmulation.h>
 
+struct whpx_state {
+    uint64_t mem_quota;
+    WHV_PARTITION_HANDLE partition;
+    bool kernel_irqchip_allowed;
+    bool kernel_irqchip_required;
+    bool apic_in_platform;
+};
+
+struct whpx_lapic_state {
+    struct {
+        uint32_t data;
+        uint32_t padding[3];
+    } fields[256];
+};
+
+extern struct whpx_state whpx_global;
+void whpx_apic_get(DeviceState *s);
+
 #define WHV_E_UNKNOWN_CAPABILITY 0x80370300L
 
 #define LIST_WINHVPLATFORM_FUNCTIONS(X) \
-- 
2.29.2



