Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C047D570590
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:29:40 +0200 (CEST)
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuPr-0006xC-RM
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvf-0006dp-5c
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:28 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvW-0002sz-8I
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id r10so972271wrv.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=q781D2NAiISZsnf5qYib8iLZW0xTOuik/EP0N0QqMfE=;
 b=KsFPEzamOvb4/zc8bvrJbP6jAbLYBerRSGsn1glXChXYlW93n9h/ih60+0RDdBOriO
 kyIxB1lL7RzTSjdhmsLKCgvisR9uX7cWRosJ7d7NWAC1hhl8z0OSTpYsHRTpeUQwWZIW
 c2tD4ID8C/xGqfjNo2NyQgVCi+619rcy0hUM7EcTvTI/x50Yq6P416X42YkLccsoUe0w
 0fyo3EXNPnPbsD6DxB0bB8STqCFfw5bOLU5e4T48pTtlyBTESUIMIlq8LCQlv3IXegix
 qGFyFq6wqnW9PCpU9pRqS9luXllis6UogSrQo73qSKVkZ2r0+CJr9kCGYkIDajrVLUR6
 4yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q781D2NAiISZsnf5qYib8iLZW0xTOuik/EP0N0QqMfE=;
 b=JXJXxv2cqbuFavbpaW1oSbl84FzV2lYLwOxTENcfBqOTHLC0MMvwu6ybl15XFxHQiV
 v6VtriDLkPM6zLJ2pmgeGlGXSLnKit5OVNc7Ya8hhpSJbPk2vlxjOu9dbfUBUa16oowj
 NmlhlT9e4+AxslQAlc9QJDXVD5iP2urUXaU2PAhs9p9nwe6wg9c5QDeCeURi1a5vN3cT
 K21KSM9oRj4X1heAoo4JlHzcYIV7v5Of9+ELX82FkNmWaCrdcdHaHgDxDEMwjJsutLzi
 JWxPwEgJrr6tLV2B/L9F62JyUzyB4mK5N9q1vdMpsjlgWOydMb+WuxsQvQHkZBsh442A
 vzTQ==
X-Gm-Message-State: AJIora+junIWtyAQLTBEJKnBgTiBu/NBq1e9N45ZblQMOF+4jydMFOWg
 LehlmxopZzqc32t2ivMXZ8MbuxUOdBAfNQ==
X-Google-Smtp-Source: AGRyM1vtizx4tIak6MxH5QPbSrmQau6vkrYRk9ALJ5M23IB0xoKKrG/om7PS7hnvW4GO1OI2MC6tMw==
X-Received: by 2002:a5d:4aca:0:b0:21d:6793:1c11 with SMTP id
 y10-20020a5d4aca000000b0021d67931c11mr16516916wrs.202.1657547896511; 
 Mon, 11 Jul 2022 06:58:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/45] target/arm: Implement REVD
Date: Mon, 11 Jul 2022 14:57:34 +0100
Message-Id: <20220711135750.765803-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This is an SVE instruction that operates using the SVE vector
length but that it is present only if SME is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-30-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    |  2 ++
 target/arm/sve.decode      |  1 +
 target/arm/sve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-sve.c |  2 ++
 4 files changed, 21 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ab0333400f0..cc4e1d89481 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -719,6 +719,8 @@ DEF_HELPER_FLAGS_4(sve_revh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_revw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sme_revd_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_rbit_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 966803cbb78..a9e48f07b44 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -652,6 +652,7 @@ REVB            00000101 .. 1001 00 100 ... ..... .....         @rd_pg_rn
 REVH            00000101 .. 1001 01 100 ... ..... .....         @rd_pg_rn
 REVW            00000101 .. 1001 10 100 ... ..... .....         @rd_pg_rn
 RBIT            00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
+REVD            00000101 00 1011 10 100 ... ..... .....         @rd_pg_rn_e0
 
 # SVE vector splice (predicated, destructive)
 SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index df161704699..d6f7ef94fe6 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -931,6 +931,22 @@ DO_ZPZ_D(sve_revh_d, uint64_t, hswap64)
 
 DO_ZPZ_D(sve_revw_d, uint64_t, wswap64)
 
+void HELPER(sme_revd_q)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 2) {
+        if (pg[H1(i)] & 1) {
+            uint64_t n0 = n[i + 0];
+            uint64_t n1 = n[i + 1];
+            d[i + 0] = n1;
+            d[i + 1] = n0;
+        }
+    }
+}
+
 DO_ZPZ(sve_rbit_b, uint8_t, H1, revbit8)
 DO_ZPZ(sve_rbit_h, uint16_t, H1_2, revbit16)
 DO_ZPZ(sve_rbit_s, uint32_t, H1_4, revbit32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 24ffb69a2af..9ed3b267fdb 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2901,6 +2901,8 @@ TRANS_FEAT(REVH, aa64_sve, gen_gvec_ool_arg_zpz, revh_fns[a->esz], a, 0)
 TRANS_FEAT(REVW, aa64_sve, gen_gvec_ool_arg_zpz,
            a->esz == 3 ? gen_helper_sve_revw_d : NULL, a, 0)
 
+TRANS_FEAT(REVD, aa64_sme, gen_gvec_ool_arg_zpz, gen_helper_sme_revd_q, a, 0)
+
 TRANS_FEAT(SPLICE, aa64_sve, gen_gvec_ool_arg_zpzz,
            gen_helper_sve_splice, a, a->esz)
 
-- 
2.25.1


