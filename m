Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA375108FE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:29:25 +0200 (CEST)
Received: from localhost ([::1]:43358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQsG-0001XP-8T
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq9-00028H-Tq
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:09 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq8-0005Z2-8s
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:09 -0400
Received: by mail-pg1-x52a.google.com with SMTP id s137so16744970pgs.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XkXB1ypOZ++skoQkKVtL7/x09Njvxh9gdGNburiKDjs=;
 b=AMdsVkQjDWZTwlJUvXawdRs6Ibr8PdEFbz+V6hAAjMVf0S2o/tYeg0btW94KCYZE4s
 um+7IskdKCJGyEQ3cXXMgSCJ8qslHV4z07HLCzbjViEM330mtuC4IMiDAH9YXL9fhUgB
 oHqBQjd5nEchnB/9QTrNBvApZUZ9qk+gOCORdPJwoc3lPvZbJ6dbZmtZySatMSggSQMt
 uPiMBKYY/elnbYaWsmhGXqQ5QZyG2aFMgIGoiFHLMEhyF/SilN0zeVF8drQ2twAgS61j
 d1wetpm5TGYbiyOQrEbu/ZuGe4IpbS4Bg4iL/9MD5NVZkX2QIh8l5/zINaOt7evQuxON
 VXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XkXB1ypOZ++skoQkKVtL7/x09Njvxh9gdGNburiKDjs=;
 b=dZwgnU0rQ1JTnVJ85SJBDNkwaeNYzVLonc9i2kr6ciOeQHjcDMBHy1+aHOdV3c2nse
 DmCJ0Y7wqRAu7LN5K+94Pv3Z7ohi2o/b4SxuEE3RroH6mN1v957VI9Nwz+Pp2ROOoVL0
 H/xAt6g4iaMHTi+agJvnht4Slhf0W4auJOMhwMwBk+C3W1chkwxCajKtbureLilOC9Dg
 yMGny65JUyk8so0B96c6Mp7DQTMxhfIKQMIWwCK5TyeRDu2v4Q84qmT+ThK7vPNSpZWT
 zvOVqg6tZmA3Nk2rvBTcSHMdWn5SQz7hiLznDAAuIh1DYuD2LjIJzFYO76E7UbjyWTnM
 IYDQ==
X-Gm-Message-State: AOAM532r3rHd1z85e2FKpvwuEbXLvFmM11rsJ8iITkdSsfBUiJSq0yh8
 wnChwVrm6/+K7IQBnmN53oCjq7sXTDwjNQ==
X-Google-Smtp-Source: ABdhPJxzN2W50vER1uo1/bv4ilM9j9SnVSLw+dvYFn8T16icptIGU++/HEMXxZVwG9vNSFt5L7kBTg==
X-Received: by 2002:a63:197:0:b0:3aa:9c7a:b269 with SMTP id
 145-20020a630197000000b003aa9c7ab269mr20485182pgb.158.1650997387003; 
 Tue, 26 Apr 2022 11:23:07 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:23:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 64/68] hw/nios2: Introduce Nios2MachineState
Date: Tue, 26 Apr 2022 11:19:03 -0700
Message-Id: <20220426181907.103691-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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


