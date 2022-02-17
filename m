Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB274BAD2A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 00:20:03 +0100 (CET)
Received: from localhost ([::1]:33430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKq49-0002X0-I7
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 18:20:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKq1x-0000FX-OH; Thu, 17 Feb 2022 18:17:45 -0500
Received: from [2607:f8b0:4864:20::72a] (port=33674
 helo=mail-qk1-x72a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKq1w-00085B-2m; Thu, 17 Feb 2022 18:17:45 -0500
Received: by mail-qk1-x72a.google.com with SMTP id o10so6340632qkg.0;
 Thu, 17 Feb 2022 15:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oJCqRIkEsM1dSkylYRG8xS2rNewVHCYsSgGo0LbMZ4E=;
 b=WtucrHOvw5xwj+XE6hAsEwI3W6sUuBLNVgDD4DqwauAcNdnSQzFYPVokmzll/gD5NT
 q1+x71ZKfMp3+xO6L5XLYYZwwANimQoJAfQQJkQzw7g4DbrkGCJhsMG9YWioxM8OalHt
 2W/XKYHnUiKyaXnF5bpv5aPbjPAOOvEZ2WyztWTdU0eL4WwmQBekT/l0rhx017YAL9Lg
 EUTEmk1dzB6gX4WMvn09jw/t1OeLvhipsbPhT+WFMKMVier51ACBjXH0h/nT3HPpe5gS
 UR/8w1alVFMcYaSVEG6u8aAI8tdV3rI3OPBGLxMeCjt8eE5tUyPFXfFoH9G8M8gB6Cg2
 GH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJCqRIkEsM1dSkylYRG8xS2rNewVHCYsSgGo0LbMZ4E=;
 b=ebWwcSl7KWM2XwKrrmNDCisLcQS0U/YM5o0K1mJZuZ+CbgWt+ckOnGfTsecT5090PQ
 Nn0mZOstTT6WuoaTByJhEAj4gP44mJs+AjconL+SrI91JUvAFGRheAcd8FB2CRlGMBzw
 H9qmXCEJCz4aOQ2oWUOuGQCvrTHfHFjVI+fWL08amt8HIFOo6cc2qUIxAdu6WIBbFbwa
 BpUC1SQ0pf30a0GVE/HXoTKQR2o4lvzmHTYMysOIEarJUWJa4jjY8g8w0eQdsC2c5nAM
 QN8Igj6CEfNnNvmCEVAZp1aB1TOVI3wuMrrm5jI2/LXHaU49I88qUM4BbztjFolWZ1NF
 Fuow==
X-Gm-Message-State: AOAM5304VNZ8L49+iRdaqRrpjizF4zNELeSVbH3sj0vOY8jQaGqd6PHW
 21lcXgBIGCuN5jZOK+iDnMIcE1x/t6m6R3ZU6hkL0qT4
X-Google-Smtp-Source: ABdhPJzQrWItwEV3Y5XEfEymf0cPF6eryuuO9jdm+pAXMPPgJm2etENl2CA4xnfkSZ6qnsm7VXaB3g==
X-Received: by 2002:a05:620a:3de:b0:60d:dd0a:4d0c with SMTP id
 r30-20020a05620a03de00b0060ddd0a4d0cmr2550429qkm.246.1645139862774; 
 Thu, 17 Feb 2022 15:17:42 -0800 (PST)
Received: from rygar.pwrtc.com (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id
 h10sm21272939qko.92.2022.02.17.15.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 15:17:42 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 2/4] s390x/cpumodel: Bump up QEMU model to a stripped-down
 IBM z15 GA1
Date: Thu, 17 Feb 2022 18:17:26 -0500
Message-Id: <20220217231728.13932-3-dmiller423@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220217231728.13932-1-dmiller423@gmail.com>
References: <20220217231728.13932-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=dmiller423@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TCG implements everything we need to run basic z15 OS+software

Signed-off-by: David Miller <dmiller423@gmail.com>
---
 hw/s390x/s390-virtio-ccw.c  | 3 +++
 target/s390x/cpu_models.c   | 6 +++---
 target/s390x/gen-features.c | 7 +++++--
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 84e3e63c43..90480e7cf9 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -802,7 +802,10 @@ DEFINE_CCW_MACHINE(7_0, "7.0", true);
 
 static void ccw_machine_6_2_instance_options(MachineState *machine)
 {
+    static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V6_2 };
+
     ccw_machine_7_0_instance_options(machine);
+    s390_set_qemu_cpu_model(0x3906, 14, 2, qemu_cpu_feat);
 }
 
 static void ccw_machine_6_2_class_options(MachineClass *mc)
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 11e06cc51f..89f83e81d5 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -85,9 +85,9 @@ static S390CPUDef s390_cpu_defs[] = {
     CPUDEF_INIT(0x3932, 16, 1, 47, 0x08000000U, "gen16b", "IBM 3932 GA1"),
 };
 
-#define QEMU_MAX_CPU_TYPE 0x3906
-#define QEMU_MAX_CPU_GEN 14
-#define QEMU_MAX_CPU_EC_GA 2
+#define QEMU_MAX_CPU_TYPE 0x8561
+#define QEMU_MAX_CPU_GEN 15
+#define QEMU_MAX_CPU_EC_GA 1
 static const S390FeatInit qemu_max_cpu_feat_init = { S390_FEAT_LIST_QEMU_MAX };
 static S390FeatBitmap qemu_max_cpu_feat;
 
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index a3f30f69d9..22846121c4 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -731,16 +731,18 @@ static uint16_t qemu_V6_0[] = {
     S390_FEAT_ESOP,
 };
 
-static uint16_t qemu_LATEST[] = {
+static uint16_t qemu_V6_2[] = {
     S390_FEAT_INSTRUCTION_EXEC_PROT,
     S390_FEAT_MISC_INSTRUCTION_EXT2,
     S390_FEAT_MSA_EXT_8,
     S390_FEAT_VECTOR_ENH,
 };
 
+static uint16_t qemu_LATEST[] = {
+    S390_FEAT_MISC_INSTRUCTION_EXT3,
+};
 /* add all new definitions before this point */
 static uint16_t qemu_MAX[] = {
-    S390_FEAT_MISC_INSTRUCTION_EXT3,
     /* generates a dependency warning, leave it out for now */
     S390_FEAT_MSA_EXT_5,
 };
@@ -863,6 +865,7 @@ static FeatGroupDefSpec QemuFeatDef[] = {
     QEMU_FEAT_INITIALIZER(V4_0),
     QEMU_FEAT_INITIALIZER(V4_1),
     QEMU_FEAT_INITIALIZER(V6_0),
+    QEMU_FEAT_INITIALIZER(V6_2),
     QEMU_FEAT_INITIALIZER(LATEST),
     QEMU_FEAT_INITIALIZER(MAX),
 };
-- 
2.32.0


