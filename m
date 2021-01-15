Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514CD2F8733
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:08:28 +0100 (CET)
Received: from localhost ([::1]:46550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WKZ-0005er-B6
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHR-0003lk-U3
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:13 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHP-0004DI-C1
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:13 -0500
Received: by mail-pg1-x534.google.com with SMTP id c132so6814349pga.3
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lm+sv1ny+3zBFy24jYLeYtVIN651JU9INKsPNxPPk8c=;
 b=Rl2g/SCiXw2puIHNkVLnmdyD3ihxzocqDmTRH7EasYlzmOKmXUrBONck+8UL64/iZC
 DAwwpUCOYzulQkNSuopMIx3/eJYAvEbOLsqOYynxE3yuSryxN7edxIZfCDpVGQR5KblQ
 zxKnMOGp1W9ppPlXry4ep1ZAF7UvKG6OD71yNche6Z5XB7lFZw25LLmFd5VHph6gwPoi
 92aPf+mAcFs6SjAC85KHY/iInH19euQoQeC+x4MzvIpddGFFfMft872vbF4wPFeNEpdV
 HyNWH5BkELzDxzkWHLaRahXh2S8xzA3DHg6JKWm1qnNvYaxXs4lODBIYrC1evi3MImg9
 N4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lm+sv1ny+3zBFy24jYLeYtVIN651JU9INKsPNxPPk8c=;
 b=fETEiOvx3BtjbchQmW/VJ5oD0kDcZAF5rPHqDAKawefmTsrC94dts35J7Fau5zDzqQ
 dDky4SaQ8By959/w61WMoTsIhnYl5asW8IEorJvGBe/bIQqXqjkUJWFXL4rwJj8LyNtp
 7cXqAvYy4hoi2t9e3zEN2cMrjjM9P95INCond6QShNNeMN+OFsvwhd+q+6mTCLEsW8mf
 AxwsISg6o1jXdpxDotfsEo8wAgWfcJazWKef8R9uX67gD0Tm8uUDmr3pPYiSBKkeBkXf
 DMSWOLqTtFh0l8XSOsndcKCsLx9nLTSfkAO4ijz/RViJaOGM+phWE0sH6seZQz15WL+r
 Dfwg==
X-Gm-Message-State: AOAM530natbew4yJQNTBlCVr2jLkZnhKbY1H9d5xJiiylYGZmF3A3aBV
 T7iPEdPTWdVSbqN35oNZcIRKp8WP1lly057E
X-Google-Smtp-Source: ABdhPJxs0gFRel3LxkEiC0j+Gm8VIsFEdohEC1Xl/gf2KFa+Pa8gA7Kyb1dQUT3xE91wI968aNA/Hw==
X-Received: by 2002:a62:19cb:0:b029:19e:75c2:61ec with SMTP id
 194-20020a6219cb0000b029019e75c261ecmr14514891pfz.19.1610744709635; 
 Fri, 15 Jan 2021 13:05:09 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.05.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:05:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/22] tcg/tci: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 15 Jan 2021 11:04:41 -1000
Message-Id: <20210115210456.1053477-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115210456.1053477-1-richard.henderson@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target-con-str.h | 11 +++++++++++
 tcg/tci/tcg-target.h         |  2 ++
 tcg/tci/tcg-target.c.inc     | 14 --------------
 3 files changed, 13 insertions(+), 14 deletions(-)
 create mode 100644 tcg/tci/tcg-target-con-str.h

diff --git a/tcg/tci/tcg-target-con-str.h b/tcg/tci/tcg-target-con-str.h
new file mode 100644
index 0000000000..87c0f19e9c
--- /dev/null
+++ b/tcg/tci/tcg-target-con-str.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define TCI target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', MAKE_64BIT_MASK(0, TCG_TARGET_NB_REGS))
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index bb784e018e..ab832aecc3 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -207,4 +207,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
     /* no need to flush icache explicitly */
 }
 
+#define TCG_TARGET_CON_STR_H
+
 #endif /* TCG_TARGET_H */
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 9c45f5f88f..c913d85c37 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -384,20 +384,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
     return true;
 }
 
-/* Parse target specific constraints. */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch (*ct_str++) {
-    case 'r':
-        ct->regs = BIT(TCG_TARGET_NB_REGS) - 1;
-        break;
-    default:
-        return NULL;
-    }
-    return ct_str;
-}
-
 #if defined(CONFIG_DEBUG_TCG_INTERPRETER)
 /* Show current bytecode. Used by tcg interpreter. */
 void tci_disas(uint8_t opc)
-- 
2.25.1


