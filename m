Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE80A30EA5A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:44:16 +0100 (CET)
Received: from localhost ([::1]:45716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ucx-0004eX-Rz
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjx-0006GW-P6
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:25 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:37454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjl-0004Bn-Nf
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:25 -0500
Received: by mail-pf1-x42b.google.com with SMTP id b145so1076125pfb.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=06Y+cyMxl+dC1AQMaIsueXy7S/PiohsOvXqBqGkx3uw=;
 b=pK+mdlgxoivRR0qEhvJ9FQhkTL2fsZ/T5fTb+NMUMeTFTaw7Ugfp+ZMgUJNYwXEA0f
 zBXNJF6XtdG5FKE6Dm21xIh606XR6p924SykELRu4iBfx/qqxYFLkvZyv7xZBvZXWtvt
 l+Xcx4q8L47Y6/jeo1o+E/pfMerGTyFYvn6teJOaakKpQSDSPSoo9uDg/JOS32L3gvW7
 DtON0P5VHoldU/LIVrj8y+hrT5pgKFZXlTI2C7Ip1sqyYhZzz5beE4rMbANxbP+yVqby
 ++4Rbkm1HcNgxwA8NuL5jurnBGYx+gzmMxYRMgxi/r6pwyHp41uhi1iRufXnY/0FUFze
 BIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=06Y+cyMxl+dC1AQMaIsueXy7S/PiohsOvXqBqGkx3uw=;
 b=EVcnqWfY8pCaQWxSssSnROA8oPx4q8HayI2QL+5n9dF4Kiv/c98vrq12e3jMmSj9FY
 rFzM1Y54h1WIhZf85ZBGUvpaOJTv601Iqdsp9BTyxYlp2cijzpdBPvt5PQGIsl3axLbt
 pvKozNv1/TlOZ8NirosGk59WTV45a/5IOXrXUZ/rRNlCmFmmvwUceQXDhyEy4JeQD0Lx
 58xP0zZUi/lyuvtuzGqQR7k8qzwCMK8puBjwWeTyBfrOBoUe4nxrfDtp5Z7+6e75bUjZ
 NbXGSefwbc62SnVl01xY4bGaO7n7OdPxz6AqR2vfWwZKUZ8v3M+myoXG/64snGu+DzYN
 pUlw==
X-Gm-Message-State: AOAM533DhfWj2WZPBj4jeRnngcOHcsyk8Ut5SRqKbTYSPGZfPu1dfQw9
 VxwrIgUOr3QEbHDKGFSTthsGBQgFxWw2TQNz
X-Google-Smtp-Source: ABdhPJzeRpHpOaOIvC0VckOBKyFrWpHCSdR4Nzt8bGMlDHJDbmlORo34CyAxIenw0Di9EyrnweJxUA==
X-Received: by 2002:a63:ce4a:: with SMTP id r10mr6625334pgi.3.1612403231878;
 Wed, 03 Feb 2021 17:47:11 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 69/93] tcg/tci: Split out tcg_out_op_p
Date: Wed,  3 Feb 2021 15:44:45 -1000
Message-Id: <20210204014509.882821-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 tcg/tci/tcg-target.c.inc | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 1e3f2c4049..cb0cbbb8da 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -293,6 +293,16 @@ static void tcg_out_op_l(TCGContext *s, TCGOpcode op, TCGLabel *l0)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_i(s, (uintptr_t)p0);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -403,17 +413,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
     switch (opc) {
     case INDEX_op_exit_tb:
-        tcg_out_op_t(s, opc);
-        tcg_out_i(s, args[0]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_p(s, opc, (void *)args[0]);
         break;
 
     case INDEX_op_goto_tb:
         tcg_debug_assert(s->tb_jmp_insn_offset == 0);
         /* indirect jump method. */
-        tcg_out_op_t(s, opc);
-        tcg_out_i(s, (uintptr_t)(s->tb_jmp_target_addr + args[0]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_p(s, opc, s->tb_jmp_target_addr + args[0]);
         set_jmp_reset_offset(s, args[0]);
         break;
 
-- 
2.25.1


