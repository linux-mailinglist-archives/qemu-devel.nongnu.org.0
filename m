Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8153AE7EB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:10:02 +0200 (CEST)
Received: from localhost ([::1]:55904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHoX-0006M5-EN
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjc-0002vF-0r
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:56 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:36345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjZ-0003y9-Tg
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:55 -0400
Received: from quad ([82.142.1.74]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mw9Dg-1l5f5I3MEW-00s3SL; Mon, 21
 Jun 2021 13:04:48 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] linux-user: Let sigaction query SIGKILL/SIGSTOP
Date: Mon, 21 Jun 2021 13:04:41 +0200
Message-Id: <20210621110445.231771-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621110445.231771-1-laurent@vivier.eu>
References: <20210621110445.231771-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:a/qRH9VHOLe+DUys414DsBiHRDBzjFxCFYoDg9LK6bo9+4I6XI7
 fUNdk988LaN2eMJnL5/xvCCAfNT2oLz3Dt4oIi5WxVzzpBk7kSpqCfbRacxuUzjXOrcuJ/m
 QZwB+GIy2VUp5dR5YxRIRpxVKDiN0srD4mawh6uYjja/4R30iss6jGX+eyFcbcfDYsbVclY
 Ua7OdNLUKwNL04WfkIcPQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gZ+0T8e5t7g=:7pWRNYVLzLblI/DJcv81qs
 obCW6hv/i7VZpZTm4sHyAzgcqcLmsjhbzrwSGB5tXeWmKtaRXqIEawFuCHZWm5Ug5AjMPphmp
 2r9oVzx2pUgNVosPpsAVT4AzOPWuWqzz+cJs02QZv16tTJt4Qtj/TO5BF0BnZD70uKpvH2KZP
 mHjuzILLdCB82Twl9NFoou2yR+gWGg7ULtl3mgs/QnmKmWU3AN890wKUTSGv641k/6+ta6ZNt
 v+2+cFSGLw23yl3y4ghOJOuB374BDXp0ihbITsLoYdjVaR11pr09D/z4BBSMS3pZ4nqThIqXk
 w2t2SfK5VzB9dmntJL0nFPGKuMtHdFCcROWjTp8DFdTfPY8RprrmC6jtmY5htiZqtqyxFcD0H
 9uvEKVSoRySh1KCL+BM9QjZpp7Fz9MVER582/lmeoydA8z2AECKbx1i2C6pTdop8UI75K5zjJ
 Pu8HrRo2eMnlwJuA+ROTDMQ5giUpxMYYV+YUu2ggO9TJQ0T5JwchwcpnakS9ZvAokExFkji6j
 vEg5YDfqMCxcixhXigx+jQ=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

The kernel allows doing this, so let's allow this in qemu as well.
Valgrind relies on this.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210601145600.3131040-2-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/signal.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 0f19c59deee9..a8faea6f0909 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -853,7 +853,11 @@ int do_sigaction(int sig, const struct target_sigaction *act,
 
     trace_signal_do_sigaction_guest(sig, TARGET_NSIG);
 
-    if (sig < 1 || sig > TARGET_NSIG || sig == TARGET_SIGKILL || sig == TARGET_SIGSTOP) {
+    if (sig < 1 || sig > TARGET_NSIG) {
+        return -TARGET_EINVAL;
+    }
+
+    if (act && (sig == TARGET_SIGKILL || sig == TARGET_SIGSTOP)) {
         return -TARGET_EINVAL;
     }
 
-- 
2.31.1


