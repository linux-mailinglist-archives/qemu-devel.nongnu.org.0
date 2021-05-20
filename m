Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2E1389FDC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:32:03 +0200 (CEST)
Received: from localhost ([::1]:38910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lje66-0003iW-JB
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxb-0005NX-FU
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:18 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxU-0001Ub-3A
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:12 -0400
Received: by mail-wr1-x431.google.com with SMTP id h4so16636671wrt.12
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xeBb+PZOjki35JyC9DUC4rb50PMay73s+T70Md+GY3E=;
 b=BxnoaO34R0T/5ce/iDqJUIpjtgloZW5MYOYYwMeY6PydlrmF9O70hER+1VxO65rrui
 GFjZxk8MwBiHePnaAjE29/3P1Bjs0sJStmtk0XQiNtD1bbLM6sufPlplp/54Rn+x+sPf
 RJBPCp4VwWu+EN1DhrZmNhAFjJ1uZRyYD6aLrqnCdpTvq60dXBGSbuBIWzFsaciTEVBm
 jIbTugoRqDsini9CvaY76teok0R7j8XWtupJ5kr1Ej+nZiNrxqlnQkwV03PanTLk7ngq
 uVSLLMWeJ1LY7fU9H87U99XuywjUaROUNir9DCt186Du/Wb3DP8M2VwBtT8In133oiFA
 JeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xeBb+PZOjki35JyC9DUC4rb50PMay73s+T70Md+GY3E=;
 b=NKDaYervMrYahzbpiViQbclKJtWUjU/GFPbNMhfpYPci970o9lR2lyYs1sp9cdmmEq
 79NVUsWgGaHx1lpvaZnEpRrEivAwtNRgNKjJCW7akHxYjcWhKOvRF2WGTktnGXzsrkNS
 3PZQZqp4/t163pg8SG2m5zu6sCV1bbIbcetHRC1OLoP6I7PGYee7ocP0oOpCXSW7Wcgb
 G4UUUczGzu7YdX9WzNg36g0tSM5m4RgWNgnbVz3eW758Q7kdWwKpSNRHt/XLW8gBp/Uw
 QoZE1rY1y1WvPqu9L5HND0mnHIzSQJEW2VQDXChWwe9T4H4FyRN2pehNgeKseCk79uwN
 DBQg==
X-Gm-Message-State: AOAM533AqUUbiXZcCSaZL3QWY/rYehju2lrFTADIPEZ6Wm6FlUiSlWvl
 OaHpiiqOBhhfBRpySTsuknZbp6maOxg/Jw==
X-Google-Smtp-Source: ABdhPJyL1kx9IfWj+0DlBGXS1jrrN3J7Qum+aO+WS3vfcszAfXdxqMVhKzTKxJzjrHciXrnZ6x4Fdw==
X-Received: by 2002:a5d:4c49:: with SMTP id n9mr2876436wrt.417.1621498981965; 
 Thu, 20 May 2021 01:23:01 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/26] i386/cpu: Expose AVX_VNNI instruction to guest
Date: Thu, 20 May 2021 10:22:36 +0200
Message-Id: <20210520082257.187061-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

Expose AVX (VEX-encoded) versions of the Vector Neural Network
Instructions to guest.

The bit definition:
CPUID.(EAX=7,ECX=1):EAX[bit 4] AVX_VNNI

The following instructions are available when this feature is
present in the guest.
  1. VPDPBUS: Multiply and Add Unsigned and Signed Bytes
  2. VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
  3. VPDPWSSD: Multiply and Add Signed Word Integers
  4. VPDPWSSDS: Multiply and Add Signed Integers with Saturation

As for the kvm related code, please reference Linux commit id 1085a6b585d7.

The release document ref below link:
https://software.intel.com/content/www/us/en/develop/download/\
intel-architecture-instruction-set-extensions-programming-reference.html

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210407015609.22936-1-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 4 ++--
 target/i386/cpu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c496bfa1c2..9e211ac2ce 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -940,7 +940,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             NULL, NULL, NULL, NULL,
-            NULL, "avx512-bf16", NULL, NULL,
+            "avx-vnni", "avx512-bf16", NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
@@ -3194,7 +3194,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY | MSR_ARCH_CAP_MDS_NO |
             MSR_ARCH_CAP_PSCHANGE_MC_NO | MSR_ARCH_CAP_TAA_NO,
         .features[FEAT_7_1_EAX] =
-            CPUID_7_1_EAX_AVX512_BF16,
+            CPUID_7_1_EAX_AVX_VNNI | CPUID_7_1_EAX_AVX512_BF16,
         /*
          * Missing: XSAVES (not supported by some Linux versions,
          * including v4.1 to v4.12).
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 324ef92beb..d4e80e1344 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -817,6 +817,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 /* Speculative Store Bypass Disable */
 #define CPUID_7_0_EDX_SPEC_CTRL_SSBD    (1U << 31)
 
+/* AVX VNNI Instruction */
+#define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
 
-- 
2.31.1



