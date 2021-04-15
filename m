Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AA036110E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:23:00 +0200 (CEST)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5hh-00080C-Vw
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lX4xY-0004DB-4U
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:35:16 -0400
Received: from rev.ng ([5.9.113.41]:60547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lX4xT-0006eb-Q8
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m2yRXnIbNbZIWeyfV8xdgvOS2RzdG35bJ8KtiwrTQJs=; b=L3QRgFQA7WbPsY+gbJJb8vMOCu
 9vBsTygkU4tpJuTasZPP8X6pcM8eVdGzQLLtC69vIeq9avbZr0ZTfD1azYBqseTODHXFTXmqCBHSp
 7jUxB1ZnO5hR3/jsd8/vXZV1HwkrURnPlMJWHGoTlJHMVaIUbP3BrsLmwJvNug6IGe/I=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v4 04/12] target/hexagon: make slot number an unsigned
Date: Thu, 15 Apr 2021 18:34:47 +0200
Message-Id: <20210415163455.3839169-5-ale.qemu@rev.ng>
In-Reply-To: <20210415163455.3839169-1-ale.qemu@rev.ng>
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

From: Paolo Montesel <babush@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
---
 target/hexagon/genptr.c | 6 ++++--
 target/hexagon/macros.h | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 7481f4c1dd..fd18aabe8d 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -33,7 +33,8 @@ static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
     return pred;
 }
 
-static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
+static inline void gen_log_predicated_reg_write(int rnum, TCGv val,
+                                                unsigned slot)
 {
     TCGv one = tcg_const_tl(1);
     TCGv zero = tcg_const_tl(0);
@@ -62,7 +63,8 @@ static inline void gen_log_reg_write(int rnum, TCGv val)
 #endif
 }
 
-static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
+static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val,
+                                              unsigned slot)
 {
     TCGv val32 = tcg_temp_new();
     TCGv one = tcg_const_tl(1);
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index cfcb8173ba..d9473c8823 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -154,7 +154,7 @@
 #define LOAD_CANCEL(EA) do { CANCEL; } while (0)
 
 #ifdef QEMU_GENERATE
-static inline void gen_pred_cancel(TCGv pred, int slot_num)
+static inline void gen_pred_cancel(TCGv pred, unsigned slot_num)
  {
     TCGv slot_mask = tcg_const_tl(1 << slot_num);
     TCGv tmp = tcg_temp_new();
-- 
2.31.1


