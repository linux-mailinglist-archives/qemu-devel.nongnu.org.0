Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FBC670FB2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 02:13:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHwzL-000228-6u; Tue, 17 Jan 2023 20:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzJ-00021S-Fj
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:37 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzH-0002Ep-NT
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:37 -0500
Received: by mail-pl1-x634.google.com with SMTP id k18so11306936pll.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 17:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eXmkIhIsuv2GneKn/fEVnv+GUooitbhPBGl3nWaEWcQ=;
 b=j7bLVCaQ+kGVkaNNYh7B0+LHYsh49B2n8JQTgiMj7zN0zoob2FEwNH42wFf3Iwv4tW
 /1E48c6kmtnQi6y9NPxAvQyfsr32sLpwjoJS4HLHhjFfx/aYdRU4aubNzl26s+4gFEDs
 FqbGUmJKORiLwN+TNDIff3PWdSHNPd6Uh7rrhrToX+GccOzzVA9vHwJ0pO3bcsytROnt
 FDRYEhG5CrGUDoui6Qznh1W3tmn8Qp8K2DgLXc3LxZSrOO5RvwSnpXlIfGhMZFFVEaJe
 je4GF+7lwlBDiofYPTKeBuXVw/B1O6U7A3NsSHcJv22cSk0HJS3Zej95rPR22VqUb4kP
 nIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eXmkIhIsuv2GneKn/fEVnv+GUooitbhPBGl3nWaEWcQ=;
 b=2Fyp0MItIXeXDg330FpXKN4aduHZ2incMjvkwY7VXJkQVcMsRcQdjdWPiM44fON2Vb
 IKaKq+epATUYpaZWbdmPp0WJNUehxEvPKTFEn8GyW91sptKlTyF+UFRcT+ahIzkV8199
 kTKaxva7NrRVtZXV84vaVUfPN2fA9xMT87ekxgb//+IlLEByYQaXd34nDjsKdcmADIX+
 Kxy/XHeSRITY1sIR9Enypy41z/NdWwlA5cEN1toZPlq8AkJ1SboM1xw5hf8p9/L9GGts
 XHDf9avso/02UZKO25QSltUSWfYBJQfYDJy0kJSQDs4s+UF9EK+THQOanXTr8kthGnsz
 yRWw==
X-Gm-Message-State: AFqh2kr883na593Uhgbq/v+l99pNC5jdJaXHrzHxepsy+zcX10xEoxDe
 UL37+tjSgAeSWSQgbpEtGX45fFBvx0Ym1htb
X-Google-Smtp-Source: AMrXdXvnOmWsHuD4RxosoqtwO9ajQ1W9FwEfKbnnn/2YvtAZlUZAJRYSKExFUZX58QiIjNWo6crPSw==
X-Received: by 2002:a17:903:182:b0:194:7532:fb10 with SMTP id
 z2-20020a170903018200b001947532fb10mr7403618plg.40.1674004294218; 
 Tue, 17 Jan 2023 17:11:34 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0017ec1b1bf9fsm21660259plp.217.2023.01.17.17.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:11:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name
Subject: [PATCH v2 05/10] tcg/loongarch64: Update tcg-insn-defs.c.inc
Date: Tue, 17 Jan 2023 15:11:18 -1000
Message-Id: <20230118011123.392823-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118011123.392823-1-richard.henderson@linaro.org>
References: <20230118011123.392823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Regenerate with ADDU16I included:

   $ cd loongarch-opcodes/scripts/go
   $ go run ./genqemutcgdefs > $QEMU/tcg/loongarch64/tcg-insn-defs.c.inc

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-insn-defs.c.inc | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
 mode change 100644 => 100755 tcg/loongarch64/tcg-insn-defs.c.inc

diff --git a/tcg/loongarch64/tcg-insn-defs.c.inc b/tcg/loongarch64/tcg-insn-defs.c.inc
old mode 100644
new mode 100755
index d162571856..b5bb0c5e73
--- a/tcg/loongarch64/tcg-insn-defs.c.inc
+++ b/tcg/loongarch64/tcg-insn-defs.c.inc
@@ -4,7 +4,7 @@
  *
  * This file is auto-generated by genqemutcgdefs from
  * https://github.com/loongson-community/loongarch-opcodes,
- * from commit 961f0c60f5b63e574d785995600c71ad5413fdc4.
+ * from commit 25ca7effe9d88101c1cf96c4005423643386d81f.
  * DO NOT EDIT.
  */
 
@@ -74,6 +74,7 @@ typedef enum {
     OPC_ANDI = 0x03400000,
     OPC_ORI = 0x03800000,
     OPC_XORI = 0x03c00000,
+    OPC_ADDU16I_D = 0x10000000,
     OPC_LU12I_W = 0x14000000,
     OPC_CU32I_D = 0x16000000,
     OPC_PCADDU2I = 0x18000000,
@@ -710,6 +711,13 @@ tcg_out_opc_xori(TCGContext *s, TCGReg d, TCGReg j, uint32_t uk12)
     tcg_out32(s, encode_djuk12_insn(OPC_XORI, d, j, uk12));
 }
 
+/* Emits the `addu16i.d d, j, sk16` instruction.  */
+static void __attribute__((unused))
+tcg_out_opc_addu16i_d(TCGContext *s, TCGReg d, TCGReg j, int32_t sk16)
+{
+    tcg_out32(s, encode_djsk16_insn(OPC_ADDU16I_D, d, j, sk16));
+}
+
 /* Emits the `lu12i.w d, sj20` instruction.  */
 static void __attribute__((unused))
 tcg_out_opc_lu12i_w(TCGContext *s, TCGReg d, int32_t sj20)
-- 
2.34.1


