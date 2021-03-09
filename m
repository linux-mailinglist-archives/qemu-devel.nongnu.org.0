Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F6B332E8E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:53:06 +0100 (CET)
Received: from localhost ([::1]:56326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhTd-0006FQ-Pj
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf88-0000W6-NE
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:44 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:40426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7r-0002pi-9i
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:44 -0500
Received: by mail-ot1-x336.google.com with SMTP id b8so13349384oti.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ScXgfjow8dkwDZFECjUC9yhYbtEGzBMTrAi5glL4G8=;
 b=F8Mkuk7H34IIvSWZDvKeivpUmA0wlmpMkB0iqM1VtDP53QBS4z37R4uFHSueCKIYRL
 lXg1YNE30t5yFDvEACjXdYgxj6O0eJQ2PwZukHi+ngu1zWXrgsXHDm9zjqs47XWlSC6h
 7iISZQuwtxSj10zDfkH919Dozu7vk1Y2AYjvLE7xZ3zMYVE5AiM9dQJKHrG6kdB7aCOE
 Fpr1sch1WbCXjogH4Jq+DYb956faPY1VEH6On7wnLiQPbdg6a15PDdr7H98cPI8jrIU8
 q39MpWZRSxnDfkUtJpG/s0lIaEkqXv0H7EorI8XC+Z7NXd1pipW1e6dCJiA2PrAvJNaV
 J1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ScXgfjow8dkwDZFECjUC9yhYbtEGzBMTrAi5glL4G8=;
 b=Z74SJRGLt2F88uFeXfZoaoUsAwnArTGKb9v5VTKbhCwAddlaQ8hrv0sBtNq0GK5VJ3
 ce+zxH24AVSwPRH5z/H/OMm9AOSnKxRJNMYjVMNkDxG/Xp+uvZZeUkQnTBwgVwI6JVh2
 KCKB4MD30SZ5qI7EDU6ipTSRRtEbGiY3vm5U4G//e5/V8cp5Tzh8TXDCu7mHvKnqb/x+
 iiQFo+bgfOfjbsud0tpOikFcj68W2kiQuAXVIn+SGhuKX1ut/hbLAjPHaQIPqXpamlKg
 esqg0knWGfDyVH/Y2aDwtwOQfc/OafBKCvEVvDd2C4NPwW7HLooG/aiJzp8kdFYTHF9V
 h/Fw==
X-Gm-Message-State: AOAM532ZiacsjsTXHJkVQZEaUWhlcjhvpMcMquXv7aPbGcAkiWQfEndI
 qKgQy6uEVIlN8HmvluEdkLeEeCdgFrHf2Kax
X-Google-Smtp-Source: ABdhPJz59nGT9XUzdZOOFDdc4kzpG8led2QlRUhcB+X2iidqWhz6DalMNtNEY+nyjd3imbaiIkOHNQ==
X-Received: by 2002:a05:6830:24a1:: with SMTP id
 v1mr3877097ots.119.1615306941726; 
 Tue, 09 Mar 2021 08:22:21 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 60/78] target/arm: Implement SVE2 multiply-add long
 (indexed)
Date: Tue,  9 Mar 2021 08:20:23 -0800
Message-Id: <20210309162041.23124-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 target/arm/helper-sve.h    | 17 +++++++++++++++++
 target/arm/sve.decode      | 18 ++++++++++++++++++
 target/arm/sve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-sve.c | 20 ++++++++++++++++++++
 4 files changed, 71 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 548dedf24c..5e3a2922c8 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2698,3 +2698,20 @@ DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_smlal_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlal_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlsl_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlsl_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlal_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlal_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlsl_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlsl_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 31a3d909f3..c77adf8ca6 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -825,6 +825,24 @@ SQDMLSLB_zzxw_d 01000100 .. 1 ..... 0011.0 ..... .....          @rrxw_d
 SQDMLSLT_zzxw_s 01000100 .. 1 ..... 0011.1 ..... .....          @rrxw_s
 SQDMLSLT_zzxw_d 01000100 .. 1 ..... 0011.1 ..... .....          @rrxw_d
 
+# SVE2 multiply-add long (indexed)
+SMLALB_zzxw_s   01000100 .. 1 ..... 1000.0 ..... .....          @rrxw_s
+SMLALB_zzxw_d   01000100 .. 1 ..... 1000.0 ..... .....          @rrxw_d
+SMLALT_zzxw_s   01000100 .. 1 ..... 1000.1 ..... .....          @rrxw_s
+SMLALT_zzxw_d   01000100 .. 1 ..... 1000.1 ..... .....          @rrxw_d
+UMLALB_zzxw_s   01000100 .. 1 ..... 1001.0 ..... .....          @rrxw_s
+UMLALB_zzxw_d   01000100 .. 1 ..... 1001.0 ..... .....          @rrxw_d
+UMLALT_zzxw_s   01000100 .. 1 ..... 1001.1 ..... .....          @rrxw_s
+UMLALT_zzxw_d   01000100 .. 1 ..... 1001.1 ..... .....          @rrxw_d
+SMLSLB_zzxw_s   01000100 .. 1 ..... 1010.0 ..... .....          @rrxw_s
+SMLSLB_zzxw_d   01000100 .. 1 ..... 1010.0 ..... .....          @rrxw_d
+SMLSLT_zzxw_s   01000100 .. 1 ..... 1010.1 ..... .....          @rrxw_s
+SMLSLT_zzxw_d   01000100 .. 1 ..... 1010.1 ..... .....          @rrxw_d
+UMLSLB_zzxw_s   01000100 .. 1 ..... 1011.0 ..... .....          @rrxw_s
+UMLSLB_zzxw_d   01000100 .. 1 ..... 1011.0 ..... .....          @rrxw_d
+UMLSLT_zzxw_s   01000100 .. 1 ..... 1011.1 ..... .....          @rrxw_s
+UMLSLT_zzxw_d   01000100 .. 1 ..... 1011.1 ..... .....          @rrxw_d
+
 # SVE2 integer multiply long (indexed)
 SMULLB_zzx_s    01000100 .. 1 ..... 1100.0 ..... .....          @rrxl_s
 SMULLB_zzx_d    01000100 .. 1 ..... 1100.0 ..... .....          @rrxl_d
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 95bda0ae38..c64321368f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1546,6 +1546,20 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
     }                                                                     \
 }
 
