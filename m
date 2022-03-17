Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703154DBED7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:58:04 +0100 (CET)
Received: from localhost ([::1]:34090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUj99-0004TR-Ib
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:58:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiOA-0005oR-4W
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:32 -0400
Received: from [2607:f8b0:4864:20::635] (port=44563
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiO8-0002el-Me
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:29 -0400
Received: by mail-pl1-x635.google.com with SMTP id q11so3539969pln.11
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gbz23MwsSOjvrGQ78PxYHanfS3o+COJmYNaivXWFkEM=;
 b=zEZr1ixSIpyPpUwhSP6o0OoOgSk5zKEijlLEgkCy0SNa/5nB2CWvBESNp39NrJUoEA
 gt2ddTjDXPbTsEQUETEEl2gya8YGDAsH+R4e8nFKbxC/Hd516Hjd8baB4/CPGAi0HZ0J
 QVezBF1nkj0blSZtk0X+ClWATqNmKaEqjdoljzjlxXJBtkND7J9G1yHL3YF+hJGe9Rpd
 /WQ0TDbbzAfQn4DJMxSkGT8uZ4Ydtvuy5bjUhT4kh5Ky0OhJXjlM9JpYfjQlqEOaSVMq
 tNPH0MeESGWVQqgJb9wkLO3fD8m1XqY1af4dYmW9tT6rEBfn3ZKfEB2NrvGqrqKZN7VA
 hnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gbz23MwsSOjvrGQ78PxYHanfS3o+COJmYNaivXWFkEM=;
 b=Gw8azmRWj+BBZDlupI0+eDsn7V/9urdhp5JSlCcAJ3cAKjQPvnuEoTLfC7wyOmk4Jx
 WdiJIEp6Vu8HqWblneUK4jrSYoXv/RmZc8VIMQgNbtI+K19m/1M6XTLPP8oI9jxYeFYb
 nVDvNQs30Nq5+V132zuDluybPlUvsSWuFAMHXj8B+iQHOBb+bC97Pi5mjbwu2SuzU1lT
 Xo+cgc3Yu7/VZxvXpIDkl/XSkKh3DHH7IvJg0eRWGsO+/9d6UuFOEpigBYC/xfGQHrg5
 PTyyH7UwFq/I1w+W11Zdv8a/i5XdkmJ7r3eaVJe1Vv0RDrcpKn20NTD0qB1cIECnQHek
 OsjA==
X-Gm-Message-State: AOAM532/dkf3BYs0xb8g54A1nUucngN3iXhnDsdpI7Qpgs78Ae6ohvSe
 xx9OiPKtbBg0DmctZ6PeqQ0mcPWs6KlahA==
X-Google-Smtp-Source: ABdhPJzt2R536efs8Xy46UmunMFFFetaFiOv5D2dQJ4R9YTjOFxqjyI74JPAGcRuZVKBSPvXWj/eqg==
X-Received: by 2002:a17:902:a614:b0:153:196d:634f with SMTP id
 u20-20020a170902a61400b00153196d634fmr3278062plq.39.1647493764589; 
 Wed, 16 Mar 2022 22:09:24 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b0037947abe4bbsm4217493pga.34.2022.03.16.22.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:09:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 46/51] hw/nios2: Introduce Nios2MachineState
Date: Wed, 16 Mar 2022 22:05:33 -0700
Message-Id: <20220317050538.924111-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to move data from the heap into Nios2MachineState,
which is not possible with DEFINE_MACHINE.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/nios2/10m50_devboard.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 3d1205b8bd..bdc3ffd50d 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -36,6 +36,13 @@
 
 #include "boot.h"
 
+struct Nios2MachineState {
+    MachineState parent_obj;
+};
+
+#define TYPE_NIOS2_MACHINE  MACHINE_TYPE_NAME("10m50-ghrd")
+OBJECT_DECLARE_TYPE(Nios2MachineState, MachineClass, NIOS2_MACHINE)
+
 #define BINARY_DEVICE_TREE_FILE    "10m50-devboard.dtb"
 
 static void nios2_10m50_ghrd_init(MachineState *machine)
@@ -105,11 +112,24 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
                       BINARY_DEVICE_TREE_FILE, NULL);
 }
 
-static void nios2_10m50_ghrd_machine_init(struct MachineClass *mc)
+static void nios2_10m50_ghrd_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Altera 10M50 GHRD Nios II design";
     mc->init = nios2_10m50_ghrd_init;
     mc->is_default = true;
 }
 
-DEFINE_MACHINE("10m50-ghrd", nios2_10m50_ghrd_machine_init);
+static const TypeInfo nios2_10m50_ghrd_type_info = {
+    .name          = TYPE_NIOS2_MACHINE,
+    .parent        = TYPE_MACHINE,
+    .instance_size = sizeof(Nios2MachineState),
+    .class_init    = nios2_10m50_ghrd_class_init,
+};
+
+static void nios2_10m50_ghrd_type_init(void)
+{
+    type_register_static(&nios2_10m50_ghrd_type_info);
+}
+type_init(nios2_10m50_ghrd_type_init);
-- 
2.25.1


