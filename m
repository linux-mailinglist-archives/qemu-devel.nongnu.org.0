Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5128643C7B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:42:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2PlP-0003Bu-Pv; Mon, 05 Dec 2022 23:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlN-0003B0-Oo
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:41:01 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlM-000336-49
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:41:01 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 s9-20020a05683004c900b0066e7414466bso8588905otd.12
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FrSE3XSvwUmq7LNNTi99/Kduka3LG902gg8B3hddhvY=;
 b=dQ49OT7ad3FBFggykLzYaIcmDdGuzoOAaMAN+gBwJC8476VHIK2jFe8la85xP5ypkx
 p4x6RBDRJsrlNSGqPYMF62G8gsZCo0fCvMNF1TbGWMiHspvA+c5K63Qov+rKmugRc4mj
 XJeM/WTLVOnTlV6+sqajQSDdE5IP0+9RsxCQY95eLtfrpBVBYlf9r0nxRt8m6U0zPiIm
 HEa9ZLk1fvyRGylJxXxk2oPxyVppxZMSi/XHq7Hz+3U28Kf9iaXxnI2E4r/aXTcG7gB0
 5yBKGUnRxR/ZnaCClwK3hxQqdWv0A1Tz50RnKIjrhSa46DhTDcLYFQ3aO9MCj4K0xx2h
 2CVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FrSE3XSvwUmq7LNNTi99/Kduka3LG902gg8B3hddhvY=;
 b=VfoQkL5E0d98VRFA8ium2lAdGylClmLXFtiz7llCmOj7ZkxfzWT43zlkpfoG02EC48
 GmfJSZ56k5sWF5koA1A2t0QSXT++iC9S7LfBliFc7eUd96wURfO3BVtopkA3KlvGoL5e
 0+u9o30+3A8/X0tBHfZU8zQccm48TkI87/g4A+cxIbbEXgSYlEiLaBSMNqUJdo1eJUtT
 n1esOz5Tgjw9CBnc1veeuQE/LyPyy+CUiXrU8gwSRCrTAbWa62faXfFR8jW0Suq/gdDS
 se4JQoYOXep+spbwbCWNJ3uPiLw0aNcSa/oLEyE27NTCml0cUp80tlWYWBZloCOLFgcL
 IV7w==
X-Gm-Message-State: ANoB5plS8bI0BTT0B1Q46z8MH+wsA5Yp+HeUCK3ccu1fJKSukFbVHjaO
 26/MkNQkE6MFMxcyDrse7/JPsFotGxtQlBWnv7Y=
X-Google-Smtp-Source: AA0mqf43xpwP0JLSCSCMrJS778ZMbanEHTQvdYuAa+0bT1fUEzRMfIL7/QaCZKowTle6ZrGHsGfhxw==
X-Received: by 2002:a9d:721a:0:b0:66e:882a:1dff with SMTP id
 u26-20020a9d721a000000b0066e882a1dffmr7397146otj.292.1670301657812; 
 Mon, 05 Dec 2022 20:40:57 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05687041c600b001442fada152sm7561864oac.46.2022.12.05.20.40.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:40:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] tcg/loongarch64: Update tcg-insn-defs.c.inc
Date: Mon,  5 Dec 2022 22:40:46 -0600
Message-Id: <20221206044051.322543-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206044051.322543-1-richard.henderson@linaro.org>
References: <20221206044051.322543-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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

Regenerate with ADDU16I included.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-insn-defs.c.inc | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-insn-defs.c.inc b/tcg/loongarch64/tcg-insn-defs.c.inc
index d162571856..c3c8669b4b 100644
--- a/tcg/loongarch64/tcg-insn-defs.c.inc
+++ b/tcg/loongarch64/tcg-insn-defs.c.inc
@@ -4,7 +4,7 @@
  *
  * This file is auto-generated by genqemutcgdefs from
  * https://github.com/loongson-community/loongarch-opcodes,
- * from commit 961f0c60f5b63e574d785995600c71ad5413fdc4.
+ * from commit 6ffbaddacacfcd5bdc893a49a165b8549d385eea.
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


