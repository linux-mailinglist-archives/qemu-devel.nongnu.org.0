Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ECA31E115
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:13:36 +0100 (CET)
Received: from localhost ([::1]:57114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCU8d-0000mh-Hz
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:13:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMX-0001Bp-6b
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:53 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:50472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMV-0007dF-KL
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:52 -0500
Received: by mail-pj1-x1032.google.com with SMTP id cl8so2153109pjb.0
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RzFAVc3cWW3yr0pGO36GqM64ymG+VJfs9mt8bjfFgIQ=;
 b=VhbggrppflsZjzAuM1zhjdtndIJqk9zecFP2kBash6OLagSrTzKfpr1mYEwxn89Xhp
 6fhsSrYJ14L/tJLtuRLMWEip42AoDHmyuX9uFwhqlxfnnCDegQaRpLifmNUM7eazQczV
 I6WZkhK5pK5Zw5Iz8sgaViP9VsWHmqEiLuiDmHED1IcVUI1ADIKpeEjMO7gspRzFtjJ2
 XfFZ6eX13DfZK8dyVP6W2Gicu1yhB+XE/Vx3aMBFWW4DtPhxw6ZpPv3p0mruQdyqnrmO
 sYbRJz+n0RdmbSnBCE8LVRwHX4F2SyR229wIbTZ0IuZvVwRubHTStZ4g1GBsIzUPg5zQ
 F2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RzFAVc3cWW3yr0pGO36GqM64ymG+VJfs9mt8bjfFgIQ=;
 b=Fw71PJ41QDc4GLXejnVcIBC4wFkpWTwyNmIo19pLauGheoaMnffUlRzEB3r96c4WgZ
 7UGdBI/jVLmJO4YkMpujZRpnUhkH3MG4pxrlfIoOebEQ3ONzYlfx+QF00RmwOyiR6Kac
 wABB4NVInnCnhvZsC2yU4/ukhZqcfbeTuEww5BZ7LvdiCz/mwxVnDw6Lp+ZBaOrR6evK
 FmUGczLN3n6qlZHYSXooOmZfbRk5bS6oBun0o1XvruaTg0sXTuX3igygdpp9h3ji/EHy
 6wb7E2mqiMLFEjpEb/uh23G433AndufuQLVIG7Kt5jTU6wA9M1kqeOxXl0rrd79oOFky
 na2Q==
X-Gm-Message-State: AOAM5328KXqIoW7ayNyJ07y5pcA7Y0ArdYtsS5VN20VAudRxuMYiru/G
 8YUtFuUlKCBoUGFyQvjUWXpp5s7Ot6Cdyg==
X-Google-Smtp-Source: ABdhPJyifSH75gCFTa9GE6DUSUGjt/fHQZs3Fqrq65kABi4jcaDMo/iLTQO/8W3WKeRYbpweEGJQkQ==
X-Received: by 2002:a17:902:b009:b029:e3:6915:5475 with SMTP id
 o9-20020a170902b009b02900e369155475mr980412plr.34.1613593430386; 
 Wed, 17 Feb 2021 12:23:50 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 46/71] tcg/tci: Split out tcg_out_op_rrr
Date: Wed, 17 Feb 2021 12:20:11 -0800
Message-Id: <20210217202036.1724901-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
 tcg/tci/tcg-target.c.inc | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 272e3ca70b..546424c2bd 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -314,6 +314,19 @@ static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrr(TCGContext *s, TCGOpcode op,
+                           TCGReg r0, TCGReg r1, TCGReg r2)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -500,11 +513,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_32_64(divu)     /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(rem)      /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(remu)     /* Optional (TCG_TARGET_HAS_div_*). */
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrr(s, opc, args[0], args[1], args[2]);
         break;
 
     CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
-- 
2.25.1


