Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477DC3C17C0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:09:09 +0200 (CEST)
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XWO-0003ZJ-9a
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5H-0001oN-2T
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:07 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5C-0008D6-BE
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:06 -0400
Received: by mail-pf1-x42e.google.com with SMTP id j9so290333pfc.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NbQFCjsTG27rkqKfl9C38LdMPWKV+Bc+MrvnccbRs+s=;
 b=vlnG8P91wrNP5xOMvMNHvPlIiocspHbaL/Som1ZBcLaWWaNmz6xK2iGyiIukHwZjt/
 TN4hIz37ajSRTDdasCw40Z+DLnFIwPR9xBQ1Bjnh9SKKs0flGxOxKVhFW8SMUi5vOYzB
 c/5jEBIfSz2ySlPWNwBgCQBg6HrMQWhpZwOCV6hXnoANZ0TjrawNQM+yHvu/iu2r21Vn
 00lmbaOZgpNvZqI7KB1JS4yUwKQ48l3d/I+eCSiBhReMfblPEzgbRhDW3TAeSyfeGvML
 QWcqOo5GTKrf/qn/ZbHHsFGhPr0KQNV6XhqVkuzFzwSr3shENFXAE12EzjXieOLB8NLH
 +sSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NbQFCjsTG27rkqKfl9C38LdMPWKV+Bc+MrvnccbRs+s=;
 b=Imk2Z1dAg1q/DXRgNWf14T1aBeEDQSQBkKz25UkS1kdUL2Ii7ReNF1gHhTSAwtt3QC
 tJ+/NUAFAyx25zU8iaWYpGOKPuww59zpJXrMDUHYWzb8nkzqNDfBMUlyltmMj5RNEWg4
 Akb8S2v3uI2MBeO0duTJaGsHepU05ruh5BNBe0KRN2ohIdVxaVuDSxJVA7IidT3UOtz9
 8Dd0ZHb1bEOJjX6kNPoB43tH/f7mcyRR+5wRz46T1Tum8PzTqt9QYDwwVNdJxarwcx3h
 IXX8tsl3ODLHlgzMMwwDSG/rh6cDlDR8FhjrCfPlo7TkS66Xqb5ZRlmfTNIXuquriFIW
 AWXQ==
X-Gm-Message-State: AOAM530LNub5p3ataMEfH39sQigII0l7S7szwPyfQ51UrM2UA5DH3Fgi
 4Jqv51mIYupdQ39qVBIKq2nFhJlM9JMPZg==
X-Google-Smtp-Source: ABdhPJybsH1u2YPEzX6XWfaO+bxL+z+fTPpP8xBT3iEIhAzsPmXDwopddEUm4UEyZZd/LeX4n3Dz0Q==
X-Received: by 2002:a63:f515:: with SMTP id w21mr32776961pgh.343.1625762461109; 
 Thu, 08 Jul 2021 09:41:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:41:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/28] target/openrisc: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:40 -0700
Message-Id: <20210708164050.711967-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reorder the control statements to allow using the page boundary
check from translator_use_goto_tb().

Reviewed-by: Stafford Horne <shorne@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index a9c81f8bd5..2d142d8577 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1720,16 +1720,17 @@ static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         /* fallthru */
 
     case DISAS_TOO_MANY:
-        if (unlikely(dc->base.singlestep_enabled)) {
-            tcg_gen_movi_tl(cpu_pc, jmp_dest);
-            gen_exception(dc, EXCP_DEBUG);
-        } else if ((dc->base.pc_first ^ jmp_dest) & TARGET_PAGE_MASK) {
-            tcg_gen_movi_tl(cpu_pc, jmp_dest);
-            tcg_gen_lookup_and_goto_ptr();
-        } else {
+        if (translator_use_goto_tb(&dc->base, jmp_dest)) {
             tcg_gen_goto_tb(0);
             tcg_gen_movi_tl(cpu_pc, jmp_dest);
             tcg_gen_exit_tb(dc->base.tb, 0);
+            break;
+        }
+        tcg_gen_movi_tl(cpu_pc, jmp_dest);
+        if (unlikely(dc->base.singlestep_enabled)) {
+            gen_exception(dc, EXCP_DEBUG);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
         }
         break;
 
-- 
2.25.1


