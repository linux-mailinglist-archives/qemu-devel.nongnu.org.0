Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F3E6DB860
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 04:51:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkyYf-0007nl-9I; Fri, 07 Apr 2023 22:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYc-0007lT-LB
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:44:02 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYD-0005jQ-BW
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:44:02 -0400
Received: by mail-pj1-x102e.google.com with SMTP id v9so5046522pjk.0
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eotj0MrHKLP1v2S4T/0WUNCjwFrcd26O8tCK+46bnIc=;
 b=uojDrGl3eBNqzY5LM9a1aMvyIB1I/hWsByM81JC12eAyd5BoqzrCT5BChoHq7dcm0Y
 uCx6eIiIvNrMi+8kRfadXvogKYZE4luZi9tEhRCt/wAkO435ld0GTwT2EBTHYwIoHmn+
 1hisCidySMHAdRwmjRkdUrz3U3lA3+rx8qlM+Nd2EJFSTBwQ+9mnAHZYUxNJDy5qzVv2
 xXQkGXFeSYVB6z+czETKxlozaWXxs6rsWjWxOfOeD/iWE//tNbZaPNOkKkyl0ZLk//s+
 amg8AEQ6WhtpGGybh5e245WB9UUZiVDo2AzxsDLmNyHxS/+Qp+se6w4TorJ2ZDrvoWS9
 Tymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eotj0MrHKLP1v2S4T/0WUNCjwFrcd26O8tCK+46bnIc=;
 b=fA3QYAvOSTdoKsrlBvy9fJJgWfpuGZJnk0wx1YPPFpyW6aPzenh74ZtiZmclIePQsP
 KaAg3XqcOwIjZw//mEUl6w2uB1WzwwFLInGuyDb1zUBiEqlz621mmRjiRhkoRcfyeiVy
 Z4fY9A085IP36HY4kkHe1U+qIOcvRhrAKHkKz/CZYNn6+H++LDJ8623kAI7pa8Ha/YKf
 UQ/1wPaHZVdUCWtptp1NhCLBrHeJcDpJWKVd18yyDS4q7IJmJSRLRz3D06nLUtkBN4Yd
 3Zfb0waewd7cg382/Twf137ugpbU8Kyd98T5IYA+IdWub2gYEyN7Pb0xtGUpWlnQXgI3
 5yEA==
X-Gm-Message-State: AAQBX9fvTCKgtIdyOrTOhT6LDheH9vVM++gxMxfazZHz37HOfh/gxS6A
 G+1eka663pHRxLQA0wB/AaVAzUR22XPV9IMDskE=
X-Google-Smtp-Source: AKy350bCKI5ayzFWMaJIapVTsafkgaKUZ3RSW0zFbrTneZu5N7Jvatqy6OUjOr/aU/dx4uC+zk3yiA==
X-Received: by 2002:a17:902:f291:b0:19c:d7a9:8be1 with SMTP id
 k17-20020a170902f29100b0019cd7a98be1mr3829634plc.61.1680921815975; 
 Fri, 07 Apr 2023 19:43:35 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 22/42] tcg/aarch64: Pass TGType to tcg_out_qemu_st
Date: Fri,  7 Apr 2023 19:42:54 -0700
Message-Id: <20230408024314.3357414-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

This evens out the interface to match tcg_out_qemu_ld,
and makes the argument to add_qemu_ldst_label less obscure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 40122e1471..f8d3ef4714 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1884,7 +1884,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi)
+                            MemOpIdx oi, TCGType d_type)
 {
     MemOp memop = get_memop(oi);
     const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
@@ -1899,8 +1899,8 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 0);
     tcg_out_qemu_st_direct(s, memop, data_reg,
                            TCG_REG_X1, otype, addr_reg);
-    add_qemu_ldst_label(s, false, oi, (memop & MO_SIZE)== MO_64,
-                        data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, d_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(memop);
     if (a_bits) {
@@ -2249,7 +2249,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, REG0(0), a1, a2);
+        tcg_out_qemu_st(s, REG0(0), a1, a2, ext);
         break;
 
     case INDEX_op_bswap64_i64:
-- 
2.34.1


