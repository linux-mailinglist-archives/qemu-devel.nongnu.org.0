Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E7D59EEDA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:15:34 +0200 (CEST)
Received: from localhost ([::1]:43320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQcBJ-0001iV-6g
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc27-0000Ce-Fn
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:03 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc25-0001PW-S4
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:03 -0400
Received: by mail-pl1-x633.google.com with SMTP id m2so14038964pls.4
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=x4zWBtw9jvwUVwVAd9mRUcqQWThPixmn/z1menAiivA=;
 b=cswY3eoR7PQAzVE0RptNqm7H79rXehegzgfY6qFMg4aww3V1+JN5/scSkn1XHAY5k/
 v1jfoTbvcPX56hqBT7NgmhySELbQSH41yXfyeLvo0NyASO7VpdkJIv38zfUZKhZ/l5nL
 Fbso4amudkY0/UTAKNcxl6X3dpHSxKugXGfSmcW3WVlmP9pyAViOvEox4gpngqGFjMwb
 QolEYnE+0FN5fdWYR4HlOUApKcFASD4z+FoK3DKzaLOig7fUaB8B4Ve1LvDm0milCQYK
 1G4k1+sG6s4NotCTHUH4hEfeFlaFL3N+b5mK3DFmOl+JbX6J8+go6s4o4QI4JTZ7Ffxj
 nqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=x4zWBtw9jvwUVwVAd9mRUcqQWThPixmn/z1menAiivA=;
 b=jXEA0ws5NnynMyUvmVDFhubOCc/NsFbngoVKeCjEhNA6Yd1g4mFB15fQM9HWA3XdMV
 9Ulk2mt4br45miysWqeloM5FQtydS4yubtZzUplKD+YlVZWuA4SpwhKA+rDQMzsVSbgF
 HnaKEG0JkjB2MfsmwpO1Pn05MTG0Ie+DrfOr/8AsHqYI2XR6DHKVYo8CZxMC6m2NSOHy
 wzb49Y+CddPtld0K/lPYuZgFVzbaf4S0JFBTSuDQJ/2AuYwRlLxRjvL/qqZa3F3r6Pk0
 /IH/WBbu6t8+XBNf92QQXWujh4VbB1laz//VKX+54ALJqjOvvzowJUcf2xSxWZsOVNP6
 IYEw==
X-Gm-Message-State: ACgBeo3vZ0OqjcDB+8QVAQ0VdDB95BJEqjqpZPyL1CyjEzw8YPcMsZEO
 Ixt1qQi3yKwU4UwgHqT+JHy17VhFvsIjtA==
X-Google-Smtp-Source: AA6agR6wR379KthsZOTPCRDSQnwDZHGVJRImq26JLlhybx238TdeWd/hskfo9n/xU0s/u5JOLujCtg==
X-Received: by 2002:a17:902:c949:b0:172:e3c3:bdeb with SMTP id
 i9-20020a170902c94900b00172e3c3bdebmr12461478pla.80.1661292360122; 
 Tue, 23 Aug 2022 15:06:00 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:05:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	laurent@vivier.eu,
	alex.bennee@linaro.org
Subject: [PATCH v7 13/20] accel/tcg: Document the faulting lookup in
 tb_lookup_cmp
Date: Tue, 23 Aug 2022 15:05:35 -0700
Message-Id: <20220823220542.1993395-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was non-obvious to me why we can raise an exception in
the middle of a comparison function, but it works.
While nearby, use TARGET_PAGE_ALIGN instead of open-coding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7887af6f45..5f43b9769a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -198,7 +198,16 @@ static bool tb_lookup_cmp(const void *p, const void *d)
             tb_page_addr_t phys_page2;
             target_ulong virt_page2;
 
-            virt_page2 = (desc->pc & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+            /*
+             * We know that the first page matched, and an otherwise valid TB
+             * encountered an incomplete instruction at the end of that page,
+             * therefore we know that generating a new TB from the current PC
+             * must also require reading from the next page -- even if the
+             * second pages do not match, and therefore the resulting insn
+             * is different for the new TB.  Therefore any exception raised
+             * here by the faulting lookup is not premature.
+             */
+            virt_page2 = TARGET_PAGE_ALIGN(desc->pc);
             phys_page2 = get_page_addr_code(desc->env, virt_page2);
             if (tb->page_addr[1] == phys_page2) {
                 return true;
-- 
2.34.1


