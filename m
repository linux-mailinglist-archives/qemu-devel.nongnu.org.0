Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F6E4DAA2C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:01:16 +0100 (CET)
Received: from localhost ([::1]:52866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMih-0005Lt-QK
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:01:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgP-0002RI-RK
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:53 -0400
Received: from [2607:f8b0:4864:20::630] (port=44675
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgN-0006Sf-PM
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:53 -0400
Received: by mail-pl1-x630.google.com with SMTP id q11so944582pln.11
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rvV4NjaUkhI/j5swYe2ptLLF6nfhOIUNvVwyxn8c7gs=;
 b=xeinbUzsIGya5s+DnNSUN6n3gnZy9sttP4EPAEYzMb3ZyJKp4C9js/7hV39SWyvQql
 HazjuZ+vOuSnDckRGgmV1pND3NyLdIY5ddo+dCizmTua+yn9f9CiUBOh6ZqOMv0Lm7Kv
 cOAgxm+zQ40KoFQ7R6bT73onj3BdcZwauNCQVVHfHPaio7uRje635qT4lMxHGe8B9u7y
 UFwrOX8z1rygBo8DT3uYsoMnccMxp+bd7JBVY1btQ4ttacjt9Hb6yFptXxViy/eBF5TV
 C9XFG83/EQI8TqeeCx3N5PwQJE4TXy6JdzVcOj5fsmxqoUhnVKHFoB6Smy09kQjJZ47A
 /6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rvV4NjaUkhI/j5swYe2ptLLF6nfhOIUNvVwyxn8c7gs=;
 b=0kPUaks9gL1CttJTbENdteJAbhafnZcSv1CBA0ovZZWQ1L6T4t3tY0/IvxfwLaBQEd
 vg6jAnapCk6/IfyI0oQZx44pM30fqrcBwYfy0sJ7hPRVQyCMrnjSXjtilpc3F2z+0RrC
 n0tCOpWcKpG7Ti5bLXr1pg3hGMUiGcGM5FThvqKi8Cmw+pC0A+++zyZy6ENqr/sqUH+3
 xakT9vVFM2mGup7d4+DIXJpQq2qJ3NYU8fd6cSJ8vjfgISjKThwfWbqJi4CZA97nMWTU
 JGZ+nf1uD4n49Ke9eaQ+VC2arFzbozqmhqGZOsqIhVJC+cfj9MiI1+9iXOdxTIfZtaMu
 isZw==
X-Gm-Message-State: AOAM533ALwWZyDg/YD44+hMvltK6DhL4JnyujwHhLN5qO1OHsLfTmRCd
 /+10A5mYzKhsjGoJA5reFpa8m9TKLiRjtA==
X-Google-Smtp-Source: ABdhPJzqBiMAVITqaPdjqapioP+8pfHsHJtLKFl/7Erd5ymLh60204jYTw3VxQwpT6Y2SCZF+404jw==
X-Received: by 2002:a17:902:f684:b0:151:93ab:3483 with SMTP id
 l4-20020a170902f68400b0015193ab3483mr31759845plg.4.1647410330533; 
 Tue, 15 Mar 2022 22:58:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/17] target/m68k: Fix stack frame for EXCP_ILLEGAL
Date: Tue, 15 Mar 2022 22:58:32 -0700
Message-Id: <20220316055840.727571-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the M68040 Users Manual, section 8.4.3, Four word
stack frame (format 0), includes Illegal Instruction.  Use the
correct frame format, which does not use the ADDR argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 4140f65422..6aebf9d737 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -391,11 +391,14 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         }
         break;
 
+    case EXCP_ILLEGAL:
+        do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
+        break;
+
     case EXCP_ADDRESS:
         do_stack_frame(env, &sp, 2, oldsr, 0, env->pc);
         break;
 
-    case EXCP_ILLEGAL:
     case EXCP_TRAPCC:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
-- 
2.25.1


