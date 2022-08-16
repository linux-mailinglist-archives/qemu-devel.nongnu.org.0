Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8F7596162
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:45:32 +0200 (CEST)
Received: from localhost ([::1]:43158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0d9-0000Zp-Ne
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sl-0004m7-Pq; Tue, 16 Aug 2022 13:34:49 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:42794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sk-0002NZ-Co; Tue, 16 Aug 2022 13:34:47 -0400
Received: by mail-ua1-x92a.google.com with SMTP id h19so792213uan.9;
 Tue, 16 Aug 2022 10:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=W3OSa9MXxQstpQEShZr7qGq0YKfPJLRHYk7eRBvuzgA=;
 b=fnpLNNOui99Keia8ANRVfzy0GTifa1VvlR1zlqLbkPkZYOJTwnNoAV5Wt1HPhQVUDi
 t1rnQtqwjQQhjk3hevgFtRte8335dgYYwPDX9nD5fpCOuxDZcDch+wVvXlQ63cAxEywP
 5nHaboJj+Cp8UiqBAlYIZ2d8thZE69XCT7hH0dchNiaI0ZKnBR3bLn2XJqVLByWKh+i8
 DKmYaE3ewvYfroK14e/0Wo7zr8XUEYgtVaHKiafDQgaCJXdUVneWJCqZCwlRK/d3NrSt
 7tUSTbL5aUQcIL/o12TfnuDomuB1gd7GqQlgK9TD95g8Ks+VN5hbR8gxnKlLFgEWpXnn
 dg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=W3OSa9MXxQstpQEShZr7qGq0YKfPJLRHYk7eRBvuzgA=;
 b=Tqu4HfdJ+7zV1Nfkkl4+q9iX3bJRzvlJYDcINtt4Xmb853WDmmiMjrW21NHUlF3CwD
 qfocoZIdqCl4mVQxdYnrIXY2R+jmNVCKAt30rgJcdOW3xuSji/oZbcW5wzQoHv3w6dPI
 00kCu5inJsTIaR3ubS0dHzF81fSjaiaAWVATbGdBH5X7LRuuUyUg9D2yplICkHBPZ0K1
 /BEc5ctpEkihSmshakA8yUBkKui57kXhsqmGOFQR/QdFVpfkaECnCtLyno3PWu98ydci
 JXvvw7kaAqUnloARVtQ1B2uxvt5KqUk+OZ5WFo3wmRfOvVz5FXaY94LBhGmq4MSSNvoU
 N05g==
X-Gm-Message-State: ACgBeo3CtRC+eBZCihAJzVkR5L/MDvF327GLbzzIhjqp22irMrvnd0N7
 xhLtZHNVPCkKr8I5gaN0vVZ1hi2li6yT1A==
X-Google-Smtp-Source: AA6agR4kXgxfELtgc5b9VTy5jP5tuZbCPnHeaR2MAxLcazaWrl/Cas1Wy63SzWEccmWGhUAgXKekYA==
X-Received: by 2002:a05:6130:90:b0:362:891c:edef with SMTP id
 x16-20020a056130009000b00362891cedefmr9579698uaf.106.1660671284862; 
 Tue, 16 Aug 2022 10:34:44 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:34:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 04/20] hw/ppc: set machine->fdt in
 ppce500_load_device_tree()
Date: Tue, 16 Aug 2022 14:34:12 -0300
Message-Id: <20220816173428.157304-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
the e500 machine.

Cc: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 32495d0123..6197a905b8 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -47,6 +47,8 @@
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
 
+#include <libfdt.h>
+
 #define EPAPR_MAGIC                (0x45504150)
 #define DTC_LOAD_PAD               0x1800000
 #define DTC_PAD_MASK               0xFFFFF
@@ -600,7 +602,16 @@ done:
         cpu_physical_memory_write(addr, fdt, fdt_size);
     }
     ret = fdt_size;
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     *
+     * The FDT is re-created during reset, so free machine->fdt
+     * to avoid leaking the old FDT.
+     */
+    g_free(machine->fdt);
+    machine->fdt = fdt;
 
 out:
     g_free(pci_map);
-- 
2.37.2


