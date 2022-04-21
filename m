Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F75E50A50B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:12:55 +0200 (CEST)
Received: from localhost ([::1]:36764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZQM-0008NP-PD
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYdH-0005nn-R5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:22:19 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:41895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYdF-0007FY-Gl
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:22:10 -0400
Received: by mail-il1-x12d.google.com with SMTP id h4so3252470ilq.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WPr4QYChElGxhEce/LWtiBTMBdsOQPvJQwidP7rUddQ=;
 b=TwtClUS5bFdwoMgsjgAirE3BpKyWDD/WM5YzlyM1D+PBA8lyBjsZkNu7kyrNzwwqlY
 JjLPGK2SY9u+bhPc8lL0nbbPzQk3aK3d/H8tRR5Ow7pXb5s7V76tatEhceO0bQG3ZtSf
 2TWNR9mwqqZ6AF1z9TIzD6jskHB4fGRwBfuxQQWzQp3W69thP1ZuRCSgguySSjiDuBwQ
 ytqtq2v2sXKLlVz4JlNLSYTSabCH+MpU5ifKXTxU5JOnd061UgwGKYl7DCxLhuuwTwA3
 k4hLt2J1N320kCXsGQsEdLrXJeWxxwxltr7pkcCw8a/J0J9PO7qm3QmyZkjPX7FBg8s4
 jhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WPr4QYChElGxhEce/LWtiBTMBdsOQPvJQwidP7rUddQ=;
 b=G9Ba4VIFXnMov8d8E/y8kaznKLW8/9kZMIPG/037U1eANKgWKv6v+ZAuTscW0QetZ7
 if5E4XGi3f0DVjfP+EiBWjHeMY3xpupOs5sX4HisI42t4HVYJOmobtWzLOyJqlFiht25
 24dyRCHlXGUM1TwKADLuDDP/YSdeZuMOJ63UrUGraUYQ8QFfqwyORVqpWhTpABcE6oWh
 tbd88zJQTQoi0VZp+lFVKZcumdAsFp4g4/gkItWVEjYgbe5EFVbTa6KaTJufLwDsNZ9F
 kQQn9SeBJBCAEGsJKSMTQRHN1uSeZDRkNVFyodwnAKeWap6c24RSaMBTtJe1UTyd+obh
 FmYw==
X-Gm-Message-State: AOAM533UhjcQby7jCHLhlp0+nhsYHUwwN9HGjQlWCl4M/9jSOP2f2pHo
 sfR6NSpta1Umhue1b+9kbHZz5VASUgIFTg==
X-Google-Smtp-Source: ABdhPJy8x5A+VBfe0Klzc2WeXL0YV/UWdSFeWFyJ0qlpPEuP1itJE3id2i9TBGiJOhCSCH203CnDoQ==
X-Received: by 2002:a92:ca06:0:b0:2cc:3a47:e5d with SMTP id
 j6-20020a92ca06000000b002cc3a470e5dmr80573ils.115.1650554528487; 
 Thu, 21 Apr 2022 08:22:08 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:22:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 60/64] hw/nios2: Introduce Nios2MachineState
Date: Thu, 21 Apr 2022 08:17:31 -0700
Message-Id: <20220421151735.31996-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
2.34.1


