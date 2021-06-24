Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549623B37ED
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 22:35:12 +0200 (CEST)
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwW47-0001HT-E0
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 16:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwVxC-00080x-5l
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:28:02 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwVxA-00035o-Lt
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:28:01 -0400
Received: by mail-wr1-x434.google.com with SMTP id j1so8055332wrn.9
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 13:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iKx0S7FV6oTeEOOfKZInpp71T9Lkz8XufqA4Ci4D+Kg=;
 b=evghU70l04Y1dug5YFAYhCB57pT7Q6ttjceOoyro68yc22oQjsnBd4kibtO9imsabG
 5+6/wen/kxCFAbYVxU9eKp/C/r2QuRefSsCeJ0B71T3+9QAjqAUcDIxx4E/Wtez+QfFb
 +LbeHe/AJEGsuULGXJPud2+v3m8qGQwg+9aZDZDSNM/cW/QMi/zp0+0yaM98M90+TO2C
 /X01quQ+4nd5TFg/bmypiJHLX1iIykv0ZlWUfWHf5yYO6H5shuJmPeGJKOjt7XXRLeRS
 YWbGVH05Xv3GHmn982xeAdHNs/mGbzif3nv43ict1juoh5TuTjqHtccTWhj0ib/UM1s1
 EcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iKx0S7FV6oTeEOOfKZInpp71T9Lkz8XufqA4Ci4D+Kg=;
 b=MdOxoes4EmO9c52sMKurWk6qhcMvSrLwD4vPPdQg7FxoWZ9JURak4hZ6m9jspqJWHa
 nRXUivTrsSmc69WCMA9XOCk9p8Q9Q0vvDkfQ9a0acCOYy1JrwfIEYouaJrrwOUJr59vR
 h47jVkIe5ovhfG/2ppugQhE9D7JstClD6dy7rfLgRg8Zatv+JfSoTzrVBlJh9DTzXwE9
 ExU50g9S92Lhee6ww1Y+KZos9/PJ6KaZFQCZWIEEQUzuAAPoLNDMowzQKqORfvV0nk3y
 Ea9YVnV0pxbsnV7tOBJ/9+r9DTGmLmPDpcL6Z6CHQ24z6e8fzXsIhhLjQoeq+3RhH7xs
 7akw==
X-Gm-Message-State: AOAM530CMeg1SNS88FrWl39Pwd/nnlILQ+pjx4Mz6Y/cEp/giD1JONQj
 IkBXi41vkA1dq9lcHK6oXA2EVA2D89nDdw==
X-Google-Smtp-Source: ABdhPJzmczo9t6/5thbauIUh0hOGqCCvnDluSYVd9lPsxpyBohxBhYari1HckkvG08TTZZZjRFN0Ew==
X-Received: by 2002:adf:e38c:: with SMTP id e12mr6831400wrm.404.1624566479127; 
 Thu, 24 Jun 2021 13:27:59 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b9sm4839310wrh.81.2021.06.24.13.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:27:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/pci-host/bonito: Trace PCI config accesses smaller
 than 32-bit
Date: Thu, 24 Jun 2021 22:27:44 +0200
Message-Id: <20210624202747.1433023-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624202747.1433023-1-f4bug@amsat.org>
References: <20210624202747.1433023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the datasheet section "5.7.5. Accessing PCI configuration space"
the address must be 32-bit aligned. Trace eventual accesses not
aligned to 32-bit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c     | 8 ++++++++
 hw/pci-host/trace-events | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index afb3d1f81d5..751fdcec689 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -52,6 +52,7 @@
 #include "hw/misc/unimp.h"
 #include "hw/registerfields.h"
 #include "qom/object.h"
+#include "trace.h"
 
 /* #define DEBUG_BONITO */
 
@@ -185,6 +186,7 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 #define BONITO_PCICONF_IDSEL_OFFSET    11
 #define BONITO_PCICONF_FUN_MASK        0x700    /* [10:8] */
 #define BONITO_PCICONF_FUN_OFFSET      8
+#define BONITO_PCICONF_REG_MASK_DS     (~3)         /* Per datasheet */
 #define BONITO_PCICONF_REG_MASK        0xFC
 #define BONITO_PCICONF_REG_OFFSET      0
 
@@ -495,6 +497,9 @@ static void bonito_spciconf_write(void *opaque, hwaddr addr, uint64_t val,
     if (pciaddr == 0xffffffff) {
         return;
     }
+    if (addr & ~BONITO_PCICONF_REG_MASK_DS) {
+        trace_bonito_spciconf_small_access(addr, size);
+    }
 
     /* set the pci address in s->config_reg */
     phb->config_reg = (pciaddr) | (1u << 31);
@@ -521,6 +526,9 @@ static uint64_t bonito_spciconf_read(void *opaque, hwaddr addr, unsigned size)
     if (pciaddr == 0xffffffff) {
         return MAKE_64BIT_MASK(0, size * 8);
     }
+    if (addr & ~BONITO_PCICONF_REG_MASK_DS) {
+        trace_bonito_spciconf_small_access(addr, size);
+    }
 
     /* set the pci address in s->config_reg */
     phb->config_reg = (pciaddr) | (1u << 31);
diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
index f4b3a50cb0b..630e9fcc5e7 100644
--- a/hw/pci-host/trace-events
+++ b/hw/pci-host/trace-events
@@ -1,5 +1,8 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
+# bonito.c
+bonito_spciconf_small_access(uint64_t addr, unsigned size) "PCI config address is smaller then 32-bit, addr: 0x%"PRIx64", size: %u"
+
 # grackle.c
 grackle_set_irq(int irq_num, int level) "set_irq num %d level %d"
 
-- 
2.31.1


