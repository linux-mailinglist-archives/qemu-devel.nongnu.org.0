Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7992E18BD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:05:24 +0100 (CET)
Received: from localhost ([::1]:54322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxH1-0001m0-En
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:05:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxE8-0008Qv-96
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:24 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:45847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxE0-0000Mp-OE
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:22 -0500
Received: by mail-pl1-x62b.google.com with SMTP id e2so8583594plt.12
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rh7bsPAA/9+Eab4XLXyBRxwo882az2z0pvk2WgOaAN8=;
 b=eS9kQpMT7d1nxQeK20G/nwJ/+ZlKzIxNEebr8nosWzKLgX24I2/UoCdF9qN8ooGPM5
 JIMJSU+7DUmbDeixpBIifMgs2PpzxEXjHJDiG0/CPScHLGKMUuI+o4oY2RHhklQvnZIm
 xNdBpsPMvQjHzsbL/j2Eii205W6bzWAT5JsLWK3kjuAleWdlDrItSSzCpE3ncU+5srnc
 nyCHYHJHyxioNmUUB97lclFY2FOTt2LjJCd8zQp1mEaK5sHVY+1keYqgQImLaMcSEYIo
 FReKmRrSy4sZvKkanUwOHwg54uTCoIAOFyD7rzRPK9jwX4CK3akcDS0H2bsXE/MQtxzu
 6gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rh7bsPAA/9+Eab4XLXyBRxwo882az2z0pvk2WgOaAN8=;
 b=eoKs/60HVxG1NqAa3DzwVWwHRVpdRjCdIOGoP/QfD/uDOiVn1X1Sg/YhwLkju+xjQa
 mntoUyztBRfLvhG4u1oD2czMFq4rjvPuskTckY+wybgdqXGM1c4NonxiBEz4WMr3J8Ep
 pPbJCmwJHxKUeE8YkmarOt9pfRMO+mOglMaiixX43leee1V+RjzIbxM6I6opXL0V7YLY
 LbHd4hSDPa3rleHPJwZZ2pfj9xge6F2tZln25OQL4ktlUoth/xJHyRZxHvAyU4oSDfrI
 Inv6eZ0gr6g09K88Ey6oO2BEI88KKBJ8s61BmuyNRqJ315wP9IfjJlN5o0kkKyWxxnu2
 L9gA==
X-Gm-Message-State: AOAM5327IC4pZZtSgZzbT3HvlV11KvQa44Cc6imiiX7Nl7/Sn0yqqAlN
 iqa9LGeHe7NX6jqX7SEZY1WboBnBcy3Cyw==
X-Google-Smtp-Source: ABdhPJzHXqcQg47B/NQvvh2/0Wcn1KkSgVSDzWd8e0fjdvhH+iza5r7vekc6BBnL/JnqGZoF8Uorxg==
X-Received: by 2002:a17:902:8687:b029:dc:2a2c:e99b with SMTP id
 g7-20020a1709028687b02900dc2a2ce99bmr23861489plo.37.1608703334983; 
 Tue, 22 Dec 2020 22:02:14 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/22] tcg/tci: Convert to tcg-target-constr.h
Date: Tue, 22 Dec 2020 22:01:49 -0800
Message-Id: <20201223060204.576856-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
 tcg/tci/tcg-target-constr.h |  9 +++++++++
 tcg/tci/tcg-target.h        |  2 ++
 tcg/tci/tcg-target.c.inc    | 14 --------------
 3 files changed, 11 insertions(+), 14 deletions(-)
 create mode 100644 tcg/tci/tcg-target-constr.h

diff --git a/tcg/tci/tcg-target-constr.h b/tcg/tci/tcg-target-constr.h
new file mode 100644
index 0000000000..ddf57ca9d0
--- /dev/null
+++ b/tcg/tci/tcg-target-constr.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * TCI target-specific operand constaints.
+ * Copyright (c) 2020 Linaro
+ */
+
+REGS('r', MAKE_64BIT_MASK(0, TCG_TARGET_NB_REGS))
+REGS('L', MAKE_64BIT_MASK(0, TCG_TARGET_NB_REGS))
+REGS('S', MAKE_64BIT_MASK(0, TCG_TARGET_NB_REGS))
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 8c1c1d265d..cd3dee51bb 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -210,4 +210,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
     /* no need to flush icache explicitly */
 }
 
+#define TCG_TARGET_CONSTR_H
+
 #endif /* TCG_TARGET_H */
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 50a08bef03..9ac6da2e21 100644
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


