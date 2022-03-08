Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6CF4D16A6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:52:29 +0100 (CET)
Received: from localhost ([::1]:38988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYOC-0008Uv-Mr
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:52:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7e-0007pQ-Mv
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:24 -0500
Received: from [2a00:1450:4864:20::635] (port=41550
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7a-000601-JD
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:21 -0500
Received: by mail-ej1-x635.google.com with SMTP id a8so38523464ejc.8
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nKUMmQL3SyZgCE4dlI8uQSgkH/q/tjlHgDtsb/N/8Mc=;
 b=Yr6x5EpWgWo5Fv42D8kaZ4VeI1fNPo3PgrvpMlUmGummFgqtm1pMTPpSewmWrdy2bk
 lz/PL10hlYFa5xH1rKd+wWxRMXfomRJpkejo8Bdo271cDo3+gHbtFjCwLyCMAIZy8TPf
 grok/ejx+JDsZZCwnfbW1DBDEv0Rb4ja3H00Od8a7/Z89R4eZVn6bhuoT1J1fGeOJzLw
 mOgAfTHzGZ4cLRs+/uh20vsgijFeY1ZOf8Ms3HNVSuWb4YHw5D09yqEauD/4zowCajPa
 twPlnTJgPKsWrazxnl3+myZe4ZM6MlCfpbx0N1kMEHRB1ehmSdRNpnAJT1YYRcAcPKAE
 wxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nKUMmQL3SyZgCE4dlI8uQSgkH/q/tjlHgDtsb/N/8Mc=;
 b=wjd/GoHW99UmiH6SaYURaQKYY6tD/rNfFM6v6NH58AfA2V9kAJNslg2id4MxAX+cKV
 r9wyGEM50AFk0css3BjKXVROXkMNZ+IbxksD8xZmDvn85GpPSrQylyoqL9GX6Bhzchbs
 OEEokxlueQ9zwN9EO4kb57vDYqLjOmFx+olcHaLEgKRLhU7FO8ThAQzKCPfiRpG5zY4g
 18f3byORWe77hyS9K8DTc3Mf3QzuuuOvdooumW8+V4FhC/8Kzq2LMaee6RHprwAWzEup
 t7KkEoJSmcAADET0YDP1DkNbOiyP18/eMVuzBqc78w1Yyk7wPQJFSwsDha4KT6AuKYRl
 IWtA==
X-Gm-Message-State: AOAM530stJ55+njU2qlhjxVnnGsUQ0LViegsNwLl1z/RAfQCduwWsgMf
 79xZy6v9MU9crJdc5P4BFIrmDke4lUg=
X-Google-Smtp-Source: ABdhPJwsLBOEG1tl7PdUFyM4S89l/pmgLoKrK074AMbSS3cU8EvRPy14EAuW49CCnVo+SXrQZGDBRQ==
X-Received: by 2002:a17:907:8a04:b0:6cd:2902:8db3 with SMTP id
 sc4-20020a1709078a0400b006cd29028db3mr13009581ejc.530.1646739312247; 
 Tue, 08 Mar 2022 03:35:12 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/22] x86: Add AMX XTILECFG and XTILEDATA components
Date: Tue,  8 Mar 2022 12:34:37 +0100
Message-Id: <20220308113445.859669-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Yang Zhong <yang.zhong@intel.com>, Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jing Liu <jing2.liu@intel.com>

The AMX TILECFG register and the TMMx tile data registers are
saved/restored via XSAVE, respectively in state component 17
(64 bytes) and state component 18 (8192 bytes).

Add AMX feature bits to x86_ext_save_areas array to set
up AMX components. Add structs that define the layout of
AMX XSAVE areas and use QEMU_BUILD_BUG_ON to validate the
structs sizes.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20220217060434.52460-3-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c |  8 ++++++++
 target/i386/cpu.h | 18 +++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0f3c477dfc..ec35dd1717 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1402,6 +1402,14 @@ ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     [XSTATE_PKRU_BIT] =
           { .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_PKU,
             .size = sizeof(XSavePKRU) },
+    [XSTATE_XTILE_CFG_BIT] = {
+        .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
+        .size = sizeof(XSaveXTILECFG),
+    },
+    [XSTATE_XTILE_DATA_BIT] = {
+        .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
+        .size = sizeof(XSaveXTILEDATA)
+    },
 };
 
 static uint32_t xsave_area_size(uint64_t mask)
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7bd9d58505..3ff1b49d29 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -539,6 +539,8 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_BIT            6
 #define XSTATE_Hi16_ZMM_BIT             7
 #define XSTATE_PKRU_BIT                 9
+#define XSTATE_XTILE_CFG_BIT            17
+#define XSTATE_XTILE_DATA_BIT           18
 
 #define XSTATE_FP_MASK                  (1ULL << XSTATE_FP_BIT)
 #define XSTATE_SSE_MASK                 (1ULL << XSTATE_SSE_BIT)
@@ -847,6 +849,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
 /* AVX512_FP16 instruction */
 #define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
+/* AMX tile (two-dimensional register) */
+#define CPUID_7_0_EDX_AMX_TILE          (1U << 24)
 /* Speculation Control */
 #define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
 /* Single Thread Indirect Branch Predictors */
@@ -1350,6 +1354,16 @@ typedef struct XSavePKRU {
     uint32_t padding;
 } XSavePKRU;
 
+/* Ext. save area 17: AMX XTILECFG state */
+typedef struct XSaveXTILECFG {
+    uint8_t xtilecfg[64];
+} XSaveXTILECFG;
+
+/* Ext. save area 18: AMX XTILEDATA state */
+typedef struct XSaveXTILEDATA {
+    uint8_t xtiledata[8][1024];
+} XSaveXTILEDATA;
+
 QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
@@ -1357,6 +1371,8 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveOpmask) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) != 0x200);
 QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
 QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
+QEMU_BUILD_BUG_ON(sizeof(XSaveXTILECFG) != 0x40);
+QEMU_BUILD_BUG_ON(sizeof(XSaveXTILEDATA) != 0x2000);
 
 typedef struct ExtSaveArea {
     uint32_t feature, bits;
@@ -1364,7 +1380,7 @@ typedef struct ExtSaveArea {
     uint32_t ecx;
 } ExtSaveArea;
 
-#define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
+#define XSAVE_STATE_AREA_COUNT (XSTATE_XTILE_DATA_BIT + 1)
 
 extern ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT];
 
-- 
2.35.1



