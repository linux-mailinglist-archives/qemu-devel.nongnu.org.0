Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EF931E10B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:08:56 +0100 (CET)
Received: from localhost ([::1]:45652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCU42-00049N-W0
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMj-0001cu-8c
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:05 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMh-0007hH-Li
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:05 -0500
Received: by mail-pj1-x102a.google.com with SMTP id l18so2402561pji.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtDE8Pm65Grc/U22TwT0AwuyG4b+N8yR6xVz8cz41eM=;
 b=YkC0I/kbNKCNW/rAtg3laom3na3zflU9AOWbx6VwcRMaHM+0muKvFuJjZBH49nQlY0
 A7I3oILz0njWSQ/F/etHtrvt5UdAteLtoSQvddcBLj65O58Qj71/ilIXafsuryDOUtoO
 p14n7Y8iLDkK+M3bSCCp5XcxCoxDJtEuCreCev8vO03oQzkQrUcgVQH3N9NOtzLBpGh5
 3GpkF4J+wUEzN7mcjkMMg9NsCcdp//BUlejcHhYgxQP52Db7rC1wXnAVHH5QkgDHwcrE
 qekmS1nl0g2X0zK4RN8O12dlMOvkpEHUDkU3RDTZ74FxJsvuKs4z43mwvK7Sp5Mcknkz
 CXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtDE8Pm65Grc/U22TwT0AwuyG4b+N8yR6xVz8cz41eM=;
 b=K617sX0VTCnJj6mJmLCWJAcUxp0wsSJwn9tykLc9QmvDkqHDTr0mG97uQGPFKKAZQr
 lSV46U/96C9uhdjQZIIVMUsaKgi7+5H6tSsVjNS2SUbMPWxIOURSpjzO+q9uatDY/Mkd
 mWRmiBc7k7ektbEET22QviqTlooPtcQ0tASvEYu3Uh9KTCoidomXDbHMpYTJJJWqNn/F
 6u6NaWrDb06kLrj2HU+9kXMpagup5fcqShz+D7Q2yGIjC4EfGp43+RGudgshqxLIYXGx
 7MUR2e5ovaSBcYg0AdiJH2euo2drpeL/f7OwqyAmuoX3uWEtTiL2W51Awbc/kIKQfhZt
 Xt5A==
X-Gm-Message-State: AOAM530U1RPHwi2OpswG978+7WOQON/3scbhAkYHRbMGosKXmOG0BeEZ
 6iVUYvPBkgqO3/UmwgmnHbCr2jp/eitD6w==
X-Google-Smtp-Source: ABdhPJzDPK2eXh9IhNEEt9tmIyZwAteg4nk7rVlkU+ygKjfrI60JFb0U4N2YlzBKC/7w0t0e0oJjwA==
X-Received: by 2002:a17:902:710a:b029:e3:858:8c91 with SMTP id
 a10-20020a170902710ab02900e308588c91mr928055pll.75.1613593442497; 
 Wed, 17 Feb 2021 12:24:02 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 54/71] tcg/tci: Split out tcg_out_op_{rrm,rrrm,rrrrm}
Date: Wed, 17 Feb 2021 12:20:19 -0800
Message-Id: <20210217202036.1724901-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
 tcg/tci/tcg-target.c.inc | 70 ++++++++++++++++++++++++++++++----------
 1 file changed, 53 insertions(+), 17 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index fb4aacaca3..f93772f01f 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -314,6 +314,19 @@ static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrm(TCGContext *s, TCGOpcode op,
+                           TCGReg r0, TCGReg r1, TCGArg m2)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out32(s, m2);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrr(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, TCGReg r2)
 {
@@ -369,6 +382,20 @@ static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrm(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGReg r2, TCGArg m3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out32(s, m3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
                              TCGReg r1, TCGReg r2, uint8_t b3, uint8_t b4)
 {
@@ -384,6 +411,21 @@ static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrrm(TCGContext *s, TCGOpcode op, TCGReg r0,
+                             TCGReg r1, TCGReg r2, TCGReg r3, TCGArg m4)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+    tcg_out32(s, m4);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 #if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3)
@@ -663,29 +705,23 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_st_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, *args++);
-        tcg_out_r(s, *args++);
-        if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-            tcg_out_r(s, *args++);
+        if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
+            tcg_out_op_rrm(s, opc, args[0], args[1], args[2]);
+        } else {
+            tcg_out_op_rrrm(s, opc, args[0], args[1], args[2], args[3]);
         }
-        tcg_out32(s, *args++);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     case INDEX_op_qemu_ld_i64:
     case INDEX_op_qemu_st_i64:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, *args++);
-        if (TCG_TARGET_REG_BITS == 32) {
-            tcg_out_r(s, *args++);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_op_rrm(s, opc, args[0], args[1], args[2]);
+        } else if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
+            tcg_out_op_rrrm(s, opc, args[0], args[1], args[2], args[3]);
+        } else {
+            tcg_out_op_rrrrm(s, opc, args[0], args[1],
+                             args[2], args[3], args[4]);
         }
-        tcg_out_r(s, *args++);
-        if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out32(s, *args++);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     case INDEX_op_mb:
-- 
2.25.1


