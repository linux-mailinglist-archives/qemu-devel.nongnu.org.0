Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722AD30EA36
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:32:28 +0100 (CET)
Received: from localhost ([::1]:40906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7URX-00079r-Gg
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjL-0005T6-NC
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:47 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjB-0003yt-Ag
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:47 -0500
Received: by mail-pj1-x1029.google.com with SMTP id e9so831283pjj.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MYKpHAJMq3pQVgdvIIf5gybikCrqAwnvbyA/L0Pt44U=;
 b=UyMRMwmCyGcDa4iG4k5N4wkEpvciyi0+x9BMfS9h4V6DGUlTsBx/27Tda+lsuPVJia
 nj9BaEbWi4cFiYEOc/Q7NHI0jSNjV3P9jTL8m4dBA/2W3ryepx5Cmdu8oFzCvoR72SmW
 fZCeeAldy35o5ucZ2XJP5Ci5LMoyw/Mi5AtrcKEqHCxf0xKLSmqFuRWeo4zzr5ULPqrm
 CnA0iYzTMqB5qtgePizmZDTeA209PY7kioUPSwMUflO9Ow+eNVVR8e6Y347Fdo1OeFiv
 QF6atC99H7MMy3N01T1pAEV18f1dYOKVVLBZ0EQn2aV0kGd5LEbLBth/Wxi9JFpJPa5I
 ZXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MYKpHAJMq3pQVgdvIIf5gybikCrqAwnvbyA/L0Pt44U=;
 b=EuRjDRbd/BV95RFZcHCky5MMeZMlgHonp6N8HQH6hkxapy96MmfZergaIZpRvLUSZA
 Rb1kriOwaS+jrBxm/DTuu/vBWuA8SMJQcxhpeQohaEqAtywlDoZ/cnDb9DmDEZLz16OK
 y6KKe0eOALJGShSXX4WTTj9Uwaz5anQS43E8b3WNtCunObb5dMXEGgMA3Tnsey6SG5NS
 31BtSNaon8mZkskigNrVH6u+ahQxr8eULGkPq64giZ6rsOpZoYV08poXueGmu3DOL0Mf
 igcKT2Bm35VE1SJWdClYN/gtaBcj82sQWfwTw55QUwoClrdTUdgdh/TnAtd4LiXeM8FK
 3jAA==
X-Gm-Message-State: AOAM533T1FbBgtpIfnAFj7MeSe3VLp1VVOi55UaWwbVKprbAdRt8shMe
 OWztnsjThBU8oUVnwJw2vfoPkFoXTTq+M3+w
X-Google-Smtp-Source: ABdhPJzeFz+Is0Ggo1UcpaW8roB64BudxXwU30GyYgQDvxvdqMeO8NMdd5KarQzcAdDj2V0HqK0ELQ==
X-Received: by 2002:a17:90a:4dc5:: with SMTP id
 r5mr5849368pjl.114.1612403195190; 
 Wed, 03 Feb 2021 17:46:35 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 46/93] tcg/tci: Split out tci_args_rrrc
Date: Wed,  3 Feb 2021 15:44:22 -1000
Message-Id: <20210204014509.882821-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 1736234bfd..86625061f1 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -207,6 +207,15 @@ static void tci_args_rrs(const uint8_t **tb_ptr,
     *i2 = tci_read_s32(tb_ptr);
 }
 
+static void tci_args_rrrc(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *c3 = tci_read_b(tb_ptr);
+}
+
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
 {
     bool result = false;
@@ -430,11 +439,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tb_ptr = (uint8_t *)label;
             continue;
         case INDEX_op_setcond_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            tci_write_reg(regs, t0, tci_compare32(t1, t2, condition));
+            tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
+            regs[r0] = tci_compare32(regs[r1], regs[r2], condition);
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_setcond2_i32:
@@ -446,11 +452,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
+            tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
+            regs[r0] = tci_compare64(regs[r1], regs[r2], condition);
             break;
 #endif
         CASE_32_64(mov)
-- 
2.25.1


