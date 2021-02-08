Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6E9312960
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:33:24 +0100 (CET)
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xIh-0007xV-R8
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:33:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSX-0002cs-Un
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:29 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSV-00069F-80
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:28 -0500
Received: by mail-pg1-x52d.google.com with SMTP id z21so9272276pgj.4
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Muk10JaSTB/BV2ItdFkgjXJDIa6PJidFm2ztv5V4ygc=;
 b=rrlg6FZEjBsEIe0zEJH2VzluoLMglPdLZsvwD2g11dOcCvSM/60MDteMSIfboGC8gY
 1mb+wbh4G9fh7dglxV8SW5/Yf5QruVM6snRuaDp8C/Ql0Ok3GBNygiFslCh/h60004PN
 TiMpY+LNeE5lqE/GRF9L3D91sYZhZ5dhL8YU7Ba6iek0+btTltL46v2SICbbsTtDrGRE
 EWFANAxqHw2RMrXxFPeDtAjsxz32EuqKEJ7IjWcWoi8wiv6HC7vc5thn4TbXVwi6z5Go
 KwLOY1sY1uL8J7Lm8gLKPTF0ZgU6rUL+DHr2BugWmWVCAfvmrYR76uwctlJenvopEn0I
 tJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Muk10JaSTB/BV2ItdFkgjXJDIa6PJidFm2ztv5V4ygc=;
 b=Ckv5p9l9Y2uHg+OVYB0GQGRPu0bh+rRsoT3wFJFm6LXQPMJGL1XMWZOunQn6KF/RT1
 WhoWExmyChXXOkKPTtEXEP4FN0RiY7XRGXS2pC9RXX+JQYESDR7/B9jmNsFfk6y32vDz
 PAxPtKv6Vn4boaLK4uIuZj4vB07MC2EWlLl/gl9XSf1/z5QGHq6ejUCzb1UX7Yrmf/SU
 g1xfKLhZddeBD32UQ9Cg6KlYUKhm19HF1avRjFQXO8qdRre8mvVQ5M6igfjwT69fBMZX
 aAcjC3qlXf8H1bq/78vQuMs/BQjhxI3/kEUhz3hZk7+tLD+/ozHO39MpLcLoXb9f5MGR
 O89Q==
X-Gm-Message-State: AOAM530M1p/XMYKSWTU0OpbkwWYNKpvEWFIzjCUyfg4XAHFl2g4k0X4Q
 I4DxKLu1cUY5MtYwiRRl7u6ZYLncJ5oslQ==
X-Google-Smtp-Source: ABdhPJxeq+9fCSJjuDyqehyEx/yQXR242zTS8SVj1MXmIeIEc1wYOdsHpNuZZp4sTMJfK0SwBphgWw==
X-Received: by 2002:a65:4b89:: with SMTP id t9mr15087681pgq.211.1612751965918; 
 Sun, 07 Feb 2021 18:39:25 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 51/70] tcg/tci: Split out tcg_out_op_rrrrrr
Date: Sun,  7 Feb 2021 18:37:33 -0800
Message-Id: <20210208023752.270606-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
 tcg/tci/tcg-target.c.inc | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 8cc63124d4..f7595fbd65 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -401,6 +401,23 @@ static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
 
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
+
+static void tcg_out_op_rrrrrr(TCGContext *s, TCGOpcode op,
+                              TCGReg r0, TCGReg r1, TCGReg r2,
+                              TCGReg r3, TCGReg r4, TCGReg r5)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+    tcg_out_r(s, r4);
+    tcg_out_r(s, r5);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
 #endif
 
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
@@ -601,14 +618,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        tcg_out_r(s, args[4]);
-        tcg_out_r(s, args[5]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrrrr(s, opc, args[0], args[1], args[2],
+                          args[3], args[4], args[5]);
         break;
     case INDEX_op_brcond2_i32:
         tcg_out_op_t(s, opc);
-- 
2.25.1


