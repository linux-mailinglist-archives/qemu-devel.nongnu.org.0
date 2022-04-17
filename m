Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96315048F4
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:36:31 +0200 (CEST)
Received: from localhost ([::1]:34880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9l8-0006pY-UU
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90M-0004MY-18
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:10 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90J-00041k-HD
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:09 -0400
Received: by mail-pj1-x1035.google.com with SMTP id bx5so11322162pjb.3
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dXnzIOLVWxiQUUxJDgWm+uk0rCunZPcvtv01su9duzA=;
 b=IwyoYnQ3gcGuhO0cGuMFU6sYQovqwQ/KBdTKSL+LakbeC9SNFcYpPGtfJyc8us6hUU
 IvHVl3rFlQvyxN1mwiQSvDYnVoX6yS96xdbJT+p2aJPmrx/DoFTo+/AC6SWmDSgrLHsG
 Zpbd4W6j9bXEav5vHd6sO1FYNvH+kr97mnh37aPIcliVFXtciwQokPAwljIdLEkd/Dmm
 YkoPGb0zzvurqI0cIdZyhaZQFYH5p7NZOKchSjhJ6uZCujtROVWQKU4Kg1DBBUQNTozk
 ETMshohEnweRB+j3IsfCZtGrFfVso9MrEhfGNvasc4vZEpeQpTLXK2mIo743zf72AFGN
 XxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dXnzIOLVWxiQUUxJDgWm+uk0rCunZPcvtv01su9duzA=;
 b=cSJ/8UbhE2bf89z2xZ0BmEg8BT0ymeRbnHFVa+0R3OvxFha0XzCpgSvzYAQE/VMoi1
 TKxVX5ycIjWl7Rhd54ExevncLNYy3UmIFZ1BXrbbxV9Vq0s9/XRRmA/6AZKsbV08THyN
 qj7jdWExKSiiuYdzvei9fIVsdH7q1yG4Chcc130YA6162hbRl9CC4665S2c3YAW7XOg/
 tpPT3WJVrZHuzLxNp+IfYqccsGsio4U9WQZG+cidBU5vGSlLvJPOAKtc/ruuUbuYwAnT
 6RlyGpWx2nayCFpkB4Vlzh7KfdhYwqT59zVnK1TVBefQ9cyBWD3/0BLGXZNKyAQ9L+jI
 0NFg==
X-Gm-Message-State: AOAM531ub09x6q/Vo8XkKfnKO4Qubz0E9hMq6Z1ZXy0zo5YBanFbyeL+
 zSbgThn0P8mrdSd8MIewocL83nS6MAGSLw==
X-Google-Smtp-Source: ABdhPJyn2ceG2Z12XC4oGnuZN73U9cmedZmvqtYmP39Kvbm6p5n/Jhvd5k/1obDFqwEotcbh/zXVNQ==
X-Received: by 2002:a17:90b:268b:b0:1cd:3f24:d52d with SMTP id
 pl11-20020a17090b268b00b001cd3f24d52dmr9072835pjb.174.1650217686237; 
 Sun, 17 Apr 2022 10:48:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 42/60] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm
 -cpu max
Date: Sun, 17 Apr 2022 10:44:08 -0700
Message-Id: <20220417174426.711829-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We set this for qemu-system-aarch64, but failed to do so
for the strictly 32-bit emulation.

Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f9094c1752..9aa2f737c1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1084,6 +1084,10 @@ static void arm_max_initfn(Object *obj)
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
     cpu->isar.id_pfr2 = t;
 
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
+
 #ifdef CONFIG_USER_ONLY
     /*
      * Break with true ARMv8 and add back old-style VFP short-vector support.
-- 
2.25.1


