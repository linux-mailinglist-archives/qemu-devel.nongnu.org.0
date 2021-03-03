Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010832BC7A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:04:11 +0100 (CET)
Received: from localhost ([::1]:51540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZbG-00024d-Gg
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZN0-0006jB-36; Wed, 03 Mar 2021 16:49:27 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMy-0002du-6b; Wed, 03 Mar 2021 16:49:25 -0500
Received: by mail-wr1-x435.google.com with SMTP id l12so25366563wry.2;
 Wed, 03 Mar 2021 13:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EiAs45/8RrC9+ORKHg3D6zi8PaaattSX1vXVK8lwp1c=;
 b=ufEWTYp3p7tj6hEz3k8BTBwooYiH8JE2gOPjzdAVZBAQxBy49PqvCSMtwHVUvmH9tO
 OF58jteoXSWCt2xb2zqnQgvagPNAI+6QYEg4hgQ43fTnaIOMTMeddrbjhL6ikmFZUfVj
 s3Ed31LBPh6fVAo1A4RqjaOvcjWhcW3DfVsXsa93SI+qM4H2BwjHwQuykHklyqvjqbSy
 BWcN/B40cP0uVpQjX7xyktAmzuYFO4hGvSI5E8uFSdzKUL+gRdpsV3P43lpD+QrAzHed
 pU1E+US1ZSbayHmCTI1+Ig7SAXB5TymhMtHeYnZMKVq2OLycCtcWtbItm9Qx+oYUso+N
 GVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EiAs45/8RrC9+ORKHg3D6zi8PaaattSX1vXVK8lwp1c=;
 b=atp7m6370D6aTfuZRXbPXiY1k9oYaNI3oHwHYaQJpU/mXpA1oltgZK/HgLJ+nESAS3
 ZnUvLHW64/mdpCD/AZuSkAXYIrEjKdS5qkdozCWYUy+CMXgloL8jzZQvlZZRvhbKR87z
 Pe3TmfBNbckjkBAAjHZirXccXc4f9EXqayoml8IK/ZmXH0G18HutJZF3RBUOXnZaET9y
 yqXTFVldeNas6IRQLofVIYwe+puG3W5yjqVBbKZFDccAJZ724z4jG9wlVclRR942X407
 Nf5GqKyTQsqLDgzRyR+kqiLvAapWNmSTN4txLdHMK3xNLfkGErP/q0r6eFC/3HH5k09g
 KU1Q==
X-Gm-Message-State: AOAM531uYEznIbfx1J0AikML1znHIr4Wcd+ge+LOqBGC17bQhrrVbPuT
 MYYk4ZHOHf8vmSbqnFsB5qawLLn07To=
X-Google-Smtp-Source: ABdhPJzuZWFGh3IGPE603zM6dkg+gEydT+i8E3xcrTonUKvbAsPed0eKEbxmkeJkLgl19/unaDBZEg==
X-Received: by 2002:a05:6000:191:: with SMTP id
 p17mr813048wrx.154.1614808161082; 
 Wed, 03 Mar 2021 13:49:21 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r7sm33806893wre.25.2021.03.03.13.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:49:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/28] target/xtensa: Restrict watchpoint code to system
 emulation
Date: Wed,  3 Mar 2021 22:47:04 +0100
Message-Id: <20210303214708.1727801-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can not use watchpoints in user-mode emulation because we
need the softmmu slow path to detect accesses to watchpointed
memory. Add #ifdef'ry around it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index eeffee297d1..85e466b37d2 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -201,6 +201,7 @@ void xtensa_register_core(XtensaConfigList *node)
     g_free((gpointer)type.name);
 }
 
+#ifndef CONFIG_USER_ONLY
 static uint32_t check_hw_breakpoints(CPUXtensaState *env)
 {
     unsigned i;
@@ -213,9 +214,11 @@ static uint32_t check_hw_breakpoints(CPUXtensaState *env)
     }
     return 0;
 }
+#endif
 
 void xtensa_breakpoint_handler(CPUState *cs)
 {
+#ifndef CONFIG_USER_ONLY
     XtensaCPU *cpu = XTENSA_CPU(cs);
     CPUXtensaState *env = &cpu->env;
 
@@ -231,6 +234,7 @@ void xtensa_breakpoint_handler(CPUState *cs)
             cpu_loop_exit_noexc(cs);
         }
     }
+#endif
 }
 
 void xtensa_cpu_list(void)
-- 
2.26.2


