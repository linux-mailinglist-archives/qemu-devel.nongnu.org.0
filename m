Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80156951E3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:32:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfUQ-0004Pg-Q9; Mon, 13 Feb 2023 15:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pRfUO-0004Nz-RL; Mon, 13 Feb 2023 15:31:52 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pRfUL-0002UH-LP; Mon, 13 Feb 2023 15:31:51 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7853220193;
 Mon, 13 Feb 2023 20:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676320307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vmu/tZEOvDxJsSgDXhKLFroXqmMIraIq6twXvpPip20=;
 b=1BGn45h4uK6sn5zqg9iLZFishd9mGQF6E/luDlOM/fRbX6mIEi0MTqvl8gCXcWka9dsNjh
 O4rHW5xp3TkcWes/BmUAVf6X51X+SqL8FEbhM249ioPsUr+WP2RIX57oLZQnu3KyuMFqiA
 zTjlY2m2M+v05vzC4kN8JYWE8eojLQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676320307;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vmu/tZEOvDxJsSgDXhKLFroXqmMIraIq6twXvpPip20=;
 b=E/vUcfJmrwqS+BlbMKHfAb2Viv/+2UNM0fHA/8rujxSQuxFOLuBw8fXlahU9sEkoruEfs8
 pLHbTiDC383J5lBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E1751391B;
 Mon, 13 Feb 2023 20:31:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EMMVDTCe6mOVMwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:31:44 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RESEND v5 04/28] target/arm: Move PC alignment check
Date: Mon, 13 Feb 2023 17:29:03 -0300
Message-Id: <20230213202927.28992-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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

Move this earlier to make the next patch diff cleaner. While here
update the comment slightly to not give the impression that the
misalignment affects only TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/machine.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 5f26152652..b4c3850570 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -839,6 +839,15 @@ static int cpu_post_load(void *opaque, int version_id)
         }
     }
 
+    /*
+     * Misaligned thumb pc is architecturally impossible. Fail the
+     * incoming migration. For TCG it would trigger the assert in
+     * thumb_tr_translate_insn().
+     */
+    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
+        return -1;
+    }
+
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
@@ -856,15 +865,6 @@ static int cpu_post_load(void *opaque, int version_id)
         }
     }
 
-    /*
-     * Misaligned thumb pc is architecturally impossible.
-     * We have an assert in thumb_tr_translate_insn to verify this.
-     * Fail an incoming migrate to avoid this assert.
-     */
-    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
-        return -1;
-    }
-
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
-- 
2.35.3


