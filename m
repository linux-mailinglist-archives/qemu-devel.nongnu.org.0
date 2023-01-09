Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08AA663435
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:44:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF0r9-00047f-Uq; Mon, 09 Jan 2023 17:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pF0r8-00046g-JB; Mon, 09 Jan 2023 17:43:02 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pF0r6-00041c-Su; Mon, 09 Jan 2023 17:43:02 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8C3704D368;
 Mon,  9 Jan 2023 22:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673304179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmK4Ea/HaIadAjuTHVjNYSm3Ct4FOeHVNr26BCQ9nXw=;
 b=yIVIDKnxNTIQkV0AOn9T8AB7ycAHjHE0rb4fOWA0r0YuGZwnF89Izk4JJ1RI1JO0alNLv5
 du3vA6XVteNb4FT+cRrvFY6iX0ANjxe0vFPfqFaqQSvQM7UkCD47sMZVXjN4AaDsesQcbD
 08rK6PVthgncRejhk8fjyYFH40iLnc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673304179;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmK4Ea/HaIadAjuTHVjNYSm3Ct4FOeHVNr26BCQ9nXw=;
 b=MgHR6q0geCCn0qxHOwnhQFsLgP9tWECxDJ4J4BmfWjTsp3Mat7uGplVxQa34dL86qmLsyX
 zxuJDc3yRuzgoZCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEC0A13583;
 Mon,  9 Jan 2023 22:42:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oJaRLXCYvGMdIQAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:42:56 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH v2 07/19] target/arm: Move helper_set_pstate_* into
 cpregs.c
Date: Mon,  9 Jan 2023 19:42:20 -0300
Message-Id: <20230109224232.11661-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We want to move sme_helper into the tcg directory, but the cpregs
accessor functions cannot go along, otherwise they would be separate
from the respective ARMCPRegInfo definition which needs to be compiled
with CONFIG_TCG=n as well.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpregs.c     | 29 +++++++++++++++++++++++++++++
 target/arm/sme_helper.c | 29 -----------------------------
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/target/arm/cpregs.c b/target/arm/cpregs.c
index 88d71dbe70..a6deae9926 100644
--- a/target/arm/cpregs.c
+++ b/target/arm/cpregs.c
@@ -6633,6 +6633,35 @@ static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
+{
+    if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
+        return;
+    }
+    env->svcr ^= R_SVCR_SM_MASK;
+    arm_reset_sve_state(env);
+}
+
+void helper_set_pstate_za(CPUARMState *env, uint32_t i)
+{
+    if (i == FIELD_EX64(env->svcr, SVCR, ZA)) {
+        return;
+    }
+    env->svcr ^= R_SVCR_ZA_MASK;
+
+    /*
+     * ResetSMEState.
+     *
+     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
+     * on enable: while disabled, the storage is inaccessible and the
+     * value does not matter.  We're not saving the storage in vmstate
+     * when disabled either.
+     */
+    if (i) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+    }
+}
+
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index f891306bb9..ed04daf5d4 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -38,35 +38,6 @@ void arm_reset_sve_state(CPUARMState *env)
     vfp_set_fpcr(env, 0x0800009f);
 }
 
-void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
-{
-    if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
-        return;
-    }
-    env->svcr ^= R_SVCR_SM_MASK;
-    arm_reset_sve_state(env);
-}
-
-void helper_set_pstate_za(CPUARMState *env, uint32_t i)
-{
-    if (i == FIELD_EX64(env->svcr, SVCR, ZA)) {
-        return;
-    }
-    env->svcr ^= R_SVCR_ZA_MASK;
-
-    /*
-     * ResetSMEState.
-     *
-     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
-     * on enable: while disabled, the storage is inaccessible and the
-     * value does not matter.  We're not saving the storage in vmstate
-     * when disabled either.
-     */
-    if (i) {
-        memset(env->zarray, 0, sizeof(env->zarray));
-    }
-}
-
 void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
 {
     uint32_t i;
-- 
2.35.3


