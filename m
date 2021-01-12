Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6B02F37A8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:52:16 +0100 (CET)
Received: from localhost ([::1]:54850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNq3-0003X9-3b
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNFy-0003Xw-G6
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:00 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNFw-0004qL-B0
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:14:57 -0500
Received: by mail-ej1-x62e.google.com with SMTP id lt17so4622327ejb.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D0xY+ZzdNwor+r1grB3Tnj6lQncEfhqc2CyqMbCdFlc=;
 b=iHvB1JU0fPf9XB9XxUdjQFH1SAl4t8xY7BDHz1kx/ZZWc0qqGhd1MSgQT3YGNL7cSd
 iyknhoSbQj9obplTl8SGDmf0984ODkvxSgRQ3405cuAgTUk9TcfzZOlP9x+foUSnZ7lu
 7SoGidLsowb5kwTeDk+Jk+Vnj7r2I7l+MVDqLOUuXURhCdKbHa8LVnHyGo7nxUDjWbZ8
 VfLwZYgnJ27IYQ4mFKYoOcbHPOCQHJFgqp7XVVm9kkyabOhRCwq4rvM768s12KopF9Yb
 uaXUvkOHnwTI9HRer/5zt0p7Q+PO9wSFik0gpVWfelESOnSt8aiBtLoQ9FRpvcAp/SfZ
 pHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D0xY+ZzdNwor+r1grB3Tnj6lQncEfhqc2CyqMbCdFlc=;
 b=gYbmco7qAhlZghiYMpew6h9UKCu5svual6KuySoWNXCVTlSx6+vADnpOcwYCwfnc2n
 E75xwQXZJu4NnDTwiY49Jz7A2YACL3WcZUYGjCQiev/fW/yzK2j/su7QX4p+c5XrjS8b
 PkqkhbJRCmusi7SeuJ0+LqLpIu4HZG3XMMNEootLc10pVwwzYfVdrr634pNzLVkr/W0h
 IdLGJLvLL3tFZg3mYAS5sQPVMieCdZrZf6ckbExWokphlxS87R6a1XN3XPAt9n8dVw3B
 4JY3gRR3Ju70xxafpnb1Kg1HzdfP4LipP4NeGa/Ngz0Qn5sV3qF1wn8LpIldrt16sMBN
 t8KQ==
X-Gm-Message-State: AOAM530Eymrz8Z22/P4M4c3bYJOWJqMnBEnxrTmyanfny6jApbpFbN0g
 dUGW1grq1aVtEed8t1hcKweSDIfd+9HBWg==
X-Google-Smtp-Source: ABdhPJysRwZCVuDealOfBygMzGhXknyj5mBRU0FDhfI6e/RlYvkiRde4/HZljanQM8Y4IMMRIux8WA==
X-Received: by 2002:a17:906:351a:: with SMTP id
 r26mr3751934eja.204.1610471694246; 
 Tue, 12 Jan 2021 09:14:54 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:14:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/20] whpx: rename whp-dispatch to whpx-internal.h
Date: Tue, 12 Jan 2021 18:14:32 +0100
Message-Id: <20210112171450.791427-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the file in preparation for moving more implementation-internal
definitions to it.  The build is still broken though.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201219090637.1700900-2-pbonzini@redhat.com>
---
 target/i386/whpx/whpx-all.c                          | 5 +----
 target/i386/whpx/whpx-apic.c                         | 2 +-
 target/i386/whpx/whpx-cpus.c                         | 4 +---
 target/i386/whpx/{whp-dispatch.h => whpx-internal.h} | 6 +++---
 4 files changed, 6 insertions(+), 11 deletions(-)
 rename target/i386/whpx/{whp-dispatch.h => whpx-internal.h} (98%)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 3b824fc9d7..12f79e2cd6 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -26,13 +26,10 @@
 #include "qapi/qapi-types-common.h"
 #include "qapi/qapi-visit-common.h"
 #include "migration/blocker.h"
-#include "whp-dispatch.h"
 #include <winerror.h>
 
 #include "whpx-cpus.h"
-
-#include <WinHvPlatform.h>
-#include <WinHvEmulation.h>
+#include "whpx-internal.h"
 
 #define HYPERV_APIC_BUS_FREQUENCY      (200000000ULL)
 
diff --git a/target/i386/whpx/whpx-apic.c b/target/i386/whpx/whpx-apic.c
index b127a3cb8a..1d330bf749 100644
--- a/target/i386/whpx/whpx-apic.c
+++ b/target/i386/whpx/whpx-apic.c
@@ -18,7 +18,7 @@
 #include "hw/pci/msi.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/whpx.h"
-#include "whp-dispatch.h"
+#include "whpx-internal.h"
 
 static void whpx_put_apic_state(APICCommonState *s,
                                 struct whpx_lapic_state *kapic)
diff --git a/target/i386/whpx/whpx-cpus.c b/target/i386/whpx/whpx-cpus.c
index d9bd5a2d36..f7e69881a3 100644
--- a/target/i386/whpx/whpx-cpus.c
+++ b/target/i386/whpx/whpx-cpus.c
@@ -15,11 +15,9 @@
 #include "qemu/guest-random.h"
 
 #include "sysemu/whpx.h"
+#include "whpx-internal.h"
 #include "whpx-cpus.h"
 
-#include <WinHvPlatform.h>
-#include <WinHvEmulation.h>
-
 static void *whpx_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
diff --git a/target/i386/whpx/whp-dispatch.h b/target/i386/whpx/whpx-internal.h
similarity index 98%
rename from target/i386/whpx/whp-dispatch.h
rename to target/i386/whpx/whpx-internal.h
index cef5d848bd..e0a9ea1dce 100644
--- a/target/i386/whpx/whp-dispatch.h
+++ b/target/i386/whpx/whpx-internal.h
@@ -1,5 +1,5 @@
-#ifndef WHP_DISPATCH_H
-#define WHP_DISPATCH_H
+#ifndef WHP_INTERNAL_H
+#define WHP_INTERNAL_H
 
 #include <windows.h>
 #include <WinHvPlatform.h>
@@ -72,4 +72,4 @@ typedef enum WHPFunctionList {
     WINHV_PLATFORM_FNS_SUPPLEMENTAL
 } WHPFunctionList;
 
-#endif /* WHP_DISPATCH_H */
+#endif /* WHP_INTERNAL_H */
-- 
2.29.2



