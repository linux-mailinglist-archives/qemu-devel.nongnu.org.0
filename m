Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A0C5623A4
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:56:57 +0200 (CEST)
Received: from localhost ([::1]:40610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o70HY-000424-O8
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704V-0004UP-RD; Thu, 30 Jun 2022 15:43:28 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:41543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704R-0006GX-Pb; Thu, 30 Jun 2022 15:43:26 -0400
Received: by mail-oi1-x22d.google.com with SMTP id t189so627500oie.8;
 Thu, 30 Jun 2022 12:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/7Bxj0kRL1aPo5XjMZnEp4tQX4tFyytPjX1uTG/UcKA=;
 b=HUx+6baZEWHdJ0U9PDq7p++f1W6IJ7oD/5EdR4HK+7YbJKarWCCoquKFtqAwMDVHOA
 G9+dCfB6q1vOS24MZEZ0t+2hv+l4+B6yNIOGiktigMmoHoCzHxgBLIcE67uYrPCz4fjr
 xi6cZ8b0qmUuW10mS6FmZYnQfneGi067aamxi9B+ia5YLAcksrk1xNFS91/dkkeaD/oS
 UggKYkE7RosQMTFE9fQAIqeUOcegv8CE0BvQgqg+SchcL6jE15fwynSQxjyzKfZtgmO7
 U5w5DJihj7P7TNrHSJxuSp84rqMhzg/OcPwwVMhacb+y5NqKgFlhTy4jI8GLCltD0OYY
 IMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/7Bxj0kRL1aPo5XjMZnEp4tQX4tFyytPjX1uTG/UcKA=;
 b=ZkGE6hBIt01c9exJ0MEt7y3CtXJujLSDL0GNZGWCPBTDBt8eTauY3rbkGC40AJ91g0
 be1qZUL+7yuh3AKxaLipnAMG4Zp4DGy0/5S/w3fogdYuk1e4+p+Kha0+94OTuJB4l1px
 j6zUGSGPOFsHDgQnYU/RZeb25jx4wwEaoJ9NmW1MZQctIRKNev1ARzxHoHc/hrEeBmWf
 0fJNLblGjsDd7qOeeiG9FGurLPTP5crqMstzFRSxSF7piq0g1HHVRw9sYq6ekJiRkb4G
 HAm7Kv+WWfO9IY8ohdIJIIEcfq0h92r9L0aEXb8RDXhVQFDXdpN23V+CLff+qLLHCCxG
 YxMA==
X-Gm-Message-State: AJIora/4TiN2A5eZiWsUXuDIGQqol2mMAtubzi2maOOC4SXBt8QIl0Eu
 7wP3kvxWTavJEEFQ7KNpueLPfYJi1KI=
X-Google-Smtp-Source: AGRyM1v/O8bvC6buDJ+vOaFMshghyu5g8T5D+i5s1Gp0fFLD9YbzvmxlCMlksvx3oYw3kcwB7NNJZA==
X-Received: by 2002:aca:4b90:0:b0:335:b574:6108 with SMTP id
 y138-20020aca4b90000000b00335b5746108mr5324721oia.19.1656618201568; 
 Thu, 30 Jun 2022 12:43:21 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a4aa3c5000000b0035ef3da8387sm11250519ool.4.2022.06.30.12.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:43:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 6/9] ppc440_bamboo.c: handle clock freq read error in
 load_device_tree
Date: Thu, 30 Jun 2022 16:42:46 -0300
Message-Id: <20220630194249.886747-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630194249.886747-1-danielhb413@gmail.com>
References: <20220630194249.886747-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
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

Let's put the default clock and timebase freq value in macros for better
readability.  Use PPC440EP_CLOCK_FREQ as the default value of
'clock_freq' if kvmppc_get_clockfreq() throws an error.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_bamboo.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index d23f881d9d..6318112393 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -50,6 +50,10 @@
 
 #define PPC440EP_SDRAM_NR_BANKS 4
 
+#define PPC440EP_TB_FREQ        400000000
+#define PPC440EP_CLOCK_FREQ     400000000
+
+
 static const ram_addr_t ppc440ep_sdram_bank_sizes[] = {
     256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 0
 };
@@ -67,8 +71,8 @@ static int bamboo_load_device_tree(hwaddr addr,
     char *filename;
     int fdt_size;
     void *fdt;
-    uint32_t tb_freq = 400000000;
-    uint32_t clock_freq = 400000000;
+    uint32_t tb_freq = PPC440EP_TB_FREQ;
+    uint32_t clock_freq = PPC440EP_CLOCK_FREQ;
 
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, BINARY_DEVICE_TREE_FILE);
     if (!filename) {
@@ -106,8 +110,15 @@ static int bamboo_load_device_tree(hwaddr addr,
      * directly access the timebase without host involvement, we must expose
      * the correct frequencies. */
     if (kvm_enabled()) {
+        Error *local_err = NULL;
+
         tb_freq = kvmppc_get_tbfreq();
-        clock_freq = kvmppc_get_clockfreq(NULL);
+        clock_freq = kvmppc_get_clockfreq(&local_err);
+
+        /* Use default clock if we're unable to read it from the DT */
+        if (local_err) {
+            clock_freq = PPC440EP_CLOCK_FREQ;
+        }
     }
 
     qemu_fdt_setprop_cell(fdt, "/cpus/cpu@0", "clock-frequency",
-- 
2.36.1


