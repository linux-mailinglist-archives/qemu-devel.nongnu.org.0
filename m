Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2264C1E85
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:34:15 +0100 (CET)
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0D8-0000iP-8T
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:34:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nN0Aa-00065S-Ib; Wed, 23 Feb 2022 17:31:36 -0500
Received: from [2607:f8b0:4864:20::f33] (port=36443
 helo=mail-qv1-xf33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nN0AY-00014u-FZ; Wed, 23 Feb 2022 17:31:36 -0500
Received: by mail-qv1-xf33.google.com with SMTP id w7so704521qvr.3;
 Wed, 23 Feb 2022 14:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oJCqRIkEsM1dSkylYRG8xS2rNewVHCYsSgGo0LbMZ4E=;
 b=QnU/I+98HQ6MSkmaf7jNXnDg3E28TaVbP4xpsd8Qm5Ivj9ZOUTbF1wLZepeBLjFJ2d
 0Z7idnHggT3ZCcQnmQgNKxtJdErWLhyYOyMV42pABPTquWmbikr8RIvrLMRXIEvDtlwS
 hwQMhkuwt54pTlGQ9GWxfv47oHUAaUjhv8944LykmOKwNX2Uq6HrvM57A6uwDP79xQBt
 oXqL1Fo/frTNri52e+Fj/T670fsRkuC7I7CC4pdt6yUEZWQDtoPkU5PIgTqL+qIY267O
 7FiP+IWHzQCx0GWQY3nDP/Unc5nMBxvAn+3/YBiXtQ3hy73IU+QNW9N9edgdDiC+3dQ2
 nYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJCqRIkEsM1dSkylYRG8xS2rNewVHCYsSgGo0LbMZ4E=;
 b=tciW7EgRFpYXvR123vhhzOAGeeyTkQFIOSybfqjlsfbOBh4bo55d8ETmIo7hZhyleA
 zDjQ+zgu7kq9+atS/6nQtL7V7tP7BRrWIG7L+jysbv001k/4K+bMLacXReJQYahk/JNR
 wklc4S2Vfml4rfhbQBoDGXI/uciu5GUqJSiCtCLUDgWrcNZLT2y4tnK/XRhMQdW8qit+
 m/VU9vY6J4HXw0Mrn1/0rPwQsEvMNEk4AiqsEm2+poPIuCs2Hw+VkZO4kqk80zpgkqSG
 2IaO6HkQKRPyKG4KTM7Y5xKBO3cX5zelmqdLS7es3B4qz3GzztAa31zCuNSbVjs9C8jN
 wZzg==
X-Gm-Message-State: AOAM532Nvfb2K/kht149j0Bc/2rvnbVo9FYHt2BCj7SZFE6xIfGWYt21
 zQ/Iy2rO1vlht3UnrKm835V0a7CKM3HYV8tqJnw=
X-Google-Smtp-Source: ABdhPJyn6gTes3Z33io1DYYcQankzT7y3ghv4xbplArDfYO0Yk1pVRU/80j9z7pvLv0IVbLxg14WIw==
X-Received: by 2002:a05:622a:1349:b0:2d1:9c38:fe2c with SMTP id
 w9-20020a05622a134900b002d19c38fe2cmr1921158qtk.253.1645655493172; 
 Wed, 23 Feb 2022 14:31:33 -0800 (PST)
Received: from rygar.pwrtc.com (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id
 o18sm618968qtv.26.2022.02.23.14.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:32 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v7 2/4] s390x/cpumodel: Bump up QEMU model to a stripped-down
 IBM z15 GA1
Date: Wed, 23 Feb 2022 17:31:15 -0500
Message-Id: <20220223223117.66660-3-dmiller423@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220223223117.66660-1-dmiller423@gmail.com>
References: <20220223223117.66660-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf33.google.com
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


