Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C06A31E0E2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:56:29 +0100 (CET)
Received: from localhost ([::1]:43754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTs4-00082w-9A
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMU-00016E-3Z
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:50 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMS-0007cO-Hi
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:49 -0500
Received: by mail-pj1-x102a.google.com with SMTP id my11so2008013pjb.1
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=06Y+cyMxl+dC1AQMaIsueXy7S/PiohsOvXqBqGkx3uw=;
 b=H4TMAZoXr8ESREzxfE/t8v2Hs3fkokNScYaye/B7hd0tlH2CVZX2ZO4VQXsTgYvKDC
 4HB8QoMiBvS7txg9wbx13DmbZAPBCXT3Vj8YAbfWS96mKsKJNCarbEretqqOZ9MCoS2v
 AVdqsKhymfZXZygWSW5RE/iB+SFdcgYsrBGOaFYMLuxtBUXm7Yl/L2Q7/IjzICgQlZTw
 9sXx0DtZ5qMjPOLN6V/8Vw8BUztxtvDST4bhSFdIVa26XeqN6/y7f4vu6kDMTUDN0uiY
 wMQ98TvVcHFBOYPAdrVzzS48zCTRxm+SL7CvK3780uB2mON2wJyP+xSLAROEawZnC3dR
 yPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=06Y+cyMxl+dC1AQMaIsueXy7S/PiohsOvXqBqGkx3uw=;
 b=cUBdDvR6UQzptMJn2F48Mv7+2yk5p+rAwqq3c3LiBrLCRmdmji3yc8EyaAVNrJu9BE
 pQfKDTswN/DAroHtrHfbwFkz/KtoVB/KGtr3Z1CnGpH+gnQwfE6zyJqlQbVSenFwkGWr
 8jkv6NSWBdXKwClEUOBLYoerNCvdVUib0rfBxq6cKgDUvnTGC1OlJM13RQRSoA9i6g2X
 mNwUgnqEe1atHJfo5P3LlGfx1Sjf2UvYYK8CfNUVlLIXc4CpJfyS/OEMKg942sKRq8R2
 aVPMCQkbn3YZ0kaAKYMJw+mib5dmC8DHoh5Wy+u5VQ6UfEUxPXuoF2hxna8CbSajttaT
 F0rQ==
X-Gm-Message-State: AOAM532FB7Fj62C0RVG++95bGasrKc77GzN9YIphdSzVxOrkVhExzgWi
 nkci2PCZ1er8qONWHroikUquNg8SpVCW5g==
X-Google-Smtp-Source: ABdhPJx/pBdf4OE39UQI31n5vZtDokOgjdiuenALak1+QzUx/QfCandMkgMks8c9bC8n3N80b/aHFw==
X-Received: by 2002:a17:90b:e8f:: with SMTP id
 fv15mr544635pjb.188.1613593427330; 
 Wed, 17 Feb 2021 12:23:47 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 44/71] tcg/tci: Split out tcg_out_op_p
Date: Wed, 17 Feb 2021 12:20:09 -0800
Message-Id: <20210217202036.1724901-45-richard.henderson@linaro.org>
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


