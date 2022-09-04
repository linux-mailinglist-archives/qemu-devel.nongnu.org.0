Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530025AC827
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:43:49 +0200 (CEST)
Received: from localhost ([::1]:36426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzHI-0001Tb-2Y
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz93-0006mY-NB; Sun, 04 Sep 2022 19:35:19 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:33473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz90-0004ze-1O; Sun, 04 Sep 2022 19:35:15 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so3150477fac.0; 
 Sun, 04 Sep 2022 16:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mGG3U2Luf4I4urQShsm1RjBsPx5YCf60/nn93DboxwM=;
 b=aeXSB98oZcnCCIUZ9q/2+OlkGqeikR5EeaJIb7U5BnTwlqfbmKiLf0a/JBSkAnY1IG
 wn9vb13M8ij5JMo86GoPicP51oCLO2rk0utX+hgm0vPgOVFeiyyfo1qeEQeZ7TiW57nS
 BKFue6FYg8LqtaM1PJqaDYDpZFEEVt84z3XKHH/hSynJ0HUbBkxwJWJsiYmXfx4U/U31
 U9FteFwCEifrG5qzO/B6n3Cb7nxRM8OM2zI7ixvpBfivvm64AwYwHFuhKh47EXfiMVeU
 nAGVY3pSNW85xTRT/QmIvjWVfnqSSfIjSIScfXe5LF3bVtndf2Z185AvMB39HtQBq28a
 Z7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mGG3U2Luf4I4urQShsm1RjBsPx5YCf60/nn93DboxwM=;
 b=2qa9eM09Kyj3O9q5FP0GwXAy42iqHsIIItM6b/bch3uk2//Jj+kkhjezNf0B89rT8U
 SfHQ4h1ooi1VcJDU8k2zAcDr34AEfKzpzv8TEBYGZcVgrZW1aK36MsKYw37bJmT/EJ1C
 5ObeZGoYvyvp/6r6F39jEc8u8UpVQPirY3YMfD0a2g9yIi4irkThijftUi76QIXtzH85
 LdrGq5uKHDtEJLl1uSpERO8algIyOwdbS+6r6c7DYaphCIfET2sNOzMorbNtYInYKziK
 QnHuuY+STZMQFFrohrTQaIxnTx1r+sxd933t1Q6KygUSYB3x5kCfE2dLfMlYBm48qDcG
 d4xQ==
X-Gm-Message-State: ACgBeo1TxdVl7nrTuigXAJKbUInNqBqLJhOpnNwC5UeE9IiJKPvUuHK/
 eWRXFAY9mUePceC1Q/NAOxDTQqPN4xzpzA==
X-Google-Smtp-Source: AA6agR7ibbXBUUpvop56BsxwRpYqXJTsOAWOpBtRduXZh35PFWYAQU2mpJX3lAOx2pA3eKcaLXv5Hg==
X-Received: by 2002:a05:6870:e416:b0:122:5d6c:f32d with SMTP id
 n22-20020a056870e41600b001225d6cf32dmr7844808oag.239.1662334511721; 
 Sun, 04 Sep 2022 16:35:11 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v6 04/14] hw/ppc: set machine->fdt in
 ppce500_load_device_tree()
Date: Sun,  4 Sep 2022 20:34:46 -0300
Message-Id: <20220904233456.209027-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
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
2.37.2


