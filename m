Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253A8443956
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:07:15 +0100 (CET)
Received: from localhost ([::1]:57190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2s6-0001Xp-9J
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2er-0006jB-0R
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:33 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:37595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2em-0002mm-H2
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:32 -0400
Received: by mail-il1-x12c.google.com with SMTP id h23so665133ila.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64miHBZXEKxjl3fY4eYDmzdZPEyQwCOLyDx85z6jOa4=;
 b=wZvNGPtrHXL41JzlEF/N2q7voQQQRwp4E8byefibDwXxAaojQW+VwDTTsggob1Uq+W
 bT2YczEYSDgjKQ0dmU5FpVrDleDlqpYeOBnX8suUMLKhUX1mTRUj5arlvkV/B1sewRZ7
 zga92A0ASHYJQa592NnKBEkP4eOYF5CDOhLcZ6ZXP1hZZiHGXsj+YC/cp+jX1QUTN1MQ
 pCSFDsK34ws5AtnSzGQfY26hdW0d7hkvjimki/kXNnzeZou9G5BythNuajqqFhRplJvX
 iRulTPv6+eHWE/3DOto3VTdGK7OflfafcYwsPH9hGeGMRr1PbtjYDtztFdAD7Y0GVGGJ
 usUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64miHBZXEKxjl3fY4eYDmzdZPEyQwCOLyDx85z6jOa4=;
 b=voiLv02u5k6r/JMeUu+CCAWZZsz61g46XanGs75DJNdqJW1n0bO5g79/YDieGKf+yJ
 EWYXEar7EuyX0/f5ouCF22EHZsJOOwEUsJjP+gzTJmLxVGpcdY6ti038+ElR+Ul9YK1w
 9vSCSa70e2R4Ju9Iy7Ds73UPuAFSAdPoVvs/e5b5KQ4DxUOJ82OJb2PUWsrvVZ2CiPjD
 EM4uI7MGTY85o0ll/IuQJQsXy8DnLi/v5tC+3Am6nVc/NgHUA0YSqsFvOPSbD3ARrqhY
 JnCCTSunqpeHfOqQNDITVIfKG9MyyBCnMKYAUxn0n+vXte7M84ZfLo6KCSKoUUBEGCa/
 uW0w==
X-Gm-Message-State: AOAM531CeldXlbqp8y4wAKMrwmLwqzlW6LHnluT+yfxP6LgB0+r3NHIp
 yDx1eiq7Efhka7WpXr5CjuY0kGomWYcjHA==
X-Google-Smtp-Source: ABdhPJyy6kgZPBHvGvQPHE1k2JzNf2lT/uikBkaA7cMbtL7vl0dDJAusKOihtACdK1q03116XLZdVQ==
X-Received: by 2002:a05:6e02:219a:: with SMTP id
 j26mr20361074ila.287.1635893607332; 
 Tue, 02 Nov 2021 15:53:27 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/30] bsd-user/arm/target_arch_cpu.h: Implement trivial
 EXCP exceptions
Date: Tue,  2 Nov 2021 16:52:26 -0600
Message-Id: <20211102225248.52999-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Warner Losh <imp@bsdimp.com>
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
 bsd-user/arm/target_arch_cpu.h | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 2484bdc2f7..609b78b4e2 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -48,6 +48,64 @@ static inline void target_cpu_loop(CPUARMState *env)
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
         switch (trapnr) {
+        case EXCP_UDEF:
+            {
+                /* See arm/arm/undefined.c undefinedinstruction(); */
+                info.si_addr = env->regs[15];
+
+                /*
+                 * Make sure the PC is correctly aligned. (It should
+                 * be.)
+                 */
+                if ((info.si_addr & 3) != 0) {
+                    info.si_signo = TARGET_SIGILL;
+                    info.si_errno = 0;
+                    info.si_code = TARGET_ILL_ILLADR;
+                    queue_signal(env, info.si_signo, &info);
+                } else {
+                    int rc = 0;
+#ifdef NOT_YET
+                    uint32_t opcode;
+
+                    /*
+                     * Get the opcode.
+                     *
+                     * FIXME - what to do if get_user() fails?
+                     */
+                    get_user_u32(opcode, env->regs[15]);
+
+                    /* Check the opcode with CP handlers we may have. */
+                    rc = EmulateAll(opcode, &ts->fpa, env);
+#endif /* NOT_YET */
+                    if (rc == 0) {
+                        /* illegal instruction */
+                        info.si_signo = TARGET_SIGILL;
+                        info.si_errno = 0;
+                        info.si_code = TARGET_ILL_ILLOPC;
+                        queue_signal(env, info.si_signo, &info);
+                    }
+                }
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


