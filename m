Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1D9383CAF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:50:29 +0200 (CEST)
Received: from localhost ([::1]:37416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiJw-00050p-Hs
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihm2-0006xk-VA
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:27 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:54695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlZ-0004XQ-Ci
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:26 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N6sON-1lPceM1XlX-018NzS; Mon, 17
 May 2021 20:14:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 44/59] linux-user/s390x: Fix frame_addr corruption in
 setup_frame
Date: Mon, 17 May 2021 20:14:09 +0200
Message-Id: <20210517181424.8093-45-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Bk/5lLQcvI2rN1VGUSy0LzFRnNRhVVNQeIJBDL16y+2uQuiqkKK
 LDLmwrt3bL+pSVkPWy4kPyLcfF2qvQQK6AmfuSllpf6NQsjpqVwIAzO2u7LcKMH1WNG+cX6
 5qQLao4JUwHp6LWEKsoUv8IgLXG/I2KvwsF4QZ9R/AIQKlobwdZHzvAb4wRFrfUnJSprnwg
 eCWtVyetK9fPq/y3HgxRg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oNaPiNjitJg=:As/06V9raLMf0hfhaF+uXs
 RFJhk5cubCF9qMAgJrZscYu04Ve+kEozKFVVKG8+1Ib4pNVy3uL1SwDeESahXmmkQGk/AChi3
 wHDK0J4RrNDR1JUWTYMQmPa16eQrH0zwIKF5nTleAJJFwtf6HzsTmbxhCEyjqw4Rpq30c4/eA
 kKmqaM8v3LvirhwiwCiIPyqJBp0xCpBQ3Ja+FRDlxFTBn1Q6yFHTMZvHCQzJCihoL/gFSsafc
 r7LgtRk05he+/kmT5v4ruwzCOmsMrja3r0zmlh5c5PNSSZ+gyn7TtxrU6yAftGwZy5wGeWrq3
 W0fxcJ8k6ABji9BE5QRATGoOUMPpMLF51HT3NtY3FMmYR3dHWVQw+8IA9LGHrshjDp3PsTLxX
 m8fXbyaSCkAb05a+q134GvKqc7mYvgwSzpZsaxJFVT0aYd6+Heeqcit6kGF1UPo71dDxHsFFW
 +yM/POB43CatufFvvnnIZJBXMQqFwNFjv3Luj3YSN4PstPiU+YYFJKeELYYqodJPwB+XqXAHh
 Tl/mzwwVxmx+WM5wteoNqc=
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

The original value of frame_addr is still required for
its use in the call to unlock_user_struct below.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-13-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index bc41b01c5deb..81ba59b46af5 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -168,7 +168,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig;
-    env->regs[3] = frame_addr += offsetof(typeof(*frame), sc);
+    env->regs[3] = frame_addr + offsetof(typeof(*frame), sc);
 
     /*
      * We forgot to include these in the sigcontext.
-- 
2.31.1


