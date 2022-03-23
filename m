Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B41C4E51A9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:54:31 +0100 (CET)
Received: from localhost ([::1]:54936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzZO-0005gY-6S
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:54:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWzOe-0000UB-Ay
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:43:26 -0400
Received: from [2a00:1450:4864:20::633] (port=44778
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWzOc-0001D9-34
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:43:23 -0400
Received: by mail-ej1-x633.google.com with SMTP id r22so2228287ejs.11
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NXBftiV6s8HuLt4je98lM8SPphqtzzoXIWEbFS2bKSc=;
 b=N569PxRZni+IKqfP3Epu6t2AcMeqbHyIdowfaJvFplCVB71XJF8fAoFvipMF8Rh5JG
 5uyj1GstKbTlOF6gPyvsvxlOAixDEXWQC+KYgpy4XfoxEi2+pW06MlaXsQJyPnwdXIh/
 J2A+FXYrr1/2e/dTPFZeVBBAX1a2SYuciFEC7+1ph2244w+KasmdWt84Mhyo+F5WY9y4
 ZROkHYIZAMW2rES/LuVVPd8zbbJXSIjviQTEr7DGR5n/b0JOKtWmKr8faL+xOKgVK5GM
 fyStJBx482Jg4ZquR/qQ0Scv9w+o3k2lpIEIHCEkUkLEDebkO9yLB6uS2GqTO8LvvmyZ
 IOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NXBftiV6s8HuLt4je98lM8SPphqtzzoXIWEbFS2bKSc=;
 b=DnOnDWYh/jHdm6dgJy8GhzrleouLu5TSRqybR5TdDTSzrg0GEg00m5angosxDlRhwr
 mCY3lO2eOVbsJXF4VtDlKLZdz6ttyV+svDpjXdMSgDgFC+ttimcjAKAkWZjwY3ETKN64
 ltofLDihpvOO8zCmHqqshhi3RYQtCJsB+lNW2MJ4PUmOqD9IttLY0P3HaEAPG6r9C5k2
 VH8CC90dLhWmwfTMtW0sSC5/wF8XGTR93OBU8k+ltvY8RRQ2sj5vRAz9yjKzKPdGEhmM
 zgcl8LNHc3nTOqb1pofbgvf5sFnMO4Yob2TxGL00e57+ImxgR4k3f3vPNzsWCC8b82UC
 +f+g==
X-Gm-Message-State: AOAM531HYAyjxzUIsvR4OIz6uWtOqt+s3+sT3F4VOaxy4akZUVrU5w6P
 nJTKfoxT1Wo8Ngt5/yTkiQfnMhqUfds=
X-Google-Smtp-Source: ABdhPJwmmcOJ+QuHJ3iC5lMgBZWjJ6cV74EfYoiYwLHc8KAsKPKRhAIOlmV7hqiVH2C5QIc6YcpqIw==
X-Received: by 2002:a17:906:1e94:b0:6b9:6fcc:53fd with SMTP id
 e20-20020a1709061e9400b006b96fcc53fdmr31175819ejj.450.1648035800112; 
 Wed, 23 Mar 2022 04:43:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a50fe81000000b004197f2ecdc2sm519690edt.89.2022.03.23.04.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:43:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] KVM: x86: workaround invalid CPUID[0xD,
 9] info on some AMD processors
Date: Wed, 23 Mar 2022 12:43:15 +0100
Message-Id: <20220323114315.22594-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some AMD processors expose the PKRU extended save state even if they do not have
the related PKU feature in CPUID.  Worse, when they do they report a size of
64, whereas the expected size of the PKRU extended save state is 8, therefore
the esa->size == eax assertion does not hold.

The state is already ignored by KVM_GET_SUPPORTED_CPUID because it
was not enabled in the host XCR0.  However, QEMU kvm_cpu_xsave_init()
runs before QEMU invokes arch_prctl() to enable dynamically-enabled
save states such as XTILEDATA, and KVM_GET_SUPPORTED_CPUID hides save
states that have yet to be enabled.  Therefore, kvm_cpu_xsave_init()
needs to consult the host CPUID instead of KVM_GET_SUPPORTED_CPUID,
and dies with an assertion failure.

When setting up the ExtSaveArea array to match the host, ignore features that
KVM does not report as supported.  This will cause QEMU to skip the incorrect
CPUID leaf instead of tripping the assertion.

Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Analyzed-by: Yang Zhong <yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c         |  4 ++--
 target/i386/cpu.h         |  2 ++
 target/i386/kvm/kvm-cpu.c | 19 ++++++++++++-------
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a88d6554c8..ec3b50bf6e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4981,8 +4981,8 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     return cpu_list;
 }
 
-static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
-                                                   bool migratable_only)
+uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
+                                            bool migratable_only)
 {
     FeatureWordInfo *wi = &feature_word_info[w];
     uint64_t r = 0;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5e406088a9..e31e6bd8b8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -606,6 +606,8 @@ typedef enum FeatureWord {
 } FeatureWord;
 
 typedef uint64_t FeatureWordArray[FEATURE_WORDS];
+uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
+                                            bool migratable_only);
 
 /* cpuid_features bits */
 #define CPUID_FP87 (1U << 0)
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index a35a1bf9fe..5eb955ce9a 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -99,13 +99,18 @@ static void kvm_cpu_xsave_init(void)
     for (i = XSTATE_SSE_BIT + 1; i < XSAVE_STATE_AREA_COUNT; i++) {
         ExtSaveArea *esa = &x86_ext_save_areas[i];
 
-        if (esa->size) {
-            host_cpuid(0xd, i, &eax, &ebx, &ecx, &edx);
-            if (eax != 0) {
-                assert(esa->size == eax);
-                esa->offset = ebx;
-                esa->ecx = ecx;
-            }
+        if (!esa->size) {
+            continue;
+        }
+        if ((x86_cpu_get_supported_feature_word(esa->feature, false) & esa->bits)
+            != esa->bits) {
+            continue;
+        }
+        host_cpuid(0xd, i, &eax, &ebx, &ecx, &edx);
+        if (eax != 0) {
+            assert(esa->size == eax);
+            esa->offset = ebx;
+            esa->ecx = ecx;
         }
     }
 }
-- 
2.35.1


