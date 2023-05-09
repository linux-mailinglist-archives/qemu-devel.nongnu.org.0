Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B666FC249
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:06:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHj-0005Xs-Bx; Tue, 09 May 2023 05:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHg-0005L1-Ac
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHe-0004zE-GU
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vABqxpGYsTTWZVtBOVdSZcGNrfMPV3ooC0Onx2+aiSs=;
 b=BNYkwxJzRAg6Q6Yjf0KpVfy4IyElDxc+gIPET/eIwYRAAUJB3Xjwk9gd1mbHYQnhHQ+5PU
 +pCniSJXeMizWcw7/DRwHggMXoK8tAPqaWfTkYJQDtTpFQVgc9homoTGdvLlul+LzF0zdH
 AxzMLEBO2EEiUrlyRSP/J9oZjl++AQ0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-kQzBl_eANmGxGA8yg3i2Gg-1; Tue, 09 May 2023 05:05:20 -0400
X-MC-Unique: kQzBl_eANmGxGA8yg3i2Gg-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50bf9e97bdbso6438325a12.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623119; x=1686215119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vABqxpGYsTTWZVtBOVdSZcGNrfMPV3ooC0Onx2+aiSs=;
 b=ZDhmMovg+tGCUEGjbpw67gB5kjUQIlMtejqftrSiOxtzzC/FPhCf6zoUdFwlFlwXPh
 GbpC6vN+CvcgcLUPfJe9P1WNxg7JZGfQPgM5/8Tiv3ihfQmn18yU6mvaqY7KndLi5g+5
 uJ3MHQomQWtXLzpBuigs0ynh9xyQcgWZL30Ul0gFYi+zzWrXDY3cMtv3ZL6/wkgn6MiX
 ItewJVnJwjIsTiGitPANRtQkovptltEXI79mY95AC0u01qAD3w8tMCNliy8dYT4tQ+lG
 WNV99KrEJbUnczZCN0NaKNHXCFH9HtF8owecz5zovQ2SpXPjy+6eJ35uAR6dQddV//4G
 N5gQ==
X-Gm-Message-State: AC+VfDxREqg0AOP+knhSJHo9FUCz8Z8CbNfT854YMbgoqTYwl7rD8jXp
 s3HVpKI6ko7a956/I0yxOJfVkX421DDgReo+NL/f2eNOuGets4QShLhR+wKqgGIM0kLmBmhu0Uf
 +a8kE4WDwx+pMRjrYMtdAZe9IUUteilSIoJoO5VXuotOesWRHaqUuOPNGJCGNU+bGz39YeFaBPR
 s=
X-Received: by 2002:a05:6402:28d:b0:506:fcd5:6159 with SMTP id
 l13-20020a056402028d00b00506fcd56159mr10820271edv.21.1683623119416; 
 Tue, 09 May 2023 02:05:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6je9gcXHKFQCZh5YyQD8hKA1Rb25fYHLcX1c93BYk+hJL2ZxZK4aWbc5P7yitdz6H4knM/Eg==
X-Received: by 2002:a05:6402:28d:b0:506:fcd5:6159 with SMTP id
 l13-20020a056402028d00b00506fcd56159mr10820256edv.21.1683623119096; 
 Tue, 09 May 2023 02:05:19 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a056402100400b0050bc41352d9sm515107edu.46.2023.05.09.02.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Babu Moger <babu.moger@amd.com>, Santosh Shukla <santosh.shukla@amd.com>,
 Kim Phillips <kim.phillips@amd.com>
Subject: [PULL 13/16] target/i386: Add VNMI and automatic IBRS feature bits
Date: Tue,  9 May 2023 11:04:50 +0200
Message-Id: <20230509090453.37884-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Babu Moger <babu.moger@amd.com>

Add the following featute bits.

vnmi: Virtual NMI (VNMI) allows the hypervisor to inject the NMI into the
      guest without using Event Injection mechanism meaning not required to
      track the guest NMI and intercepting the IRET.
      The presence of this feature is indicated via the CPUID function
      0x8000000A_EDX[25].

automatic-ibrs :
      The AMD Zen4 core supports a new feature called Automatic IBRS.
      It is a "set-and-forget" feature that means that, unlike e.g.,
      s/w-toggled SPEC_CTRL.IBRS, h/w manages its IBRS mitigation
      resources automatically across CPL transitions.
      The presence of this feature is indicated via the CPUID function
      0x80000021_EAX[8].

The documention for the features are available in the links below.
a. Processor Programming Reference (PPR) for AMD Family 19h Model 01h,
   Revision B1 Processors
b. AMD64 Architecture Programmer’s Manual Volumes 1–5 Publication No. Revision
   40332 4.05 Date October 2022

Signed-off-by: Santosh Shukla <santosh.shukla@amd.com>
Signed-off-by: Kim Phillips <kim.phillips@amd.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
Link: https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
Link: https://www.amd.com/system/files/TechDocs/40332_4.05.pdf
Message-Id: <20230504205313.225073-7-babu.moger@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 4 ++--
 target/i386/cpu.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3970463114d3..6836d7fd1cb9 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -809,7 +809,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "pfthreshold", "avic", NULL, "v-vmsave-vmload",
             "vgif", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, "vnmi", NULL, NULL,
             "svme-addr-chk", NULL, NULL, NULL,
         },
         .cpuid = { .eax = 0x8000000A, .reg = R_EDX, },
@@ -947,7 +947,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .feat_names = {
             "no-nested-data-bp", NULL, "lfence-always-serializing", NULL,
             NULL, NULL, "null-sel-clr-base", NULL,
-            NULL, NULL, NULL, NULL,
+            "auto-ibrs", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index b8c56936bdd5..8ade71ab555d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -774,6 +774,7 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_SVM_AVIC            (1U << 13)
 #define CPUID_SVM_V_VMSAVE_VMLOAD (1U << 15)
 #define CPUID_SVM_VGIF            (1U << 16)
+#define CPUID_SVM_VNMI            (1U << 25)
 #define CPUID_SVM_SVME_ADDR_CHK   (1U << 28)
 
 /* Support RDFSBASE/RDGSBASE/WRFSBASE/WRGSBASE */
@@ -960,6 +961,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_8000_0021_EAX_LFENCE_ALWAYS_SERIALIZING    (1U << 2)
 /* Null Selector Clears Base */
 #define CPUID_8000_0021_EAX_NULL_SEL_CLR_BASE    (1U << 6)
+/* Automatic IBRS */
+#define CPUID_8000_0021_EAX_AUTO_IBRS   (1U << 8)
 
 #define CPUID_XSAVE_XSAVEOPT   (1U << 0)
 #define CPUID_XSAVE_XSAVEC     (1U << 1)
-- 
2.40.1


