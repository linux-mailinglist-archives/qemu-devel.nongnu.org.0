Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A23533766B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:03:34 +0100 (CET)
Received: from localhost ([::1]:59468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMqb-0002AK-Mj
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUm-0003oP-6J
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:01 -0500
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:34280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUU-0006cT-6u
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:53 -0500
Received: by mail-qk1-x733.google.com with SMTP id t4so20834758qkp.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=06Y+cyMxl+dC1AQMaIsueXy7S/PiohsOvXqBqGkx3uw=;
 b=QKPRXBQgU3YRAKcDAThexKRUDReRIr0vYpQYxTsRN2b898Ovzc5r/isDOGdr1o6uRE
 /EZ4/3f+w1JzdqwxbXKebch8PT0JSRgiRq1ddG0MZp0vRsw8wNcRaHEPZxdjxrPf4oZo
 CXfhT1sEu1WI8kV7Ptzkov2HS1go4do7j83WAYk5pMtcaNJqZ2qCjUjmu2E+gSjaZ5dV
 DuS/RlmsayDLTPuMYVK2njPdVY9NGYWbPZyn2ERv9KkoPHtggC7FwZryW2UhsMXw5RgV
 2KLf8T8HGe2260S1Y6J+LqXWjch995A1JIxUljtF37ttLuqZfqPfHUHjiEH3ooorkCoG
 cj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=06Y+cyMxl+dC1AQMaIsueXy7S/PiohsOvXqBqGkx3uw=;
 b=dnT3AE59FL24E/tRjKYLBXMzaNufJ6prsCoRXjIkscqpLQZyydn1e5Iyq4Eyv6mubC
 FkCINIi+OqL4id7GNtsu4w2Hdh4Y9uu0tfMELK0/+GHnRBOS1g4X1bP2JtnZBoojvaQA
 ocpQOjkxB8To+GeaLhhQ5Pyix2klvpcK2idx4SapXkHSkWGQ+TWVNxXO7mS7LfTMYzYU
 xYJr/kFF2UtAB5dbPbtXvBCpjSy+oYLXwxwDWQGHaQ/SdTOYirZtoL00gYFGQUp8x8ur
 rugfZLMzoo3mv/CNPAy7vfvTe54Byrv94R31j8niCfJ36Ki4+TMkEdQzc1aBFo+j6YDL
 CXYg==
X-Gm-Message-State: AOAM533bzrPwmN6EfbNVMglt28LuCs7YAVXKNsmwy9Q0Hmjb2VyELx2q
 grIf7a7K0zRGl6s3hLFt8XXM+ZrwC8IvDLzn
X-Google-Smtp-Source: ABdhPJwmgvhu6X5nqOvAkIqjhULNcvc+g1BDvRwY+Wk/p/H4QLZZu6jOEC/Z9e0gypPLO+LMd/YzZQ==
X-Received: by 2002:a37:46c5:: with SMTP id t188mr8040014qka.47.1615473641303; 
 Thu, 11 Mar 2021 06:40:41 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 29/57] tcg/tci: Split out tcg_out_op_p
Date: Thu, 11 Mar 2021 08:39:30 -0600
Message-Id: <20210311143958.562625-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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


