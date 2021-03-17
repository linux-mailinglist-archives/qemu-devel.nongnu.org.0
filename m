Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F35333F528
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:10:58 +0100 (CET)
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYl7-0002Vt-64
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCl-0005JO-FV
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:29 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:34309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCY-0007G8-3b
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:24 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so2183674otn.1
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9gOc+vBqXpfUn2Q8eNd5OOU1iZ9hXi0uS626WbgV7Zk=;
 b=zGPUcW4C+D3jLTbjKQcxrpUkmWrZAOkXAd/xgMjxQXZISUISPNSOdm6EIF4SwA3be8
 BShzd8KdUrQXL55mMCEFtPsiuXspOT/67k8LS4ObjaCL54rk7PlssExyJ3UlMtqrQVqp
 DsjlhnB3SV4HbFuULrqBJuiFi7BjOOMG+EqAjwaItZ4fYn8VXVPkRgymZ8zdG1mIOJ8R
 rmEetQo/eTz+1qjbT/6gHHIuPHl3an451nkP4s9OgqqhICPehqqRN10+57vN6qjtxj6E
 VdOSguYF8FlrFfT0/rq6M0Jx0og5keVCWq1x2TuvdQSXF21W/ak7dV7OdH/d3m9QSWQh
 Xykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9gOc+vBqXpfUn2Q8eNd5OOU1iZ9hXi0uS626WbgV7Zk=;
 b=i/wnVUYqV8NqL0OnrdfFLy7jIrFa9nEytUzMEJlSebW9BY/a/2dwcaOBZTwB/Qo9dc
 +V/p9JOPwAnx62mLWGFjS5bXCyuVmG6HEoY8Qt8HVRpM0Zm4qpLbpmeIk7FwA8ByR3OI
 QR4fdEF4WjlvxkPyKuGaqxnlA0YLBbXhl9AUrWT2KCRTOWoqzP+RV2gshphWnOZLKJcf
 6PrmPJRoC8w/x4cBjRl42Uob9GbXKNUvlAV6logJRN6v9dGmMXtcZp8hqUjTAIicL1Ye
 RcBSOkPlqVjoHb/x4zizjR1bPGRnkTY6TL5geywZaoj2Wbk4VnNyhamhwMicEsi2C6M+
 Wrrw==
X-Gm-Message-State: AOAM533wpBSfXTQQQ3pN0rGpg0xc+rTc0YsikYiBP5fi9/NwCoIIaKxl
 7+seofUVNnSkGiK+q+cxb+4M915keTSEb1v8
X-Google-Smtp-Source: ABdhPJyZQlFCizIyjeH991Spn5jwOl1uBSgBsdpFAxlIGJcHbeAtDNAxQk4wfVlCeV1f7PSmKhC/Sw==
X-Received: by 2002:a9d:1b49:: with SMTP id l67mr3888152otl.83.1615995311443; 
 Wed, 17 Mar 2021 08:35:11 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/38] tcg/tci: Split out tcg_out_op_p
Date: Wed, 17 Mar 2021 09:34:31 -0600
Message-Id: <20210317153444.310566-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index bf2733d42b..85c5ab5a08 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -307,6 +307,16 @@ static void tcg_out_op_l(TCGContext *s, TCGOpcode op, TCGLabel *l0)
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


