Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A834536241C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:39:58 +0200 (CEST)
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQZZ-0002Pa-I2
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lXQXz-0001jW-Ot
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:38:19 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lXQXx-0003Gc-WC
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:38:19 -0400
Received: by mail-pl1-x62b.google.com with SMTP id v13so587944ple.9
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NwplZnFiyMuamwMHCbycRwj9vsKmfkMBP0etRBAzG2M=;
 b=dfYAaxSbhYKBnm5/4QtXuzT9OhUmDVVUCTU+VlG+NWxbymRWrAaptLl0FUKgt/JIcY
 JAgJpa1cFf8R78VZz9VWin00GeQRs+BzdTQWqiIHQVfIiNxYnbiPfumTBvVHYPdfk9eX
 FqcUMn0BbSQOnhK0iZgzaFV/UhzdU0rce9TXaIQi8PMCuCigpLtN3/mnZit1W2bdtTZ1
 08XgV6LaFQD/zZfMCqUod51wULN4vn3DJBp324K2jah9UAiQD4hWl6hg3JGiYuW2JDE6
 02ZCZgg+UQBmDV9OXCee7vwc3Q6puLwtjcp7vxYc6w1j3nmYbhiF0rZOcBTxtzi5t3WZ
 2dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NwplZnFiyMuamwMHCbycRwj9vsKmfkMBP0etRBAzG2M=;
 b=J0AVl3sq8yAp5iNTDRgHiFCPxb2JpZClc7xh7CHn8SFodDqRUSWSdbOZKQ9S7+M3ke
 DRwh8WxZdQtsyiu2jfdG/caOkbwoUx9ouU5FeL6AOBqLhkbJAW7YKZbAM4t/tUTMVD7R
 gPAdhd3ET37H+BHy5ZmkYL0WkuZEpxfXeSNlbhjiIqnAgPHaxgn/rP7iEM5F4YoOsCwt
 LP3sbEdQNnxrjNdyZgSvTPbDX8H/sI5hUbyKJiuFfTdjf9+43L6UvK8bX0Os9jtMph2a
 4H+sL+md+cS2iwGFnQY9o2BpZOKbn6cMKPwLMOG4uQcYtnOX68sFw5mbl0dNqIjCWSq2
 oenQ==
X-Gm-Message-State: AOAM533WpPWolFfwnwLlY4G1whG482odDOgDKJKRU7mGMUmW+bX9/Du/
 Jz6uukVNPgWPBeoemiDNCcto0YxSST906g==
X-Google-Smtp-Source: ABdhPJySEKM/U7RRQajq6M346t8r1BW07F5n7fbpnCZFEDrithBevl/b4XybCX/lc8bRQoFMXSmJAw==
X-Received: by 2002:a17:902:7616:b029:e9:a757:b191 with SMTP id
 k22-20020a1709027616b02900e9a757b191mr10119609pll.74.1618587496114; 
 Fri, 16 Apr 2021 08:38:16 -0700 (PDT)
Received: from localhost.localdomain ([104.160.18.162])
 by smtp.gmail.com with ESMTPSA id w1sm5514024pgp.31.2021.04.16.08.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 08:38:15 -0700 (PDT)
From: Ziqiao Kong <ziqiaokong@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Set the correct env->fpip for x86 float instructions [cleaned]
Date: Fri, 16 Apr 2021 23:34:31 +0800
Message-Id: <20210416153430.92187-1-ziqiaokong@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=ziqiaokong@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 Ziqiao Kong <ziqiaokong@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello, everyone!

Sorry that I forgot the Signed-off-by line and put the duplicate link just now. Please ignore my previous emails.

This patch follows https://lists.gnu.org/archive/html/qemu-devel/2010-11/msg02497.html and https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg00307.html

Sorry again for any inconvenience.

Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
---
 target/i386/tcg/fpu_helper.c | 4 ++--
 target/i386/tcg/translate.c  | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 60ed93520a..e8cbde4e1a 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2395,7 +2395,7 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
         cpu_stl_data_ra(env, ptr, env->fpuc, retaddr);
         cpu_stl_data_ra(env, ptr + 4, fpus, retaddr);
         cpu_stl_data_ra(env, ptr + 8, fptag, retaddr);
-        cpu_stl_data_ra(env, ptr + 12, 0, retaddr); /* fpip */
+        cpu_stl_data_ra(env, ptr + 12, env->fpip, retaddr); /* fpip */
         cpu_stl_data_ra(env, ptr + 16, 0, retaddr); /* fpcs */
         cpu_stl_data_ra(env, ptr + 20, 0, retaddr); /* fpoo */
         cpu_stl_data_ra(env, ptr + 24, 0, retaddr); /* fpos */
@@ -2404,7 +2404,7 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
         cpu_stw_data_ra(env, ptr, env->fpuc, retaddr);
         cpu_stw_data_ra(env, ptr + 2, fpus, retaddr);
         cpu_stw_data_ra(env, ptr + 4, fptag, retaddr);
-        cpu_stw_data_ra(env, ptr + 6, 0, retaddr);
+        cpu_stw_data_ra(env, ptr + 6, env->fpip, retaddr);
         cpu_stw_data_ra(env, ptr + 8, 0, retaddr);
         cpu_stw_data_ra(env, ptr + 10, 0, retaddr);
         cpu_stw_data_ra(env, ptr + 12, 0, retaddr);
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 880bc45561..cc4398f03b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -6337,7 +6337,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto unknown_op;
             }
         }
+        tcg_gen_movi_tl(s->tmp0, pc_start - s->cs_base);
+        tcg_gen_st_tl(s->tmp0, cpu_env, offsetof(CPUX86State, fpip));
         break;
+
         /************************/
         /* string ops */
 
-- 
2.25.1


