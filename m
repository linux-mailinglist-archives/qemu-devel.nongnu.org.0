Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AC548633D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:54:26 +0100 (CET)
Received: from localhost ([::1]:52994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QPZ-0005Bl-7Q
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:54:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDb-0007qc-FC
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:05 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:44273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDS-0004kE-Ob
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:01 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mm9NA-1mev9U3GYy-00iCIx; Thu, 06
 Jan 2022 11:41:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 22/27] linux-user/nios2: Fix sigmask in setup_rt_frame
Date: Thu,  6 Jan 2022 11:41:32 +0100
Message-Id: <20220106104137.732883-23-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JuM+arCOkuDblzDDdPbSmwupkdklfOxrrbLKq8HEAz63N/0VEJS
 uDBGl357/KcVQNgddT5b0WXO+rdyUZZtw4zNgvUI/e6oNskEaALVFEs0aspnuMFFDVhA1cY
 8XyulpOyo/oIp05e1oochfwE1LVgJIwvn88ZzI8GirFT7N2qj3/E5Z4+K1hTMk5+VZKzJhN
 NjVBfHSPz7VrSwTyXO0Kg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yiBBcNyWuDI=:hRj3wpdN8QKgW2ZD6SZAZR
 eB/aG3o62qxX2CtSWAvARo9/THPqhY8f9WQJZsrK2k/RHILqvu5g+wcZBJ4c5yV49emRmzX0f
 uN8qgwx4wMDBv2a7PmsXnis+d01n3zIAbKxq4cLG4w2rLXgz1hSFAXaQUxRFHQmOQsdspILUs
 AkbcrWrQxMsSeTqgx0H6AbNul8LMGfw1bOCL0JwoX6RlUThKqXgNOFAhnkCHX2VkZ4wIBtT5z
 VgaR1E3+mNsUM9NGmQc1ehTw1rcsIDFzSjoroFwC4NWLl8nxK6SEQr00YbpCQQKQtJt9aU/Ix
 EZyYerx/brdLTR6D02QOVJh7mtcua6lePOj14L9Yl8qezWdBJINdfX91BSw8q2mZDo/vHLxAM
 IqL8RbJrLGJMpI4PWKyMBVskHLc5b/fDpJJyV8DqLLt/8UzC6cQPNFppxCXcVVqbAiLDKh0ty
 9Ojwpvw498iXEKPhL/nke4swp6b5otHnPsQuCHG+ODVRRhgG9JCLtHmNuMXWmQPIkD8Mgd9ZS
 ZE1HMTN79SWTDhht2Q27Oguqvmv7MkogZRVvGYOV/D5TLb3o5G3VpHNgGIAlO21e4+jlOviG+
 b14UNTlWIsj3k8tccndaRzTB+bNpS9EjNfBna+4VM6gV0LIMWiEqjRYp2vKJ8/kCmolIq/k+t
 tyzGhVDogqG/NpcNXvIdJs+FlyPgEjstnH7O9jXALONmPmgT/UBGCgPkVJUsax4/LMQU=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Do not cast the signal mask elements; trust __put_user.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221025012.1057923-7-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/nios2/signal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 20b65aa06e08..80e3d42fc965 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -168,8 +168,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     target_save_altstack(&frame->uc.tuc_stack, env);
     rt_setup_ucontext(&frame->uc, env);
     for (i = 0; i < TARGET_NSIG_WORDS; i++) {
-        __put_user((abi_ulong)set->sig[i],
-                   (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
+        __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
     }
 
     /* Set up to return from userspace; jump to fixed address sigreturn
-- 
2.33.1


