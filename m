Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8D51BCED
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:14:28 +0200 (CEST)
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYV9-0000zY-N7
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWs-0005IX-7P
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:10 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWp-0003Dr-Rd
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id c11so5216069wrn.8
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=juGYeCU9KAGWm+sx2XQ7zrm8YPa+MyJD56BKOagRgGE=;
 b=CMQ+nGQnmb0Y0tUSUF36q4yJ8Bn4KLShAQP2aeEYkz9S23sEAri/VdwfuFTb2VtBDW
 hXKdN41Lx+ia6jEpkGEHMX2IwHvepJ5rbCAhOvmiIl1QkgZ/xVpp9/fbP6SIkiLPNrpU
 IsfDQy8ct/UrIsCpxDg5O96UQxleiQiNtXl37i7JUAU8HQ+HRPTCVX1joQi5vunM8obh
 RoaluQq9cdBL4TrZTWTPBe3a3gHETONI1MmsXFtrixbO5R44T4b7PRdSeTTF7Lpn9rTL
 expi3EZBgG8sfaJ4t+QTYwFsdsPxiZgVTetM8h3n78F9pnqFOpjDhLef72GOPr86QLvs
 aTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=juGYeCU9KAGWm+sx2XQ7zrm8YPa+MyJD56BKOagRgGE=;
 b=eLB3wNCWLeWnkRXmV82P5oT698k+RpAZtpP2ixywdSP5Ije6zWGLgFaI4ItLMDaorE
 lzGrZNQ/y6Jl7/avejbOZATrSmeYJZubTcGvm4GkakIQaOci6e5bMfMZg8rxKXhCtOlh
 wMk2dzIFnS15sbT9wTKc8E2+E5rx6eyUfYypwm/ULyESAHACCwMt8/frM5hkQTUmioq6
 1pXsXydbwJMMtxmV4TtvVY5RW3wMHeqmlyLzmJ7fWZmsl1OYXOMZ6v7H50o1dKbdyphr
 v8M92jizvbF5U4q49xC1mRjXrO5+h57TycEENv48xwRf/QXe+KCaedD2XAZa7EXJiXh+
 9f5Q==
X-Gm-Message-State: AOAM532628cyifQ4/thk8LugzL+U3ZeL03gMflrEOHze6C13iAPtGS9s
 jF48xuSTHnToS0LHiwNEECGr69tSFM4WGw==
X-Google-Smtp-Source: ABdhPJzk9A9jiimTFqCZs1ipembpUEC+ThFWKoxrGGoVw7UIuNH2khbHoX29YNhtsHmUzrBZyJIkYw==
X-Received: by 2002:a5d:4f05:0:b0:20a:dd25:5725 with SMTP id
 c5-20020a5d4f05000000b0020add255725mr19871135wru.546.1651741926926; 
 Thu, 05 May 2022 02:12:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.12.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:12:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/23] target/arm: Reformat comments in add_cpreg_to_hashtable
Date: Thu,  5 May 2022 10:11:43 +0100
Message-Id: <20220505091147.2657652-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Put the block comments into the current coding style.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220501055028.646596-19-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fa1e7bd462c..81612952f3a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8496,15 +8496,16 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     return cpu_list;
 }
 
+/*
+ * Private utility function for define_one_arm_cp_reg_with_opaque():
+ * add a single reginfo struct to the hash table.
+ */
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                                    void *opaque, CPState state,
                                    CPSecureState secstate,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
-    /* Private utility function for define_one_arm_cp_reg_with_opaque():
-     * add a single reginfo struct to the hash table.
-     */
     uint32_t key;
     ARMCPRegInfo *r2;
     bool is64 = r->type & ARM_CP_64BIT;
@@ -8568,7 +8569,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 
     isbanked = r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1];
     if (isbanked) {
-        /* Register is banked (using both entries in array).
+        /*
+         * Register is banked (using both entries in array).
          * Overwriting fieldoffset as the array is only used to define
          * banked registers but later only fieldoffset is used.
          */
@@ -8577,7 +8579,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 
     if (state == ARM_CP_STATE_AA32) {
         if (isbanked) {
-            /* If the register is banked then we don't need to migrate or
+            /*
+             * If the register is banked then we don't need to migrate or
              * reset the 32-bit instance in certain cases:
              *
              * 1) If the register has both 32-bit and 64-bit instances then we
@@ -8592,8 +8595,9 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                 r2->type |= ARM_CP_ALIAS;
             }
         } else if ((secstate != r->secure) && !ns) {
-            /* The register is not banked so we only want to allow migration of
-             * the non-secure instance.
+            /*
+             * The register is not banked so we only want to allow migration
+             * of the non-secure instance.
              */
             r2->type |= ARM_CP_ALIAS;
         }
@@ -8607,7 +8611,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         }
     }
 
-    /* By convention, for wildcarded registers only the first
+    /*
+     * By convention, for wildcarded registers only the first
      * entry is used for migration; the others are marked as
      * ALIAS so we don't try to transfer the register
      * multiple times. Special registers (ie NOP/WFI) are
@@ -8622,7 +8627,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         r2->type |= ARM_CP_ALIAS | ARM_CP_NO_GDB;
     }
 
-    /* Check that raw accesses are either forbidden or handled. Note that
+    /*
+     * Check that raw accesses are either forbidden or handled. Note that
      * we can't assert this earlier because the setup of fieldoffset for
      * banked registers has to be done first.
      */
-- 
2.25.1


