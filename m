Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF0A3AD91B
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:44:58 +0200 (CEST)
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXX7-0000Fd-RB
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1luXQ1-0003iq-QQ
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:37:37 -0400
Received: from rev.ng ([5.9.113.41]:39807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1luXPx-0003sL-M7
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i9LTWpy1AetAhpnwJyeMaTx3IXPyu5Av3KO+AbJtKLI=; b=mUTbpLCnGSr0cbXeRIuh6FvufR
 0ArON6gxuF4psmqWsgsJFa2mvczwPAGbRW5OgsruOaKBHxvOHuTL80qrlhqrPetobBphoF/6s2XRq
 U9/NLx62Ph8rwKB94rOCQBJfMifZChLRzNKGTtIhhQUDq7JCY7/9g+RR0avchZDFy1m0=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v5 04/14] target/hexagon: make slot number an unsigned
Date: Sat, 19 Jun 2021 11:37:03 +0200
Message-Id: <20210619093713.1845446-5-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-1-ale.qemu@rev.ng>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
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
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/genptr.c | 6 ++++--
 target/hexagon/macros.h | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 797a6c0cc9..3b8013d4e2 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -33,7 +33,8 @@ static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
     return pred;
 }
 
-static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
+static inline void gen_log_predicated_reg_write(int rnum, TCGv val,
+                                                unsigned slot)
 {
     TCGv zero = tcg_const_tl(0);
     TCGv slot_mask = tcg_temp_new();
@@ -66,7 +67,8 @@ static inline void gen_log_reg_write(int rnum, TCGv val)
     }
 }
 
-static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
+static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val,
+                                              unsigned slot)
 {
     TCGv val32 = tcg_temp_new();
     TCGv zero = tcg_const_tl(0);
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index b726c3b791..eadb7e5d05 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -186,7 +186,7 @@
 #define LOAD_CANCEL(EA) do { CANCEL; } while (0)
 
 #ifdef QEMU_GENERATE
-static inline void gen_pred_cancel(TCGv pred, int slot_num)
+static inline void gen_pred_cancel(TCGv pred, unsigned slot_num)
  {
     TCGv slot_mask = tcg_const_tl(1 << slot_num);
     TCGv tmp = tcg_temp_new();
-- 
2.31.1


