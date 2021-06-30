Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F17C3B88A8
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:43:46 +0200 (CEST)
Received: from localhost ([::1]:58780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfBZ-0003MO-BY
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0n-0005B3-Ec
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:37 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0k-00021T-Ry
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:37 -0400
Received: by mail-pg1-x52f.google.com with SMTP id e33so3206703pgm.3
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pCw6fLSKCEavs1htLRAjDwkOxh3efrl1ZEcFJiTTMvg=;
 b=T9pCnmwcoDUHtHGFeDqFXX63m+YAFJJHtY9WnHm0bMMbojRAxQo8bKSYd/QwEiM9N0
 W5rLbJkYHPJmlmUtlzf9xd1agh8RzedxsnpvQ6dqtgJUTBij8VDpZJ0sM9rSXCjbgkMP
 MGVdD+6pbarLJnZ9OiUmBZZHP5ifwcc+IqGIIr+Jo90BKrum9GyBE7MPfFk6ZtcINKJB
 +TNPyHRNxxkyHSL9xKSjE1KlglwB2cyNLVphrypv+G/71KBUik0vlyRnZVHiib5guReu
 8vDKf979mTU3jSlWjkldTt1pJz4gCVjJj42t4kFOubbOhtDEJf1cjojyUw6heSLuio5+
 2FMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pCw6fLSKCEavs1htLRAjDwkOxh3efrl1ZEcFJiTTMvg=;
 b=jDW/WCa+0MQf0NWj6GJrbpQIoybUKbSYqgouNEyz9jUFX0Jz8zO7CABCxB3j6gqn3D
 ic4xkb86jAkjV5yEEyF88V3piwpzAU3DnVpXbVRKQzHAZxAeRkDib1DKyK6KMqsh+y1B
 Z7g4n2hfVB1OI7M04YfpEz4NrnLym/EVlhspYW0EEGV8vNQM3FzXV5lL/jGNMthn6saS
 TKnrGZerCBslwas+FElutVddmpIueYEAN3WNtFFDdM9WbVn0ZSUxmt6+c6Egc8nY+2J1
 k2HIoNuHfudsykSGPGinSeUQRpcHoKqFKimABt8MR6pLWvmCs0dQYta2JYUdG5XidCWC
 2nbg==
X-Gm-Message-State: AOAM532DAm+kFm5zqve/Z1gcNwhzSEYU06CHal2+xemEIaLVjhqgrdhd
 mbLF3iQ8DXIjOy4a9/hh5q28uIAbEu92qg==
X-Google-Smtp-Source: ABdhPJwtE7eAjcFvl8FzvVWCxh08Z03Pv8Y1deQEsZ3ipTYNfd8ZPDEkemMKU0RjJ+3sAjDFk5Utxg==
X-Received: by 2002:a05:6a00:14c4:b029:303:fd5e:3800 with SMTP id
 w4-20020a056a0014c4b0290303fd5e3800mr37610153pfu.41.1625077953593; 
 Wed, 30 Jun 2021 11:32:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/28] target/cris: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:08 -0700
Message-Id: <20210630183226.3290849-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test for singlestepping is done in translator_use_goto_tb,
so we may elide it from cris_tr_tb_stop.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
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


