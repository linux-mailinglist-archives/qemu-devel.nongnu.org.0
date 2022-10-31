Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A77614051
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 23:02:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcqp-0005Qg-RH; Mon, 31 Oct 2022 18:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcq0-0005B0-GF
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:01:12 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcpx-000160-Ns
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:00:55 -0400
Received: by mail-io1-xd34.google.com with SMTP id y6so7957473iof.9
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 15:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4EPNlPLvvaNZ49dHiEVCBrThmnHD1d1VYoHkcOJOcWA=;
 b=diMhIXalRRsDKx+5kx4DQH5jU/sNIf1GlLXlAdAkclcu2ovgDy0pX/xQsn0LYVgaVq
 cCNdY3lcHJqVLPiX8m3g8+IU5RNXT6NA910p11prPgbujqH9NVSjBc8lJg7V69XHHYT4
 stVxCKdAyD3tus+nUe5qou5ejtKBA2YcSnO5bBB5lSBvZrlWt96GFa7T77BlW9fG9QG7
 j7cSAsX563xxvuLTn//zMyul6XeLOFiURyn6UfGCkfm7fHuE22BWtf8E2IBght4w/ciy
 lYcKPqWnibZ5u5TAySpdE7UKptrutExD0aGNyUPRo00atuQpikrb74CI6hpEVigBdqU5
 TsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4EPNlPLvvaNZ49dHiEVCBrThmnHD1d1VYoHkcOJOcWA=;
 b=ef+mSAe7F7DeveCIvT8wD91cwWn1darhB4Mw95ZDOSt5REeXz6zZs2XcgV/iCdudUk
 eykAOgPazfI3gsd+RKtC+KljNRtfGFXjx7kcEfmcMGdF3ICQHr2jA0GHGOedGTtMMeiM
 1mTD5A4GX8/IOaBAshg0QVYoODmZxEunh6Lt/y6SyPpP1zXV02w8P1ZnTYqkXfxLxfTq
 2EErnU+bJwF6wsNbdhLctaZxrY/sKtILv46pW3ZyRJcP3vyeQpiv+xZ828dHQSgnvu2K
 GXYk6S635XLicbTu6HbDlw70lHfGiY3dJU+vmt1c+MTj/Lr8iOvVSuMohvUmLhu64IcT
 PZnA==
X-Gm-Message-State: ACrzQf0nHdC27OXGhNDmxvChRubIf9ko24pO2RulEjd2zq0rMzzybtjg
 AxwSFfbkx+UxTjn/MPk28aLKHOfOeS0jUw==
X-Google-Smtp-Source: AMsMyM63EJGTSZUfQ5QGkYz9TeVk6buTEzopE0eiixlaJLLWLWdar6jqEbPtMVdNTkPm1aa/XEP+wg==
X-Received: by 2002:a6b:a08:0:b0:6cc:cc0:9c74 with SMTP id
 z8-20020a6b0a08000000b006cc0cc09c74mr7566299ioi.163.1667253652273; 
 Mon, 31 Oct 2022 15:00:52 -0700 (PDT)
Received: from stoup.. ([172.58.176.58]) by smtp.gmail.com with ESMTPSA id
 d6-20020a926806000000b002f9537986f3sm2916853ilc.24.2022.10.31.15.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:00:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com
Subject: [PULL v2 08/13] target/openrisc: Use cpu_unwind_state_data for mfspr
Date: Tue,  1 Nov 2022 09:00:19 +1100
Message-Id: <20221031220020.414768-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031220020.414768-1-richard.henderson@linaro.org>
References: <20221031215723.414467-1-richard.henderson@linaro.org>
 <20221031220020.414768-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd34.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Since we do not plan to exit, use cpu_unwind_state_data
and extract exactly the data requested.

This is a bug fix, in that we no longer clobber dflag.

Consider:

        l.j       L2         // branch
        l.mfspr   r1, ppc    // delay

L1:     boom
L2:     l.lwa     r3, (r4)

Here, dflag would be set by cpu_restore_state (because that is the current
state of the cpu), but but not cleared by tb_stop on exiting the TB
(because DisasContext has recorded the current value as zero).

The next TB begins at L2 with dflag incorrectly set.  If the load has a
tlb miss, then the exception will be delivered as per a delay slot:
with DSX set in the status register and PC decremented (delay slots
restart by re-executing the branch). This will cause the return from
interrupt to go to L1, and boom!

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


