Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9F3322260
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 23:51:57 +0100 (CET)
Received: from localhost ([::1]:45418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEK3Y-0004eV-U0
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 17:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrZ-00019R-Tq
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:33 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrY-0005Vw-GO
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:33 -0500
Received: by mail-ed1-x535.google.com with SMTP id l12so23951905edt.3
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 14:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hhlpouH+U3rNOrspZgB0QgIcQmhAf1zcqiPcomofBiI=;
 b=UkHdRzu1SPs4TbCGedYqhjNBjNrFEYSGbqLo4NSxdLNLZaHEYC7LQD5UPUeElpD8vs
 KHc13V0KbINvaKqtM4cSou0XHW40gpC7fK6M5lJ4u3RsD7C57kM02mMarXBwMIJEkIWF
 POBBpDD/NRwrC4C85N+ICjxN6zuQ7mRD6Lyya/LgnjgKr4mDw7MPhoZ5Fw2HJuZctX1U
 yft2JKx1UXVEgNsL9C5mJiTBMnUwHVY6WrxgaPYqZzNjNRQ2myxPAMozVnI3MypdmFij
 1Yp2Cb3EbZ+XQmgKNH0iN2rqRSxqN8OROWe5SdcwI08SNdW2drgM3NP0G1tjrgZ/bmGc
 TDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hhlpouH+U3rNOrspZgB0QgIcQmhAf1zcqiPcomofBiI=;
 b=NW88M9VVAwQHG8w7TDG6MDwEoq9eAaRTGblr7yNxj3Zbc9J7YblfeqVbYf3XtrLAOR
 Klza8rABUBhD2ywUQJpPMGb3gWm2wD5a5Yb7XXNUzE8Fjx1k0Wc/1lU/G82TYpvcZKWX
 sRR74vWGnFKRa2HNNplwABlik4ttkxzBDetldJuBgzd9DZInKq3A84PFeDhqxUcTrMIk
 1m52d8tFzOmkQawFINIstGVH1m45VS5v79X9B2EkHQ2WXqW13+d2UnTbsz+hrYcQSDDd
 4f9jGjSWH2y1GsgK4MxL2tpR8lYGV+lnlkKgPsh+aAMDxzsYnX/5VWHDBAPhfzjWU1V2
 WyEQ==
X-Gm-Message-State: AOAM533OYkLpV8apmCUgE+bEWzqd4F1wBrpjSuPxS/ekdLTnsXC7XeXe
 AnHOC7y+pAtcE/vytkX/adpHRvtskWk=
X-Google-Smtp-Source: ABdhPJzZJKd++38iXJTzzoH/HCYOR9QnGGAiKOvFY7VFGs6kBEXxLbKhLePddPMuiRZCPzCm8ruFIg==
X-Received: by 2002:aa7:dace:: with SMTP id x14mr4903561eds.142.1614033570925; 
 Mon, 22 Feb 2021 14:39:30 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x17sm13176654edq.42.2021.02.22.14.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 14:39:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/10] target/mips: Extract decode_ase_mxu() from
 decode_opc_mxu()
Date: Mon, 22 Feb 2021 23:38:56 +0100
Message-Id: <20210222223901.2792336-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222223901.2792336-1-f4bug@amsat.org>
References: <20210222223901.2792336-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To easily convert MXU code to decodetree, extract decode_ase_mxu()
from decode_opc_mxu(), making it return a boolean.
We will keep decode_opc_mxu() in the translate.c unit because it
calls gen_arith().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 45 ++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9e875fa4a25..6f853fcdcce 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25777,34 +25777,18 @@ static void decode_opc_mxu__pool19(DisasContext *ctx)
     }
 }
 
-/*
- * Main MXU decoding function
- */
-static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
+static bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
-    if (opcode == OPC__MXU_MUL) {
-        uint32_t  rs, rt, rd, op1;
-
-        rs = extract32(insn, 21, 5);
-        rt = extract32(insn, 16, 5);
-        rd = extract32(insn, 11, 5);
-        op1 = MASK_SPECIAL2(insn);
-
-        gen_arith(ctx, op1, rd, rs, rt);
-
-        return;
-    }
-
     if (opcode == OPC_MXU_S32M2I) {
         gen_mxu_s32m2i(ctx);
-        return;
+        return true;
     }
 
     if (opcode == OPC_MXU_S32I2M) {
         gen_mxu_s32i2m(ctx);
-        return;
+        return true;
     }
 
     {
@@ -25845,6 +25829,29 @@ static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
         gen_set_label(l_exit);
         tcg_temp_free(t_mxu_cr);
     }
+
+    return true;
+}
+
+/*
+ * Main MXU decoding function
+ */
+static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
+{
+    if (extract32(insn, 0, 6) == OPC__MXU_MUL) {
+        uint32_t  rs, rt, rd, op1;
+
+        rs = extract32(insn, 21, 5);
+        rt = extract32(insn, 16, 5);
+        rd = extract32(insn, 11, 5);
+        op1 = MASK_SPECIAL2(insn);
+
+        gen_arith(ctx, op1, rd, rs, rt);
+
+        return;
+    }
+
+    decode_ase_mxu(ctx, insn);
 }
 
 #endif /* !defined(TARGET_MIPS64) */
-- 
2.26.2


