Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238E63702AA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:10:52 +0200 (CEST)
Received: from localhost ([::1]:40218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcaPT-0002wa-5j
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0004Bs-4r
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:01 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZla-0007fj-LM
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:29:56 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so2349635pjj.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L9CT6IY88WuROz45EJLGs6Vb8eBbIgK6UvA8l1eIoaI=;
 b=vnoBMCqefZNZ9VpYg2h5lrMtMFDTBEPrXU2HYwLeYcv/AdItpb+tk2nM1LwFQSeZAs
 6vMGgt0Gf6Gq+XbigpQawro75fI+76FmpP1h2Fcj85SgyYJ4l26tiKrYgzc0FGG7ztHm
 +xAkb8ELirzPsTCcLJ+LnmDWZ1wEOiX/mVrWruOcVKNC/S3kXDx+5kGvipcBt62cQPrQ
 8FYvfNnUgeG6SZXu7X8neWu+KIb5rEzhwoiFRKTrSNmjnOezA6l9GHqggPADJcQKccrB
 4frkNT1JI8EAgQloZnJIC7RXsO/lqIO3+u2TPb9oRFugBEKYx99PNgT8wt1jOe2woRBn
 ElRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L9CT6IY88WuROz45EJLGs6Vb8eBbIgK6UvA8l1eIoaI=;
 b=jma3oI4dqJIR6eP9BxL+2PUDiNBh8xE+qvzJF6mux8Se7p72tLQSHKVGQ+AnVClxK5
 MYu/P74llb7aC3Ie7JRBbtTq4ax1dbjJaRAKJou4QWbU5TGOuypWVgpJM8W3lnMGVjWD
 JAA93nddZawlsdWdzIJy3q9k+V2cedWsDhNksL6lV+m3ofleynVbzQr7WiAXJWM5GLZt
 wcsjh/7fPLFZgi0Qv7PRjYs2c18Ujcj0k8d0/PE01O13xqiT/9zh5wjEO68WfYS2yoUQ
 fo+2UGaY/ehQyQCfmaIQ9+OvmTEOdrNeroVGG61lvjy/0ozkD3rHDe0nYnKN6bHcndJh
 dc5g==
X-Gm-Message-State: AOAM531DGdoXUGKdxzsxYHtIf0MGcLPmy8bzRIi/QiUPfUzi4ECvGKii
 vfcUvDy5HNcFheQZNpmX9Zr8SjYg9UtGQw==
X-Google-Smtp-Source: ABdhPJwAT3Pr1erlImed+FjQ860+koJrRJmW+QcmLdzfj8YJceCfyHnmZv2Fb8Uwi7MWX1qTVu1xlA==
X-Received: by 2002:a17:90a:d184:: with SMTP id
 fu4mr16434352pjb.79.1619814576946; 
 Fri, 30 Apr 2021 13:29:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 41/82] target/arm: Implement SVE2 RSUBHNB, RSUBHNT
Date: Fri, 30 Apr 2021 13:25:29 -0700
Message-Id: <20210430202610.1136687-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

This completes the section 'SVE2 integer add/subtract narrow high part'

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-5-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix round bit type (laurent desnogues)
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 10 ++++++++++
 target/arm/translate-sve.c |  2 ++
 4 files changed, 22 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3642e7c820..98e6b57e38 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2533,6 +2533,14 @@ DEF_HELPER_FLAGS_4(sve2_subhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_subhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_subhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_rsubhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_rsubhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c68bfcf6ed..388bf92acf 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1328,6 +1328,8 @@ RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
 RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
 SUBHNB          01000101 .. 1 ..... 011 100 ..... .....  @rd_rn_rm
 SUBHNT          01000101 .. 1 ..... 011 101 ..... .....  @rd_rn_rm
+RSUBHNB         01000101 .. 1 ..... 011 110 ..... .....  @rd_rn_rm
+RSUBHNT         01000101 .. 1 ..... 011 111 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 0df70effe3..12acc4fb0b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2137,6 +2137,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
 #define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
 #define DO_SUBHN(N, M, SH)  ((N - M) >> SH)
+#define DO_RSUBHN(N, M, SH) ((N - M + ((__typeof(N))1 << (SH - 1))) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2162,6 +2163,15 @@ DO_BINOPNT(sve2_subhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_SUBHN)
 DO_BINOPNT(sve2_subhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_SUBHN)
 DO_BINOPNT(sve2_subhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_SUBHN)
 
+DO_BINOPNB(sve2_rsubhnb_h, uint16_t, uint8_t, 8, DO_RSUBHN)
+DO_BINOPNB(sve2_rsubhnb_s, uint32_t, uint16_t, 16, DO_RSUBHN)
+DO_BINOPNB(sve2_rsubhnb_d, uint64_t, uint32_t, 32, DO_RSUBHN)
+
+DO_BINOPNT(sve2_rsubhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RSUBHN)
+DO_BINOPNT(sve2_rsubhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_RSUBHN)
+DO_BINOPNT(sve2_rsubhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_RSUBHN)
+
+#undef DO_RSUBHN
 #undef DO_SUBHN
 #undef DO_RADDHN
 #undef DO_ADDHN
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 55303ba41d..49d7a45a50 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7479,6 +7479,8 @@ DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
 DO_SVE2_ZZZ_NARROW(SUBHNB, subhnb)
 DO_SVE2_ZZZ_NARROW(SUBHNT, subhnt)
+DO_SVE2_ZZZ_NARROW(RSUBHNB, rsubhnb)
+DO_SVE2_ZZZ_NARROW(RSUBHNT, rsubhnt)
 
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
-- 
2.25.1


