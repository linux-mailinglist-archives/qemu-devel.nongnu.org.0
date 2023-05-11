Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2746FED8F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:08:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Ip-0006my-Vo; Thu, 11 May 2023 04:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IJ-0006IQ-NK
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:00 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IG-0000wL-AV
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:04:57 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50be17a1eceso15586002a12.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792295; x=1686384295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MH/FislB+PZ3yaaoaYyH7lf008m95iYymuHXns73bX4=;
 b=fKcyQA9IYtRkZmn4RVg9tSwIu/WWSWT29IZu7aemDdLROh4kCag9DxAZ6WMkWqxPAt
 UuGK7NDsXNiMUv9VCVfot10usJql6oTE78FQOLvRGBkIgimZlz5HAeRryXUUZuRjdD6d
 Q295U7aj3a0auZECR/KC5jpl3LD3cM6Y9FQU//MCKyd+9iuUnHo2cYjBMyLoJhiMCbNN
 PFDce1tbIsMyPdUXtIUzeaBbloJjVm+hstbvbTTRw7cE12BtxXCxW1y8381AyTQWNKsv
 c9BIcxxTDzx2RCJiZYC/bkrxHESjXa3CXKIa1W44JGFGkrG3Rj7WcV1f+9/0zc5HQEll
 g+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792295; x=1686384295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MH/FislB+PZ3yaaoaYyH7lf008m95iYymuHXns73bX4=;
 b=YbyHZ7Vzd2+ZM5mIHp2thskWZ/WQ7l/FkCMD0cf3MvtiK3FdVkMokX+kHOl/US4qrC
 09LfyCKQutngnUHWyngI63cLNee/7+iOb9LsREbKOhaS66dmsp8dPqKGOwLX9GG0o/pC
 nRDCAhNgRCjFKC1zm104M2/N12bp3HcRFvTWUAFBJdVZTrBSbkgCMFg0vsdJmQlKZd+E
 vWWkamzHe0VDdHajdFdUUagPRNmTytkHtnV0SSFg+z3aqBCfCkFKV0WCc8nLS2tc27g8
 svSxWJNJz1+D5JHsyymqM0dYB5O9UvGroYGNeylVLJfHEHp8OUYw0FOW66Z54jmbfE/L
 1Kyw==
X-Gm-Message-State: AC+VfDyoZSlzdDjCiZM2Ssh0zUJ3rRJnxdHrMn0UrvG6zL7hzwaMkvQS
 yTnKufcGv2U+TN4XzI9mrT0XLDYthUiwx0enMRjFbA==
X-Google-Smtp-Source: ACHHUZ453/H57Sv4m5XVIWFG2v4ERkAcfl2ANjH5HKMWAl8jXNvEvPMw86LKGRbL6VysKVm/RaGkWw==
X-Received: by 2002:aa7:c3d8:0:b0:50b:d75d:5dca with SMTP id
 l24-20020aa7c3d8000000b0050bd75d5dcamr15828641edr.42.1683792294870; 
 Thu, 11 May 2023 01:04:54 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:04:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/53] disas: Fix tabs and braces in disas.c
Date: Thu, 11 May 2023 09:04:00 +0100
Message-Id: <20230511080450.860923-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix these before moving the file, for checkpatch.pl.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230510170812.663149-1-richard.henderson@linaro.org>
---
 disas.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/disas.c b/disas.c
index b087c12c47..d46f638a72 100644
--- a/disas.c
+++ b/disas.c
@@ -226,11 +226,12 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
     }
 
     for (pc = code; size > 0; pc += count, size -= count) {
-	fprintf(out, "0x" TARGET_FMT_lx ":  ", pc);
-	count = s.info.print_insn(pc, &s.info);
-	fprintf(out, "\n");
-	if (count < 0)
-	    break;
+        fprintf(out, "0x" TARGET_FMT_lx ":  ", pc);
+        count = s.info.print_insn(pc, &s.info);
+        fprintf(out, "\n");
+        if (count < 0) {
+            break;
+        }
         if (size < count) {
             fprintf(out,
                     "Disassembler disagrees with translator over instruction "
-- 
2.34.1


