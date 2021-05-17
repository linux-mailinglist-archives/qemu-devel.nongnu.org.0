Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21843822DE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 04:48:23 +0200 (CEST)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liTIs-0005Rw-B6
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 22:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1liTHb-0004bi-IQ; Sun, 16 May 2021 22:47:03 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1liTHZ-0006af-Q2; Sun, 16 May 2021 22:47:03 -0400
Received: by mail-pf1-x436.google.com with SMTP id q2so3934060pfh.13;
 Sun, 16 May 2021 19:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Jk0cKPBs6zBNYJ8PHbQgjtBfcBZqoDnsYAxiX+pq6k=;
 b=OfaY3NjrUoXkoQdGq/FhvAKnyrdLl85wk0uAV0mwBe1NrB8LMgHmohbWEPG9ADsRfH
 5bykQZRiQDrkTA2nPqMs2ZjeiY/hJQGFIHdnERFhKm02nRAPOP+AwPDTia6Yk6ROnbre
 Z6AEoSm2RqoBRSGu/BcOCa0Raxan0+KNx59lcg8DPJ9wz4jKBzgQPZ/s50xf/GmsPzgW
 r0vNfCMZPa8wfBSbKH8b+HQ+snGzCP8+0Zu+kbM2cXGtuphKPkX/OdZu3rmT1dwbitKV
 BZXnQZVfZeX59S4RJ5HOs+rExjGn+o3UfI6sNhkVxE56/nDZGuRY/ptn+xUsyaU72YRP
 VsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Jk0cKPBs6zBNYJ8PHbQgjtBfcBZqoDnsYAxiX+pq6k=;
 b=AG1GEUddldl1It+DlbOhaBui4LSH1vuGDDONbPf1mEDfRJkC0RWY6bAEtIKpmfXSd2
 t2FGLJgIMpGAQEnCcDt1vlsHAh1QX7JHbfceTs0WUjyv2jwEKjDI3DG7RVOjljqrEKFq
 dTlXZzJVKFFDYqhqEkNagpYR9j3SQcJwNS4TxsWmvI6WmfuOFxIXA7cBgI4d5/sJhL/S
 QLNL/8ljpMLECID82cfejOEJshZHqpI9PGivYLmG6dnO7zmCE9f+3klU1q2R/rC56tka
 O4cjl6tH41ZdEe1fD3iPwpjGmSf3uMoRJH3KQwKl0og6+e5JNT9zIAQKRVn9wXTJ0NLc
 yx1w==
X-Gm-Message-State: AOAM532HkMAbqt9rC8XIIvoQBxoRCTsNizaDrKbA+qUTHJQrdoZgBNID
 pqWr9n23JDJRhosvgaZ4FUcvRCmoqVU=
X-Google-Smtp-Source: ABdhPJyZtgXARWAQUMp4EYQpgWJuYdrlAxP7mUUCO9YBPn8tcqy3D1XxZ+Pl/llcVyqV5QHjtQ+12Q==
X-Received: by 2002:a63:dc57:: with SMTP id f23mr57468394pgj.294.1621219619194; 
 Sun, 16 May 2021 19:46:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id
 l6sm8938955pgc.68.2021.05.16.19.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 19:46:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH] target/ppc: Implement ISA v3.1 wait variants
Date: Mon, 17 May 2021 12:46:51 +1000
Message-Id: <20210517024651.2200837-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x436.google.com
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
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ISA v3.1 adds new variations of wait, specified by the WC field. These
are not compatible with the wait 0 implementation, because they add
additional conditions that cause the processor to resume, which can
cause software to hang or run very slowly.

Add the new wait variants with a trivial no-op implementation, which is
allowed, as explained in comments: software must not depend on any
particular architected WC condition having caused resumption of
execution, therefore a no-op implementation is architecturally correct.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Implementing cpu_relax() in Linux with wait 2,0 (pause_short) causes a
hang on boot without this patch.

 target/ppc/translate.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index a6381208a5..80db450cab 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3619,12 +3619,39 @@ static void gen_sync(DisasContext *ctx)
 /* wait */
 static void gen_wait(DisasContext *ctx)
 {
-    TCGv_i32 t0 = tcg_const_i32(1);
-    tcg_gen_st_i32(t0, cpu_env,
-                   -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
-    tcg_temp_free_i32(t0);
-    /* Stop translation, as the CPU is supposed to sleep from now */
-    gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
+    uint32_t wc = (ctx->opcode >> 21) & 3;
+
+    /*
+     * wait 0 waits for an exception to occur.
+     */
+    if (wc == 0) {
+        TCGv_i32 t0 = tcg_const_i32(1);
+        tcg_gen_st_i32(t0, cpu_env,
+                       -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
+        tcg_temp_free_i32(t0);
+        /* Stop translation, as the CPU is supposed to sleep from now */
+        gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
+    }
+
+    /*
+     * Other wait types must not wait until an exception occurs because
+     * ignoring their other wake-up conditions could cause a hang.
+     *
+     * wait 1 (waitrsv) waits for an exception or a reservation to be lost.
+     * This can happen for implementation specific reasons, so it can be
+     * implemented as a no-op.
+     *
+     * wait 2 waits for an exception or an amount of time to pass. This is
+     * implementation specific so it can be implemented as a no-op.
+     *
+     * wait 3 is reserved, so it may be implemented as a no-op.
+     *
+     * ISA v3.1 does allow for execution to resume "in the rare case of
+     * an implementation-dependent event", so in any case software must
+     * not depend on the architected resumption condition to become
+     * true, so no-op implementations are architecturally correct (if
+     * suboptimal).
+     */
 }
 
 #if defined(TARGET_PPC64)
-- 
2.23.0


