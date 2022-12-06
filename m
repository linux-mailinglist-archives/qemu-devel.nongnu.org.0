Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104F1643C78
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:42:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2PlO-0003BM-Oz; Mon, 05 Dec 2022 23:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlL-0003AY-U5
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:41:00 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlK-00030Z-2L
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:40:59 -0500
Received: by mail-oi1-x232.google.com with SMTP id r11so9924571oie.13
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5F058NLeHjKlkmfIxljmYxzTUffR2aWn7r+JcDjVNcg=;
 b=pNBvk6Ecp+5+H2AFfx325Tv8v1+qJ1xtZRCkTHdkdvuRTwJctt+79mtved0xB2dRFc
 /gQ+X/1OwgsiRxeKx8Zy/vOv3ESDotXGazTqxKhMfDkEeEbDbKuCfNP5MD7ukaAN+mQ7
 QKEIe/MZrA797wPTGjAcUPXWQxjqKER071i8j5OZ78Q/nVN6oEosJoUlqz8ou2w9VAnZ
 AjYxQ8BhPzCV8TWpaGYYzTmMSSU8s1OEusx9mLvvgmMvw+AHE6+/LJjKHVs/MaqmdH+i
 VeOrEeu5xJlsiGNzoM2o60LWMwgzSIWGJdy2IaLWd7tV/dOCaUeWtriX/q08DXqbubA/
 5Aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5F058NLeHjKlkmfIxljmYxzTUffR2aWn7r+JcDjVNcg=;
 b=KyKbC1IebrTtC5wht0SnD9F4N//gRAN75jxXQPWpdpN0fHMjmQsn2VppWjuzpTXPpQ
 g/IpkhIIv4enkyW4ohiaxdrYDjyEO/qjtT53OOIFTwb0lzIc3jJW46K1gvTqlTOL6TiQ
 Q2QYWgYaUQfvoOIpq+kCBcQsSZ4bN0PWZP/9k6XW4j3ZK676gK18r8jklLeZJkB7d3Ni
 Tzvz2GVJr9b9VA30BicxlNGI2i1TXjozI2dk/yWU0jdeGiJaqnHOiAvzjr6soY0f6byz
 fTiRXyQqQwXer2Aj6OWTPkr1TiTYmcrU6/zkCIY6ddnIFO67UXcK1pYfLcLIAVX08XJy
 DTng==
X-Gm-Message-State: ANoB5pnukdOr+yxvuG/gKYT2KyS1CFv9KlDnt8/93gZhx2AGlwS00PO2
 HZ+hoOhMelevpjoY2YuKgk/MJi7Soj98DNDGwLA=
X-Google-Smtp-Source: AA0mqf6018zApXqKf1W6+rsMhuamKZ1ByaH9FGZ+EptLibQx3/1sVh//y6x5JpSsXDM3nvL0HFBreA==
X-Received: by 2002:aca:1218:0:b0:35c:abd7:80cb with SMTP id
 24-20020aca1218000000b0035cabd780cbmr2155355ois.243.1670301656671; 
 Mon, 05 Dec 2022 20:40:56 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05687041c600b001442fada152sm7561864oac.46.2022.12.05.20.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:40:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Rui Wang <wangrui@loongson.cn>
Subject: [PATCH 2/8] tcg/loongarch64: Optimize immediate loading
Date: Mon,  5 Dec 2022 22:40:45 -0600
Message-Id: <20221206044051.322543-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206044051.322543-1-richard.henderson@linaro.org>
References: <20221206044051.322543-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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
  ...

Signed-off-by: Rui Wang <wangrui@loongson.cn>
Message-Id: <20221107144713.845550-1-wangrui@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 35 +++++++++++---------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index c05b19a084..b2350f2cc7 100644
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


