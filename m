Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D424C1F0F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:46:32 +0100 (CET)
Received: from localhost ([::1]:39308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0P1-0006XN-HN
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:46:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Av-0006xC-CX
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:57 -0500
Received: from [2607:f8b0:4864:20::631] (port=42754
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0At-0001Ej-8z
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:57 -0500
Received: by mail-pl1-x631.google.com with SMTP id p17so62072plo.9
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TmxawEn4TT//u8dncYbu6ycL9fZfNNpmMP+qU1HcQZ0=;
 b=WMB2EruxU8tOMv86xci1GCeZnQzzwlFrwKXA+WdpfLvaDMd4xi/hu+S3AJHqEVLv1M
 +1UJLNqZFjVUepZCpdlhMwT90DX7tPPYe65gi3PjkJbfQNpvq+oNB9utjhfCC/3W7aPu
 Op7qkuVLuKUejRkOh+zXzw1WaeTNaTD1MImlfuGaWb5HNjKHt5PwGaoFE6YzE8X14cQ1
 MP9lGdodL2GHUzi6ndbYxwCLOGcwBKXjc58ZtnyG2pAHW12HKc79UQ9MNk7zfXChoO5W
 9HKe+obfwnr6YGnN/WzxJHMUNJu9Qe/TQLpUBNz9RDIMV1qoKX+l64PGyvlEYlsElYo5
 fLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TmxawEn4TT//u8dncYbu6ycL9fZfNNpmMP+qU1HcQZ0=;
 b=lsFtU74vyVVoJR4feAlaDCrlxS+WYYC8KJBH7YAxBiOMojuEG+o7iHsWbBqMwckpcW
 1+W3HPvZJrfhPDaK5mDB/z7H6OHUYj/rytrUHONXvsiWx7/7S/+/z8aq64KztogN0lzm
 sYT5Us3pibvtT/AnIvUUlddUSy4xqUWnaEVQU3SmA7z+j5uhdUi/BnFVKwSrvAgg4lqQ
 It2rmrIe/IV44e6MYCYQXHcUGpYOLYGfN21aZq+mFuChxhsD7K1rMd6l/KvCoSTL1Qu4
 /kMIL9TR4NJKYNMciYsVFKvwhelofUZUolWPnsI/loqQ+RnzniXQep2M1tm/dg7m0CFQ
 7SyQ==
X-Gm-Message-State: AOAM530CjSxOPxifevbvStA3+LQ3lNvMBJ/Ql9ZMa5SbosR60FmZSutL
 Y612KkJrWSRHSb7kTQi0/hPKlprBF9VuTg==
X-Google-Smtp-Source: ABdhPJzrsrFx4RwHA0FAUSMfgVojhBCkRGPrQipXIYF3e0RTh/NJOVeTkxz70Z2rDG4IC9foRPFxpg==
X-Received: by 2002:a17:90a:4149:b0:1bc:ba63:247e with SMTP id
 m9-20020a17090a414900b001bcba63247emr964850pjg.173.1645655513960; 
 Wed, 23 Feb 2022 14:31:53 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/17] target/arm: Prepare DBGBVR and DBGWVR for FEAT_LVA
Date: Wed, 23 Feb 2022 12:31:28 -1000
Message-Id: <20220223223137.114264-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The original A.a revision of the AArch64 ARM required that we
force-extend the addresses in these registers from 49 bits.
This language has been loosened via a combination of IMPLEMENTATION
DEFINED and CONSTRAINTED UNPREDICTABLE to allow consideration of
the entire aligned address.

This means that we do not have to consider whether or not FEAT_LVA
is enabled, and decide from which bit an address might need to be
extended.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c002100979..2eff30d18c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6423,11 +6423,18 @@ static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMCPU *cpu = env_archcpu(env);
     int i = ri->crm;
 
-    /* Bits [63:49] are hardwired to the value of bit [48]; that is, the
-     * register reads and behaves as if values written are sign extended.
+    /*
      * Bits [1:0] are RES0.
+     *
+     * It is IMPLEMENTATION DEFINED whether [63:49] ([63:53] with FEAT_LVA)
+     * are hardwired to the value of bit [48] ([52] with FEAT_LVA), or if
+     * they contain the value written.  It is CONSTRAINED UNPREDICTABLE
+     * whether the RESS bits are ignored when comparing an address.
+     *
+     * Therefore we are allowed to compare the entire register, which lets
+     * us avoid considering whether or not FEAT_LVA is actually enabled.
      */
-    value = sextract64(value, 0, 49) & ~3ULL;
+    value &= ~3ULL;
 
     raw_write(env, ri, value);
     hw_watchpoint_update(cpu, i);
@@ -6473,10 +6480,19 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
     case 0: /* unlinked address match */
     case 1: /* linked address match */
     {
-        /* Bits [63:49] are hardwired to the value of bit [48]; that is,
-         * we behave as if the register was sign extended. Bits [1:0] are
-         * RES0. The BAS field is used to allow setting breakpoints on 16
-         * bit wide instructions; it is CONSTRAINED UNPREDICTABLE whether
+        /*
+         * Bits [1:0] are RES0.
+         *
+         * It is IMPLEMENTATION DEFINED whether bits [63:49]
+         * ([63:53] for FEAT_LVA) are hardwired to a copy of the sign bit
+         * of the VA field ([48] or [52] for FEAT_LVA), or whether the
+         * value is read as written.  It is CONSTRAINED UNPREDICTABLE
+         * whether the RESS bits are ignored when comparing an address.
+         * Therefore we are allowed to compare the entire register, which
+         * lets us avoid considering whether FEAT_LVA is actually enabled.
+         *
+         * The BAS field is used to allow setting breakpoints on 16-bit
+         * wide instructions; it is CONSTRAINED UNPREDICTABLE whether
          * a bp will fire if the addresses covered by the bp and the addresses
          * covered by the insn overlap but the insn doesn't start at the
          * start of the bp address range. We choose to require the insn and
@@ -6489,7 +6505,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
          * See also figure D2-3 in the v8 ARM ARM (DDI0487A.c).
          */
         int bas = extract64(bcr, 5, 4);
-        addr = sextract64(bvr, 0, 49) & ~3ULL;
+        addr = bvr & ~3ULL;
         if (bas == 0) {
             return;
         }
-- 
2.25.1


