Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609DB3CC927
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 14:49:14 +0200 (CEST)
Received: from localhost ([::1]:58322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56EK-0006ae-TV
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 08:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bf-0003jP-Sh
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:29 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:50712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Be-0003Tv-4R
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:27 -0400
Received: by mail-wm1-x335.google.com with SMTP id l6so8642733wmq.0
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1/rEFzTbO1F+5OVHYpvfNFoRTFLdO5DzWh3hJKyAxNo=;
 b=MAGsy2eeMCruLVI+JEhPSn4yf5Q3ztxpg1GH91rwD9K/rfFb2wJMBonCSyriNcKO17
 /6W5fyx2g+AR9HznnNfQUCuAubQMEGC4KDsdKf86myZ/L/aczrMidx9zq861GvAfN1Gj
 6JXM33eqDlU8MvQ0PfP2Bx2ESrP1SUVW1jFZLaSSXGPhorgTBG0y0x6YNLwFgu1QcWJP
 hysrNWDL3G+9ho7+HnWyiaFyJX6uUCNm7CCpEczYHKbhBY7Pf4gHvVcEQG5hwVdckRVL
 xJ5RImkIefab87aDvQLbVEE+0SZQub+adfdCUXnZRUuw+5ERQ+VhQeQc+Pn7NMSVR56e
 J32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1/rEFzTbO1F+5OVHYpvfNFoRTFLdO5DzWh3hJKyAxNo=;
 b=TtyvEjeOXI1cJvt3AFpK3r/dZx7vPFS09HduGVstuyTTNvKI7tbf3p2nXjH3NMiEhk
 SpApfzKwH9GdxBIb123q2TRB0ZMYSPLXtA9ALLnhNAojuWDx1/ULgDibzKA6Ea1LPiel
 Zb8XK4JbAZxa/5aX2As0QmLuFH8TlRAqZL5AuXUfsFcckvnsBQwDnWQiZ+8oludU3FnQ
 mOtkQddjKIukTLcaPeGuWoIQHvdQ/1xH5JvvbQbKhvSiAKxO+BTkpOI6p/WGwqKcFEkz
 jTjbDBZQq/JaYGr++OScjn7+bU+dfrYcDgfraF9vMr5toGdyh5aJHhxt6lq87SYB+37p
 jfJA==
X-Gm-Message-State: AOAM531XCK88iOJnDkJrK2VDEiOBPvG+swXXwAD4uJw88Bsru6l5Jfqm
 T7d04KelXozc1IoVXTSk+Gj8Qg9lsJZ2Cw==
X-Google-Smtp-Source: ABdhPJxPcjh6DU8u/skBKk77vX+yzraWbvAJePwAdNQ7ofJiUTyBdnRAmI5jgRvedO1E7+FCaWuEFA==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr21644434wmj.144.1626612384340; 
 Sun, 18 Jul 2021 05:46:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l23sm4053391wme.22.2021.07.18.05.46.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 05:46:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/12] target/arm: Fix offsets for TTBCR
Date: Sun, 18 Jul 2021 13:46:10 +0100
Message-Id: <20210718124621.13395-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718124621.13395-1-peter.maydell@linaro.org>
References: <20210718124621.13395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

The functions vmsa_ttbcr_write and vmsa_ttbcr_raw_write expect
the offset to be for the complete TCR structure, not the offset
to the low 32-bits of a uint64_t.  Using offsetoflow32 in this
case breaks big-endian hosts.

For TTBCR2, we do want the high 32-bits of a uint64_t.
Use cp15.tcr_el[*].raw_tcr as the offsetofhigh32 argument to
clarify this.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/187
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210709230621.938821-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 910ace42741..0c07ca98376 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4106,8 +4106,9 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .type = ARM_CP_ALIAS, .writefn = vmsa_ttbcr_write,
       .raw_writefn = vmsa_ttbcr_raw_write,
-      .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tcr_el[3]),
-                             offsetoflow32(CPUARMState, cp15.tcr_el[1])} },
+      /* No offsetoflow32 -- pass the entire TCR to writefn/raw_writefn. */
+      .bank_fieldoffsets = { offsetof(CPUARMState, cp15.tcr_el[3]),
+                             offsetof(CPUARMState, cp15.tcr_el[1])} },
     REGINFO_SENTINEL
 };
 
@@ -4118,8 +4119,10 @@ static const ARMCPRegInfo ttbcr2_reginfo = {
     .name = "TTBCR2", .cp = 15, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 3,
     .access = PL1_RW, .accessfn = access_tvm_trvm,
     .type = ARM_CP_ALIAS,
-    .bank_fieldoffsets = { offsetofhigh32(CPUARMState, cp15.tcr_el[3]),
-                           offsetofhigh32(CPUARMState, cp15.tcr_el[1]) },
+    .bank_fieldoffsets = {
+        offsetofhigh32(CPUARMState, cp15.tcr_el[3].raw_tcr),
+        offsetofhigh32(CPUARMState, cp15.tcr_el[1].raw_tcr),
+    },
 };
 
 static void omap_ticonfig_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.20.1


