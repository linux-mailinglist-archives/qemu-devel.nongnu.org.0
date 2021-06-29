Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE403B78E8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:55:31 +0200 (CEST)
Received: from localhost ([::1]:46344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJpS-00069e-Mt
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwQ-00041p-IB
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:40 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:40917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwH-0002zE-8a
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:38 -0400
Received: by mail-pl1-x631.google.com with SMTP id m17so39828plx.7
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q38h6dtquTVJ+FlY8+y6d1PvihW63oSAgr0zeRiMB4s=;
 b=Nf4i6+uDEyOy0dbFkTC29NvGNi6XBKyZT0IPSOlrmtHobo5Wkyrp4rsh3DolTKnJok
 BVmUtPx750QAZQFh1N13WWa+ySPXnrD+KKE9rxEyXZ5ftYnWcm3Oyr+7OuWSQPGcwS7C
 bC//FLP+1azqZHi8xaO5p0A53HFaM3F6ykuvT8OYm+KYkDzkCxgXAy87tircG4Aq/7jX
 /F/ti/ehcmMQ3EhAPn0/hy63pkV1rGxELZ1JJZMDRgeldcfNnXNXwRjo85MD3c9PicfX
 yjBGcT2flabqYk2iJdHjoqjYvAy5jfELdUhtwyualShpGuM9QAlS+jG8DlQSw06hfdoJ
 Gyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q38h6dtquTVJ+FlY8+y6d1PvihW63oSAgr0zeRiMB4s=;
 b=p2UZfjfiP95oNCyPm3gYuwyPrLYX3QmTHwioyKe2UQ7yYu40HjYoDJmoEmo7uEA4Ay
 71x1bA1zQ4LcA9KQZFteur1VNdqRUXESp2Ezy4ll89zCjYULqWIJqc01uC5LAaPZx/My
 8Kguf9Iv79b0AEHmQz9jr4ajNSMbVkuvYZ3zHOdpKzodkTevfutKAJAPqWDZqZ0ho6M6
 HlO5pwZQsO/SqDr9mF42662ToCUgJlHCp8bzf2+fqF840Ltiv05dJpF3To2L7fH9LRda
 GEjawZIjavDkBpvuDWFdxJ0AZhdNu6Qvcr9REHFsfJAJOhxXoq19YnvqU2zM2PQSkq2G
 nPhA==
X-Gm-Message-State: AOAM530FTQ3hIfuuQtO9PtzbzTXiZ6dUXnegQVFkFhb65EFjj0OsmIRk
 OWM9iwpV/SgEdTVQmKXI+5KcYPqLzVHx7g==
X-Google-Smtp-Source: ABdhPJy0uAonCqxYOpr5aadwXygJnevikTZRZS4JUXigMPzSDJdUDulpwHLR3BwqSSiByzFGOwy2PA==
X-Received: by 2002:a17:90a:9205:: with SMTP id
 m5mr327093pjo.172.1624993106503; 
 Tue, 29 Jun 2021 11:58:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 47/63] tcg/s390: Support bswap flags
Date: Tue, 29 Jun 2021 11:54:39 -0700
Message-Id: <20210629185455.3131172-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For INDEX_op_bswap16_i64, use 64-bit instructions so that we can
easily provide the extension to 64-bits.  Drop the special case,
previously used, where the input is already zero-extended -- the
minor code size savings is not worth the complication.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


