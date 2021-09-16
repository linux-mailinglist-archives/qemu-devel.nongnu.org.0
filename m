Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805E140DEE1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:02:02 +0200 (CEST)
Received: from localhost ([::1]:56546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtpp-00057H-Da
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLk-0001bZ-Ff
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:56 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLb-0002b5-1l
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:56 -0400
Received: by mail-pj1-x1035.google.com with SMTP id j1so4804315pjv.3
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RwS32umeuTKtPdFMznfukznJpzAEayn9YEvDSjPds5w=;
 b=ttN/Vs2FPJnOu1F6W/xNZnzNo0PSBw5JWVzpEGcvXqe4sKOWGgwArcH4W2hUa0LIVo
 DoyY5KTc9mf3L/Cx0r3SWKCJ4EDPjvc8ywzJJgmN5Z4E/jSeVeKSiNfZgESQaTPyoG87
 SqlTzCrYCr2Ir6LyfJkH6edUON76xBU0fDyhSuwrVz8l6znywEGweSsdUZR/5F42s52q
 mNPoznlHJmmTmEuZsV519eE6S7zdKCIcElWrsAAQ/Xht7rrV4LaQkizzCUwhoDLPOOku
 GlUls5kuDX0/3huiUVj2CAU61kcAAgvpFBjp3kKJBWCr6OmtU4DuCDE7DmP461CAZsbK
 xzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RwS32umeuTKtPdFMznfukznJpzAEayn9YEvDSjPds5w=;
 b=IACRJMLm3U0i/i65KfAMjjCYSsu1vCT6gvhjWcLZgA0Wj5/SOIrwmbjSR3fSmNMJzC
 Z/HOAjmkWeTTBeDJ/9DTKwvc1RXg2ZO7EoZZbMvjLpFTUGCBL/OxYDzsivEwAywHMhzf
 yivInozO0qwcqafZ3mgqgim0MwZH1lEW+sPGgnK5cxLXHkTbEyRBgPdTU+j5B3TRbQW8
 WGvjj8k4vE1y30wwVVDZeZ34S0BNaf0QHp46vEXkrh97Ih3+XFWOErdxXkRnZgCE/5Rn
 hHJbZcje/cIaVv87PQD+wrYXEpw4N8J4o/GswnaeXvvVyqiYmqB+xQUSz+V4bWyqPNv3
 XWFA==
X-Gm-Message-State: AOAM533/q7B3qclT7Y46LzQXpCam67NrpzkUr2t41fQ55RUyalJWcRKE
 5halVY3Mud6GTdigzN8T64OmKnqLxxMoyg==
X-Google-Smtp-Source: ABdhPJzgRupjKFEAi1j0uKbb+EIAbyHovwR6CjDEVYndz4qcrgDDPVYPKj6sQbWryxD8/Jn6gWO91A==
X-Received: by 2002:a17:902:7e05:b0:13b:7282:957f with SMTP id
 b5-20020a1709027e0500b0013b7282957fmr5341637plm.50.1631806244328; 
 Thu, 16 Sep 2021 08:30:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/35] target/sh4: Restrict has_work() handler to sysemu
Date: Thu, 16 Sep 2021 08:30:16 -0700
Message-Id: <20210916153025.1944763-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict has_work() to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-26-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 2047742d03..fb2116dc52 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -58,13 +58,14 @@ static bool superh_io_recompile_replay_branch(CPUState *cs,
     }
     return false;
 }
-#endif
 
 static bool superh_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 static void superh_cpu_reset(DeviceState *dev)
 {
     CPUState *s = CPU(dev);
@@ -239,6 +240,7 @@ static const struct TCGCPUOps superh_tcg_ops = {
     .tlb_fill = superh_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = superh_cpu_has_work,
     .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .do_interrupt = superh_cpu_do_interrupt,
     .do_unaligned_access = superh_cpu_do_unaligned_access,
@@ -258,7 +260,6 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, superh_cpu_reset, &scc->parent_reset);
 
     cc->class_by_name = superh_cpu_class_by_name;
-    cc->has_work = superh_cpu_has_work;
     cc->dump_state = superh_cpu_dump_state;
     cc->set_pc = superh_cpu_set_pc;
     cc->gdb_read_register = superh_cpu_gdb_read_register;
-- 
2.25.1


