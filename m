Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CB03C3539
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:39:50 +0200 (CEST)
Received: from localhost ([::1]:38534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F53-0008ND-97
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExS-0005Ld-5U
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:58 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExQ-0002J8-GG
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:57 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so9960935pjl.5
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6X5LcOGj/+Ng0LgouhznZyWXrpfHmdfU0n7UCveDgJU=;
 b=Xt3Wfbt23W9FDJ7E652mM0XdYa0SxGiJo9gXN44zUk4YwjHf2tP9PqYwe0wR4p/m+c
 q0NWQfB5Yf+GG8vzK9kufdTQIVgcLo0xQQAQl0Jzxd1zR1wfR/2aIydbhCLtMOJvoU2Z
 /5AGIROK7iW+l3vJqc1qQyAd76w1U2XEDbIX9twRVDzT7gqHHFpbiHcLLNkeoHG5L1nN
 J+xCRsxEh95ih4ZnhsCEkRpjy1JYzY+RXCJkXzFArOZJ+uO2R05dfhF4fY0BIgcKer46
 U9Ov4m4clVFg61n4RgeFCwyj6aRB+I4i9EFtpfU0tuX2mSR7j50uKxI/tEdgPz6Xn6h0
 z4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6X5LcOGj/+Ng0LgouhznZyWXrpfHmdfU0n7UCveDgJU=;
 b=EVyL1nx5YMASKz3l43YhiIuvHAOzA9q7JW0J932taEIS1cdklLhCptvZiEXJ6GUXvn
 TyMtZkk6/wkqywIVeusxhIIUXR9Vl9MgwAITqKpCo0ZhwifpgvvTBv9iPH+vUJhqKYsx
 D8/Bdo84dQRUdXiZzORzurVM63Y+7eTKwzSpyw0VPVC/Kf8tw8Z/6VrZ4KD2Kscs/245
 cwwWo8IozF+S6QcZiSgvo/prVLJkBmqPO/5Oj8EeQx5yoJh+DQCtZaH22p1PnETURqzw
 eBmR9YkLPWBVEkguuWTp2LubzNz4Dh5SLZgIHo9NBdtsbyCbU+WxPFmL702DmnCk3gdw
 bF0g==
X-Gm-Message-State: AOAM532Z9+cEQvjxhh7J9RcBR70ABzAvHLSNlDmTcWLj4rNlCxfRmfz/
 +9C+PlnKu+SHlvl13Z6VpXcG06WpQws98g==
X-Google-Smtp-Source: ABdhPJw6xsH6CBqDD/23FevN6VF6Eqo4jIUY1m0O8QQ2jZt/haUJQudYJ7vLBuhx4cPPPcpw/PttsA==
X-Received: by 2002:a17:902:e04e:b029:10f:133f:87c8 with SMTP id
 x14-20020a170902e04eb029010f133f87c8mr35537436plx.70.1625931115179; 
 Sat, 10 Jul 2021 08:31:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/41] target/cris: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:17 -0700
Message-Id: <20210710153143.1320521-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
index a6796c83b9..9258c13e9f 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -481,7 +481,7 @@ static void t_gen_swapr(TCGv d, TCGv s)
 
 static bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
-    return ((dest ^ dc->base.pc_first) & TARGET_PAGE_MASK) == 0;
+    return translator_use_goto_tb(&dc->base, dest);
 }
 
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
@@ -3234,8 +3234,7 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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


