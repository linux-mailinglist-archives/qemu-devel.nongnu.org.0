Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D1120B443
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 17:16:17 +0200 (CEST)
Received: from localhost ([::1]:47972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joq5Q-0003ru-Ow
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 11:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq3m-0001qI-Ty
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:14:34 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq3k-0006CG-3r
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:14:34 -0400
Received: by mail-wm1-x32f.google.com with SMTP id f139so9704230wmf.5
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 08:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gAVU66Bka2C31iTs/7lhQdbitwvERu6cMLvGdW1VOYU=;
 b=wF3jCnfedOFNoYhYCM+xFBrQXmjhgvuXH3fLFP73VeATuzHsYWSmp46hqIp8dI7bnb
 BhVGMEOuPf6wfCNnbl+KLNv4BsFYdbEMZdVqUjKnW8LRYRS4LP10agenMVXiENsQyUmO
 L97mxhhVTlI3R9QmJoxmpLFU9h85Uv010lkDdVc++/2U+pQYFaLaKH4N0+JlOaOVYaBz
 TWivR9QJ2XBW0lo3aDm7V1Hyb+qm4LggraEg+IN6lDQQ+5v5EGQ+F0u1JK7JRHnFuYP5
 Y/tyS/DBIaILTWiAUREORSpd0QbYhCpIp+2p6RqXpzuZNHpZqXc3guZwoBg0f+MQLBT1
 oTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gAVU66Bka2C31iTs/7lhQdbitwvERu6cMLvGdW1VOYU=;
 b=ffT0LW7X/bY1Q1lgf97wi/94AXgKfqhCzGkSw28iT13EN3BtbCe/cZKztj0zGoBEOE
 leuRV4FsXtmr8+X5RnpYsNSXPGTGxp7vvnrqFzJrM9GgcuyBxCK+sXU4QOnjQXulKsKC
 MFCd/P0rKkU5HwXoGaBb8lzVV/wL5/FiE2/WDNgUO6pWs6X1l1D+c66bEVYbBU2nf0mF
 h67+B3ILA5xrup3bGGz+91bHjeI596Wxl8WRj+z75tr+28PKt4/X5scOSAMed6Hm5rOs
 UgEHNy3Ju0cLtQmuZaPMAeriMid+/b0T0sizxzoYAKEs+TBdqlrB1gY3CzXfDGFvglpO
 wt1A==
X-Gm-Message-State: AOAM532vi+CzNGkUJ4ifUeENyrhfGQovcoIq6lFTSIiW0wOrRUTuKhjS
 kbicIvsT5dWQUhnRXwEnGLvfMwG+d2L2cw==
X-Google-Smtp-Source: ABdhPJzIZ7vAtohsyjJZ1XmOJJObhrXr4eqSBvVJlgZgBjxCkQ29BVpnPr7UTg6aq8iMRHa+uwG4+A==
X-Received: by 2002:a1c:2d54:: with SMTP id t81mr4247277wmt.154.1593184470404; 
 Fri, 26 Jun 2020 08:14:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w13sm37838852wrr.67.2020.06.26.08.14.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 08:14:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/57] hw/arm/aspeed: QOM'ify AspeedMachineState
Date: Fri, 26 Jun 2020 16:13:30 +0100
Message-Id: <20200626151424.30117-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626151424.30117-1-peter.maydell@linaro.org>
References: <20200626151424.30117-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

AspeedMachineState seems crippled. We use incorrectly 2
different structures to do the same thing. Merge them
altogether:
- Move AspeedMachine fields to AspeedMachineState
- AspeedMachineState is now QOM
- Remove unused AspeedMachine structure

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20200623072132.2868-4-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/aspeed.h |  8 +-------
 hw/arm/aspeed.c         | 11 +++++++----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 5114ba0bd4f..09da9d9accf 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -15,13 +15,7 @@ typedef struct AspeedMachineState AspeedMachineState;
 
 #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
 #define ASPEED_MACHINE(obj) \
-    OBJECT_CHECK(AspeedMachine, (obj), TYPE_ASPEED_MACHINE)
-
-typedef struct AspeedMachine {
-    MachineState parent_obj;
-
-    bool mmio_exec;
-} AspeedMachine;
+    OBJECT_CHECK(AspeedMachineState, (obj), TYPE_ASPEED_MACHINE)
 
 #define ASPEED_MAC0_ON   (1 << 0)
 #define ASPEED_MAC1_ON   (1 << 1)
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a167b736970..665d04fbf68 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -33,9 +33,14 @@ static struct arm_boot_info aspeed_board_binfo = {
 };
 
 struct AspeedMachineState {
+    /* Private */
+    MachineState parent_obj;
+    /* Public */
+
     AspeedSoCState soc;
     MemoryRegion ram_container;
     MemoryRegion max_ram;
+    bool mmio_exec;
 };
 
 /* Palmetto hardware value: 0x120CE416 */
@@ -253,7 +258,7 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
 
 static void aspeed_machine_init(MachineState *machine)
 {
-    AspeedMachineState *bmc;
+    AspeedMachineState *bmc = ASPEED_MACHINE(machine);
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
     AspeedSoCClass *sc;
     DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
@@ -261,8 +266,6 @@ static void aspeed_machine_init(MachineState *machine)
     int i;
     NICInfo *nd = &nd_table[0];
 
-    bmc = g_new0(AspeedMachineState, 1);
-
     memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
                        4 * GiB);
     memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
@@ -751,7 +754,7 @@ static const TypeInfo aspeed_machine_types[] = {
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-        .instance_size = sizeof(AspeedMachine),
+        .instance_size = sizeof(AspeedMachineState),
         .instance_init = aspeed_machine_instance_init,
         .class_size    = sizeof(AspeedMachineClass),
         .class_init    = aspeed_machine_class_init,
-- 
2.20.1


