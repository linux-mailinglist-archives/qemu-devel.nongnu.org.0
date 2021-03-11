Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82039337691
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:11:22 +0100 (CET)
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMy9-0005lb-HS
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVJ-000416-K8
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:33 -0500
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:46036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVD-0006ri-Lj
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:33 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id t16so2632708qvr.12
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kQwYPaxcLPGVIBaZFpt4Ukjta9EglPQhHZw+11ye7O8=;
 b=hM5ir3Pb6N4yNI2AUagTzdwa+SLromBoBNfeCrFrNXoblUKXFY7C5c3eKY6ufNk/0/
 mJnx57ZfcWRG1PJFamrtEf+M0qSjDcTl+2IvKMtS+zhB0BKTM/LGtbFZjE9nfLy4cus+
 KkH8pDSkM6uUWglhP4HGQvKbt1usQ1yY2yxnGMowU+YGjN7l0iSobuWs5kG6L86ouZ6r
 6/Ib7VWBs66QnG8R3Vv8hSE6kId2UF6SpKIhh6oWU1k5uWY493XjAL6ETXDuh53aIni4
 8LJAPGQAQ6dg+kySPzZharMMi9VwzgfdH4iyNW4v0FwW5XEptWz52Mqk+BXK8P77B4Ie
 q1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kQwYPaxcLPGVIBaZFpt4Ukjta9EglPQhHZw+11ye7O8=;
 b=r6MgLp/jkBquZZb4mjKf5Trk2zI9eGP3N34FsXf+723+8TSjeggyOEh0MrvTpVPE7Q
 WarTxKDV+0gmSWOg5KfzXxCdLOzmeKw1Ukatf13PWUjEhVlzDXxgyMa2mlHkty/SYVc3
 qX6+yRq/NgPNRorDUETiaFYcfhRNOdvjGxpflU58En2wI+syYLa0DvVCP4Qh+U8xzbX2
 kdgsp8NjtkbwD59/6N9w1ffT2ocXkKatWSZa3k521GDYaSHJ066oE9RYhA3sS8oX5fwp
 3xhBieq3tkciiBYPHMUPtLNRQJVUpOiG/gxVti9lBzDHRfNqeDcEdEvDu3vQ4cbzySeV
 6A1g==
X-Gm-Message-State: AOAM532qCIZI69wlxrXvkahNMlKNJ6hZ2V6Ch+IxW7uhNsa0NRXTHUDS
 j3YeSQ8tRTBMltJy93+c/p1qjrsuuSBZituM
X-Google-Smtp-Source: ABdhPJzQdt+FsUJvZUR5VoSV07zdqdecLRWUb1jmOoWOk4g+Tnuw6PMAzNOrnYJRCEhR05+8J9yJdg==
X-Received: by 2002:a0c:c1cc:: with SMTP id v12mr7716706qvh.47.1615473686763; 
 Thu, 11 Mar 2021 06:41:26 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 41/57] tcg/tci: Split out tcg_out_op_np
Date: Thu, 11 Mar 2021 08:39:42 -0600
Message-Id: <20210311143958.562625-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index eeafec6d44..e4a5872b2a 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -312,6 +312,18 @@ static void tcg_out_op_v(TCGContext *s, TCGOpcode op)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_np(TCGContext *s, TCGOpcode op,
+                          uint8_t n0, const void *p1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out8(s, n0);
+    tcg_out_i(s, (uintptr_t)p1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
 {
     uint8_t *old_code_ptr = s->code_ptr;
@@ -561,7 +573,6 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
 
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
     const TCGHelperInfo *info;
     uint8_t which;
 
@@ -574,11 +585,8 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
         tcg_debug_assert(info->cif->rtype->size == 8);
         which = 2;
     }
-    tcg_out_op_t(s, INDEX_op_call);
-    tcg_out8(s, which);
-    tcg_out_i(s, (uintptr_t)info);
 
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    tcg_out_op_np(s, INDEX_op_call, which, info);
 }
 
 #if TCG_TARGET_REG_BITS == 64
-- 
2.25.1


