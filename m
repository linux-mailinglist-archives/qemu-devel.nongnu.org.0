Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EEA703030
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:42:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZLO-0008Cc-2B; Mon, 15 May 2023 10:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJu-00055q-7m
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:02 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJl-0005zm-Nv
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:01 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1aaf706768cso98078675ad.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161412; x=1686753412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=COeCBcDhyHAzyrUtiEtch7tCJeKP75ntgsjZMHrLAcw=;
 b=QYHhs7GwDYTCfkOtLvKr7EQZw2y1cZHbUKG8jrwnxTJxjItI2fBxRK8zsJZYiwNiuY
 5wtldvVk3P8dXOY/1vSIm05ts2Y2KQgInFfICycB1GgLQtRCiEMOBLJy/NUF8guCEQgj
 jsXX79l0T4JjOJ1Qpcgzbxd9087C0Goziqn7rNGN32EMYeQRIqBOW5g+7p30JCn1f/H6
 WixxGmsvtTnQW/9osR8qc0IJ+c/GDqpwkxW98XZqwK0F4aYT4/O2opQPRXLNxRsfPVWc
 5QDSoGlQKZQVQDSN1rS7ytrX1zMVC0+7uaIS4c+hs3iRLN3HaIesvTP80Jk3jMVZ2UGA
 YokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161412; x=1686753412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=COeCBcDhyHAzyrUtiEtch7tCJeKP75ntgsjZMHrLAcw=;
 b=YM7v3aPzCTtdXxQqrd+WoWXz7Qg2BYkiIJNcjuwXPWAc9bd7Han7pSTS94zG03MmxI
 Q8uTlkgQAiabfbCILFMgeI3iQrYAKPStzHq7ZXMLuqbjwDBbmoYTOdIUa31uNCQHx9Lj
 uzDRCnm8q/fj1KfdgjOOoKpMOn51n8cEvJgFxXEnVvR0HI4svA0r/4/Z+RfQ+sNh+Bs1
 6Arnx7jGbm4yPNTspMLyyk3PiPTGXIFSjcnGdjKoIlaBlBJK/i1TifZ5vwXP+X9GfFh8
 jU5sRepohiHobcsm28M64D4NkLWUyhtnqLSMdiHwJO0DIcq51e1Pv8H5nYnlUKtOf+Tg
 0Tqw==
X-Gm-Message-State: AC+VfDxr3mXmu1//vsLziQUIEAem3QP8Dtx1h88ur3MOnIzU9MS6/BnV
 8CLpSgy4AVjy1rqVXd16mEQQtZ/fLVZKOXiRMDc=
X-Google-Smtp-Source: ACHHUZ6AR07WibxqzMzaFHVWPX1NvQtZBtrLhqUFw4lTn9xkXrY4/YkapPn9HfMT+3zMN4o1kWjGFw==
X-Received: by 2002:a17:902:ce91:b0:1ad:ddf0:131f with SMTP id
 f17-20020a170902ce9100b001adddf0131fmr16389454plg.51.1684161412527; 
 Mon, 15 May 2023 07:36:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 44/54] tcg/mips: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:33:03 -0700
Message-Id: <20230515143313.734053-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index cd0254a0d7..3f3fe5b991 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1138,7 +1138,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 typedef struct {
     TCGReg base;
-    MemOp align;
+    TCGAtomAlign aa;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1158,11 +1158,15 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits;
     unsigned s_bits = opc & MO_SIZE;
-    unsigned a_mask = (1 << a_bits) - 1;
+    unsigned a_mask;
     TCGReg base;
 
+    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    a_bits = h->aa.align;
+    a_mask = (1 << a_bits) - 1;
+
 #ifdef CONFIG_SOFTMMU
     unsigned s_mask = (1 << s_bits) - 1;
     int mem_index = get_mmuidx(oi);
@@ -1281,7 +1285,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 #endif
 
     h->base = base;
-    h->align = a_bits;
     return ldst;
 }
 
@@ -1394,7 +1397,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
 
     ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, true);
 
-    if (use_mips32r6_instructions || h.align >= (opc & MO_SIZE)) {
+    if (use_mips32r6_instructions || h.aa.align >= (opc & MO_SIZE)) {
         tcg_out_qemu_ld_direct(s, datalo, datahi, h.base, opc, data_type);
     } else {
         tcg_out_qemu_ld_unalign(s, datalo, datahi, h.base, opc, data_type);
@@ -1481,7 +1484,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
 
     ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, false);
 
-    if (use_mips32r6_instructions || h.align >= (opc & MO_SIZE)) {
+    if (use_mips32r6_instructions || h.aa.align >= (opc & MO_SIZE)) {
         tcg_out_qemu_st_direct(s, datalo, datahi, h.base, opc);
     } else {
         tcg_out_qemu_st_unalign(s, datalo, datahi, h.base, opc);
-- 
2.34.1


