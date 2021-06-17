Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505D63ABAD7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:48:39 +0200 (CEST)
Received: from localhost ([::1]:42896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltw86-0005us-8q
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3C-0005yV-TJ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:43:34 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw39-00016U-Pz
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:43:34 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so6947720wmq.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWUY/dG4dghXb308+v5XGfZ+xJXcTg6zhfiqLqE4gSg=;
 b=jGHgKeQEZHQm3HeZNE7vFQ2dPti8NDBScAhvG18KIugmickHzzVHcbrdKzH+2QD1FC
 9/3l14g+kZYs/O2aiUbsqOQO0pVZBPKZQOz3ZzEHMH+VUZJup+2c8Dom7cER+z1ZRofP
 fYGWgVWuqWc/3+CY2Gk9/7Y+S6M4lZrBc8eIjLrqafJfVpFgrR4iFOSN8Isgf3Vlo3pg
 6yHCsMPyH4O55UKkf7rtDtZbcsZV1xUwoUujTQJUo5NOVVJtFIaEtq9EYQDLdKYj64ws
 Z1F7b+ho0s5LCrdKJ8kzVI751aOE2+L/wA/ROuEhPtbCp06EEMLLB2g9Olo/VJ3WpC9P
 Y3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OWUY/dG4dghXb308+v5XGfZ+xJXcTg6zhfiqLqE4gSg=;
 b=G64RvB1LMeN9RymG3KWJLEwAIAw5fsmiqcBJNHsnOj8w7wwD7o3HUHypauMyn8QjQP
 +p9dy2I/X0DwaxQH7SY8/ae8dkcwLLyB3NP6TWNIrZf22Fmc0OJ/VWn5rgIwQkLnoT5G
 /L0DWYF7n+gObtqJaLBvgYZD4NAhBtt85za8rT4J+2jo9x5GhsWRXMNXh66Zs8K6Jl4J
 hSpKEwqhHwrjbRUKHIc3tT4AxRY/M9UJkFkfz5Rgr4uM7a9WM68XEWAfeM+6iMzi/83x
 3Hehh2V1aCDAEwUlyBpiix+0B3iw/yaO/uZTg+oJ2obeSRf8Cfvm6FFaivkuErb25aTg
 rdTg==
X-Gm-Message-State: AOAM5310vq0z67crMji7CMLPdy4VP056i5aXNaAqrGx2uD/EbjM8xP1N
 MCFq7EB2ykaxCamJ0/6MP2C9oWAMQoI6AQ==
X-Google-Smtp-Source: ABdhPJwVewpujhAusmSvetR73dp2LL3wn2XrBuhQ3tKdb04/hoe+MYCXnrRuLtxOLywIe0QuyJexBw==
X-Received: by 2002:a1c:5f87:: with SMTP id t129mr6495962wmb.86.1623951809862; 
 Thu, 17 Jun 2021 10:43:29 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k82sm8602873wmf.11.2021.06.17.10.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:43:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] target/mips: Do not abort on invalid instruction
Date: Thu, 17 Jun 2021 19:43:15 +0200
Message-Id: <20210617174323.2900831-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617174323.2900831-1-f4bug@amsat.org>
References: <20210617174323.2900831-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On real hardware an invalid instruction doesn't halt the world,
but usually triggers a RESERVED INSTRUCTION exception.
TCG guest code shouldn't abort QEMU anyway.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 0954ce0dbc3..b92a473f870 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -12151,8 +12151,8 @@ static void gen_branch(DisasContext *ctx, int insn_bytes)
             tcg_gen_lookup_and_goto_ptr();
             break;
         default:
-            fprintf(stderr, "unknown branch 0x%x\n", proc_hflags);
-            abort();
+            LOG_DISAS("unknown branch 0x%x\n", proc_hflags);
+            gen_reserved_instruction(ctx);
         }
     }
 }
-- 
2.31.1


