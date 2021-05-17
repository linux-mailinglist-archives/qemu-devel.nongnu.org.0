Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4AA383CB0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:50:36 +0200 (CEST)
Received: from localhost ([::1]:38052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiK2-0005Ri-IO
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlp-0006mJ-FK
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:20 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:56203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlU-0004X5-Pp
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:13 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mae7u-1lB1da1mSA-00c6Ad; Mon, 17
 May 2021 20:14:48 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 42/59] linux-user/s390x: Set psw.mask properly for the signal
 handler
Date: Mon, 17 May 2021 20:14:07 +0200
Message-Id: <20210517181424.8093-43-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6IReWl6JAyMjJRItCT4ijpOILZtyJ3e0QPHpZzCTjbWFLidergE
 h0D1eyxXY+XpiQ6UwzDfNsE6AXrg3KwHUnOm0XOhZRojJ8ORMFUS8gLisJyyPppzQd9Eo+H
 ONOJ7GEUTBdP9dPtJrnF5/sxO7QECh9zSKyAX1KaUZsKWNdITjTM9UJsalYdZcukWYyW4X4
 HzNFYIkj8YsnCDlhxDcMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nz8jY8gIjaY=:dyfC39603CeHXYPBDuV4f3
 IAqooIdVrdebahoIfqpuISue3xBpShd/jDZJIqpjaVeFryr1otlQ0DVxpIqIfAA0lOoyJ+M0F
 /WVCmMExdElsYXmXG4eXn0wRd/Ey4DFja6mtBecsrVcQzGouZQ7ser0z8fgD/0aWTGJ2VGC+F
 EjqLKflvatcXForpFV/0Zdq5CqU6NCSutqyKzQynLlTG3RLBgitlUHmOANxWrH+Cq27aj5OtZ
 O3WD3XaPqW19L5KcPfNG3eqOchbpTqQRQHuPB4U9sSzBLddxAqEfKq3oY+b5SK/t3CuMqkk84
 APhVUVeZolhB9UHNmJQ0fsaxsGjz3zdsp7+imSTHnsEG+jFUbZ4jocNUe8HPKJtTKFqCCvmGr
 aGDpS09Gvw+BwS9FgBvkCGxTBMWJxKiPEpvgGnvebDZ6ldnYfOCDaf5aFZ4IvlToLFkVjvGrU
 5baUo5uA7Ag/LaJyNx21TQxiwFMHtf9HnBCwAK5UnzrsOipZw8DOfOt4P8VRfLMijKSQ+RaZ6
 mn859adSt3pqxxCm4UGYvg=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Note that PSW_ADDR_{64,32} are called PSW_MASK_{EA,BA}
in the kernel source.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-11-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 64a9eab09770..17f617c65581 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -162,6 +162,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
+    /* Force default amode and default user address space control. */
+    env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
+                  | (env->psw.mask & ~PSW_MASK_ASC);
     env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig; //map_signal(sig);
@@ -215,6 +218,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
+    /* Force default amode and default user address space control. */
+    env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
+                  | (env->psw.mask & ~PSW_MASK_ASC);
     env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig; //map_signal(sig);
-- 
2.31.1


