Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8923E4037AC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:17:23 +0200 (CEST)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNudu-0006x3-LY
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRo-0006W0-BY
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRk-0002yb-UD
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z4so2395987wrr.6
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9O/uSfcdC+cHG3lQWgJFiwzz7AV82zYSbtbYbZk849c=;
 b=nMR3blziJ6CiWqtEbLhvW8IzLXrNxjitbuyC8ww7wQZNQ6xN8xOrfsFhLoTmcYCey9
 EjuG4dp2vqpTUwHBWP5YDLKGc7q8NXQC4A/O9RCiLasmtWneaWyf2n7/atGO/3IxkYKM
 RpNMP/WLWj+RPCx0Eww/AebXOcdfCz2ikTVcVq422xYzbpee79TpxpJIjQFb6MO+83GX
 ZhoIuAYF/LpWWWkVI3NjWEW/Fqupwt8RdUzPOZg2HN5NPKgv9JYw19wK+rVBq9sBBS6g
 Rc/Lix0HhAFvp6OHNp+YtndAgSh4NUCComvJej5uV84gc0YrG8fYjf4jRioGGRSh/C2U
 jHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9O/uSfcdC+cHG3lQWgJFiwzz7AV82zYSbtbYbZk849c=;
 b=uCLERiLwgtypPbh+fk9DK9EU3pAyUmJlLUwOvmEpPGnQyRO48XST+sWDV9x4u3Il41
 LDKNb7XhhYggXViypkfiakDaNStTNzGztPfujLEGFYTqEWu8S0WQxMbgMnuLmxmAdPPb
 Mkbrv3W94Q91EHcBx7ZIAs5WkoGZH54k7pg0o99GMkkVM/3XUYaHXIhy5pDBq2j3mrrP
 m8kweQfh6PtpvS90SMajez9c/OdNQ2dI+jvksLfuK7jaiCu4BZGcA12VSWaov0H7PyRU
 IorUaK//3nGs49FtuUCnXU+W+5x1Hr4c+xE1mr7f1RX94XT/vspcemj0jxyghQKtJOOL
 ogMg==
X-Gm-Message-State: AOAM531qoT9yfiSJj5JGgaEluUsN2LNVx6JEvPDtSh0erf2CF2V58CDj
 PCRC9ouLWMoeIAi4p3nE7tc3M0YfKeI=
X-Google-Smtp-Source: ABdhPJxLVbYcJNImx3q97cFgyHe+0iVSzRJFqINSu4xt9gyAz00OucelSFK//mB/9uBxNyWTB2VmiQ==
X-Received: by 2002:a05:6000:160d:: with SMTP id
 u13mr3179003wrb.17.1631095487525; 
 Wed, 08 Sep 2021 03:04:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 16/43] i386: Add SGX CPUID leaf FEAT_SGX_12_0_EBX
Date: Wed,  8 Sep 2021 12:03:59 +0200
Message-Id: <20210908100426.264356-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 959f679077..cf52f70575 100644
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



