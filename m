Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640E95EAE7A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:48:35 +0200 (CEST)
Received: from localhost ([::1]:37228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsDa-0007XN-GT
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4d-0008C4-5q
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:19 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:33533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4b-00025N-72
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:18 -0400
Received: by mail-oi1-x236.google.com with SMTP id j188so9207250oih.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hufvA+hg/dHvYm0AiWZqdjdha3LWa/99db4PrkuRJeA=;
 b=jq+VJBP0ppOvLOQ0rjlxRIu+DpHhQH2pGES4esr3FYJmAcqPhJcfRMCi59/YiTmcQk
 iYdjpTQK2HpdTuvLqrF/rkTfGCcAj8fSwU1mgyJ2vKdqs40TbB5f9rwuJGSBRBlghyT4
 emxmYAhp7yqajyQ+RjkCMh+kaqtZADSqBK1O7JQB6n7yKRaHjbAoGI29UD6QiNw1vhwF
 dqeGQ9LhfUfL3DPd+CIF0rI27fVx2B2kuLXl8bn+0grxAjPtfM42qAziNDbFUBdV+Jgb
 Y7rcnCl6Z40bUtfuxy8dSolkOtADnM7fLAHvWNq7U7Cg5jQjPxNOXFqDsGNpJlMXhczb
 wRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hufvA+hg/dHvYm0AiWZqdjdha3LWa/99db4PrkuRJeA=;
 b=dtk57HVMmj1/8DsOZc6TKgmJodM3I1G2QVQ6ZBpzBcRl9XbmkuYqvvM9hAWVr7kjJO
 I+GsUAMkbATY0YPu2y2JseJDoWtSMFtPHNUaPUahzIK9fdGb4WzI60j4SOk6mk988K4s
 rnhZZ1IYrTGv2Fx453gQ1S2+nJEkfOQwsVpqAKxi56vADyTaoRuMTBzEuHkUMlic0SKh
 tkw9dUgW0LFwfb3xdQfIbyZ5RaXjUBCoPOE9uxARHOP4xAmM4bRaBCSHZO+tzqsC4KLd
 cToGs/ob84jqPyFK/VoCr427ejFDUjeVMSuyhpPzxUEpgORQj+OBixsAInYCrxHCgsZd
 lyyg==
X-Gm-Message-State: ACrzQf2dK6iLD6u016sAixOTo5ZZjTRC/a5PeOmurp9Ktde9/zdKSy5L
 FG/FkduzhWxdQA/2uIEeB+hOhzVI/3U=
X-Google-Smtp-Source: AMsMyM6/LIi5bTxeVrMm3R6X3rPjt3C0G7SBk0SPvKMe97bH15BeVz4DOXQSNRyk/AyLnZVZAu427Q==
X-Received: by 2002:aca:120a:0:b0:34f:ffd3:4dd9 with SMTP id
 10-20020aca120a000000b0034fffd34dd9mr16152835ois.271.1664213956265; 
 Mon, 26 Sep 2022 10:39:16 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v8 07/16] hw/ppc: set machine->fdt in
 ppce500_load_device_tree()
Date: Mon, 26 Sep 2022 14:38:46 -0300
Message-Id: <20220926173855.1159396-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will enable support for 'dumpdtb' QMP/HMP command for the e500
machine.

Cc: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 32495d0123..ea5f947824 100644
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
+     * Update the machine->fdt pointer to enable support for the
+     * 'dumpdtb' QMP/HMP command.
+     *
+     * The FDT is re-created during reset, so free machine->fdt
+     * to avoid leaking the old FDT.
+     */
+    g_free(machine->fdt);
+    machine->fdt = fdt;
 
 out:
     g_free(pci_map);
-- 
2.37.3


