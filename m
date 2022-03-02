Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A804A4CB065
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:58:45 +0100 (CET)
Received: from localhost ([::1]:47322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPW3Y-0006MC-L7
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 15:58:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxp-0005rI-AB
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:51 -0500
Received: from [2a00:1450:4864:20::42b] (port=43947
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxn-0008DF-JM
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:49 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m6so4661063wrr.10
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8QMoI8yKN1p10WB85KNBkULNMuISbQxDURZ0kblprrk=;
 b=Fqla6Gc9sOiu7yVj+sFQjKU1JMIpF4gj8LlM5mma87qjBzAqk5dXNJXnMzCEx4FSA0
 W+U2DkFUowptDZ1DOQMc5Hh2BNp6mCdvi3BhqAGdUXo62TGhoVk+9o2DucSSEwbKvtcS
 Jv71JUhlWmQdfulOYbLEMX5w29qC4VRZcvAI9Vzf8RRccUZt53NAFgoLcxMWzoIk9Os8
 4OZixLU0f6XjBTBOnRKDPsTrs/4AspleT0tomdkX7OXDlrJfEyJQKQ6Fs+s9/nAa/Smd
 3eebcPn4xJiIKDA/vwwyXWQjLxZ6NvZgtjuh4UuEo+0ueVSd7jvvgoBoLNbKdL0gNN7t
 FXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8QMoI8yKN1p10WB85KNBkULNMuISbQxDURZ0kblprrk=;
 b=xsF28qmJHlGMIALyXy7odvtcf1uH1FN+Hfig2j1INxbm/y4L/XJNdQ/JQ3uS1Vrq30
 9d8e8KRAkjDcbnLPqZ9U/LO/GP3bpmahNq3RiYXL4bB3yxGyVDAewtRV8cBIz8MCEGzf
 0xHcQpkLxekW56Vmcu/2SR2r8qUmcyu4qsZ6MVDy/PQj8vFap1FR3QTMG1IeNbUPsRmO
 tQRecqEnaBRJbhGf/RJkPin87FnnSqT/T63DE963F/RwWUkqUWkmHe4DRrxP3UenbY3G
 fFR2bKhysdA9A7Z/92ACyNv4l6qIhWT9eCmFRUKGUFFKAKVCei0KBhqJ49icRw1b3EFs
 JFvw==
X-Gm-Message-State: AOAM5322UUG7oArRUkjHZUggiyocRqTqKIbGjnEj/ogoiOENUB78SafM
 jY+PKNzsHNjNKz/ynawzkHRN1Cj/wX4fSQ==
X-Google-Smtp-Source: ABdhPJxCM18Q/2FXar9w3Opy2lsvXSD/cJF44eaAHbTNQyn8XWLJcKVyHoeeR2lbnmHV7CBY+OjApA==
X-Received: by 2002:a05:6000:1ac5:b0:1ea:7870:d7eb with SMTP id
 i5-20020a0560001ac500b001ea7870d7ebmr24871679wry.171.1646254365799; 
 Wed, 02 Mar 2022 12:52:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/26] target/arm: Prepare DBGBVR and DBGWVR for FEAT_LVA
Date: Wed,  2 Mar 2022 20:52:19 +0000
Message-Id: <20220302205230.2122390-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

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
Message-id: 20220301215958.157011-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c002100979f..2eff30d18c6 100644
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


