Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC568D4AF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:45:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPLSW-0005YA-1I; Tue, 07 Feb 2023 05:44:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPLSU-0005Xn-4T
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:44:18 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPLSS-000159-Fp
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iSKOUWMX35lwRnCbiitxcN2BeR/N+f4QoweXpxPpbFc=; b=nDPEg6ONi7+/HtZrLNxEwg80xd
 YtufJq6WNvv+r5RrRzymdanzTFWqEdh2Y62/jgdTQPN1NZWgHTCWK2SK7tfwxdSn7f86TW34Y8FA1
 VjFKP6khTXnmF9KK21Kjfosj5v3UfE3bm/EBMjhIONAy27P5WwyJ3lqD6duRRfcX+Ekw=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org
Subject: [PATCH 3/3] target: Set `CF_PCREL` for arm and i386 frontends
Date: Tue,  7 Feb 2023 11:43:52 +0100
Message-Id: <20230207104352.11055-4-anjo@rev.ng>
In-Reply-To: <20230207104352.11055-1-anjo@rev.ng>
References: <20230207104352.11055-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 target/arm/cpu-param.h  | 2 --
 target/arm/cpu.c        | 5 +++++
 target/i386/cpu-param.h | 4 ----
 target/i386/cpu.c       | 5 +++++
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 53cac9c89b..b7bde18986 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -31,8 +31,6 @@
 # define TARGET_PAGE_BITS_VARY
 # define TARGET_PAGE_BITS_MIN  10
 
-# define TARGET_TB_PCREL 1
-
 /*
  * Cache the attrs and shareability fields from the page table entry.
  *
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 31dc595e11..62b876e0f0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1551,6 +1551,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     bool no_aa32 = false;
 
+    /* Use pc-relative instructions in system-mode */
+#ifndef CONFIG_USER_ONLY
+    cs->tcg_cflags |= CF_PCREL;
+#endif
+
     /* If we needed to query the host kernel for the CPU features
      * then it's possible that might have failed in the initfn, but
      * this is the first point where we can report it.
diff --git a/target/i386/cpu-param.h b/target/i386/cpu-param.h
index f579b16bd2..abad52af20 100644
--- a/target/i386/cpu-param.h
+++ b/target/i386/cpu-param.h
@@ -25,8 +25,4 @@
 #define TARGET_PAGE_BITS 12
 #define NB_MMU_MODES 5
 
-#ifndef CONFIG_USER_ONLY
-# define TARGET_TB_PCREL 1
-#endif
-
 #endif
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4d2b8d0444..5be294b122 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6404,6 +6404,11 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     static bool ht_warned;
     unsigned requested_lbr_fmt;
 
+    /* Use pc-relative instructions in system-mode */
+#ifndef CONFIG_USER_ONLY
+    cs->tcg_cflags |= CF_PCREL;
+#endif
+
     if (cpu->apic_id == UNASSIGNED_APIC_ID) {
         error_setg(errp, "apic-id property was not initialized properly");
         return;
-- 
2.39.1


