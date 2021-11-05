Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEC0445ED9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:48:53 +0100 (CET)
Received: from localhost ([::1]:35022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miqDj-0008PZ-Ui
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplw-0004RK-8D
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:08 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:44626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplt-00048x-PR
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:07 -0400
Received: by mail-il1-x134.google.com with SMTP id h2so8198848ili.11
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=unoUheHOiBFwRIZBJ0G39ayIeTidxh9oy5cQLMJnocc=;
 b=FZHA2ydaGrPN3uvp9MS4CP459nkzM7FyZfrZxd8J5kMBFFaM8q+y3K4yNf4bzG11pa
 sq7AGdfLWFqb3VVzIlp1EQkQpt+u4nCdP0WNnjaUBEwksXQ22mfhALvfnGepbPFN8s9J
 Gguf5S3RyeKhy3pGzTmEFr4J25Pdn3MDYIRQQ2niDorjJ2ihb2RiDbn/+V4JpjoiF130
 im4cb1yWGhhsZvZ7bACW9OZL+Kc/7c6KHofgnKakFd2xdpQ2c1VGRMzncSLZssH71Fg3
 5TIHFx/XHZLaqUsap5PxUelJB8af7thQNbiNeUAjP3iBcTQGpzrO/CKqLIaKp2gompUD
 9/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=unoUheHOiBFwRIZBJ0G39ayIeTidxh9oy5cQLMJnocc=;
 b=gP/wpm8jFb30/fnQ1LKhirjX3vhTH4gAfcZXcP6FZ9NUJHNMo/BTXXOEBRbNPp4Fp5
 DuX/cAP5n2NjB9IAUB18GRIklvOqVlsgPIf5Qif6O9q+2P8Ooy4HpSCXGFssV2uKBdUR
 QGEXknVUTENw6bcSWxFv+P2pRM8R2yUvTUcwt9uUx5/HW24Teu1/eJkGrGkVrVvJ9u2I
 sQdnQ5cliVZaTSTwTGBPiXsqW6a5AZnvaPCIU5NzEX2ycM7DNcsWw+D+7Bo+6roR5cNs
 TtncDIFcWRVfiq8VAuCclAtGMdxBEbadbh4pWCmu/+9Ns5qCTyzcOXRgSAiPKaX5pMEn
 YAfQ==
X-Gm-Message-State: AOAM533bycXtjldL8yUPyEDAv9AFej8rozDUdLiNdEWQvtsOsnnr9Xps
 YI4FJwoDmrXFFe/TY3vV+CmaqlOSyOfsLA==
X-Google-Smtp-Source: ABdhPJzUBkl5yF0iSOArViaO+vDlCr3FUAiBch59YqVTaaw3Q5LMZUzIMuTFrXu7shtaWgWMJuP0EA==
X-Received: by 2002:a05:6e02:1a21:: with SMTP id
 g1mr10569735ile.153.1636082404650; 
 Thu, 04 Nov 2021 20:20:04 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:04 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/36] bsd-user/arm/target_arch_cpu.h: Implement trivial
 EXCP exceptions
Date: Thu,  4 Nov 2021 21:18:59 -0600
Message-Id: <20211105031917.87837-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Kyle Evans <kevans@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


