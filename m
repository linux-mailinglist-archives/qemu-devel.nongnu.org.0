Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583FB678DE3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 03:06:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8gm-0008RU-Ko; Mon, 23 Jan 2023 21:05:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gi-0008Qj-Nm
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:29 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gh-0003vE-1l
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:28 -0500
Received: by mail-pj1-x1035.google.com with SMTP id 88so1848909pjo.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 18:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Guv3uvJrWpw8GC7CFlgkvRN1pGVi7w2ZYgHuDstoJxk=;
 b=WCyxlYsV/GTw4l7X23GPzYxcr78+a+L7BIe4phx9ju2zSv6O0fAwOMARZjtp4mBTLe
 PvRwkakTUxirG4qS5cY9Et1OT7AUrGukjm2mlNONnQxUGQwWDAk5GJjQYsyn3HGJ4d4u
 W1vdreq4LHU+t/Qcc4sfmxLBKcU+9xFkv+c7V091eUAdXG/yaolruSsDAsG3OX0e2yVe
 uApCDQwt4XmD4Vct9YxeGSPwVTxIpwMcVQx9kgzleL5jbyl8yJb9mpJFnjGh+AIcg1VV
 mREB6EYaYVtzly51I4lnqp8cmh1LxyRJiK9wFCfDMg8dMc4g4n0nPqR9j0F5xY9kZTIE
 zZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Guv3uvJrWpw8GC7CFlgkvRN1pGVi7w2ZYgHuDstoJxk=;
 b=TCehAnoOQMdqSvrwgjS6A3i+6MBymPVDbIvhKKjzPUbpoOQ9UyUkg/Dz1iqHFsRXCN
 7Zh8pvwFp68vkpWvdbwA5sO84Nev14F2UCiMUimrhhAGRLS//626EwRljHp0R3VUyqex
 zYgBhk6zUzmeFicgvqxrhwZ2rfrkPBEuZak2jDY5t11uFx+4BSBUzdqr76CRv/TrT25z
 oLWdoDSzKhDCC84815vteHNNwhgXIw+Ogu3aeHTtYx5AoplI9EezPV5OpM0ThoeYLFPt
 rvu7kGE7NHLtAMSXZK66rAHKLuiJ5M5OwkqoFkmbGStO4QLH2i6cxceN8j81Rl1yKKNN
 KQ0A==
X-Gm-Message-State: AFqh2krGtJQ8HtmWHRY2HcRn5strUxMlEp4FzXfUXJqFjTzyHsUBHnLV
 uAe4kHSGoIuKUoeWUkDLBJ0NQKZd6n/CRtLw
X-Google-Smtp-Source: AMrXdXvnjP7P7PJm6zi8JOWOW+SJCP5IPQN23GP4zwrjr7zoEkIA1mRbWC4KXqAnoz/EnrrDP6kZ5w==
X-Received: by 2002:a17:90b:1b45:b0:22b:b6d5:e347 with SMTP id
 nv5-20020a17090b1b4500b0022bb6d5e347mr13417957pjb.29.1674525925755; 
 Mon, 23 Jan 2023 18:05:25 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b00228e56d375asm283936pjb.33.2023.01.23.18.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 18:05:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Rui Wang <wangrui@loongson.cn>,
 WANG Xuerui <git@xen0n.name>
Subject: [PULL v2 09/15] tcg/loongarch64: Optimize immediate loading
Date: Mon, 23 Jan 2023 16:05:01 -1000
Message-Id: <20230124020507.3732200-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124020507.3732200-1-richard.henderson@linaro.org>
References: <20230124020507.3732200-1-richard.henderson@linaro.org>
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

From: Rui Wang <wangrui@loongson.cn>

diff:
  Imm                 Before                  After
  0000000000000000    addi.w  rd, zero, 0     addi.w  rd, zero, 0
                      lu52i.d rd, zero, 0
  00000000fffff800    lu12i.w rd, -1          addi.w  rd, zero, -2048
                      ori     rd, rd, 2048    lu32i.d rd, 0
                      lu32i.d rd, 0

Reviewed-by: WANG Xuerui <git@xen0n.name>
Signed-off-by: Rui Wang <wangrui@loongson.cn>
Message-Id: <20221107144713.845550-1-wangrui@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 35 +++++++++++---------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 3174557ce3..428f3abd71 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -274,16 +274,6 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
     return true;
 }
 
-static bool imm_part_needs_loading(bool high_bits_are_ones,
-                                   tcg_target_long part)
-{
-    if (high_bits_are_ones) {
-        return part != -1;
-    } else {
-        return part != 0;
-    }
-}
-
 /* Loads a 32-bit immediate into rd, sign-extended.  */
 static void tcg_out_movi_i32(TCGContext *s, TCGReg rd, int32_t val)
 {
@@ -291,16 +281,16 @@ static void tcg_out_movi_i32(TCGContext *s, TCGReg rd, int32_t val)
     tcg_target_long hi12 = sextreg(val, 12, 20);
 
     /* Single-instruction cases.  */
-    if (lo == val) {
-        /* val fits in simm12: addi.w rd, zero, val */
-        tcg_out_opc_addi_w(s, rd, TCG_REG_ZERO, val);
-        return;
-    }
-    if (0x800 <= val && val <= 0xfff) {
+    if (hi12 == 0) {
         /* val fits in uimm12: ori rd, zero, val */
         tcg_out_opc_ori(s, rd, TCG_REG_ZERO, val);
         return;
     }
+    if (hi12 == sextreg(lo, 12, 20)) {
+        /* val fits in simm12: addi.w rd, zero, val */
+        tcg_out_opc_addi_w(s, rd, TCG_REG_ZERO, val);
+        return;
+    }
 
     /* High bits must be set; load with lu12i.w + optional ori.  */
     tcg_out_opc_lu12i_w(s, rd, hi12);
@@ -334,8 +324,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
 
     intptr_t pc_offset;
     tcg_target_long val_lo, val_hi, pc_hi, offset_hi;
-    tcg_target_long hi32, hi52;
-    bool rd_high_bits_are_ones;
+    tcg_target_long hi12, hi32, hi52;
 
     /* Value fits in signed i32.  */
     if (type == TCG_TYPE_I32 || val == (int32_t)val) {
@@ -366,25 +355,25 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
         return;
     }
 
+    hi12 = sextreg(val, 12, 20);
     hi32 = sextreg(val, 32, 20);
     hi52 = sextreg(val, 52, 12);
 
     /* Single cu52i.d case.  */
-    if (ctz64(val) >= 52) {
+    if ((hi52 != 0) && (ctz64(val) >= 52)) {
         tcg_out_opc_cu52i_d(s, rd, TCG_REG_ZERO, hi52);
         return;
     }
 
     /* Slow path.  Initialize the low 32 bits, then concat high bits.  */
     tcg_out_movi_i32(s, rd, val);
-    rd_high_bits_are_ones = (int32_t)val < 0;
 
-    if (imm_part_needs_loading(rd_high_bits_are_ones, hi32)) {
+    /* Load hi32 and hi52 explicitly when they are unexpected values. */
+    if (hi32 != sextreg(hi12, 20, 20)) {
         tcg_out_opc_cu32i_d(s, rd, hi32);
-        rd_high_bits_are_ones = hi32 < 0;
     }
 
-    if (imm_part_needs_loading(rd_high_bits_are_ones, hi52)) {
+    if (hi52 != sextreg(hi32, 20, 12)) {
         tcg_out_opc_cu52i_d(s, rd, rd, hi52);
     }
 }
-- 
2.34.1


