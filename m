Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63EB678DE9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 03:07:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8gp-0008S7-NR; Mon, 23 Jan 2023 21:05:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gk-0008R4-Ri
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:30 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gj-0003ve-4k
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:30 -0500
Received: by mail-pl1-x62c.google.com with SMTP id k18so13340661pll.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 18:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpu0eOvVcL/BkHuF9+fHY5Np3svCaEUGDf2BIuaeQ+o=;
 b=f4eCzEPvx4N4xBppe5Lt09vEVXPc+Co/gL6dvfOOgdMT56i8QgPdm7MZGAbVeQfbV4
 hhUoGp0kJaMiRolc+jhxBK04IIkq41ddd2LQ+uVepc9YpUYf4CLAxetcVtnBlmDesfXo
 pXB0r+nj2dzG7X8FtxAcVFAlryB93ppd/cVgiCrApVIkIm01gwy1M++d7DbqM2rCxHuT
 naIy/09YEbrOXl3fmZEds6nlYlG06t2bAywFDW7/kxrGl/xMNrFehCAVB6szKKsLQ4ZX
 gRlWaQlUsubjRU9GwZGyBQ3vehVkTrvGk9UjVIB02sCOejL1oEh0UWKOvPRiXUsJGW69
 sN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bpu0eOvVcL/BkHuF9+fHY5Np3svCaEUGDf2BIuaeQ+o=;
 b=GDksoD2ZmJ5hSJU68teN1tU1zl/hjQh6Mb4vmyuWPVt6LDAkKlLrUB5W0ePf6OO3Iv
 S6Lrjm4nGZiya4P9BzZfVTcl/+Q5B1MgWq0N7otgTPajkhte0E5NGXmR15cr/raxp27m
 LAuapvcz/1r342EIkCU4v03hmvwhlo4xI1QKrMIEZ8B+4rfKKIaNyCi2Xa3CG003hjus
 88Gk4Aa54fuzDFVAQKew2lH+HlchvH4hhgA1YL37BGh3wy6x0F/jHw22ZgJ0TTNNC8RV
 FRnbuV2sR9t4TPKRElPtvq9w3lF0+nfnWUWwxi9RXKhcfUXc18HuWBq0X+vm3HKFutnn
 +yrg==
X-Gm-Message-State: AFqh2krByTGP8el2zo2i/4C9zcOlE45uRXk2gGL5TVO2jjHpw9dTy7Wl
 RhR0wL3hymJQkGQlgTYWLA37E9nzPEtyuUyh
X-Google-Smtp-Source: AMrXdXs4mnICup4koz+qKPe82mfenY6DgUpX7hqtPlbCeWN643QY923HXQasu+B4bCEXvcNuOhfzZg==
X-Received: by 2002:a17:90b:3eca:b0:229:f4cd:1e03 with SMTP id
 rm10-20020a17090b3eca00b00229f4cd1e03mr17109385pjb.22.1674525927690; 
 Mon, 23 Jan 2023 18:05:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b00228e56d375asm283936pjb.33.2023.01.23.18.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 18:05:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 10/15] tcg/loongarch64: Update tcg-insn-defs.c.inc
Date: Mon, 23 Jan 2023 16:05:02 -1000
Message-Id: <20230124020507.3732200-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124020507.3732200-1-richard.henderson@linaro.org>
References: <20230124020507.3732200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Reviewed-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-insn-defs.c.inc | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-insn-defs.c.inc b/tcg/loongarch64/tcg-insn-defs.c.inc
index d162571856..b5bb0c5e73 100644
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


