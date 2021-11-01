Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E83A441FDA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:14:24 +0100 (CET)
Received: from localhost ([::1]:49932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbp9-0000rm-9Z
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9C-0007xm-M9
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:02 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:46730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9A-0001Cv-VB
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:02 -0400
Received: by mail-qk1-x72a.google.com with SMTP id bl12so2960375qkb.13
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hDIIDmSt3XkX7dozNp8YyanBuOQiSpBj16JErrhb+ZE=;
 b=Qxaxl66+AXyAg+0wnk9+Q3Dxm/ODm1dIJY9eW8/8wmRb6fgJfWKhx/ZPSagefZrMYK
 B6l6CtxrMeB6cKThVqoXXQ/vmVxiKdjkeQfdvHcK/0gyXTwRgzN8h8IYSyNLB0EpTszH
 41iNSK/uPBro0o8K6WG56+qbYFVUX2GSt0n9w3a7uK67dfF7insjIxbHvit8K0r2J33i
 OzwmDdbXM8oGNXLMSRcp4lmGM3jzVoRyhabHt/ci4eWSGW/Hnu6hL+UOHgpjLkKovoBI
 5IlfJjJ+dDRf02CXqGI2McPl7zjb6Sg+B/ViC0TwMAPOmlyjEcL8psxtMSvhf4fwJtc9
 mh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hDIIDmSt3XkX7dozNp8YyanBuOQiSpBj16JErrhb+ZE=;
 b=OoVZ9V0aBXLyYPehPgz3o7Rk7viW2xk59RjBRMWsGVfFE9RvoyAKww5mdYRcg+RR1x
 C2dLVCz2Y+z02yLaApObq5ASHDqe5qhqAu7Aa91+lXeLXZ+EqvQRGFO1IpGxWD6kdYLc
 dRYkaGBrTCpMMTcFlYHkqQEOE3xXK4QZDXoBXTeB1tgUu5iUmnhijdQP/8buewSSdhOY
 P5hZf/1eLWMclb+8mL7jkvxC9Y6rGkZuYrAgdulahFOxVkch4Ojd2KoOXmHYOctMKSJ4
 36TJySIehdzSyHKlbsqdokKVIyG3raBtWMaMTK6LhgKlR1ZDTDW/wX6E8LJs/4CnChkS
 QzCQ==
X-Gm-Message-State: AOAM530psNKTxCp8qnk7HYXhOfRGU0vuJbQJskvtpE9056aPNdD7G4yt
 1K1VRPlVaa5XGCgSDWOkABgObYpaU3tTGw==
X-Google-Smtp-Source: ABdhPJwNojeT09w/prxyJ7Fxe5KxR1nOGBMThU3AcDXBVlg70VPC4Kq9WyZ2eeG3RDVjGAcjudjT7w==
X-Received: by 2002:a37:dc85:: with SMTP id v127mr13213183qki.45.1635787860133; 
 Mon, 01 Nov 2021 10:31:00 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:30:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 49/60] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
Date: Mon,  1 Nov 2021 13:27:18 -0400
Message-Id: <20211101172729.23149-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: qemu-ppc@nongnu.org
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 88a8de4b80..e568a54536 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1465,6 +1465,20 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
 {
     CPUPPCState *env = cs->env_ptr;
 
+    switch (env->mmu_model) {
+    case POWERPC_MMU_SOFT_4xx:
+    case POWERPC_MMU_SOFT_4xx_Z:
+        env->spr[SPR_40x_DEAR] = vaddr;
+        break;
+    case POWERPC_MMU_BOOKE:
+    case POWERPC_MMU_BOOKE206:
+        env->spr[SPR_BOOKE_DEAR] = vaddr;
+        break;
+    default:
+        env->spr[SPR_DAR] = vaddr;
+        break;
+    }
+
     cs->exception_index = POWERPC_EXCP_ALIGN;
     env->error_code = 0;
     cpu_loop_exit_restore(cs, retaddr);
-- 
2.25.1


