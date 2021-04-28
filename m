Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A557B36DFE6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:49:55 +0200 (CEST)
Received: from localhost ([::1]:55696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqC2-0003lk-MO
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwy-0005vc-FQ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:26 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:34759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwt-0004dh-PE
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:19 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso3652968pje.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VEYCuDHkcV/lHpGQXOvQlgAwlC6Cxm9+fq9gwubDK9c=;
 b=cUAg8UYhUdhvrmG7jC0kKW5w6chVGCENRnYXT+yO8Cc0V+VNwBjTTtPIFPgBHO7MjI
 nV+dt8Nk2miTBTLKuI7PIs2opjf4AyV/cjYiETVx3ADgXPZQauHNAFXwVPsYqLUtHaj2
 HLdUmhgdIMvJnOhz/Ury6STEBkkaPpsuvnQxXmZvsMA9/zLSPNI8u89ahGUwV29JlF4I
 IwqwV67cZ1vhtK8jmq143I069qKLEO3Q0h+L1QaZmz+EgX3RXId137bh2tGzzkZ6S+IY
 F2sQKMmmyv8Ue3WVhTXTGbWEkV7uFPBikIpSzg8XYCCvLbpq+K1M1eGKsJkuPGbgC44E
 c/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VEYCuDHkcV/lHpGQXOvQlgAwlC6Cxm9+fq9gwubDK9c=;
 b=ASr1QvRxI62/5l28Upn6DI5IuQtmhID/qMg7Y1U2qCGyUON9/+JNnmjjcZd8Wntp8x
 zBYdi7k5D/iSKDJIV7ysg7t4sebeWUy3Wu5ozkJUXJyjE0MPlRzXDUxAYw20VgQtG+l1
 qlaHfUsR18fJqeKimmAqlviRFsijXd1ZRMisWN6iiHdTj+LCGKgh+6zAr/c1RsaG0A/D
 MM1Ii2WeprASlhdlpbeehV77YxKKXQaRgKyogChDnh05R9tnp8veJC78mTf+HyenYza+
 UaHk/FTbKlR/YEGY7EAM73ZrgZq7OI8NRcv4zQldxJ7+OpvdkLBeiecQ864Lm3KXN17o
 QUEQ==
X-Gm-Message-State: AOAM5305w9H3cU1tNiEnkI6aQZgPwrobFNJOYRKkVDvJzgA20G+DBOki
 mpPcqMibhxSinxDrlXgs9zmN+STF5oxjBg==
X-Google-Smtp-Source: ABdhPJzkSgibthsfzLMbRbzL4y+GBDTPZUoOcAkezT3Egadh6sGsfb2D99waonRq7z3mSEzYsuu8pA==
X-Received: by 2002:a17:90a:f195:: with SMTP id
 bv21mr5591852pjb.56.1619638454370; 
 Wed, 28 Apr 2021 12:34:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/15] linux-user/s390x: Tidy save_sigregs
Date: Wed, 28 Apr 2021 12:34:01 -0700
Message-Id: <20210428193408.233706-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "save" routines copied from the kernel, which are currently
commented out, are unnecessary in qemu.  We can copy from env
where the kernel needs special instructions.  Fix comment style.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 4dde55d4d5..eabfe4293f 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -104,23 +104,25 @@ get_sigframe(struct target_sigaction *ka, CPUS390XState *env, size_t frame_size)
 static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
 {
     int i;
-    //save_access_regs(current->thread.acrs); FIXME
 
-    /* Copy a 'clean' PSW mask to the user to avoid leaking
-       information about whether PER is currently on.  */
+    /*
+     * Copy a 'clean' PSW mask to the user to avoid leaking
+     * information about whether PER is currently on.
+     */
     __put_user(env->psw.mask, &sregs->regs.psw.mask);
     __put_user(env->psw.addr, &sregs->regs.psw.addr);
+
     for (i = 0; i < 16; i++) {
         __put_user(env->regs[i], &sregs->regs.gprs[i]);
     }
     for (i = 0; i < 16; i++) {
         __put_user(env->aregs[i], &sregs->regs.acrs[i]);
     }
+
     /*
      * We have to store the fp registers to current->thread.fp_regs
      * to merge them with the emulated registers.
      */
-    //save_fp_regs(&current->thread.fp_regs); FIXME
     for (i = 0; i < 16; i++) {
         __put_user(*get_freg(env, i), &sregs->fpregs.fprs[i]);
     }
-- 
2.25.1


