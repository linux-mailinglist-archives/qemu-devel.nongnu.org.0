Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1853F5AE6A3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:32:58 +0200 (CEST)
Received: from localhost ([::1]:33776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWp7-0004ax-3R
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVf7-0003sx-8j
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:33 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeq-0005Eb-Ch
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:32 -0400
Received: by mail-wr1-x42a.google.com with SMTP id k9so14727618wri.0
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=81l+dTPIf/D25VI4PJYrcgpxjDCwZBn7L7Zo7+FYLBs=;
 b=OyM4qdYECP/aXEXqaOytokFkM9y8JSLitAUZNiK2zPSTfw0rB3bB3uk9sdVHlyEncf
 eVT2kGpy6nxwtc+qwhYVEzMwcTfgyuXYdWOde4NoT135Dd/PfHrBfJaKPhtJib9AgZ43
 KDoX3EygDBwM/cHxKyPeY+3U8c9gc90j9jS2MJAR1QmJI6+4ZMBrdJl05VUP1tfgqv9/
 YaepLY+UpmmAR4Xxvx3ItldMTvZ6O27M3KhovoELg1I+6M63BgS9lE0PWqqLIxHTrUJs
 LnTC5W3AcFVz9uJq38d6IIYqbTCRl89FDnTunhUhEK0AywAxbMTsHer1aB+6SumYS0NC
 KW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=81l+dTPIf/D25VI4PJYrcgpxjDCwZBn7L7Zo7+FYLBs=;
 b=ur3rJl9wnCbqHive1DOeF27wZSwU+JpjBMGQbFeWlJerRV/2vQbWlBqDN2lG+exGVD
 GTabT/8Im9SSsW4uMVPEeg4wVVm8MeYbpSqV9my6S+lgkFE/l5KE6y5FB6djNmpPdF99
 QzgXY7IfXbdKOl3jbHEgaQdfaFxKtHIp2g0N6P3FVPSNDIA5Kd0FoRbfvUAyObP7xj1w
 XkXeg3lD8Z0IZNgrfrCyvoRumGaAWBS9m+i8eiVBVIm9SUmsocl0LhLo+LdZR5E7GApL
 KmCs2HrZ0r8FN1TOnQEqt93l3kSEp1XdeWx1GXuE7KeuH/ZYo4ETuGFD8H+5Mx3LIaEm
 iFmQ==
X-Gm-Message-State: ACgBeo2dPHigIkZM50Od/j186YdnSltMahkY429IFt3aRfgkMsV0ES7P
 JjPuPxud3REKhbUEl/xd4/KkgKqdLuibL+ky
X-Google-Smtp-Source: AA6agR5r118Ahd1lyk30+3qTCA3im/vgcBOS3325UCxjt1KYQD8IMi8J5Bg2SgUyI2gBVmI+sPm28w==
X-Received: by 2002:a5d:64a4:0:b0:226:df7c:2e5d with SMTP id
 m4-20020a5d64a4000000b00226df7c2e5dmr21782892wrp.416.1662459494053; 
 Tue, 06 Sep 2022 03:18:14 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 24/26] tcg: Introduce tcg_temp_ebb_new_*
Date: Tue,  6 Sep 2022 11:17:45 +0100
Message-Id: <20220906101747.344559-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Allow targets to allocate extended-basic-block temps.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  2 ++
 include/tcg/tcg.h    | 20 +++++++++++++++++++-
 tcg/tcg.c            | 16 ++++------------
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 209e168305..0ebbee6e24 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -848,6 +848,7 @@ static inline void tcg_gen_plugin_cb_end(void)
 #define tcg_temp_new() tcg_temp_new_i32()
 #define tcg_global_mem_new tcg_global_mem_new_i32
 #define tcg_temp_local_new() tcg_temp_local_new_i32()
+#define tcg_temp_ebb_new() tcg_temp_ebb_new_i32()
 #define tcg_temp_free tcg_temp_free_i32
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i32
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i32
@@ -855,6 +856,7 @@ static inline void tcg_gen_plugin_cb_end(void)
 #define tcg_temp_new() tcg_temp_new_i64()
 #define tcg_global_mem_new tcg_global_mem_new_i64
 #define tcg_temp_local_new() tcg_temp_local_new_i64()
+#define tcg_temp_ebb_new() tcg_temp_ebb_new_i64()
 #define tcg_temp_free tcg_temp_free_i64
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i64
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i64
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 42f39bcf54..546cb3d9d7 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -609,7 +609,7 @@ struct TCGContext {
 #endif
 
     GHashTable *const_table[TCG_TYPE_COUNT];
-    TCGTempSet free_temps[TCG_TYPE_COUNT * 2];
+    TCGTempSet free_temps[TCG_TYPE_COUNT * 3];
     TCGTemp temps[TCG_MAX_TEMPS]; /* globals first, temps after */
 
     QTAILQ_HEAD(, TCGOp) ops, free_ops;
@@ -890,6 +890,12 @@ static inline TCGv_i32 tcg_temp_local_new_i32(void)
     return temp_tcgv_i32(t);
 }
 
+static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    return temp_tcgv_i32(t);
+}
+
 static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
@@ -909,6 +915,12 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
+static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    return temp_tcgv_i64(t);
+}
+
 static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
@@ -928,6 +940,12 @@ static inline TCGv_ptr tcg_temp_local_new_ptr(void)
     return temp_tcgv_ptr(t);
 }
 
+static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    return temp_tcgv_ptr(t);
+}
+
 #if defined(CONFIG_DEBUG_TCG)
 /* If you call tcg_clear_temp_count() at the start of a section of
  * code which is not supposed to leak any TCG temporaries, then
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 2bfba860d4..bd33657f80 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -948,17 +948,8 @@ TCGTemp *tcg_temp_new_internal(TCGType type, TCGTempKind kind)
     TCGTemp *ts;
     int idx, k;
 
-    switch (kind) {
-    case TEMP_NORMAL:
-        k = 0;
-        break;
-    case TEMP_LOCAL:
-        k = TCG_TYPE_COUNT;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    k += type;
+    assert(kind >= TEMP_NORMAL && kind <= TEMP_LOCAL);
+    k = TCG_TYPE_COUNT * kind + type;
 
     idx = find_first_bit(s->free_temps[k].l, TCG_MAX_TEMPS);
     if (idx < TCG_MAX_TEMPS) {
@@ -1046,6 +1037,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
          */
         return;
     case TEMP_NORMAL:
+    case TEMP_EBB:
     case TEMP_LOCAL:
         break;
     default:
@@ -1063,7 +1055,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
     ts->temp_allocated = 0;
 
     idx = temp_idx(ts);
-    k = ts->base_type + (ts->kind == TEMP_NORMAL ? 0 : TCG_TYPE_COUNT);
+    k = ts->base_type + ts->kind * TCG_TYPE_COUNT;
     set_bit(idx, s->free_temps[k].l);
 }
 
-- 
2.34.1


