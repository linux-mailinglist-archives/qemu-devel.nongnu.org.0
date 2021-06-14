Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EDA3A5FC2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 12:11:08 +0200 (CEST)
Received: from localhost ([::1]:46960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjYg-0007C6-Gx
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 06:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1lsjWw-0005Aw-3h
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:09:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1lsjWt-00045B-5c
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:09:17 -0400
Received: by mail-wr1-x430.google.com with SMTP id m18so13896640wrv.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OV+M6Wxiaq+SA1gePBokthLze/Zk2s945FpGBYhPwpU=;
 b=uV8I57a8ZZ380ULjk7FNIPQO+AAu/Kir5vcccUZpH42IKdFyngogNpvFgcV3V40H8b
 2KvKYNIzIAHsNEQktwmwL9SRrldRTd77XGE2Rbjvl/YLM+BTdLpFUfdBC4JRPF+PJaOY
 pRsOfyaCUy8Z+svZSwiThP1SGz4rmWKkdvEVEk2aK2LBI9FghOKcvFfVitWTlaY08jYd
 vKwUVbJc6p2qYJJRXR5YUkivyUVKbsZsrynkRPE0Dfcvs3bG/niYecxqlnRBWYRE07Uz
 Ea7kqX52FEUXvHEfaapX/Hn2svFlm22tfj/JfhNAo0srHZJ99Ow3QvXXKsjzIyJ77ZVA
 wyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OV+M6Wxiaq+SA1gePBokthLze/Zk2s945FpGBYhPwpU=;
 b=Bep82qqVjCK6vU5DEfi0nn+RxQdZQG4S6Z6ekOp0f2RMAituvemdtW5NLEIWRAZHvw
 Dna0i16U4WUZD2C2gWgSGZ1lwTMqLpwNow58CquibmA4AVzHohgVo3aPdU+XAKMt2O37
 ihiS34Cmi9hLEjyEhRRY47e0FUEa0Wbb4RSvIzGdK4vjjCiXRb8bJ86HUsh0L7xYX4Pg
 oJHBJUMXuzNrDlrhm+ALH7/N9hUW0T4QDbpt4mXm9uLRVrl21kgLWMKmNcomcAoN7tfU
 n2tRye9BqU0XmGMDmAJ3bQiPnNlE5gFTx1YskZ2R5hzOrp6jlnkB8mZRvhAjoGS1PkT5
 GhRA==
X-Gm-Message-State: AOAM532HBSXjyosgJsp1EBCPxIkGFquy3/VcoleVynRth99vYhRSAm6e
 Yhdn0XFH09dOcD2tGtWZpXUykLPU8OtNlg==
X-Google-Smtp-Source: ABdhPJx7DGzLKJxXGEvu22cswa6QLFTUmSLojbRAZ+OgbRSvgTPlz+O66a2Tk5BEl0JwNvhNPSFVzA==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr17572499wrr.265.1623665353906; 
 Mon, 14 Jun 2021 03:09:13 -0700 (PDT)
Received: from localhost.localdomain ([37.161.140.231])
 by smtp.gmail.com with ESMTPSA id o18sm15752254wrx.59.2021.06.14.03.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 03:09:13 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/i386: Added Intercept CR0 writes check
Date: Mon, 14 Jun 2021 12:09:02 +0200
Message-Id: <20210614100902.15860-4-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614100902.15860-1-laramglazier@gmail.com>
References: <20210614100902.15860-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=laramglazier@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the selective CR0 write intercept is set, all writes to bits in
CR0 other than CR0.TS or CR0.MP cause a VMEXIT.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.h                    | 2 ++
 target/i386/tcg/sysemu/misc_helper.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 46542513cc..ff0ff97ca9 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -228,6 +228,8 @@ typedef enum X86Seg {
 #define CR0_CD_MASK  (1U << 30)
 #define CR0_PG_MASK  (1U << 31)
 
+#define INTERCEPT_SELECTIVE_CR0 (1ULL << 5)
+
 #define CR4_VME_MASK  (1U << 0)
 #define CR4_PVI_MASK  (1U << 1)
 #define CR4_TSD_MASK  (1U << 2)
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 0cef2f1a4c..53117f47de 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -84,6 +84,15 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
 {
     switch (reg) {
     case 0:
+        /*
+        * If we reach this point, the CR0 write intercept is disabled.
+        * But we could still exit if the hypervisor has requested the selective
+        * intercept for bits other than TS and MP
+        */
+        if ((env->intercept & INTERCEPT_SELECTIVE_CR0) &&
+            ((env->cr[0] ^ t0) & ~(CR0_TS_MASK | CR0_MP_MASK))) {
+            cpu_vmexit(env, SVM_EXIT_CR0_SEL_WRITE, 0, GETPC());
+        }
         cpu_x86_update_cr0(env, t0);
         break;
     case 3:
-- 
2.25.1


