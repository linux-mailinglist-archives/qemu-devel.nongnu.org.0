Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE7445496
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:12:12 +0100 (CET)
Received: from localhost ([::1]:37298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midTP-0007i0-6C
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNi-0006b6-04
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:18 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:34773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNf-0000yF-81
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:17 -0400
Received: by mail-il1-x12f.google.com with SMTP id j28so6281589ila.1
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i9XvF7HXxjrpqRTzWnEQTmzEf/yIzl4lvBJGSRF9a2k=;
 b=Lu1iIDIljTEC69tG8KRIa5aId1GLbYuXFnCXfiSVmEEiuJ19C47s05qO4Fnpmnrn2i
 j5Djnm65rtaKuabDAPRZC+Eyhv02ePzDxIqA9XVpaDzIxmupYFhWgJSJZ1Sw3P3RarJO
 NBrcCvBqD5HrboZKovGjml/MPBE0wtP8/68s6sZEGVV24GO7MeRym+e/kpOu9Znedwzd
 I/49uc8HAJNphBFMMb+0itIFKski1GsDuCGYkApGPbvVh2CEcmhGV8ymU6sbeuEXS8ls
 K6weyC5nWxj2Que2/KpX3ENlMVHkuNEDhsmnJgghvdJI1Q2J6Ej5VeT6rcTA44Arhbcd
 ORig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i9XvF7HXxjrpqRTzWnEQTmzEf/yIzl4lvBJGSRF9a2k=;
 b=MxoZ0Mlh48jqlYeWybQ7BmBqAG7aHE4opo/1/Yw+PqDP+4jneGiVUj2eRHPYGRo3wY
 A2STomAOdjijtWxhTmF6WADtxZxodi8cVjBt0OiNrgM7m6L5CoR2Dy4OUXy9iCow0PhX
 HL1rISIUvvQcIQsCEwedD8AE0uMj8XKQawUuYR5S16d+pi02QdTQrTdJBBNCqUv5Ykeo
 2+P7CqBdJRqGgjAmvzcfemHMGLkFfDdNhm6X5EduYsFoMeev9y79XC4kFVMY783GdQSP
 v6IFER6YAK5tsOh77O7SnXlTtW+05QXTP17Zu+L/mImUReU292MYwAbggA9j6onNNvdm
 g40g==
X-Gm-Message-State: AOAM533CgIRa3u9zK/Nuv+h5YF5uu25FFKEGsrG1rb7X6YJfSLFOCmEf
 6eZreX4CN4C9pNIL/l72uWbG4+Mo6R8J5Q==
X-Google-Smtp-Source: ABdhPJxT0yyBdgTUZQ0vt3+bHV6Tbdl1xvLHRl6lRRAa6QaDU7UavBfmLicwPEmOSRC1O8CoZH7OVA==
X-Received: by 2002:a05:6e02:1749:: with SMTP id
 y9mr29413143ill.232.1636034773930; 
 Thu, 04 Nov 2021 07:06:13 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:13 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/29] bsd-user/arm/target_arch_cpu.h: Implement trivial
 EXCP exceptions
Date: Thu,  4 Nov 2021 08:05:14 -0600
Message-Id: <20211104140536.42573-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement EXCP_UDEF, EXCP_DEBUG, EXCP_INTERRUPT, EXCP_ATOMIC and
EXCP_YIELD. The first two generate a signal to the emulated
binary. EXCP_ATOMIC handles atomic operations. The remainder are fancy
nops.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 2484bdc2f7..9f9b380b13 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -48,6 +48,39 @@ static inline void target_cpu_loop(CPUARMState *env)
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
         switch (trapnr) {
+        case EXCP_UDEF:
+            {
+                /* See arm/arm/undefined.c undefinedinstruction(); */
+                info.si_addr = env->regs[15];
+
+                /* illegal instruction */
+                info.si_signo = TARGET_SIGILL;
+                info.si_errno = 0;
+                info.si_code = TARGET_ILL_ILLOPC;
+                queue_signal(env, info.si_signo, &info);
+
+                /* TODO: What about instruction emulation? */
+            }
+            break;
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
+        case EXCP_DEBUG:
+            {
+
+                info.si_signo = TARGET_SIGTRAP;
+                info.si_errno = 0;
+                info.si_code = TARGET_TRAP_BRKPT;
+                info.si_addr = env->exception.vaddress;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+        case EXCP_ATOMIC:
+            cpu_exec_step_atomic(cs);
+            break;
+        case EXCP_YIELD:
+            /* nothing to do here for user-mode, just resume guest code */
+            break;
         default:
             fprintf(stderr, "qemu: unhandled CPU exception 0x%x - aborting\n",
                     trapnr);
-- 
2.33.0


