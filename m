Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082F7346827
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:53:55 +0100 (CET)
Received: from localhost ([::1]:44474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmA5-0007XR-Px
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0k-0008FX-Up
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:16 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:39671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0L-0003gY-7t
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:14 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so20474179ote.6
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u6cU8I9ufF4e1/CeycrI3fKqm/ECMUPYXSwRs2bukw0=;
 b=SeJQ9DiJpojE/4x6mKBufVWvH8KSJEoMcUBUSQ6C2M4se7IfcBTlGiGbITPji1Ljcs
 k6WKptejnOBV9enK9NVPf6Ht0E8jyNLFyiRGETKFBDO+YOkw/e5Lw/G7mmA6m+SiOQ0Q
 kjPHs3c4R8UiWYqHWWCZ05gdvxotT5TXWOxqcp7VxCrXAlkJTsgGIeVTB27pHGV6fRYv
 /sxCC0brkpPuNUSBv6+PdpC2cYN95+F71djPVF80R/wNDol0yM9HlYs0z5Cve9LfMoYo
 B3niqeOVbOLD7XhJuROO9fO/vxzI/iNkoyE5knesUlHHBmTgCTgDkDvg3kUsOo2pA6r5
 T19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u6cU8I9ufF4e1/CeycrI3fKqm/ECMUPYXSwRs2bukw0=;
 b=V/yYRMMR31S+FPaJEQTS6MiTiFfib5SWBTR8xxI/6LSN6jdgxn7SRSizsRg/CjPYka
 hXysXddIUJdhJXAiF05iRiNhe9e9zfLDGzaPK0iaVuWFxDFo5e4QECiY7qfLRuqdTr3X
 GkSCR7NO4ps1ABC2ydWUXqFgbANM4IH5UbdEZNIiXOtfOqI6rwPEWDHMJUkwdgYWPU/O
 Ur6RK6jtAjysfMu7mRYBmoGVU+Td0WKqAvPa1TVTSkVPvCLOec4ObDQp3S1MG/VuLPKM
 m7qoLBxGPxRM4nSmXVHFFFW/VfsaFTGUqnb3aes9hy1TyYem3Q2u1hkU/GeR3M3RMzwH
 KxHA==
X-Gm-Message-State: AOAM533/udhKDcoo2XWT3GwwvfCMaAHKQ1p32B0NN8jqILTkTuOII4Y+
 1YOL5vt5olazx37U4SO6PV90I1c1WueHMCqP
X-Google-Smtp-Source: ABdhPJzl0jCSNnIdRuhdTFy9Qk+VEkPzFhs+24slBXt0PNaEYwvh/gd/eaZWuLZf1pMrHdxL5/QmGQ==
X-Received: by 2002:a05:6830:3197:: with SMTP id
 p23mr5693893ots.3.1616525026914; 
 Tue, 23 Mar 2021 11:43:46 -0700 (PDT)
Received: from localhost.localdomain (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id x23sm3902825ood.28.2021.03.23.11.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:43:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/10] target/ppc: Reduce env->hflags to uint32_t
Date: Tue, 23 Mar 2021 12:43:33 -0600
Message-Id: <20210323184340.619757-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323184340.619757-1-richard.henderson@linaro.org>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It will be stored in tb->flags, which is also uint32_t,
so let's use the correct size.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         | 4 ++--
 target/ppc/misc_helper.c | 2 +-
 target/ppc/translate.c   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index fe6c3f815d..d5f362506a 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1129,8 +1129,8 @@ struct CPUPPCState {
     bool resume_as_sreset;
 #endif
 
-    /* These resources are used only in QEMU core */
-    target_ulong hflags;
+    /* These resources are used only in TCG */
+    uint32_t hflags;
     target_ulong hflags_compat_nmsr; /* for migration compatibility */
     int immu_idx;     /* precomputed MMU index to speed up insn accesses */
     int dmmu_idx;     /* precomputed MMU index to speed up data accesses */
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 63e3147eb4..b04b4d7c6e 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -199,7 +199,7 @@ void helper_store_hid0_601(CPUPPCState *env, target_ulong val)
     if ((val ^ hid0) & 0x00000008) {
         /* Change current endianness */
         hreg_compute_hflags(env);
-        qemu_log("%s: set endianness to %c => " TARGET_FMT_lx "\n", __func__,
+        qemu_log("%s: set endianness to %c => %08x\n", __func__,
                  val & 0x8 ? 'l' : 'b', env->hflags);
     }
 }
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index a9325a12e5..a85b890bb0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7657,7 +7657,7 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  env->nip, env->lr, env->ctr, cpu_read_xer(env),
                  cs->cpu_index);
     qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
-                 TARGET_FMT_lx " iidx %d didx %d\n",
+                 "%08x iidx %d didx %d\n",
                  env->msr, env->spr[SPR_HID0],
                  env->hflags, env->immu_idx, env->dmmu_idx);
 #if !defined(NO_TIMER_DUMP)
-- 
2.25.1


