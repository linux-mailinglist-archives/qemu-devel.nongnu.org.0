Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED99436F898
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:42:36 +0200 (CEST)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQbU-0007lM-2B
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU1-0007UM-L0
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:53 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTz-0001GH-Mz
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:53 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x7so69946007wrw.10
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=i+MUZfR51udbEhU7g/6KNDdoa1+wGw6qynj0bMKCyjI=;
 b=wnirDwXZcGjcjnQP+6SjhgbAhHoA8Yl+0ofZMOewMnFw7uzLpnK/3r1AZUWnajTAji
 Mj3RqEbwtMet/rn2JCQDU8eR7EdBcAl23Hu6YqbNXL2dd32DwngGdK+Br1NnMfDtkvNI
 mynZgb8yH/DQxQwGkVQ02VsWSfkhCEi4JUWO96pgAltk5YnXjbsXcJdKZ1+c1zynyUbM
 vwbGigWPcFR9yWvqc3LLOsgIgCU7R7w3LzCxehQ1anG8LZKpGllMmU+8SDjaybzlx1qj
 wNLL2iaSUSaIme7YVtVuhIDYgEAgwzfg+BKos/JFy8deU0pz/frm/g263EzKXk8M6ui6
 Cbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i+MUZfR51udbEhU7g/6KNDdoa1+wGw6qynj0bMKCyjI=;
 b=NvjHSAZdj8dUg+F2B1PWJeRiR1fR6vn+uLNmveYfQcuXV1zDWBQI9iO0XO+8gPaj8Z
 eHze1XaLuMVOqV31FSFHwB4m0xzrFpjI1PspF4Nm6C7VF8h1cC1MvMj1ane/t8aOEWu/
 Fjh14cBQ0R48lkuckyj7geAo9oGlkrXPVoNsdEFmo7tg3L6WAwaCjsw6WMmOYdO1Telx
 G0DDYBkL5+MwhNcNhVIcZNlr/0G7HeNC2hLjvUN+Z7MdUufe1iszjSHtZZF3ND8/cNps
 bLiEfeLtqP3xROVqVn8sPBBxhwRdLGSA9De/IGMMRxa0Ic206bRXf5f61k1YXSiB1Plc
 h8nQ==
X-Gm-Message-State: AOAM531IpELb1ntA3zKwOQipWaPSeyixHDdH0NYik+u9pp1cecgDGwb+
 97A6+BnKvxXEwaMb1+UwhlX3lBuDSV/cSHLT
X-Google-Smtp-Source: ABdhPJycpBfjftMLb2d7Tk2Yckr6IrgrA4YYvUB/LoYzLBem/Hq5hqVBZaUlcvDycEk2hIDGA6qmfQ==
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr5749070wrc.378.1619778890071; 
 Fri, 30 Apr 2021 03:34:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/43] target/arm: Rename TBFLAG_ANY, PSTATE_SS
Date: Fri, 30 Apr 2021 11:34:08 +0100
Message-Id: <20210430103437.4140-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We're about to rearrange the macro expansion surrounding tbflags,
and this field name will be expanded using the bit definition of
the same name, resulting in a token pasting error.

So PSTATE_SS -> PSTATE__SS in the uses, and document it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           | 2 +-
 target/arm/helper.c        | 4 ++--
 target/arm/translate-a64.c | 2 +-
 target/arm/translate.c     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 304e0a6af30..4cbf2db3e34 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3396,7 +3396,7 @@ typedef ARMCPU ArchCPU;
  */
 FIELD(TBFLAG_ANY, AARCH64_STATE, 31, 1)
 FIELD(TBFLAG_ANY, SS_ACTIVE, 30, 1)
-FIELD(TBFLAG_ANY, PSTATE_SS, 29, 1)     /* Not cached. */
+FIELD(TBFLAG_ANY, PSTATE__SS, 29, 1)    /* Not cached. */
 FIELD(TBFLAG_ANY, BE_DATA, 28, 1)
 FIELD(TBFLAG_ANY, MMUIDX, 24, 4)
 /* Target EL if we take a floating-point-disabled exception */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 556b9d4f0ae..cd8dec126fa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13333,11 +13333,11 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
      *     0            x       Inactive (the TB flag for SS is always 0)
      *     1            0       Active-pending
      *     1            1       Active-not-pending
-     * SS_ACTIVE is set in hflags; PSTATE_SS is computed every TB.
+     * SS_ACTIVE is set in hflags; PSTATE__SS is computed every TB.
      */
     if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE) &&
         (env->pstate & PSTATE_SS)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
+        flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE__SS, 1);
     }
 
     *pflags = flags;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f35a5e81746..64b3a5200c2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14733,7 +14733,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
      *   end the TB
      */
     dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
-    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE_SS);
+    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE__SS);
     dc->is_ldex = false;
     dc->debug_target_el = FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2de42529530..271c53dadbc 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8925,7 +8925,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
      *   end the TB
      */
     dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
-    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE_SS);
+    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE__SS);
     dc->is_ldex = false;
 
     dc->page_start = dc->base.pc_first & TARGET_PAGE_MASK;
-- 
2.20.1


