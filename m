Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C1060ACC0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:13:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTK-0003d8-BX; Mon, 24 Oct 2022 09:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxTB-0003X7-K1
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:21 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxT8-0004BY-AQ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:21 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 q9-20020a17090a178900b00212fe7c6bbeso3073239pja.4
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Oz6SbhxWMBqT3eH0LGJA5+0yBaJCELCj9GF6rT/F9o0=;
 b=yx/5yQr9Z8WKCYyjmPZbdv+QzggBr5pqdKn+rSyHy8PL9iHKACjScUu0c9+oME83x5
 0gR+WtQewuOoTgMsSTztcbcx2u/qnE9/mRWMiWdqXDpkY0RQuD5diRbQTryRGfHDQD0c
 k848wrRy4VvL5jtP+eceNAzH1ujMhbsZ/yxyjxm/o+bL1QIwY3qCca5E4KLGO6Yxo2Jt
 jaFwBm0YZ9gB615XCGoijz2vzyiMv6OZoKWYX3pz+caoWE3iUx1Iu11ycR/fm9opxZSI
 24WN5XczjLVPTHbQ1uc8nOj9XZ2vhkIS2WpBUOY/pf+UKQJ+jO3cVzccoKxb5nyoZjyl
 16tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oz6SbhxWMBqT3eH0LGJA5+0yBaJCELCj9GF6rT/F9o0=;
 b=rvwL7MHFYDtopo6LsQkpIkzLFxUCS2MzfBjpFz3bwEu8cXLCzSomDSGsLu0YlPqZkc
 BsgNsEuhVo+whgI9WP4Vr7wNGAu8VabEkvrM6HCvPksyAZ1Ttz3+D3MLHm57II9ljdw+
 qldcFhDm2rQUnITJq1eOOtOOiijrSAd35Je4ndzJAgnFBVVS5/0AEx9E49fVlgHlxWI5
 repDbQBQYFlBrALwSS+juJJSlt+E9X0KwWIy5FbpBNIgZPtd4nLETYmZ1Ga1So69Hxlk
 kaMlQlcdG//Y03uIgAziGdByI4hmWJmITLKu3vdTNuVzTCOzNUMgjXsueFAAUYXskbEU
 JU1Q==
X-Gm-Message-State: ACrzQf01ZVMqXSPuqPCqbKJZLHQj4uZ9n2PV01QN9u0A2MOIzWSXATSm
 YlcSUVUNS6uRMCtsT7+/eviJQkqgG7RshA==
X-Google-Smtp-Source: AMsMyM6ZmFXsk6uj7iW+PzOQiEYNK1mlHAW8fNTirO36yo3SMt/3hlH8M3Tg8CK/ykxiSpVwWynYFg==
X-Received: by 2002:a17:90b:3a86:b0:20d:616f:4bb6 with SMTP id
 om6-20020a17090b3a8600b0020d616f4bb6mr75106842pjb.238.1666617976655; 
 Mon, 24 Oct 2022 06:26:16 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.26.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:26:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/29] target/openrisc: Use cpu_unwind_state_data for mfspr
Date: Mon, 24 Oct 2022 23:24:57 +1000
Message-Id: <20221024132459.3229709-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since we do not plan to exit, use cpu_unwind_state_data
and extract exactly the data requested.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/sys_helper.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index a3508e421d..dde2fa1623 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -199,6 +199,7 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
                            target_ulong spr)
 {
 #ifndef CONFIG_USER_ONLY
+    uint64_t data[TARGET_INSN_START_WORDS];
     MachineState *ms = MACHINE(qdev_get_machine());
     OpenRISCCPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
@@ -232,14 +233,20 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
         return env->evbar;
 
     case TO_SPR(0, 16): /* NPC (equals PC) */
-        cpu_restore_state(cs, GETPC(), false);
+        if (cpu_unwind_state_data(cs, GETPC(), data)) {
+            return data[0];
+        }
         return env->pc;
 
     case TO_SPR(0, 17): /* SR */
         return cpu_get_sr(env);
 
     case TO_SPR(0, 18): /* PPC */
-        cpu_restore_state(cs, GETPC(), false);
+        if (cpu_unwind_state_data(cs, GETPC(), data)) {
+            if (data[1] & 2) {
+                return data[0] - 4;
+            }
+        }
         return env->ppc;
 
     case TO_SPR(0, 32): /* EPCR */
-- 
2.34.1


