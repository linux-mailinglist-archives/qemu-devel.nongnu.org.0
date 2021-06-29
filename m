Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A710A3B78C1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:36:49 +0200 (CEST)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJXM-0006Fh-LN
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItH-0008GT-4O
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:23 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000tf-3M
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:22 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 in17-20020a17090b4391b0290170ba0ec7fcso2259987pjb.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UpFFrLOSrARsKBhNwiFx6rXuoH136/XwhR/W6bC1nH0=;
 b=W0xriqz1xkZ4oxC9IhK4EhE7b7kGmL+b89SaDo4xB+p2FVVdKZWv+JpeKPC14Ytn8V
 Ikimro5mWotU0LCXVJHm8d0l9MoP6QYEJxRbc1LJKYOUdMN85OfrnyMTKI8aLRAdDA6F
 jGD39QTpuKV1p/lU0rhLgS1vfYERLz8Hscj4YhOhfDTaUx4/bEHH2Ki8O1Ndu7rHOSue
 JSgcoFkjHHuZpXRy5Twbxp9VTG7YnpUu18/zMdPnhH563FWmsNyCe96uz26HTx1tAaPv
 4BJAiedf9CYg8642fKpfPBjU6QdWV7C3YkfiZA9KMTX2dQuqj+oLxlRL8VJmAc1oaj5A
 Vy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UpFFrLOSrARsKBhNwiFx6rXuoH136/XwhR/W6bC1nH0=;
 b=NFn+MVX1Oa/kRbRn6ydUz7KW7ZmMh9cR4/KaCDEvQMgajtDQ5qnRQtf0Tqp8H0LY80
 fzBC3NBAyzWLP4LIXGMPY1dV1rFCRoKrggHn+76yIS7xC05e1bw2cTSKI0RnpCwr1mGV
 sEbS7LcWPCJdW/G/Wb2Xuv9uoYMa6ba3ORDnJxw+QhDqkBIXtSECcMLjPBSxJd4IEFRq
 u8j+bcB0DtsJ+t1qviNVtkuNIATCYMO82XWBN6S1dPrbr3wp0gWNavoisKx6A7AHbHyO
 EnOL7mstVmB/0RISSmRDRNFUaq1nx5mnlqPrHOfjN3sJ7cMRfeapZjxpngpsvCyYaVJY
 gHTQ==
X-Gm-Message-State: AOAM533JJKTerv/sC5ilNVya/nrK7VX8myqGrwROfMQbYc6gkMOCldSR
 l8XkStkjIUQjy0aD3kt8YB8BPuz3VDMsGQ==
X-Google-Smtp-Source: ABdhPJzF/zHEvUWw+pIov0lZbBUEjXecEE9t+zm6hHCKyLkO/3KgnCf2U/rsufk6Q6hVXGI9nOPt5Q==
X-Received: by 2002:a17:902:8503:b029:127:8abc:191c with SMTP id
 bj3-20020a1709028503b02901278abc191cmr28932000plb.21.1624992907969; 
 Tue, 29 Jun 2021 11:55:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/63] target/cris: Fold unhandled X_FLAG changes into
 cpustate_changed
Date: Tue, 29 Jun 2021 11:54:13 -0700
Message-Id: <20210629185455.3131172-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We really do this already, by including them into the same test.
This just hoists the expression up a bit.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index e14b7acb10..80276ae84d 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3217,6 +3217,10 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         cris_clear_x_flag(dc);
     }
 
+    /* Fold unhandled changes to X_FLAG into cpustate_changed. */
+    dc->cpustate_changed |= !dc->flagx_known;
+    dc->cpustate_changed |= dc->flags_x != (dc->base.tb->flags & X_FLAG);
+
     /*
      * Check for delayed branches here.  If we do it before
      * actually generating any host code, the simulator will just
@@ -3227,9 +3231,7 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
             t_gen_movi_env_TN(dslot, 0);
         }
 
-        if (dc->cpustate_changed
-            || !dc->flagx_known
-            || (dc->flags_x != (dc->base.tb->flags & X_FLAG))) {
+        if (dc->cpustate_changed) {
             cris_store_direct_jmp(dc);
         }
 
@@ -3263,10 +3265,7 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     }
 
     /* Force an update if the per-tb cpu state has changed.  */
-    if (dc->base.is_jmp == DISAS_NEXT
-        && (dc->cpustate_changed
-            || !dc->flagx_known
-            || (dc->flags_x != (dc->base.tb->flags & X_FLAG)))) {
+    if (dc->base.is_jmp == DISAS_NEXT && dc->cpustate_changed) {
         dc->base.is_jmp = DISAS_UPDATE;
         tcg_gen_movi_tl(env_pc, dc->pc);
     }
-- 
2.25.1


