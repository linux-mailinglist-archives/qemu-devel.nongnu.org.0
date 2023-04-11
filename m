Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5206DCECF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:11:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2T6-0005wt-8N; Mon, 10 Apr 2023 21:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sy-0005eB-4E
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:36 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sq-0000oU-KM
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:34 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o2-20020a17090a0a0200b00246da660bd2so570371pjo.0
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P00Nt+KeWeWNDZD/WYZHk0mydxgmnXGCysO1QPGCtNE=;
 b=PRhj7ohXwj3kkdfx0to3IrE0vuH4JPfgEmN4r+Fkz7QaC90R9Jx036qqxlphxq5ozp
 coTqVhY13VVSYX4eh+/U+Plq6weilrvhuZa3roeDWRZDhe/raol4nnMXKSY77LaZgVOc
 0sg0yVQDIE1gZ/SzP1NVQO/YI8elWzWhRUz80URkkGvcsMGD11v3l33fTl9hk0qKqS/c
 KQxwuzJIm5KB4cm9nb1pcPbDL/OuUgYosn1+y9oq40kSj0wh1tg0d7AhZeWPRmkumLs9
 DsZ4Im+IrfFolL43TUtlcAOKK3P6cbs8Q/2EfMssXaUd8VBzzyqywiyQJZ/0UZwpL6r3
 f+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P00Nt+KeWeWNDZD/WYZHk0mydxgmnXGCysO1QPGCtNE=;
 b=oqS41iw4c6XGgm4JHtsCccDtiX32FwkCdsnWuzK+Kgzx65+rFNThNFNy/Pb+I0rm3R
 rf0u9naeJ/nDQQmTWOtHdOMm3LAl1JTwO1AIHFznhY0h5jSghazCvrEKnCRSCaywertA
 wQtsNxa3Lbs69XTlbFELxyXBHR3nxyCYLCLLE3PhA94JncGo6nfn8Idw5OnhBNP03A+x
 z+eQSxgpmyZ0K4Gi0yk43lOKqWqsskx6Bwg9V5QHAGDiw4p/MhHEB+GCSLLvcgBc/wco
 u3O/e8n6aFbT4h6VkSLVOuGitwwimO8wyB+zRu5vqYFBrVsGWrgawmr/chX1dgISAXd6
 YYkA==
X-Gm-Message-State: AAQBX9eNQ+6kWYyB1mG4LLj5MOTpfFq91RwEYe9lrZmUahSwYKcTo8wy
 IWXqL8G9i5A7SyXFNQN1UADKQ3ZHaNV6z9BV+VhkPw==
X-Google-Smtp-Source: AKy350ZbOuXkrSVclgB7kGBdOzNtOhKcY4XTSD9AJhsXKd+PAOSYPnFBUU6jkktsL7FsIBf4fFksNQ==
X-Received: by 2002:a05:6a20:8f02:b0:e9:14e9:46ee with SMTP id
 b2-20020a056a208f0200b000e914e946eemr12514650pzk.28.1681175187664; 
 Mon, 10 Apr 2023 18:06:27 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 26/54] tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
Date: Mon, 10 Apr 2023 18:04:44 -0700
Message-Id: <20230411010512.5375-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
 tcg/s390x/tcg-target.c.inc | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index b399798664..d610fe4fbb 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1770,13 +1770,14 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
 }
 
 static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
-                                TCGReg data, TCGReg addr,
+                                TCGType type, TCGReg data, TCGReg addr,
                                 tcg_insn_unit *raddr, tcg_insn_unit *label_ptr)
 {
     TCGLabelQemuLdst *label = new_ldst_label(s);
 
     label->is_ld = is_ld;
     label->oi = oi;
+    label->type = type;
     label->datalo_reg = data;
     label->addrlo_reg = addr;
     label->raddr = tcg_splitwx_to_rx(raddr);
@@ -1900,7 +1901,7 @@ static void tcg_prepare_user_ldst(TCGContext *s, TCGReg *addr_reg,
 #endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
 #ifdef CONFIG_SOFTMMU
@@ -1916,7 +1917,8 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 
     tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
 
-    add_qemu_ldst_label(s, 1, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, 1, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
     TCGReg index_reg;
     tcg_target_long disp;
@@ -1931,7 +1933,7 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 }
 
 static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
 #ifdef CONFIG_SOFTMMU
@@ -1947,7 +1949,8 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 
     tcg_out_qemu_st_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
 
-    add_qemu_ldst_label(s, 0, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, 0, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
     TCGReg index_reg;
     tcg_target_long disp;
@@ -2307,13 +2310,16 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        /* ??? Technically we can use a non-extending instruction.  */
+        tcg_out_qemu_ld(s, args[0], args[1], args[2], TCG_TYPE_I32);
+        break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args[0], args[1], args[2]);
+        tcg_out_qemu_ld(s, args[0], args[1], args[2], TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
+        tcg_out_qemu_st(s, args[0], args[1], args[2], TCG_TYPE_I32);
+        break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args[0], args[1], args[2]);
+        tcg_out_qemu_st(s, args[0], args[1], args[2], TCG_TYPE_I64);
         break;
 
     case INDEX_op_ld16s_i64:
-- 
2.34.1


