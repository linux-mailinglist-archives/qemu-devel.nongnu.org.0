Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCE64AB7EE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:47:13 +0100 (CET)
Received: from localhost ([::1]:48146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0c4-0005vW-4g
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:47:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNY-00064A-Mv
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:08 -0500
Received: from [2a00:1450:4864:20::42b] (port=33295
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNV-00079Q-4f
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:06 -0500
Received: by mail-wr1-x42b.google.com with SMTP id e3so9305034wra.0
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 00:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6mv865Mj8eyWrXc0YXW1cBmN+zQ0eIb4Ed7eVXNjpA0=;
 b=bUQabZUtmLAGeyn4/716SCx4DT51DWyVSEGD2Q0jdD8NrmnuuMqy+nIzXVo/oWcKUq
 BxuIjtcHoKRrTFGC7NPqLDLHaRkW61nR/QLr8aGDfAIj7UlSKqhOMLFySJ6bhv4HYniO
 QESo2G2hDKS4qpwNWLYDWcHDLPfq1JwBYeRW7NCE3seub5MVql9b2AIrwKYBk7LyNrMx
 0n0F+S8jXt6qekDjHKavt4lz/Cdf9GhS8Q7fKhGliDYRlT56oH86Fus1hsbi+4QHYX1s
 uFObOAlzzpApfjsDe+Hi+MPcSLCqcMLXkJVeQCO7CPAdO7bD6jV+Q1WXmDkr2op+Uotu
 3rSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6mv865Mj8eyWrXc0YXW1cBmN+zQ0eIb4Ed7eVXNjpA0=;
 b=hRDZtUDwlbTannsFlws4Nk6OICphuqJoqYvvxR7he5fNoSY3kCdqGg92Nfk7Bye84o
 wxveScMxvzsAPI9CsjEqFsUfNOF64n6wyiD7NrbFEGPdP4w7oFxWxV1F1bmohFrmKy5p
 t4KJr3H1IyZuQ9tfi2w1Hbi5gfp/Dy3IgoqewZnPeLlp7xTOIVfowABkkZm0J539EU1e
 UV3e+fHnL+F++6Bl/I5cFhYmrgK1Wm5Jhyxql4uaMh93rqv442Z5YwrZmk7mNbGPK3Ly
 TyL/k8QlcmYVGJ7PO6+RzH1RxtO7SlPOWNlNvFUFbZmklfDBy4jF2kxnrCEx2skeQUp7
 13xw==
X-Gm-Message-State: AOAM530x7D8tHNuiRIh5XParyZfAs4kBWXmVpXuaSC+chAYXju6Yy2iN
 yx2xCwHZH6YELJ/n9ossl8vd+6S0O0A=
X-Google-Smtp-Source: ABdhPJzDH1wxM2yf+0LWmR4In72U2fDrEPgmKlHg0KyUHlY2dqE9AlqOEJ5XtWlaNNocNA8oVMZHvA==
X-Received: by 2002:a05:6000:186b:: with SMTP id
 d11mr9074246wri.21.1644222482698; 
 Mon, 07 Feb 2022 00:28:02 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id a26sm19494533wmj.18.2022.02.07.00.28.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Feb 2022 00:28:02 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 1/9] hw/tpm: Clean includes
Date: Mon,  7 Feb 2022 09:27:48 +0100
Message-Id: <20220207082756.82600-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082756.82600-1-f4bug@amsat.org>
References: <20220207082756.82600-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


