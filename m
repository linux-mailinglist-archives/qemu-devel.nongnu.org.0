Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA956F5179
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:29:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qM-0002kL-Ar; Wed, 03 May 2023 03:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q7-0001r7-Jv
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:51 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q4-0001h0-GK
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:51 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso2902290f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098627; x=1685690627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kb1ot9YMe16Zml8R39ZnIEaXK/c3V3zq72HecaTnr0w=;
 b=CCoGQml1Eathb+lR7CDNJUqQhdnO4ij0MwAf8lKq1ikJZ1mGsPt5Kx7pMwlmreJ4nJ
 Em/464CQKY8TU4aNVmBcEVfZr7fg5J+GJyds6n2TMH5XP2DMQuOp4Y+avV48xe8as/C2
 kLeFMa1cL9s8OnpvQqE8KzGdKivnle2NccwZpvSdeGgMtd1d64ySewEYsAsSRPjvqq4Y
 5qZA9uumDDdC6Rk8xQcx/uJultQUpRSRid4uwzejifcAt2foxrPqBhjOV6jEmyaE3GVl
 /I31dBiknhJ49TWE6n9CCRWJ535lyH6eGFqQEWVNzZ3sinqNmZdkfS68cAHH3NULp4cA
 iVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098627; x=1685690627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kb1ot9YMe16Zml8R39ZnIEaXK/c3V3zq72HecaTnr0w=;
 b=k+k5qYO4jnbCE9rfOfHQfIjzix/I/LW91+JhV2G4xG5mspagZwV27Prw+OkLPiFrsY
 EZm4vSA8Xg/IwCI6SC/TLT1lvJVLbw+VHf65sAPQ+pHxkN4RguXqtqBZBb7luSQdtRJE
 VxsBswtL8GptwakPY0XcYAaI7MdPbO1UBkWOVjmWxaxt07N1Bkhux5jmpLjQUaPzOCKu
 Vp2K0m5CQOPKXGK+RKoD80s9kVto5fuAzXreXlgaLw49+5wjYc9ADsaToDhn/jesa9N3
 RxA+/ZxrDV+ER3YZFJ3Gfzo2ZOpDtY5UcBDn4mRvYJ6hUnnOVDIRMyNla1716kwiWeaK
 E0Yw==
X-Gm-Message-State: AC+VfDxqK2QWKSCDSOpSAR52WRSnZ/uavN85KESpz3aNoDSlIxtZS0Nf
 XPvOkz2L7Gg/8lIzIqdutV2D2vls4v2qGCZ8rdhdYw==
X-Google-Smtp-Source: ACHHUZ7KorngxBvubO3cGWfLI7lLvrZo5JcnY1ySS9O1LOiotLaYutJARxVC3VwboEmvW1pfo9q/4Q==
X-Received: by 2002:a5d:56c6:0:b0:2ee:da1c:381a with SMTP id
 m6-20020a5d56c6000000b002eeda1c381amr12993079wrw.69.1683098626740; 
 Wed, 03 May 2023 00:23:46 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 16/84] tcg/i386: Always enable TCG_TARGET_HAS_extr[lh]_i64_i32
Date: Wed,  3 May 2023 08:22:23 +0100
Message-Id: <20230503072331.1747057-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Keep all 32-bit values zero extended in the register, not solely when
addresses are 32 bits.  This eliminates a dependency on TARGET_LONG_BITS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 7f69997e30..7ebd6e5135 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -154,9 +154,9 @@ extern bool have_atomic16;
 #define TCG_TARGET_HAS_mulsh_i32        0
 
 #if TCG_TARGET_REG_BITS == 64
-/* Keep target addresses zero-extended in a register.  */
-#define TCG_TARGET_HAS_extrl_i64_i32    (TARGET_LONG_BITS == 32)
-#define TCG_TARGET_HAS_extrh_i64_i32    (TARGET_LONG_BITS == 32)
+/* Keep 32-bit values zero-extended in a register.  */
+#define TCG_TARGET_HAS_extrl_i64_i32    1
+#define TCG_TARGET_HAS_extrh_i64_i32    1
 #define TCG_TARGET_HAS_div2_i64         1
 #define TCG_TARGET_HAS_rot_i64          1
 #define TCG_TARGET_HAS_ext8s_i64        1
-- 
2.34.1


