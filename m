Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F78D6F5151
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:26:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pH-0007fO-PZ; Wed, 03 May 2023 03:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ow-0006pa-LJ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:40 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6oq-0007Hz-Ij
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:36 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f315735514so11205215e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098549; x=1685690549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ee+/tZtVXx1HapVlpwz6x03LyQaqO+PtTzdE1w9ii1A=;
 b=gpQ7EwwArrpyfhojdgVqW0S9LiVfU4mJGdNzDFgFkYeM5uf6Hi4fm0DIBV+b7qOo58
 zBw56dddspOdtTzpGWih80HH1ck8yNQWu6rSPhj7kfRlrzaHPGyFsPyKno1PEh5TzqoM
 YdWyKmG3CAUQS21Ek50nCUyTF+OfKe51/RTDjEh5wq861La8b7pChPHhl8kZKbhVu3vm
 ADvOYFBix819I0WMX2qcSM6zP8BwWULR4OxwFSczjjzVHTXXd5VhAr80Ynxz10NkrCli
 VEAMSkPHTjeclYQTsfk2sfY40D01Vp8ESaX+JgthcMSWxPWhr5wJg7/OPci7T4cpgnfl
 cGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098549; x=1685690549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ee+/tZtVXx1HapVlpwz6x03LyQaqO+PtTzdE1w9ii1A=;
 b=Sq3ear6FCohOX9YfqGU+PM4+ngyuiZWexiHtr+lCdNbN24Zj0fjLXH0DWcoamr8F9p
 gvBKKEIpofQ+Tmx9opWZB5J9rfCEsMojdW75lMVop/vr51qa9TX/zJLiRUcrzNMGTGrq
 H+5l3uDqha62slrTnwJ0WpPPRsAIn8pDTULUiGf/59yQioVw5/74Ft299gpuqqMiua8S
 NffzQlAI6/szxw31nCb76qWaF8mRzc0M3fl9PwGV0YAfmOVwPQTw19oKebgUQA6iPnjd
 JGZzZAyQYebF3v7TyaGPC2rF6mzvnEv7aFj82jdrD3ugXxMvWbuhmFUHM3bHo4vDT2CD
 Tehg==
X-Gm-Message-State: AC+VfDwbgMwwtyptZQyM9vKqzVe8fHF3IrQ2DZkPnsQf+jC6KwA36t5R
 7K+jhlMIckZGhkV6aGnrfjk269SIEzqxlZq1y+gJxg==
X-Google-Smtp-Source: ACHHUZ6Lsj0yr1+4Iz0R7c+3eHuPMrLquqFsxQk2bMCFny61gA1FWAP580LsLwyfmT7UvwHjkuJChg==
X-Received: by 2002:a1c:c916:0:b0:3f1:71d3:8ddf with SMTP id
 f22-20020a1cc916000000b003f171d38ddfmr634444wmb.14.1683098549049; 
 Wed, 03 May 2023 00:22:29 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Subject: [PULL v2 05/12] tcg: Add tcg_gen_gvec_andcs
Date: Wed,  3 May 2023 08:20:54 +0100
Message-Id: <20230503072221.1746802-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

Add tcg expander and helper functions for and-compliment
vector with scalar operand.

Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Message-Id: <20230428144757.57530-10-lawrence.hunter@codethink.co.uk>
[rth: Split out of larger patch.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-runtime.h      |  1 +
 include/tcg/tcg-op-gvec.h    |  2 ++
 accel/tcg/tcg-runtime-gvec.c | 11 +++++++++++
 tcg/tcg-op-gvec.c            | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index e141a6ab24..b8e6421c8a 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -217,6 +217,7 @@ DEF_HELPER_FLAGS_4(gvec_nor, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_eqv, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_ands, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(gvec_andcs, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(gvec_xors, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(gvec_ors, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 
diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 28cafbcc5c..6d58683171 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -330,6 +330,8 @@ void tcg_gen_gvec_ori(unsigned vece, uint32_t dofs, uint32_t aofs,
 
 void tcg_gen_gvec_ands(unsigned vece, uint32_t dofs, uint32_t aofs,
                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz);
+void tcg_gen_gvec_andcs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz);
 void tcg_gen_gvec_xors(unsigned vece, uint32_t dofs, uint32_t aofs,
                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz);
 void tcg_gen_gvec_ors(unsigned vece, uint32_t dofs, uint32_t aofs,
diff --git a/accel/tcg/tcg-runtime-gvec.c b/accel/tcg/tcg-runtime-gvec.c
index ac7d28c251..97399493d5 100644
--- a/accel/tcg/tcg-runtime-gvec.c
+++ b/accel/tcg/tcg-runtime-gvec.c
@@ -550,6 +550,17 @@ void HELPER(gvec_ands)(void *d, void *a, uint64_t b, uint32_t desc)
     clear_high(d, oprsz, desc);
 }
 
+void HELPER(gvec_andcs)(void *d, void *a, uint64_t b, uint32_t desc)
+{
+    intptr_t oprsz = simd_oprsz(desc);
+    intptr_t i;
+
+    for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
+        *(uint64_t *)(d + i) = *(uint64_t *)(a + i) & ~b;
+    }
+    clear_high(d, oprsz, desc);
+}
+
 void HELPER(gvec_xors)(void *d, void *a, uint64_t b, uint32_t desc)
 {
     intptr_t oprsz = simd_oprsz(desc);
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 047a832f44..9c14908a46 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -2761,6 +2761,23 @@ void tcg_gen_gvec_andi(unsigned vece, uint32_t dofs, uint32_t aofs,
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_ands);
 }
 
+void tcg_gen_gvec_andcs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
+{
+    static GVecGen2s g = {
+        .fni8 = tcg_gen_andc_i64,
+        .fniv = tcg_gen_andc_vec,
+        .fno = gen_helper_gvec_andcs,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+        .vece = MO_64
+    };
+
+    TCGv_i64 tmp = tcg_temp_ebb_new_i64();
+    tcg_gen_dup_i64(vece, tmp, c);
+    tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, c, &g);
+    tcg_temp_free_i64(tmp);
+}
+
 static const GVecGen2s gop_xors = {
     .fni8 = tcg_gen_xor_i64,
     .fniv = tcg_gen_xor_vec,
-- 
2.34.1


