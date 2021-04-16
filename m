Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D98362A6A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:37:24 +0200 (CEST)
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXW9T-0004us-BD
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVd5-0005ZG-FI
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:55 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVd3-0001bD-GJ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:55 -0400
Received: by mail-pl1-x62c.google.com with SMTP id t22so14310420ply.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ieCAX8JfYanxGz+tnZF3xTMiEcjdmHvb76wqgRW4ePI=;
 b=xdZMRusX1PtjF6oKymwNVTB257At55rxFGyN13xcQ69I1W36FiptLUZbYCJK05R+gA
 x8YIqmX9rNbPsugHAdnu2LzHkghHh0wtFWUsof3DXZ6/29tXzG/5ii7mQ7gtFfYwtO+K
 mVnCC1/+pxbY5j9XCnttvMVv9IZHbGFJ90iK1zE/4ivvrB9v7V9/qB0r59LOZoxde0ki
 6/GgK2Snv8NKDlirckCPU4B9mv9zkxhod3HDcDmdG0+tYQSsIQWgg4a7HiJh+2Yfx5Mg
 dfWv5acGMpJuB7zv+dsat5o99O0r/HgolQHn4RdJ5N7Geso/b3UWGMe8BK+imubGrOay
 sr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ieCAX8JfYanxGz+tnZF3xTMiEcjdmHvb76wqgRW4ePI=;
 b=YugrCKYxubP8ZkY9nkYb7f33Yz47JGxghhBC/QhlAbiXDuujP8HijSIaM7k1z4vynd
 Qqwz1GzUYLoupX00yyWhyJw7tT08tfRcqAxftfkRwBq0aw8bzfdYtfBHiG1E3BgZwrPu
 uT3hBtJw6wOrWc1Vo8j6h5gJM73lu2COEh5o5PD+I036jMxrYnL74wkojrqSruW8FURJ
 mWY9vjNCAtEDtwop5oo6kT/O+5QblXMaMVs+zOlDd9QZAGbRrpxfojaelp/ACahR2w4I
 6mqVaFu1SsWjn2quk2fnjFUiLANkCVg4ri+uyOzdeEgmZcraoZuwmqunJCLS/XictlVP
 a46g==
X-Gm-Message-State: AOAM531vXeOVDd2WxbtBbdQKsij/g5pQnrxS7ZrfT23oU9nXub8SCCKq
 0FIV4hyBlDf9HhfP/nSnj488Z7IJjVkhfQ==
X-Google-Smtp-Source: ABdhPJyOdlTH/lT+AsuKiSuJthC1u+P4DBc31pUqVf29/kJUnn8vFboXUI87NJ7Tdh9sqOHgI6ZVaw==
X-Received: by 2002:a17:902:d4c2:b029:ea:deb1:dfd5 with SMTP id
 o2-20020a170902d4c2b02900eadeb1dfd5mr11429096plg.79.1618607032221; 
 Fri, 16 Apr 2021 14:03:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 40/81] target/arm: Implement SVE2 SUBHNB, SUBHNT
Date: Fri, 16 Apr 2021 14:01:59 -0700
Message-Id: <20210416210240.1591291-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-4-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 10 ++++++++++
 target/arm/translate-sve.c |  3 +++
 4 files changed, 23 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 8d95c87694..3642e7c820 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2525,6 +2525,14 @@ DEF_HELPER_FLAGS_4(sve2_raddhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_raddhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_raddhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_subhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_subhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index dfcfab4bc0..c68bfcf6ed 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1326,6 +1326,8 @@ ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
 ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
 RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
 RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
+SUBHNB          01000101 .. 1 ..... 011 100 ..... .....  @rd_rn_rm
+SUBHNT          01000101 .. 1 ..... 011 101 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index e6f6e3d5fa..0df70effe3 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2136,6 +2136,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
 #define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
+#define DO_SUBHN(N, M, SH)  ((N - M) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2153,6 +2154,15 @@ DO_BINOPNT(sve2_raddhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RADDHN)
 DO_BINOPNT(sve2_raddhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_RADDHN)
 DO_BINOPNT(sve2_raddhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_RADDHN)
 
+DO_BINOPNB(sve2_subhnb_h, uint16_t, uint8_t, 8, DO_SUBHN)
+DO_BINOPNB(sve2_subhnb_s, uint32_t, uint16_t, 16, DO_SUBHN)
+DO_BINOPNB(sve2_subhnb_d, uint64_t, uint32_t, 32, DO_SUBHN)
+
+DO_BINOPNT(sve2_subhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_SUBHN)
+DO_BINOPNT(sve2_subhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_SUBHN)
+DO_BINOPNT(sve2_subhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_SUBHN)
+
+#undef DO_SUBHN
 #undef DO_RADDHN
 #undef DO_ADDHN
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index af0d0ab279..55303ba41d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7477,6 +7477,9 @@ DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
 DO_SVE2_ZZZ_NARROW(RADDHNB, raddhnb)
 DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
+DO_SVE2_ZZZ_NARROW(SUBHNB, subhnb)
+DO_SVE2_ZZZ_NARROW(SUBHNT, subhnt)
+
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
 {
-- 
2.25.1


