Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CA5401C3A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:25:03 +0200 (CEST)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEcQ-0001d5-NG
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPM-0000jc-8D
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:33 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPH-0007Xq-CE
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id n39so2853942wms.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RRJTF3s239YW+hogYZWHow5r46rStgldhFDNRwK+33s=;
 b=NaDTZBT+Q+Nu7gwOq0L1vZPuUTefVtUb7Dkcmwi4+J7c/tBY3MowWgCu9ii/aGy1WY
 sQRdSOQ8XxTrGKwcyXFsXF6zIEfrx7yCcqEd6D7H/tzjP87NiJEpo7ufJ7jMNN3MG9RE
 01W1kWs9HHurNahaTSyYifwGodfRrZ9kg+JNrv+5sZkVMqoSLTkab8md+Iq+wQOPvonY
 AkVNfCuJ/rE0DIvx+h/Y7tZXjTtVL+atcraNopjXJQgunjJBiCg8fnotv0vSDDdqX92f
 +1ZWAe33+F43xz/7C4sElrVYpbz5ior2IzwAEi5lHFW6G++79Ml197mePnMcS+2QQcVp
 iUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RRJTF3s239YW+hogYZWHow5r46rStgldhFDNRwK+33s=;
 b=t7rP9CBCMTnwEQpK6ANyez42cRMCUjaz3PHrsVuIjBVLJKNiIOEfXo39NMp91KyW8S
 g6WB1x7xwQoAqyu6CmO5u5Eu2QokmOrstlsTaQKrCGWiBWm8Okm9mGNeDDUJwGfAqwr7
 aGjeDIXlCoEw1JdWwxT8zELqHvCGwjQcJEISJMXaqgXWMXuqRQliLx/65Qhs3MucsaUd
 DQbbE9sKrxR5H9yNm11zkW5Y+O6jt5eBexB58xZNt01jFnKDA3KO/OKCNWXfDbfMh+yp
 XE2dCHNQsUKiipWq7sjPRaPJ/3kt/Qjbl7jzec2Qhb9vZmVit1spuh5c7L5dPFe1aJDy
 MSEg==
X-Gm-Message-State: AOAM533qKS2qnb/dZysnyRtNQQDtEBcqHbuiluqBUxRhY/2yh+IG3Db1
 +jlbOjuwHGb02RTAPUrn9yevSaKdD/w=
X-Google-Smtp-Source: ABdhPJz3+tmwm4/X9mXDvtgNpO/XUdyE/jg/iaOm3jYoJjYKCi73fGYDrybkPnr6+PeU/oXNGUUb8g==
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr11743460wme.52.1630933886212; 
 Mon, 06 Sep 2021 06:11:26 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/36] i386: Add SGX CPUID leaf FEAT_SGX_12_0_EAX
Date: Mon,  6 Sep 2021 15:10:38 +0200
Message-Id: <20210906131059.55234-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

CPUID leaf 12_0_EAX is an Intel-defined feature bits leaf enumerating
the CPU's SGX capabilities, e.g. supported SGX instruction sets.
Currently there are four enumerated capabilities:

    - SGX1 instruction set, i.e. "base" SGX
    - SGX2 instruction set for dynamic EPC management
    - ENCLV instruction set for VMM oversubscription of EPC
    - ENCLS-C instruction set for thread safe variants of ENCLS

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-8-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 20 ++++++++++++++++++++
 target/i386/cpu.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 21d2a325ea..2cd1487bae 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -654,6 +654,7 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           /* missing:
           CPUID_XSAVE_XSAVEC, CPUID_XSAVE_XSAVES */
 #define TCG_14_0_ECX_FEATURES 0
+#define TCG_SGX_12_0_EAX_FEATURES 0
 
 FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
     [FEAT_1_EDX] = {
@@ -1182,6 +1183,25 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .tcg_features = TCG_14_0_ECX_FEATURES,
      },
 
+    [FEAT_SGX_12_0_EAX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            "sgx1", "sgx2", NULL, NULL,
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
+            .reg = R_EAX,
+        },
+        .tcg_features = TCG_SGX_12_0_EAX_FEATURES,
+    },
 };
 
 typedef struct FeatureMask {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5f56849d1f..29e6490ed6 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -577,6 +577,7 @@ typedef enum FeatureWord {
     FEAT_VMX_BASIC,
     FEAT_VMX_VMFUNC,
     FEAT_14_0_ECX,
+    FEAT_SGX_12_0_EAX,  /* CPUID[EAX=0x12,ECX=0].EAX (SGX) */
     FEATURE_WORDS,
 } FeatureWord;
 
-- 
2.31.1



