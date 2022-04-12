Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37934FCA19
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 02:49:22 +0200 (CEST)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4ig-0007G8-2p
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 20:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Th-0001xk-BU
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:54 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Te-0001td-IJ
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:53 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so1087026pja.0
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9MdMCTNBx9cByysiLT0tBOtkhuq/SFnwgPJW7sLNEiM=;
 b=lUu8DYA5dHNEOkMefLoeaC702/XxU8AgEAuDP61DzTsTAFMGlccE5WL8qoPfv3lLxI
 7W4rx2K20tO5oneDsR48E+NVturoka51R2ZuHjZFmn/Q2ttPIja3MFWr62McCZwKg2Ih
 9TGKbSRhDoVaCZuq3yKuNYkVu32XeEeO3nm7/k2UYQqc5QfIcIb8PK6hWL0bOu86cmqN
 UsdXtOJjW4Sc9GJn85Hy7n3Jpuj5oXyzXrZD5vAwlJSrpzXo3KlnPbuKNMAOjivYSUsH
 XK8NHlS05gxtmJ/2gQEIbRN5mDAtNVpR2+DVADM5dnZFKq4ZU+M08EFbK7TmDFhaSQim
 /G0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9MdMCTNBx9cByysiLT0tBOtkhuq/SFnwgPJW7sLNEiM=;
 b=uHRa/fIsRX4C7/slTZOSbnSwntjBSYrKTd/DGWPHzIGJF2hGb7ZVxrUO5eOJUZ5gdx
 JKNdY27k11EHCwfriMGUl0hy4u/AwfrcbN4NAgDJY41jlbXgND6mO+3Ltaqqhvt7OUSK
 FLgVndsgczbHe/4Fa8uxyTKYIzn3dG77J+l78B4yDqgU5lmJmspaFJkmpJQbGJPJipKe
 DhGK5uJ01kI2yfZXlnTPRwbLIljg5y32Ok6dgH7JjsY616bouWL+fG8mTlK7+p6V2/kS
 IrzRMkycrBoVFkeNqLhrwK7DarA0NeoLfaI6dLDXNJbCns2R76Y+rPPDnOnbVJeJCWsr
 PouQ==
X-Gm-Message-State: AOAM530O4fobGPu0iBcji0h+/deO8ODGTr3ezbGfy3qB/Ga0jU3R1tuf
 ++3/lL8crHfu+TUGiP1e869vpPirStQUlA==
X-Google-Smtp-Source: ABdhPJx3V/VZ38I6CJiSfjH22D4kn/RB6fT9S0NXb0VLm7xx4sO0C7n1UhcIoPH6lwLNZsNRVbla1g==
X-Received: by 2002:a17:902:e74d:b0:156:9d3c:4271 with SMTP id
 p13-20020a170902e74d00b001569d3c4271mr34600442plf.79.1649723627710; 
 Mon, 11 Apr 2022 17:33:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/24] target/arm: Enable FEAT_DGH for -cpu max
Date: Mon, 11 Apr 2022 17:33:24 -0700
Message-Id: <20220412003326.588530-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

This extension concerns not merging memory access, which TCG does
not implement.  Thus we can trivially enable this feature.
Add a comment to handle_hint for the DGH instruction, but no code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/translate-a64.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index f75f0fc110..bc9cdda75a 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -16,6 +16,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
 - FEAT_CSV3 (Cache speculation variant 3)
+- FEAT_DGH (Data gathering hint)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2b6b9afd76..8934ced19a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -738,6 +738,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);       /* FEAT_SB */
     t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);  /* FEAT_SPECRES */
     t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
     t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
     cpu->isar.id_aa64isar1 = t;
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4fc31807ff..0adfa1d22c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1442,6 +1442,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
         break;
     case 0b00100: /* SEV */
     case 0b00101: /* SEVL */
+    case 0b00110: /* DGH */
         /* we treat all as NOP at least for now */
         break;
     case 0b00111: /* XPACLRI */
-- 
2.25.1


