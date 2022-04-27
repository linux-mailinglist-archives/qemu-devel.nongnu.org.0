Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBB3511040
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 06:42:28 +0200 (CEST)
Received: from localhost ([::1]:52220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njZVT-000434-VQ
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 00:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSx-0001IR-1N
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:51 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSt-0007SO-EX
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:49 -0400
Received: by mail-pg1-x52f.google.com with SMTP id z21so556261pgj.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 21:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NRYF+Ra7iYksoyhTCV0mNo+OicYLHFeWp8iuqZeYmls=;
 b=n7xxUqpFJ3DQeo68209tgAQSatM8OP+ppHOMQSb6Mfw4ZtQXuKWaOtRCtb5hCErxj0
 J9rHwIUbrVPUNXOKuDD2VV+jJdboHdQ9D/mJ3NJENqnuu8Nk1FePYGbYmTESe/0Kp3sl
 1K9wop/GoEW4AL4Q4q7KiQW9am6UZnnlg3IdLDnF2cUOoaVvXw7Va4v11nLAmlwdudM/
 UgXDOxdxj66KJ2pVdbkGO/GfBtu2DlM0JrscJqwZXhnBtjcsnYbdD6RSt/JTQb7dmsTB
 DIY1gU1rsPU4Jfspg4EKLrlX4xIMSyOgHMCOdFkd55Hg6H0pLGM8Pgezc/MuJaW4DeIN
 NlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NRYF+Ra7iYksoyhTCV0mNo+OicYLHFeWp8iuqZeYmls=;
 b=EhVQ5sXXMvQiH9E3ElNH2n8MenO4njZbnSG9DTmkfK6XcqJYR3u3hwuY1vqaJXwX82
 52VaATcw4LFC0sW/fXwXUMyQY1mTSPG50a9BAXlK4jsHe3xaYkVBcV17jn2q1tBdnwn/
 pxwgRuCrM1YtgkgD7AXIGvXrg4ndivP/rVNsIZVd0jSnVtwJUTI9us1W3FEQARNBMgoR
 VIXjR3DPg02X8Z7F5OUEPe8LFnA3cQ4QaYQe3LjPqxnOBA60mRYZLQJy19Byn4keImD2
 H1q2TXzKJVfr595J+El4EpuHyqccyWakvTxDkCENhR89QkXe0FN++djq+hpvUM83xzu7
 x4gg==
X-Gm-Message-State: AOAM5320XFTt95DbXf/FXxSKtYNDqTd7pDXHBEHqxY4dauEhMJ901t3M
 /C+XPgHF+fIWD6SImpdlUp1Y/nrFClsjnQ==
X-Google-Smtp-Source: ABdhPJyPgTemeoQJm4uhv+uY06kdhBCwxem4TEmFzNpr7k/u+XdApn8GbfDyRqGOXRiP1yYLPwVXYA==
X-Received: by 2002:a65:6093:0:b0:373:9c75:19ec with SMTP id
 t19-20020a656093000000b003739c7519ecmr23146630pgu.539.1651034386201; 
 Tue, 26 Apr 2022 21:39:46 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f16-20020aa78b10000000b0050a81508653sm16875632pfd.198.2022.04.26.21.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 21:39:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] target/i386: Suppress coverity warning on fsave/frstor
Date: Tue, 26 Apr 2022 21:39:39 -0700
Message-Id: <20220427043942.294654-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220427043942.294654-1-richard.henderson@linaro.org>
References: <20220427043942.294654-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity warns that 14 << data32 may overflow with respect
to the target_ulong to which it is subsequently added.
We know this wasn't true because data32 is in [1,2],
but the suggested fix is perfectly fine.

Fixes: Coverity CID 1487135, 1487256
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Message-Id: <20220401184635.327423-1-richard.henderson@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index ebf5e73df9..30bc44fcf8 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2466,7 +2466,7 @@ static void do_fsave(CPUX86State *env, target_ulong ptr, int data32,
 
     do_fstenv(env, ptr, data32, retaddr);
 
-    ptr += (14 << data32);
+    ptr += (target_ulong)14 << data32;
     for (i = 0; i < 8; i++) {
         tmp = ST(i);
         do_fstt(env, tmp, ptr, retaddr);
@@ -2488,7 +2488,7 @@ static void do_frstor(CPUX86State *env, target_ulong ptr, int data32,
     int i;
 
     do_fldenv(env, ptr, data32, retaddr);
-    ptr += (14 << data32);
+    ptr += (target_ulong)14 << data32;
 
     for (i = 0; i < 8; i++) {
         tmp = do_fldt(env, ptr, retaddr);
-- 
2.34.1