+#define DO_MLA(N, M, A)  (A + N * M)
+
+DO_ZZXW(sve2_smlal_idx_s, int32_t, int16_t, H1_4, H1_2, DO_MLA)
+DO_ZZXW(sve2_smlal_idx_d, int64_t, int32_t,     , H1_4, DO_MLA)
+DO_ZZXW(sve2_umlal_idx_s, uint32_t, uint16_t, H1_4, H1_2, DO_MLA)
+DO_ZZXW(sve2_umlal_idx_d, uint64_t, uint32_t,     , H1_4, DO_MLA)
+
+#define DO_MLS(N, M, A)  (A - N * M)
+
+DO_ZZXW(sve2_smlsl_idx_s, int32_t, int16_t, H1_4, H1_2, DO_MLS)
+DO_ZZXW(sve2_smlsl_idx_d, int64_t, int32_t,     , H1_4, DO_MLS)
+DO_ZZXW(sve2_umlsl_idx_s, uint32_t, uint16_t, H1_4, H1_2, DO_MLS)
+DO_ZZXW(sve2_umlsl_idx_d, uint64_t, uint32_t,     , H1_4, DO_MLS)
+
 #define DO_SQDMLAL_S(N, M, A)  DO_SQADD_S(A, do_sqdmull_s(N, M))
 #define DO_SQDMLAL_D(N, M, A)  do_sqadd_d(A, do_sqdmull_d(N, M))
 
@@ -1558,6 +1572,8 @@ DO_ZZXW(sve2_sqdmlal_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLAL_D)
 DO_ZZXW(sve2_sqdmlsl_idx_s, int32_t, int16_t, H1_4, H1_2, DO_SQDMLSL_S)
 DO_ZZXW(sve2_sqdmlsl_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLSL_D)
 
+#undef DO_MLA
+#undef DO_MLS
 #undef DO_ZZXW
 
 #define DO_ZZX(NAME, TYPEW, TYPEN, HW, HN, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a3e7d4f38f..6a6698bfe9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3940,6 +3940,26 @@ DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, false)
 DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, true)
 DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, true)
 
+DO_SVE2_RRXR_TB(trans_SMLALB_zzxw_s, gen_helper_sve2_smlal_idx_s, false)
+DO_SVE2_RRXR_TB(trans_SMLALB_zzxw_d, gen_helper_sve2_smlal_idx_d, false)
+DO_SVE2_RRXR_TB(trans_SMLALT_zzxw_s, gen_helper_sve2_smlal_idx_s, true)
+DO_SVE2_RRXR_TB(trans_SMLALT_zzxw_d, gen_helper_sve2_smlal_idx_d, true)
+
+DO_SVE2_RRXR_TB(trans_UMLALB_zzxw_s, gen_helper_sve2_umlal_idx_s, false)
+DO_SVE2_RRXR_TB(trans_UMLALB_zzxw_d, gen_helper_sve2_umlal_idx_d, false)
+DO_SVE2_RRXR_TB(trans_UMLALT_zzxw_s, gen_helper_sve2_umlal_idx_s, true)
+DO_SVE2_RRXR_TB(trans_UMLALT_zzxw_d, gen_helper_sve2_umlal_idx_d, true)
+
+DO_SVE2_RRXR_TB(trans_SMLSLB_zzxw_s, gen_helper_sve2_smlsl_idx_s, false)
+DO_SVE2_RRXR_TB(trans_SMLSLB_zzxw_d, gen_helper_sve2_smlsl_idx_d, false)
+DO_SVE2_RRXR_TB(trans_SMLSLT_zzxw_s, gen_helper_sve2_smlsl_idx_s, true)
+DO_SVE2_RRXR_TB(trans_SMLSLT_zzxw_d, gen_helper_sve2_smlsl_idx_d, true)
+
+DO_SVE2_RRXR_TB(trans_UMLSLB_zzxw_s, gen_helper_sve2_umlsl_idx_s, false)
+DO_SVE2_RRXR_TB(trans_UMLSLB_zzxw_d, gen_helper_sve2_umlsl_idx_d, false)
+DO_SVE2_RRXR_TB(trans_UMLSLT_zzxw_s, gen_helper_sve2_umlsl_idx_s, true)
+DO_SVE2_RRXR_TB(trans_UMLSLT_zzxw_d, gen_helper_sve2_umlsl_idx_d, true)
+
 #undef DO_SVE2_RRXR_TB
 
 /*
-- 
2.25.1


