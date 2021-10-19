Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB0D433D75
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:28:28 +0200 (CEST)
Received: from localhost ([::1]:41100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsuZ-0007kD-Lx
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEt-00008e-Pl
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:23 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:34536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEl-0000Io-DI
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:23 -0400
Received: by mail-il1-x132.google.com with SMTP id g2so19089248ild.1
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qhGZ41nOlvsySd2XyLCyulTBUhHoEjSzSjYsF8X0b4I=;
 b=BXXaiuZAdQ7m1ifomxu1G7S3+MWfyEKqI4Ltq54yjgCRw0gR92KrX8RFIzw5Q4tHiC
 a055TTvMy25DSVUHrfM7sndHN1pEOSIetNfMn6UfxL0IO8si9DRqjLGccxr/8J+YNp7R
 qM9hOsI/KLK4zT+Q+QdTc5YAHl7sdh8SkvrFNSpLaC3bP4QAQ77AqXkCuid0++A/R3lL
 nGV0uCpDxJmVWSLODZYykiOTFolQkEaQddOGZWcKenBSePj4bSm3DIuV2+u905Mz8rr5
 2D3fz2ZUsJQd0Pc9dsGx5SpLEFNhMeT0gpQR887/DPWOxzD0V5PJHx+P35Q8fm1Ks6sD
 ZAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qhGZ41nOlvsySd2XyLCyulTBUhHoEjSzSjYsF8X0b4I=;
 b=hwBpY5y48gLnfQ7R+Sf2V9Gfkh2ixhdzk8t3FhU3DHDTEppPtW4ogezxVeQIx3kQzn
 aMER6c1+z0bTlKvxau+TYWd1ujTRqYTPt9mhGslZvHqIN/DDrApX4EApPJKlIyXHoWv5
 ubPrByeKQ68DrKODIY+kN3vQUCgow0tZC5tPkQiCTWIAtXzuHas/27tOy/cEsDwBrCbv
 FsPCQe2Yka+ur9azeLZHgAea0+0mE1RvLWb8+83TckHPUweMpz9L/M3TLt0nI//eevxT
 nopKGc2AGGmlIyQxp7zs2QG61kzAibo3ZhP8tINdVRiLrl3DFe78Vn9pdsGTTODA3/I2
 +E/g==
X-Gm-Message-State: AOAM533Ozl8AOApDw31xrBmnwjmk03pGc0c7tzKUIMQO1PYT0A/2Y51R
 2Vym6ikb9Yo2VrQgLxhYOHdEFO/38PQ=
X-Google-Smtp-Source: ABdhPJz4UWipIdRt6PxNOTDwOfwrk7eJnwwK6a86IUFB6i6ic7JCZev5vDJ5PI8nXS8Gii4cXd92uw==
X-Received: by 2002:a92:da91:: with SMTP id u17mr3680522iln.242.1634661913850; 
 Tue, 19 Oct 2021 09:45:13 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:13 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/24] bsd-user/arm/target_arch_cpu.h: Implment trivial EXCP
 exceptions
Date: Tue, 19 Oct 2021 10:44:30 -0600
Message-Id: <20211019164447.16359-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Klye Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implent EXCP_UDEF, EXCP_DEBUG, EXCP_INTERRUPT, EXCP_ATOMIC and
EXCP_YIELD. The first two generate a signal to the emulated
binary. EXCP_ATOMIC handles atomic operations. The remainder are fancy
nops.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 94c9109c3f..f22384676a 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -47,6 +47,34 @@ static inline void target_cpu_loop(CPUARMState *env)
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
         switch (trapnr) {
+        case EXCP_UDEF:
+            {
+                /* See arm/arm/undefined.c undefinedinstruction(); */
+                info.si_addr = env->regs[15];
+                info.si_signo = TARGET_SIGILL;
+                info.si_errno = 0;
+                info.si_code = TARGET_ILL_ILLADR;
+                queue_signal(env, info.si_signo, &info);
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
2.32.0


