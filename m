Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4E4B045F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:17:18 +0100 (CET)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI0tR-000451-KB
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:17:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hW-00045G-PQ
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:59 -0500
Received: from [2607:f8b0:4864:20::430] (port=33663
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hU-000498-GQ
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:58 -0500
Received: by mail-pf1-x430.google.com with SMTP id i186so8096783pfe.0
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yVExx3SXXr9h6DkfYn7yNhxsG0U7fq7HrQiNwR7HpZk=;
 b=fsL5LBG8K3oCMUeM+JopWyclUVsDw32EhvAFlE6HRLkdXrVz1Nk5yOcqw6SLxGVs9V
 eBXZgOUdIE+wK8ttHqJlRwnvm9tmzVwsvayxQZAP/zIm67vNOmcOamGe49MVWIJUESaD
 /DmWuWCwx1netcN011x6pGw8Jn4huH+5Txx123X0QiVF67SQvAmjLUGZnWyH1Sqj3z8V
 2DVUOuwh/j4keI3yyWke6EwfCHrfSc6HBRQGcdkO4AHuoGkzXcZBuFwFxr3lSjDwhFhx
 755dlRqwk58lj+b1V2zPAdGX1bZFJi1USPe/OjCDLZqDzdL7hWLxzCO2rgK0TBrCf3Oh
 kt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yVExx3SXXr9h6DkfYn7yNhxsG0U7fq7HrQiNwR7HpZk=;
 b=kCho54plIq8gRYGDxHxPw+A57vKr+2ggeyj6Qe6nS26n3uH+kP3L6APNT0M3OWUBuy
 uVbjd2FTtMDrvsp3Rq8sY8WUgy29WMIFzXXSTWJSWT/afy1VyaePXsWHeYiswLkpzp9Q
 v2J2u7EnnuL9lqeELTnuRP9FFlip9mXfQ7Y3CSfWMEY2r/WKgzwl3AGixFUViJMjILQq
 eMO+bxi5p4a2+YhaJt6VVWA+s+a8Swt3pNBBg3swn3NOFbdW/vKBVbMwHlX4RsGd7/By
 Mx522TD/mjlB1WxmjVd5yhScIo41/iYwcAERo4IxvO+5+lvPnk8H08IjWH45+h7mA9+G
 klpw==
X-Gm-Message-State: AOAM533j3Kp74zBs8MWt2sjkMPG6SBp8NhS/sMh0qHPJSxgu97Ul+U9O
 1Lk8WG117tnyQ77iHVmagaqDy5MdqvDBFpuX
X-Google-Smtp-Source: ABdhPJxE6sexassuQZ3i6aFXfBTQ3MnkusE7fg3W1cI/KiQ23+CrL/DagQE7BWRIC42FYOS32hEvjA==
X-Received: by 2002:a63:4182:: with SMTP id o124mr4654288pga.479.1644465895232; 
 Wed, 09 Feb 2022 20:04:55 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:04:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/15] target/arm: Prepare DBGBVR and DBGWVR for FEAT_LVA
Date: Thu, 10 Feb 2022 15:04:16 +1100
Message-Id: <20220210040423.95120-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 015f992f02..e5050816cf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6421,11 +6421,18 @@ static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -6471,10 +6478,19 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
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
@@ -6487,7 +6503,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
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


