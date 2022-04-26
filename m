Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2708A5103A9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:37:17 +0200 (CEST)
Received: from localhost ([::1]:42900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOBg-0006Hv-4m
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5f-0002xU-3w
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:04 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5c-0003nR-4W
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:02 -0400
Received: by mail-pl1-x630.google.com with SMTP id h12so27010424plf.12
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DozsVFM8TLDnuoUizPakS5ZW3NXzpPygo/avvBFMmuk=;
 b=ncY5yoLujCFy3hnVOiZOY1fjkRRlP6lxgeND3uivk2cNkfWQLUr8co2rHUdReRL/aq
 Yprj9caZ/DBw8MVpdnh/U/vhlww7Hq1aoI/iIOwtufuHenPy1etg3j5u5Ory3TI1Ii+c
 aBu10NQSvhweTsSBDP9rhBYyVPaW3qqaVF7owPQrJ2k1Kf2uOcsEPRW2da+JkcbpfhhV
 VrAECkSrN8Snx+38D5uho1wPLUBBmopeTAPTOzvNcGoE4d1DGS3D9gAOCFADxZietp0l
 DpbK+IHFf7j9M+4st3fvrLnuIZ0YA4Nx28FvwvXX+4TJGaL086W14cViRg6lyF4Nbd44
 JSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DozsVFM8TLDnuoUizPakS5ZW3NXzpPygo/avvBFMmuk=;
 b=zqxggzQj2suTkF+AETJCPaiHeIM0LkDtArDvVZobRUB+Yd0UnQ+u/CV9okYxyvdpz5
 1R0g2zkR3mi70QMM75LsB4KHSdD9dBCGXY1UETBfSzMOpvnZLNBd929A3xHNS/xCi8Z7
 V7/j/x07os+Ag0Dpso4y3P8nOmxvrj17mZxitHrk6KrSVzTyFx5tjFrgGKs26arxISav
 J6PPI0mMm1jA48U4z/hh48WcjPj4OS1ZcVssbaYaDr2VhIiVcNAfrv8o5m7ZvMascPkS
 Eo2+VEcbRNVke4dAp4NyF0D98kYLbjNCFUGQUuXsFjoNiTJmC5qjoy0QbFVFLepZv3+o
 VFIg==
X-Gm-Message-State: AOAM530NCtIqo81nEXvTs+wb0pE95EU416dGB5ijsDqgY+Z69qamfTV2
 2+tuQc2krxZO9ZYzA1r0hXh9VhtfJiTxlQ==
X-Google-Smtp-Source: ABdhPJw26hfNbTyWNJNbh/gh9AxKqSeUdMRnP+GPgON9cD6GolF1KpvH2Fsy3w1+Ci9yNxGDN96aIw==
X-Received: by 2002:a17:90b:1d12:b0:1d9:8499:545d with SMTP id
 on18-20020a17090b1d1200b001d98499545dmr10554875pjb.96.1650990656879; 
 Tue, 26 Apr 2022 09:30:56 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/47] target/arm: Use tcg_constant in disas_add_sum_imm*
Date: Tue, 26 Apr 2022 09:30:07 -0700
Message-Id: <20220426163043.100432-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4cdc869d52..6c88772eb3 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4178,13 +4178,12 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
             tcg_gen_addi_i64(tcg_result, tcg_rn, imm);
         }
     } else {
-        TCGv_i64 tcg_imm = tcg_const_i64(imm);
+        TCGv_i64 tcg_imm = tcg_constant_i64(imm);
         if (sub_op) {
             gen_sub_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
         } else {
             gen_add_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
         }
-        tcg_temp_free_i64(tcg_imm);
     }
 
     if (is_64bit) {
@@ -4232,12 +4231,9 @@ static void disas_add_sub_imm_with_tags(DisasContext *s, uint32_t insn)
     tcg_rd = cpu_reg_sp(s, rd);
 
     if (s->ata) {
-        TCGv_i32 offset = tcg_const_i32(imm);
-        TCGv_i32 tag_offset = tcg_const_i32(uimm4);
-
-        gen_helper_addsubg(tcg_rd, cpu_env, tcg_rn, offset, tag_offset);
-        tcg_temp_free_i32(tag_offset);
-        tcg_temp_free_i32(offset);
+        gen_helper_addsubg(tcg_rd, cpu_env, tcg_rn,
+                           tcg_constant_i32(imm),
+                           tcg_constant_i32(uimm4));
     } else {
         tcg_gen_addi_i64(tcg_rd, tcg_rn, imm);
         gen_address_with_allocation_tag0(tcg_rd, tcg_rd);
-- 
2.34.1


