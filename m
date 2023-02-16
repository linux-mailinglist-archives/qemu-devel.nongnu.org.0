Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BC9698AC5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:59:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTK-0003Vr-2v; Wed, 15 Feb 2023 21:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTI-0003VI-GC
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:08 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTG-0005ls-Bl
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:07 -0500
Received: by mail-pg1-x531.google.com with SMTP id 7so427384pga.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XpxrtDgBblg1xHWmk0z4agClqvDtMclVGTGWwtGIZic=;
 b=PUA+M0pFskLHb8VIAAW9koLR3Lq5nb72g1mvOprB8XrpaXYiuleAYsYx5wAew/Cy/F
 k5M8NMyvzho2nIuZifsmYEv49Yv2KtrdIl/u0tu8iaZM6UgvYu9hAbwlHm6UR5pyKKfZ
 KVRzz3wvSO0AtAVSZPxoNo5iZ39VjAgL9VEd4pJpzZTg4Ecy+xXw/GYPupdG2fHVsQNs
 tDzFti5rfeMyOrtNpH8Q+2uLhbZr36Bm0mJtcBplMhyYeFUEcKdEF8vr46g+s1QWceUE
 KaGQKM+MTUcdEGcwmcZE7tr8Ljqte//J6EF5l0c0rtwN4xTiY1lE6xb4E5tYAf5Esylq
 NqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XpxrtDgBblg1xHWmk0z4agClqvDtMclVGTGWwtGIZic=;
 b=8EirQJNLSDb7b3UDJDBTWi/P7I8v++NRl3LlLfo3BDf/qaqTTgHM9yDVQzVWrXmAPK
 ky44Bva5E4E6HIz5KBrnn7ki5ffl5XGLP1TVvPx/lg4XtQajnD63QaqHblnUUlv8A+2P
 mDlfKtOhdAFiqIomcYxGwuWSvhC/6dXMdmakgAbOmDPcLJIxy2d/s+i1s6fMuluMBeOG
 zngKRVIHbbfDpOcieDPSY210h/u+Sr0SvUDobHNTYpCDNQ9MiIvszni0vc8LNkm9AElh
 /VimqnfT0siWJ226QNjbaAjUTGYyWbRk6B7rxq1MDVlRRfVbxBuSEc9neRUx9PyqK2MO
 XzUA==
X-Gm-Message-State: AO0yUKWgGU2Nu5QDUkqte1VEiQNo+USD8fJhQcrfcv1GuzKcSi7i2Um8
 Dipku5dfBX2bsBQ34Uydobcui1y03wTSBaQBZhI=
X-Google-Smtp-Source: AK7set/e8XpMvbS/D5OycIWvqHr04Wce9JSvYDCyF6OpaDWd4fJ+Zum6kgcMRIXW28lEkP4HPhpJqg==
X-Received: by 2002:a05:6a00:288e:b0:5a8:c038:f4e7 with SMTP id
 ch14-20020a056a00288e00b005a8c038f4e7mr759196pfb.1.1676516285058; 
 Wed, 15 Feb 2023 18:58:05 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.58.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:58:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/30] tcg/aarch64: Detect have_lse, have_lse2 for linux
Date: Wed, 15 Feb 2023 16:57:26 -1000
Message-Id: <20230216025739.1211680-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Notice when the host has additional atomic instructions.
The new variables will also be used in generated code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  3 +++
 tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index c0b0f614ba..3c0b0d312d 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -57,6 +57,9 @@ typedef enum {
 #define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
 #define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
+extern bool have_lse;
+extern bool have_lse2;
+
 /* optional instructions */
 #define TCG_TARGET_HAS_div_i32          1
 #define TCG_TARGET_HAS_rem_i32          1
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 05123cce35..d144d1a769 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -13,6 +13,9 @@
 #include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 #include "qemu/bitops.h"
+#ifdef __linux__
+#include <asm/hwcap.h>
+#endif
 
 /* We're going to re-use TCGType in setting of the SF bit, which controls
    the size of the operation performed.  If we know the values match, it
@@ -71,6 +74,9 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
     return TCG_REG_X0 + slot;
 }
 
+bool have_lse;
+bool have_lse2;
+
 #define TCG_REG_TMP TCG_REG_X30
 #define TCG_VEC_TMP TCG_REG_V31
 
@@ -2912,6 +2918,12 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
 static void tcg_target_init(TCGContext *s)
 {
+#ifdef __linux__
+    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+    have_lse = hwcap & HWCAP_ATOMICS;
+    have_lse2 = hwcap & HWCAP_USCAT;
+#endif
+
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_V64] = 0xffffffff00000000ull;
-- 
2.34.1


