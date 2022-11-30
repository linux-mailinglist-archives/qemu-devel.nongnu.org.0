Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C6563D6B1
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:29:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0N7I-0003PD-TE; Wed, 30 Nov 2022 08:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N7F-0003Jt-Ng
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:27:09 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N79-0006L0-QE
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:27:09 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so1410641wms.0
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q0hlyySKVnySixpBBftSUOW0ckS2cMlLLOX+y+Pz+0E=;
 b=wUQ5/JV2Gfwkdh1f8GFbe3QP0HCQpR8Ul+V2CXYDP1W69q2HbZMBg+DFywPnHKowsW
 JYLwbtxxk/OaRU/KntXUlCmvti/XVsb+8ABJkox24MyBI2m862dCLGTksjvCYI5vRKEP
 7FmROlj7DXp0a24v2J5kDuGSDtfbgUgODD9KJvlWu6Xb7zSkAwN8VFF50TEg0j31IPX8
 cITZ+42P2xHpvFr3ZOQsu0q/OxybY6OqgKSum1HbNNspgtNeTmbmtCExKzee4faczGrT
 ckv7m9HR1CvxNRj7bUgYiZchvI4Cp/U9f574soQMKAzwL3Z8SykEcOVBEN5IX0vrpsHz
 HoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q0hlyySKVnySixpBBftSUOW0ckS2cMlLLOX+y+Pz+0E=;
 b=sbw+/1oHOyLeLpW00X/BoztSswuebRv9fVCsF8CBdtupNcdf1eOoVKEazorGjUDhQf
 XN5zeMIW+BlJlyHQXxmiGFgcTozR0QyJz2Xeia7pnQSj/cqRiq+8jn8n6e4s1Lps4QpL
 bCVAAMATaZ2e2kqU3q3T7hah2+Ue3lqT7SYslX7VZNT4fuP4Mg8bbnTLPyujvs83Tclh
 fhkyZBDHfQFGSRBgy/tl7DhZ9o8o9pt64myd0P6S/t5EP06bz/y+Gb92NKowVDcy67be
 Kp1liDSsmsYqvBYiHt56+/1EBlfYSO3s1tUytbym4qnBgRgSyBH2aaiaDIOgYLFN2o/W
 qUkg==
X-Gm-Message-State: ANoB5pkTcjiknymw9nQu/U5iH+sJGpn4DTTsCqZSU9RP+PUzBDwDuHAH
 pLKlMuvuAZUMIt5RfqbDELujZj/VzSzQWomv
X-Google-Smtp-Source: AA0mqf6C83BuvK6Og+VIVt4N6qpS0yowzYJDgbh5uDAOcnhXuXEUr14ljaqz/I4Loi+KLrAtL1jqiQ==
X-Received: by 2002:a7b:c3d5:0:b0:3d0:306c:f7a3 with SMTP id
 t21-20020a7bc3d5000000b003d0306cf7a3mr28008677wmj.128.1669814821888; 
 Wed, 30 Nov 2022 05:27:01 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k12-20020adfe8cc000000b00241b5af8697sm1610416wrn.85.2022.11.30.05.27.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:27:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, WANG Xuerui <git@xen0n.name>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Subject: [PATCH-for-8.0 1/3] tcg/s390x: Fix coding style
Date: Wed, 30 Nov 2022 14:26:52 +0100
Message-Id: <20221130132654.76369-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130132654.76369-1-philmd@linaro.org>
References: <20221130132654.76369-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We are going to modify this code, so fix its style first to avoid:

  ERROR: spaces required around that '*' (ctx:VxV)
  #281: FILE: tcg/s390x/tcg-target.c.inc:1224:
  +        uintptr_t mask = ~(0xffffull << i*16);
                                            ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 33becd7694..f1d3907cd8 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -802,9 +802,9 @@ static bool maybe_out_small_movi(TCGContext *s, TCGType type,
     }
 
     for (i = 0; i < 4; i++) {
-        tcg_target_long mask = 0xffffull << i*16;
+        tcg_target_long mask = 0xffffull << i * 16;
         if ((uval & mask) == uval) {
-            tcg_out_insn_RI(s, lli_insns[i], ret, uval >> i*16);
+            tcg_out_insn_RI(s, lli_insns[i], ret, uval >> i * 16);
             return true;
         }
     }
@@ -1221,9 +1221,9 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
     /* Try all 32-bit insns that can perform it in one go.  */
     for (i = 0; i < 4; i++) {
-        tcg_target_ulong mask = ~(0xffffull << i*16);
+        tcg_target_ulong mask = ~(0xffffull << i * 16);
         if (((val | ~valid) & mask) == mask) {
-            tcg_out_insn_RI(s, ni_insns[i], dest, val >> i*16);
+            tcg_out_insn_RI(s, ni_insns[i], dest, val >> i * 16);
             return;
         }
     }
@@ -1231,9 +1231,9 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     /* Try all 48-bit insns that can perform it in one go.  */
     if (HAVE_FACILITY(EXT_IMM)) {
         for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = ~(0xffffffffull << i*32);
+            tcg_target_ulong mask = ~(0xffffffffull << i * 32);
             if (((val | ~valid) & mask) == mask) {
-                tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i*32);
+                tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i * 32);
                 return;
             }
         }
@@ -1279,9 +1279,9 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
     /* Try all 32-bit insns that can perform it in one go.  */
     for (i = 0; i < 4; i++) {
-        tcg_target_ulong mask = (0xffffull << i*16);
+        tcg_target_ulong mask = (0xffffull << i * 16);
         if ((val & mask) != 0 && (val & ~mask) == 0) {
-            tcg_out_insn_RI(s, oi_insns[i], dest, val >> i*16);
+            tcg_out_insn_RI(s, oi_insns[i], dest, val >> i * 16);
             return;
         }
     }
@@ -1289,9 +1289,9 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     /* Try all 48-bit insns that can perform it in one go.  */
     if (HAVE_FACILITY(EXT_IMM)) {
         for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = (0xffffffffull << i*32);
+            tcg_target_ulong mask = (0xffffffffull << i * 32);
             if ((val & mask) != 0 && (val & ~mask) == 0) {
-                tcg_out_insn_RIL(s, oif_insns[i], dest, val >> i*32);
+                tcg_out_insn_RIL(s, oif_insns[i], dest, val >> i * 32);
                 return;
             }
         }
-- 
2.38.1


