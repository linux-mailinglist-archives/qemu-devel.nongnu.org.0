Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CEB4A8F6F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:58:23 +0100 (CET)
Received: from localhost ([::1]:41346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFjBO-00048t-1W
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:58:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhw2-000464-2m
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:38:26 -0500
Received: from [2607:f8b0:4864:20::635] (port=40595
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhvz-0005rW-3j
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:38:25 -0500
Received: by mail-pl1-x635.google.com with SMTP id y17so3073178plg.7
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwui0+WgM4nUhQWC4QaU40VqiH7mK4rt3aliM0RxQg0=;
 b=d3JVR5lfk3VJQDdDk2hZehXRy+Ff/OktDe07R8bYRvWYn8uJHyrc7aUff6LxDWoxCC
 Ubgs+2Zn7lMEeWCL7lQAUWTYJsx3gR0FKmNUnFYVe8V1ZaAooPK3ynhPsVXbvROUqFxO
 3mKzaDT6zh3JcLZT17pXKUN5EKMs1PFFWj9VDoydsZOeZEbj4xO65bvDXXrCPqcOVLR5
 xCld+4n9ODMRhCozSJKK3yJl8CCr1hjxJMh6WEHE3CF8JRxNA37w03xE+k406NhrrpBp
 N47wFe6Sb5I98aCB/rf7fdkz9HItkR3l/iCAFksGl63tmJckyUMd8b88Y29Pwrsbh9z1
 mGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wwui0+WgM4nUhQWC4QaU40VqiH7mK4rt3aliM0RxQg0=;
 b=Gvoq7CW2i9C1rqYWA6SjqlgJRGdvNWYfUbg+nwkZYbKjZaMTcGxb8rCmD8eHfTAQrV
 bF6CTfHyMgm3unsjf//v646lVbrOXur9opmFD2Mp6cjFG/MNRRuBar1eFQUYeWjcjkng
 gQ4ACQtDaEvcFxf05DfaQP0eC8ssKsZM9SctGDN1q119ES4XBXqTOmRHO6MkaV62Wllu
 mHKrI7N/YinUpw38o6l+jbYamKl91EQlbK9/VpfqfRNhPqpHbHbQ/FG8/CtlD9C9rlS2
 EJ+qV3DlUmA7N7N34wOL0VOvrGykXWA6YRX3R2w+qpIgGSRpklKtyQKcQjlCqFghIN7d
 Sz7w==
X-Gm-Message-State: AOAM530ENZj9uiLerPY+9GoY9N/q3aAXin1MHcf4p2jIseK21gbOSRdB
 Q+Cpjdv1//hPRaYjHhT4eMmfmn0JOA8=
X-Google-Smtp-Source: ABdhPJx5fhgKd+KkP0z7cL6oAr9unGSh/GAOoxWH/aDROoWstL3lfY/XrySTtPb+7dEs2qgILD2nCw==
X-Received: by 2002:a17:90b:3850:: with SMTP id
 nl16mr15581872pjb.131.1643917097285; 
 Thu, 03 Feb 2022 11:38:17 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id mm24sm10865058pjb.20.2022.02.03.11.38.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:38:17 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 01/10] hw/tpm: Clean includes
Date: Thu,  3 Feb 2022 20:37:54 +0100
Message-Id: <20220203193803.45671-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203193803.45671-1-f4bug@amsat.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

"tpm_ppi.h" only requires to include "exec/memory.h" to get
the MemoryRegion declaration.

tpm_ppi.c requires "hw/qdev-core.h" to use the DEVICE() macro,
tpm_crb.c is the only source file requiring "exec/address-spaces.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/tpm/tpm_crb.c | 1 +
 hw/tpm/tpm_ppi.c | 4 ++--
 hw/tpm/tpm_ppi.h | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index 58ebd1469c..aa9c00aad3 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -18,6 +18,7 @@
 
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "exec/address-spaces.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci_ids.h"
 #include "hw/acpi/tpm.h"
diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
index 274e9aa4b0..6dbb9f41e4 100644
--- a/hw/tpm/tpm_ppi.c
+++ b/hw/tpm/tpm_ppi.c
@@ -14,9 +14,9 @@
 #include "qemu/osdep.h"
 
 #include "qapi/error.h"
-#include "cpu.h"
 #include "sysemu/memory_mapping.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-core.h"
 #include "hw/acpi/tpm.h"
 #include "tpm_ppi.h"
 #include "trace.h"
@@ -44,7 +44,7 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
     }
 }
 
-void tpm_ppi_init(TPMPPI *tpmppi, struct MemoryRegion *m,
+void tpm_ppi_init(TPMPPI *tpmppi, MemoryRegion *m,
                   hwaddr addr, Object *obj)
 {
     tpmppi->buf = qemu_memalign(qemu_real_host_page_size,
diff --git a/hw/tpm/tpm_ppi.h b/hw/tpm/tpm_ppi.h
index 6f773c25a0..bf5d4a300f 100644
--- a/hw/tpm/tpm_ppi.h
+++ b/hw/tpm/tpm_ppi.h
@@ -12,7 +12,7 @@
 #ifndef TPM_TPM_PPI_H
 #define TPM_TPM_PPI_H
 
-#include "exec/address-spaces.h"
+#include "exec/memory.h"
 
 typedef struct TPMPPI {
     MemoryRegion ram;
@@ -29,7 +29,7 @@ typedef struct TPMPPI {
  * Register the TPM PPI memory region at @addr on the given address
  * space for the object @obj.
  **/
-void tpm_ppi_init(TPMPPI *tpmppi, struct MemoryRegion *m,
+void tpm_ppi_init(TPMPPI *tpmppi, MemoryRegion *m,
                   hwaddr addr, Object *obj);
 
 /**
-- 
2.34.1


