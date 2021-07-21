Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C8D3D17BC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:14:15 +0200 (CEST)
Received: from localhost ([::1]:58992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ibe-0003Fh-RG
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOK-0002xw-Pf
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:30 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOF-0005pG-PI
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:27 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so1946840pjo.3
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DTRTI80fORwFOs4KxX5hNUbj/Raa40Oboxi0GCzL6jg=;
 b=HRGQvmYb2ufbGkQNPGQcalNkkVMKGqcVe7qJfMeWegTcJi7pcGrUd5ifY8nXRQ+kM+
 E+3mBDI13njMlKWXGFJcDgRykTDCSk0O4ADn1n+4oKQrt+TBNL5j4Z/+1mcjQeb5vQht
 L6S/5WcibK0aJ4esHcY1HvXToFnX6rp7Ce2paIyA+DFgRPlBu0OMDZ7mfpipE7nKQGek
 K807GdEqDNN6Chq4bDVwpx8oTzQLysMgLFD4etIE5zaPLWqV0yf6WllHPo/BgOJQ9RKH
 /nhzdJ8aQMSSCaDqphc/WI2nRi4Xu50YoDUrxw7b2HtdoPoTN3ahil48rUGAKWYcJl0X
 IJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DTRTI80fORwFOs4KxX5hNUbj/Raa40Oboxi0GCzL6jg=;
 b=jYandqUvoPFm51C4GPbtjkWwV24vq+XGtIA9Y5vzdEbtKDsqLE9GXd0vvkqdkd/Ltu
 g4aBy3LPf0qG5YR+nif8QdOmA+B1DXttIP7Q7HV7HasAaAmKjy7kZLwvmppRkyL3EEXk
 WrY7MCLG9HGWzy9xFn3eshSnjqdag49/g+Vj+VRK2/sov+wm+C1BTpcgauixyAmdi7gm
 B9QIT+ovjT2Q7QGsphpeJQ/5SVqqeaDEn1OuSRw5SUt8XVjwWDx8ouzOAmx4KxN+1hiD
 5wGef81OyuO7s9hZxPqOK+txZtUkMvVcW2bM0AeXTw0+QwaFIgIPpbdUbHINej78NWB0
 lh1Q==
X-Gm-Message-State: AOAM533xkGNC/Qrr6MyZr2yWoFY09l0niR1HYTV7R0lQD5V0wxIYfPmC
 rrHHhCN1VLdDCOOC3f9PonnkneeJEKoYYA==
X-Google-Smtp-Source: ABdhPJwNg1OOk/ATI8p3esO9A+ruM8SmouoFyqqUbOl/7gxS1IgTHhrmhPzN/oQrz4QTLkzIl+CSxw==
X-Received: by 2002:a62:1c14:0:b029:34a:70f5:40da with SMTP id
 c20-20020a621c140000b029034a70f540damr16118993pfc.37.1626897620403; 
 Wed, 21 Jul 2021 13:00:20 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/27] accel/tcg: Use CF_NO_GOTO_{TB,
 PTR} in cpu_exec_step_atomic
Date: Wed, 21 Jul 2021 09:59:44 -1000
Message-Id: <20210721195954.879535-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Request that the one TB returns immediately, so that
we release the exclusive lock as soon as possible.

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210717221851.2124573-7-richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 2206c463f5..5bb099174f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -330,8 +330,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
     CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
     target_ulong cs_base, pc;
-    uint32_t flags;
-    uint32_t cflags = (curr_cflags(cpu) & ~CF_PARALLEL) | 1;
+    uint32_t flags, cflags;
     int tb_exit;
 
     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
@@ -341,8 +340,14 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu->running = true;
 
         cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
-        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
 
+        cflags = curr_cflags(cpu);
+        /* Execute in a serial context. */
+        cflags &= ~CF_PARALLEL;
+        /* After 1 insn, return and release the exclusive lock. */
+        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | 1;
+
+        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
         if (tb == NULL) {
             mmap_lock();
             tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
-- 
2.25.1


