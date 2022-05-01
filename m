Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AD2516278
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 09:19:28 +0200 (CEST)
Received: from localhost ([::1]:38576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3rb-0007fb-4m
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 03:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2XA-0001Cb-9S
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:54:17 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2X6-0001m8-Rl
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:54:14 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d22so104960plr.9
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ffCp2E5F/+S85cFm2jKC10BX2N+sZzcIlrVCqyHFbrg=;
 b=zxJYJUsGj3UMTelT5M2HSrf0qaKnT/X2o/MbbbJP33P/jKqt5SaZVjuTr4XE678RcU
 p1cnpxxwlUJ9VMoYhsBUcafrDSTNuJMeeG6EzOrpfi47NGVdMLDg5h4pu32iA0LuZ7KF
 /HiKCH0tc6dTWh+jSo0nFhAZc7w8hZT/Sj17YuSeYuSqbcbq8ZmOpH1TrTaMLXCZleFy
 AB/JoRJxFiRKvNKLWPXfjN1KXQ+gA+CXbNnzEqT2HQU68aP7nU4Tw7vw/iUhrthBYZkW
 hXnaka1r65/Gf9oJjPaHCVoE9noWpDHJT0t4vLwmjh8dpjKG76WysD7Z0yn9tl2FHld3
 qNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ffCp2E5F/+S85cFm2jKC10BX2N+sZzcIlrVCqyHFbrg=;
 b=zJg9FsGsPsjg0xDTZhkqlF6d9CnlOzxOduqnQZgyuOTzXnedCaQJ2rPoUZSFj43FoV
 mDr+JIrjSrKxmSErHHGiSy6f4JUSyVo88JUc5u306wvlZ+J6wjq3dALRMC+y9BeuxiDy
 vWmRCfZ37zrL6d8E+VVy7HVhR8nKqsPAZcLLY5Og28SVF6K5Cyrz2Jft1aL2NUop3VSH
 FGXEANyXj6R+vyfGz9RNkrB5ZpYM/j+51eoxXktp/aNJq19bCZ6Fxud9s+CkL4mHk5rw
 0E7KAVZPJgNq+Dgc1F7xu71i3lXNwTDT63IsO9mPD+/lSq+RHv4662usfwi7bx4UVl+G
 /YdQ==
X-Gm-Message-State: AOAM532lDMeiFUVSzkPYq/6/S/By+8KUSL365Zd3CODLqwxHrb+4+KvP
 CgR68jHByb4ZdICjqhFo59GnLegWs8/73g==
X-Google-Smtp-Source: ABdhPJxu5gKq24w25XtOOqiunLYW774XHug1zE3LNJzAjy6r5cXeJm+wXppWs1WUeGFkHnPCjekyGw==
X-Received: by 2002:a17:90a:c595:b0:1d9:532e:52fd with SMTP id
 l21-20020a17090ac59500b001d9532e52fdmr7143348pjt.79.1651384451611; 
 Sat, 30 Apr 2022 22:54:11 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 u63-20020a626042000000b005082a7fd144sm2341507pfb.3.2022.04.30.22.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:54:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 43/45] target/arm: Enable FEAT_DGH for -cpu max
Date: Sat, 30 Apr 2022 22:50:25 -0700
Message-Id: <20220501055028.646596-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 48522b8e1c..8ed466bf68 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -17,6 +17,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
 - FEAT_CSV3 (Cache speculation variant 3)
+- FEAT_DGH (Data gathering hint)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 40f77defb5..f55121060d 100644
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
index 5a02e076b7..6a27234a5c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1427,6 +1427,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
         break;
     case 0b00100: /* SEV */
     case 0b00101: /* SEVL */
+    case 0b00110: /* DGH */
         /* we treat all as NOP at least for now */
         break;
     case 0b00111: /* XPACLRI */
-- 
2.34.1


