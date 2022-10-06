Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36B85F6005
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:22:06 +0200 (CEST)
Received: from localhost ([::1]:34558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIOb-0000ek-US
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoZ-0004Mo-Ug
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:52 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoV-0003zK-Ih
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:50 -0400
Received: by mail-pj1-x1031.google.com with SMTP id 70so650973pjo.4
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ItYGoEM5/8BiRF2Ujhf2XO86m4pNgvcvreca63BmeJc=;
 b=adhuwO5B5B9q4XW1WRSMMJV/8wheHr2hEIWZnko1NnzcPeqcBrCoXj8rcvJgvnEF+M
 Hl7unLtP83OqCs0nKFGZDxekSMAWOOGOcXYhEHiYKwlwsbcdTwSg5etwkoeCHN+0KTv4
 nKxkKmj/lKA7l3Vb1ZoSRv4IMSrAa81MnNx14qVzQWIn6HESrAstk0sIWejX54wgGUpk
 JTg3J95AeGj+QIfcec07SDn0uiEL7HuwPHC+Lp8kopsbHCSNscvhQThWCztkAJiscBVT
 jGmcESTEzXtd3JrcFM2h5V9qrmvBJio9lhZghmumY2zgGQPJn31wJ4zP+/zcp24Ivdmx
 i27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ItYGoEM5/8BiRF2Ujhf2XO86m4pNgvcvreca63BmeJc=;
 b=BDTbALBfzqs6BCzHWhvrlrKGWROyc4nT+wP22vds4x57ToeV95b56lKpP/rcqNgC48
 w6I1SOk8cfViU+lRttlbEnxlX9VY4lyJ3eFgAkFMIcwt93SzSKVRPikmJAaESAl5Wdp1
 w5cEeZHo5Z6FWX3CSkUiHwz6hjaUvle2YpPW3iGkbvnW10vIHeU6/Bd3XN5gBKPmJaDL
 154UMr9swspiirpgHAlxOCSaHibgFUDqU9AzpeqyWwWaKpaCRirhatQMXkHH8SL99LEz
 PCY38HuapvPa2s2JDn1tNgDwKwhauTn2GlsamE8eNB32AsT/uIIqW5fmJH5+ETpQLg4F
 9faA==
X-Gm-Message-State: ACrzQf2aFfuxgvf4a+OJYCruaoUI3S51h4qEyQf3hwIPm+9m+2tU2x7m
 xi3RmBZmNAz8dZ2fsYsdSFXq9D0pgWXxvw==
X-Google-Smtp-Source: AMsMyM5U2NtmI10w1MWjRvTj19pwoNqvpmqGKF2kwFnhgRH3GskYWMAqjewBJzBnl1zYiqnx8lL2zA==
X-Received: by 2002:a17:90a:e00a:b0:209:1545:74a7 with SMTP id
 u10-20020a17090ae00a00b00209154574a7mr3107522pjy.72.1665027884963; 
 Wed, 05 Oct 2022 20:44:44 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 23/26] tcg: Pass TCGTempKind to tcg_temp_new_internal
Date: Wed,  5 Oct 2022 20:44:18 -0700
Message-Id: <20221006034421.1179141-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 14 +++++++-------
 tcg/tcg.c         | 20 +++++++++++++++-----
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index d84bae6e3f..e01a47ec20 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -846,7 +846,7 @@ void tcg_set_frame(TCGContext *s, TCGReg reg, intptr_t start, intptr_t size);
 
 TCGTemp *tcg_global_mem_new_internal(TCGType, TCGv_ptr,
                                      intptr_t, const char *);
-TCGTemp *tcg_temp_new_internal(TCGType, bool);
+TCGTemp *tcg_temp_new_internal(TCGType, TCGTempKind kind);
 void tcg_temp_free_internal(TCGTemp *);
 TCGv_vec tcg_temp_new_vec(TCGType type);
 TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match);
@@ -880,13 +880,13 @@ static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
 
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_NORMAL);
     return temp_tcgv_i32(t);
 }
 
 static inline TCGv_i32 tcg_temp_local_new_i32(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_LOCAL);
     return temp_tcgv_i32(t);
 }
 
@@ -899,13 +899,13 @@ static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
 
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_NORMAL);
     return temp_tcgv_i64(t);
 }
 
 static inline TCGv_i64 tcg_temp_local_new_i64(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_LOCAL);
     return temp_tcgv_i64(t);
 }
 
@@ -918,13 +918,13 @@ static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
 
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_NORMAL);
     return temp_tcgv_ptr(t);
 }
 
 static inline TCGv_ptr tcg_temp_local_new_ptr(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_LOCAL);
     return temp_tcgv_ptr(t);
 }
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 612a12f58f..acdbd5a9a2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -942,14 +942,24 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
     return ts;
 }
 
-TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
+TCGTemp *tcg_temp_new_internal(TCGType type, TCGTempKind kind)
 {
     TCGContext *s = tcg_ctx;
-    TCGTempKind kind = temp_local ? TEMP_LOCAL : TEMP_NORMAL;
     TCGTemp *ts;
     int idx, k;
 
-    k = type + (temp_local ? TCG_TYPE_COUNT : 0);
+    switch (kind) {
+    case TEMP_NORMAL:
+        k = 0;
+        break;
+    case TEMP_LOCAL:
+        k = TCG_TYPE_COUNT;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    k += type;
+
     idx = find_first_bit(s->free_temps[k].l, TCG_MAX_TEMPS);
     if (idx < TCG_MAX_TEMPS) {
         /* There is already an available temp with the right type.  */
@@ -1008,7 +1018,7 @@ TCGv_vec tcg_temp_new_vec(TCGType type)
     }
 #endif
 
-    t = tcg_temp_new_internal(type, 0);
+    t = tcg_temp_new_internal(type, TEMP_NORMAL);
     return temp_tcgv_vec(t);
 }
 
@@ -1019,7 +1029,7 @@ TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match)
 
     tcg_debug_assert(t->temp_allocated != 0);
 
-    t = tcg_temp_new_internal(t->base_type, 0);
+    t = tcg_temp_new_internal(t->base_type, TEMP_NORMAL);
     return temp_tcgv_vec(t);
 }
 
-- 
2.34.1


