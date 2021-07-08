Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76153C17B8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:06:50 +0200 (CEST)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XU9-0006JG-Pg
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5F-0001i8-09
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:05 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5A-0008Bt-0d
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:04 -0400
Received: by mail-pg1-x52a.google.com with SMTP id d12so6590880pgd.9
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Rapr7iimpdhsvlJbkrn7bhLmNAPf2Cij+dMdnxuJ2w=;
 b=hJEZXPhq0stpILgYwy1tcqPPPFWEsoYRhyJ5el/fL19v6ezB1OM0B5wK875Xdhg91p
 p0zUdN1YCeQoKpJo4VGZ8weIQENycuzij10jB6WgH6Ectbfc3wrWJkuX6m/VHx09Vb0N
 stsDk1fk1QPlWk58eRkQ6+ZlQfWB6/9lRM+veE+7QVHlVU4s49Z5HX9fArs2tz2vKdQS
 EpMB2TctGpwj9uUbyZzgVJ7sdKQDps0kj8vo86d4/90GFlahVFgBEA9vdWyw+9E11xU1
 Z1KB/BN/S6P+kKeDE/rqDv5ZtFhwUSMrW056IvjbKe6z11ijuCzIx9NftiIQPXut2oDO
 hG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Rapr7iimpdhsvlJbkrn7bhLmNAPf2Cij+dMdnxuJ2w=;
 b=CTHi+vqHPvI/BAp3yQTEd4S0ozuJvJH1NM1XvvJvYmbxWdOCSTson/uth9g316g9ay
 25QJyuxHHSqcc4CDBXWgEDqkBnwDvoYzpXWdezyjKRY/Q+QO+PDyOdUMUT61qNRFrNZk
 SY3ZbUYCfmQoGvuGEVIvRZcNsCQFZ7Ltu6KBAwGaA+Yy20YMzkXZPKx/zluAZ8HclU0G
 1PJi7P0Ezz5yUB4eqiGpG6FqRS/+R106E2NBjoJhZzAxRTMXip85+zcespa3CSeErN9e
 /cH8GXt1I5lEkRwp9Il90KqTFLaLNECH/rCN3A9smlrUAPbqPgjU4MoewuRG2QRH7lW4
 CMJw==
X-Gm-Message-State: AOAM532i3c+A3IZl8HKZrEX/7mScuefD6N5x/8dd2oHiYBD5UC70baXB
 LCJ2oBhe5+HNOWGgxPLm31YXYvFIyaeKOA==
X-Google-Smtp-Source: ABdhPJyjNkrvrLRcNlO6gTWTsC9uTfW1hqp4ASZdvmh6W0GHgDmOaA+mQ4E9pQ/vmZ9keoXVhrLy1A==
X-Received: by 2002:a65:6449:: with SMTP id s9mr493228pgv.285.1625762456558;
 Thu, 08 Jul 2021 09:40:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/28] target/cris: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:32 -0700
Message-Id: <20210708164050.711967-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test for singlestepping is done in translator_use_goto_tb,
so we may elide it from cris_tr_tb_stop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 4cfe5c86d9..e33a3bb326 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -482,7 +482,7 @@ static void t_gen_swapr(TCGv d, TCGv s)
 
 static bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
-    return ((dest ^ dc->base.pc_first) & TARGET_PAGE_MASK) == 0;
+    return translator_use_goto_tb(&dc->base, dest);
 }
 
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
@@ -3235,8 +3235,7 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
              * Use a conditional branch if either taken or not-taken path
              * can use goto_tb.  If neither can, then treat it as indirect.
              */
-            if (likely(!dc->base.singlestep_enabled)
-                && likely(!dc->cpustate_changed)
+            if (likely(!dc->cpustate_changed)
                 && (use_goto_tb(dc, dc->jmp_pc) || use_goto_tb(dc, npc))) {
                 TCGLabel *not_taken = gen_new_label();
 
-- 
2.25.1


