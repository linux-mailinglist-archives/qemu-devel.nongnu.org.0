Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF64431F31A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:31:20 +0100 (CET)
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCslT-0000Lr-Vx
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsjB-0007W8-0q
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:28:58 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsj7-000347-6p
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:28:55 -0500
Received: by mail-wr1-x433.google.com with SMTP id t15so4710144wrx.13
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ZhtTOmOcuAwJkpiP3SNlP+RXPtaVYBvq0r03hY5TCU=;
 b=Xy77iNFrcNh6DU+f2pRM4mzdONTmbkmqMjCTmhi/9n2a61V9jMfLh2TMrx2pCVqoXP
 l+pkChwD+A3I8Woco3Xa6GhPG+W2PRPiBR3QoHV23JLZS8G4x3CbBrkWvIFfmrDs5zX2
 MopjpgmP0v+BhEi5twwVd5A5DeJiQaFOe6ML11p3bWynQVLC9kaIKM0rmjrdlYo4n+4F
 cP6YJz6VFKaC1+hI6ihxnEBb2nT3nVjwIPktw9v6w7RenOR9qpv5jXJE/2wy+8IIvWFF
 CmT7judjGX5YySl0oQ0egE2PkPQ9+WqzkZ3V6fsyLzPaz6nmStN+fJeAjfwi40lc+E72
 XESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3ZhtTOmOcuAwJkpiP3SNlP+RXPtaVYBvq0r03hY5TCU=;
 b=ieYSCS1hOmOCT5wyFybQoE2b0repzIh76plkz0q0wq5JYonS2ATsDrhA4eN2vFyKcS
 S7IweIxlfET4wUmelC0uZV2daTGshaZP5Ld9riNBYmq52V6a4HZUj0n0gx3Fxpf78LLP
 pKuhQVuvn5sgwP7Gqvceq6SYLEvDXQ0e3w7I+mLMBMaEuCNDUDoREx+8dIhL4bd5hvpz
 0ZRn18ZdE6oMzp2raYXAVlZY+v2fiivzlSw5H5hl921gu1IdbtY5EyPcGMUWKgTbfVH9
 Dc3AklMRkFnRVp/3EOutLyyDM7Nf7yztmRRmO3jfbEbVgrFB67JB0akticGDcY1OIEiE
 X0vA==
X-Gm-Message-State: AOAM531mVMdXEm4zgKyTmvQCCMfeFGSbX0AujAWq6jxO/kJ60ILzWBlC
 X4j6/iVSQdQfhUjEVjSHnukakKPF3GY=
X-Google-Smtp-Source: ABdhPJxcn4zWhqiWcWrCJccP7l8lc3dzFWI6MIgPq44m2DpjfuKFUCQJrer7B1RN44eoEXTSCPdyWw==
X-Received: by 2002:a5d:550c:: with SMTP id b12mr6670838wrv.200.1613690931573; 
 Thu, 18 Feb 2021 15:28:51 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j17sm9307200wmc.28.2021.02.18.15.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 15:28:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 2/5] tcg/tci: Merge identical cases in generation (exchange
 opcodes)
Date: Fri, 19 Feb 2021 00:28:37 +0100
Message-Id: <20210218232840.1760806-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210218232840.1760806-1-f4bug@amsat.org>
References: <20210218232840.1760806-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
cases that are identical between 32-bit and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210217202036.1724901-5-richard.henderson@linaro.org>
[PMD: Split patch as 2/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/tci/tcg-target.c.inc | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index ea42775cb03..1896efd1006 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -520,28 +520,21 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out8(s, args[2]);           /* condition */
         tci_out_label(s, arg_label(args[3]));
         break;
-    case INDEX_op_bswap16_i64:  /* Optional (TCG_TARGET_HAS_bswap16_i64). */
-    case INDEX_op_bswap32_i64:  /* Optional (TCG_TARGET_HAS_bswap32_i64). */
-    case INDEX_op_bswap64_i64:  /* Optional (TCG_TARGET_HAS_bswap64_i64). */
-    case INDEX_op_not_i64:      /* Optional (TCG_TARGET_HAS_not_i64). */
-    case INDEX_op_neg_i64:      /* Optional (TCG_TARGET_HAS_neg_i64). */
-    case INDEX_op_ext8s_i64:    /* Optional (TCG_TARGET_HAS_ext8s_i64). */
-    case INDEX_op_ext8u_i64:    /* Optional (TCG_TARGET_HAS_ext8u_i64). */
-    case INDEX_op_ext16s_i64:   /* Optional (TCG_TARGET_HAS_ext16s_i64). */
-    case INDEX_op_ext16u_i64:   /* Optional (TCG_TARGET_HAS_ext16u_i64). */
-    case INDEX_op_ext32s_i64:   /* Optional (TCG_TARGET_HAS_ext32s_i64). */
-    case INDEX_op_ext32u_i64:   /* Optional (TCG_TARGET_HAS_ext32u_i64). */
-    case INDEX_op_ext_i32_i64:
-    case INDEX_op_extu_i32_i64:
 #endif /* TCG_TARGET_REG_BITS == 64 */
-    case INDEX_op_neg_i32:      /* Optional (TCG_TARGET_HAS_neg_i32). */
-    case INDEX_op_not_i32:      /* Optional (TCG_TARGET_HAS_not_i32). */
-    case INDEX_op_ext8s_i32:    /* Optional (TCG_TARGET_HAS_ext8s_i32). */
-    case INDEX_op_ext16s_i32:   /* Optional (TCG_TARGET_HAS_ext16s_i32). */
-    case INDEX_op_ext8u_i32:    /* Optional (TCG_TARGET_HAS_ext8u_i32). */
-    case INDEX_op_ext16u_i32:   /* Optional (TCG_TARGET_HAS_ext16u_i32). */
-    case INDEX_op_bswap16_i32:  /* Optional (TCG_TARGET_HAS_bswap16_i32). */
-    case INDEX_op_bswap32_i32:  /* Optional (TCG_TARGET_HAS_bswap32_i32). */
+
+    CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
+    CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
+    CASE_32_64(ext8s)    /* Optional (TCG_TARGET_HAS_ext8s_*). */
+    CASE_32_64(ext8u)    /* Optional (TCG_TARGET_HAS_ext8u_*). */
+    CASE_32_64(ext16s)   /* Optional (TCG_TARGET_HAS_ext16s_*). */
+    CASE_32_64(ext16u)   /* Optional (TCG_TARGET_HAS_ext16u_*). */
+    CASE_64(ext32s)      /* Optional (TCG_TARGET_HAS_ext32s_i64). */
+    CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
+    CASE_64(ext_i32)
+    CASE_64(extu_i32)
+    CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
+    CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
+    CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         break;
-- 
2.26.2


