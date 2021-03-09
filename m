Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92C332E3A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:25:35 +0100 (CET)
Received: from localhost ([::1]:52636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJh30-0004UT-DV
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7t-0000Pu-HX
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:31 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:46164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7g-0002nm-1a
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:25 -0500
Received: by mail-ot1-x32b.google.com with SMTP id r24so6273810otq.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0olgZkdMsWEvekxSRg+Mk6d/nWiC65iXDYtyv4A1kpY=;
 b=mKNJl1GUCbXJOkcwk5bvuCPDXnf4TqSJf/thUR3zitcEI2Sttr80kgloiqe79QR6Jg
 ajhUAZpvcAM57d/qdVQHbjNARH+1u9j89T59tdYQEKwzZSq9+LRriC8Gblzp/9RFAcp+
 m6k+2kU/cr+HV2XISkwWRIau2keuqVV5F5vWhwplASKARLp9xhIRs0DmiZP7bljBOHIF
 Ivk/OZ6ILbsI5cbi04Ya+o/DD5hf+Q4ql4RHSlsGddA4keqgXlAwg63fQMw9f+6yxHPW
 nwL/zUmyVpRSQpHXlfh8fsvEmUgDF0cgonEC639MKWhJ8exCaF+PoB0j45CEmlQeBq8P
 esyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0olgZkdMsWEvekxSRg+Mk6d/nWiC65iXDYtyv4A1kpY=;
 b=NiOs+UTGDkw5QpZKcBv4t0j3v0guSvm4VSwAJG8ucNE1RPBCRCAtlp4/JxeOIJcIWh
 t+6muKD6N3TTRcz5wTAYtKYTp57qjMbZETXQRNR4jQPPnCeXJMYoIlRQWkCM8QJWP5ZE
 8nPUPvV2l3EPl+3ONdpE6CxNpkpR9hiEg7nld80TeElOCs+o9l0v1fUrya2tr54kUKvx
 DeMDrfb1Fu6ORswuK05GGXQuSF7j0O0mbL1544oNx9bRjppO77n4BkvghHXenLKQLyn2
 vMRz7j9mCSKJ2eYuehsNl2NDV3XNjcxIwrC9nHv5a0wAV3hmH/WVw4OOQxuXns24g5Jz
 pNig==
X-Gm-Message-State: AOAM531sIBcJO3YtaQlzB1Vq/Sh32Q0HG+QWiv+MkP2q9eDMrJyYP5cP
 NYesk5wFT2dAspAhtGao8HqmnvObSPLV9vie
X-Google-Smtp-Source: ABdhPJxv5Y2V5HSLQhMa2ELdPlNRuug9RxOkIebYHP3zBVshfN+EnVD4++3KlZEGCYE+G71xM8Ojhg==
X-Received: by 2002:a9d:4b83:: with SMTP id k3mr23919051otf.21.1615306934421; 
 Tue, 09 Mar 2021 08:22:14 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 53/78] target/arm: Implement SVE2 integer multiply-add
 (indexed)
Date: Tue,  9 Mar 2021 08:20:16 -0800
Message-Id: <20210309162041.23124-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 23 +++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5d20392887..8d761edb74 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -785,6 +785,14 @@ SDOT_zzxw_d     01000100 .. 1 ..... 000000 ..... .....          @rrxr_d
 UDOT_zzxw_s     01000100 .. 1 ..... 000001 ..... .....          @rrxr_s
 UDOT_zzxw_d     01000100 .. 1 ..... 000001 ..... .....          @rrxr_d
 
+# SVE2 integer multiply-add (indexed)
+MLA_zzxz_h      01000100 .. 1 ..... 000010 ..... .....          @rrxr_h
+MLA_zzxz_s      01000100 .. 1 ..... 000010 ..... .....          @rrxr_s
+MLA_zzxz_d      01000100 .. 1 ..... 000010 ..... .....          @rrxr_d
+MLS_zzxz_h      01000100 .. 1 ..... 000011 ..... .....          @rrxr_h
+MLS_zzxz_s      01000100 .. 1 ..... 000011 ..... .....          @rrxr_s
+MLS_zzxz_d      01000100 .. 1 ..... 000011 ..... .....          @rrxr_d
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 .. 1 ..... 111110 ..... .....          @rrx_h
 MUL_zzx_s       01000100 .. 1 ..... 111110 ..... .....          @rrx_s
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ee2ef91355..bee3e5a235 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3866,6 +3866,29 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+static bool do_sve2_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
+                             gen_helper_gvec_4 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zzxz_ool(s, a, fn);
+}
+
+#define DO_SVE2_RRXR(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_sve2_zzxz_ool(s, a, FUNC); }
+
+DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
+DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
+DO_SVE2_RRXR(trans_MLA_zzxz_d, gen_helper_gvec_mla_idx_d)
+
+DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
+DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
+DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
+
+#undef DO_SVE2_RRXR
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.25.1


