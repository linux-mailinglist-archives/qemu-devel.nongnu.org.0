Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544306FC248
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:06:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHh-0005OI-PA; Tue, 09 May 2023 05:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHe-0005Hb-Nu
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHc-0004xz-TP
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=60z7QDVoGzUjcssJ/mfMWVookWfEKvlV0VDno7yPxD0=;
 b=exYW0D9GMT08Hrgvgyz1HHiqvXVW7cf3kzIcgXAy0QZNmfvuIsK6RsZl1hFL4/DkhEfRd3
 ESw+H+Ne4bZfGp7y2Bde3NVPzMc2eW5Oj9zPi8zyftMN1/nY01tXxZNzo0eLJaPDiY7vaN
 2WvgC8I4hsCXAUMz1XlaoQWXBOdOJj4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-Xd53IMGaPbyO65MH4lNUnQ-1; Tue, 09 May 2023 05:05:19 -0400
X-MC-Unique: Xd53IMGaPbyO65MH4lNUnQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94f7a2b21fdso693671666b.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623117; x=1686215117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=60z7QDVoGzUjcssJ/mfMWVookWfEKvlV0VDno7yPxD0=;
 b=PxpEHt40SrgOlpUlPGVBTzbhVo2IScJmd2hy0r/Ndp9qwYtOx0hdRJri+udMdmvkmZ
 J/353B9bH8d19j7wF1BwaJ/orBwGgMrCWT3jr7BucLpRe/81t42NMXEp2UPXIHOcbQIK
 2Oj4UGXcZX9XoLpQuRD5E6iR4J1GvrBGQaGjGAaUP0cqWe5YNH/33sOfgaGxGPheoQCA
 xwckLAXpzYTH1koD59c6qDA6JBd4EljdgHvKbxo4rG5MB/ri+3G/62vx3GRCXv70yxjE
 mHJhq1+KD2RAvtw2+Hgbm3BvlSwxTnrarv2KOt7v5mAocqU1QYrXF5w08PB5xQ0NeT9n
 BmTA==
X-Gm-Message-State: AC+VfDyghHMUvdv23YlAWO/bep2h4t6lHcOWquIHEIcv/oai6ImKbvnU
 Fn0TQC/OjFCjezhlXhGqx/Hpf6dJMm3obWo3xTug2N6gKy6P33P3vuAnhDT8jt2AUwINisIdjf7
 08se3j6K3a/7EewbxMuGzj2q4IyATulrr11AYaL7A0URebamB/F3mTfEidmgk8eyRBucyhpC5pg
 A=
X-Received: by 2002:a17:907:36c8:b0:961:b589:d07b with SMTP id
 bj8-20020a17090736c800b00961b589d07bmr11015728ejc.46.1683623117727; 
 Tue, 09 May 2023 02:05:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40u9Xxi5y0AXJwvzrxB0B8QKimpODhZHi7vsSzztiqmPTCjTao/JiwDFjElPfN6UaYOgTrzg==
X-Received: by 2002:a17:907:36c8:b0:961:b589:d07b with SMTP id
 bj8-20020a17090736c800b00961b589d07bmr11015710ejc.46.1683623117439; 
 Tue, 09 May 2023 02:05:17 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1709065da500b0096616adc0d5sm1064303ejv.104.2023.05.09.02.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Babu Moger <babu.moger@amd.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 12/16] target/i386: Add missing feature bits in EPYC-Milan model
Date: Tue,  9 May 2023 11:04:49 +0200
Message-Id: <20230509090453.37884-13-pbonzini@redhat.com>
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

Add the following feature bits for EPYC-Milan model and bump the version.
vaes            : Vector VAES(ENC|DEC), VAES(ENC|DEC)LAST instruction support
vpclmulqdq	: Vector VPCLMULQDQ instruction support
stibp-always-on : Single Thread Indirect Branch Prediction Mode has enhanced
                  performance and may be left Always on
amd-psfd	: Predictive Store Forward Disable
no-nested-data-bp         : Processor ignores nested data breakpoints
lfence-always-serializing : LFENCE instruction is always serializing
null-sel-clr-base         : Null Selector Clears Base. When this bit is
                            set, a null segment load clears the segment base

These new features will be added in EPYC-Milan-v2. The "-cpu help" output
after the change will be.

    x86 EPYC-Milan             (alias configured by machine type)
    x86 EPYC-Milan-v1          AMD EPYC-Milan Processor
    x86 EPYC-Milan-v2          AMD EPYC-Milan Processor

The documentation for the features are available in the links below.
a. Processor Programming Reference (PPR) for AMD Family 19h Model 01h,
   Revision B1 Processors
b. SECURITY ANALYSIS OF AMD PREDICTIVE STORE FORWARDING
c. AMD64 Architecture Programmer’s Manual Volumes 1–5 Publication No. Revision
    40332 4.05 Date October 2022

Signed-off-by: Babu Moger <babu.moger@amd.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Link: https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
Link: https://www.amd.com/system/files/documents/security-analysis-predictive-store-forwarding.pdf
Link: https://www.amd.com/system/files/TechDocs/40332_4.05.pdf
Message-Id: <20230504205313.225073-6-babu.moger@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fd3909b5a357..3970463114d3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1945,6 +1945,56 @@ static const CPUCaches epyc_milan_cache_info = {
     },
 };
 
+static const CPUCaches epyc_milan_v2_cache_info = {
+    .l1d_cache = &(CPUCacheInfo) {
+        .type = DATA_CACHE,
+        .level = 1,
+        .size = 32 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 64,
+        .lines_per_tag = 1,
+        .self_init = 1,
+        .no_invd_sharing = true,
+    },
+    .l1i_cache = &(CPUCacheInfo) {
+        .type = INSTRUCTION_CACHE,
+        .level = 1,
+        .size = 32 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 64,
+        .lines_per_tag = 1,
+        .self_init = 1,
+        .no_invd_sharing = true,
+    },
+    .l2_cache = &(CPUCacheInfo) {
+        .type = UNIFIED_CACHE,
+        .level = 2,
+        .size = 512 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 1024,
+        .lines_per_tag = 1,
+    },
+    .l3_cache = &(CPUCacheInfo) {
+        .type = UNIFIED_CACHE,
+        .level = 3,
+        .size = 32 * MiB,
+        .line_size = 64,
+        .associativity = 16,
+        .partitions = 1,
+        .sets = 32768,
+        .lines_per_tag = 1,
+        .self_init = true,
+        .inclusive = true,
+        .complex_indexing = false,
+    },
+};
+
 /* The following VMX features are not supported by KVM and are left out in the
  * CPU definitions:
  *
@@ -4423,6 +4473,26 @@ static const X86CPUDefinition builtin_x86_defs[] = {
         .xlevel = 0x8000001E,
         .model_id = "AMD EPYC-Milan Processor",
         .cache_info = &epyc_milan_cache_info,
+        .versions = (X86CPUVersionDefinition[]) {
+            { .version = 1 },
+            {
+                .version = 2,
+                .props = (PropValue[]) {
+                    { "model-id",
+                      "AMD EPYC-Milan-v2 Processor" },
+                    { "vaes", "on" },
+                    { "vpclmulqdq", "on" },
+                    { "stibp-always-on", "on" },
+                    { "amd-psfd", "on" },
+                    { "no-nested-data-bp", "on" },
+                    { "lfence-always-serializing", "on" },
+                    { "null-sel-clr-base", "on" },
+                    { /* end of list */ }
+                },
+                .cache_info = &epyc_milan_v2_cache_info
+            },
+            { /* end of list */ }
+        }
     },
 };
 
-- 
2.40.1


