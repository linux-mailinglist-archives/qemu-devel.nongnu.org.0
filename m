Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688E56DB85E
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 04:51:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkyYi-0007t7-Or; Fri, 07 Apr 2023 22:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYg-0007pP-Ab
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:44:06 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYF-0005YH-Gc
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:44:06 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 d22-20020a17090a111600b0023d1b009f52so2769548pja.2
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kRhYzkFI7SReCS0UgAbm5E5KG3teujgs6bUm8xjSxNw=;
 b=vNYqaR0g9IXdZYfDXEptsNtr9u4Jj5OyU2IN6tO/mh4epKWvXhNTQvNjjcaK86lRek
 kclVimXZ9nlen18a84FE5qnXqQd4kVf6W8daJxEyN+41EbGHRvfrrm2iy5QDnCn7WFSz
 vIFPdPXB3+epG+mdS/HymN4Z7DUW5xXKVUMTU9rC7TSjgcrMrVF5/IvXrLqexO6G+8fV
 SynCfezLuYBfU5QECBaV/UeN2zI/jAR3ge8tgr5/e93y+guLE6qUvVQNfSLtt8TSjAJm
 t4A+Oq+vKWIn6/ma6Khm8BxbLPqFAbvwF/Ux93TAvOWEmdeRs5GSK/xYqytQXW6a/Arl
 SJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kRhYzkFI7SReCS0UgAbm5E5KG3teujgs6bUm8xjSxNw=;
 b=Obf6DWZwBRUAdhBiQpsAorcrOJRX/wpIQrax0m45Y/pCxDclh9qeuOLi4JLraUBGNN
 x81pw1Tk5LMGQZ+86K6cgXtLNEzVPC/sppcGoMkSBw84VCoa8TfhdTkqFCPTYARjbk7O
 JpTDKQThgFvDCl73FE8HS7qI/B6K5LoNTUw1GIKqpU0iNMP0Od+WAhUUJ4FiJ4wLLULI
 w8WK3zZhTTLmjAfAe4SU3yaqBXG9TjATvWVt6Sfu5fXk/t3u/IY7f8p8PApynrC12m/H
 +f/n+s9vd2ANe8a3nW5AQElyyZW8i5mSqy5rIB8UmEZs4btbcsxtInTLqJE2HaaHqfbU
 U2/Q==
X-Gm-Message-State: AAQBX9ecnyzQDnvstqL2Iu6ZHxutcmWdzXeRCyy47GxFoaQBFeKRWS1d
 7XlzOavZUGHCCOgqaduUjiG0d1fLMmsmrBY3mgo=
X-Google-Smtp-Source: AKy350Zv9u9Ei+8sqeDL+BJvO3pEnrU2Z2q0DrKXcJKaV+9zrw6TW+VIFU0X05Z9g7OeD5W9gvjvZQ==
X-Received: by 2002:a17:903:22c3:b0:1a1:ae8d:1379 with SMTP id
 y3-20020a17090322c300b001a1ae8d1379mr6442419plg.7.1680921818613; 
 Fri, 07 Apr 2023 19:43:38 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 25/42] tcg/ppc: Use TCGType not bool is_64 in tcg_out_qemu_{ld, st}
Date: Fri,  7 Apr 2023 19:42:57 -0700
Message-Id: <20230408024314.3357414-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index d3e547998f..7c33404bd6 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2117,7 +2117,8 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
 /* Record the context of a call to the out of line helper code for the slow
    path for a load or store, so that we can later generate the correct
    helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
+                                TCGType type, MemOpIdx oi,
                                 TCGReg datalo_reg, TCGReg datahi_reg,
                                 TCGReg addrlo_reg, TCGReg addrhi_reg,
                                 tcg_insn_unit *raddr, tcg_insn_unit *lptr)
@@ -2125,6 +2126,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
     TCGLabelQemuLdst *label = new_ldst_label(s);
 
     label->is_ld = is_ld;
+    label->type = type;
     label->oi = oi;
     label->datalo_reg = datalo_reg;
     label->datahi_reg = datahi_reg;
@@ -2287,7 +2289,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 #endif /* SOFTMMU */
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType d_type)
 {
     TCGReg datalo, datahi, addrlo, rbase;
     TCGReg addrhi __attribute__((unused));
@@ -2301,7 +2303,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 #endif
 
     datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
+    datahi = TCG_TARGET_REG_BITS == 64 || d_type == TCG_TYPE_I32 ? 0 : *args++;
     addrlo = *args++;
     addrhi = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
     oi = *args++;
@@ -2363,12 +2365,12 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
     }
 
 #ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, true, d_type, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #endif
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType d_type)
 {
     TCGReg datalo, datahi, addrlo, rbase;
     TCGReg addrhi __attribute__((unused));
@@ -2382,7 +2384,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 #endif
 
     datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
+    datahi = TCG_TARGET_REG_BITS == 64 || d_type == TCG_TYPE_I32 ? 0 : *args++;
     addrlo = *args++;
     addrhi = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
     oi = *args++;
@@ -2436,7 +2438,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     }
 
 #ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, false, oi, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, false, d_type, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #endif
 }
@@ -2971,16 +2973,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, false);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, true);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, false);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, true);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I64);
         break;
 
     case INDEX_op_setcond_i32:
-- 
2.34.1


