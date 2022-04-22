Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B8D50BF17
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:57:16 +0200 (CEST)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxWt-0002sZ-J5
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwbE-0000n2-Aq
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:40 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:33514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwbB-00084p-7z
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:39 -0400
Received: by mail-il1-x132.google.com with SMTP id b5so5441773ile.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XkXB1ypOZ++skoQkKVtL7/x09Njvxh9gdGNburiKDjs=;
 b=YHJKPpMX1fX2pTj9Wwgb6YesQ6sB6yMeUD2LGidkM4q8dxnSAeeWb3UDZ7YpG9+iwb
 tbX5+LtdhqlBVaWafzg60lSo371lBPllNnFYHyNBwNQbH9VexWDXWapPPe+jZLibLuHN
 WktZF0lbdQ1H7mfWR/LQN3GXN9OcVTCpQSNNQTPggGbxS2mL3Qpw/yEqTYrKltComdP8
 yEBDjE37mIltwkUscnVE3F2SFlzIy5+79uF7vOUVLcrsgfDMxdv4py6wRwUhdJ3nO96k
 aDRzuhzdjUQ66zJpdvfSEGepCRmdb2Nzym0cRMPZuV5K9yYptYqjl+aHtK1R1BxwpDJY
 IOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XkXB1ypOZ++skoQkKVtL7/x09Njvxh9gdGNburiKDjs=;
 b=4TKzDj7o/HH1aWDHnXw6Q6/DeofeUeGN/sV9maWCehIjl555vui7yU8ymHyLejQswO
 6Ib9JZXC8wiGIoKIngXoOhlXwTbq/RFoNVA6qZOYizRGKP6rn9x5UDtBUFYd5jCpUdb1
 9+XX9Wb3TGKgboAiGGZ1KVPM+Cy6kaXH2ZaUXXjx2n2GNRqnzgnvVkwXE/7d5+vDT1+O
 iy4gMUm2jWUXDL2IHnIBZBvmRGOr7eRc4bLGpGqUKyLlrli2qPkgBcpxfZq+BoxpxFLa
 UuPR85zC+tUxxJbmINw1GIEzGQgEYymrQixAperAGXuS46F6v07OxoIzx3ro+ot1nM1n
 MZiA==
X-Gm-Message-State: AOAM533CuvVIiQdEcSmy6fru+hisb7POIsPe2xAWEtXppSaZTBvF0EJZ
 791JoIV+JpdJkICnHMpKKdYzBlQ9NrDFI2QZ
X-Google-Smtp-Source: ABdhPJzEHSUoQDxcx+oVnt2XUD6CiFtohENJLw39sjhPDnG3HTOrAjtGrT7rqRyLQd9twsn3Deodkg==
X-Received: by 2002:a05:6e02:1809:b0:2cc:507a:acfa with SMTP id
 a9-20020a056e02180900b002cc507aacfamr2475928ilv.114.1650646656242; 
 Fri, 22 Apr 2022 09:57:36 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 64/68] hw/nios2: Introduce Nios2MachineState
Date: Fri, 22 Apr 2022 09:52:34 -0700
Message-Id: <20220422165238.1971496-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x132.google.com
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
Message-Id: <20220421151735.31996-61-richard.henderson@linaro.org>
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


