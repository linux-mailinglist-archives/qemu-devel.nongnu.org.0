Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7E13B4D31
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:44:50 +0200 (CEST)
Received: from localhost ([::1]:45748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx23d-0005ya-DX
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vp-00027S-Sh
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:45 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vl-0000Kq-Qf
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:45 -0400
Received: by mail-pl1-x633.google.com with SMTP id m17so5858963plx.7
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fKXm09pMOK4ksFCzxARsXwYKBxXp1s4tMZtK+qSSxSU=;
 b=Mtqe7df4Z33TlmI1GJhl+E+QKbKD28nv0x4efp0eYHngC35caxVi36lMNNV4shSpPC
 qA7bV2E4sNLmtxmryYb4B8qYcM/W/4uUhJ/AEj4cw+lAmhkTXSOJBcvOQwRFX++tX3Th
 DJtTcbILU62kYzoyRGs+UKCBvnaeb6mzqHmnYmSUSBYONsuO7j3rAtUh4agXsyARLNaA
 R3kTDXVwsFOSIMjR3sbn8jOSx4t0K24A+e/W+RBN9emBYCR0+ze/G5gzB2XRjO2sgMhu
 nGPgzjkW6NMAJ/sqwPspNMU99Rn03+oZiQ9WkYjg9T4x7th88SlTmZswX4Fv6dlttZh4
 w+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fKXm09pMOK4ksFCzxARsXwYKBxXp1s4tMZtK+qSSxSU=;
 b=byuMfnuhj4xXLLfUb/t8Gnql4KmAqGSnTuB/zB7lt6r44QuEnVj3zzA2VobediRFgB
 VOGNFI4n+ja/J/EYdutrKtfr8fH4h7GrQeVlzsNURnvjdKIGU7vnluddBQGenStwpFe/
 lW1LfzYG65oZhlhnLcqdOrWxHuHpsuq+ZIKGj/RrRK+2c/znaHwPvei4y7beat9XaiJe
 cD4VNt2Syqh8cjUf/oTpUF3Ub9qwyR/CZdtVJPx5Ho3A0dRptUhv4JtNK2yMk29uNAeR
 /uqvhe4h07baprclaUczklMVmimVby9MYJ/hYeb8qNAd/0hFPdjT0GaZWiy23q6DT8Xe
 ATzw==
X-Gm-Message-State: AOAM530XYWeD6LUtxnJY0yBWKbN2nktVKnyNcj0Nelvv7LFzb06iBQX3
 I/7pK+NjwU7zji1HzmKdJRop/sKl5O0CBw==
X-Google-Smtp-Source: ABdhPJwyQITz2+wApSieJMhdTeueK9AMNGSCQGmVkK/f1H5Tl8/DoAa8oFtJjXImjHBs+mG/sdiDlw==
X-Received: by 2002:a17:902:265:b029:fa:9420:d2fd with SMTP id
 92-20020a1709020265b02900fa9420d2fdmr12383682plc.39.1624689400462; 
 Fri, 25 Jun 2021 23:36:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/29] tcg/s390: Support bswap flags
Date: Fri, 25 Jun 2021 23:36:15 -0700
Message-Id: <20210626063631.2411938-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For INDEX_op_bswap16_i64, use 64-bit instructions so that we can
easily provide the extension to 64-bits.  Drop the special case,
previously used, where the input is already zero-extended -- the
minor code size savings is not worth the complication.

Cc: qemu-s390x@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 5fe073f09a..b82cf19f09 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -1951,15 +1951,37 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tgen_ext16u(s, TCG_TYPE_I32, args[0], args[1]);
         break;
 
-    OP_32_64(bswap16):
-        /* The TCG bswap definition requires bits 0-47 already be zero.
-           Thus we don't need the G-type insns to implement bswap16_i64.  */
-        tcg_out_insn(s, RRE, LRVR, args[0], args[1]);
-        tcg_out_sh32(s, RS_SRL, args[0], TCG_REG_NONE, 16);
+    case INDEX_op_bswap16_i32:
+        a0 = args[0], a1 = args[1], a2 = args[2];
+        tcg_out_insn(s, RRE, LRVR, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tcg_out_sh32(s, RS_SRA, a0, TCG_REG_NONE, 16);
+        } else {
+            tcg_out_sh32(s, RS_SRL, a0, TCG_REG_NONE, 16);
+        }
         break;
-    OP_32_64(bswap32):
+    case INDEX_op_bswap16_i64:
+        a0 = args[0], a1 = args[1], a2 = args[2];
+        tcg_out_insn(s, RRE, LRVGR, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tcg_out_sh64(s, RSY_SRAG, a0, a0, TCG_REG_NONE, 48);
+        } else {
+            tcg_out_sh64(s, RSY_SRLG, a0, a0, TCG_REG_NONE, 48);
+        }
+        break;
+
+    case INDEX_op_bswap32_i32:
         tcg_out_insn(s, RRE, LRVR, args[0], args[1]);
         break;
+    case INDEX_op_bswap32_i64:
+        a0 = args[0], a1 = args[1], a2 = args[2];
+        tcg_out_insn(s, RRE, LRVR, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tgen_ext32s(s, a0, a0);
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            tgen_ext32u(s, a0, a0);
+        }
+        break;
 
     case INDEX_op_add2_i32:
         if (const_args[4]) {
-- 
2.25.1


