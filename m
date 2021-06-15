Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219D03A74B8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 05:11:10 +0200 (CEST)
Received: from localhost ([::1]:54414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lszTo-0002ya-V6
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 23:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszQi-0004j9-6P
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:07:57 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszQe-0008Ae-G0
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:07:55 -0400
Received: by mail-pf1-x42a.google.com with SMTP id c12so12174959pfl.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 20:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TQf3IjdFQae4tidY+aDNVPg91NNd8BgJC+OISDGWpvo=;
 b=RQ4TCrKNkNkBjR7TSkxoGfCpcWGpukR5UnCDcRxQDiRHJ6AfL37ld8HkjVwu9T9e2S
 rLhSbquzP+MT78WpVYQI6+14+7jvI6vJOlYnNopN8OyegXGtB1/AKOxN2MwsunXIFmVX
 XuLie1kqXC0YGteZW4TVOOXNAA92Eymcor7G+AfbnsG42kMNSqUbbRIbww/mJeG0WCpN
 u1dRb1EyR5p598KSGbVqnxGXqoyQgJ1ygUhtDX6FcLg+exXUe+rnFjvv23dVQK5yEQFN
 GxsjSMxSLAxG89kgMIRrim7Of7r0NOAAYRhEq6X/0M5RIErqKqNfF5FWEzScStLjDwRj
 tfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TQf3IjdFQae4tidY+aDNVPg91NNd8BgJC+OISDGWpvo=;
 b=JT0lkRRKS+brci6QA0XVza/Mh6gOgGJxNHZShho2XAPfb6B/TDi2oCiliQiIPjCNYg
 nyKN7cNSn4b7CVa3jE1021IPgQzHCylgZvEjjWR7TpgLx/4Ro/FDYrGMeNkMEdklyazA
 5vpP2cWnUHz4qL4kkkduPumDRLuRt/1xJ84Ji4wGrOPhpviNWUCQfTXfMXMuscZ6C6yQ
 TFI4nBD7ZghcnrbUAuxysihjchY0osJEUqmAp4lgJkGe9feIhmhoFpgWZ9ZPRxFRmZ7P
 4AFnlzBt/qZ7MujXx+IYPVwEXxbDQ4ezYqbEzPyiBuHPa71dfGv5M96+vr4tPaJyopBO
 R8oA==
X-Gm-Message-State: AOAM532RFTHtgwm+tk9/ONKtypOsPmnrAwzyY/ps+gGcClao8twLVifc
 DHIs4v/U87oN9bpDXXUJ4nCjAkbF/UWGWg==
X-Google-Smtp-Source: ABdhPJwWPPPtQKMEWWkpfLsCb6FyPMLh5FAFw+tmuLnosPfBuaIBfDM+hyqurS0pahST0w0kjEayhQ==
X-Received: by 2002:a62:dd8b:0:b029:2e9:731a:e22e with SMTP id
 w133-20020a62dd8b0000b02902e9731ae22emr2108516pff.69.1623726471125; 
 Mon, 14 Jun 2021 20:07:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id w71sm7554666pfc.164.2021.06.14.20.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 20:07:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] linux-user/s390x: Save and restore psw.mask properly
Date: Mon, 14 Jun 2021 20:07:44 -0700
Message-Id: <20210615030744.1252385-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615030744.1252385-1-richard.henderson@linaro.org>
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At present, we're referencing env->psw.mask directly, which
fails to ensure that env->cc_op is incorporated or updated.
Use s390_cpu_{set_psw,get_psw_mask} to fix this.

Mirror the kernel's cleaning of the psw.mask in save_sigregs
and restore_sigregs.  Ignore PSW_MASK_RI for now, as qemu does
not support that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index ef136dae33..bf8a8fbfe9 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -112,15 +112,23 @@ get_sigframe(struct target_sigaction *ka, CPUS390XState *env, size_t frame_size)
     return (sp - frame_size) & -8ul;
 }
 
+#define PSW_USER_BITS   (PSW_MASK_DAT | PSW_MASK_IO | PSW_MASK_EXT | \
+                         PSW_MASK_MCHECK | PSW_MASK_PSTATE | PSW_ASC_PRIMARY)
+#define PSW_MASK_USER   (PSW_MASK_ASC | PSW_MASK_CC | PSW_MASK_PM | \
+                         PSW_MASK_64 | PSW_MASK_32)
+
 static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
 {
+    uint64_t psw_mask = s390_cpu_get_psw_mask(env);
     int i;
 
     /*
      * Copy a 'clean' PSW mask to the user to avoid leaking
      * information about whether PER is currently on.
+     * TODO: qemu does not support PSW_MASK_RI; it will never be set.
      */
-    __put_user(env->psw.mask, &sregs->regs.psw.mask);
+    psw_mask = PSW_USER_BITS | (psw_mask & PSW_MASK_USER);
+    __put_user(psw_mask, &sregs->regs.psw.mask);
     __put_user(env->psw.addr, &sregs->regs.psw.addr);
 
     for (i = 0; i < 16; i++) {
@@ -289,7 +297,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
 static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
 {
-    target_ulong prev_addr;
+    uint64_t prev_addr, prev_mask, mask, addr;
     int i;
 
     for (i = 0; i < 16; i++) {
@@ -297,9 +305,28 @@ static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
     }
 
     prev_addr = env->psw.addr;
-    __get_user(env->psw.mask, &sc->regs.psw.mask);
-    __get_user(env->psw.addr, &sc->regs.psw.addr);
-    trace_user_s390x_restore_sigregs(env, env->psw.addr, prev_addr);
+    __get_user(mask, &sc->regs.psw.mask);
+    __get_user(addr, &sc->regs.psw.addr);
+    trace_user_s390x_restore_sigregs(env, addr, prev_addr);
+
+    /*
+     * Use current psw.mask to preserve PER bit.
+     * TODO:
+     *  if (!is_ri_task(current) && (user_sregs.regs.psw.mask & PSW_MASK_RI))
+     *          return -EINVAL;
+     * Simply do not allow it to be set in mask.
+     */
+    prev_mask = s390_cpu_get_psw_mask(env);
+    mask = (prev_mask & ~PSW_MASK_USER) | (mask & PSW_MASK_USER);
+    /* Check for invalid user address space control. */
+    if ((mask & PSW_MASK_ASC) == PSW_ASC_HOME) {
+        mask = (mask & ~PSW_MASK_ASC) | PSW_ASC_PRIMARY;
+    }
+    /* Check for invalid amode. */
+    if (mask & PSW_MASK_64) {
+        mask |= PSW_MASK_32;
+    }
+    s390_cpu_set_psw(env, mask, addr);
 
     for (i = 0; i < 16; i++) {
         __get_user(env->aregs[i], &sc->regs.acrs[i]);
-- 
2.25.1


