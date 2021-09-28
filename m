Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697A041AFB0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:11:55 +0200 (CEST)
Received: from localhost ([::1]:42836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCtm-0006Ti-FG
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa5-0006Op-Tc
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:34 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:47093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa3-0001O4-F1
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:32 -0400
Received: by mail-ed1-x52a.google.com with SMTP id dn26so5833496edb.13
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/5WRUTjHtjEWTz69+uuhMgTteeRSS/ZjOYxvuLAzQ0E=;
 b=UDghGXKMV4tnra6Ko1KcR2KdB/3XP9tB7ZbxDwoa8AGOm3ISLchEo7qGM6zH/PKY5C
 zuhjfK4KmT9H4H+hkPsWa/TRmo+nkn99LjIcEi/gwkVgxY2COe2K4Smz4wap/tyWNXGW
 xHh+l9ZkVFk++aXNJiLIORVeo+lnb4Gsooahrchfv9gIUBvzKiYLXGM0yHaued8XgF/a
 GR6fLfLdAyh/gZodZyrl2TFFeULOhQJwMjHND3U1fFsiq4xBuL992yyuhsvIW7tKs2tX
 G+1RVPDPrlvyldd/9zHsCvJiTsPjTu4Wyu5FPSZGBpjdU1QUN71ZrZUvsDP0ixffHc74
 wtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/5WRUTjHtjEWTz69+uuhMgTteeRSS/ZjOYxvuLAzQ0E=;
 b=WEtQ5T2FlbWphBtczTVQo4LZHSIjiLgShl9lfohvG/Q6nEt56TWXZ2MwO/YGodZyak
 bv4yE0yA6MLgO8/8RlM0d+RHNmtjWPz7Qzm+FEqRATpf0vPS7FhbYz03M4JE9+zXEeB0
 jVWaW0vtuOCoK6VuHnf/1fa9ClD7f7P0+z4YLRQ4QoYzqATUugEJnBaQH1P1rVF92+4l
 BbLhWTDB2fEcTc6J6OEfbZTLbm3ya6xN+9OIJ375xjR2ubKo3to7++IO/OmSVu5SRYmT
 hkU+0ax4RzX1mfVjd1T83ckc4Ug3rG/sehEVOhUUG4oNDv9Y3i64hCIn1IQLdY7VV/28
 URyA==
X-Gm-Message-State: AOAM533cesPsNHvXbcHfjz+CS/GJk96XPs71aUDcrm5OAiPbZto4tnDo
 GLeu1VRDlRFtVPZsH/aGzsIf5goVYZo=
X-Google-Smtp-Source: ABdhPJyci7ENtz4cX+gbU/oOH++gD4Qi56o8HZASLvmTgYs0K3c+ZmpZYOg4AlyXQ69cB0ikp7CjOw==
X-Received: by 2002:a17:906:700f:: with SMTP id
 n15mr6378789ejj.319.1632833486096; 
 Tue, 28 Sep 2021 05:51:26 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/33] i386: Add SGX CPUID leaf FEAT_SGX_12_0_EBX
Date: Tue, 28 Sep 2021 14:50:52 +0200
Message-Id: <20210928125116.183620-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

CPUID leaf 12_0_EBX is an Intel-defined feature bits leaf enumerating
the platform's SGX extended capabilities.  Currently there is a single
capabilitiy:

   - EXINFO: record information about #PFs and #GPs in the enclave's SSA

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-9-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 21 +++++++++++++++++++++
 target/i386/cpu.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2cd1487bae..c0d5c3c621 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -655,6 +655,7 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_XSAVE_XSAVEC, CPUID_XSAVE_XSAVES */
 #define TCG_14_0_ECX_FEATURES 0
 #define TCG_SGX_12_0_EAX_FEATURES 0
+#define TCG_SGX_12_0_EBX_FEATURES 0
 
 FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
     [FEAT_1_EDX] = {
@@ -1202,6 +1203,26 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .tcg_features = TCG_SGX_12_0_EAX_FEATURES,
     },
+
+    [FEAT_SGX_12_0_EBX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            "sgx-exinfo" , NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .cpuid = {
+            .eax = 0x12,
+            .needs_ecx = true, .ecx = 0,
+            .reg = R_EBX,
+        },
+        .tcg_features = TCG_SGX_12_0_EBX_FEATURES,
+    },
 };
 
 typedef struct FeatureMask {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 2b199102ef..e66ec85980 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -579,6 +579,7 @@ typedef enum FeatureWord {
     FEAT_VMX_VMFUNC,
     FEAT_14_0_ECX,
     FEAT_SGX_12_0_EAX,  /* CPUID[EAX=0x12,ECX=0].EAX (SGX) */
+    FEAT_SGX_12_0_EBX,  /* CPUID[EAX=0x12,ECX=0].EBX (SGX MISCSELECT[31:0]) */
     FEATURE_WORDS,
 } FeatureWord;
 
-- 
2.31.1



